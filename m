Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D018CF8A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 14:55:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kQJs6JfwzDsP1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 00:55:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kP093SSmzDrfY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 23:55:53 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02KCXugo097387
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 08:55:47 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yua3xe362-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 08:55:46 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Fri, 20 Mar 2020 12:55:44 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 12:55:26 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02KCtOXj46334024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 12:55:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A10474C046;
 Fri, 20 Mar 2020 12:55:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0127A4C04E;
 Fri, 20 Mar 2020 12:55:19 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.35.76])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 12:55:18 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
Subject: [PATCH v6 09/11] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Date: Fri, 20 Mar 2020 18:24:04 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200320125406.30995-1-kjain@linux.ibm.com>
References: <20200320125406.30995-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032012-0008-0000-0000-00000360A321
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032012-0009-0000-0000-00004A820451
Message-Id: <20200320125406.30995-10-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_03:2020-03-20,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=271
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200055
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch enhances current metric infrastructure to handle "?" in the metric
expression. The "?" can be use for parameters whose value not known while
creating metric events and which can be replace later at runtime to
the proper value. It also add flexibility to create multiple events out
of single metric event added in json file.

Patch adds function 'arch_get_runtimeparam' which is a arch specific
function, returns the count of metric events need to be created.
By default it return 1.

This infrastructure needed for hv_24x7 socket/chip level events.
"hv_24x7" chip level events needs specific chip-id to which the
data is requested. Function 'arch_get_runtimeparam' implemented
in header.c which extract number of sockets from sysfs file
"sockets" under "/sys/devices/hv_24x7/interface/".


With this patch basically we are trying to create as many metric events
as define by runtime_param.

For that one loop is added in function 'metricgroup__add_metric',
which create multiple events at run time depend on return value of
'arch_get_runtimeparam' and merge that event in 'group_list'.

To achieve that we are actually passing this parameter value as part of
`expr__find_other` function and changing "?" present in metric expression
with this value.

As in our json file, there gonna be single metric event, and out of
which we are creating multiple events, I am also merging this value
to the original metric name to specify parameter value.

For example,
command:# ./perf stat  -M PowerBUS_Frequency -C 0 -I 1000
#           time             counts unit events
     1.000101867          9,356,933      hv_24x7/pm_pb_cyc,chip=0/ #      2.3 GHz  PowerBUS_Frequency_0
     1.000101867          9,366,134      hv_24x7/pm_pb_cyc,chip=1/ #      2.3 GHz  PowerBUS_Frequency_1
     2.000314878          9,365,868      hv_24x7/pm_pb_cyc,chip=0/ #      2.3 GHz  PowerBUS_Frequency_0
     2.000314878          9,366,092      hv_24x7/pm_pb_cyc,chip=1/ #      2.3 GHz  PowerBUS_Frequency_1

So, here _0 and _1 after PowerBUS_Frequency specify parameter value.

As after adding this to group_list, again we call expr__parse
in 'generic_metric' function present in util/stat-display.c.
By this time again we need to pass this parameter value. So, now to get this value
actually I am trying to extract it from metric name itself. Because
otherwise it gonna point to last updated value present in runtime_param.
And gonna match for that value only.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/arch/powerpc/util/header.c |  8 ++++++
 tools/perf/tests/expr.c               |  8 +++---
 tools/perf/util/expr.c                | 11 ++++----
 tools/perf/util/expr.h                |  5 ++--
 tools/perf/util/expr.l                | 27 +++++++++++++-----
 tools/perf/util/metricgroup.c         | 40 +++++++++++++++++++++++----
 tools/perf/util/metricgroup.h         |  1 +
 tools/perf/util/stat-shadow.c         | 12 ++++++--
 8 files changed, 86 insertions(+), 26 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index 3b4cdfc5efd6..c0a86afe63fb 100644
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
+	return sysfs__read_int("/devices/hv_24x7/interface/sockets", &count) < 0 ? 3 : count;
+}
diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
index ea10fc4412c4..516504cf0ea5 100644
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
index c3382d58cf40..9d56e5fb3873 100644
--- a/tools/perf/util/expr.c
+++ b/tools/perf/util/expr.c
@@ -27,10 +27,11 @@ void expr__ctx_init(struct expr_parse_ctx *ctx)
 
 static int
 __expr__parse(double *val, struct expr_parse_ctx *ctx, const char *expr,
-	      int start)
+	      int start, int param)
 {
 	struct expr_scanner_ctx scanner_ctx = {
 		.start_token = start,
+		.runtime_param = param,
 	};
 	YY_BUFFER_STATE buffer;
 	void *scanner;
@@ -54,9 +55,9 @@ __expr__parse(double *val, struct expr_parse_ctx *ctx, const char *expr,
 	return ret;
 }
 
-int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr)
+int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr, int param)
 {
-	return __expr__parse(final_val, ctx, expr, EXPR_PARSE) ? -1 : 0;
+	return __expr__parse(final_val, ctx, expr, EXPR_PARSE, param) ? -1 : 0;
 }
 
 static bool
@@ -74,13 +75,13 @@ already_seen(const char *val, const char *one, const char **other,
 }
 
 int expr__find_other(const char *expr, const char *one, const char ***other,
-		     int *num_other)
+		     int *num_other, int param)
 {
 	int err, i = 0, j = 0;
 	struct expr_parse_ctx ctx;
 
 	expr__ctx_init(&ctx);
-	err = __expr__parse(NULL, &ctx, expr, EXPR_OTHER);
+	err = __expr__parse(NULL, &ctx, expr, EXPR_OTHER, param);
 	if (err)
 		return -1;
 
diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
index 0938ad166ece..0b91597d6512 100644
--- a/tools/perf/util/expr.h
+++ b/tools/perf/util/expr.h
@@ -17,12 +17,13 @@ struct expr_parse_ctx {
 
 struct expr_scanner_ctx {
 	int start_token;
+	int runtime_param;
 };
 
 void expr__ctx_init(struct expr_parse_ctx *ctx);
 void expr__add_id(struct expr_parse_ctx *ctx, const char *id, double val);
-int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr);
+int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr, int param);
 int expr__find_other(const char *expr, const char *one, const char ***other,
-		int *num_other);
+		int *num_other, int param);
 
 #endif
diff --git a/tools/perf/util/expr.l b/tools/perf/util/expr.l
index 2582c2464938..86eb822c51cc 100644
--- a/tools/perf/util/expr.l
+++ b/tools/perf/util/expr.l
@@ -35,7 +35,7 @@ static int value(yyscan_t scanner, int base)
  * Allow @ instead of / to be able to specify pmu/event/ without
  * conflicts with normal division.
  */
-static char *normalize(char *str)
+static char *normalize(char *str, int runtime_param)
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
+			int size = asprintf(&paramval, "%d", runtime_param);
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
+static int str(yyscan_t scanner, int token, int runtime_param)
 {
 	YYSTYPE *yylval = expr_get_lval(scanner);
 	char *text = expr_get_text(scanner);
 
-	yylval->str = normalize(strdup(text));
+	yylval->str = normalize(strdup(text), runtime_param);
 	if (!yylval->str)
 		return EXPR_ERROR;
 
-	yylval->str = normalize(yylval->str);
+	yylval->str = normalize(yylval->str, runtime_param);
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
+{symbol}	{ return str(yyscanner, ID, sctx->runtime_param); }
 "|"		{ return '|'; }
 "^"		{ return '^'; }
 "&"		{ return '&'; }
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 52fb119d25c8..b4b91d8ad5be 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -474,8 +474,13 @@ static bool metricgroup__has_constraint(struct pmu_event *pe)
 	return false;
 }
 
+int __weak arch_get_runtimeparam(void)
+{
+	return 1;
+}
+
 static int metricgroup__add_metric_param(struct strbuf *events,
-			struct list_head *group_list, struct pmu_event *pe)
+		struct list_head *group_list, struct pmu_event *pe, int param)
 {
 
 	const char **ids;
@@ -483,7 +488,7 @@ static int metricgroup__add_metric_param(struct strbuf *events,
 	struct egroup *eg;
 	int ret = -EINVAL;
 
-	if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum) < 0)
+	if (expr__find_other(pe->metric_expr, NULL, &ids, &idnum, param) < 0)
 		return ret;
 
 	if (events->len > 0)
@@ -502,11 +507,21 @@ static int metricgroup__add_metric_param(struct strbuf *events,
 
 	eg->ids = ids;
 	eg->idnum = idnum;
-	eg->metric_name = pe->metric_name;
+	if (strstr(pe->metric_expr, "?")) {
+		char value[PATH_MAX];
+
+		sprintf(value, "%s%c%d", pe->metric_name, '_', param);
+		eg->metric_name = strdup(value);
+		if (!eg->metric_name) {
+			ret = -ENOMEM;
+			return ret;
+		}
+	}
+	else
+		eg->metric_name = pe->metric_name;
 	eg->metric_expr = pe->metric_expr;
 	eg->metric_unit = pe->unit;
 	list_add_tail(&eg->nd, group_list);
-
 	return 0;
 }
 
@@ -532,8 +547,21 @@ static int metricgroup__add_metric(const char *metric, struct strbuf *events,
 
 			pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
 
-			ret = metricgroup__add_metric_param(events,
-							group_list, pe);
+			if (!strstr(pe->metric_expr, "?")) {
+				ret = metricgroup__add_metric_param(events, group_list, pe, 1);
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
+					ret = metricgroup__add_metric_param(events, group_list, pe, j);
+			}
 			if (ret == -EINVAL || !ret)
 				continue;
 		}
diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
index 475c7f912864..81224ba1270d 100644
--- a/tools/perf/util/metricgroup.h
+++ b/tools/perf/util/metricgroup.h
@@ -34,4 +34,5 @@ int metricgroup__parse_groups(const struct option *opt,
 void metricgroup__print(bool metrics, bool groups, char *filter,
 			bool raw, bool details);
 bool metricgroup__has_metric(const char *metric);
+int arch_get_runtimeparam(void);
 #endif
diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index 402af3e8d287..85ac6d913782 100644
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
@@ -777,7 +777,15 @@ static void generic_metric(struct perf_stat_config *config,
 	}
 
 	if (!metric_events[i]) {
-		if (expr__parse(&ratio, &pctx, metric_expr) == 0) {
+		int param = 1;
+		if (strstr(metric_expr, "?")) {
+			char *tmp = strrchr(metric_name, '_');
+
+			tmp++;
+			param = strtol(tmp, &tmp, 10);
+		}
+
+		if (expr__parse(&ratio, &pctx, metric_expr, param) == 0) {
 			char *unit;
 			char metric_bf[64];
 
-- 
2.18.1

