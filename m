Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C42344865
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 15:59:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yMf16MMz3c1J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:59:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J2n4eIu/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J2n4eIu/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yKh6GJPz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:58:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MEeTdL061314; Mon, 22 Mar 2021 10:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=5I72gfY1CkqXZ/dmnZ2LEbV/TGzmcLdz1lokkzbqJvA=;
 b=J2n4eIu/k5sSMArxa68Z4DUBzXtv+DoPjck7c8kYd5ScpVzIz+yU3tQ2HGmW4vPV0ivr
 jG5L4YBrhpnZr/LGxX/tEG0ABLKLpB+2oKP99tVBpQM3qz+GpRd+q5E5/kvJCu2l68Uv
 M2FS0+pZy1H7pYB9iE9YuehcYjdtleX6EX0zk7aIz+WDZ6A88TP6LRxbeuFMl6cu3HK4
 nzMPLF0pZ/5XYd7jY+XmHtpHqIldJIWDJkc1RZjwLBGMNwTAfV5v32wgNydwJVgclOKx
 l6q7iKVs27+XU9ljkdS966qGm8FfR/ebul4cFsHcOhAJYW4EF//5PT/D0hMRwr5VfB69 lA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx3vv3t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:57:51 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MEh4Ct012511;
 Mon, 22 Mar 2021 14:57:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 37d99raf0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 14:57:48 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12MEvR1l32899350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 14:57:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9117B4C046;
 Mon, 22 Mar 2021 14:57:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0FC94C04A;
 Mon, 22 Mar 2021 14:57:42 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.209.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 14:57:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH V2 4/5] tools/perf: Support pipeline stage cycles for powerpc
Date: Mon, 22 Mar 2021 10:57:26 -0400
Message-Id: <1616425047-1666-5-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_07:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220107
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
Cc: kan.liang@linux.intel.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, maddy@linux.ibm.com, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pipeline stage cycles details can be recorded on powerpc from
the contents of Performance Monitor Unit (PMU) registers. On
ISA v3.1 platform, sampling registers exposes the cycles spent in
different pipeline stages. Patch adds perf tools support to present
two of the cycle counter information along with memory latency (weight).

Re-use the field 'ins_lat' for storing the first pipeline stage cycle.
This is stored in 'var2_w' field of 'perf_sample_weight'.

Add a new field 'p_stage_cyc' to store the second pipeline stage cycle
which is stored in 'var3_w' field of perf_sample_weight.

Add new sort function 'Pipeline Stage Cycle' and include this in
default_mem_sort_order[]. This new sort function may be used to denote
some other pipeline stage in another architecture. So add this to
list of sort entries that can have dynamic header string.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/Documentation/perf-report.txt |  2 ++
 tools/perf/arch/powerpc/util/event.c     | 18 ++++++++++++++++--
 tools/perf/util/event.h                  |  1 +
 tools/perf/util/hist.c                   | 11 ++++++++---
 tools/perf/util/hist.h                   |  1 +
 tools/perf/util/session.c                |  4 +++-
 tools/perf/util/sort.c                   | 24 ++++++++++++++++++++++--
 tools/perf/util/sort.h                   |  2 ++
 8 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/tools/perf/Documentation/perf-report.txt b/tools/perf/Documentation/perf-report.txt
index f546b5e9db05..563fb01a9b8d 100644
--- a/tools/perf/Documentation/perf-report.txt
+++ b/tools/perf/Documentation/perf-report.txt
@@ -112,6 +112,8 @@ OPTIONS
 	- ins_lat: Instruction latency in core cycles. This is the global instruction
 	  latency
 	- local_ins_lat: Local instruction latency version
+	- p_stage_cyc: On powerpc, this presents the number of cycles spent in a
+	  pipeline stage. And currently supported only on powerpc.
 
 	By default, comm, dso and symbol keys are used.
 	(i.e. --sort comm,dso,symbol)
diff --git a/tools/perf/arch/powerpc/util/event.c b/tools/perf/arch/powerpc/util/event.c
index f49d32c2c8ae..22521bc9481a 100644
--- a/tools/perf/arch/powerpc/util/event.c
+++ b/tools/perf/arch/powerpc/util/event.c
@@ -18,8 +18,11 @@ void arch_perf_parse_sample_weight(struct perf_sample *data,
 	weight.full = *array;
 	if (type & PERF_SAMPLE_WEIGHT)
 		data->weight = weight.full;
-	else
+	else {
 		data->weight = weight.var1_dw;
+		data->ins_lat = weight.var2_w;
+		data->p_stage_cyc = weight.var3_w;
+	}
 }
 
 void arch_perf_synthesize_sample_weight(const struct perf_sample *data,
@@ -27,6 +30,17 @@ void arch_perf_synthesize_sample_weight(const struct perf_sample *data,
 {
 	*array = data->weight;
 
-	if (type & PERF_SAMPLE_WEIGHT_STRUCT)
+	if (type & PERF_SAMPLE_WEIGHT_STRUCT) {
 		*array &= 0xffffffff;
+		*array |= ((u64)data->ins_lat << 32);
+	}
+}
+
+const char *arch_perf_header_entry(const char *se_header)
+{
+	if (!strcmp(se_header, "Local INSTR Latency"))
+		return "Finish Cyc";
+	else if (!strcmp(se_header, "Pipeline Stage Cycle"))
+		return "Dispatch Cyc";
+	return se_header;
 }
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index 6106a9c134c9..e5da4a695ff2 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -147,6 +147,7 @@ struct perf_sample {
 	u8  cpumode;
 	u16 misc;
 	u16 ins_lat;
+	u16 p_stage_cyc;
 	bool no_hw_idx;		/* No hw_idx collected in branch_stack */
 	char insn[MAX_INSN];
 	void *raw_data;
diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index c82f5fc26af8..9299ee535518 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -211,6 +211,7 @@ void hists__calc_col_len(struct hists *hists, struct hist_entry *h)
 	hists__new_col_len(hists, HISTC_MEM_BLOCKED, 10);
 	hists__new_col_len(hists, HISTC_LOCAL_INS_LAT, 13);
 	hists__new_col_len(hists, HISTC_GLOBAL_INS_LAT, 13);
+	hists__new_col_len(hists, HISTC_P_STAGE_CYC, 13);
 	if (symbol_conf.nanosecs)
 		hists__new_col_len(hists, HISTC_TIME, 16);
 	else
@@ -289,13 +290,14 @@ static long hist_time(unsigned long htime)
 }
 
 static void he_stat__add_period(struct he_stat *he_stat, u64 period,
-				u64 weight, u64 ins_lat)
+				u64 weight, u64 ins_lat, u64 p_stage_cyc)
 {
 
 	he_stat->period		+= period;
 	he_stat->weight		+= weight;
 	he_stat->nr_events	+= 1;
 	he_stat->ins_lat	+= ins_lat;
+	he_stat->p_stage_cyc	+= p_stage_cyc;
 }
 
 static void he_stat__add_stat(struct he_stat *dest, struct he_stat *src)
@@ -308,6 +310,7 @@ static void he_stat__add_stat(struct he_stat *dest, struct he_stat *src)
 	dest->nr_events		+= src->nr_events;
 	dest->weight		+= src->weight;
 	dest->ins_lat		+= src->ins_lat;
+	dest->p_stage_cyc		+= src->p_stage_cyc;
 }
 
 static void he_stat__decay(struct he_stat *he_stat)
@@ -597,6 +600,7 @@ static struct hist_entry *hists__findnew_entry(struct hists *hists,
 	u64 period = entry->stat.period;
 	u64 weight = entry->stat.weight;
 	u64 ins_lat = entry->stat.ins_lat;
+	u64 p_stage_cyc = entry->stat.p_stage_cyc;
 	bool leftmost = true;
 
 	p = &hists->entries_in->rb_root.rb_node;
@@ -615,11 +619,11 @@ static struct hist_entry *hists__findnew_entry(struct hists *hists,
 
 		if (!cmp) {
 			if (sample_self) {
-				he_stat__add_period(&he->stat, period, weight, ins_lat);
+				he_stat__add_period(&he->stat, period, weight, ins_lat, p_stage_cyc);
 				hist_entry__add_callchain_period(he, period);
 			}
 			if (symbol_conf.cumulate_callchain)
-				he_stat__add_period(he->stat_acc, period, weight, ins_lat);
+				he_stat__add_period(he->stat_acc, period, weight, ins_lat, p_stage_cyc);
 
 			/*
 			 * This mem info was allocated from sample__resolve_mem
@@ -731,6 +735,7 @@ static void hists__res_sample(struct hist_entry *he, struct perf_sample *sample)
 			.period	= sample->period,
 			.weight = sample->weight,
 			.ins_lat = sample->ins_lat,
+			.p_stage_cyc = sample->p_stage_cyc,
 		},
 		.parent = sym_parent,
 		.filtered = symbol__parent_filter(sym_parent) | al->filtered,
diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
index 3c537232294b..e2faa745c8d6 100644
--- a/tools/perf/util/hist.h
+++ b/tools/perf/util/hist.h
@@ -75,6 +75,7 @@ enum hist_column {
 	HISTC_MEM_BLOCKED,
 	HISTC_LOCAL_INS_LAT,
 	HISTC_GLOBAL_INS_LAT,
+	HISTC_P_STAGE_CYC,
 	HISTC_NR_COLS, /* Last entry */
 };
 
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 859832a82496..a6fed96d783d 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -1302,8 +1302,10 @@ static void dump_sample(struct evsel *evsel, union perf_event *event,
 
 	if (sample_type & PERF_SAMPLE_WEIGHT_TYPE) {
 		printf("... weight: %" PRIu64 "", sample->weight);
-			if (sample_type & PERF_SAMPLE_WEIGHT_STRUCT)
+			if (sample_type & PERF_SAMPLE_WEIGHT_STRUCT) {
 				printf(",0x%"PRIx16"", sample->ins_lat);
+				printf(",0x%"PRIx16"", sample->p_stage_cyc);
+			}
 		printf("\n");
 	}
 
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index eeb03e749181..d262261ad1a6 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -37,7 +37,7 @@
 const char	*parent_pattern = default_parent_pattern;
 const char	*default_sort_order = "comm,dso,symbol";
 const char	default_branch_sort_order[] = "comm,dso_from,symbol_from,symbol_to,cycles";
-const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat";
+const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,p_stage_cyc";
 const char	default_top_sort_order[] = "dso,symbol";
 const char	default_diff_sort_order[] = "dso,symbol";
 const char	default_tracepoint_sort_order[] = "trace";
@@ -46,7 +46,7 @@
 regex_t		ignore_callees_regex;
 int		have_ignore_callees = 0;
 enum sort_mode	sort__mode = SORT_MODE__NORMAL;
-const char	*dynamic_headers[] = {"local_ins_lat"};
+const char	*dynamic_headers[] = {"local_ins_lat", "p_stage_cyc"};
 
 /*
  * Replaces all occurrences of a char used with the:
@@ -1410,6 +1410,25 @@ struct sort_entry sort_global_ins_lat = {
 	.se_width_idx	= HISTC_GLOBAL_INS_LAT,
 };
 
+static int64_t
+sort__global_p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
+{
+	return left->stat.p_stage_cyc - right->stat.p_stage_cyc;
+}
+
+static int hist_entry__p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
+					size_t size, unsigned int width)
+{
+	return repsep_snprintf(bf, size, "%-*u", width, he->stat.p_stage_cyc);
+}
+
+struct sort_entry sort_p_stage_cyc = {
+	.se_header      = "Pipeline Stage Cycle",
+	.se_cmp         = sort__global_p_stage_cyc_cmp,
+	.se_snprintf	= hist_entry__p_stage_cyc_snprintf,
+	.se_width_idx	= HISTC_P_STAGE_CYC,
+};
+
 struct sort_entry sort_mem_daddr_sym = {
 	.se_header	= "Data Symbol",
 	.se_cmp		= sort__daddr_cmp,
@@ -1853,6 +1872,7 @@ static void sort_dimension_add_dynamic_header(struct sort_dimension *sd)
 	DIM(SORT_CODE_PAGE_SIZE, "code_page_size", sort_code_page_size),
 	DIM(SORT_LOCAL_INS_LAT, "local_ins_lat", sort_local_ins_lat),
 	DIM(SORT_GLOBAL_INS_LAT, "ins_lat", sort_global_ins_lat),
+	DIM(SORT_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_p_stage_cyc),
 };
 
 #undef DIM
diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
index 63f67a3f3630..d9795ca0d676 100644
--- a/tools/perf/util/sort.h
+++ b/tools/perf/util/sort.h
@@ -51,6 +51,7 @@ struct he_stat {
 	u64			period_guest_us;
 	u64			weight;
 	u64			ins_lat;
+	u64			p_stage_cyc;
 	u32			nr_events;
 };
 
@@ -234,6 +235,7 @@ enum sort_type {
 	SORT_CODE_PAGE_SIZE,
 	SORT_LOCAL_INS_LAT,
 	SORT_GLOBAL_INS_LAT,
+	SORT_PIPELINE_STAGE_CYC,
 
 	/* branch stack specific sort keys */
 	__SORT_BRANCH_STACK,
-- 
1.8.3.1

