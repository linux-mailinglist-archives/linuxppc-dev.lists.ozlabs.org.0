Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B01175367
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:41:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W8C63b6VzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:41:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7rK4tKmzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:25:05 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225Og13011610
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:25:03 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfhqp5v1u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:25:03 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:25:00 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:54 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225OrdN48693362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F11525204F;
 Mon,  2 Mar 2020 05:24:52 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BD2A952050;
 Mon,  2 Mar 2020 05:24:49 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 10/11] perf annotate: Preparation for hazard
Date: Mon,  2 Mar 2020 10:53:54 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0020-0000-0000-000003AF5D2C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0021-0000-0000-000022078669
Message-Id: <20200302052355.36365-11-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_01:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 adrian.hunter@intel.com, acme@kernel.org, alexander.shishkin@linux.intel.com,
 yao.jin@linux.intel.com, mingo@redhat.com, paulus@samba.org,
 eranian@google.com, robert.richter@amd.com, namhyung@kernel.org,
 kim.phillips@amd.com, jolsa@redhat.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce 'struct hazard_hist' that will contain hazard specific
information for annotate. Add Array of list of 'struct hazard_hist'
into 'struct annotated_source' where array length = symbol size and
each member of list contain hazard info from associated perf sample.
This information is prepared while parsing samples in perf report.
Also, this is just a preparation step for annotate and followup
patch does actual annotate ui changes.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/perf/builtin-report.c |  1 +
 tools/perf/util/annotate.c  | 75 +++++++++++++++++++++++++++++++++++++
 tools/perf/util/annotate.h  | 14 +++++++
 tools/perf/util/hist.c      | 13 +++++++
 tools/perf/util/hist.h      |  4 ++
 tools/perf/util/machine.c   |  6 +++
 tools/perf/util/machine.h   |  3 ++
 7 files changed, 116 insertions(+)

diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index a47542a12da1..ff950ff8dd51 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -301,6 +301,7 @@ static int process_sample_event(struct perf_tool *tool,
 		hist__account_cycles(sample->branch_stack, &al, sample,
 				     rep->nonany_branch_mode,
 				     &rep->total_cycles);
+		hist__capture_haz_info(&al, sample, evsel);
 	}
 
 	ret = hist_entry_iter__add(&iter, &al, rep->max_stack, rep);
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 8aef60a6ffea..766934b0f36d 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -36,6 +36,7 @@
 #include "string2.h"
 #include "util/event.h"
 #include "arch/common.h"
+#include "hazard.h"
 #include <regex.h>
 #include <pthread.h>
 #include <linux/bitops.h>
@@ -800,6 +801,21 @@ static int symbol__alloc_hist_cycles(struct symbol *sym)
 	return 0;
 }
 
+static int symbol__alloc_hist_hazard(struct symbol *sym)
+{
+	struct annotation *notes = symbol__annotation(sym);
+	const size_t size = symbol__size(sym);
+	size_t i;
+
+	notes->src->haz_hist = calloc(size, sizeof(struct hazard_hist));
+	if (notes->src->haz_hist == NULL)
+		return -1;
+
+	for (i = 0; i < size; i++)
+		INIT_LIST_HEAD(&notes->src->haz_hist[i].list);
+	return 0;
+}
+
 void symbol__annotate_zero_histograms(struct symbol *sym)
 {
 	struct annotation *notes = symbol__annotation(sym);
@@ -920,6 +936,25 @@ static struct cyc_hist *symbol__cycles_hist(struct symbol *sym)
 	return notes->src->cycles_hist;
 }
 
+static struct hazard_hist *symbol__hazard_hist(struct symbol *sym)
+{
+	struct annotation *notes = symbol__annotation(sym);
+
+	if (notes->src == NULL) {
+		notes->src = annotated_source__new();
+		if (notes->src == NULL)
+			return NULL;
+		goto alloc_haz_hist;
+	}
+
+	if (!notes->src->haz_hist) {
+alloc_haz_hist:
+		symbol__alloc_hist_hazard(sym);
+	}
+
+	return notes->src->haz_hist;
+}
+
 struct annotated_source *symbol__hists(struct symbol *sym, int nr_hists)
 {
 	struct annotation *notes = symbol__annotation(sym);
@@ -1014,6 +1049,46 @@ int addr_map_symbol__account_cycles(struct addr_map_symbol *ams,
 	return err;
 }
 
+int symbol__capture_haz_info(struct addr_map_symbol *ams,
+			     struct perf_sample *sample,
+			     struct evsel *evsel)
+{
+	struct hazard_hist *hh, *tmp;
+	u64 offset;
+	const char *arch = perf_env__arch(perf_evsel__env(evsel));
+
+	if (ams->ms.sym == NULL)
+		return 0;
+
+	hh = symbol__hazard_hist(ams->ms.sym);
+	if (!hh)
+		return -ENOMEM;
+
+	if (ams->al_addr < ams->ms.sym->start || ams->al_addr >= ams->ms.sym->end)
+		return -ERANGE;
+
+	offset = ams->al_addr - ams->ms.sym->start;
+
+	tmp = zalloc(sizeof(*tmp));
+	if (!tmp)
+		return -ENOMEM;
+
+	tmp->icache = perf_haz__icache_str(sample->pipeline_haz->icache, arch);
+	tmp->haz_stage = perf_haz__hstage_str(sample->pipeline_haz->hazard_stage,
+					      arch);
+	tmp->haz_reason = perf_haz__hreason_str(sample->pipeline_haz->hazard_stage,
+						sample->pipeline_haz->hazard_reason,
+						arch);
+	tmp->stall_stage = perf_haz__sstage_str(sample->pipeline_haz->stall_stage,
+						arch);
+	tmp->stall_reason = perf_haz__sreason_str(sample->pipeline_haz->stall_stage,
+						  sample->pipeline_haz->stall_reason,
+						  arch);
+
+	list_add(&tmp->list, &hh[offset].list);
+	return 0;
+}
+
 static unsigned annotation__count_insn(struct annotation *notes, u64 start, u64 end)
 {
 	unsigned n_insn = 0;
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index 89839713d242..a3803f89b8fc 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -249,6 +249,15 @@ struct cyc_hist {
 	u16	reset;
 };
 
+struct hazard_hist {
+	struct list_head list;
+	const char	 *icache;
+	const char	 *haz_stage;
+	const char	 *haz_reason;
+	const char	 *stall_stage;
+	const char	 *stall_reason;
+};
+
 /** struct annotated_source - symbols with hits have this attached as in sannotation
  *
  * @histograms: Array of addr hit histograms per event being monitored
@@ -271,6 +280,7 @@ struct annotated_source {
 	int    		   nr_histograms;
 	size_t		   sizeof_sym_hist;
 	struct cyc_hist	   *cycles_hist;
+	struct hazard_hist *haz_hist; /* Array of list. Array length = symbol size */
 	struct sym_hist	   *histograms;
 };
 
@@ -343,6 +353,10 @@ int addr_map_symbol__account_cycles(struct addr_map_symbol *ams,
 				    struct addr_map_symbol *start,
 				    unsigned cycles);
 
+int symbol__capture_haz_info(struct addr_map_symbol *ams,
+			     struct perf_sample *sample,
+			     struct evsel *evsel);
+
 int hist_entry__inc_addr_samples(struct hist_entry *he, struct perf_sample *sample,
 				 struct evsel *evsel, u64 addr);
 
diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index d690d08b0f64..3cbfebb80f68 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -2702,6 +2702,19 @@ void hist__account_cycles(struct branch_stack *bs, struct addr_location *al,
 	}
 }
 
+void hist__capture_haz_info(struct addr_location *al,
+			    struct perf_sample *sample,
+			    struct evsel *evsel)
+{
+	struct addr_map_symbol ams;
+
+	if (!sample->pipeline_haz)
+		return;
+
+	sample__resolve_haz(al, &ams, sample);
+	symbol__capture_haz_info(&ams, sample, evsel);
+}
+
 size_t perf_evlist__fprintf_nr_events(struct evlist *evlist, FILE *fp)
 {
 	struct evsel *pos;
diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
index 063d65985a11..086c1dfde21f 100644
--- a/tools/perf/util/hist.h
+++ b/tools/perf/util/hist.h
@@ -554,6 +554,10 @@ void hist__account_cycles(struct branch_stack *bs, struct addr_location *al,
 			  struct perf_sample *sample, bool nonany_branch_mode,
 			  u64 *total_cycles);
 
+void hist__capture_haz_info(struct addr_location *al,
+			    struct perf_sample *sample,
+			    struct evsel *evsel);
+
 struct option;
 int parse_filter_percentage(const struct option *opt, const char *arg, int unset);
 int perf_hist_config(const char *var, const char *value);
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index fb5c2cd44d30..e575488a1390 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2094,6 +2094,12 @@ struct branch_info *sample__resolve_bstack(struct perf_sample *sample,
 	return bi;
 }
 
+void sample__resolve_haz(struct addr_location *al, struct addr_map_symbol *ams,
+			 struct perf_sample *sample)
+{
+	ip__resolve_ams(al->thread, ams, sample->ip);
+}
+
 static void save_iterations(struct iterations *iter,
 			    struct branch_entry *be, int nr)
 {
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index be0a930eca89..e9a298b5430c 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -173,6 +173,9 @@ struct branch_info *sample__resolve_bstack(struct perf_sample *sample,
 struct mem_info *sample__resolve_mem(struct perf_sample *sample,
 				     struct addr_location *al);
 
+void sample__resolve_haz(struct addr_location *al, struct addr_map_symbol *ams,
+			 struct perf_sample *sample);
+
 struct callchain_cursor;
 
 int thread__resolve_callchain(struct thread *thread,
-- 
2.21.1

