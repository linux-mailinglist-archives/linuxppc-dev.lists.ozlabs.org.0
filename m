Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F0B1745E0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 10:27:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48V1JP5T5czDrHm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 20:27:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48V13D2yv8zDrD0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 20:15:36 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01T9E0Wh136493
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 04:15:34 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfn04g6t8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 04:15:33 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Sat, 29 Feb 2020 09:15:31 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 29 Feb 2020 09:15:25 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01T9FOcU47382672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Feb 2020 09:15:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B60D11C04C;
 Sat, 29 Feb 2020 09:15:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA3E511C050;
 Sat, 29 Feb 2020 09:15:13 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.39.183])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 29 Feb 2020 09:15:13 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 suka@linux.vnet.ibm.com
Subject: [PATCH v3 6/8] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Date: Sat, 29 Feb 2020 14:43:54 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200229091356.22157-1-kjain@linux.ibm.com>
References: <20200229091356.22157-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022909-0016-0000-0000-000002EB64B7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022909-0017-0000-0000-0000334EA0CA
Message-Id: <20200229091356.22157-7-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-29_02:2020-02-28,
 2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=2 mlxscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002290070
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
Cc: mark.rutland@arm.com, ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 tglx@linutronix.de, jmario@redhat.com, peterz@infradead.org,
 gregkh@linuxfoundation.org, mpetlan@redhat.com,
 alexander.shishkin@linux.intel.com, linux-perf-users@vger.kernel.org,
 ak@linux.intel.com, yao.jin@linux.intel.com, anju@linux.vnet.ibm.com,
 mamatha4@linux.vnet.ibm.com, kjain@linux.ibm.com, jolsa@kernel.org,
 namhyung@kernel.org, mingo@kernel.org, kan.liang@linux.intel.com
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

One loop is added in function 'metricgroup__add_metric', which create
multiple events at run time depend on return value of
'arch_get_runtimeparam' and merge that event in 'group_list'.

This infrastructure needed for hv_24x7 socket/chip level events.
"hv_24x7" chip level events needs specific chip-id to which the
data is requested. Function 'arch_get_runtimeparam' implemented
in header.c which extract number of sockets from sysfs file
"sockets" under "/sys/devices/hv_24x7/interface/".

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/arch/powerpc/util/header.c |  47 +++++++++++
 tools/perf/util/expr.h                |   1 +
 tools/perf/util/expr.l                |  18 ++++-
 tools/perf/util/expr.y                |   2 +
 tools/perf/util/metricgroup.c         | 112 ++++++++++++++++----------
 tools/perf/util/metricgroup.h         |   1 +
 tools/perf/util/stat-shadow.c         |   6 ++
 7 files changed, 144 insertions(+), 43 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index 3b4cdfc5efd6..5c15589522fd 100644
--- a/tools/perf/arch/powerpc/util/header.c
+++ b/tools/perf/arch/powerpc/util/header.c
@@ -7,6 +7,11 @@
 #include <string.h>
 #include <linux/stringify.h>
 #include "header.h"
+#include "metricgroup.h"
+#include "evlist.h"
+#include <dirent.h>
+#include "pmu.h"
+#include <api/fs/fs.h>
 
 #define mfspr(rn)       ({unsigned long rval; \
 			 asm volatile("mfspr %0," __stringify(rn) \
@@ -16,6 +21,8 @@
 #define PVR_VER(pvr)    (((pvr) >>  16) & 0xFFFF) /* Version field */
 #define PVR_REV(pvr)    (((pvr) >>   0) & 0xFFFF) /* Revison field */
 
+#define SOCKETS_INFO_FILE_PATH "/devices/hv_24x7/interface/"
+
 int
 get_cpuid(char *buffer, size_t sz)
 {
@@ -44,3 +51,43 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
 
 	return bufp;
 }
+
+int arch_get_runtimeparam(void)
+{
+	int count = 0;
+	DIR *dir;
+	char path[PATH_MAX];
+	const char *sysfs = sysfs__mountpoint();
+	char filename[] = "sockets";
+	FILE *file;
+	char buf[16], *num;
+	int data;
+
+	if (!sysfs)
+		goto out;
+
+	snprintf(path, PATH_MAX,
+		 "%s" SOCKETS_INFO_FILE_PATH, sysfs);
+	dir = opendir(path);
+
+	if (!dir)
+		goto out;
+
+	strcat(path, filename);
+	file = fopen(path, "r");
+
+	if (!file)
+		goto out;
+
+	data = fread(buf, 1, sizeof(buf), file);
+
+	if (data == 0)
+		goto out;
+
+	count = strtol(buf, &num, 10);
+out:
+	if (!count)
+		count = 1;
+
+	return count;
+}
diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
index 28a0a2dfbd8c..7f7c902bff46 100644
--- a/tools/perf/util/expr.h
+++ b/tools/perf/util/expr.h
@@ -15,6 +15,7 @@ struct parse_ctx {
 	struct parse_id ids[MAX_PARSE_ID];
 };
 
+int expr__runtimeparam;
 void expr__ctx_init(struct parse_ctx *ctx);
 void expr__add_id(struct parse_ctx *ctx, const char *id, double val);
 int expr__parse(double *final_val, struct parse_ctx *ctx, const char *expr);
diff --git a/tools/perf/util/expr.l b/tools/perf/util/expr.l
index 1928f2a3dddc..2cc6fa4b1960 100644
--- a/tools/perf/util/expr.l
+++ b/tools/perf/util/expr.l
@@ -45,6 +45,20 @@ static char *normalize(char *str)
 			*dst++ = '/';
 		else if (*str == '\\')
 			*dst++ = *++str;
+		else if (*str == '?') {
+			int size = snprintf(NULL, 0, "%d", expr__runtimeparam);
+			char * paramval = (char *)malloc(size);
+			int i = 0;
+
+			if(!paramval)
+				*dst++ = '0';
+			else {
+				sprintf(paramval, "%d", expr__runtimeparam);
+				while(i < size)
+					*dst++ = paramval[i++];
+				free(paramval);
+			}
+		}
 		else
 			*dst++ = *str;
 		str++;
@@ -72,8 +86,8 @@ number		[0-9]+
 
 sch		[-,=]
 spec		\\{sch}
-sym		[0-9a-zA-Z_\.:@]+
-symbol		{spec}*{sym}*{spec}*{sym}*
+sym            [0-9a-zA-Z_\.:@?]+
+symbol         {spec}*{sym}*{spec}*{sym}*{spec}*{sym}
 
 %%
 	{
diff --git a/tools/perf/util/expr.y b/tools/perf/util/expr.y
index 4720cbe79357..0f3ef0f37bf4 100644
--- a/tools/perf/util/expr.y
+++ b/tools/perf/util/expr.y
@@ -38,6 +38,8 @@
 %type <num> expr if_expr
 
 %{
+int expr__runtimeparam;
+
 static void expr_error(double *final_val __maybe_unused,
 		       struct parse_ctx *ctx __maybe_unused,
 		       void *scanner,
diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 02aee946b6c1..f629828cc0de 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -399,6 +399,11 @@ void metricgroup__print(bool metrics, bool metricgroups, char *filter,
 	strlist__delete(metriclist);
 }
 
+int __weak arch_get_runtimeparam(void)
+{
+	return 1;
+}
+
 static int metricgroup__add_metric(const char *metric, struct strbuf *events,
 				   struct list_head *group_list)
 {
@@ -419,52 +424,77 @@ static int metricgroup__add_metric(const char *metric, struct strbuf *events,
 			continue;
 		if (match_metric(pe->metric_group, metric) ||
 		    match_metric(pe->metric_name, metric)) {
-			const char **ids;
-			int idnum;
-			struct egroup *eg;
-			bool no_group = false;
+			int k, count;
+
+			if (strstr(pe->metric_expr, "?"))
+				count = arch_get_runtimeparam();
+			else
+				count = 1;
+
+			/* This loop is added to create multiple
+			 * events depend on count value and add
+			 * those events to group_list.
+			 */
+			for (k = 0; k < count; k++) {
+				const char **ids;
+				int idnum;
+				struct egroup *eg;
+				bool no_group = false;
+				char value[PATH_MAX];
+
+				pr_debug("metric expr %s for %s\n",
+					 pe->metric_expr, pe->metric_name);
+				expr__runtimeparam = k;
+				if (expr__find_other(pe->metric_expr, NULL,
+						     &ids, &idnum) < 0)
+					continue;
+				if (events->len > 0)
+					strbuf_addf(events, ",");
+				for (j = 0; j < idnum; j++) {
+					pr_debug("found event %s\n", ids[j]);
+					/*
+					 * Duration time maps to a software
+					 * event and can make groups not count.
+					 * Always use it outside a group.
+					 */
+					if (!strcmp(ids[j], "duration_time")) {
+						if (j > 0)
+							strbuf_addf(events,
+								    "}:W,");
+						strbuf_addf(events,
+							    "duration_time");
+						no_group = true;
+						continue;
+					}
+					strbuf_addf(events, "%s%s",
+						    j == 0 || no_group ? "{" :
+						    ",", ids[j]);
+					no_group = false;
+				}
+				if (!no_group)
+					strbuf_addf(events, "}:W");
 
-			pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
+				eg = malloc(sizeof(struct egroup));
+				if (!eg) {
+					ret = -ENOMEM;
+					break;
+				}
+				eg->ids = ids;
+				eg->idnum = idnum;
 
-			if (expr__find_other(pe->metric_expr,
-					     NULL, &ids, &idnum) < 0)
-				continue;
-			if (events->len > 0)
-				strbuf_addf(events, ",");
-			for (j = 0; j < idnum; j++) {
-				pr_debug("found event %s\n", ids[j]);
-				/*
-				 * Duration time maps to a software event and can make
-				 * groups not count. Always use it outside a
-				 * group.
-				 */
-				if (!strcmp(ids[j], "duration_time")) {
-					if (j > 0)
-						strbuf_addf(events, "}:W,");
-					strbuf_addf(events, "duration_time");
-					no_group = true;
-					continue;
+				if (strstr(pe->metric_expr, "?")) {
+					sprintf(value, "%s%c%d",
+						pe->metric_name, '_', k);
+				} else {
+					strcpy(value, pe->metric_name);
 				}
-				strbuf_addf(events, "%s%s",
-					j == 0 || no_group ? "{" : ",",
-					ids[j]);
-				no_group = false;
-			}
-			if (!no_group)
-				strbuf_addf(events, "}:W");
 
-			eg = malloc(sizeof(struct egroup));
-			if (!eg) {
-				ret = -ENOMEM;
-				break;
+				eg->metric_name = strdup(value);
+				eg->metric_expr = pe->metric_expr;
+				eg->metric_unit = pe->unit;
+				list_add_tail(&eg->nd, group_list);
+				ret = 0;
 			}
-			eg->ids = ids;
-			eg->idnum = idnum;
-			eg->metric_name = pe->metric_name;
-			eg->metric_expr = pe->metric_expr;
-			eg->metric_unit = pe->unit;
-			list_add_tail(&eg->nd, group_list);
-			ret = 0;
 		}
 	}
 	return ret;
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
index 0fd713d3674f..c1179f7d2b23 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -777,6 +777,12 @@ static void generic_metric(struct perf_stat_config *config,
 	}
 
 	if (!metric_events[i]) {
+		if (strstr(metric_expr, "?")) {
+			char *tmp = strrchr(metric_name, '_');
+
+			tmp++;
+			expr__runtimeparam = strtol(tmp, &tmp, 10);
+		}
 		if (expr__parse(&ratio, &pctx, metric_expr) == 0) {
 			char *unit;
 			char metric_bf[64];
-- 
2.21.0

