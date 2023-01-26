Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB0367C252
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:24:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NKg1qcPz3fNg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:24:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=T9dqkcpO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3mtxrywckdekt2zrp23rzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=T9dqkcpO;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2ND41hkBz3fDB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:19:48 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-482d3bf0266so4088547b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZE9RIC7RyAmkUhdpIM/73Cg+F1xdulHeeW/50qQvxg=;
        b=T9dqkcpOGmQYjNjO3zs7fWbeZ5UKZMDK+0oYbR4xoKmTcaqkO64Y/m3Eql3G1t7knl
         COKHbWtjdmqI/HAoK9kG0jEsctbCqdy/bGY4fBNdLSZmAFG+bKDYSW89B1NGtM89ZO7u
         dniZavSNjMyXekTA0y/iYXHblUlnMl+WkQ/XG3YZFsR0b9Ov7AalTBdm27WkwQU+D26q
         SU9trgw4qq+CWplmG1zXASsItwi5V2rrVLiN8w11kvOjxLc/xZr0z++xweMdRuIXlwcg
         09c/RVJcK1J7tvDiw5GdwV1C/c9P0dVxa8G2PHap/M8ZMFw14fMiDO1uBlxQIpSKb3FQ
         D+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZE9RIC7RyAmkUhdpIM/73Cg+F1xdulHeeW/50qQvxg=;
        b=m6jXV5xXV8+1IiXdjpVJ77nxCSUB7fqcvTNf1naZW+3Mk8C6EuQGK6RIMsKYnQPR2o
         CFUGR6B1Tcv5K045Li5qK8uKmtP9O1rTu0rWKJqufhlBI7OauPvDDA/yY3wFleMlt8af
         hbDtDcCC2Q4e7i7mII3IwzOBCGJSTqXaXlY0/iLfamJRhO//Htgq267dRPUouVrlyitN
         hIEyzugkz9ZberKpuBfm2JnJQbdzCdEYIaQ1qpjQuLqhNNMAOqBs3vZJUrvxZ0nwvZ0d
         nd1p1/tnDsrfhgVUPXuWbEMQbmvJCIF725/Z/Un9G/+w3eSgpvC3goaQZbdHK/qXNLgv
         HhGw==
X-Gm-Message-State: AFqh2koqbznPgI+jT6BTlUnmh13uH9R8yJZmwduXRdyUfyAPhaz0vol0
	kf2Ro7KpnN9vnOO5tWDf5zeKPd5W9F1s
X-Google-Smtp-Source: AMrXdXsMUZOqBWecBMHGtFCKQpBS2mPiPRZXdyAstRgv3Wj8cgn4svftkv50YULmV0dFxfb7Wv9dcRNGh/DQ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a25:9291:0:b0:799:6d5f:d851 with SMTP id
 y17-20020a259291000000b007996d5fd851mr4340401ybl.537.1674695986150; Wed, 25
 Jan 2023 17:19:46 -0800 (PST)
Date: Wed, 25 Jan 2023 17:18:47 -0800
In-Reply-To: <20230126011854.198243-1-irogers@google.com>
Message-Id: <20230126011854.198243-6-irogers@google.com>
Mime-Version: 1.0
References: <20230126011854.198243-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 05/12] perf pmu-events: Separate the metrics from events
 for no jevents
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

Separate the event and metric table when building without jevents. Add
find_core_metrics_table and perf_pmu__find_metrics_table while
renaming existing utilities to be event specific, so that users can
find the right table for their need.

Reviewed-by: John Garry <john.g.garry@oracle.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/empty-pmu-events.c | 88 ++++++++++++++++++------
 tools/perf/pmu-events/jevents.py         |  7 +-
 tools/perf/pmu-events/pmu-events.h       |  4 +-
 tools/perf/tests/expand-cgroup.c         |  2 +-
 tools/perf/tests/parse-metric.c          |  2 +-
 tools/perf/util/pmu.c                    |  4 +-
 6 files changed, 79 insertions(+), 28 deletions(-)

diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 4e39d1a8d6d6..10bd4943ebf8 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -11,7 +11,7 @@
 #include <string.h>
 #include <stddef.h>
 
-static const struct pmu_event pme_test_soc_cpu[] = {
+static const struct pmu_event pmu_events__test_soc_cpu[] = {
 	{
 		.name = "l3_cache_rd",
 		.event = "event=0x40",
@@ -105,6 +105,14 @@ static const struct pmu_event pme_test_soc_cpu[] = {
 		.desc = "L2 BTB Correction",
 		.topic = "branch",
 	},
+	{
+		.name = 0,
+		.event = 0,
+		.desc = 0,
+	},
+};
+
+static const struct pmu_metric pmu_metrics__test_soc_cpu[] = {
 	{
 		.metric_expr	= "1 / IPC",
 		.metric_name	= "CPI",
@@ -170,9 +178,8 @@ static const struct pmu_event pme_test_soc_cpu[] = {
 		.metric_name	= "L1D_Cache_Fill_BW",
 	},
 	{
-		.name = 0,
-		.event = 0,
-		.desc = 0,
+		.metric_expr = 0,
+		.metric_name = 0,
 	},
 };
 
@@ -197,7 +204,8 @@ struct pmu_metrics_table {
 struct pmu_events_map {
 	const char *arch;
 	const char *cpuid;
-	const struct pmu_events_table table;
+	const struct pmu_events_table event_table;
+	const struct pmu_metrics_table metric_table;
 };
 
 /*
@@ -208,12 +216,14 @@ static const struct pmu_events_map pmu_events_map[] = {
 	{
 		.arch = "testarch",
 		.cpuid = "testcpu",
-		.table = { pme_test_soc_cpu },
+		.event_table = { pmu_events__test_soc_cpu },
+		.metric_table = { pmu_metrics__test_soc_cpu },
 	},
 	{
 		.arch = 0,
 		.cpuid = 0,
-		.table = { 0 },
+		.event_table = { 0 },
+		.metric_table = { 0 },
 	},
 };
 
@@ -259,12 +269,9 @@ static const struct pmu_sys_events pmu_sys_event_tables[] = {
 int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_event_iter_fn fn,
 				    void *data)
 {
-	for (const struct pmu_event *pe = &table->entries[0]; pe->name || pe->metric_expr; pe++) {
-		int ret;
+	for (const struct pmu_event *pe = &table->entries[0]; pe->name; pe++) {
+		int ret = fn(pe, table, data);
 
-		if (!pe->name)
-			continue;
-		ret = fn(pe, table, data);
 		if (ret)
 			return ret;
 	}
@@ -276,19 +283,44 @@ int pmu_events_table_for_each_metric(const struct pmu_events_table *etable, pmu_
 {
 	struct pmu_metrics_table *table = (struct pmu_metrics_table *)etable;
 
-	for (const struct pmu_metric *pm = &table->entries[0]; pm->name || pm->metric_expr; pm++) {
-		int ret;
+	for (const struct pmu_metric *pm = &table->entries[0]; pm->metric_expr; pm++) {
+		int ret = fn(pm, etable, data);
 
-		if (!pm->metric_expr)
-			continue;
-		ret = fn(pm, etable, data);
 		if (ret)
 			return ret;
 	}
 	return 0;
 }
 
-const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
+const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
+{
+	const struct pmu_events_table *table = NULL;
+	char *cpuid = perf_pmu__getcpuid(pmu);
+	int i;
+
+	/* on some platforms which uses cpus map, cpuid can be NULL for
+	 * PMUs other than CORE PMUs.
+	 */
+	if (!cpuid)
+		return NULL;
+
+	i = 0;
+	for (;;) {
+		const struct pmu_events_map *map = &pmu_events_map[i++];
+
+		if (!map->cpuid)
+			break;
+
+		if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
+			table = &map->event_table;
+			break;
+		}
+	}
+	free(cpuid);
+	return table;
+}
+
+const struct pmu_events_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
 {
 	const struct pmu_events_table *table = NULL;
 	char *cpuid = perf_pmu__getcpuid(pmu);
@@ -308,7 +340,7 @@ const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
 			break;
 
 		if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
-			table = &map->table;
+			table = (const struct pmu_events_table *)&map->metric_table;
 			break;
 		}
 	}
@@ -322,7 +354,18 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
 	     tables->arch;
 	     tables++) {
 		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
-			return &tables->table;
+			return &tables->event_table;
+	}
+	return NULL;
+}
+
+const struct pmu_events_table *find_core_metrics_table(const char *arch, const char *cpuid)
+{
+	for (const struct pmu_events_map *tables = &pmu_events_map[0];
+	     tables->arch;
+	     tables++) {
+		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
+			return (const struct pmu_events_table *)&tables->metric_table;
 	}
 	return NULL;
 }
@@ -330,7 +373,7 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
 {
 	for (const struct pmu_events_map *tables = &pmu_events_map[0]; tables->arch; tables++) {
-		int ret = pmu_events_table_for_each_event(&tables->table, fn, data);
+		int ret = pmu_events_table_for_each_event(&tables->event_table, fn, data);
 
 		if (ret)
 			return ret;
@@ -343,7 +386,8 @@ int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
 	for (const struct pmu_events_map *tables = &pmu_events_map[0];
 	     tables->arch;
 	     tables++) {
-		int ret = pmu_events_table_for_each_metric(&tables->table, fn, data);
+		int ret = pmu_events_table_for_each_metric(
+			(const struct pmu_events_table *)&tables->metric_table, fn, data);
 
 		if (ret)
 			return ret;
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 858787a12302..8df14ab14fcf 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -625,7 +625,7 @@ int pmu_events_table_for_each_metric(const struct pmu_events_table *table,
         return 0;
 }
 
-const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
+const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
 {
         const struct pmu_events_table *table = NULL;
         char *cpuid = perf_pmu__getcpuid(pmu);
@@ -663,6 +663,11 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
         return NULL;
 }
 
+const struct pmu_events_table *find_core_metrics_table(const char *arch, const char *cpuid)
+{
+        return (struct pmu_events_table *)find_core_events_table(arch, cpuid);
+}
+
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
 {
         for (const struct pmu_events_map *tables = &pmu_events_map[0];
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index 45c0f508af23..e2cd3e61acef 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -63,8 +63,10 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_ev
 int pmu_events_table_for_each_metric(const struct pmu_events_table *table, pmu_metric_iter_fn fn,
 				     void *data);
 
-const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu);
+const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu);
+const struct pmu_events_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu);
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid);
+const struct pmu_events_table *find_core_metrics_table(const char *arch, const char *cpuid);
 int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
 int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data);
 
diff --git a/tools/perf/tests/expand-cgroup.c b/tools/perf/tests/expand-cgroup.c
index 51fb5f34c1dd..4f3195b84463 100644
--- a/tools/perf/tests/expand-cgroup.c
+++ b/tools/perf/tests/expand-cgroup.c
@@ -186,7 +186,7 @@ static int expand_metric_events(void)
 	TEST_ASSERT_VAL("failed to get evlist", evlist);
 
 	rblist__init(&metric_events);
-	pme_test = find_core_events_table("testarch", "testcpu");
+	pme_test = find_core_metrics_table("testarch", "testcpu");
 	ret = metricgroup__parse_groups_test(evlist, pme_test, metric_str,
 					     false, false, &metric_events);
 	if (ret < 0) {
diff --git a/tools/perf/tests/parse-metric.c b/tools/perf/tests/parse-metric.c
index 21b7ac00d798..6c527cd805fe 100644
--- a/tools/perf/tests/parse-metric.c
+++ b/tools/perf/tests/parse-metric.c
@@ -96,7 +96,7 @@ static int __compute_metric(const char *name, struct value *vals,
 	runtime_stat__init(&st);
 
 	/* Parse the metric into metric_events list. */
-	pme_test = find_core_events_table("testarch", "testcpu");
+	pme_test = find_core_metrics_table("testarch", "testcpu");
 	err = metricgroup__parse_groups_test(evlist, pme_test, name,
 					     false, false,
 					     &metric_events);
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 8abf5b8439a7..3a67b17b4a16 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -663,7 +663,7 @@ char *perf_pmu__getcpuid(struct perf_pmu *pmu)
 
 __weak const struct pmu_events_table *pmu_events_table__find(void)
 {
-	return perf_pmu__find_table(NULL);
+	return perf_pmu__find_events_table(NULL);
 }
 
 /*
@@ -794,7 +794,7 @@ static void pmu_add_cpu_aliases(struct list_head *head, struct perf_pmu *pmu)
 {
 	const struct pmu_events_table *table;
 
-	table = perf_pmu__find_table(pmu);
+	table = perf_pmu__find_events_table(pmu);
 	if (!table)
 		return;
 
-- 
2.39.1.456.gfc5497dd1b-goog

