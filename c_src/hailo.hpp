#include "hailo/hailort.hpp"
#include <fine.hpp>
#include <map>
#include <memory>
#include <string>
#include <vector>

// Resource type for VDevice
struct VDeviceResource {
  std::shared_ptr<hailort::VDevice> vdevice;
};

struct NetworkGroupResource {
  std::shared_ptr<hailort::ConfiguredNetworkGroup> network_group;
  std::shared_ptr<hailort::VDevice> vdevice; // Keep a reference to vdevice to ensure it lives as long as the network group
};

// Resource type for InferVStreams
struct InferPipelineResource {
  std::shared_ptr<hailort::InferVStreams> pipeline;
  std::shared_ptr<hailort::ConfiguredNetworkGroup> network_group; // Keep a reference to network_group
};

fine::Term fine_error_string(ErlNifEnv *env, const std::string &message) {
  std::tuple<fine::Atom, std::string> tagged_result(fine::Atom("error"),
                                                    message);
  return fine::encode(env, tagged_result);
}

template <typename T> fine::Term fine_ok(ErlNifEnv *env, T value) {
  std::tuple<fine::Atom, T> tagged_result(fine::Atom("ok"), value);
  return fine::encode(env, tagged_result);
}