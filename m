Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B680B6538E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 23:42:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcpP73tyjz3cB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 09:42:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k+Z5n/KA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2001:4860:4864:20::49; helo=mail-oa1-x49.google.com; envelope-from=3niqjywckdpkjsphfsthpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k+Z5n/KA;
	dkim-atps=neutral
Received: from mail-oa1-x49.google.com (mail-oa1-x49.google.com [IPv6:2001:4860:4864:20::49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcpDp3NHKz3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 09:35:38 +1100 (AEDT)
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-144a21f5c25so186310fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 14:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zeq0c3sX/7SmRmvsyNKNV99iYluBRFNYHty1FMhbMmM=;
        b=k+Z5n/KAk0ZDyYqa1z1K4nOOj4eYlXbBm5lp6cQcj8/gbIZ0MkpXeUH09mWM98goJr
         L2Or6yvqegQKEnvA+x+c7RPOHfkLWbUxQHCYW+OzhpYnNTEkFCVm/w0n5hYgAEkP6UEP
         6PNWM6xF0PPbdExrEoWcroe3Yvvlmo+aaVi4TJ4Gh9hVHCS+8ezPIGAXiIF+swurhjW0
         523cjwGgvmHND2k49JcUIe7m84KtYWNBWTQ2UBQiAxcoIQgBIXNJYwXx6vBurP79OWP8
         xW7rIbp8HEDJ8H4gpU6WMmNkOtKkO9ppYeV8zmOL8H84P0gKD83QYKJDVBVc7k8TxzIV
         8I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zeq0c3sX/7SmRmvsyNKNV99iYluBRFNYHty1FMhbMmM=;
        b=y8d2Ev51P1gluXeHqO5B9gQo1FRYtccft6KGOPOSUsW6z+zPFxAQ2++Y8nGtsXjqE8
         2uqVTs2hnRz9y1/9Y4QM/3iHh593cOwNwUQ2AGGjwQngtRmzXpBXk80yZIAzRn6xv226
         dVSiIR5a2AzBQO/HK/22Yj2E+bWRWw2MeywiawgH/RqRQh82lbRI+PJHh/DEtnrBisMj
         7hRzePItHRi4k8g3z5/azuFPvs2OT2qiAyf9vFQ8+NnJmWlsxRzjOvo71E/lZ3K6gv7R
         A1R2AxCEjTfMfgl4osehl/LDaDLz4XwPVX1pBCzbABMD09ztTPU1Ok3howI8xNA6WlyS
         /NMw==
X-Gm-Message-State: AFqh2ko/7fL2AQ8IEVzqgulTYewtTh5usx57S3t87P3EqI8cK5v+jUcS
	xkfpOVCv/lG39RigFI1ep3deU9Et8iDd
X-Google-Smtp-Source: AMrXdXu4+lYR7BbdxD3iZGlwGRIvTiK/bBSREglZen4lU6e0oQCbhPY9YQmlr6LNwWw+iRKzHoZS/9NCJw4y
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:62bd:f120:1fd8:1d21])
 (user=irogers job=sendgmr) by 2002:a05:6870:d2a8:b0:144:189a:4dd with SMTP id
 d40-20020a056870d2a800b00144189a04ddmr194310oae.89.1671662132607; Wed, 21 Dec
 2022 14:35:32 -0800 (PST)
Date: Wed, 21 Dec 2022 14:34:19 -0800
In-Reply-To: <20221221223420.2157113-1-irogers@google.com>
Message-Id: <20221221223420.2157113-9-irogers@google.com>
Mime-Version: 1.0
References: <20221221223420.2157113-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH v2 8/9] perf jevents: Generate metrics and events as separate tables
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

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 244 +++++++++++++++++++++++--------
 tools/perf/tests/pmu-events.c    |   3 +-
 2 files changed, 189 insertions(+), 58 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index be2cf8a8779c..c98443319145 100755
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
@@ -379,7 +394,10 @@ def preprocess_arch_std_files(archpath: str) -> None:
 def add_events_table_entries(item: os.DirEntry, topic: str) -> None:
   """Add contents of file to _pending_events table."""
   for e in read_json_events(item.path, topic):
-    _pending_events.append(e)
+    if e.name:
+      _pending_events.append(e)
+    if e.metric_name:
+      _pending_metrics.append(e)
 
 
 def print_pending_events() -> None:
@@ -399,15 +417,54 @@ def print_pending_events() -> None:
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
@@ -430,12 +487,13 @@ def preprocess_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
 
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
@@ -445,12 +503,15 @@ def process_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
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
@@ -475,6 +536,12 @@ struct pmu_events_table {
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
@@ -486,7 +553,8 @@ struct pmu_events_table {
 struct pmu_events_map {
         const char *arch;
         const char *cpuid;
-        struct pmu_events_table table;
+        struct pmu_events_table event_table;
+        struct pmu_metrics_table metric_table;
 };
 
 /*
@@ -500,9 +568,13 @@ const struct pmu_events_map pmu_events_map[] = {
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
@@ -513,14 +585,29 @@ const struct pmu_events_map pmu_events_map[] = {
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
@@ -529,7 +616,8 @@ const struct pmu_events_map pmu_events_map[] = {
   _args.output_file.write("""{
 \t.arch = 0,
 \t.cpuid = 0,
-\t.table = { 0, 0 },
+\t.event_table = { 0, 0 },
+\t.metric_table = { 0, 0 },
 }
 };
 """)
@@ -540,14 +628,36 @@ def print_system_mapping_table() -> None:
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
@@ -555,7 +665,8 @@ static const struct pmu_sys_events pmu_sys_event_tables[] = {
 \t}},
 """)
   _args.output_file.write("""\t{
-\t\t.table = { 0, 0 }
+\t\t.event_table = { 0, 0 },
+\t\t.metric_table = { 0, 0 },
 \t},
 };
 
@@ -564,10 +675,7 @@ static void decompress_event(int offset, struct pmu_event *pe)
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
@@ -579,14 +687,11 @@ static void decompress_metric(int offset, struct pmu_metric *pm)
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
@@ -609,19 +714,17 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table,
         return 0;
 }
 
-int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *mtable,
+int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *table,
                                      pmu_metric_iter_fn fn,
                                      void *data)
 {
-        struct pmu_events_table *table = (struct pmu_events_table *)mtable;
-
         for (size_t i = 0; i < table->length; i++) {
                 struct pmu_metric pm;
                 int ret;
 
                 decompress_metric(table->entries[i].offset, &pm);
                 if (pm.metric_name) {
-                        ret = fn(&pm, mtable, data);
+                        ret = fn(&pm, table, data);
                         if (ret)
                                 return ret;
                 }
@@ -648,7 +751,7 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
                         break;
 
                 if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
-                        table = &map->table;
+                        table = &map->event_table;
                         break;
                 }
         }
@@ -658,7 +761,29 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
 
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
@@ -667,14 +792,20 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
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
@@ -682,7 +813,7 @@ int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
         for (const struct pmu_events_map *tables = &pmu_events_map[0];
              tables->arch;
              tables++) {
-                int ret = pmu_events_table_for_each_event(&tables->table, fn, data);
+                int ret = pmu_events_table_for_each_event(&tables->event_table, fn, data);
 
                 if (ret)
                         return ret;
@@ -695,8 +826,7 @@ int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
         for (const struct pmu_events_map *tables = &pmu_events_map[0];
              tables->arch;
              tables++) {
-                int ret = pmu_metrics_table_for_each_metric(
-                                (struct pmu_metrics_table *)&tables->table, fn, data);
+                int ret = pmu_metrics_table_for_each_metric(&tables->metric_table, fn, data);
 
                 if (ret)
                         return ret;
@@ -710,7 +840,7 @@ const struct pmu_events_table *find_sys_events_table(const char *name)
              tables->name;
              tables++) {
                 if (!strcmp(tables->name, name))
-                        return &tables->table;
+                        return &tables->event_table;
         }
         return NULL;
 }
@@ -720,7 +850,7 @@ int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data)
         for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
              tables->name;
              tables++) {
-                int ret = pmu_events_table_for_each_event(&tables->table, fn, data);
+                int ret = pmu_events_table_for_each_event(&tables->event_table, fn, data);
 
                 if (ret)
                         return ret;
@@ -733,8 +863,7 @@ int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data)
         for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
              tables->name;
              tables++) {
-                int ret = pmu_metrics_table_for_each_metric(
-                                (struct pmu_metrics_table *)&tables->table, fn, data);
+                int ret = pmu_metrics_table_for_each_metric(&tables->metric_table, fn, data);
 
                 if (ret)
                         return ret;
@@ -809,6 +938,7 @@ struct compact_pmu_event {
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
2.39.0.314.g84b9a713c41-goog

