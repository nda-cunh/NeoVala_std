project(
  'new_posix_mode',
  'vala',
  meson_version : '>= 1.0.0',
  version : '0.1',
)

vapi_dir = meson.current_source_dir() / 'vapi'
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

add_project_arguments('--profile=posix', language : 'vala')
add_project_arguments(['-D', 'SUPRA'], language : 'vala')

########################################
##                Core 
########################################

sources_core = []
subdir('core')

lib_supracore = library(
  'supralib',
  sources_core,
  files('vapi/supra.vapi'),
  dependencies: [
  ],
  install : true,
)

dep_supracore = declare_dependency(
  link_with : lib_supracore,
  include_directories : include_directories('.'),
  sources : files('vapi/supra.vapi'),
)

meson.override_dependency('core', dep_supracore)

########################################
##             Collections 
########################################

sources_collections = []
subdir('collections')


lib_supracollections = library(
  'supracollections',
  sources_collections,
  files('vapi/supra.vapi'),
  dependencies : dep_supracore,
  install : true,
)

dep_supracollections = declare_dependency(
  link_with : lib_supracollections,
  include_directories : include_directories('.'),
  sources : files('vapi/supra.vapi'),
)

meson.override_dependency('collections', dep_supracollections)


dep_suprastd = declare_dependency(
  dependencies : [dep_supracore, dep_supracollections],
)

meson.override_dependency('std', dep_suprastd)



########################################
##             Executable
########################################

if not meson.is_subproject()
  executable(
    'new_posix_mode',
    'main.vala',
    dependencies : [dep_supracore, dep_supracollections],
    install : true,
  )
endif
