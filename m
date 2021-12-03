Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A64E466FB5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 03:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4xRq1X03z3cQ8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 13:22:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PIorRdm2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PIorRdm2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4xQF1Jngz2ywk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 13:21:08 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B31pbCL004673; 
 Fri, 3 Dec 2021 02:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6tk2Kc8SbieEoRS1ugQOmQS/JRTJcSTkHj3fivu1P/0=;
 b=PIorRdm2vZZUnd3b96MMvFSLzT9279ntRMJ30WwK2ZxHxNZC0wnPeOdyr16DnASRmiKt
 Bx1znxDv2idqslpjiFGrqbFgCO883hTcsvN3X80kxJnETh5gzb3CwgRPLDG1M8oT9P0x
 RjInv65y5V/Mj1mLGR1gmWBykDVg2idlkDJMlPFVz4KDHE47ygE6O2ivUhsEVWGTjAaO
 meRBmw32LvWC5IC+pJkwi1m+MXAUuD1iinU6uU6vrToKUPyCaev8rKQzvNlU2LUmtc5L
 HKrcajsgIFBdUK+zBfdriEOD4s7FSwdrB5yeunDc/iUPIHbCRsnUb5+tMKXsE7WGeHP5 QQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq9xrrerx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 02:20:53 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B32IP3I010634;
 Fri, 3 Dec 2021 02:20:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3ckbxksdws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 02:20:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B32Klkt30277926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 02:20:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0F7211C04A;
 Fri,  3 Dec 2021 02:20:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 692C611C06E;
 Fri,  3 Dec 2021 02:20:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.109.106])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 02:20:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH V2 1/2] tools/perf: Include global and local variants for
 p_stage_cyc sort key
Date: Fri,  3 Dec 2021 07:50:37 +0530
Message-Id: <20211203022038.48240-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9ql5DEt-rZmaRttZmxW1V88X-CesvRlB
X-Proofpoint-ORIG-GUID: 9ql5DEt-rZmaRttZmxW1V88X-CesvRlB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_16,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030012
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, namhyung@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sort key p_stage_cyc is used to present the latency
cycles spend in pipeline stages. perf tool has local
p_stage_cyc sort key to display this info. There is no
global variant available for this sort key. local variant
shows latency in a sinlge sample, whereas, global value
will be useful to present the total latency (sum of
latencies) in the hist entry. It represents latency
number multiplied by the number of samples.

Add global (p_stage_cyc) and local variant
(local_p_stage_cyc) for this sort key. Use the
local_p_stage_cyc as default option for "mem" sort mode.
Also add this to list of dynamic sort keys and made the
"dynamic_headers" and "arch_specific_sort_keys" as static.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Namhyung Kim <namhyung@kernel.org>
---
Changelog:
v1 -> v2:
 Addressed review comments from Jiri by making the
 "dynamic_headers" and "arch_specific_sort_keys"
 as static.

 tools/perf/util/hist.c |  4 +++-
 tools/perf/util/hist.h |  3 ++-
 tools/perf/util/sort.c | 34 +++++++++++++++++++++++++---------
 tools/perf/util/sort.h |  3 ++-
 4 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index b776465e04ef..0a8033b09e28 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -211,7 +211,9 @@ void hists__calc_col_len(struct hists *hists, struct hist_entry *h)
 	hists__new_col_len(hists, HISTC_MEM_BLOCKED, 10);
 	hists__new_col_len(hists, HISTC_LOCAL_INS_LAT, 13);
 	hists__new_col_len(hists, HISTC_GLOBAL_INS_LAT, 13);
-	hists__new_col_len(hists, HISTC_P_STAGE_CYC, 13);
+	hists__new_col_len(hists, HISTC_LOCAL_P_STAGE_CYC, 13);
+	hists__new_col_len(hists, HISTC_GLOBAL_P_STAGE_CYC, 13);
+
 	if (symbol_conf.nanosecs)
 		hists__new_col_len(hists, HISTC_TIME, 16);
 	else
diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
index 621f35ae1efa..2a15e22fb89c 100644
--- a/tools/perf/util/hist.h
+++ b/tools/perf/util/hist.h
@@ -75,7 +75,8 @@ enum hist_column {
 	HISTC_MEM_BLOCKED,
 	HISTC_LOCAL_INS_LAT,
 	HISTC_GLOBAL_INS_LAT,
-	HISTC_P_STAGE_CYC,
+	HISTC_LOCAL_P_STAGE_CYC,
+	HISTC_GLOBAL_P_STAGE_CYC,
 	HISTC_NR_COLS, /* Last entry */
 };
 
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index a111065b484e..e417e47f51b9 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -37,7 +37,7 @@ const char	default_parent_pattern[] = "^sys_|^do_page_fault";
 const char	*parent_pattern = default_parent_pattern;
 const char	*default_sort_order = "comm,dso,symbol";
 const char	default_branch_sort_order[] = "comm,dso_from,symbol_from,symbol_to,cycles";
-const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,p_stage_cyc";
+const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,local_p_stage_cyc";
 const char	default_top_sort_order[] = "dso,symbol";
 const char	default_diff_sort_order[] = "dso,symbol";
 const char	default_tracepoint_sort_order[] = "trace";
@@ -46,8 +46,8 @@ const char	*field_order;
 regex_t		ignore_callees_regex;
 int		have_ignore_callees = 0;
 enum sort_mode	sort__mode = SORT_MODE__NORMAL;
-const char	*dynamic_headers[] = {"local_ins_lat", "p_stage_cyc"};
-const char	*arch_specific_sort_keys[] = {"p_stage_cyc"};
+static const char *const dynamic_headers[] = {"local_ins_lat", "ins_lat", "local_p_stage_cyc", "p_stage_cyc"};
+static const char *const arch_specific_sort_keys[] = {"local_p_stage_cyc", "p_stage_cyc"};
 
 /*
  * Replaces all occurrences of a char used with the:
@@ -1392,22 +1392,37 @@ struct sort_entry sort_global_ins_lat = {
 };
 
 static int64_t
-sort__global_p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
+sort__p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
 {
 	return left->p_stage_cyc - right->p_stage_cyc;
 }
 
+static int hist_entry__global_p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
+					size_t size, unsigned int width)
+{
+	return repsep_snprintf(bf, size, "%-*u", width,
+			he->p_stage_cyc * he->stat.nr_events);
+}
+
+
 static int hist_entry__p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
 					size_t size, unsigned int width)
 {
 	return repsep_snprintf(bf, size, "%-*u", width, he->p_stage_cyc);
 }
 
-struct sort_entry sort_p_stage_cyc = {
-	.se_header      = "Pipeline Stage Cycle",
-	.se_cmp         = sort__global_p_stage_cyc_cmp,
+struct sort_entry sort_local_p_stage_cyc = {
+	.se_header      = "Local Pipeline Stage Cycle",
+	.se_cmp         = sort__p_stage_cyc_cmp,
 	.se_snprintf	= hist_entry__p_stage_cyc_snprintf,
-	.se_width_idx	= HISTC_P_STAGE_CYC,
+	.se_width_idx	= HISTC_LOCAL_P_STAGE_CYC,
+};
+
+struct sort_entry sort_global_p_stage_cyc = {
+	.se_header      = "Pipeline Stage Cycle",
+	.se_cmp         = sort__p_stage_cyc_cmp,
+	.se_snprintf    = hist_entry__global_p_stage_cyc_snprintf,
+	.se_width_idx   = HISTC_GLOBAL_P_STAGE_CYC,
 };
 
 struct sort_entry sort_mem_daddr_sym = {
@@ -1858,7 +1873,8 @@ static struct sort_dimension common_sort_dimensions[] = {
 	DIM(SORT_CODE_PAGE_SIZE, "code_page_size", sort_code_page_size),
 	DIM(SORT_LOCAL_INS_LAT, "local_ins_lat", sort_local_ins_lat),
 	DIM(SORT_GLOBAL_INS_LAT, "ins_lat", sort_global_ins_lat),
-	DIM(SORT_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_p_stage_cyc),
+	DIM(SORT_LOCAL_PIPELINE_STAGE_CYC, "local_p_stage_cyc", sort_local_p_stage_cyc),
+	DIM(SORT_GLOBAL_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_global_p_stage_cyc),
 };
 
 #undef DIM
diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
index 7b7145501933..f994261888e1 100644
--- a/tools/perf/util/sort.h
+++ b/tools/perf/util/sort.h
@@ -235,7 +235,8 @@ enum sort_type {
 	SORT_CODE_PAGE_SIZE,
 	SORT_LOCAL_INS_LAT,
 	SORT_GLOBAL_INS_LAT,
-	SORT_PIPELINE_STAGE_CYC,
+	SORT_LOCAL_PIPELINE_STAGE_CYC,
+	SORT_GLOBAL_PIPELINE_STAGE_CYC,
 
 	/* branch stack specific sort keys */
 	__SORT_BRANCH_STACK,
-- 
2.33.0

