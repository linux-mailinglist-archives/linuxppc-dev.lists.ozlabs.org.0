Return-Path: <linuxppc-dev+bounces-11046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCF7B27B23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:35:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3FmT1dDNz3cZL;
	Fri, 15 Aug 2025 18:35:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246921;
	cv=none; b=D7hnlhkdyASdlwXColxwdjjmF4CAJgHuemPS7xZC4eeqIXwda6vbsJIbHxJuR48uljBVxgdxJll/kRUguywENDTB/NHwBQWhfdR/5MIIHIYVMeqZb7WqQqwjK8CQDEtUTW9bOwwExxx+82iwWFS0hJNUy6CVT+EUgDTMlMKXqA4JoEoBxT+KT1tPIOOt1Iuc5JgofaI5bWoItLKWCvSmoNQiEIV63tegVIjeCJnezTD3wbkCf4UmM55yAvjpPhup/rmGbhR/yQbMwaAOGRVKslX4RMc/geOHDMBIGsdCaPcBgsfM13INUTbU8UH/tyVxy/hS7Utt89372Ayhi5cyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246921; c=relaxed/relaxed;
	bh=TkIu47ggssubFHMs4dttP6qKObOxHjUhPt4qy8KlNn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b24ExM+5E7Ndb7wFOxpBWRQSur4qztvniaqZKVyTSKCAqE3ejC6wtnc7EEM5Y1nNQZwjS3IK2XQIGPFQFkWo2D3qimmtMZKIc8FBjmvNnaevxtA5fFROCQgyoeqNxZHndwqLP9ACH0soJJi+2hjaR6eoDLDgQFQvUhr1oC3NmZZUjFwfsiMsqvNkNSqwXMSxroKRL2Ptsni0fpl65vM/GN8bP2sTaA9OswE2fpYPrGQ6rg45NKZI2zMKAYw8tIxWS9+8mPAmKD4SE9qxr3qVtJ4KYcYKBbLKORaYqcme8d7OlSB8ftRYqvvbSKdpRioBKuqtGbnoWL9e3uBbrC8EKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MXGxPQyq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MXGxPQyq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3FmS4GSwz3cYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:35:20 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F0fK5h011968;
	Fri, 15 Aug 2025 08:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TkIu47ggssubFHMs4
	dttP6qKObOxHjUhPt4qy8KlNn0=; b=MXGxPQyqwMhwhVDZJBnISH6zyfedoe7y6
	Akuc4m1vGzawVIogYYSW3yoOMG9MQHKYG92YY9uJyKXEa7kZYM9E/04EQDGHVfq+
	kNBIRMIezUyi4LVsJmrGoDYyMXOMYL0TU5BqZWsTp6j0+voqF5OWAudw6VafPd8B
	UFVX6o+Nr7st3GT5S5t+DAWbeQYKqzdw+/TYRpHefdKEIfDpSd45JeTbKExTpaHI
	O9BadxBWC9B4Vc37wFU+G+4j4FURY/0/qV46buVrZCWqowzEmr8FCgqq0EW6J+CN
	CjUi/3uSIDGV615kjzUgy8Smx4c9OGfsXP9rtqGWNdXI9iqzgYzxg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48durupf9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:14 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8Z6dj022928;
	Fri, 15 Aug 2025 08:35:14 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48durupf9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F5ShfE010657;
	Fri, 15 Aug 2025 08:35:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48egnv0b7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:13 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8Z9Eh59376072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:35:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32C6020043;
	Fri, 15 Aug 2025 08:35:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 855B820040;
	Fri, 15 Aug 2025 08:35:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:35:02 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 04/14] powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for capturing DTL data
Date: Fri, 15 Aug 2025 14:03:57 +0530
Message-Id: <20250815083407.27953-5-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250815083407.27953-1-atrajeev@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7a2tU1XIpk42KtQ3wMe5PYARSSs26KUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfXwrfF09nX0eI/
 vtXVYywo46ia9KPdXTauTODR5hFrMW9cAsMkesGAiIK7Ootf0kN7uKeH0eB78cYweilgeWizl2J
 nmokEAlg5b4NfSMJEBlWGmqi9ukWZdD4LjyT7oEbGMph8u9zf/I3ezYw1BhjvY+mDIU7g+ePTE9
 2s/leS7Na2kuT3APp/DAbHeWZcVA/A20XxGNH/7NrUr+PPBkGxRZ+Fubvdt57Piomy9/ESgbkFz
 f5gj2bVpUoPwSac3Is5GZKtppkB5nJJnmjIiYDrkOe+hY3+MkllrpO3OuyRrBY961agriiEy8+4
 IpRlp5c3YFIzq9gyZ1URa9qkK52c7xHlZ/iHu5DPrDtrI+TEfrAeskYip5dyegdS0JC0OL92eb4
 EyVqexYG
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689ef142 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=TmdHv53RB7oAEjOBHVoA:9
X-Proofpoint-ORIG-GUID: BoEkyGL5tzdXEibbXTUeiF-JDvfTOHK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. When the
hrtimer expires, in the timer handler, code is added to save the DTL
data to perf event record. DTL (Dispatch Trace Log) contains information
about dispatch/preempt, enqueue time etc. We directly copy the DTL
buffer data as part of auxiliary buffer and it will be postprocessed
later. To enable the support for aux buffer, add the PMU callbacks for
setup_aux and free_aux.

In setup_aux, set up pmu-private data structures for an AUX
area. rb_alloc_aux uses "alloc_pages_node" and returns pointer to each
page address. Map these pages to contiguous space using vmap and use
that as base address. The aux private data structure ie,
"struct vpa_pmu_buf" mainly saves:
1. buf->base: aux buffer base address
2. buf->head: offset from base address where data will be written to.
3. buf->size: Size of allocated memory

free_aux will free pmu-private AUX data structures.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/perf/vpa-dtl.c | 77 +++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
index e92756f88801..364242cbfa8a 100644
--- a/arch/powerpc/perf/vpa-dtl.c
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -11,6 +11,7 @@
 #include <asm/dtl.h>
 #include <linux/perf_event.h>
 #include <asm/plpar_wrappers.h>
+#include <linux/vmalloc.h>
 
 #define EVENT(_name, _code)     enum{_name = _code}
 
@@ -75,6 +76,19 @@ struct vpa_dtl {
 	bool			active_lock;
 };
 
+struct vpa_pmu_ctx {
+	struct perf_output_handle handle;
+};
+
+struct vpa_pmu_buf {
+	int     nr_pages;
+	bool    snapshot;
+	u64     *base;
+	u64     size;
+	u64     head;
+};
+
+static DEFINE_PER_CPU(struct vpa_pmu_ctx, vpa_pmu_ctx);
 static DEFINE_PER_CPU(struct vpa_dtl, vpa_dtl_cpu);
 
 /* variable to capture reference count for the active dtl threads */
@@ -311,6 +325,67 @@ static void vpa_dtl_event_read(struct perf_event *event)
 {
 }
 
+/*
+ * Set up pmu-private data structures for an AUX area
+ * **pages contains the aux buffer allocated for this event
+ * for the corresponding cpu. rb_alloc_aux uses "alloc_pages_node"
+ * and returns pointer to each page address. Map these pages to
+ * contiguous space using vmap and use that as base address.
+ *
+ * The aux private data structure ie, "struct vpa_pmu_buf" mainly
+ * saves
+ * - buf->base: aux buffer base address
+ * - buf->head: offset from base address where data will be written to.
+ * - buf->size: Size of allocated memory
+ */
+static void *vpa_dtl_setup_aux(struct perf_event *event, void **pages,
+		int nr_pages, bool snapshot)
+{
+	int i, cpu = event->cpu;
+	struct vpa_pmu_buf *buf __free(kfree) = NULL;
+	struct page **pglist __free(kfree) = NULL;
+
+	/* We need at least one page for this to work. */
+	if (!nr_pages)
+		return NULL;
+
+	if (cpu == -1)
+		cpu = raw_smp_processor_id();
+
+	buf = kzalloc_node(sizeof(*buf), GFP_KERNEL, cpu_to_node(cpu));
+	if (!buf)
+		return NULL;
+
+	pglist = kcalloc(nr_pages, sizeof(*pglist), GFP_KERNEL);
+	if (!pglist)
+		return NULL;
+
+	for (i = 0; i < nr_pages; ++i)
+		pglist[i] = virt_to_page(pages[i]);
+
+	buf->base = vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
+	if (!buf->base)
+		return NULL;
+
+	buf->nr_pages = nr_pages;
+	buf->snapshot = false;
+
+	buf->size = nr_pages << PAGE_SHIFT;
+	buf->head = 0;
+	return no_free_ptr(buf);
+}
+
+/*
+ * free pmu-private AUX data structures
+ */
+static void vpa_dtl_free_aux(void *aux)
+{
+	struct vpa_pmu_buf *buf = aux;
+
+	vunmap(buf->base);
+	kfree(buf);
+}
+
 static struct pmu vpa_dtl_pmu = {
 	.task_ctx_nr = perf_invalid_context,
 
@@ -320,6 +395,8 @@ static struct pmu vpa_dtl_pmu = {
 	.add         = vpa_dtl_event_add,
 	.del         = vpa_dtl_event_del,
 	.read        = vpa_dtl_event_read,
+	.setup_aux   = vpa_dtl_setup_aux,
+	.free_aux    = vpa_dtl_free_aux,
 	.capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_EXCLUSIVE,
 };
 
-- 
2.47.1


