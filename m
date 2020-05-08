Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C5A1CB095
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 15:37:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JWbZ1jTlzDr70
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 23:37:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tip-bot2@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JVtv4mLPzDqHf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 23:05:43 +1000 (AEST)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1jX2h0-0007mE-7L; Fri, 08 May 2020 15:05:30 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id B89131C0868;
 Fri,  8 May 2020 15:05:08 +0200 (CEST)
Date: Fri, 08 May 2020 13:05:08 -0000
From: "tip-bot2 for Kajol Jain" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf metricgroups: Enhance JSON/metric
 infrastructure to handle "?"
In-Reply-To: <20200401203340.31402-5-kjain@linux.ibm.com>
References: <20200401203340.31402-5-kjain@linux.ibm.com>
MIME-Version: 1.0
Message-ID: <158894310866.8414.13586017664085832240.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jin Yao <yao.jin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Kan Liang <kan.liang@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, x86 <x86@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Joe Mario <jmario@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michael Petlan <mpetlan@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     1e1a873dc67fc748cc319a27603f33db91027730
Gitweb:        https://git.kernel.org/tip/1e1a873dc67fc748cc319a27603f33db91027730
Author:        Kajol Jain <kjain@linux.ibm.com>
AuthorDate:    Thu, 02 Apr 2020 02:03:37 +05:30
Committer:     Arnaldo Carvalho de Melo <acme@redhat.com>
CommitterDate: Thu, 30 Apr 2020 10:48:33 -03:00

perf metricgroups: Enhance JSON/metric infrastructure to handle "?"

Patch enhances current metric infrastructure to handle "?" in the metric
expression. The "?" can be use for parameters whose value not known
while creating metric events and which can be replace later at runtime
to the proper value. It also add flexibility to create multiple events
out of single metric event added in JSON file.

Patch adds function 'arch_get_runtimeparam' which is a arch specific
function, returns the count of metric events need to be created.  By
default it return 1.

This infrastructure needed for hv_24x7 socket/chip level events.
"hv_24x7" chip level events needs specific chip-id to which the data is
requested. Function 'arch_get_runtimeparam' implemented in header.c
which extract number of sockets from sysfs file "sockets" under
"/sys/devices/hv_24x7/interface/".

With this patch basically we are trying to create as many metric events
as define by runtime_param.

For that one loop is added in function 'metricgroup__add_metric', which
create multiple events at run time depend on return value of
'arch_get_runtimeparam' and merge that event in 'group_list'.

To achieve that we are actually passing this parameter value as part of
`expr__find_other` function and changing "?" present in metric
expression with this value.

As in our JSON file, there gonna be single metric event, and out of
which we are creating multiple events.

To understand which data count belongs to which parameter value,
we also printing param value in generic_metric function.

For example,

  command:# ./perf stat  -M PowerBUS_Frequency -C 0 -I 1000
    1.000101867  9,356,933  hv_24x7/pm_pb_cyc,chip=0/ #  2.3 GHz  PowerBUS_Frequency_0
    1.000101867  9,366,134  hv_24x7/pm_pb_cyc,chip=1/ #  2.3 GHz  PowerBUS_Frequency_1
    2.000314878  9,365,868  hv_24x7/pm_pb_cyc,chip=0/ #  2.3 GHz  PowerBUS_Frequency_0
    2.000314878  9,366,092  hv_24x7/pm_pb_cyc,chip=1/ #  2.3 GHz  PowerBUS_Frequency_1

So, here _0 and _1 after PowerBUS_Frequency specify parameter value.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Acked-by: Jiri Olsa <jolsa@redhat.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jin Yao <yao.jin@linux.intel.com>
Cc: Joe Mario <jmario@redhat.com>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Petlan <mpetlan@redhat.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org
Link: http://lore.kernel.org/lkml/20200401203340.31402-5-kjain@linux.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/arch/powerpc/util/header.c |  8 +++++++-
 tools/perf/tests/expr.c               |  8 +++----
 tools/perf/util/expr.c                | 11 +++++-----
 tools/perf/util/expr.h                |  5 +++--
 tools/perf/util/expr.l                | 27 ++++++++++++++++++-------
 tools/perf/util/metricgroup.c         | 28 +++++++++++++++++++++++---
 tools/perf/util/metricgroup.h         |  2 ++-
 tools/perf/util/stat-shadow.c         | 17 ++++++++++------
 8 files changed, 79 insertions(+), 27 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index 3b4cdfc..d487007 100644
--- a/tools/perf/arch/powerpc/util/header.c
+++ b/tools/perf/arch/powerpc/util/header.c
@@ -7,6 +7,8 @@
 #include <string.h>
 #include <linux/stringify.h>
 #include "header.h"
+#include "metricgroup.h"
+#include <api/fs/fs.h>
 
 #define mfspr(rn)       ({unsigned long rval; \
 			 asm volatile("mfspr %0," __stringify(rn) \
@@ -44,3 +46,9 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
 
 	return bufp;
 }
+
+int arch_get_runtimeparam(void)
+{
+	int count;
+	return sysfs__read_int("/devices/hv_24x7/interface/sockets", &count) < 0 ? 1 : count;
+}
diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
index ea10fc4..516504c 100644
--- a/tools/perf/tests/expr.c
+++ b/tools/perf/tests/expr.c
@@ -10,7 +10,7 @@ static int test(struct expr_parse_ctx *ctx, const char *e, double val2)
 {
 	double val;
 
-	if (expr__parse(&val, ctx, e))
+	if (expr__parse(&val, ctx, e, 1))
 		TEST_ASSERT_VAL("parse test failed", 0);
 	TEST_ASSERT_VAL("unexpected value", val == val2);
 	return 0;
@@ -44,15 +44,15 @@ int test__expr(struct test *t __maybe_unused, int subtest __maybe_unused)
 		return ret;
 
 	p = "FOO/0";
-	ret = expr__parse(&val, &ctx, p);
+	ret = expr__parse(&val, &ctx, p, 1);
 	TEST_ASSERT_VAL("division by zero", ret == -1);
 
 	p = "BAR/";
-	ret = expr__parse(&val, &ctx, p);
+	ret = expr__parse(&val, &ctx, p, 1);
 	TEST_ASSERT_VAL("missing operand", ret == -1);
 
 	TEST_ASSERT_VAL("find other",
-			expr__find_other("FOO + BAR + BAZ + BOZO", "FOO", &other, &num_other) == 0);
+			expr__find_other("FOO + BAR + BAZ + BOZO", "FOO", &other, &num_other, 1) == 0);
 	TEST_ASSERT_VAL("find other", num_other == 3);
 	TEST_ASSERT_VAL("find other", !strcmp(other[0], "BAR"));
 	TEST_ASSERT_VAL("find other", !strcmp(other[1], "BAZ"));
diff --git a/tools/perf/util/expr.c b/tools/perf/util/expr.c
index c3382d5..aa631e3 100644
--- a/tools/perf/util/expr.c
+++ b/tools/perf/util/expr.c
@@ -27,10 +27,11 @@ void expr__ctx_init(struct expr_parse_ctx *ctx)
 
 static int
 __expr__parse(double *val, struct expr_parse_ctx *ctx, const char *expr,
-	      int start)
+	      int start, int runtime)
 {
 	struct expr_scanner_ctx scanner_ctx = {
 		.start_token = start,
+		.runtime = runtime,
 	};
 	YY_BUFFER_STATE buffer;
 	void *scanner;
@@ -54,9 +55,9 @@ __expr__parse(double *val, struct expr_parse_ctx *ctx, const char *expr,
 	return ret;
 }
 
-int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr)
+int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr, int runtime)
 {
-	return __expr__parse(final_val, ctx, expr, EXPR_PARSE) ? -1 : 0;
+	return __expr__parse(final_val, ctx, expr, EXPR_PARSE, runtime) ? -1 : 0;
 }
 
 static bool
@@ -74,13 +75,13 @@ already_seen(const char *val, const char *one, const char **other,
 }
 
 int expr__find_other(const char *expr, const char *one, const char ***other,
-		     int *num_other)
+		     int *num_other, int runtime)
 {
 	int err, i = 0, j = 0;
 	struct expr_parse_ctx ctx;
 
 	expr__ctx_init(&ctx);
-	err = __expr__parse(NULL, &ctx, expr, EXPR_OTHER);
+	err = __expr__parse(NULL, &ctx, expr, EXPR_OTHER, runtime);
 	if (err)
 		return -1;
 
diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
index 0938ad1..87d627b 100644
--- a/tools/perf/util/expr.h
+++ b/tools/perf/util/expr.h
@@ -17,12 +17,13 @@ struct expr_parse_ctx {
 
 struct expr_scanner_ctx {
 	int start_token;
+	int runtime;
 };
 
 void expr__ctx_init(struct expr_parse_ctx *ctx);
 void expr__add_id(struct expr_parse_ctx *ctx, const char *id, double val);
-int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr);
+int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr, int runtime);
 int expr__find_other(const char *expr, const char *one, const char ***other,
-		int *num_other);
+		int *num_other, int runtime);
 
 #endif
diff --git a/tools/perf/util/expr.l b/tools/perf/util/expr.l
index 2582c24..74b9b59 100644
--- a/tools/perf/util/expr.l
+++ b/tools/perf/util/expr.l
@@ -35,7 +35,7 @@ static int value(yyscan_t scanner, int base)
  * Allow @ instead of / to be able to specify pmu/event/ without
  * conflicts with normal division.
  */
-static char *normalize(char *str)
+static char *normalize(char *str, int runtime)
 {
 	char *ret = str;
 	char *dst = str;
@@ -45,6 +45,19 @@ static char *normalize(char *str)
 			*dst++ = '/';
 		else if (*str == '\\')
 			*dst++ = *++str;
+		 else if (*str == '?') {
+			char *paramval;
+			int i = 0;
+			int size = asprintf(&paramval, "%d", runtime);
+
+			if (size < 0)
+				*dst++ = '0';
+			else {
+				while (i < size)
+					*dst++ = paramval[i++];
+				free(paramval);
+			}
+		}
 		else
 			*dst++ = *str;
 		str++;
@@ -54,16 +67,16 @@ static char *normalize(char *str)
 	return ret;
 }
 
-static int str(yyscan_t scanner, int token)
+static int str(yyscan_t scanner, int token, int runtime)
 {
 	YYSTYPE *yylval = expr_get_lval(scanner);
 	char *text = expr_get_text(scanner);
 
-	yylval->str = normalize(strdup(text));
+	yylval->str = normalize(strdup(text), runtime);
 	if (!yylval->str)
 		return EXPR_ERROR;
 
-	yylval->str = normalize(yylval->str);
+	yylval->str = normalize(yylval->str, runtime);
 	return token;
 }
 %}
@@ -72,8 +85,8 @@ number		[0-9]+
 
 sch		[-,=]
 spec		\\{sch}
-sym		[0-9a-zA-Z_\.:@]+
-symbol		{spec}*{sym}*{spec}*{sym}*
+sym		[0-9a-zA-Z_\.:@?]+
+symbol		{spec}*{sym}*{spec}*{sym}*{spec}*{sym}
 
 %%
 	struct expr_scanner_ctx *sctx = expr_get_extra(yyscanner);
@@ -93,7 +106,7 @@ if		{ return IF; }
 else		{ return ELSE; }
 #smt_on		{ return SMT_ON; }
 {number}	{ return value(yyscanner, 10); }
-{symbol}	{ return str(yyscanner, ID); }
+{symbol}	{ return str(yyscanner, ID, sctx->runtime); }
 "|"		{ return '|'; }
 "^"		{ return '^'; }
 "&"		{ return '&'; }
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 7ad81c8..b071df3 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -90,6 +90,7 @@ struct egroup {
 	const char *metric_name;
 	const char *metric_expr;
 	const char *metric_unit;
+	int runtime;
 };
 
 static struct evsel *find_evsel_group(struct evlist *perf_evlist,
@@ -202,6 +203,7 @@ static int metricgroup__setup_events(struct list_head *groups,
 		expr->metric_name = eg->metric_name;
 		expr->metric_unit = eg->metric_unit;
 		expr->metric_events = metric_events;
+		expr->runtime = eg->runtime;
 		list_add(&expr->nd, &me->head);
 	}
 
@@ -485,15 +487,20 @@ static bool metricgroup__has_constraint(struct pmu_event *pe)
 	return false;
 }
 
+int __weak arch_get_runtimeparam(void)
+{
+	return 1;
+}
+
 static int __metricgroup__add_metric(struct strbuf *events,
-			struct list_head *group_list, struct pmu_event *pe)
+		struct list_head *group_list, struct pmu_event *pe, int runtime)
 {
 
 	const char **ids;
 	int idnum;
 	struct egroup *eg;
 
-	if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum) < 0)
+	if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum, runtime) < 0)
 		return -EINVAL;
 
 	if (events->len > 0)
@@ -513,6 +520,7 @@ static int __metricgroup__add_metric(struct strbuf *events,
 	eg->metric_name = pe->metric_name;
 	eg->metric_expr = pe->metric_expr;
 	eg->metric_unit = pe->unit;
+	eg->runtime = runtime;
 	list_add_tail(&eg->nd, group_list);
 
 	return 0;
@@ -540,7 +548,21 @@ static int metricgroup__add_metric(const char *metric, struct strbuf *events,
 
 			pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
 
-			ret = __metricgroup__add_metric(events,	group_list, pe);
+			if (!strstr(pe->metric_expr, "?")) {
+				ret = __metricgroup__add_metric(events, group_list, pe, 1);
+			} else {
+				int j, count;
+
+				count = arch_get_runtimeparam();
+
+				/* This loop is added to create multiple
+				 * events depend on count value and add
+				 * those events to group_list.
+				 */
+
+				for (j = 0; j < count; j++)
+					ret = __metricgroup__add_metric(events, group_list, pe, j);
+			}
 			if (ret == -ENOMEM)
 				break;
 		}
diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
index 475c7f9..6b09eb3 100644
--- a/tools/perf/util/metricgroup.h
+++ b/tools/perf/util/metricgroup.h
@@ -22,6 +22,7 @@ struct metric_expr {
 	const char *metric_name;
 	const char *metric_unit;
 	struct evsel **metric_events;
+	int runtime;
 };
 
 struct metric_event *metricgroup__lookup(struct rblist *metric_events,
@@ -34,4 +35,5 @@ int metricgroup__parse_groups(const struct option *opt,
 void metricgroup__print(bool metrics, bool groups, char *filter,
 			bool raw, bool details);
 bool metricgroup__has_metric(const char *metric);
+int arch_get_runtimeparam(void);
 #endif
diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index 1ad5c5b..518fbb3 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -336,7 +336,7 @@ void perf_stat__collect_metric_expr(struct evlist *evsel_list)
 		metric_events = counter->metric_events;
 		if (!metric_events) {
 			if (expr__find_other(counter->metric_expr, counter->name,
-						&metric_names, &num_metric_names) < 0)
+						&metric_names, &num_metric_names, 1) < 0)
 				continue;
 
 			metric_events = calloc(sizeof(struct evsel *),
@@ -723,6 +723,7 @@ static void generic_metric(struct perf_stat_config *config,
 			   char *name,
 			   const char *metric_name,
 			   const char *metric_unit,
+			   int runtime,
 			   double avg,
 			   int cpu,
 			   struct perf_stat_output_ctx *out,
@@ -777,7 +778,7 @@ static void generic_metric(struct perf_stat_config *config,
 	}
 
 	if (!metric_events[i]) {
-		if (expr__parse(&ratio, &pctx, metric_expr) == 0) {
+		if (expr__parse(&ratio, &pctx, metric_expr, runtime) == 0) {
 			char *unit;
 			char metric_bf[64];
 
@@ -786,9 +787,13 @@ static void generic_metric(struct perf_stat_config *config,
 					&unit, &scale) >= 0) {
 					ratio *= scale;
 				}
-
-				scnprintf(metric_bf, sizeof(metric_bf),
+				if (strstr(metric_expr, "?"))
+					scnprintf(metric_bf, sizeof(metric_bf),
+					  "%s  %s_%d", unit, metric_name, runtime);
+				else
+					scnprintf(metric_bf, sizeof(metric_bf),
 					  "%s  %s", unit, metric_name);
+
 				print_metric(config, ctxp, NULL, "%8.1f",
 					     metric_bf, ratio);
 			} else {
@@ -1022,7 +1027,7 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 			print_metric(config, ctxp, NULL, NULL, name, 0);
 	} else if (evsel->metric_expr) {
 		generic_metric(config, evsel->metric_expr, evsel->metric_events, evsel->name,
-				evsel->metric_name, NULL, avg, cpu, out, st);
+				evsel->metric_name, NULL, 1, avg, cpu, out, st);
 	} else if (runtime_stat_n(st, STAT_NSECS, 0, cpu) != 0) {
 		char unit = 'M';
 		char unit_buf[10];
@@ -1051,7 +1056,7 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
 				out->new_line(config, ctxp);
 			generic_metric(config, mexp->metric_expr, mexp->metric_events,
 					evsel->name, mexp->metric_name,
-					mexp->metric_unit, avg, cpu, out, st);
+					mexp->metric_unit, mexp->runtime, avg, cpu, out, st);
 		}
 	}
 	if (num == 0)
