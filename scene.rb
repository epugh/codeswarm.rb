require 'cairo'

class Scene

  def initialize(width, height)
    @surface = Cairo::ImageSurface.new(Cairo::Format::RGB24, width, height)
    @out_file = File.new("/tmp/cs_out.bin", "w")
    @cr = Cairo::Context.new(@surface)
    @cr2 = Cairo::Context.new(@surface)
    @count = 0

    @file_nodes = {}
    @person_nodes = {}
    @edges = {}
  end

  def play(grouped_events)
    tags = {}
    tags[1226794204 / $timeblock] = "v0.99"
    tags[1121468952 / $timeblock] = "v0.99.1"
    tags[1122428175 / $timeblock] = "v0.99.2"
    tags[1122934854 / $timeblock] = "v0.99.3"
    tags[1123710239 / $timeblock] = "v0.99.4"
    tags[1124936941 / $timeblock] = "v0.99.5"
    tags[1126134370 / $timeblock] = "v0.99.6"
    tags[1127083576 / $timeblock] = "v0.99.7"
    tags[1127290061 / $timeblock] = "v0.99.7a"
    tags[1127454959 / $timeblock] = "v0.99.7b"
    tags[1127587205 / $timeblock] = "v0.99.7c"
    tags[1127634086 / $timeblock] = "v0.99.7d"
    tags[1128297240 / $timeblock] = "v0.99.8"
    tags[1128382216 / $timeblock] = "v0.99.8a"
    tags[1128552136 / $timeblock] = "v0.99.8b"
    tags[1128910895 / $timeblock] = "v0.99.8c"
    tags[1129425016 / $timeblock] = "v0.99.8d"
    tags[1129611140 / $timeblock] = "v0.99.8e"
    tags[1129714383 / $timeblock] = "v0.99.8f"
    tags[1130058268 / $timeblock] = "v0.99.8g"
    tags[1130621757 / $timeblock] = "v0.99.9"
    tags[1130726157 / $timeblock] = "v0.99.9a"
    tags[1130915010 / $timeblock] = "v0.99.9b"
    tags[1131065027 / $timeblock] = "v0.99.9c"
    tags[1131222641 / $timeblock] = "v0.99.9d"
    tags[1131332294 / $timeblock] = "v0.99.9e"
    tags[1131444835 / $timeblock] = "v0.99.9f"
    tags[1131601984 / $timeblock] = "v0.99.9g"
    tags[1131782263 / $timeblock] = "v0.99.9h"
    tags[1132022519 / $timeblock] = "v0.99.9i"
    tags[1132207680 / $timeblock] = "v0.99.9j"
    tags[1132965579 / $timeblock] = "v0.99.9k"
    tags[1133684401 / $timeblock] = "v0.99.9l"
    tags[1134352888 / $timeblock] = "v0.99.9m"
    tags[1134610407 / $timeblock] = "v0.99.9n"
    tags[1135152060 / $timeblock] = "v1.0.0"
    tags[1135199961 / $timeblock] = "v1.0.0a"
    tags[1135201926 / $timeblock] = "v1.0.0b"
    tags[1137200668 / $timeblock] = "v1.0.10"
    tags[1137394439 / $timeblock] = "v1.0.11"
    tags[1137729725 / $timeblock] = "v1.0.12"
    tags[1138402276 / $timeblock] = "v1.0.13"
    tags[1135304566 / $timeblock] = "v1.0.3"
    tags[1135414096 / $timeblock] = "v1.0.4"
    tags[1135672970 / $timeblock] = "v1.0.5"
    tags[1135735834 / $timeblock] = "v1.0.6"
    tags[1136523576 / $timeblock] = "v1.0.7"
    tags[1136753083 / $timeblock] = "v1.0.8"
    tags[1136938835 / $timeblock] = "v1.0.9"
    tags[1131782298 / $timeblock] = "v1.0rc1"
    tags[1132022550 / $timeblock] = "v1.0rc2"
    tags[1132207713 / $timeblock] = "v1.0rc3"
    tags[1133684477 / $timeblock] = "v1.0rc4"
    tags[1134352926 / $timeblock] = "v1.0rc5"
    tags[1134610445 / $timeblock] = "v1.0rc6"
    tags[1136758961 / $timeblock] = "v1.1.0"
    tags[1136938754 / $timeblock] = "v1.1.1"
    tags[1137200682 / $timeblock] = "v1.1.2"
    tags[1137394387 / $timeblock] = "v1.1.3"
    tags[1137729745 / $timeblock] = "v1.1.4"
    tags[1138402289 / $timeblock] = "v1.1.5"
    tags[1138586137 / $timeblock] = "v1.1.6"
    tags[1139778900 / $timeblock] = "v1.2.0"
    tags[1140061031 / $timeblock] = "v1.2.1"
    tags[1140331975 / $timeblock] = "v1.2.2"
    tags[1140655504 / $timeblock] = "v1.2.3"
    tags[1141261702 / $timeblock] = "v1.2.4"
    tags[1144185295 / $timeblock] = "v1.2.5"
    tags[1144454590 / $timeblock] = "v1.2.6"
    tags[1145391350 / $timeblock] = "v1.3.0"
    tags[1143504540 / $timeblock] = "v1.3.0-rc1"
    tags[1144188678 / $timeblock] = "v1.3.0-rc2"
    tags[1144458386 / $timeblock] = "v1.3.0-rc3"
    tags[1145082166 / $timeblock] = "v1.3.0-rc4"
    tags[1145947150 / $timeblock] = "v1.3.1"
    tags[1146728296 / $timeblock] = "v1.3.2"
    tags[1147742933 / $timeblock] = "v1.3.3"
    tags[1149968617 / $timeblock] = "v1.4.0"
    tags[1149572200 / $timeblock] = "v1.4.0-rc1"
    tags[1149736961 / $timeblock] = "v1.4.0-rc2"
    tags[1151818415 / $timeblock] = "v1.4.1"
    tags[1151003457 / $timeblock] = "v1.4.1-rc1"
    tags[1151562080 / $timeblock] = "v1.4.1-rc2"
    tags[1153791465 / $timeblock] = "v1.4.1.1"
    tags[1155432793 / $timeblock] = "v1.4.2"
    tags[1153124458 / $timeblock] = "v1.4.2-rc1"
    tags[1153864634 / $timeblock] = "v1.4.2-rc2"
    tags[1154650007 / $timeblock] = "v1.4.2-rc3"
    tags[1155168316 / $timeblock] = "v1.4.2-rc4"
    tags[1158138501 / $timeblock] = "v1.4.2.1"
    tags[1159595785 / $timeblock] = "v1.4.2.2"
    tags[1159775239 / $timeblock] = "v1.4.2.3"
    tags[1161059439 / $timeblock] = "v1.4.2.4"
    tags[1161202115 / $timeblock] = "v1.4.3"
    tags[1159697378 / $timeblock] = "v1.4.3-rc1"
    tags[1160454300 / $timeblock] = "v1.4.3-rc2"
    tags[1160876166 / $timeblock] = "v1.4.3-rc3"
    tags[1161398016 / $timeblock] = "v1.4.3.1"
    tags[1161656917 / $timeblock] = "v1.4.3.2"
    tags[1161812758 / $timeblock] = "v1.4.3.3"
    tags[1162716136 / $timeblock] = "v1.4.3.4"
    tags[1163298888 / $timeblock] = "v1.4.3.5"
    tags[1163571127 / $timeblock] = "v1.4.4"
    tags[1162948614 / $timeblock] = "v1.4.4-rc1"
    tags[1163298936 / $timeblock] = "v1.4.4-rc2"
    tags[1164243526 / $timeblock] = "v1.4.4.1"
    tags[1165434683 / $timeblock] = "v1.4.4.2"
    tags[1166642607 / $timeblock] = "v1.4.4.3"
    tags[1168221660 / $timeblock] = "v1.4.4.4"
    tags[1171411200 / $timeblock] = "v1.5.0"
    tags[1167100821 / $timeblock] = "v1.5.0-rc0"
    tags[1168568573 / $timeblock] = "v1.5.0-rc1"
    tags[1169365526 / $timeblock] = "v1.5.0-rc2"
    tags[1170286931 / $timeblock] = "v1.5.0-rc3"
    tags[1170887528 / $timeblock] = "v1.5.0-rc4"
    tags[1171844368 / $timeblock] = "v1.5.0.1"
    tags[1172478381 / $timeblock] = "v1.5.0.2"
    tags[1173057651 / $timeblock] = "v1.5.0.3"
    tags[1173913039 / $timeblock] = "v1.5.0.4"
    tags[1174254256 / $timeblock] = "v1.5.0.5"
    tags[1175120917 / $timeblock] = "v1.5.0.6"
    tags[1175654726 / $timeblock] = "v1.5.0.7"
    tags[1175665662 / $timeblock] = "v1.5.1"
    tags[1174299566 / $timeblock] = "v1.5.1-rc1"
    tags[1174871130 / $timeblock] = "v1.5.1-rc2"
    tags[1175122707 / $timeblock] = "v1.5.1-rc3"
    tags[1176337180 / $timeblock] = "v1.5.1.1"
    tags[1177189050 / $timeblock] = "v1.5.1.2"
    tags[1177979506 / $timeblock] = "v1.5.1.3"
    tags[1178687606 / $timeblock] = "v1.5.1.4"
    tags[1179534136 / $timeblock] = "v1.5.1.5"
    tags[1179645382 / $timeblock] = "v1.5.1.6"
    tags[1179646242 / $timeblock] = "v1.5.2"
    tags[1177309496 / $timeblock] = "v1.5.2-rc0"
    tags[1177979568 / $timeblock] = "v1.5.2-rc1"
    tags[1178438902 / $timeblock] = "v1.5.2-rc2"
    tags[1178835725 / $timeblock] = "v1.5.2-rc3"
    tags[1180825375 / $timeblock] = "v1.5.2.1"
    tags[1181981653 / $timeblock] = "v1.5.2.2"
    tags[1183361772 / $timeblock] = "v1.5.2.3"
    tags[1184266925 / $timeblock] = "v1.5.2.4"
    tags[1187215295 / $timeblock] = "v1.5.2.5"
    tags[1188716400 / $timeblock] = "v1.5.3"
    tags[1183445815 / $timeblock] = "v1.5.3-rc0"
    tags[1184277287 / $timeblock] = "v1.5.3-rc1"
    tags[1184543014 / $timeblock] = "v1.5.3-rc2"
    tags[1185349037 / $timeblock] = "v1.5.3-rc3"
    tags[1186181143 / $timeblock] = "v1.5.3-rc4"
    tags[1187161330 / $timeblock] = "v1.5.3-rc5"
    tags[1187675321 / $timeblock] = "v1.5.3-rc6"
    tags[1188371508 / $timeblock] = "v1.5.3-rc7"
    tags[1188808171 / $timeblock] = "v1.5.3.1"
    tags[1190196732 / $timeblock] = "v1.5.3.2"
    tags[1191107493 / $timeblock] = "v1.5.3.3"
    tags[1191404501 / $timeblock] = "v1.5.3.4"
    tags[1193858420 / $timeblock] = "v1.5.3.5"
    tags[1195423257 / $timeblock] = "v1.5.3.6"
    tags[1196537434 / $timeblock] = "v1.5.3.7"
    tags[1199774517 / $timeblock] = "v1.5.3.8"
    tags[1201921818 / $timeblock] = "v1.5.4"
    tags[1197510598 / $timeblock] = "v1.5.4-rc0"
    tags[1198114975 / $timeblock] = "v1.5.4-rc1"
    tags[1198721851 / $timeblock] = "v1.5.4-rc2"
    tags[1200117136 / $timeblock] = "v1.5.4-rc3"
    tags[1200878304 / $timeblock] = "v1.5.4-rc4"
    tags[1201416514 / $timeblock] = "v1.5.4-rc5"
    tags[1202636694 / $timeblock] = "v1.5.4.1"
    tags[1203236441 / $timeblock] = "v1.5.4.2"
    tags[1203795102 / $timeblock] = "v1.5.4.3"
    tags[1205034641 / $timeblock] = "v1.5.4.4"
    tags[1206675404 / $timeblock] = "v1.5.4.5"
    tags[1214525506 / $timeblock] = "v1.5.4.6"
    tags[1207630676 / $timeblock] = "v1.5.5"
    tags[1205658713 / $timeblock] = "v1.5.5-rc0"
    tags[1206256962 / $timeblock] = "v1.5.5-rc1"
    tags[1206675872 / $timeblock] = "v1.5.5-rc2"
    tags[1207160009 / $timeblock] = "v1.5.5-rc3"
    tags[1208716629 / $timeblock] = "v1.5.5.1"
    tags[1211756911 / $timeblock] = "v1.5.5.2"
    tags[1211952776 / $timeblock] = "v1.5.5.3"
    tags[1212865323 / $timeblock] = "v1.5.5.4"
    tags[1214528402 / $timeblock] = "v1.5.5.5"
    tags[1213819803 / $timeblock] = "v1.5.6"
    tags[1211757736 / $timeblock] = "v1.5.6-rc0"
    tags[1212477657 / $timeblock] = "v1.5.6-rc1"
    tags[1212869151 / $timeblock] = "v1.5.6-rc2"
    tags[1213479599 / $timeblock] = "v1.5.6-rc3"
    tags[1214439243 / $timeblock] = "v1.5.6.1"
    tags[1215160745 / $timeblock] = "v1.5.6.2"
    tags[1215987842 / $timeblock] = "v1.5.6.3"
    tags[1216490293 / $timeblock] = "v1.5.6.4"
    tags[1218055286 / $timeblock] = "v1.5.6.5"
    tags[1218998542 / $timeblock] = "v1.6.0"
    tags[1216606684 / $timeblock] = "v1.6.0-rc0"
    tags[1217196485 / $timeblock] = "v1.6.0-rc1"
    tags[1218056441 / $timeblock] = "v1.6.0-rc2"
    tags[1218607607 / $timeblock] = "v1.6.0-rc3"
    tags[1219614454 / $timeblock] = "v1.6.0.1"
    tags[1221261547 / $timeblock] = "v1.6.0.2"
    tags[1224621477 / $timeblock] = "v1.6.0.3"
    tags[1226208581 / $timeblock] = "v1.6.0.4"
    first = grouped_events.first.id
    last = grouped_events.last.id
    id = first
    @tag = Tag.new("initial")
    while id <= last
      @date = Time.at(id * (60 * 60 * 24 / $frames_per_day))
      @tag = Tag.new(tags[id]) if tags[id]
      if id == grouped_events.first.id
        group = grouped_events.shift
        process(group.events)
      end
      (1..$frames_per_day).each do |f|
        update
        draw
      end
      cleanup
      id += 1
    end
  end

  def process(events)
    events.each do |e|

      # file_nodes
      name = e.filename
      file = @file_nodes[name]
      if file
        file.freshen
      else
        file = FileNode.new(name)
        @file_nodes[name] = file
      end

      # persons
      name = e.author
      person = @person_nodes[name]
      if person
        person.freshen
      else
        person = PersonNode.new(name)
        @person_nodes[name] = person
      end

      person.add_file(file)

      # edges
      edge = @edges[[file, person]]
      if edge
        edge.freshen
      else
        edge = Edge.new(file, person)
        @edges[[file, person]] = edge
      end
    end

    @living_nodes = []
    @living_people = []
    @living_edges = []

    @file_nodes.each_value do |e|
      @living_nodes << e if e.alive?
    end

    @person_nodes.each_value do |e|
      @living_people << e if e.alive?
    end

    @edges.each_value do |e|
      @living_edges << e if e.alive?
    end
  end

  def update

    @living_edges.each { |e| e.relax(@living_edges) }
=begin
    # this is too slow!
    @living_nodes.each { |e| e.relax(@living_nodes) }
=end
    @living_people.each { |e| e.relax(@living_people) }

    @living_edges.each { |e| e.update }
    @living_nodes.each { |e| e.update }
    @living_people.each { |e| e.update }

  end

  def draw_node(node)
    x = node.pos.x
    y = node.pos.y
    case node
    when PersonNode
      node.color.saturation = 1 - node.liveness
      tmp = node.color.to_rgb
      @cr2.set_source_rgba(tmp.r, tmp.g, tmp.b, node.liveness)
      @cr2.select_font_face("Liberation Mono", Cairo::FONT_SLANT_NORMAL, Cairo::FONT_WEIGHT_BOLD)
      @cr2.set_font_size(14 * node.liveness)

      extents = @cr2.text_extents(node.name)
      @cr2.move_to(x - extents.width / 2 + 0.5, y + extents.height / 2 + 0.5)
      @cr2.show_text(node.name)
    when FileNode
      size = 4 * node.liveness
      def color_map (v)
        return v / 255 * 0.9 + 0.1
      end
      @cr.set_source_rgba(color_map(node.color[0]), color_map(node.color[1]), color_map(node.color[2]),
                          node.liveness)
      @cr.arc(x + 0.5, y + 0.5, size, 0, 2 * Math::PI)
      @cr.fill
    end
  end

  def draw
    # fill background with black
    @cr.set_source_color(:black)
    @cr.paint

    @living_nodes.each do |n|
      draw_node(n);
    end
    
    @living_people.each do |n|
      draw_node(n);
    end

    # date
    text = @date.strftime("%b %d, %Y")
    @cr2.set_source_rgba(0.8, 0.8, 0.8, 1.0)
    @cr2.select_font_face("Liberation Mono", Cairo::FONT_SLANT_NORMAL, Cairo::FONT_WEIGHT_NORMAL)
    @cr2.set_font_size(10)

    @cr2.move_to($width - 80, $height - 10)
    @cr2.show_text(text)

    if @tag.alive?
      @cr2.set_source_rgba(1.0, 1.0, 1.0, 1.0)
      @cr2.select_font_face("Liberation Mono", Cairo::FONT_SLANT_NORMAL, Cairo::FONT_WEIGHT_BOLD)
      @cr2.set_font_size(16)

      @cr2.move_to($width / 16, $height / 8)
      @cr2.show_text(@tag.name)
    end

    # finalize
    puts "count: #{@count += 1}"
    # @cr.target.write_to_png("frames/%0.5i.png" % [@count += 1])
    @out_file.write(@surface.data)
  end

  def cleanup
    @living_edges.each { |e| e.decay }
    @living_nodes.each { |e| e.decay }
    @living_people.each { |e| e.decay }
    @tag.decay
  end

end
