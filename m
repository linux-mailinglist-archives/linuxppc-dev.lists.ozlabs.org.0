Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F79667912C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1HTc3vP5z3fBQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:42:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o7By1tJ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3axzpywckdfwclia8lmaiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o7By1tJ5;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1HJL2Fk8z3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 17:34:42 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id k15-20020a5b0a0f000000b007eba3f8e3baso15243343ybq.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 22:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+kWl/Zu/sHr3tNN8ZKD9w5SVq33rPhQduND1mnqdOQ=;
        b=o7By1tJ51LSm0jP/evI2eFkP434E08AUeryBUF49IyjBaGFXrBpFABHk7UumyejqO7
         ZsDyQyAZGJy3efNocvz+gGf+Fu4/QhxaH+xVP8wNU4UcHJE1N2ZUMZ5d2r+21gojyLAg
         gxiuuzgJ1K8EClyVsshyRuqxvm+eB9EO41hIDAyhlntQB7AnVKXyeESRqR5zMNYCtIFM
         c5n4+EuqYTHUqgcuyw/yM7rQCzeIr22BpRw2KwLKR1iue3wziowzLtC4WV26DtMDi0SX
         a8Y1rTf0am+PU0CoWMmtVsaBJvfvNwEE3Z5lm/2LLbiWGLQ0voO9cewVD+9iRkfZW8kd
         kcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+kWl/Zu/sHr3tNN8ZKD9w5SVq33rPhQduND1mnqdOQ=;
        b=h6WkrKXit+jDf8fQ0bF7Jny+3JE8Cy9+j6hp8h1ZzS/XHzt0W0TIFLwp3teVWHix6x
         AWEVlI8WPpD1I9omt8jTpTFUZpXolu4Efzlbd0OsiW+8ze3cec+Jj2ThXob/Xz7VCpbD
         js2lCW1g5YDDA6q2uPu92AStBsxlicX20dRAGZ3HXQOUC5CZuMt/nfoIDAs8oV6c6omW
         c3EhxAKVEMPIb5nM+v/52ADEJH73OrdkqIQ3AJFq/8N6h55DzXcgx4fZUmpS7TldOyt7
         YOjwnF8AM978FkAZnraQK97GVKUWfe4lyMrEY9xtLcYXXK3nCjoqxouaxU4TefyvB6J6
         OYZg==
X-Gm-Message-State: AFqh2kpiFT7ivKCC4E6Zh5cCRb6RdIBj25+Y0Sntay8obCDOI2qexURG
	/myCiJiX9CP73fL+medB0T7qKzPPsfL2
X-Google-Smtp-Source: AMrXdXsQBj98Z0aukF0OeC0p/jC8W0NLOIyZ3LcuBCTv83MbeP5W5UIss1aM4+UA1Kejr4QXY64zrNvdqFDh
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:460d:1b4a:acb8:ae9a])
 (user=irogers job=sendgmr) by 2002:a81:30f:0:b0:47a:5824:f813 with SMTP id
 15-20020a81030f000000b0047a5824f813mr3149056ywd.496.1674542081769; Mon, 23
 Jan 2023 22:34:41 -0800 (PST)
Date: Mon, 23 Jan 2023 22:33:18 -0800
In-Reply-To: <20230124063320.668917-1-irogers@google.com>
Message-Id: <20230124063320.668917-10-irogers@google.com>
Mime-Version: 1.0
References: <20230124063320.668917-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Subject: [PATCH v3 09/11] perf pmu-events: Introduce pmu_metrics_table
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

Add a metrics table that is just a cast from pmu_events_table. This
changes the APIs so that event and metric usage of the underlying
table is different. For the no jevents case the tables are already
separate, later changes will separate the tables for the jevents case.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/util/pmu.c         | 11 +++++-
 tools/perf/pmu-events/empty-pmu-events.c | 21 +++++-----
 tools/perf/pmu-events/jevents.py         | 21 +++++++---
 tools/perf/pmu-events/pmu-events.h       | 10 +++--
 tools/perf/tests/expand-cgroup.c         |  2 +-
 tools/perf/tests/parse-metric.c          |  2 +-
 tools/perf/tests/pmu-events.c            |  5 ++-
 tools/perf/util/metricgroup.c            | 50 ++++++++++++------------
 tools/perf/util/metricgroup.h            |  2 +-
 tools/perf/util/pmu.c                    |  5 +++
 tools/perf/util/pmu.h                    |  1 +
 11 files changed, 76 insertions(+), 54 deletions(-)

diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
index 801bf52e2ea6..2779840d8896 100644
--- a/tools/perf/arch/arm64/util/pmu.c
+++ b/tools/perf/arch/arm64/util/pmu.c
@@ -22,7 +22,14 @@ static struct perf_pmu *pmu__find_core_pmu(void)
 			return NULL;
 
 		return pmu;
-	}
+}
+
+const struct pmu_metrics_table *pmu_metrics_table__find(void)
+{
+	struct perf_pmu *pmu = pmu__find_core_pmu();
+
+	if (pmu)
+		return perf_pmu__find_metrics_table(pmu);
 
 	return NULL;
 }
@@ -32,7 +39,7 @@ const struct pmu_events_table *pmu_events_table__find(void)
 	struct perf_pmu *pmu = pmu__find_core_pmu();
 
 	if (pmu)
-		return perf_pmu__find_table(pmu);
+		return perf_pmu__find_events_table(pmu);
 
 	return NULL;
 }
diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 10bd4943ebf8..a938b74cf487 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -278,13 +278,11 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_ev
 	return 0;
 }
 
-int pmu_events_table_for_each_metric(const struct pmu_events_table *etable, pmu_metric_iter_fn fn,
-				     void *data)
+int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *table, pmu_metric_iter_fn fn,
+				      void *data)
 {
-	struct pmu_metrics_table *table = (struct pmu_metrics_table *)etable;
-
 	for (const struct pmu_metric *pm = &table->entries[0]; pm->metric_expr; pm++) {
-		int ret = fn(pm, etable, data);
+		int ret = fn(pm, table, data);
 
 		if (ret)
 			return ret;
@@ -320,9 +318,9 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
 	return table;
 }
 
-const struct pmu_events_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
+const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
 {
-	const struct pmu_events_table *table = NULL;
+	const struct pmu_metrics_table *table = NULL;
 	char *cpuid = perf_pmu__getcpuid(pmu);
 	int i;
 
@@ -340,7 +338,7 @@ const struct pmu_events_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu
 			break;
 
 		if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
-			table = (const struct pmu_events_table *)&map->metric_table;
+			table = &map->metric_table;
 			break;
 		}
 	}
@@ -359,13 +357,13 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
 	return NULL;
 }
 
-const struct pmu_events_table *find_core_metrics_table(const char *arch, const char *cpuid)
+const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
 {
 	for (const struct pmu_events_map *tables = &pmu_events_map[0];
 	     tables->arch;
 	     tables++) {
 		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
-			return (const struct pmu_events_table *)&tables->metric_table;
+			return &tables->metric_table;
 	}
 	return NULL;
 }
@@ -386,8 +384,7 @@ int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
 	for (const struct pmu_events_map *tables = &pmu_events_map[0];
 	     tables->arch;
 	     tables++) {
-		int ret = pmu_events_table_for_each_metric(
-			(const struct pmu_events_table *)&tables->metric_table, fn, data);
+		int ret = pmu_metrics_table_for_each_metric(&tables->metric_table, fn, data);
 
 		if (ret)
 			return ret;
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 5f8d490c7269..d83cc94af51f 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -611,10 +611,12 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table,
         return 0;
 }
 
-int pmu_events_table_for_each_metric(const struct pmu_events_table *table,
+int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *mtable,
                                      pmu_metric_iter_fn fn,
                                      void *data)
 {
+        const struct pmu_events_table *table = (const struct pmu_events_table *)mtable;
+
         for (size_t i = 0; i < table->length; i++) {
                 struct pmu_metric pm;
                 int ret;
@@ -622,7 +624,7 @@ int pmu_events_table_for_each_metric(const struct pmu_events_table *table,
                 decompress_metric(table->entries[i].offset, &pm);
                 if (!pm.metric_expr)
                         continue;
-                ret = fn(&pm, table, data);
+                ret = fn(&pm, mtable, data);
                 if (ret)
                         return ret;
         }
@@ -656,6 +658,11 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
         return table;
 }
 
+const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
+{
+        return (struct pmu_metrics_table *)perf_pmu__find_events_table(pmu);
+}
+
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
 {
         for (const struct pmu_events_map *tables = &pmu_events_map[0];
@@ -667,9 +674,9 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
         return NULL;
 }
 
-const struct pmu_events_table *find_core_metrics_table(const char *arch, const char *cpuid)
+const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
 {
-        return (struct pmu_events_table *)find_core_events_table(arch, cpuid);
+       return (struct pmu_metrics_table *)find_core_events_table(arch, cpuid);
 }
 
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
@@ -690,7 +697,8 @@ int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
         for (const struct pmu_events_map *tables = &pmu_events_map[0];
              tables->arch;
              tables++) {
-                int ret = pmu_events_table_for_each_metric(&tables->table, fn, data);
+                int ret = pmu_metrics_table_for_each_metric(
+                                (struct pmu_metrics_table *)&tables->table, fn, data);
 
                 if (ret)
                         return ret;
@@ -727,7 +735,8 @@ int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data)
         for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
              tables->name;
              tables++) {
-                int ret = pmu_events_table_for_each_metric(&tables->table, fn, data);
+                int ret = pmu_metrics_table_for_each_metric(
+                                (struct pmu_metrics_table *)&tables->table, fn, data);
 
                 if (ret)
                         return ret;
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index dca32979d6a4..b7d4a66b8ad2 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -39,28 +39,30 @@ struct pmu_metric {
 };
 
 struct pmu_events_table;
+struct pmu_metrics_table;
 
 typedef int (*pmu_event_iter_fn)(const struct pmu_event *pe,
 				 const struct pmu_events_table *table,
 				 void *data);
 
 typedef int (*pmu_metric_iter_fn)(const struct pmu_metric *pm,
-				  const struct pmu_events_table *table,
+				  const struct pmu_metrics_table *table,
 				  void *data);
 
 int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_event_iter_fn fn,
 				    void *data);
-int pmu_events_table_for_each_metric(const struct pmu_events_table *table, pmu_metric_iter_fn fn,
+int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *table, pmu_metric_iter_fn fn,
 				     void *data);
 
 const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu);
-const struct pmu_events_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu);
+const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu);
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid);
-const struct pmu_events_table *find_core_metrics_table(const char *arch, const char *cpuid);
+const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid);
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
 int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data);
 
 const struct pmu_events_table *find_sys_events_table(const char *name);
+const struct pmu_metrics_table *find_sys_metrics_table(const char *name);
 int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data);
 int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data);
 
diff --git a/tools/perf/tests/expand-cgroup.c b/tools/perf/tests/expand-cgroup.c
index 4f3195b84463..672a27f37060 100644
--- a/tools/perf/tests/expand-cgroup.c
+++ b/tools/perf/tests/expand-cgroup.c
@@ -180,7 +180,7 @@ static int expand_metric_events(void)
 	struct evlist *evlist;
 	struct rblist metric_events;
 	const char metric_str[] = "CPI";
-	const struct pmu_events_table *pme_test;
+	const struct pmu_metrics_table *pme_test;
 
 	evlist = evlist__new();
 	TEST_ASSERT_VAL("failed to get evlist", evlist);
diff --git a/tools/perf/tests/parse-metric.c b/tools/perf/tests/parse-metric.c
index 6c527cd805fe..9fec6040950c 100644
--- a/tools/perf/tests/parse-metric.c
+++ b/tools/perf/tests/parse-metric.c
@@ -72,7 +72,7 @@ static int __compute_metric(const char *name, struct value *vals,
 	struct rblist metric_events = {
 		.nr_entries = 0,
 	};
-	const struct pmu_events_table *pme_test;
+	const struct pmu_metrics_table *pme_test;
 	struct perf_cpu_map *cpus;
 	struct runtime_stat st;
 	struct evlist *evlist;
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index c2b3ada57cbc..9f2e385e0991 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -813,7 +813,8 @@ struct metric {
 	struct metric_ref metric_ref;
 };
 
-static int test__parsing_callback(const struct pmu_metric *pm, const struct pmu_events_table *table,
+static int test__parsing_callback(const struct pmu_metric *pm,
+				  const struct pmu_metrics_table *table,
 				  void *data)
 {
 	int *failures = data;
@@ -995,7 +996,7 @@ static int metric_parse_fake(const char *metric_name, const char *str)
 }
 
 static int test__parsing_fake_callback(const struct pmu_metric *pm,
-				       const struct pmu_events_table *table __maybe_unused,
+				       const struct pmu_metrics_table *table __maybe_unused,
 				       void *data __maybe_unused)
 {
 	return metric_parse_fake(pm->metric_name, pm->metric_expr);
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 47fd02af66f1..46314ad571e4 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -457,7 +457,7 @@ struct metricgroup_iter_data {
 };
 
 static int metricgroup__sys_event_iter(const struct pmu_metric *pm,
-				       const struct pmu_events_table *table,
+				       const struct pmu_metrics_table *table,
 				       void *data)
 {
 	struct metricgroup_iter_data *d = data;
@@ -477,7 +477,7 @@ static int metricgroup__sys_event_iter(const struct pmu_metric *pm,
 }
 
 static int metricgroup__add_to_mep_groups_callback(const struct pmu_metric *pm,
-						const struct pmu_events_table *table __maybe_unused,
+						const struct pmu_metrics_table *table __maybe_unused,
 						void *vdata)
 {
 	struct rblist *groups = vdata;
@@ -488,16 +488,16 @@ static int metricgroup__add_to_mep_groups_callback(const struct pmu_metric *pm,
 void metricgroup__print(const struct print_callbacks *print_cb, void *print_state)
 {
 	struct rblist groups;
-	const struct pmu_events_table *table;
+	const struct pmu_metrics_table *table;
 	struct rb_node *node, *next;
 
 	rblist__init(&groups);
 	groups.node_new = mep_new;
 	groups.node_cmp = mep_cmp;
 	groups.node_delete = mep_delete;
-	table = pmu_events_table__find();
+	table = pmu_metrics_table__find();
 	if (table) {
-		pmu_events_table_for_each_metric(table,
+		pmu_metrics_table_for_each_metric(table,
 						 metricgroup__add_to_mep_groups_callback,
 						 &groups);
 	}
@@ -765,11 +765,11 @@ struct metricgroup_add_iter_data {
 	bool system_wide;
 	struct metric *root_metric;
 	const struct visited_metric *visited;
-	const struct pmu_events_table *table;
+	const struct pmu_metrics_table *table;
 };
 
 static bool metricgroup__find_metric(const char *metric,
-				     const struct pmu_events_table *table,
+				     const struct pmu_metrics_table *table,
 				     struct pmu_metric *pm);
 
 static int add_metric(struct list_head *metric_list,
@@ -780,7 +780,7 @@ static int add_metric(struct list_head *metric_list,
 		      bool system_wide,
 		      struct metric *root_metric,
 		      const struct visited_metric *visited,
-		      const struct pmu_events_table *table);
+		      const struct pmu_metrics_table *table);
 
 /**
  * resolve_metric - Locate metrics within the root metric and recursively add
@@ -807,7 +807,7 @@ static int resolve_metric(struct list_head *metric_list,
 			  bool system_wide,
 			  struct metric *root_metric,
 			  const struct visited_metric *visited,
-			  const struct pmu_events_table *table)
+			  const struct pmu_metrics_table *table)
 {
 	struct hashmap_entry *cur;
 	size_t bkt;
@@ -889,7 +889,7 @@ static int __add_metric(struct list_head *metric_list,
 			bool system_wide,
 			struct metric *root_metric,
 			const struct visited_metric *visited,
-			const struct pmu_events_table *table)
+			const struct pmu_metrics_table *table)
 {
 	const struct visited_metric *vm;
 	int ret;
@@ -982,7 +982,7 @@ struct metricgroup__find_metric_data {
 };
 
 static int metricgroup__find_metric_callback(const struct pmu_metric *pm,
-					     const struct pmu_events_table *table  __maybe_unused,
+					     const struct pmu_metrics_table *table  __maybe_unused,
 					     void *vdata)
 {
 	struct metricgroup__find_metric_data *data = vdata;
@@ -995,7 +995,7 @@ static int metricgroup__find_metric_callback(const struct pmu_metric *pm,
 }
 
 static bool metricgroup__find_metric(const char *metric,
-				     const struct pmu_events_table *table,
+				     const struct pmu_metrics_table *table,
 				     struct pmu_metric *pm)
 {
 	struct metricgroup__find_metric_data data = {
@@ -1003,7 +1003,7 @@ static bool metricgroup__find_metric(const char *metric,
 		.pm = pm,
 	};
 
-	return pmu_events_table_for_each_metric(table, metricgroup__find_metric_callback, &data)
+	return pmu_metrics_table_for_each_metric(table, metricgroup__find_metric_callback, &data)
 		? true : false;
 }
 
@@ -1015,7 +1015,7 @@ static int add_metric(struct list_head *metric_list,
 		      bool system_wide,
 		      struct metric *root_metric,
 		      const struct visited_metric *visited,
-		      const struct pmu_events_table *table)
+		      const struct pmu_metrics_table *table)
 {
 	int ret = 0;
 
@@ -1045,7 +1045,7 @@ static int add_metric(struct list_head *metric_list,
 }
 
 static int metricgroup__add_metric_sys_event_iter(const struct pmu_metric *pm,
-						const struct pmu_events_table *table __maybe_unused,
+						const struct pmu_metrics_table *table __maybe_unused,
 						void *data)
 {
 	struct metricgroup_add_iter_data *d = data;
@@ -1105,7 +1105,7 @@ struct metricgroup__add_metric_data {
 };
 
 static int metricgroup__add_metric_callback(const struct pmu_metric *pm,
-					    const struct pmu_events_table *table,
+					    const struct pmu_metrics_table *table,
 					    void *vdata)
 {
 	struct metricgroup__add_metric_data *data = vdata;
@@ -1143,7 +1143,7 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
 				   const char *user_requested_cpu_list,
 				   bool system_wide,
 				   struct list_head *metric_list,
-				   const struct pmu_events_table *table)
+				   const struct pmu_metrics_table *table)
 {
 	LIST_HEAD(list);
 	int ret;
@@ -1163,7 +1163,7 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
 		 * Iterate over all metrics seeing if metric matches either the
 		 * name or group. When it does add the metric to the list.
 		 */
-		ret = pmu_events_table_for_each_metric(table, metricgroup__add_metric_callback,
+		ret = pmu_metrics_table_for_each_metric(table, metricgroup__add_metric_callback,
 						       &data);
 		if (ret)
 			goto out;
@@ -1219,7 +1219,7 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
 static int metricgroup__add_metric_list(const char *list, bool metric_no_group,
 					const char *user_requested_cpu_list,
 					bool system_wide, struct list_head *metric_list,
-					const struct pmu_events_table *table)
+					const struct pmu_metrics_table *table)
 {
 	char *list_itr, *list_copy, *metric_name, *modifier;
 	int ret, count = 0;
@@ -1429,7 +1429,7 @@ static int parse_groups(struct evlist *perf_evlist, const char *str,
 			bool system_wide,
 			struct perf_pmu *fake_pmu,
 			struct rblist *metric_events_list,
-			const struct pmu_events_table *table)
+			const struct pmu_metrics_table *table)
 {
 	struct evlist *combined_evlist = NULL;
 	LIST_HEAD(metric_list);
@@ -1577,7 +1577,7 @@ int metricgroup__parse_groups(struct evlist *perf_evlist,
 			      bool system_wide,
 			      struct rblist *metric_events)
 {
-	const struct pmu_events_table *table = pmu_events_table__find();
+	const struct pmu_metrics_table *table = pmu_metrics_table__find();
 
 	if (!table)
 		return -EINVAL;
@@ -1588,7 +1588,7 @@ int metricgroup__parse_groups(struct evlist *perf_evlist,
 }
 
 int metricgroup__parse_groups_test(struct evlist *evlist,
-				   const struct pmu_events_table *table,
+				   const struct pmu_metrics_table *table,
 				   const char *str,
 				   bool metric_no_group,
 				   bool metric_no_merge,
@@ -1601,7 +1601,7 @@ int metricgroup__parse_groups_test(struct evlist *evlist,
 }
 
 static int metricgroup__has_metric_callback(const struct pmu_metric *pm,
-					    const struct pmu_events_table *table __maybe_unused,
+					    const struct pmu_metrics_table *table __maybe_unused,
 					    void *vdata)
 {
 	const char *metric = vdata;
@@ -1617,12 +1617,12 @@ static int metricgroup__has_metric_callback(const struct pmu_metric *pm,
 
 bool metricgroup__has_metric(const char *metric)
 {
-	const struct pmu_events_table *table = pmu_events_table__find();
+	const struct pmu_metrics_table *table = pmu_metrics_table__find();
 
 	if (!table)
 		return false;
 
-	return pmu_events_table_for_each_metric(table, metricgroup__has_metric_callback,
+	return pmu_metrics_table_for_each_metric(table, metricgroup__has_metric_callback,
 						(void *)metric) ? true : false;
 }
 
diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
index b1f186d0f514..84030321a057 100644
--- a/tools/perf/util/metricgroup.h
+++ b/tools/perf/util/metricgroup.h
@@ -73,7 +73,7 @@ int metricgroup__parse_groups(struct evlist *perf_evlist,
 			      bool system_wide,
 			      struct rblist *metric_events);
 int metricgroup__parse_groups_test(struct evlist *evlist,
-				   const struct pmu_events_table *table,
+				   const struct pmu_metrics_table *table,
 				   const char *str,
 				   bool metric_no_group,
 				   bool metric_no_merge,
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index f8c214d8815f..c256b29defad 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -655,6 +655,11 @@ __weak const struct pmu_events_table *pmu_events_table__find(void)
 	return perf_pmu__find_events_table(NULL);
 }
 
+__weak const struct pmu_metrics_table *pmu_metrics_table__find(void)
+{
+	return perf_pmu__find_metrics_table(NULL);
+}
+
 /*
  * Suffix must be in form tok_{digits}, or tok{digits}, or same as pmu_name
  * to be valid.
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 64c596a358cc..6b770f17eb86 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -231,6 +231,7 @@ void pmu_add_cpu_aliases_table(struct list_head *head, struct perf_pmu *pmu,
 
 char *perf_pmu__getcpuid(struct perf_pmu *pmu);
 const struct pmu_events_table *pmu_events_table__find(void);
+const struct pmu_metrics_table *pmu_metrics_table__find(void);
 bool pmu_uncore_alias_match(const char *pmu_name, const char *name);
 void perf_pmu_free_alias(struct perf_pmu_alias *alias);
 
-- 
2.39.0.246.g2a6d74b583-goog

