Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1894915D673
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 12:19:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JrWJ27GxzDq7w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 22:19:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jr9z2S8KzDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 22:04:39 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EB0wZt137244
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 06:04:37 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1tn7aau6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 06:04:36 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Fri, 14 Feb 2020 11:04:24 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Feb 2020 11:04:19 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01EB4H7W52297886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 11:04:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98F55A406A;
 Fri, 14 Feb 2020 11:04:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEFA3A405C;
 Fri, 14 Feb 2020 11:04:12 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.37.109])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Feb 2020 11:04:12 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/8] perf/tools: Enhance JSON/metric infrastructure to handle
 "?"
Date: Fri, 14 Feb 2020 16:33:33 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200214110335.31483-1-kjain@linux.ibm.com>
References: <20200214110335.31483-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20021411-0016-0000-0000-000002E6BF3C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021411-0017-0000-0000-00003349C670
Message-Id: <20200214110335.31483-7-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_03:2020-02-12,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=2 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140090
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, jmario@redhat.com,
 mpetlan@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, alexander.shishkin@linux.intel.com,
 linux-perf-users@vger.kernel.org, ak@linux.intel.com, yao.jin@linux.intel.com,
 anju@linux.vnet.ibm.com, kjain@linux.ibm.com, jolsa@kernel.org,
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
 tools/perf/arch/powerpc/util/header.c |  40 +++++++++
 tools/perf/util/expr.h                |   1 +
 tools/perf/util/expr.y                |  17 +++-
 tools/perf/util/metricgroup.c         | 112 ++++++++++++++++----------
 tools/perf/util/metricgroup.h         |   1 +
 tools/perf/util/stat-shadow.c         |   5 ++
 6 files changed, 134 insertions(+), 42 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
index 3b4cdfc5efd6..28425edb901c 100644
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
@@ -44,3 +51,36 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
 
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
+	snprintf(path, PATH_MAX,
+		 "%s" SOCKETS_INFO_FILE_PATH, sysfs);
+	dir = opendir(path);
+	if (!dir)
+		goto out;
+	strcat(path, filename);
+	file = fopen(path, "r");
+	if (!file)
+		goto out;
+
+	data = fread(buf, 1, sizeof(buf), file);
+	if (data == 0)
+		goto out;
+	count = strtol(buf, &num, 10);
+out:
+	if (!count)
+		count = 1;
+	return count;
+}
diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
index 046160831f90..85ebea68b0c5 100644
--- a/tools/perf/util/expr.h
+++ b/tools/perf/util/expr.h
@@ -15,6 +15,7 @@ struct parse_ctx {
 	struct parse_id ids[MAX_PARSE_ID];
 };
 
+extern int expr__runtimeparam;
 void expr__ctx_init(struct parse_ctx *ctx);
 void expr__add_id(struct parse_ctx *ctx, const char *id, double val);
 #ifndef IN_EXPR_Y
diff --git a/tools/perf/util/expr.y b/tools/perf/util/expr.y
index 7d226241f1d7..8d1d51451873 100644
--- a/tools/perf/util/expr.y
+++ b/tools/perf/util/expr.y
@@ -37,6 +37,8 @@
 %type <num> expr if_expr
 
 %{
+int expr__runtimeparam;
+
 static int expr__lex(YYSTYPE *res, const char **pp);
 
 static void expr__error(double *final_val __maybe_unused,
@@ -102,7 +104,7 @@ static int expr__symbol(YYSTYPE *res, const char *p, const char **pp)
 	if (*p == '#')
 		*dst++ = *p++;
 
-	while (isalnum(*p) || *p == '_' || *p == '.' || *p == ':' || *p == '@' || *p == '\\') {
+	while (isalnum(*p) || *p == '_' || *p == '.' || *p == ':' || *p == '@' || *p == '\\' || *p == '?') {
 		if (p - s >= MAXIDLEN)
 			return -1;
 		/*
@@ -113,6 +115,19 @@ static int expr__symbol(YYSTYPE *res, const char *p, const char **pp)
 			*dst++ = '/';
 		else if (*p == '\\')
 			*dst++ = *++p;
+		else if (*p == '?') {
+			int size = snprintf(NULL, 0, "%d", expr__runtimeparam);
+			char * paramval = (char *)malloc(size);
+			int i = 0;
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
 			*dst++ = *p;
 		p++;
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
index 2c41d47f6f83..147a39b1ff5b 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -780,7 +780,12 @@ static void generic_metric(struct perf_stat_config *config,
 
 	if (!metric_events[i]) {
 		const char *p = metric_expr;
+		if (strstr(p, "?")) {
+			char *tmp = strrchr(metric_name, '_');
 
+			tmp++;
+			expr__runtimeparam = strtol(tmp, &tmp, 10);
+		}
 		if (expr__parse(&ratio, &pctx, &p) == 0) {
 			char *unit;
 			char metric_bf[64];
-- 
2.18.1

