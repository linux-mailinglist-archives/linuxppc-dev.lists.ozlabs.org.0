Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AABD175363
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:39:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W88S6GsvzDqgV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:39:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7rB3p8dzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:24:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225JYEM001195
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:24:56 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmwut6tv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:24:55 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:24:53 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:47 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225OkBl54788284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1566B52050;
 Mon,  2 Mar 2020 05:24:46 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B02C752054;
 Mon,  2 Mar 2020 05:24:42 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 08/11] perf report: Enable hazard mode
Date: Mon,  2 Mar 2020 10:53:52 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0008-0000-0000-000003583694
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0009-0000-0000-00004A7960BC
Message-Id: <20200302052355.36365-9-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-01_09:2020-02-28,
 2020-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=2 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020039
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
Cc: mark.rutland@arm.com, ravi.bangoria@linux.ibm.com, ak@linux.intel.com,
 maddy@linux.ibm.com, peterz@infradead.org, alexey.budankov@linux.intel.com,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, adrian.hunter@intel.com,
 acme@kernel.org, alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com,
 mingo@redhat.com, paulus@samba.org, eranian@google.com, robert.richter@amd.com,
 namhyung@kernel.org, kim.phillips@amd.com, jolsa@redhat.com,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Introduce --hazard with perf report to show perf report with hazard
data. Hazard mode columns are Instruction Type, Hazard Stage, Hazard
Reason, Stall Stage, Stall Reason and Icache access. Default sort
order is sym, dso, inst type, hazard stage, hazard reason, stall
stage, stall reason, inst cache.

Sample o/p on IBM PowerPC machine:

  Overhead  Symbol          Shared  Instruction Type  Hazard Stage   Hazard Reason         Stall Stage   Stall Reason  ICache access
    36.58%  [.] thread_run  ebizzy  Load              LSU            Mispredict            LSU           Load fin      L1 hit
     9.46%  [.] thread_run  ebizzy  Load              LSU            Mispredict            LSU           Dcache_miss   L1 hit
     1.76%  [.] thread_run  ebizzy  Fixed point       -              -                     -             -             L1 hit
     1.31%  [.] thread_run  ebizzy  Load              LSU            ERAT Miss             LSU           Load fin      L1 hit
     1.27%  [.] thread_run  ebizzy  Load              LSU            Mispredict            -             -             L1 hit
     1.16%  [.] thread_run  ebizzy  Fixed point       -              -                     FXU           Fixed cycle   L1 hit
     0.50%  [.] thread_run  ebizzy  Fixed point       ISU            Source Unavailable    FXU           Fixed cycle   L1 hit
     0.30%  [.] thread_run  ebizzy  Load              LSU            LMQ Full, DERAT Miss  LSU           Load fin      L1 hit
     0.24%  [.] thread_run  ebizzy  Load              LSU            ERAT Miss             -             -             L1 hit
     0.08%  [.] thread_run  ebizzy  -                 -              -                     BRU           Fixed cycle   L1 hit
     0.05%  [.] thread_run  ebizzy  Branch            -              -                     BRU           Fixed cycle   L1 hit
     0.04%  [.] thread_run  ebizzy  Fixed point       ISU            Source Unavailable    -             -             L1 hit

Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/perf/builtin-report.c |  28 +++++
 tools/perf/util/hist.c      |  77 ++++++++++++
 tools/perf/util/hist.h      |   7 ++
 tools/perf/util/sort.c      | 230 ++++++++++++++++++++++++++++++++++++
 tools/perf/util/sort.h      |  22 ++++
 5 files changed, 364 insertions(+)

diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 72a12b69f120..a47542a12da1 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -77,6 +77,7 @@ struct report {
 	bool			show_threads;
 	bool			inverted_callchain;
 	bool			mem_mode;
+	bool			hazard;
 	bool			stats_mode;
 	bool			tasks_mode;
 	bool			mmaps_mode;
@@ -285,6 +286,8 @@ static int process_sample_event(struct perf_tool *tool,
 		iter.ops = &hist_iter_branch;
 	} else if (rep->mem_mode) {
 		iter.ops = &hist_iter_mem;
+	} else if (rep->hazard) {
+		iter.ops = &hist_iter_haz;
 	} else if (symbol_conf.cumulate_callchain) {
 		iter.ops = &hist_iter_cumulative;
 	} else {
@@ -396,6 +399,14 @@ static int report__setup_sample_type(struct report *rep)
 		}
 	}
 
+	if (sort__mode == SORT_MODE__HAZARD) {
+		if (!is_pipe && !(sample_type & PERF_SAMPLE_PIPELINE_HAZ)) {
+			ui__error("Selected --hazard but no hazard data. "
+				  "Did you call perf record without --hazard?\n");
+			return -1;
+		}
+	}
+
 	if (symbol_conf.use_callchain || symbol_conf.cumulate_callchain) {
 		if ((sample_type & PERF_SAMPLE_REGS_USER) &&
 		    (sample_type & PERF_SAMPLE_STACK_USER)) {
@@ -484,6 +495,9 @@ static size_t hists__fprintf_nr_sample_events(struct hists *hists, struct report
 	if (rep->mem_mode) {
 		ret += fprintf(fp, "\n# Total weight : %" PRIu64, nr_events);
 		ret += fprintf(fp, "\n# Sort order   : %s", sort_order ? : default_mem_sort_order);
+	} else if (rep->hazard) {
+		ret += fprintf(fp, "\n# Event count (approx.): %" PRIu64, nr_events);
+		ret += fprintf(fp, "\n# Sort order: %s", sort_order ? : default_haz_sort_order);
 	} else
 		ret += fprintf(fp, "\n# Event count (approx.): %" PRIu64, nr_events);
 
@@ -1228,6 +1242,7 @@ int cmd_report(int argc, const char **argv)
 	OPT_BOOLEAN(0, "demangle-kernel", &symbol_conf.demangle_kernel,
 		    "Enable kernel symbol demangling"),
 	OPT_BOOLEAN(0, "mem-mode", &report.mem_mode, "mem access profile"),
+	OPT_BOOLEAN(0, "hazard", &report.hazard, "Processor pipeline hazard and stalls"),
 	OPT_INTEGER(0, "samples", &symbol_conf.res_sample,
 		    "Number of samples to save per histogram entry for individual browsing"),
 	OPT_CALLBACK(0, "percent-limit", &report, "percent",
@@ -1394,6 +1409,19 @@ int cmd_report(int argc, const char **argv)
 		symbol_conf.cumulate_callchain = false;
 	}
 
+	if (report.hazard) {
+		if (sort__mode == SORT_MODE__BRANCH) {
+			pr_err("branch and hazard incompatible\n");
+			goto error;
+		}
+		if (sort__mode == SORT_MODE__MEMORY) {
+			pr_err("mem-mode and hazard incompatible\n");
+			goto error;
+		}
+		sort__mode = SORT_MODE__HAZARD;
+		symbol_conf.cumulate_callchain = false;
+	}
+
 	if (symbol_conf.report_hierarchy) {
 		/* disable incompatible options */
 		symbol_conf.cumulate_callchain = false;
diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index 6d23efaa52c8..d690d08b0f64 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -203,6 +203,12 @@ void hists__calc_col_len(struct hists *hists, struct hist_entry *h)
 	hists__new_col_len(hists, HISTC_MEM_LVL, 21 + 3);
 	hists__new_col_len(hists, HISTC_LOCAL_WEIGHT, 12);
 	hists__new_col_len(hists, HISTC_GLOBAL_WEIGHT, 12);
+	hists__new_col_len(hists, HISTC_HAZ_ITYPE, 31);
+	hists__new_col_len(hists, HISTC_HAZ_ICACHE, 14);
+	hists__new_col_len(hists, HISTC_HAZ_HSTAGE, 13);
+	hists__new_col_len(hists, HISTC_HAZ_HREASON, 27);
+	hists__new_col_len(hists, HISTC_HAZ_SSTAGE, 12);
+	hists__new_col_len(hists, HISTC_HAZ_SREASON, 22);
 	if (symbol_conf.nanosecs)
 		hists__new_col_len(hists, HISTC_TIME, 16);
 	else
@@ -864,6 +870,69 @@ iter_finish_mem_entry(struct hist_entry_iter *iter,
 	return err;
 }
 
+static int iter_prepare_haz_entry(struct hist_entry_iter *iter,
+				  struct addr_location *al __maybe_unused)
+{
+	struct perf_sample *sample = iter->sample;
+	struct perf_pipeline_haz_data *haz_data;
+
+	if (!sample->pipeline_haz) {
+		iter->priv = NULL;
+		return 0;
+	}
+
+	haz_data = zalloc(sizeof(*haz_data));
+	if (!haz_data)
+		return -ENOMEM;
+
+	memcpy(haz_data, sample->pipeline_haz, sizeof(*haz_data));
+	iter->priv = haz_data;
+	return 0;
+}
+
+static int iter_add_single_haz_entry(struct hist_entry_iter *iter,
+				     struct addr_location *al __maybe_unused)
+{
+	struct perf_pipeline_haz_data *haz_data = iter->priv;
+	struct hists *hists = evsel__hists(iter->evsel);
+	struct perf_sample *sample = iter->sample;
+	struct hist_entry *he;
+
+	he = hists__add_entry(hists, al, iter->parent, NULL, NULL, haz_data,
+			      sample, true);
+	if (!he)
+		return -ENOMEM;
+
+	iter->he = he;
+	return 0;
+}
+
+static int iter_finish_haz_entry(struct hist_entry_iter *iter,
+				 struct addr_location *al __maybe_unused)
+{
+	struct evsel *evsel = iter->evsel;
+	struct hists *hists = evsel__hists(evsel);
+	struct hist_entry *he = iter->he;
+	int err = -EINVAL;
+
+	if (he == NULL)
+		goto out;
+
+	hists__inc_nr_samples(hists, he->filtered);
+
+	err = hist_entry__append_callchain(he, iter->sample);
+
+out:
+	/*
+	 * We don't need to free iter->priv (perf_pipeline_haz_data) here since
+	 * the hazard info was either already freed in hists__findnew_entry() or
+	 * passed to a new hist entry by hist_entry__new().
+	 */
+	iter->priv = NULL;
+	iter->he = NULL;
+	return err;
+}
+
 static int
 iter_prepare_branch_entry(struct hist_entry_iter *iter, struct addr_location *al)
 {
@@ -1128,6 +1197,14 @@ iter_finish_cumulative_entry(struct hist_entry_iter *iter,
 	return 0;
 }
 
+const struct hist_iter_ops hist_iter_haz = {
+	.prepare_entry		= iter_prepare_haz_entry,
+	.add_single_entry	= iter_add_single_haz_entry,
+	.next_entry		= iter_next_nop_entry,
+	.add_next_entry		= iter_add_next_nop_entry,
+	.finish_entry		= iter_finish_haz_entry,
+};
+
 const struct hist_iter_ops hist_iter_mem = {
 	.prepare_entry 		= iter_prepare_mem_entry,
 	.add_single_entry 	= iter_add_single_mem_entry,
diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
index a4d12a503126..063d65985a11 100644
--- a/tools/perf/util/hist.h
+++ b/tools/perf/util/hist.h
@@ -69,6 +69,12 @@ enum hist_column {
 	HISTC_SYM_SIZE,
 	HISTC_DSO_SIZE,
 	HISTC_SYMBOL_IPC,
+	HISTC_HAZ_ITYPE,
+	HISTC_HAZ_ICACHE,
+	HISTC_HAZ_HSTAGE,
+	HISTC_HAZ_HREASON,
+	HISTC_HAZ_SSTAGE,
+	HISTC_HAZ_SREASON,
 	HISTC_NR_COLS, /* Last entry */
 };
 
@@ -132,6 +138,7 @@ struct hist_entry_iter {
 extern const struct hist_iter_ops hist_iter_normal;
 extern const struct hist_iter_ops hist_iter_branch;
 extern const struct hist_iter_ops hist_iter_mem;
+extern const struct hist_iter_ops hist_iter_haz;
 extern const struct hist_iter_ops hist_iter_cumulative;
 
 struct hist_entry *hists__add_entry(struct hists *hists,
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index ab0cfd790ad0..b6d47e7160af 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -23,6 +23,7 @@
 #include "strbuf.h"
 #include <traceevent/event-parse.h>
 #include "mem-events.h"
+#include "hazard.h"
 #include "annotate.h"
 #include "time-utils.h"
 #include <linux/kernel.h>
@@ -34,6 +35,7 @@ const char	*parent_pattern = default_parent_pattern;
 const char	*default_sort_order = "comm,dso,symbol";
 const char	default_branch_sort_order[] = "comm,dso_from,symbol_from,symbol_to,cycles";
 const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked";
+const char	default_haz_sort_order[] = "sym,dso,itype,hstage,hreason,sstage,sreason,icache";
 const char	default_top_sort_order[] = "dso,symbol";
 const char	default_diff_sort_order[] = "dso,symbol";
 const char	default_tracepoint_sort_order[] = "trace";
@@ -1377,6 +1379,190 @@ struct sort_entry sort_mem_dcacheline = {
 	.se_width_idx	= HISTC_MEM_DCACHELINE,
 };
 
+static int64_t sort__itype_cmp(struct hist_entry *l, struct hist_entry *r)
+{
+	u8 itype_l, itype_r;
+
+	itype_l = l->haz_data ? l->haz_data->itype : PERF_HAZ__ITYPE_NA;
+	itype_r = r->haz_data ? r->haz_data->itype : PERF_HAZ__ITYPE_NA;
+
+	return (int64_t)(itype_r - itype_l);
+}
+
+static int hist_entry__itype_snprintf(struct hist_entry *he, char *bf,
+				       size_t size, unsigned int width)
+{
+	const char *arch;
+	const char *itype = "-";
+
+	arch = hist_entry__get_arch(he);
+	if (he->haz_data)
+		itype = perf_haz__itype_str(he->haz_data->itype, arch);
+
+	return repsep_snprintf(bf, size, "%-*s", width, itype);
+}
+
+struct sort_entry sort_haz_inst_type = {
+	.se_header	= "Instruction Type",
+	.se_cmp		= sort__itype_cmp,
+	.se_snprintf	= hist_entry__itype_snprintf,
+	.se_width_idx	= HISTC_HAZ_ITYPE,
+};
+
+static int64_t sort__icache_cmp(struct hist_entry *l, struct hist_entry *r)
+{
+	u8 icache_l, icache_r;
+
+	icache_l = l->haz_data ? l->haz_data->icache : PERF_HAZ__ICACHE_NA;
+	icache_r = r->haz_data ? r->haz_data->icache : PERF_HAZ__ICACHE_NA;
+
+	return (int64_t)(icache_r - icache_l);
+}
+
+static int hist_entry__icache_snprintf(struct hist_entry *he, char *bf,
+					size_t size, unsigned int width)
+{
+	const char *arch;
+	const char *icache = "-";
+
+	arch = hist_entry__get_arch(he);
+	if (he->haz_data)
+		icache = perf_haz__icache_str(he->haz_data->icache, arch);
+
+	return repsep_snprintf(bf, size, "%-*s", width, icache);
+}
+
+struct sort_entry sort_haz_inst_cache = {
+	.se_header      = "ICache access",
+	.se_cmp         = sort__icache_cmp,
+	.se_snprintf    = hist_entry__icache_snprintf,
+	.se_width_idx   = HISTC_HAZ_ICACHE,
+};
+
+static int64_t sort__hstage_cmp(struct hist_entry *l, struct hist_entry *r)
+{
+	u8 hstage_l, hstage_r;
+
+	hstage_l = l->haz_data ? l->haz_data->hazard_stage : PERF_HAZ__PIPE_STAGE_NA;
+	hstage_r = r->haz_data ? r->haz_data->hazard_stage : PERF_HAZ__PIPE_STAGE_NA;
+
+	return (int64_t)(hstage_r - hstage_l);
+}
+
+static int hist_entry__hstage_snprintf(struct hist_entry *he, char *bf,
+					size_t size, unsigned int width)
+{
+	const char *arch;
+	const char *hstage = "-";
+
+	arch = hist_entry__get_arch(he);
+	if (he->haz_data)
+		hstage = perf_haz__hstage_str(he->haz_data->hazard_stage, arch);
+
+	return repsep_snprintf(bf, size, "%-*s", width, hstage);
+}
+
+struct sort_entry sort_haz_hazard_stage = {
+	.se_header      = "Hazard Stage",
+	.se_cmp         = sort__hstage_cmp,
+	.se_snprintf    = hist_entry__hstage_snprintf,
+	.se_width_idx   = HISTC_HAZ_HSTAGE,
+};
+
+static int64_t sort__hreason_cmp(struct hist_entry *l, struct hist_entry *r)
+{
+	u8 hreason_l, hreason_r;
+
+	hreason_l = l->haz_data ? l->haz_data->hazard_reason : PERF_HAZ__HREASON_NA;
+	hreason_r = r->haz_data ? r->haz_data->hazard_reason : PERF_HAZ__HREASON_NA;
+
+	return (int64_t)(hreason_r - hreason_l);
+}
+
+static int hist_entry__hreason_snprintf(struct hist_entry *he, char *bf,
+					 size_t size, unsigned int width)
+{
+	const char *arch;
+	const char *hreason = "-";
+
+	arch = hist_entry__get_arch(he);
+	if (he->haz_data) {
+		hreason = perf_haz__hreason_str(he->haz_data->hazard_stage,
+					he->haz_data->hazard_reason, arch);
+	}
+
+	return repsep_snprintf(bf, size, "%-*s", width, hreason);
+}
+
+struct sort_entry sort_haz_hazard_reason = {
+	.se_header      = "Hazard Reason",
+	.se_cmp         = sort__hreason_cmp,
+	.se_snprintf    = hist_entry__hreason_snprintf,
+	.se_width_idx   = HISTC_HAZ_HREASON,
+};
+
+static int64_t sort__sstage_cmp(struct hist_entry *l, struct hist_entry *r)
+{
+	u8 sstage_l, sstage_r;
+
+	sstage_l = l->haz_data ? l->haz_data->stall_stage : PERF_HAZ__PIPE_STAGE_NA;
+	sstage_r = r->haz_data ? r->haz_data->stall_stage : PERF_HAZ__PIPE_STAGE_NA;
+
+	return (int64_t)(sstage_r - sstage_l);
+}
+
+static int hist_entry__sstage_snprintf(struct hist_entry *he, char *bf,
+					size_t size, unsigned int width)
+{
+	const char *arch;
+	const char *sstage = "-";
+
+	arch = hist_entry__get_arch(he);
+	if (he->haz_data)
+		sstage = perf_haz__sstage_str(he->haz_data->stall_stage, arch);
+
+	return repsep_snprintf(bf, size, "%-*s", width, sstage);
+}
+
+struct sort_entry sort_haz_stall_stage = {
+	.se_header      = "Stall Stage",
+	.se_cmp         = sort__sstage_cmp,
+	.se_snprintf    = hist_entry__sstage_snprintf,
+	.se_width_idx   = HISTC_HAZ_SSTAGE,
+};
+
+static int64_t sort__sreason_cmp(struct hist_entry *l, struct hist_entry *r)
+{
+	u8 sreason_l, sreason_r;
+
+	sreason_l = l->haz_data ? l->haz_data->stall_reason : PERF_HAZ__SREASON_NA;
+	sreason_r = r->haz_data ? r->haz_data->stall_reason : PERF_HAZ__SREASON_NA;
+
+	return (int64_t)(sreason_r - sreason_l);
+}
+
+static int hist_entry__sreason_snprintf(struct hist_entry *he, char *bf,
+					     size_t size, unsigned int width)
+{
+	const char *arch;
+	const char *sreason = "-";
+
+	arch = hist_entry__get_arch(he);
+	if (he->haz_data) {
+		sreason = perf_haz__sreason_str(he->haz_data->stall_stage,
+					he->haz_data->stall_reason, arch);
+	}
+
+	return repsep_snprintf(bf, size, "%-*s", width, sreason);
+}
+
+struct sort_entry sort_haz_stall_reason = {
+	.se_header      = "Stall Reason",
+	.se_cmp         = sort__sreason_cmp,
+	.se_snprintf    = hist_entry__sreason_snprintf,
+	.se_width_idx   = HISTC_HAZ_SREASON,
+};
+
 static int64_t
 sort__phys_daddr_cmp(struct hist_entry *left, struct hist_entry *right)
 {
@@ -1699,6 +1885,19 @@ static struct sort_dimension memory_sort_dimensions[] = {
 
 #undef DIM
 
+#define DIM(d, n, func) [d - __SORT_HAZARD_MODE] = { .name = n, .entry = &(func) }
+
+static struct sort_dimension hazard_sort_dimensions[] = {
+       DIM(SORT_HAZ_ITYPE, "itype", sort_haz_inst_type),
+       DIM(SORT_HAZ_ICACHE, "icache", sort_haz_inst_cache),
+       DIM(SORT_HAZ_HSTAGE, "hstage", sort_haz_hazard_stage),
+       DIM(SORT_HAZ_HREASON, "hreason", sort_haz_hazard_reason),
+       DIM(SORT_HAZ_SSTAGE, "sstage", sort_haz_stall_stage),
+       DIM(SORT_HAZ_SREASON, "sreason", sort_haz_stall_reason),
+};
+
+#undef DIM
+
 struct hpp_dimension {
 	const char		*name;
 	struct perf_hpp_fmt	*fmt;
@@ -2643,6 +2842,19 @@ int sort_dimension__add(struct perf_hpp_list *list, const char *tok,
 		return 0;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(hazard_sort_dimensions); i++) {
+		struct sort_dimension *sd = &hazard_sort_dimensions[i];
+
+		if (strncasecmp(tok, sd->name, strlen(tok)))
+			continue;
+
+		if (sort__mode != SORT_MODE__HAZARD)
+			return -EINVAL;
+
+		__sort_dimension__add(sd, list, level);
+		return 0;
+	}
+
 	if (!add_dynamic_entry(evlist, tok, level))
 		return 0;
 
@@ -2705,6 +2917,7 @@ static const char *get_default_sort_order(struct evlist *evlist)
 		default_top_sort_order,
 		default_diff_sort_order,
 		default_tracepoint_sort_order,
+		default_haz_sort_order,
 	};
 	bool use_trace = true;
 	struct evsel *evsel;
@@ -2976,6 +3189,18 @@ int output_field_add(struct perf_hpp_list *list, char *tok)
 		return __sort_dimension__add_output(list, sd);
 	}
 
+	for (i = 0; i < ARRAY_SIZE(hazard_sort_dimensions); i++) {
+		struct sort_dimension *sd = &hazard_sort_dimensions[i];
+
+		if (strncasecmp(tok, sd->name, strlen(tok)))
+			continue;
+
+		if (sort__mode != SORT_MODE__HAZARD)
+			return -EINVAL;
+
+		return __sort_dimension__add_output(list, sd);
+	}
+
 	return -ESRCH;
 }
 
@@ -3014,6 +3239,9 @@ void reset_dimensions(void)
 
 	for (i = 0; i < ARRAY_SIZE(memory_sort_dimensions); i++)
 		memory_sort_dimensions[i].taken = 0;
+
+	for (i = 0; i < ARRAY_SIZE(hazard_sort_dimensions); i++)
+		hazard_sort_dimensions[i].taken = 0;
 }
 
 bool is_strict_order(const char *order)
@@ -3148,6 +3376,8 @@ const char *sort_help(const char *prefix)
 			    ARRAY_SIZE(bstack_sort_dimensions), &len);
 	add_sort_string(&sb, memory_sort_dimensions,
 			    ARRAY_SIZE(memory_sort_dimensions), &len);
+	add_sort_string(&sb, hazard_sort_dimensions,
+			    ARRAY_SIZE(hazard_sort_dimensions), &len);
 	s = strbuf_detach(&sb, NULL);
 	strbuf_release(&sb);
 	return s;
diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
index 55eb65fd593f..3c18ece0aa4f 100644
--- a/tools/perf/util/sort.h
+++ b/tools/perf/util/sort.h
@@ -12,6 +12,7 @@
 #include "hist.h"
 #include "stat.h"
 #include "spark.h"
+#include "env.h"
 
 struct option;
 struct thread;
@@ -36,6 +37,7 @@ extern struct sort_entry sort_sym_to;
 extern struct sort_entry sort_srcline;
 extern enum sort_type sort__first_dimension;
 extern const char default_mem_sort_order[];
+extern const char default_haz_sort_order[];
 
 struct res_sample {
 	u64 time;
@@ -199,6 +201,16 @@ static inline float hist_entry__get_percent_limit(struct hist_entry *he)
 	return period * 100.0 / total_period;
 }
 
+static inline struct perf_env *hist_entry__env(struct hist_entry *he)
+{
+	return perf_evsel__env(hists_to_evsel(he->hists));
+}
+
+static inline const char *hist_entry__get_arch(struct hist_entry *he)
+{
+	return perf_env__arch(hist_entry__env(he));
+}
+
 enum sort_mode {
 	SORT_MODE__NORMAL,
 	SORT_MODE__BRANCH,
@@ -206,6 +218,7 @@ enum sort_mode {
 	SORT_MODE__TOP,
 	SORT_MODE__DIFF,
 	SORT_MODE__TRACEPOINT,
+	SORT_MODE__HAZARD,
 };
 
 enum sort_type {
@@ -254,6 +267,15 @@ enum sort_type {
 	SORT_MEM_DCACHELINE,
 	SORT_MEM_IADDR_SYMBOL,
 	SORT_MEM_PHYS_DADDR,
+
+	/* hazard mode specific sort keys */
+	__SORT_HAZARD_MODE,
+	SORT_HAZ_ITYPE = __SORT_HAZARD_MODE,
+	SORT_HAZ_ICACHE,
+	SORT_HAZ_HSTAGE,
+	SORT_HAZ_HREASON,
+	SORT_HAZ_SSTAGE,
+	SORT_HAZ_SREASON,
 };
 
 /*
-- 
2.21.1

