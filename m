Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB8679118
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:38:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1HNC0tkVz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:38:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BNo72o/3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=323vpywckddyajgywjkyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BNo72o/3;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1HHd2vxFz3cB9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 17:34:05 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4d5097a95f5so142310317b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 22:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+MzIdoA5pVFjT5SCB7/bbSyupv2EaIGurwQ2dBVxcBU=;
        b=BNo72o/3YiuVVZuIngUYYO7XuDCUQVXkG4BbjppsY+l2wHoJMdZx82whNh4rZ2Xtmo
         pF88P1EGWKqp4j1Yj9GrKoMMVoeYCb4nudDq8c+uRHIiR4hwAcUMiZ7+rDa2CGjXeb0o
         /H4TFqsaeB+jRs5YDVHXmUuKl9Q62k15HNIiP9Jzk35YZFazroJQnmbGg1ksG+Etn4b9
         zVJ2/gQm5ymvKno9tQfz4jV9fGeqm780EHE+OsJzf51bmT5BBvcUDErk7IWvDm8TU4r3
         wNXWYTawKuvvY9Dpn+k6uS36NkUQD4izTugGFHjs2nR8ljXxrf7z+YGABECracpUkI/G
         cGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MzIdoA5pVFjT5SCB7/bbSyupv2EaIGurwQ2dBVxcBU=;
        b=8JS7iB6MHIO6BS2ZgUe+dbhhX6RnH6atGKnI4fscQR38oK5S52haypeaJzWJJeHqLU
         bq0PuqcZoRKWHAxB+IgD44MH4wELJotc69tAsH3xQolvu0d5NFv3nxh6ALQGXsSuSC/D
         F2mv3j9uhUV+kBmip04AB0m2D8Qvm7G6m4s3ykER17Js+0FkkJXFYVBwL4ClOPbK1dTQ
         89msgpBOYg9Xwqq/P5aZRwMGa5MXZSo+k9GIhFnVYwQuj43vY/hyxZw7MgyGkXKDvYVT
         ZbAukssEaZUaXD31c69cnIPqEJo1lS9Aga3hh2o3xL/HkVC/wiJPo9xa8noEHfXpsrqq
         Wm3Q==
X-Gm-Message-State: AFqh2kp0Sg5Xx+xX+5yS+XfL/4v75eLMGmt8P4Ek/4y3pGexqP2afg9+
	QQ0Vd7IhL5pc6Ipb//NUxA3bt7fc9f/2
X-Google-Smtp-Source: AMrXdXvAQPP/KBKuzw4t2ftg8HwSvvQfUGe6AEXE9Kj7BpBl1PkdMntBPx1uljyYHJZhn3IqhCScDjQazcaG
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:460d:1b4a:acb8:ae9a])
 (user=irogers job=sendgmr) by 2002:a81:1407:0:b0:471:aa97:c36b with SMTP id
 7-20020a811407000000b00471aa97c36bmr3154409ywu.325.1674542043250; Mon, 23 Jan
 2023 22:34:03 -0800 (PST)
Date: Mon, 23 Jan 2023 22:33:13 -0800
In-Reply-To: <20230124063320.668917-1-irogers@google.com>
Message-Id: <20230124063320.668917-5-irogers@google.com>
Mime-Version: 1.0
References: <20230124063320.668917-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Subject: [PATCH v3 04/11] perf pmu-events: Add separate metric from pmu_event
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

Create a new pmu_metric for the metric related variables from
pmu_event but that is initially just a clone of pmu_event. Add
iterators for pmu_metric and use in places that metrics are desired
rather than events. Make the event iterator skip metric only events,
and the metric iterator skip event only events.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/powerpc/util/header.c    |   4 +-
 tools/perf/pmu-events/empty-pmu-events.c |  49 ++++++-
 tools/perf/pmu-events/jevents.py         |  62 ++++++++-
 tools/perf/pmu-events/pmu-events.h       |  26 ++++
 tools/perf/tests/pmu-events.c            |  35 +++--
 tools/perf/util/metricgroup.c            | 161 +++++++++++------------
 tools/perf/util/metricgroup.h            |   2 +-
 7 files changed, 228 insertions(+), 111 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index e8fe36b10d20..78eef77d8a8d 100644
--- a/tools/perf/arch/powerpc/util/header.c
+++ b/tools/perf/arch/powerpc/util/header.c
@@ -40,11 +40,11 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
 	return bufp;
 }
 
-int arch_get_runtimeparam(const struct pmu_event *pe)
+int arch_get_runtimeparam(const struct pmu_metric *pm)
 {
 	int count;
 	char path[PATH_MAX] = "/devices/hv_24x7/interface/";
 
-	atoi(pe->aggr_mode) == PerChip ? strcat(path, "sockets") : strcat(path, "coresperchip");
+	atoi(pm->aggr_mode) == PerChip ? strcat(path, "sockets") : strcat(path, "coresperchip");
 	return sysfs__read_int(path, &count) < 0 ? 1 : count;
 }
diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 480e8f0d30c8..4e39d1a8d6d6 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -181,6 +181,11 @@ struct pmu_events_table {
 	const struct pmu_event *entries;
 };
 
+/* Struct used to make the PMU metric table implementation opaque to callers. */
+struct pmu_metrics_table {
+	const struct pmu_metric *entries;
+};
+
 /*
  * Map a CPU to its table of PMU events. The CPU is identified by the
  * cpuid field, which is an arch-specific identifier for the CPU.
@@ -254,11 +259,29 @@ static const struct pmu_sys_events pmu_sys_event_tables[] = {
 int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_event_iter_fn fn,
 				    void *data)
 {
-	for (const struct pmu_event *pe = &table->entries[0];
-	     pe->name || pe->metric_group || pe->metric_name;
-	     pe++) {
-		int ret = fn(pe, table, data);
+	for (const struct pmu_event *pe = &table->entries[0]; pe->name || pe->metric_expr; pe++) {
+		int ret;
 
+		if (!pe->name)
+			continue;
+		ret = fn(pe, table, data);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+int pmu_events_table_for_each_metric(const struct pmu_events_table *etable, pmu_metric_iter_fn fn,
+				     void *data)
+{
+	struct pmu_metrics_table *table = (struct pmu_metrics_table *)etable;
+
+	for (const struct pmu_metric *pm = &table->entries[0]; pm->name || pm->metric_expr; pm++) {
+		int ret;
+
+		if (!pm->metric_expr)
+			continue;
+		ret = fn(pm, etable, data);
 		if (ret)
 			return ret;
 	}
@@ -305,11 +328,22 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
 }
 
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
+{
+	for (const struct pmu_events_map *tables = &pmu_events_map[0]; tables->arch; tables++) {
+		int ret = pmu_events_table_for_each_event(&tables->table, fn, data);
+
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
 {
 	for (const struct pmu_events_map *tables = &pmu_events_map[0];
 	     tables->arch;
 	     tables++) {
-		int ret = pmu_events_table_for_each_event(&tables->table, fn, data);
+		int ret = pmu_events_table_for_each_metric(&tables->table, fn, data);
 
 		if (ret)
 			return ret;
@@ -340,3 +374,8 @@ int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data)
 	}
 	return 0;
 }
+
+int pmu_for_each_sys_metric(pmu_metric_iter_fn fn __maybe_unused, void *data __maybe_unused)
+{
+	return 0;
+}
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 15a1671740cc..858787a12302 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -564,7 +564,19 @@ static const struct pmu_sys_events pmu_sys_event_tables[] = {
 \t},
 };
 
-static void decompress(int offset, struct pmu_event *pe)
+static void decompress_event(int offset, struct pmu_event *pe)
+{
+\tconst char *p = &big_c_string[offset];
+""")
+  for attr in _json_event_attributes:
+    _args.output_file.write(f"""
+\tpe->{attr} = (*p == '\\0' ? NULL : p);
+""")
+    if attr == _json_event_attributes[-1]:
+      continue
+    _args.output_file.write('\twhile (*p++);')
+  _args.output_file.write("""}
+static void decompress_metric(int offset, struct pmu_metric *pe)
 {
 \tconst char *p = &big_c_string[offset];
 """)
@@ -585,7 +597,9 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table,
                 struct pmu_event pe;
                 int ret;
 
-                decompress(table->entries[i].offset, &pe);
+                decompress_event(table->entries[i].offset, &pe);
+                if (!pe.name)
+                        continue;
                 ret = fn(&pe, table, data);
                 if (ret)
                         return ret;
@@ -593,6 +607,24 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table,
         return 0;
 }
 
+int pmu_events_table_for_each_metric(const struct pmu_events_table *table,
+                                     pmu_metric_iter_fn fn,
+                                     void *data)
+{
+        for (size_t i = 0; i < table->length; i++) {
+                struct pmu_metric pm;
+                int ret;
+
+                decompress_metric(table->entries[i].offset, &pm);
+                if (!pm.metric_expr)
+                        continue;
+                ret = fn(&pm, table, data);
+                if (ret)
+                        return ret;
+        }
+        return 0;
+}
+
 const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
 {
         const struct pmu_events_table *table = NULL;
@@ -644,6 +676,19 @@ int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
         return 0;
 }
 
+int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
+{
+        for (const struct pmu_events_map *tables = &pmu_events_map[0];
+             tables->arch;
+             tables++) {
+                int ret = pmu_events_table_for_each_metric(&tables->table, fn, data);
+
+                if (ret)
+                        return ret;
+        }
+        return 0;
+}
+
 const struct pmu_events_table *find_sys_events_table(const char *name)
 {
         for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
@@ -667,6 +712,19 @@ int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data)
         }
         return 0;
 }
+
+int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data)
+{
+        for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
+             tables->name;
+             tables++) {
+                int ret = pmu_events_table_for_each_metric(&tables->table, fn, data);
+
+                if (ret)
+                        return ret;
+        }
+        return 0;
+}
 """)
 
 
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index fe343c4d8016..45c0f508af23 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -30,20 +30,46 @@ struct pmu_event {
 	const char *metric_constraint;
 };
 
+struct pmu_metric {
+	const char *name;
+	const char *compat;
+	const char *event;
+	const char *desc;
+	const char *topic;
+	const char *long_desc;
+	const char *pmu;
+	const char *unit;
+	const char *perpkg;
+	const char *aggr_mode;
+	const char *metric_expr;
+	const char *metric_name;
+	const char *metric_group;
+	const char *deprecated;
+	const char *metric_constraint;
+};
+
 struct pmu_events_table;
 
 typedef int (*pmu_event_iter_fn)(const struct pmu_event *pe,
 				 const struct pmu_events_table *table,
 				 void *data);
 
+typedef int (*pmu_metric_iter_fn)(const struct pmu_metric *pm,
+				  const struct pmu_events_table *table,
+				  void *data);
+
 int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_event_iter_fn fn,
 				    void *data);
+int pmu_events_table_for_each_metric(const struct pmu_events_table *table, pmu_metric_iter_fn fn,
+				     void *data);
 
 const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu);
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid);
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
+int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data);
 
 const struct pmu_events_table *find_sys_events_table(const char *name);
 int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data);
+int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data);
 
 #endif
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index a9f2330f6257..e5fb3d5a06c3 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -840,7 +840,7 @@ struct metric {
 	struct metric_ref metric_ref;
 };
 
-static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_events_table *table,
+static int test__parsing_callback(const struct pmu_metric *pm, const struct pmu_events_table *table,
 				  void *data)
 {
 	int *failures = data;
@@ -854,10 +854,10 @@ static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_e
 	};
 	int err = 0;
 
-	if (!pe->metric_expr)
+	if (!pm->metric_expr)
 		return 0;
 
-	pr_debug("Found metric '%s'\n", pe->metric_name);
+	pr_debug("Found metric '%s'\n", pm->metric_name);
 	(*failures)++;
 
 	/*
@@ -877,14 +877,14 @@ static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_e
 	perf_evlist__set_maps(&evlist->core, cpus, NULL);
 	runtime_stat__init(&st);
 
-	err = metricgroup__parse_groups_test(evlist, table, pe->metric_name,
+	err = metricgroup__parse_groups_test(evlist, table, pm->metric_name,
 					     false, false,
 					     &metric_events);
 	if (err) {
-		if (!strcmp(pe->metric_name, "M1") || !strcmp(pe->metric_name, "M2") ||
-		    !strcmp(pe->metric_name, "M3")) {
+		if (!strcmp(pm->metric_name, "M1") || !strcmp(pm->metric_name, "M2") ||
+		    !strcmp(pm->metric_name, "M3")) {
 			(*failures)--;
-			pr_debug("Expected broken metric %s skipping\n", pe->metric_name);
+			pr_debug("Expected broken metric %s skipping\n", pm->metric_name);
 			err = 0;
 		}
 		goto out_err;
@@ -912,7 +912,7 @@ static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_e
 			struct metric_expr *mexp;
 
 			list_for_each_entry (mexp, &me->head, nd) {
-				if (strcmp(mexp->metric_name, pe->metric_name))
+				if (strcmp(mexp->metric_name, pm->metric_name))
 					continue;
 				pr_debug("Result %f\n", test_generic_metric(mexp, 0, &st));
 				err = 0;
@@ -921,11 +921,11 @@ static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_e
 			}
 		}
 	}
-	pr_debug("Didn't find parsed metric %s", pe->metric_name);
+	pr_debug("Didn't find parsed metric %s", pm->metric_name);
 	err = 1;
 out_err:
 	if (err)
-		pr_debug("Broken metric %s\n", pe->metric_name);
+		pr_debug("Broken metric %s\n", pm->metric_name);
 
 	/* ... cleanup. */
 	metricgroup__rblist_exit(&metric_events);
@@ -941,8 +941,8 @@ static int test__parsing(struct test_suite *test __maybe_unused,
 {
 	int failures = 0;
 
-	pmu_for_each_core_event(test__parsing_callback, &failures);
-	pmu_for_each_sys_event(test__parsing_callback, &failures);
+	pmu_for_each_core_metric(test__parsing_callback, &failures);
+	pmu_for_each_sys_metric(test__parsing_callback, &failures);
 
 	return failures == 0 ? TEST_OK : TEST_FAIL;
 }
@@ -1021,14 +1021,11 @@ static int metric_parse_fake(const char *metric_name, const char *str)
 	return ret;
 }
 
-static int test__parsing_fake_callback(const struct pmu_event *pe,
+static int test__parsing_fake_callback(const struct pmu_metric *pm,
 				       const struct pmu_events_table *table __maybe_unused,
 				       void *data __maybe_unused)
 {
-	if (!pe->metric_expr)
-		return 0;
-
-	return metric_parse_fake(pe->metric_name, pe->metric_expr);
+	return metric_parse_fake(pm->metric_name, pm->metric_expr);
 }
 
 /*
@@ -1047,11 +1044,11 @@ static int test__parsing_fake(struct test_suite *test __maybe_unused,
 			return err;
 	}
 
-	err = pmu_for_each_core_event(test__parsing_fake_callback, NULL);
+	err = pmu_for_each_core_metric(test__parsing_fake_callback, NULL);
 	if (err)
 		return err;
 
-	return pmu_for_each_sys_event(test__parsing_fake_callback, NULL);
+	return pmu_for_each_sys_metric(test__parsing_fake_callback, NULL);
 }
 
 static struct test_case pmu_events_tests[] = {
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index b9c273ed080a..47fd02af66f1 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -167,14 +167,14 @@ static void metricgroup___watchdog_constraint_hint(const char *name, bool foot)
 		   "    echo 1 > /proc/sys/kernel/nmi_watchdog\n");
 }
 
-static bool metricgroup__has_constraint(const struct pmu_event *pe)
+static bool metricgroup__has_constraint(const struct pmu_metric *pm)
 {
-	if (!pe->metric_constraint)
+	if (!pm->metric_constraint)
 		return false;
 
-	if (!strcmp(pe->metric_constraint, "NO_NMI_WATCHDOG") &&
+	if (!strcmp(pm->metric_constraint, "NO_NMI_WATCHDOG") &&
 	    sysctl__nmi_watchdog_enabled()) {
-		metricgroup___watchdog_constraint_hint(pe->metric_name, false);
+		metricgroup___watchdog_constraint_hint(pm->metric_name, false);
 		return true;
 	}
 
@@ -193,7 +193,7 @@ static void metric__free(struct metric *m)
 	free(m);
 }
 
-static struct metric *metric__new(const struct pmu_event *pe,
+static struct metric *metric__new(const struct pmu_metric *pm,
 				  const char *modifier,
 				  bool metric_no_group,
 				  int runtime,
@@ -210,15 +210,15 @@ static struct metric *metric__new(const struct pmu_event *pe,
 	if (!m->pctx)
 		goto out_err;
 
-	m->metric_name = pe->metric_name;
+	m->metric_name = pm->metric_name;
 	m->modifier = NULL;
 	if (modifier) {
 		m->modifier = strdup(modifier);
 		if (!m->modifier)
 			goto out_err;
 	}
-	m->metric_expr = pe->metric_expr;
-	m->metric_unit = pe->unit;
+	m->metric_expr = pm->metric_expr;
+	m->metric_unit = pm->unit;
 	m->pctx->sctx.user_requested_cpu_list = NULL;
 	if (user_requested_cpu_list) {
 		m->pctx->sctx.user_requested_cpu_list = strdup(user_requested_cpu_list);
@@ -227,7 +227,7 @@ static struct metric *metric__new(const struct pmu_event *pe,
 	}
 	m->pctx->sctx.runtime = runtime;
 	m->pctx->sctx.system_wide = system_wide;
-	m->has_constraint = metric_no_group || metricgroup__has_constraint(pe);
+	m->has_constraint = metric_no_group || metricgroup__has_constraint(pm);
 	m->metric_refs = NULL;
 	m->evlist = NULL;
 
@@ -348,10 +348,10 @@ static bool match_metric(const char *n, const char *list)
 	return false;
 }
 
-static bool match_pe_metric(const struct pmu_event *pe, const char *metric)
+static bool match_pm_metric(const struct pmu_metric *pm, const char *metric)
 {
-	return match_metric(pe->metric_group, metric) ||
-	       match_metric(pe->metric_name, metric);
+	return match_metric(pm->metric_group, metric) ||
+	       match_metric(pm->metric_name, metric);
 }
 
 /** struct mep - RB-tree node for building printing information. */
@@ -420,13 +420,13 @@ static struct mep *mep_lookup(struct rblist *groups, const char *metric_group,
 	return NULL;
 }
 
-static int metricgroup__add_to_mep_groups(const struct pmu_event *pe,
+static int metricgroup__add_to_mep_groups(const struct pmu_metric *pm,
 					struct rblist *groups)
 {
 	const char *g;
 	char *omg, *mg;
 
-	mg = strdup(pe->metric_group ?: "No_group");
+	mg = strdup(pm->metric_group ?: "No_group");
 	if (!mg)
 		return -ENOMEM;
 	omg = mg;
@@ -435,15 +435,15 @@ static int metricgroup__add_to_mep_groups(const struct pmu_event *pe,
 
 		g = skip_spaces(g);
 		if (strlen(g))
-			me = mep_lookup(groups, g, pe->metric_name);
+			me = mep_lookup(groups, g, pm->metric_name);
 		else
-			me = mep_lookup(groups, "No_group", pe->metric_name);
+			me = mep_lookup(groups, "No_group", pm->metric_name);
 
 		if (me) {
-			me->metric_desc = pe->desc;
-			me->metric_long_desc = pe->long_desc;
-			me->metric_expr = pe->metric_expr;
-			me->metric_unit = pe->unit;
+			me->metric_desc = pm->desc;
+			me->metric_long_desc = pm->long_desc;
+			me->metric_expr = pm->metric_expr;
+			me->metric_unit = pm->unit;
 		}
 	}
 	free(omg);
@@ -452,40 +452,37 @@ static int metricgroup__add_to_mep_groups(const struct pmu_event *pe,
 }
 
 struct metricgroup_iter_data {
-	pmu_event_iter_fn fn;
+	pmu_metric_iter_fn fn;
 	void *data;
 };
 
-static int metricgroup__sys_event_iter(const struct pmu_event *pe,
+static int metricgroup__sys_event_iter(const struct pmu_metric *pm,
 				       const struct pmu_events_table *table,
 				       void *data)
 {
 	struct metricgroup_iter_data *d = data;
 	struct perf_pmu *pmu = NULL;
 
-	if (!pe->metric_expr || !pe->compat)
+	if (!pm->metric_expr || !pm->compat)
 		return 0;
 
 	while ((pmu = perf_pmu__scan(pmu))) {
 
-		if (!pmu->id || strcmp(pmu->id, pe->compat))
+		if (!pmu->id || strcmp(pmu->id, pm->compat))
 			continue;
 
-		return d->fn(pe, table, d->data);
+		return d->fn(pm, table, d->data);
 	}
 	return 0;
 }
 
-static int metricgroup__add_to_mep_groups_callback(const struct pmu_event *pe,
+static int metricgroup__add_to_mep_groups_callback(const struct pmu_metric *pm,
 						const struct pmu_events_table *table __maybe_unused,
 						void *vdata)
 {
 	struct rblist *groups = vdata;
 
-	if (!pe->metric_name)
-		return 0;
-
-	return metricgroup__add_to_mep_groups(pe, groups);
+	return metricgroup__add_to_mep_groups(pm, groups);
 }
 
 void metricgroup__print(const struct print_callbacks *print_cb, void *print_state)
@@ -500,16 +497,16 @@ void metricgroup__print(const struct print_callbacks *print_cb, void *print_stat
 	groups.node_delete = mep_delete;
 	table = pmu_events_table__find();
 	if (table) {
-		pmu_events_table_for_each_event(table,
-						metricgroup__add_to_mep_groups_callback,
-						&groups);
+		pmu_events_table_for_each_metric(table,
+						 metricgroup__add_to_mep_groups_callback,
+						 &groups);
 	}
 	{
 		struct metricgroup_iter_data data = {
 			.fn = metricgroup__add_to_mep_groups_callback,
 			.data = &groups,
 		};
-		pmu_for_each_sys_event(metricgroup__sys_event_iter, &data);
+		pmu_for_each_sys_metric(metricgroup__sys_event_iter, &data);
 	}
 
 	for (node = rb_first_cached(&groups.entries); node; node = next) {
@@ -743,7 +740,7 @@ static int metricgroup__build_event_string(struct strbuf *events,
 #undef RETURN_IF_NON_ZERO
 }
 
-int __weak arch_get_runtimeparam(const struct pmu_event *pe __maybe_unused)
+int __weak arch_get_runtimeparam(const struct pmu_metric *pm __maybe_unused)
 {
 	return 1;
 }
@@ -773,10 +770,10 @@ struct metricgroup_add_iter_data {
 
 static bool metricgroup__find_metric(const char *metric,
 				     const struct pmu_events_table *table,
-				     struct pmu_event *pe);
+				     struct pmu_metric *pm);
 
 static int add_metric(struct list_head *metric_list,
-		      const struct pmu_event *pe,
+		      const struct pmu_metric *pm,
 		      const char *modifier,
 		      bool metric_no_group,
 		      const char *user_requested_cpu_list,
@@ -816,10 +813,10 @@ static int resolve_metric(struct list_head *metric_list,
 	size_t bkt;
 	struct to_resolve {
 		/* The metric to resolve. */
-		struct pmu_event pe;
+		struct pmu_metric pm;
 		/*
 		 * The key in the IDs map, this may differ from in case,
-		 * etc. from pe->metric_name.
+		 * etc. from pm->metric_name.
 		 */
 		const char *key;
 	} *pending = NULL;
@@ -830,15 +827,15 @@ static int resolve_metric(struct list_head *metric_list,
 	 * the pending array.
 	 */
 	hashmap__for_each_entry(root_metric->pctx->ids, cur, bkt) {
-		struct pmu_event pe;
+		struct pmu_metric pm;
 
-		if (metricgroup__find_metric(cur->pkey, table, &pe)) {
+		if (metricgroup__find_metric(cur->pkey, table, &pm)) {
 			pending = realloc(pending,
 					(pending_cnt + 1) * sizeof(struct to_resolve));
 			if (!pending)
 				return -ENOMEM;
 
-			memcpy(&pending[pending_cnt].pe, &pe, sizeof(pe));
+			memcpy(&pending[pending_cnt].pm, &pm, sizeof(pm));
 			pending[pending_cnt].key = cur->pkey;
 			pending_cnt++;
 		}
@@ -853,7 +850,7 @@ static int resolve_metric(struct list_head *metric_list,
 	 * context.
 	 */
 	for (i = 0; i < pending_cnt; i++) {
-		ret = add_metric(metric_list, &pending[i].pe, modifier, metric_no_group,
+		ret = add_metric(metric_list, &pending[i].pm, modifier, metric_no_group,
 				 user_requested_cpu_list, system_wide, root_metric, visited,
 				 table);
 		if (ret)
@@ -867,7 +864,7 @@ static int resolve_metric(struct list_head *metric_list,
 /**
  * __add_metric - Add a metric to metric_list.
  * @metric_list: The list the metric is added to.
- * @pe: The pmu_event containing the metric to be added.
+ * @pm: The pmu_metric containing the metric to be added.
  * @modifier: if non-null event modifiers like "u".
  * @metric_no_group: Should events written to events be grouped "{}" or
  *                   global. Grouping is the default but due to multiplexing the
@@ -884,7 +881,7 @@ static int resolve_metric(struct list_head *metric_list,
  *       architecture perf is running upon.
  */
 static int __add_metric(struct list_head *metric_list,
-			const struct pmu_event *pe,
+			const struct pmu_metric *pm,
 			const char *modifier,
 			bool metric_no_group,
 			int runtime,
@@ -898,13 +895,13 @@ static int __add_metric(struct list_head *metric_list,
 	int ret;
 	bool is_root = !root_metric;
 	struct visited_metric visited_node = {
-		.name = pe->metric_name,
+		.name = pm->metric_name,
 		.parent = visited,
 	};
 
 	for (vm = visited; vm; vm = vm->parent) {
-		if (!strcmp(pe->metric_name, vm->name)) {
-			pr_err("failed: recursion detected for %s\n", pe->metric_name);
+		if (!strcmp(pm->metric_name, vm->name)) {
+			pr_err("failed: recursion detected for %s\n", pm->metric_name);
 			return -1;
 		}
 	}
@@ -914,7 +911,7 @@ static int __add_metric(struct list_head *metric_list,
 		 * This metric is the root of a tree and may reference other
 		 * metrics that are added recursively.
 		 */
-		root_metric = metric__new(pe, modifier, metric_no_group, runtime,
+		root_metric = metric__new(pm, modifier, metric_no_group, runtime,
 					  user_requested_cpu_list, system_wide);
 		if (!root_metric)
 			return -ENOMEM;
@@ -929,7 +926,7 @@ static int __add_metric(struct list_head *metric_list,
 		 */
 		if (root_metric->metric_refs) {
 			for (; root_metric->metric_refs[cnt].metric_name; cnt++) {
-				if (!strcmp(pe->metric_name,
+				if (!strcmp(pm->metric_name,
 					    root_metric->metric_refs[cnt].metric_name))
 					return 0;
 			}
@@ -947,8 +944,8 @@ static int __add_metric(struct list_head *metric_list,
 		 * need to change them, so there's no need to create
 		 * our own copy.
 		 */
-		root_metric->metric_refs[cnt].metric_name = pe->metric_name;
-		root_metric->metric_refs[cnt].metric_expr = pe->metric_expr;
+		root_metric->metric_refs[cnt].metric_name = pm->metric_name;
+		root_metric->metric_refs[cnt].metric_expr = pm->metric_expr;
 
 		/* Null terminate array. */
 		root_metric->metric_refs[cnt+1].metric_name = NULL;
@@ -959,7 +956,7 @@ static int __add_metric(struct list_head *metric_list,
 	 * For both the parent and referenced metrics, we parse
 	 * all the metric's IDs and add it to the root context.
 	 */
-	if (expr__find_ids(pe->metric_expr, NULL, root_metric->pctx) < 0) {
+	if (expr__find_ids(pm->metric_expr, NULL, root_metric->pctx) < 0) {
 		/* Broken metric. */
 		ret = -EINVAL;
 	} else {
@@ -981,37 +978,37 @@ static int __add_metric(struct list_head *metric_list,
 
 struct metricgroup__find_metric_data {
 	const char *metric;
-	struct pmu_event *pe;
+	struct pmu_metric *pm;
 };
 
-static int metricgroup__find_metric_callback(const struct pmu_event *pe,
+static int metricgroup__find_metric_callback(const struct pmu_metric *pm,
 					     const struct pmu_events_table *table  __maybe_unused,
 					     void *vdata)
 {
 	struct metricgroup__find_metric_data *data = vdata;
 
-	if (!match_metric(pe->metric_name, data->metric))
+	if (!match_metric(pm->metric_name, data->metric))
 		return 0;
 
-	memcpy(data->pe, pe, sizeof(*pe));
+	memcpy(data->pm, pm, sizeof(*pm));
 	return 1;
 }
 
 static bool metricgroup__find_metric(const char *metric,
 				     const struct pmu_events_table *table,
-				     struct pmu_event *pe)
+				     struct pmu_metric *pm)
 {
 	struct metricgroup__find_metric_data data = {
 		.metric = metric,
-		.pe = pe,
+		.pm = pm,
 	};
 
-	return pmu_events_table_for_each_event(table, metricgroup__find_metric_callback, &data)
+	return pmu_events_table_for_each_metric(table, metricgroup__find_metric_callback, &data)
 		? true : false;
 }
 
 static int add_metric(struct list_head *metric_list,
-		      const struct pmu_event *pe,
+		      const struct pmu_metric *pm,
 		      const char *modifier,
 		      bool metric_no_group,
 		      const char *user_requested_cpu_list,
@@ -1022,16 +1019,16 @@ static int add_metric(struct list_head *metric_list,
 {
 	int ret = 0;
 
-	pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
+	pr_debug("metric expr %s for %s\n", pm->metric_expr, pm->metric_name);
 
-	if (!strstr(pe->metric_expr, "?")) {
-		ret = __add_metric(metric_list, pe, modifier, metric_no_group, 0,
+	if (!strstr(pm->metric_expr, "?")) {
+		ret = __add_metric(metric_list, pm, modifier, metric_no_group, 0,
 				   user_requested_cpu_list, system_wide, root_metric,
 				   visited, table);
 	} else {
 		int j, count;
 
-		count = arch_get_runtimeparam(pe);
+		count = arch_get_runtimeparam(pm);
 
 		/* This loop is added to create multiple
 		 * events depend on count value and add
@@ -1039,7 +1036,7 @@ static int add_metric(struct list_head *metric_list,
 		 */
 
 		for (j = 0; j < count && !ret; j++)
-			ret = __add_metric(metric_list, pe, modifier, metric_no_group, j,
+			ret = __add_metric(metric_list, pm, modifier, metric_no_group, j,
 					   user_requested_cpu_list, system_wide,
 					   root_metric, visited, table);
 	}
@@ -1047,17 +1044,17 @@ static int add_metric(struct list_head *metric_list,
 	return ret;
 }
 
-static int metricgroup__add_metric_sys_event_iter(const struct pmu_event *pe,
+static int metricgroup__add_metric_sys_event_iter(const struct pmu_metric *pm,
 						const struct pmu_events_table *table __maybe_unused,
 						void *data)
 {
 	struct metricgroup_add_iter_data *d = data;
 	int ret;
 
-	if (!match_pe_metric(pe, d->metric_name))
+	if (!match_pm_metric(pm, d->metric_name))
 		return 0;
 
-	ret = add_metric(d->metric_list, pe, d->modifier, d->metric_no_group,
+	ret = add_metric(d->metric_list, pm, d->modifier, d->metric_no_group,
 			 d->user_requested_cpu_list, d->system_wide,
 			 d->root_metric, d->visited, d->table);
 	if (ret)
@@ -1107,19 +1104,19 @@ struct metricgroup__add_metric_data {
 	bool has_match;
 };
 
-static int metricgroup__add_metric_callback(const struct pmu_event *pe,
+static int metricgroup__add_metric_callback(const struct pmu_metric *pm,
 					    const struct pmu_events_table *table,
 					    void *vdata)
 {
 	struct metricgroup__add_metric_data *data = vdata;
 	int ret = 0;
 
-	if (pe->metric_expr &&
-		(match_metric(pe->metric_group, data->metric_name) ||
-		 match_metric(pe->metric_name, data->metric_name))) {
+	if (pm->metric_expr &&
+		(match_metric(pm->metric_group, data->metric_name) ||
+		 match_metric(pm->metric_name, data->metric_name))) {
 
 		data->has_match = true;
-		ret = add_metric(data->list, pe, data->modifier, data->metric_no_group,
+		ret = add_metric(data->list, pm, data->modifier, data->metric_no_group,
 				 data->user_requested_cpu_list, data->system_wide,
 				 /*root_metric=*/NULL, /*visited_metrics=*/NULL, table);
 	}
@@ -1166,8 +1163,8 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
 		 * Iterate over all metrics seeing if metric matches either the
 		 * name or group. When it does add the metric to the list.
 		 */
-		ret = pmu_events_table_for_each_event(table, metricgroup__add_metric_callback,
-						      &data);
+		ret = pmu_events_table_for_each_metric(table, metricgroup__add_metric_callback,
+						       &data);
 		if (ret)
 			goto out;
 
@@ -1189,7 +1186,7 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
 			},
 		};
 
-		pmu_for_each_sys_event(metricgroup__sys_event_iter, &data);
+		pmu_for_each_sys_metric(metricgroup__sys_event_iter, &data);
 	}
 	/* End of pmu events. */
 	if (!has_match)
@@ -1603,16 +1600,16 @@ int metricgroup__parse_groups_test(struct evlist *evlist,
 			    &perf_pmu__fake, metric_events, table);
 }
 
-static int metricgroup__has_metric_callback(const struct pmu_event *pe,
+static int metricgroup__has_metric_callback(const struct pmu_metric *pm,
 					    const struct pmu_events_table *table __maybe_unused,
 					    void *vdata)
 {
 	const char *metric = vdata;
 
-	if (!pe->metric_expr)
+	if (!pm->metric_expr)
 		return 0;
 
-	if (match_metric(pe->metric_name, metric))
+	if (match_metric(pm->metric_name, metric))
 		return 1;
 
 	return 0;
@@ -1625,8 +1622,8 @@ bool metricgroup__has_metric(const char *metric)
 	if (!table)
 		return false;
 
-	return pmu_events_table_for_each_event(table, metricgroup__has_metric_callback,
-					       (void *)metric) ? true : false;
+	return pmu_events_table_for_each_metric(table, metricgroup__has_metric_callback,
+						(void *)metric) ? true : false;
 }
 
 int metricgroup__copy_metric_events(struct evlist *evlist, struct cgroup *cgrp,
diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
index 0013cf582173..b1f186d0f514 100644
--- a/tools/perf/util/metricgroup.h
+++ b/tools/perf/util/metricgroup.h
@@ -81,7 +81,7 @@ int metricgroup__parse_groups_test(struct evlist *evlist,
 
 void metricgroup__print(const struct print_callbacks *print_cb, void *print_state);
 bool metricgroup__has_metric(const char *metric);
-int arch_get_runtimeparam(const struct pmu_event *pe __maybe_unused);
+int arch_get_runtimeparam(const struct pmu_metric *pm);
 void metricgroup__rblist_exit(struct rblist *metric_events);
 
 int metricgroup__copy_metric_events(struct evlist *evlist, struct cgroup *cgrp,
-- 
2.39.0.246.g2a6d74b583-goog

