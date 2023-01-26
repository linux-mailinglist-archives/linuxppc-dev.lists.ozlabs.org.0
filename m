Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354B67C255
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:25:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NLh10lXz3fJX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YHOuAc95;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3otxrywckdfe1a7zxabz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YHOuAc95;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2NDD5NtFz3fDV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:19:56 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d21-20020a25add5000000b007ff8112e8b8so331643ybe.17
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ7uoYS+YQAMTDaK82f8XHcHdWRlGQMoT7HYsLJbhEU=;
        b=YHOuAc95cV89XRHu4Iptj0Kb0GL4SF14Dtu0OSJyAtlxKmJ0TRvS+knG/WYOlZD5sO
         454XtAJtVULMtOD38iOj5xLr3oBIWbyJW2DlWbNUvsrzH50TzZT2lr8qOCpFHDkMj/e9
         bnbJUkAIN/+HBGk1UwPwH2SqDlyC4Jyny5V2fF9ElQooW837lEjtx8H0cues4YiD4TOK
         E0TqnHB6AHxlPomY+Ly6WQF4MlRwdKet6SDA1VS9VprXM2DpNazhVAhoKop/oXpvm3or
         Ol7JveL1TtVsaqMuqEjVaO1JLkLCOGV55NqYc0SNdOlvD9QmKPBMi78VZGcOFqSCbang
         c+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ7uoYS+YQAMTDaK82f8XHcHdWRlGQMoT7HYsLJbhEU=;
        b=L0nNO/tUPfAbGbSiiegSmfbR+m/yzcnM3RWoH6wamjghrzcm7oJUWwVsWzb/n24HEk
         iKHb0dZ6pglnhl6c/Hw7tjFjw2+sk0irONNQ2izkUxDw3rr9YTnVnAacInXuihHSMI6b
         m9syQCeu9J+m1jpDuPk3nItumvzlDTUMCWPu7w4jJIbjBPA4O32E9GedfHgZwJ6SmUrg
         4Akifj6U7doU2hI+IpHzrbcMFMGeCQoUAAS/6g91XkfL0AJrMwG5WGPx9pCJISXdFYtH
         T86MYyy0v+/LeH4iHLWBxUioSBR/8riNOugr8soPUpbZMYRW75tFIfoCHfwCgsmzkOhV
         dvoQ==
X-Gm-Message-State: AO0yUKUI+bKRbVDLWlZLzUER/cyok0Q+PX5mMpvYRJF0mSeFINsx7S3p
	gID7aNkEycemOuKwacSTq9lRkY6miU/b
X-Google-Smtp-Source: AK7set8zj6fz4eTRQazh2VbeQigE6Z/esbloT4C/zJ084O6dcI3///EgBTy6+BSSRT+G4GYmMgQ4o4BVDaIz
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a05:6902:1506:b0:80b:b89d:95c2 with SMTP
 id q6-20020a056902150600b0080bb89d95c2mr310733ybu.40.1674695994645; Wed, 25
 Jan 2023 17:19:54 -0800 (PST)
Date: Wed, 25 Jan 2023 17:18:48 -0800
In-Reply-To: <20230126011854.198243-1-irogers@google.com>
Message-Id: <20230126011854.198243-7-irogers@google.com>
Mime-Version: 1.0
References: <20230126011854.198243-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 06/12] perf pmu-events: Remove now unused event and metric variables
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

Previous changes separated the uses of pmu_event and pmu_metric,
however, both structures contained all the variables of event and
metric. This change removes the event variables from metric and the
metric variables from event.

Note, this change removes the setting of evsel's metric_name/expr as
these fields are no longer part of struct pmu_event. The metric
remains but is no longer implicitly requested when the event is. This
impacts a few Intel uncore events, however, as the ScaleUnit is shared
by the event and the metric this utility is questionable. Also the
MetricNames look broken (contain spaces) in some cases and when trying
to use the functionality with '-e' the metrics fail but regular
metrics with '-M' work. For example, on SkylakeX '-M' works:

```
$ perf stat -M LLC_MISSES.PCIE_WRITE -a sleep 1

 Performance counter stats for 'system wide':

                 0      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 #  57896.0 Bytes  LLC_MISSES.PCIE_WRITE  (49.84%)
             7,174      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1                                        (49.85%)
                 0      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3                                        (50.16%)
                63      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0                                        (50.15%)

       1.004576381 seconds time elapsed
```

whilst the event '-e' version is broken even with --group/-g (fwiw, we should also remove -g [1]):

```
$ perf stat -g -e LLC_MISSES.PCIE_WRITE -g -a sleep 1
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE

 Performance counter stats for 'system wide':

            27,316 Bytes LLC_MISSES.PCIE_WRITE

       1.004505469 seconds time elapsed
```

The code also carries warnings where the user is supposed to select
events for metrics [2] but given the lack of use of such a feature,
let's clean the code and just remove.

[1] https://lore.kernel.org/lkml/20220707195610.303254-1-irogers@google.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/util/stat-shadow.c?id=01b8957b738f42f96a130079bc951b3cc78c5b8a#n425

Reviewed-by: John Garry <john.g.garry@oracle.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-list.c          | 20 ++---------------
 tools/perf/pmu-events/jevents.py   | 20 +++++++++++++----
 tools/perf/pmu-events/pmu-events.h | 22 +++++--------------
 tools/perf/tests/pmu-events.c      | 27 -----------------------
 tools/perf/util/parse-events.c     |  2 --
 tools/perf/util/pmu.c              | 35 +++---------------------------
 tools/perf/util/pmu.h              |  9 --------
 tools/perf/util/print-events.c     | 32 +++++++--------------------
 tools/perf/util/print-events.h     |  3 +--
 9 files changed, 36 insertions(+), 134 deletions(-)

diff --git a/tools/perf/builtin-list.c b/tools/perf/builtin-list.c
index 137d73edb541..791f513ae5b4 100644
--- a/tools/perf/builtin-list.c
+++ b/tools/perf/builtin-list.c
@@ -99,8 +99,7 @@ static void default_print_event(void *ps, const char *pmu_name, const char *topi
 				const char *scale_unit __maybe_unused,
 				bool deprecated, const char *event_type_desc,
 				const char *desc, const char *long_desc,
-				const char *encoding_desc,
-				const char *metric_name, const char *metric_expr)
+				const char *encoding_desc)
 {
 	struct print_state *print_state = ps;
 	int pos;
@@ -159,10 +158,6 @@ static void default_print_event(void *ps, const char *pmu_name, const char *topi
 	if (print_state->detailed && encoding_desc) {
 		printf("%*s", 8, "");
 		wordwrap(encoding_desc, 8, pager_get_columns(), 0);
-		if (metric_name)
-			printf(" MetricName: %s", metric_name);
-		if (metric_expr)
-			printf(" MetricExpr: %s", metric_expr);
 		putchar('\n');
 	}
 }
@@ -308,8 +303,7 @@ static void json_print_event(void *ps, const char *pmu_name, const char *topic,
 			     const char *scale_unit,
 			     bool deprecated, const char *event_type_desc,
 			     const char *desc, const char *long_desc,
-			     const char *encoding_desc,
-			     const char *metric_name, const char *metric_expr)
+			     const char *encoding_desc)
 {
 	struct json_print_state *print_state = ps;
 	bool need_sep = false;
@@ -366,16 +360,6 @@ static void json_print_event(void *ps, const char *pmu_name, const char *topic,
 				  encoding_desc);
 		need_sep = true;
 	}
-	if (metric_name) {
-		fix_escape_printf(&buf, "%s\t\"MetricName\": \"%S\"", need_sep ? ",\n" : "",
-				  metric_name);
-		need_sep = true;
-	}
-	if (metric_expr) {
-		fix_escape_printf(&buf, "%s\t\"MetricExpr\": \"%S\"", need_sep ? ",\n" : "",
-				  metric_expr);
-		need_sep = true;
-	}
 	printf("%s}", need_sep ? "\n" : "");
 	strbuf_release(&buf);
 }
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 8df14ab14fcf..4cdbf34b7298 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -37,6 +37,11 @@ _json_event_attributes = [
     'metric_constraint', 'metric_expr', 'long_desc'
 ]
 
+# Attributes that are in pmu_metric rather than pmu_event.
+_json_metric_attributes = [
+    'metric_name', 'metric_group', 'metric_constraint', 'metric_expr', 'desc',
+    'long_desc', 'unit', 'compat', 'aggr_mode'
+]
 
 def removesuffix(s: str, suffix: str) -> str:
   """Remove the suffix from a string
@@ -569,21 +574,28 @@ static void decompress_event(int offset, struct pmu_event *pe)
 \tconst char *p = &big_c_string[offset];
 """)
   for attr in _json_event_attributes:
-    _args.output_file.write(f"""
+    if attr in _json_metric_attributes and 'metric_' in attr:
+      _args.output_file.write(f'\n\t/* Skip {attr} */\n')
+    else:
+      _args.output_file.write(f"""
 \tpe->{attr} = (*p == '\\0' ? NULL : p);
 """)
     if attr == _json_event_attributes[-1]:
       continue
     _args.output_file.write('\twhile (*p++);')
   _args.output_file.write("""}
-static void decompress_metric(int offset, struct pmu_metric *pe)
+
+static void decompress_metric(int offset, struct pmu_metric *pm)
 {
 \tconst char *p = &big_c_string[offset];
 """)
   for attr in _json_event_attributes:
-    _args.output_file.write(f"""
-\tpe->{attr} = (*p == '\\0' ? NULL : p);
+    if attr in _json_metric_attributes:
+      _args.output_file.write(f"""
+\tpm->{attr} = (*p == '\\0' ? NULL : p);
 """)
+    else:
+      _args.output_file.write(f'\n\t/* Skip {attr} */\n')
     if attr == _json_event_attributes[-1]:
       continue
     _args.output_file.write('\twhile (*p++);')
diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
index e2cd3e61acef..dca32979d6a4 100644
--- a/tools/perf/pmu-events/pmu-events.h
+++ b/tools/perf/pmu-events/pmu-events.h
@@ -23,29 +23,19 @@ struct pmu_event {
 	const char *unit;
 	const char *perpkg;
 	const char *aggr_mode;
-	const char *metric_expr;
-	const char *metric_name;
-	const char *metric_group;
 	const char *deprecated;
-	const char *metric_constraint;
 };
 
 struct pmu_metric {
-	const char *name;
-	const char *compat;
-	const char *event;
-	const char *desc;
-	const char *topic;
-	const char *long_desc;
-	const char *pmu;
-	const char *unit;
-	const char *perpkg;
-	const char *aggr_mode;
-	const char *metric_expr;
 	const char *metric_name;
 	const char *metric_group;
-	const char *deprecated;
+	const char *metric_expr;
+	const char *unit;
+	const char *compat;
+	const char *aggr_mode;
 	const char *metric_constraint;
+	const char *desc;
+	const char *long_desc;
 };
 
 struct pmu_events_table;
diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index e5fb3d5a06c3..c2b3ada57cbc 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -337,36 +337,12 @@ static int compare_pmu_events(const struct pmu_event *e1, const struct pmu_event
 		return -1;
 	}
 
-	if (!is_same(e1->metric_expr, e2->metric_expr)) {
-		pr_debug2("testing event e1 %s: mismatched metric_expr, %s vs %s\n",
-			  e1->name, e1->metric_expr, e2->metric_expr);
-		return -1;
-	}
-
-	if (!is_same(e1->metric_name, e2->metric_name)) {
-		pr_debug2("testing event e1 %s: mismatched metric_name, %s vs %s\n",
-			  e1->name,	e1->metric_name, e2->metric_name);
-		return -1;
-	}
-
-	if (!is_same(e1->metric_group, e2->metric_group)) {
-		pr_debug2("testing event e1 %s: mismatched metric_group, %s vs %s\n",
-			  e1->name, e1->metric_group, e2->metric_group);
-		return -1;
-	}
-
 	if (!is_same(e1->deprecated, e2->deprecated)) {
 		pr_debug2("testing event e1 %s: mismatched deprecated, %s vs %s\n",
 			  e1->name, e1->deprecated, e2->deprecated);
 		return -1;
 	}
 
-	if (!is_same(e1->metric_constraint, e2->metric_constraint)) {
-		pr_debug2("testing event e1 %s: mismatched metric_constant, %s vs %s\n",
-			  e1->name, e1->metric_constraint, e2->metric_constraint);
-		return -1;
-	}
-
 	return 0;
 }
 
@@ -432,9 +408,6 @@ static int test__pmu_event_table_core_callback(const struct pmu_event *pe,
 	struct perf_pmu_test_event const **test_event_table;
 	bool found = false;
 
-	if (!pe->name)
-		return 0;
-
 	if (pe->pmu)
 		test_event_table = &uncore_events[0];
 	else
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 21cce83462b3..0336ff27c15f 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1570,8 +1570,6 @@ int parse_events_add_pmu(struct parse_events_state *parse_state,
 	evsel->scale = info.scale;
 	evsel->per_pkg = info.per_pkg;
 	evsel->snapshot = info.snapshot;
-	evsel->metric_expr = info.metric_expr;
-	evsel->metric_name = info.metric_name;
 	return 0;
 }
 
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 3a67b17b4a16..f8c214d8815f 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -280,10 +280,6 @@ static void perf_pmu_update_alias(struct perf_pmu_alias *old,
 	perf_pmu_assign_str(old->name, "long_desc", &old->long_desc,
 			    &newalias->long_desc);
 	perf_pmu_assign_str(old->name, "topic", &old->topic, &newalias->topic);
-	perf_pmu_assign_str(old->name, "metric_expr", &old->metric_expr,
-			    &newalias->metric_expr);
-	perf_pmu_assign_str(old->name, "metric_name", &old->metric_name,
-			    &newalias->metric_name);
 	perf_pmu_assign_str(old->name, "value", &old->str, &newalias->str);
 	old->scale = newalias->scale;
 	old->per_pkg = newalias->per_pkg;
@@ -299,8 +295,6 @@ void perf_pmu_free_alias(struct perf_pmu_alias *newalias)
 	zfree(&newalias->long_desc);
 	zfree(&newalias->topic);
 	zfree(&newalias->str);
-	zfree(&newalias->metric_expr);
-	zfree(&newalias->metric_name);
 	zfree(&newalias->pmu_name);
 	parse_events_terms__purge(&newalias->terms);
 	free(newalias);
@@ -337,16 +331,13 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
 	int num;
 	char newval[256];
 	char *long_desc = NULL, *topic = NULL, *unit = NULL, *perpkg = NULL,
-	     *metric_expr = NULL, *metric_name = NULL, *deprecated = NULL,
-	     *pmu_name = NULL;
+	     *deprecated = NULL, *pmu_name = NULL;
 
 	if (pe) {
 		long_desc = (char *)pe->long_desc;
 		topic = (char *)pe->topic;
 		unit = (char *)pe->unit;
 		perpkg = (char *)pe->perpkg;
-		metric_expr = (char *)pe->metric_expr;
-		metric_name = (char *)pe->metric_name;
 		deprecated = (char *)pe->deprecated;
 		pmu_name = (char *)pe->pmu;
 	}
@@ -401,8 +392,6 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
 		perf_pmu__parse_snapshot(alias, dir, name);
 	}
 
-	alias->metric_expr = metric_expr ? strdup(metric_expr) : NULL;
-	alias->metric_name = metric_name ? strdup(metric_name): NULL;
 	alias->desc = desc ? strdup(desc) : NULL;
 	alias->long_desc = long_desc ? strdup(long_desc) :
 				desc ? strdup(desc) : NULL;
@@ -756,9 +745,6 @@ static int pmu_add_cpu_aliases_map_callback(const struct pmu_event *pe,
 	struct pmu_add_cpu_aliases_map_data *data = vdata;
 	const char *pname = pe->pmu ? pe->pmu : data->cpu_name;
 
-	if (!pe->name)
-		return 0;
-
 	if (data->pmu->is_uncore && pmu_uncore_alias_match(pname, data->name))
 		goto new_alias;
 
@@ -813,12 +799,6 @@ static int pmu_add_sys_aliases_iter_fn(const struct pmu_event *pe,
 	struct pmu_sys_event_iter_data *idata = data;
 	struct perf_pmu *pmu = idata->pmu;
 
-	if (!pe->name) {
-		if (pe->metric_group || pe->metric_name)
-			return 0;
-		return -EINVAL;
-	}
-
 	if (!pe->compat || !pe->pmu)
 		return 0;
 
@@ -1400,8 +1380,6 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, struct list_head *head_terms,
 	info->unit     = NULL;
 	info->scale    = 0.0;
 	info->snapshot = false;
-	info->metric_expr = NULL;
-	info->metric_name = NULL;
 
 	list_for_each_entry_safe(term, h, head_terms, list) {
 		alias = pmu_find_alias(pmu, term);
@@ -1417,8 +1395,6 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, struct list_head *head_terms,
 
 		if (alias->per_pkg)
 			info->per_pkg = true;
-		info->metric_expr = alias->metric_expr;
-		info->metric_name = alias->metric_name;
 
 		list_del_init(&term->list);
 		parse_events_term__delete(term);
@@ -1634,8 +1610,7 @@ void print_pmu_events(const struct print_callbacks *print_cb, void *print_state)
 	for (j = 0; j < len; j++) {
 		const char *name, *alias = NULL, *scale_unit = NULL,
 			*desc = NULL, *long_desc = NULL,
-			*encoding_desc = NULL, *topic = NULL,
-			*metric_name = NULL, *metric_expr = NULL;
+			*encoding_desc = NULL, *topic = NULL;
 		bool deprecated = false;
 		size_t buf_used;
 
@@ -1673,8 +1648,6 @@ void print_pmu_events(const struct print_callbacks *print_cb, void *print_state)
 			buf_used += snprintf(buf + buf_used, sizeof(buf) - buf_used,
 					"%s/%s/", aliases[j].pmu->name,
 					aliases[j].event->str) + 1;
-			metric_name = aliases[j].event->metric_name;
-			metric_expr = aliases[j].event->metric_expr;
 			deprecated = aliases[j].event->deprecated;
 		}
 		print_cb->print_event(print_state,
@@ -1687,9 +1660,7 @@ void print_pmu_events(const struct print_callbacks *print_cb, void *print_state)
 				"Kernel PMU event",
 				desc,
 				long_desc,
-				encoding_desc,
-				metric_name,
-				metric_expr);
+				encoding_desc);
 	}
 	if (printed && pager_in_use())
 		printf("\n");
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 2bdc560f19c7..64c596a358cc 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -132,8 +132,6 @@ extern struct perf_pmu perf_pmu__fake;
 
 struct perf_pmu_info {
 	const char *unit;
-	const char *metric_expr;
-	const char *metric_name;
 	double scale;
 	bool per_pkg;
 	bool snapshot;
@@ -187,13 +185,6 @@ struct perf_pmu_alias {
 	 * default.
 	 */
 	bool deprecated;
-	/**
-	 * @metric_expr: A metric expression associated with an event. Doing
-	 * this makes little sense due to scale and unit applying to both.
-	 */
-	char *metric_expr;
-	/** @metric_name: A name for the metric. unit applying to both. */
-	char *metric_name;
 	/** @pmu_name: The name copied from struct perf_pmu. */
 	char *pmu_name;
 };
diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-events.c
index 2646ae18d9f9..62e9ea7dcf40 100644
--- a/tools/perf/util/print-events.c
+++ b/tools/perf/util/print-events.c
@@ -101,9 +101,7 @@ void print_tracepoint_events(const struct print_callbacks *print_cb, void *print
 					"Tracepoint event",
 					/*desc=*/NULL,
 					/*long_desc=*/NULL,
-					/*encoding_desc=*/NULL,
-					/*metric_name=*/NULL,
-					/*metric_expr=*/NULL);
+					/*encoding_desc=*/NULL);
 		}
 		free(dir_path);
 		free(evt_namelist);
@@ -195,9 +193,7 @@ void print_sdt_events(const struct print_callbacks *print_cb, void *print_state)
 				"SDT event",
 				/*desc=*/NULL,
 				/*long_desc=*/NULL,
-				/*encoding_desc=*/NULL,
-				/*metric_name=*/NULL,
-				/*metric_expr=*/NULL);
+				/*encoding_desc=*/NULL);
 
 		free(evt_name);
 	}
@@ -255,9 +251,7 @@ int print_hwcache_events(const struct print_callbacks *print_cb, void *print_sta
 				event_type_descriptors[PERF_TYPE_HW_CACHE],
 				/*desc=*/NULL,
 				/*long_desc=*/NULL,
-				/*encoding_desc=*/NULL,
-				/*metric_name=*/NULL,
-				/*metric_expr=*/NULL);
+				/*encoding_desc=*/NULL);
 	}
 	strlist__delete(evt_name_list);
 	return 0;
@@ -277,9 +271,7 @@ void print_tool_events(const struct print_callbacks *print_cb, void *print_state
 				"Tool event",
 				/*desc=*/NULL,
 				/*long_desc=*/NULL,
-				/*encoding_desc=*/NULL,
-				/*metric_name=*/NULL,
-				/*metric_expr=*/NULL);
+				/*encoding_desc=*/NULL);
 	}
 }
 
@@ -331,9 +323,7 @@ void print_symbol_events(const struct print_callbacks *print_cb, void *print_sta
 				event_type_descriptors[type],
 				/*desc=*/NULL,
 				/*long_desc=*/NULL,
-				/*encoding_desc=*/NULL,
-				/*metric_name=*/NULL,
-				/*metric_expr=*/NULL);
+				/*encoding_desc=*/NULL);
 	}
 	strlist__delete(evt_name_list);
 }
@@ -364,9 +354,7 @@ void print_events(const struct print_callbacks *print_cb, void *print_state)
 			event_type_descriptors[PERF_TYPE_RAW],
 			/*desc=*/NULL,
 			/*long_desc=*/NULL,
-			/*encoding_desc=*/NULL,
-			/*metric_name=*/NULL,
-			/*metric_expr=*/NULL);
+			/*encoding_desc=*/NULL);
 
 	print_cb->print_event(print_state,
 			/*topic=*/NULL,
@@ -378,9 +366,7 @@ void print_events(const struct print_callbacks *print_cb, void *print_state)
 			event_type_descriptors[PERF_TYPE_RAW],
 			"(see 'man perf-list' on how to encode it)",
 			/*long_desc=*/NULL,
-			/*encoding_desc=*/NULL,
-			/*metric_name=*/NULL,
-			/*metric_expr=*/NULL);
+			/*encoding_desc=*/NULL);
 
 	print_cb->print_event(print_state,
 			/*topic=*/NULL,
@@ -392,9 +378,7 @@ void print_events(const struct print_callbacks *print_cb, void *print_state)
 			event_type_descriptors[PERF_TYPE_BREAKPOINT],
 			/*desc=*/NULL,
 			/*long_desc=*/NULL,
-			/*encoding_desc=*/NULL,
-			/*metric_name=*/NULL,
-			/*metric_expr=*/NULL);
+			/*encoding_desc=*/NULL);
 
 	print_tracepoint_events(print_cb, print_state);
 
diff --git a/tools/perf/util/print-events.h b/tools/perf/util/print-events.h
index c237e53c4487..716dcf4b4859 100644
--- a/tools/perf/util/print-events.h
+++ b/tools/perf/util/print-events.h
@@ -16,8 +16,7 @@ struct print_callbacks {
 			const char *scale_unit,
 			bool deprecated, const char *event_type_desc,
 			const char *desc, const char *long_desc,
-			const char *encoding_desc,
-			const char *metric_name, const char *metric_expr);
+			const char *encoding_desc);
 	void (*print_metric)(void *print_state,
 			const char *group,
 			const char *name,
-- 
2.39.1.456.gfc5497dd1b-goog

