Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204B67911E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:39:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1HPM72Rfz3fCv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:39:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=daJy0BiU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=343vpywckdd4nwtljwxlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=daJy0BiU;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1HHn1X0Zz3cCy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 17:34:13 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5005ef73cf3so104066587b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 22:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DK7UbzSnn/fCTry8MC0KjThT6Uw6nJpHAqtdkJ16lYw=;
        b=daJy0BiUvSCpLzoxXfeS5P1AxnkH87A9M+OoTuAxkKUpPNTHpdy11izgscVDVLiIVd
         aRHNRAsiUoOThhZqmFqzqoS9yzeiYqPDlTljDYmVkksuyfm2keNJBa7eQEU2E1xahdZb
         xOQ9YDwH9I2Ot1zczQtaXy+YdsyE2zjGmGRe+YMRzPIxVNWYPW98WUMrTf/XwN2VI0qu
         NgM4YPGv4GfGoCJwPZpMcpN1RdIJIoC2FbY3YPJPeor+pfFnFMX1f//pJw8yYxn2/DFG
         WLebRe1dAHbZYFnHfcvIrVQ1aTwohLv1SopNL4PhcfD9kZOYavaeg7dk+NUYYVv1ZEQ8
         KNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DK7UbzSnn/fCTry8MC0KjThT6Uw6nJpHAqtdkJ16lYw=;
        b=FSCfdBoPaAUL1jmMcO9S9VRswr5nCclRIHA9Ku1pbQfWLRF/kivBz0Q0valVjQFk32
         V+KcmjaSIw8M79wBpT/rl0sCGppnNyBPQAXsgklOGdaykrEnuS8eMbS5N4tlos5vo7qq
         6TllKQt8qMlK6OjTwYDAlqVVoeIJJsReLQRnYJ2Nxm4wynRy8YL0XP3b49maOGfofsFD
         +oFASn/UEEe1+OtxmuX7N4xBYbhWgzSQVf2TxHZTbJuj7eRfCOWcYurz6+Env6lJsc79
         DtITLgoBoKkdssO64NbVfUG7xDmKVZbXkHHWGRDaJXk6wyFsb3kMw5qzhdCozLbDrlH8
         GwGA==
X-Gm-Message-State: AFqh2kqi+Qsoltaz7jwtV/WlkznQuJE+zgVPacRCcnWli8hE1w8urKv1
	nyGYAMocT4cRURjqXfwNRQsRz9TJWv/5
X-Google-Smtp-Source: AMrXdXv6lRQBSw7ZRqlVM1I4vfVoqpJFUPIaRNX51qtF5X2vADbacQfs6psN89AGcFPiXBGNACuhimAdDG2L
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:460d:1b4a:acb8:ae9a])
 (user=irogers job=sendgmr) by 2002:a25:5050:0:b0:7c7:fad2:a68b with SMTP id
 e77-20020a255050000000b007c7fad2a68bmr2713645ybb.609.1674542051147; Mon, 23
 Jan 2023 22:34:11 -0800 (PST)
Date: Mon, 23 Jan 2023 22:33:14 -0800
In-Reply-To: <20230124063320.668917-1-irogers@google.com>
Message-Id: <20230124063320.668917-6-irogers@google.com>
Mime-Version: 1.0
References: <20230124063320.668917-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Subject: [PATCH v3 05/11] perf pmu-events: Separate the metrics from events
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
2.39.0.246.g2a6d74b583-goog

