Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34267D9EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:47:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2y6p65DHz3fRd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:47:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UVxY0+8b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=35q7tywckdhqajgywjkyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UVxY0+8b;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xwR3wCNz3fG5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:38:15 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id o1-20020a252801000000b0080b8600bdc9so3595868ybo.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rgaL7fTLciRMj0236xUDyoUjWYE0YTTX8Uwd7deoYFM=;
        b=UVxY0+8bHvxk1X6SHpPSWfIvGslOtlfOLKXmOTnkORMBu28G6kEYL9CzDjLGKeCO8f
         dNcau7D6gNGqlGyLAjIpLVBtouLhyudm4OH3M3FMibjXXWUymr0q22iMQextFSqVUDCC
         c5sB2R4RyQ2b4y2s2GfdbuRH+j/afqZ0Tz1ag2KaNcmVdfXsDha2Cvd9bM8/TBDU8kWI
         ur/oOCfA0SB7rDo5mC5I25U1G0StkkKnabrTYpDQU3JERiFaP4WkyI/NGFDC/AiRqTO/
         cqIalsR6UGApQyuwvUzLaDKXGXf0WSna6yWOIZEH0gPk6Uw+tpI1SFHZU7XJhR2VNoaw
         l01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgaL7fTLciRMj0236xUDyoUjWYE0YTTX8Uwd7deoYFM=;
        b=IgC0lP3Yo0u2XSOxXnRFlj7GKE+neRs3JXwqjKVML+Ntw2Z9wVFpSKdt/9TRH1OLsu
         vPQUlBlYbZTcx0miDeIKArzXZPcRhyTbgpI3pnNKiMVCc0iRGe3dBebjMNgNZz5kYSL0
         VVlewhY8thJx/DpN2IPPTeOUHezqGXd5DtLBkzJOejQgLEU82leCJ1uhfVFd7ibs2UdP
         g9fTPPWopkEA18DbZ6li+HzvWsjNRWqC3pmaOK5xXql+vrNvCQJeMe23ov+RujRVDyd0
         1rN7ZWDcjq/p5BIBNQTsSwczkAtB7LLNE93mDyv85litsVM1Hf2yl49CmCm2fOcG7uYt
         0LUg==
X-Gm-Message-State: AO0yUKVuB9r4wGKkPQ8RS/wWa4bT7/PV9DPSiJMfGMS1SkCUAzZXYHZc
	OyUNQywcAffIuFAzpOpiwEbQDGqW+XDz
X-Google-Smtp-Source: AK7set9WYPebKTDJi3N21r2zohiiq+IqM7CiMzlWGE/ve+FhjdvtcCA8n9sTLwkvl44e8Wokgmv2NvyfdMYs
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:b9b8:6de0:39b3:4cf7])
 (user=irogers job=sendgmr) by 2002:a81:5ca:0:b0:506:4e9b:2104 with SMTP id
 193-20020a8105ca000000b005064e9b2104mr1535676ywf.492.1674776293282; Thu, 26
 Jan 2023 15:38:13 -0800 (PST)
Date: Thu, 26 Jan 2023 15:36:40 -0800
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Message-Id: <20230126233645.200509-11-irogers@google.com>
Mime-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v5 10/15] perf jevents: Generate metrics and events as
 separate tables
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Kim Phillips <kim.phillips@amd.com>, 
	Florian Fischer <florian.fischer@muhq.space>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Xing Zhengjun <zhengjun.xing@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Kang Minchul <tegongkang@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sandipan Das <sandipan.das@amd.com>, Jing Zhang <renyu.zj@linux.alibaba.com>, 
	linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Ian Rogers <irogers@google.com>, Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Turn a perf json event into an event, metric or both. This reduces the
number of events needed to scan to find an event or metric. As events
no longer need the relatively seldom used metric fields, 4 bytes is
saved per event. This reduces the big C string's size by 335kb (14.8%)
on x86.

Note, for the test PMU architecture pme_test_soc_cpu is renamed
pmu_events__test_soc_cpu for consistency with the event vs metric
naming convention.
---
 tools/perf/pmu-events/jevents.py | 244 +++++++++++++++++++++++--------
 tools/perf/tests/pmu-events.c    |   3 +-
 2 files changed, 189 insertions(+), 58 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index d83cc94af51f..627ee817f57f 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -13,28 +13,40 @@ import collections
 
 # Global command line arguments.
 _args = None
+# List of regular event tables.
+_event_tables = []
 # List of event tables generated from "/sys" directories.
 _sys_event_tables = []
+# List of regular metric tables.
+_metric_tables = []
+# List of metric tables generated from "/sys" directories.
+_sys_metric_tables = []
+# Mapping between sys event table names and sys metric table names.
+_sys_event_table_to_metric_table_mapping = {}
 # Map from an event name to an architecture standard
 # JsonEvent. Architecture standard events are in json files in the top
 # f'{_args.starting_dir}/{_args.arch}' directory.
 _arch_std_events = {}
 # Events to write out when the table is closed
 _pending_events = []
-# Name of table to be written out
+# Name of events table to be written out
 _pending_events_tblname = None
+# Metrics to write out when the table is closed
+_pending_metrics = []
+# Name of metrics table to be written out
+_pending_metrics_tblname = None
 # Global BigCString shared by all structures.
 _bcs = None
 # Order specific JsonEvent attributes will be visited.
 _json_event_attributes = [
     # cmp_sevent related attributes.
-    'name', 'pmu', 'topic', 'desc', 'metric_name', 'metric_group',
+    'name', 'pmu', 'topic', 'desc',
     # Seems useful, put it early.
     'event',
     # Short things in alphabetical order.
     'aggr_mode', 'compat', 'deprecated', 'perpkg', 'unit',
     # Longer things (the last won't be iterated over during decompress).
-    'metric_constraint', 'metric_expr', 'long_desc'
+    'long_desc'
 ]
 
 # Attributes that are in pmu_metric rather than pmu_event.
@@ -52,14 +64,16 @@ def removesuffix(s: str, suffix: str) -> str:
   return s[0:-len(suffix)] if s.endswith(suffix) else s
 
 
-def file_name_to_table_name(parents: Sequence[str], dirname: str) -> str:
+def file_name_to_table_name(prefix: str, parents: Sequence[str],
+                            dirname: str) -> str:
   """Generate a C table name from directory names."""
-  tblname = 'pme'
+  tblname = prefix
   for p in parents:
     tblname += '_' + p
   tblname += '_' + dirname
   return tblname.replace('-', '_')
 
+
 def c_len(s: str) -> int:
   """Return the length of s a C string
 
@@ -277,7 +291,7 @@ class JsonEvent:
     self.metric_constraint = jd.get('MetricConstraint')
     self.metric_expr = None
     if 'MetricExpr' in jd:
-       self.metric_expr = metric.ParsePerfJson(jd['MetricExpr']).Simplify()
+      self.metric_expr = metric.ParsePerfJson(jd['MetricExpr']).Simplify()
 
     arch_std = jd.get('ArchStdEvent')
     if precise and self.desc and '(Precise Event)' not in self.desc:
@@ -326,23 +340,24 @@ class JsonEvent:
         s += f'\t{attr} = {value},\n'
     return s + '}'
 
-  def build_c_string(self) -> str:
+  def build_c_string(self, metric: bool) -> str:
     s = ''
-    for attr in _json_event_attributes:
+    for attr in _json_metric_attributes if metric else _json_event_attributes:
       x = getattr(self, attr)
-      if x and attr == 'metric_expr':
+      if metric and x and attr == 'metric_expr':
         # Convert parsed metric expressions into a string. Slashes
         # must be doubled in the file.
         x = x.ToPerfJson().replace('\\', '\\\\')
       s += f'{x}\\000' if x else '\\000'
     return s
 
-  def to_c_string(self) -> str:
+  def to_c_string(self, metric: bool) -> str:
     """Representation of the event as a C struct initializer."""
 
-    s = self.build_c_string()
+    s = self.build_c_string(metric)
     return f'{{ { _bcs.offsets[s] } }}, /* {s} */\n'
 
+
 @lru_cache(maxsize=None)
 def read_json_events(path: str, topic: str) -> Sequence[JsonEvent]:
   """Read json events from the specified file."""
@@ -381,7 +396,10 @@ def preprocess_arch_std_files(archpath: str) -> None:
 def add_events_table_entries(item: os.DirEntry, topic: str) -> None:
   """Add contents of file to _pending_events table."""
   for e in read_json_events(item.path, topic):
-    _pending_events.append(e)
+    if e.name:
+      _pending_events.append(e)
+    if e.metric_name:
+      _pending_metrics.append(e)
 
 
 def print_pending_events() -> None:
@@ -401,15 +419,54 @@ def print_pending_events() -> None:
     return
 
   global _pending_events_tblname
+  if _pending_events_tblname.endswith('_sys'):
+    global _sys_event_tables
+    _sys_event_tables.append(_pending_events_tblname)
+  else:
+    global event_tables
+    _event_tables.append(_pending_events_tblname)
+
   _args.output_file.write(
       f'static const struct compact_pmu_event {_pending_events_tblname}[] = {{\n')
 
   for event in sorted(_pending_events, key=event_cmp_key):
-    _args.output_file.write(event.to_c_string())
+    _args.output_file.write(event.to_c_string(metric=False))
   _pending_events = []
 
   _args.output_file.write('};\n\n')
 
+def print_pending_metrics() -> None:
+  """Optionally close metrics table."""
+
+  def metric_cmp_key(j: JsonEvent) -> Tuple[bool, str, str]:
+    def fix_none(s: Optional[str]) -> str:
+      if s is None:
+        return ''
+      return s
+
+    return (j.desc is not None, fix_none(j.pmu), fix_none(j.metric_name))
+
+  global _pending_metrics
+  if not _pending_metrics:
+    return
+
+  global _pending_metrics_tblname
+  if _pending_metrics_tblname.endswith('_sys'):
+    global _sys_metric_tables
+    _sys_metric_tables.append(_pending_metrics_tblname)
+  else:
+    global metric_tables
+    _metric_tables.append(_pending_metrics_tblname)
+
+  _args.output_file.write(
+      f'static const struct compact_pmu_event {_pending_metrics_tblname}[] = {{\n')
+
+  for metric in sorted(_pending_metrics, key=metric_cmp_key):
+    _args.output_file.write(metric.to_c_string(metric=True))
+  _pending_metrics = []
+
+  _args.output_file.write('};\n\n')
+
 def get_topic(topic: str) -> str:
   if topic.endswith('metrics.json'):
     return 'metrics'
@@ -432,12 +489,13 @@ def preprocess_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
 
   topic = get_topic(item.name)
   for event in read_json_events(item.path, topic):
-    _bcs.add(event.build_c_string())
+    if event.name:
+      _bcs.add(event.build_c_string(metric=False))
+    if event.metric_name:
+      _bcs.add(event.build_c_string(metric=True))
 
 def process_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
   """Process a JSON file during the main walk."""
-  global _sys_event_tables
-
   def is_leaf_dir(path: str) -> bool:
     for item in os.scandir(path):
       if item.is_dir():
@@ -447,12 +505,15 @@ def process_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
   # model directory, reset topic
   if item.is_dir() and is_leaf_dir(item.path):
     print_pending_events()
+    print_pending_metrics()
 
-    tblname = file_name_to_table_name(parents, item.name)
-    if item.name == 'sys':
-      _sys_event_tables.append(tblname)
     global _pending_events_tblname
-    _pending_events_tblname = tblname
+    _pending_events_tblname = file_name_to_table_name('pmu_events_', parents, item.name)
+    global _pending_metrics_tblname
+    _pending_metrics_tblname = file_name_to_table_name('pmu_metrics_', parents, item.name)
+
+    if item.name == 'sys':
+      _sys_event_table_to_metric_table_mapping[_pending_events_tblname] = _pending_metrics_tblname
     return
 
   # base dir or too deep
@@ -477,6 +538,12 @@ struct pmu_events_table {
         size_t length;
 };
 
+/* Struct used to make the PMU metric table implementation opaque to callers. */
+struct pmu_metrics_table {
+        const struct compact_pmu_event *entries;
+        size_t length;
+};
+
 /*
  * Map a CPU to its table of PMU events. The CPU is identified by the
  * cpuid field, which is an arch-specific identifier for the CPU.
@@ -488,7 +555,8 @@ struct pmu_events_table {
 struct pmu_events_map {
         const char *arch;
         const char *cpuid;
-        struct pmu_events_table table;
+        struct pmu_events_table event_table;
+        struct pmu_metrics_table metric_table;
 };
 
 /*
@@ -502,9 +570,13 @@ const struct pmu_events_map pmu_events_map[] = {
       _args.output_file.write("""{
 \t.arch = "testarch",
 \t.cpuid = "testcpu",
-\t.table = {
-\t.entries = pme_test_soc_cpu,
-\t.length = ARRAY_SIZE(pme_test_soc_cpu),
+\t.event_table = {
+\t\t.entries = pmu_events__test_soc_cpu,
+\t\t.length = ARRAY_SIZE(pmu_events__test_soc_cpu),
+\t},
+\t.metric_table = {
+\t\t.entries = pmu_metrics__test_soc_cpu,
+\t\t.length = ARRAY_SIZE(pmu_metrics__test_soc_cpu),
 \t}
 },
 """)
@@ -515,14 +587,29 @@ const struct pmu_events_map pmu_events_map[] = {
         for row in table:
           # Skip the first row or any row beginning with #.
           if not first and len(row) > 0 and not row[0].startswith('#'):
-            tblname = file_name_to_table_name([], row[2].replace('/', '_'))
+            event_tblname = file_name_to_table_name('pmu_events_', [], row[2].replace('/', '_'))
+            if event_tblname in _event_tables:
+              event_size = f'ARRAY_SIZE({event_tblname})'
+            else:
+              event_tblname = 'NULL'
+              event_size = '0'
+            metric_tblname = file_name_to_table_name('pmu_metrics_', [], row[2].replace('/', '_'))
+            if metric_tblname in _metric_tables:
+              metric_size = f'ARRAY_SIZE({metric_tblname})'
+            else:
+              metric_tblname = 'NULL'
+              metric_size = '0'
             cpuid = row[0].replace('\\', '\\\\')
             _args.output_file.write(f"""{{
 \t.arch = "{arch}",
 \t.cpuid = "{cpuid}",
-\t.table = {{
-\t\t.entries = {tblname},
-\t\t.length = ARRAY_SIZE({tblname})
+\t.event_table = {{
+\t\t.entries = {event_tblname},
+\t\t.length = {event_size}
+\t}},
+\t.metric_table = {{
+\t\t.entries = {metric_tblname},
+\t\t.length = {metric_size}
 \t}}
 }},
 """)
@@ -531,7 +618,8 @@ const struct pmu_events_map pmu_events_map[] = {
   _args.output_file.write("""{
 \t.arch = 0,
 \t.cpuid = 0,
-\t.table = { 0, 0 },
+\t.event_table = { 0, 0 },
+\t.metric_table = { 0, 0 },
 }
 };
 """)
@@ -542,14 +630,36 @@ def print_system_mapping_table() -> None:
   _args.output_file.write("""
 struct pmu_sys_events {
 \tconst char *name;
-\tstruct pmu_events_table table;
+\tstruct pmu_events_table event_table;
+\tstruct pmu_metrics_table metric_table;
 };
 
 static const struct pmu_sys_events pmu_sys_event_tables[] = {
 """)
+  printed_metric_tables = []
   for tblname in _sys_event_tables:
     _args.output_file.write(f"""\t{{
-\t\t.table = {{
+\t\t.event_table = {{
+\t\t\t.entries = {tblname},
+\t\t\t.length = ARRAY_SIZE({tblname})
+\t\t}},""")
+    metric_tblname = _sys_event_table_to_metric_table_mapping[tblname]
+    if metric_tblname in _sys_metric_tables:
+      _args.output_file.write(f"""
+\t\t.metric_table = {{
+\t\t\t.entries = {metric_tblname},
+\t\t\t.length = ARRAY_SIZE({metric_tblname})
+\t\t}},""")
+      printed_metric_tables.append(metric_tblname)
+    _args.output_file.write(f"""
+\t\t.name = \"{tblname}\",
+\t}},
+""")
+  for tblname in _sys_metric_tables:
+    if tblname in printed_metric_tables:
+      continue
+    _args.output_file.write(f"""\t{{
+\t\t.metric_table = {{
 \t\t\t.entries = {tblname},
 \t\t\t.length = ARRAY_SIZE({tblname})
 \t\t}},
@@ -557,7 +667,8 @@ static const struct pmu_sys_events pmu_sys_event_tables[] = {
 \t}},
 """)
   _args.output_file.write("""\t{
-\t\t.table = { 0, 0 }
+\t\t.event_table = { 0, 0 },
+\t\t.metric_table = { 0, 0 },
 \t},
 };
 
@@ -566,10 +677,7 @@ static void decompress_event(int offset, struct pmu_event *pe)
 \tconst char *p = &big_c_string[offset];
 """)
   for attr in _json_event_attributes:
-    if attr in _json_metric_attributes and 'metric_' in attr:
-      _args.output_file.write(f'\n\t/* Skip {attr} */\n')
-    else:
-      _args.output_file.write(f"""
+    _args.output_file.write(f"""
 \tpe->{attr} = (*p == '\\0' ? NULL : p);
 """)
     if attr == _json_event_attributes[-1]:
@@ -581,14 +689,11 @@ static void decompress_metric(int offset, struct pmu_metric *pm)
 {
 \tconst char *p = &big_c_string[offset];
 """)
-  for attr in _json_event_attributes:
-    if attr in _json_metric_attributes:
-      _args.output_file.write(f"""
+  for attr in _json_metric_attributes:
+    _args.output_file.write(f"""
 \tpm->{attr} = (*p == '\\0' ? NULL : p);
 """)
-    else:
-      _args.output_file.write(f'\n\t/* Skip {attr} */\n')
-    if attr == _json_event_attributes[-1]:
+    if attr == _json_metric_attributes[-1]:
       continue
     _args.output_file.write('\twhile (*p++);')
   _args.output_file.write("""}
@@ -611,12 +716,10 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table,
         return 0;
 }
 
-int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *mtable,
+int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *table,
                                      pmu_metric_iter_fn fn,
                                      void *data)
 {
-        const struct pmu_events_table *table = (const struct pmu_events_table *)mtable;
-
         for (size_t i = 0; i < table->length; i++) {
                 struct pmu_metric pm;
                 int ret;
@@ -624,7 +727,7 @@ int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *mtable,
                 decompress_metric(table->entries[i].offset, &pm);
                 if (!pm.metric_expr)
                         continue;
-                ret = fn(&pm, mtable, data);
+                ret = fn(&pm, table, data);
                 if (ret)
                         return ret;
         }
@@ -650,7 +753,7 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
                         break;
 
                 if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
-                        table = &map->table;
+                        table = &map->event_table;
                         break;
                 }
         }
@@ -660,7 +763,29 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
 
 const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
 {
-        return (struct pmu_metrics_table *)perf_pmu__find_events_table(pmu);
+        const struct pmu_metrics_table *table = NULL;
+        char *cpuid = perf_pmu__getcpuid(pmu);
+        int i;
+
+        /* on some platforms which uses cpus map, cpuid can be NULL for
+         * PMUs other than CORE PMUs.
+         */
+        if (!cpuid)
+                return NULL;
+
+        i = 0;
+        for (;;) {
+                const struct pmu_events_map *map = &pmu_events_map[i++];
+                if (!map->arch)
+                        break;
+
+                if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
+                        table = &map->metric_table;
+                        break;
+                }
+        }
+        free(cpuid);
+        return table;
 }
 
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
@@ -669,14 +794,20 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
              tables->arch;
              tables++) {
                 if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
-                        return &tables->table;
+                        return &tables->event_table;
         }
         return NULL;
 }
 
 const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
 {
-       return (struct pmu_metrics_table *)find_core_events_table(arch, cpuid);
+        for (const struct pmu_events_map *tables = &pmu_events_map[0];
+             tables->arch;
+             tables++) {
+                if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+                        return &tables->metric_table;
+        }
+        return NULL;
 }
 
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
@@ -684,7 +815,7 @@ int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
         for (const struct pmu_events_map *tables = &pmu_events_map[0];
              tables->arch;
              tables++) {
-                int ret = pmu_events_table_for_each_event(&tables->table, fn, data);
+                int ret = pmu_events_table_for_each_event(&tables->event_table, fn, data);
 
                 if (ret)
                         return ret;
@@ -697,8 +828,7 @@ int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
         for (const struct pmu_events_map *tables = &pmu_events_map[0];
              tables->arch;
              tables++) {
-                int ret = pmu_metrics_table_for_each_metric(
-                                (struct pmu_metrics_table *)&tables->table, fn, data);
+                int ret = pmu_metrics_table_for_each_metric(&tables->metric_table, fn, data);
 
                 if (ret)
                         return ret;
@@ -712,7 +842,7 @@ const struct pmu_events_table *find_sys_events_table(const char *name)
              tables->name;
              tables++) {
                 if (!strcmp(tables->name, name))
-                        return &tables->table;
+                        return &tables->event_table;
         }
         return NULL;
 }
@@ -722,7 +852,7 @@ int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data)
         for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
              tables->name;
              tables++) {
-                int ret = pmu_events_table_for_each_event(&tables->table, fn, data);
+                int ret = pmu_events_table_for_each_event(&tables->event_table, fn, data);
 
                 if (ret)
                         return ret;
@@ -735,8 +865,7 @@ int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data)
         for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
              tables->name;
              tables++) {
-                int ret = pmu_metrics_table_for_each_metric(
-                                (struct pmu_metrics_table *)&tables->table, fn, data);
+                int ret = pmu_metrics_table_for_each_metric(&tables->metric_table, fn, data);
 
                 if (ret)
                         return ret;
@@ -811,6 +940,7 @@ struct compact_pmu_event {
     arch_path = f'{_args.starting_dir}/{arch}'
     ftw(arch_path, [], process_one_file)
     print_pending_events()
+    print_pending_metrics()
 
   print_mapping_table(archs)
   print_system_mapping_table()
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index 9f2e385e0991..962c3c0d53ba 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -469,7 +469,8 @@ static int test__pmu_event_table_sys_callback(const struct pmu_event *pe,
 static int test__pmu_event_table(struct test_suite *test __maybe_unused,
 				 int subtest __maybe_unused)
 {
-	const struct pmu_events_table *sys_event_table = find_sys_events_table("pme_test_soc_sys");
+	const struct pmu_events_table *sys_event_table =
+		find_sys_events_table("pmu_events__test_soc_sys");
 	const struct pmu_events_table *table = find_core_events_table("testarch", "testcpu");
 	int map_events = 0, expected_events, err;
 
-- 
2.39.1.456.gfc5497dd1b-goog

