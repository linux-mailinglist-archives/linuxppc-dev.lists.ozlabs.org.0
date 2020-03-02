Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527C17535C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:35:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W84H4CrMzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:35:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7r35xsRzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:24:51 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225OgWa039449
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:24:48 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yfhs35yc6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:24:47 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:24:45 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:40 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225Od3R54591644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9A8752050;
 Mon,  2 Mar 2020 05:24:38 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 84A805204E;
 Mon,  2 Mar 2020 05:24:35 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 06/11] perf hists: Make a room for hazard info in struct
 hist_entry
Date: Mon,  2 Mar 2020 10:53:50 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0012-0000-0000-0000038C0D81
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0013-0000-0000-000021C8BF05
Message-Id: <20200302052355.36365-7-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_01:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 suspectscore=2 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003020039
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

To enable hazard mode with perf report (followup patch) we need to
have cpu pipeline hazard data available in hist_entry. Add hazard
info into struct hist_entry. Also add hazard_info as parameter to
hists__add_entry().

Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/perf/builtin-annotate.c |  2 +-
 tools/perf/builtin-c2c.c      |  4 ++--
 tools/perf/builtin-diff.c     |  6 +++---
 tools/perf/tests/hists_link.c |  4 ++--
 tools/perf/util/hist.c        | 22 +++++++++++++++-------
 tools/perf/util/hist.h        |  2 ++
 tools/perf/util/sort.h        |  1 +
 7 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 6c0a0412502e..78552a9428a6 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -249,7 +249,7 @@ static int perf_evsel__add_sample(struct evsel *evsel,
 	if (ann->has_br_stack && has_annotation(ann))
 		return process_branch_callback(evsel, sample, al, ann, machine);
 
-	he = hists__add_entry(hists, al, NULL, NULL, NULL, sample, true);
+	he = hists__add_entry(hists, al, NULL, NULL, NULL, NULL, sample, true);
 	if (he == NULL)
 		return -ENOMEM;
 
diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
index 246ac0b4d54f..2a1cb5cda6d9 100644
--- a/tools/perf/builtin-c2c.c
+++ b/tools/perf/builtin-c2c.c
@@ -292,7 +292,7 @@ static int process_sample_event(struct perf_tool *tool __maybe_unused,
 	c2c_decode_stats(&stats, mi);
 
 	he = hists__add_entry_ops(&c2c_hists->hists, &c2c_entry_ops,
-				  &al, NULL, NULL, mi,
+				  &al, NULL, NULL, mi, NULL,
 				  sample, true);
 	if (he == NULL)
 		goto free_mi;
@@ -326,7 +326,7 @@ static int process_sample_event(struct perf_tool *tool __maybe_unused,
 			goto free_mi;
 
 		he = hists__add_entry_ops(&c2c_hists->hists, &c2c_entry_ops,
-					  &al, NULL, NULL, mi,
+					  &al, NULL, NULL, mi, NULL,
 					  sample, true);
 		if (he == NULL)
 			goto free_mi;
diff --git a/tools/perf/builtin-diff.c b/tools/perf/builtin-diff.c
index f8b6ae557d8b..e32e91f89a18 100644
--- a/tools/perf/builtin-diff.c
+++ b/tools/perf/builtin-diff.c
@@ -412,15 +412,15 @@ static int diff__process_sample_event(struct perf_tool *tool,
 	}
 
 	if (compute != COMPUTE_CYCLES) {
-		if (!hists__add_entry(hists, &al, NULL, NULL, NULL, sample,
-				      true)) {
+		if (!hists__add_entry(hists, &al, NULL, NULL, NULL, NULL,
+				      sample, true)) {
 			pr_warning("problem incrementing symbol period, "
 				   "skipping event\n");
 			goto out_put;
 		}
 	} else {
 		if (!hists__add_entry_ops(hists, &block_hist_ops, &al, NULL,
-					  NULL, NULL, sample, true)) {
+					  NULL, NULL, NULL, sample, true)) {
 			pr_warning("problem incrementing symbol period, "
 				   "skipping event\n");
 			goto out_put;
diff --git a/tools/perf/tests/hists_link.c b/tools/perf/tests/hists_link.c
index a024d3f3a412..112a90818d2e 100644
--- a/tools/perf/tests/hists_link.c
+++ b/tools/perf/tests/hists_link.c
@@ -86,7 +86,7 @@ static int add_hist_entries(struct evlist *evlist, struct machine *machine)
 			if (machine__resolve(machine, &al, &sample) < 0)
 				goto out;
 
-			he = hists__add_entry(hists, &al, NULL,
+			he = hists__add_entry(hists, &al, NULL, NULL,
 						NULL, NULL, &sample, true);
 			if (he == NULL) {
 				addr_location__put(&al);
@@ -105,7 +105,7 @@ static int add_hist_entries(struct evlist *evlist, struct machine *machine)
 			if (machine__resolve(machine, &al, &sample) < 0)
 				goto out;
 
-			he = hists__add_entry(hists, &al, NULL,
+			he = hists__add_entry(hists, &al, NULL, NULL,
 						NULL, NULL, &sample, true);
 			if (he == NULL) {
 				addr_location__put(&al);
diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index ca5a8f4d007e..6d23efaa52c8 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -604,6 +604,7 @@ static struct hist_entry *hists__findnew_entry(struct hists *hists,
 			 * and will not be used anymore.
 			 */
 			mem_info__zput(entry->mem_info);
+			zfree(&entry->haz_data);
 
 			block_info__zput(entry->block_info);
 
@@ -678,6 +679,7 @@ __hists__add_entry(struct hists *hists,
 		   struct symbol *sym_parent,
 		   struct branch_info *bi,
 		   struct mem_info *mi,
+		   struct perf_pipeline_haz_data *haz_data,
 		   struct block_info *block_info,
 		   struct perf_sample *sample,
 		   bool sample_self,
@@ -712,6 +714,7 @@ __hists__add_entry(struct hists *hists,
 		.hists	= hists,
 		.branch_info = bi,
 		.mem_info = mi,
+		.haz_data = haz_data,
 		.block_info = block_info,
 		.transaction = sample->transaction,
 		.raw_data = sample->raw_data,
@@ -732,10 +735,11 @@ struct hist_entry *hists__add_entry(struct hists *hists,
 				    struct symbol *sym_parent,
 				    struct branch_info *bi,
 				    struct mem_info *mi,
+				    struct perf_pipeline_haz_data *haz_data,
 				    struct perf_sample *sample,
 				    bool sample_self)
 {
-	return __hists__add_entry(hists, al, sym_parent, bi, mi, NULL,
+	return __hists__add_entry(hists, al, sym_parent, bi, mi, haz_data, NULL,
 				  sample, sample_self, NULL);
 }
 
@@ -745,10 +749,11 @@ struct hist_entry *hists__add_entry_ops(struct hists *hists,
 					struct symbol *sym_parent,
 					struct branch_info *bi,
 					struct mem_info *mi,
+					struct perf_pipeline_haz_data *haz_data,
 					struct perf_sample *sample,
 					bool sample_self)
 {
-	return __hists__add_entry(hists, al, sym_parent, bi, mi, NULL,
+	return __hists__add_entry(hists, al, sym_parent, bi, mi, haz_data, NULL,
 				  sample, sample_self, ops);
 }
 
@@ -823,7 +828,7 @@ iter_add_single_mem_entry(struct hist_entry_iter *iter, struct addr_location *al
 	sample->period = cost;
 
 	he = hists__add_entry(hists, al, iter->parent, NULL, mi,
-			      sample, true);
+			      NULL, sample, true);
 	if (!he)
 		return -ENOMEM;
 
@@ -926,7 +931,7 @@ iter_add_next_branch_entry(struct hist_entry_iter *iter, struct addr_location *a
 	sample->weight = bi->flags.cycles ? bi->flags.cycles : 1;
 
 	he = hists__add_entry(hists, al, iter->parent, &bi[i], NULL,
-			      sample, true);
+			      NULL, sample, true);
 	if (he == NULL)
 		return -ENOMEM;
 
@@ -963,7 +968,7 @@ iter_add_single_normal_entry(struct hist_entry_iter *iter, struct addr_location
 	struct hist_entry *he;
 
 	he = hists__add_entry(evsel__hists(evsel), al, iter->parent, NULL, NULL,
-			      sample, true);
+			      NULL, sample, true);
 	if (he == NULL)
 		return -ENOMEM;
 
@@ -1024,7 +1029,7 @@ iter_add_single_cumulative_entry(struct hist_entry_iter *iter,
 	int err = 0;
 
 	he = hists__add_entry(hists, al, iter->parent, NULL, NULL,
-			      sample, true);
+			      NULL, sample, true);
 	if (he == NULL)
 		return -ENOMEM;
 
@@ -1101,7 +1106,7 @@ iter_add_next_cumulative_entry(struct hist_entry_iter *iter,
 	}
 
 	he = hists__add_entry(evsel__hists(evsel), al, iter->parent, NULL, NULL,
-			      sample, false);
+			      NULL, sample, false);
 	if (he == NULL)
 		return -ENOMEM;
 
@@ -1268,6 +1273,9 @@ void hist_entry__delete(struct hist_entry *he)
 		mem_info__zput(he->mem_info);
 	}
 
+	if (he->haz_data)
+		zfree(&he->haz_data);
+
 	if (he->block_info)
 		block_info__zput(he->block_info);
 
diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
index 0aa63aeb58ec..a4d12a503126 100644
--- a/tools/perf/util/hist.h
+++ b/tools/perf/util/hist.h
@@ -139,6 +139,7 @@ struct hist_entry *hists__add_entry(struct hists *hists,
 				    struct symbol *parent,
 				    struct branch_info *bi,
 				    struct mem_info *mi,
+				    struct perf_pipeline_haz_data *haz_data,
 				    struct perf_sample *sample,
 				    bool sample_self);
 
@@ -148,6 +149,7 @@ struct hist_entry *hists__add_entry_ops(struct hists *hists,
 					struct symbol *sym_parent,
 					struct branch_info *bi,
 					struct mem_info *mi,
+					struct perf_pipeline_haz_data *haz_data,
 					struct perf_sample *sample,
 					bool sample_self);
 
diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
index 6c862d62d052..55eb65fd593f 100644
--- a/tools/perf/util/sort.h
+++ b/tools/perf/util/sort.h
@@ -139,6 +139,7 @@ struct hist_entry {
 	long			time;
 	struct hists		*hists;
 	struct mem_info		*mem_info;
+	struct perf_pipeline_haz_data *haz_data;
 	struct block_info	*block_info;
 	void			*raw_data;
 	u32			raw_size;
-- 
2.21.1

