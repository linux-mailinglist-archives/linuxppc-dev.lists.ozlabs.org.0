Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA1767912B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:41:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1HSb0Qwmz3fBj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:41:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QcL+ZQJP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3-xvpywckdfq4da20de2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QcL+ZQJP;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1HJD1ZZWz3cNM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 17:34:36 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id n194-20020a2540cb000000b008038647d9ebso9790787yba.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 22:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MxI5oPJ3cq0K+5Os4jMfPPdT2CCa4+RQl8NewShLZ1k=;
        b=QcL+ZQJPpdPJeyeTX72i49hgimTb0fFpL+iy8cNYa14cICCBX6O6B5T0GphRgj9LEM
         J56k+rR4PbYalwXQ0bAd3urfnDGaJy28JKC9XMDWOqdIDRZnbVMZduQMe1fYHBZy3VXe
         cKVRmrM7kftixRvWRMmEzNqc0AQzvT2x0R1fiIGPcP/9iNioecViCLKnXLYVFF3VUa3c
         vD+itFUV5prKBRYb+EMXmJM0e+wEewImeOAjzjUR37J80RAKBVu72u9eWYgly+/+YX+4
         wi52tLNtDmJI2a1n7EoaInYb3e0iIOSOCliRoqXcbTiUmDKf4lMKR5zRsLcJlGlRASpa
         x98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxI5oPJ3cq0K+5Os4jMfPPdT2CCa4+RQl8NewShLZ1k=;
        b=iLUpAX6CaMaeP3D1MmHfhlg0O/QN1hg5ZV9IbHsr5UQlS4WRbdFkWqC5mX7n4PKKJ6
         sz2qRA6lVKqn2JcoHiCEoXuc89xGxCrIoh43Npmb0NJj4jNNIQEuNLgjyuky9FCkB95l
         G+Ipt98rKgZE916VJjxWVqiCavk9AmwyUCuO+ySiC2e2XYKva6d/2fRpCOipYm7DBhTv
         fTaccfKcLUh06KXFfpKBwzfj+RSwR3mYCRAIexVjosjP0ZIcF24b16tpboHSVZ5mJk8A
         MWxr1aRbMMPOUUNYgDZtKJkLZD4edNNvNePUXTSz6cMWTD+L1/NcwWbNRi1o3i/sc+H1
         /47w==
X-Gm-Message-State: AFqh2kreRQD/XeNpsmGXDEadlwZKa4agMG5/lyhEXwhCxArEaI5AqzWB
	HLHGx7xg+p3cgfYl3Ekz3rQqZDrUVFe/
X-Google-Smtp-Source: AMrXdXuYfN4d0MK2UH9HwYS5h5VOVVypdFuHlEkLzQbckgvPAZRQbPea4EAmOqVX6fYwt9MK+jMEfFLer4SI
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:460d:1b4a:acb8:ae9a])
 (user=irogers job=sendgmr) by 2002:a25:1856:0:b0:732:edd2:4138 with SMTP id
 83-20020a251856000000b00732edd24138mr1978744yby.448.1674542073924; Mon, 23
 Jan 2023 22:34:33 -0800 (PST)
Date: Mon, 23 Jan 2023 22:33:17 -0800
In-Reply-To: <20230124063320.668917-1-irogers@google.com>
Message-Id: <20230124063320.668917-9-irogers@google.com>
Mime-Version: 1.0
References: <20230124063320.668917-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Subject: [PATCH v3 08/11] perf jevents: Combine table prefix and suffix writing
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

Combine into a single function to simplify, in a later change, writing
metrics separately.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 36 +++++++++++++-------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 4cdbf34b7298..5f8d490c7269 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -19,10 +19,10 @@ _sys_event_tables = []
 # JsonEvent. Architecture standard events are in json files in the top
 # f'{_args.starting_dir}/{_args.arch}' directory.
 _arch_std_events = {}
-# Track whether an events table is currently being defined and needs closing.
-_close_table = False
 # Events to write out when the table is closed
 _pending_events = []
+# Name of table to be written out
+_pending_events_tblname = None
 # Global BigCString shared by all structures.
 _bcs = None
 # Order specific JsonEvent attributes will be visited.
@@ -378,24 +378,13 @@ def preprocess_arch_std_files(archpath: str) -> None:
           _arch_std_events[event.metric_name.lower()] = event
 
 
-def print_events_table_prefix(tblname: str) -> None:
-  """Called when a new events table is started."""
-  global _close_table
-  if _close_table:
-    raise IOError('Printing table prefix but last table has no suffix')
-  _args.output_file.write(f'static const struct compact_pmu_event {tblname}[] = {{\n')
-  _close_table = True
-
-
 def add_events_table_entries(item: os.DirEntry, topic: str) -> None:
   """Add contents of file to _pending_events table."""
-  if not _close_table:
-    raise IOError('Table entries missing prefix')
   for e in read_json_events(item.path, topic):
     _pending_events.append(e)
 
 
-def print_events_table_suffix() -> None:
+def print_pending_events() -> None:
   """Optionally close events table."""
 
   def event_cmp_key(j: JsonEvent) -> Tuple[bool, str, str, str, str]:
@@ -407,17 +396,19 @@ def print_events_table_suffix() -> None:
     return (j.desc is not None, fix_none(j.topic), fix_none(j.name), fix_none(j.pmu),
             fix_none(j.metric_name))
 
-  global _close_table
-  if not _close_table:
+  global _pending_events
+  if not _pending_events:
     return
 
-  global _pending_events
+  global _pending_events_tblname
+  _args.output_file.write(
+      f'static const struct compact_pmu_event {_pending_events_tblname}[] = {{\n')
+
   for event in sorted(_pending_events, key=event_cmp_key):
     _args.output_file.write(event.to_c_string())
-    _pending_events = []
+  _pending_events = []
 
   _args.output_file.write('};\n\n')
-  _close_table = False
 
 def get_topic(topic: str) -> str:
   if topic.endswith('metrics.json'):
@@ -455,12 +446,13 @@ def process_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
 
   # model directory, reset topic
   if item.is_dir() and is_leaf_dir(item.path):
-    print_events_table_suffix()
+    print_pending_events()
 
     tblname = file_name_to_table_name(parents, item.name)
     if item.name == 'sys':
       _sys_event_tables.append(tblname)
-    print_events_table_prefix(tblname)
+    global _pending_events_tblname
+    _pending_events_tblname = tblname
     return
 
   # base dir or too deep
@@ -809,7 +801,7 @@ struct compact_pmu_event {
   for arch in archs:
     arch_path = f'{_args.starting_dir}/{arch}'
     ftw(arch_path, [], process_one_file)
-    print_events_table_suffix()
+    print_pending_events()
 
   print_mapping_table(archs)
   print_system_mapping_table()
-- 
2.39.0.246.g2a6d74b583-goog

