Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D43679127
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:41:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1HRZ0WSLz3fKx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:40:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rsz1NCmD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=38nvpywckde0x63vt67v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rsz1NCmD;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1HJ46VwGz3cd8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 17:34:28 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id k15-20020a5b0a0f000000b007eba3f8e3baso15242943ybq.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 22:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mV7cd0PttK0+CvZwdwIN1L+qh3nyibbPKOb9QqB52t0=;
        b=Rsz1NCmD4FsTwujPvvNFULUb3G6Qt8mtfR3s9eM19Q/3ptMnz7GtWJABmlo355EwF9
         /9tolkcmpwpltwOuoPPmSHGI+g6qGwGL+oI6n6IeNAmSSrilJtpY7va0Usz6K+1lebwR
         UyD23kOD7mUwrZosJB1/nZ1Yf+2ShsVW3nN5o6+FeehqGYqB5mHyUafslJmskwDtmSlA
         AeHRnCsSvgzegm1pWJG357rG5UXlMnveRnv2UUFoV5QS5Zo4llus3J26YnsTnQEbDmjQ
         pI4a7tVg+edZxMmLkCwMJ54Q6ym0Li5gma1j41eYKJgGXc8KpTn1mjD7Wt3ecTfXjj7v
         /gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mV7cd0PttK0+CvZwdwIN1L+qh3nyibbPKOb9QqB52t0=;
        b=M17wf2mRZnBBgbC9Zuf9Y0eyHTO8WuTvvUR1Hee57Id3EiGGS8cFgQZeAUwWSiD1Jv
         UOpTrQ14m7MFFvSDW9OwS98+pOk3wiGMMEDBvTt8R/jvuaHag2uWwCJeSxFoMaxGBQ42
         FMBXsUIOjw1UF5QxV2DInILgTBU8so8Sr8hdz+QKddAjwb1ET2Ovqt6tdfEqmzo0MU8z
         NEs0Q7g5bJiRTyf/4UKgrcKOyydYtXTZXjw4mxwf25ZymsySc4uNZ4rnHNV+hC1xuKE8
         pmEuE8/LPOtmkr/RP2qykyybh6FsK3NjuRXUCaqeX04aTZXMqzbrLwaVmOer4BqlpBho
         /2sw==
X-Gm-Message-State: AFqh2krDIiISFo9FX3Ls6hqmDym0gy97vGlDCUMzU/EO9dH/xY8dEy3K
	T65erLkocXDY7aGoI+sttNWSlN+0/ZyD
X-Google-Smtp-Source: AMrXdXsPa4iefJ/f/nMKz0OxMzz8uNqcasB4ILJr+Oz387qo8FN3KAiJaOsPzKCmQQnLJPABw4nQpOS9vHGB
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:460d:1b4a:acb8:ae9a])
 (user=irogers job=sendgmr) by 2002:a81:7047:0:b0:4bc:e7dc:16bc with SMTP id
 l68-20020a817047000000b004bce7dc16bcmr3185257ywc.368.1674542066399; Mon, 23
 Jan 2023 22:34:26 -0800 (PST)
Date: Mon, 23 Jan 2023 22:33:16 -0800
In-Reply-To: <20230124063320.668917-1-irogers@google.com>
Message-Id: <20230124063320.668917-8-irogers@google.com>
Mime-Version: 1.0
References: <20230124063320.668917-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Subject: [PATCH v3 07/11] perf stat: Remove evsel metric_name/expr
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

Metrics are their own unit and these variables held broken metrics
previously and now just hold the value NULL. Remove code that used
these variables.

Reviewed-by: John Garry <john.g.garry@oracle.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-stat.c     |   1 -
 tools/perf/util/cgroup.c      |   1 -
 tools/perf/util/evsel.c       |   2 -
 tools/perf/util/evsel.h       |   2 -
 tools/perf/util/python.c      |   7 ---
 tools/perf/util/stat-shadow.c | 112 ----------------------------------
 tools/perf/util/stat.h        |   1 -
 7 files changed, 126 deletions(-)

diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 9f3e4b257516..5d18a5a6f662 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -2524,7 +2524,6 @@ int cmd_stat(int argc, const char **argv)
 					&stat_config.metric_events);
 		zfree(&metrics);
 	}
-	perf_stat__collect_metric_expr(evsel_list);
 	perf_stat__init_shadow_stats();
 
 	if (add_default_attributes())
diff --git a/tools/perf/util/cgroup.c b/tools/perf/util/cgroup.c
index cd978c240e0d..bfb13306d82c 100644
--- a/tools/perf/util/cgroup.c
+++ b/tools/perf/util/cgroup.c
@@ -481,7 +481,6 @@ int evlist__expand_cgroup(struct evlist *evlist, const char *str,
 		nr_cgroups++;
 
 		if (metric_events) {
-			perf_stat__collect_metric_expr(tmp_list);
 			if (metricgroup__copy_metric_events(tmp_list, cgrp,
 							    metric_events,
 							    &orig_metric_events) < 0)
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 8550638587e5..a90e998826e0 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -285,8 +285,6 @@ void evsel__init(struct evsel *evsel,
 	evsel->sample_size = __evsel__sample_size(attr->sample_type);
 	evsel__calc_id_pos(evsel);
 	evsel->cmdline_group_boundary = false;
-	evsel->metric_expr   = NULL;
-	evsel->metric_name   = NULL;
 	evsel->metric_events = NULL;
 	evsel->per_pkg_mask  = NULL;
 	evsel->collect_stat  = false;
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index d572be41b960..24cb807ef6ce 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -105,8 +105,6 @@ struct evsel {
 	 * metric fields are similar, but needs more care as they can have
 	 * references to other metric (evsel).
 	 */
-	const char *		metric_expr;
-	const char *		metric_name;
 	struct evsel		**metric_events;
 	struct evsel		*metric_leader;
 
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 9e5d881b0987..42e8b813d010 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -76,13 +76,6 @@ const char *perf_env__arch(struct perf_env *env __maybe_unused)
 	return NULL;
 }
 
-/*
- * Add this one here not to drag util/stat-shadow.c
- */
-void perf_stat__collect_metric_expr(struct evlist *evsel_list)
-{
-}
-
 /*
  * These ones are needed not to drag the PMU bandwagon, jevents generated
  * pmu_sys_event_tables, etc and evsel__find_pmu() is used so far just for
diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index cadb2df23c87..35ea4813f468 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -346,114 +346,6 @@ static const char *get_ratio_color(enum grc_type type, double ratio)
 	return color;
 }
 
-static struct evsel *perf_stat__find_event(struct evlist *evsel_list,
-						const char *name)
-{
-	struct evsel *c2;
-
-	evlist__for_each_entry (evsel_list, c2) {
-		if (!strcasecmp(c2->name, name) && !c2->collect_stat)
-			return c2;
-	}
-	return NULL;
-}
-
-/* Mark MetricExpr target events and link events using them to them. */
-void perf_stat__collect_metric_expr(struct evlist *evsel_list)
-{
-	struct evsel *counter, *leader, **metric_events, *oc;
-	bool found;
-	struct expr_parse_ctx *ctx;
-	struct hashmap_entry *cur;
-	size_t bkt;
-	int i;
-
-	ctx = expr__ctx_new();
-	if (!ctx) {
-		pr_debug("expr__ctx_new failed");
-		return;
-	}
-	evlist__for_each_entry(evsel_list, counter) {
-		bool invalid = false;
-
-		leader = evsel__leader(counter);
-		if (!counter->metric_expr)
-			continue;
-
-		expr__ctx_clear(ctx);
-		metric_events = counter->metric_events;
-		if (!metric_events) {
-			if (expr__find_ids(counter->metric_expr,
-					   counter->name,
-					   ctx) < 0)
-				continue;
-
-			metric_events = calloc(sizeof(struct evsel *),
-					       hashmap__size(ctx->ids) + 1);
-			if (!metric_events) {
-				expr__ctx_free(ctx);
-				return;
-			}
-			counter->metric_events = metric_events;
-		}
-
-		i = 0;
-		hashmap__for_each_entry(ctx->ids, cur, bkt) {
-			const char *metric_name = cur->pkey;
-
-			found = false;
-			if (leader) {
-				/* Search in group */
-				for_each_group_member (oc, leader) {
-					if (!strcasecmp(oc->name,
-							metric_name) &&
-						!oc->collect_stat) {
-						found = true;
-						break;
-					}
-				}
-			}
-			if (!found) {
-				/* Search ignoring groups */
-				oc = perf_stat__find_event(evsel_list,
-							   metric_name);
-			}
-			if (!oc) {
-				/* Deduping one is good enough to handle duplicated PMUs. */
-				static char *printed;
-
-				/*
-				 * Adding events automatically would be difficult, because
-				 * it would risk creating groups that are not schedulable.
-				 * perf stat doesn't understand all the scheduling constraints
-				 * of events. So we ask the user instead to add the missing
-				 * events.
-				 */
-				if (!printed ||
-				    strcasecmp(printed, metric_name)) {
-					fprintf(stderr,
-						"Add %s event to groups to get metric expression for %s\n",
-						metric_name,
-						counter->name);
-					free(printed);
-					printed = strdup(metric_name);
-				}
-				invalid = true;
-				continue;
-			}
-			metric_events[i++] = oc;
-			oc->collect_stat = true;
-		}
-		metric_events[i] = NULL;
-		if (invalid) {
-			free(metric_events);
-			counter->metric_events = NULL;
-			counter->metric_expr = NULL;
-		}
-	}
-	expr__ctx_free(ctx);
-}
-
 static double runtime_stat_avg(struct runtime_stat *st,
 			       enum stat_type type, int map_idx,
 			       struct runtime_stat_data *rsd)
@@ -1299,10 +1191,6 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 			color = NULL;
 		print_metric(config, ctxp, color, "%8.1f%%", "Core Bound",
 				core_bound * 100.);
-	} else if (evsel->metric_expr) {
-		generic_metric(config, evsel->metric_expr, evsel->metric_events, NULL,
-			       evsel->name, evsel->metric_name, NULL, 1,
-			       map_idx, out, st);
 	} else if (runtime_stat_n(st, STAT_NSECS, map_idx, &rsd) != 0) {
 		char unit = ' ';
 		char unit_buf[10] = "/sec";
diff --git a/tools/perf/util/stat.h b/tools/perf/util/stat.h
index 499c3bf81333..b1c29156c560 100644
--- a/tools/perf/util/stat.h
+++ b/tools/perf/util/stat.h
@@ -257,7 +257,6 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 				   struct perf_stat_output_ctx *out,
 				   struct rblist *metric_events,
 				   struct runtime_stat *st);
-void perf_stat__collect_metric_expr(struct evlist *);
 
 int evlist__alloc_stats(struct perf_stat_config *config,
 			struct evlist *evlist, bool alloc_raw);
-- 
2.39.0.246.g2a6d74b583-goog

