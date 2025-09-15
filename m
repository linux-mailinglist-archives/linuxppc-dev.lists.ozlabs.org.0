Return-Path: <linuxppc-dev+bounces-12193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6ECB57144
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:23:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGj662zxz3d2c;
	Mon, 15 Sep 2025 17:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921002;
	cv=none; b=GNvkmf8RW3cQyJPb06EAJ93HxyDbNU5ud/l7UWG3IK/7DwuC7IXQREZLk/TRu+N9YhRe7aqPQaT+bHDWGsqfHFX22CMItc82BPY9DjYut1hQASBSNbx8bApH8EB3vhvrvLhlvgl0CVB4Vzvf69dTkiXL/moYNN9FLW1ekGyqyPTF0i63mXvIzNBzor95Vsu1lHkHbOuyvfDSu2UL+iH1fZSMjLCEkzh4ahKT+5uuDZSuF9KgqjizuAo64M4/pZBj5BwrCAtqW7qEdbhwoEv67UHkUsOVXBVYLUe8i/rUATFvpsfKQdR0uSqUpmJpSSIuJFgUriD948DS5n++j7jpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921002; c=relaxed/relaxed;
	bh=8nA2lwmYufy54KdEvXnqbvUGMV3OIh72GYeuyQ5q5Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NTFWY9tQN3X6JtcWjCNV8dAwO8a9caJXoyUpjbLZCUoI84GONQZ2rgsfRBD6Ef590d5vC4fmjB3PK61gcexVjDEr6lacii5YhkDZ5W1UnZHbpqmY2tlARyUiCfL83gT+HPS2tKemMW0PFl2SOi5P5F1PNAuHfDPXCcU+RBc5OHQxGFHM+0SinZtfwx+gIHB/BkkU7Ne+mclHtUiedBbGQlIE8nk3/rgUHLrKP5dETNon7SRN8dg5sYmPng4IgFbb0POTG365+QIy08UqMOv5eTXQIOX/Zuqr+Iyh4tk69aXJs9I8F9d8KY5WIZRiEN0seA32eHEIsKlckBajUYfhjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JA17hdVn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JA17hdVn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGj56Tnkz3dBx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:23:21 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EJApdi020644;
	Mon, 15 Sep 2025 07:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8nA2lwmYufy54KdEv
	XnqbvUGMV3OIh72GYeuyQ5q5Hc=; b=JA17hdVnIJChmNTOInbnUv02OEwcWbxr6
	7L1lmLUx4HdS5p7zZxFSnmBU0u3g4mCRKb4ZrTvVCaG2FH78w4bUQ/K/c9rp2+Ww
	xs5M6tLzUPHfXnWO3AW6H8QjOtgDPbeQs9WrK+tlNj6wxiU1kMoVgCSF+/DSybqX
	d1y0+LLAuXVYwRU0/nawzlMuUCqb30YRHsGIynPsltFV1+xvjiFx/G4KwVkelBcd
	CJIw8qt1nzrF5hfYENBSgrFgKf0xfJNoH+1yXlxkR2USdft4CJs/qLphbwBn3JlX
	JbueGmKe/reSTWUfvTk5l+7xLQwgtY/ftzmkDbVUWfyWTrRl0yTUw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494x1t8pc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:10 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7N990010048;
	Mon, 15 Sep 2025 07:23:09 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494x1t8pbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F6upgS005981;
	Mon, 15 Sep 2025 07:23:08 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 495jxtwchy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:08 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7N5uY18088372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:23:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A1152004B;
	Mon, 15 Sep 2025 07:23:05 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DCF720040;
	Mon, 15 Sep 2025 07:22:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:22:58 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V2 4/7] powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for capturing DTL data
Date: Mon, 15 Sep 2025 12:52:21 +0530
Message-Id: <20250915072224.98958-5-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915072224.98958-1-atrajeev@linux.ibm.com>
References: <20250915072224.98958-1-atrajeev@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=OMsn3TaB c=1 sm=1 tr=0 ts=68c7bede cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=TmdHv53RB7oAEjOBHVoA:9
X-Proofpoint-ORIG-GUID: h28N6WAGt1JkuyfawNqWYWzVRsZiw-E9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMSBTYWx0ZWRfX2/BIklk1vfX3
 UwchDIXsqxpd114Pjg+UMa0OTJYIt20akcEXl5n0IYubi6D3RLFUxdWIkuu7MqrGxWVDDO16SzK
 /dQZkNLXqgK7OK0ZUh6KIEp0P6hYFsh0xP6dqs6m1jGG/io6h9pCJaF7QNz4Nv6tDm7D3AvIpgH
 jFTl7ymUP//SSpiO/y/HW1IMs/AD5TRea/Jyt17ndIrmAkMu3vBWeq09ebhaIfzTGsHuaqqwyoc
 /vN+G7n0M6kt6MTJgAjyMf9rmjVZ1Atcp+TCPTkRp2qkD7MpVBshyrC30DBBhceYi9ve7Kmz0O4
 ysYNU3K64I+uxW2dTbpxQ2St9ZTxmDsziGUP7DP6LWRcQq+77DCsTK0XoVzR42bTODrd8FQnvRk
 F9DJ7+vK
X-Proofpoint-GUID: oqN9dvsdBIkg4zbEHIwM5xeN-PGmqMP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130001
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
index 4a8ba5b3ae3f..28e7fc6e7015 100644
--- a/arch/powerpc/perf/vpa-dtl.c
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -11,6 +11,7 @@
 #include <asm/dtl.h>
 #include <linux/perf_event.h>
 #include <asm/plpar_wrappers.h>
+#include <linux/vmalloc.h>
 
 #define EVENT(_name, _code)     enum{_name = _code}
 
@@ -74,6 +75,19 @@ struct vpa_dtl {
 	u64			last_idx;
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
@@ -302,6 +316,67 @@ static void vpa_dtl_event_read(struct perf_event *event)
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
 
@@ -311,6 +386,8 @@ static struct pmu vpa_dtl_pmu = {
 	.add         = vpa_dtl_event_add,
 	.del         = vpa_dtl_event_del,
 	.read        = vpa_dtl_event_read,
+	.setup_aux   = vpa_dtl_setup_aux,
+	.free_aux    = vpa_dtl_free_aux,
 	.capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_EXCLUSIVE,
 };
 
-- 
2.47.1


