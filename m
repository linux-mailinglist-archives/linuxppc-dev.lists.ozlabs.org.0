Return-Path: <linuxppc-dev+bounces-12210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DDDB5764F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:30:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLsC1pXGz3dVR;
	Mon, 15 Sep 2025 20:30:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757932239;
	cv=none; b=PD+r63SyziV6bIysXmUl98FxK87/ksRx1iL0I4ilUbGbXet58YLZnUp2Q8Dhj+GHuYfYEVWH3FybevjWDBV4+lgk3bIpdXvbz0Ns/ooy+gwnBotatWZBdhBDNuowi802eRBkCdwRsX5fK+WJQH8IykRZJfhxZRrxjOqt7WUF/8T8EG+3h0NXSyjwJVyQ0D7DrmxihWysgFdo36G/TJXwLjFk766Rxyupj1m2H78Dhxakw0nSqQclTBlQPig0Y9uzLA5udr9C45H2elYqkLjJsXpybvO0u7Bs9Y4Z3TYnkP7z9HAF/RtGQaYp/bAtN5aA/XkcEQqvi3gjIvJSoeDXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757932239; c=relaxed/relaxed;
	bh=8nA2lwmYufy54KdEvXnqbvUGMV3OIh72GYeuyQ5q5Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ilZSaMmL+dkMdaXySh2s7afGxRjNozPKNj+TNLehmKA6fVHePD/MKev1vP9tYaKnZIFdWvzlZamICOZv+/OOr7qFuWy3gUIyEd5iIfIgcpY8Jbpj9hDSPCAxYY3WS0/JoeufyVOtj5rKR2VQr814XgBaj4v4W0ODmumsy7dO15zF+VeccDWRvvRgAhOl8yY9o0ny9WaD6+yRT4TIHilLjIkFJlDr+BXBTM3PYLwTMWjnZlAn95/yidgsGu1o0r5I0qjtekgKRb4hF5zXCGHYNbl0kpZaqHoEk80wzBYyo4Zm5+37ZL1+y5Bkxu33iqC+oE0cfi/lF3VVK/kv1GOCXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hNUspi1y; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hNUspi1y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLsB32CVz3dL0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:30:38 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9P20a019951;
	Mon, 15 Sep 2025 10:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8nA2lwmYufy54KdEv
	XnqbvUGMV3OIh72GYeuyQ5q5Hc=; b=hNUspi1y2HJ5pi+rD1wi8zu+WASCuS+ZB
	LUECachaQ55TFE2+IYMO0/vS9bzxt/pBoprtTefrxSYXwpJLYjRRA4jF45e4qrbC
	+hxO6IKNnILThC0vDkU+j2QSS+3YRGh1qCpxQC7GJfYXrvM+HR6+9YWetkQeKsNX
	u8ugGEAN1ZJ1xdR1nb72nCxTOrxIurLzsqV1WoAaHr6qLwAuVIVJvz9DlhMEVptE
	ErCczWEOzZ/QxNuCxPbD+Cflk5ZynnU/npBlUE0jQz+jpO6Prk9UU6/l6XXbeLzR
	8EyWKTPagB9iyIXJhrGQekfKneMr2EHMhodozXchkIWviI9wgHjvg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496g530bpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:32 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FAEiOe032001;
	Mon, 15 Sep 2025 10:30:32 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496g530bpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:32 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8eGlu018629;
	Mon, 15 Sep 2025 10:30:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 495n5m5qc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FAUReF62390672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 10:30:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7CC320043;
	Mon, 15 Sep 2025 10:30:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A6CC2004B;
	Mon, 15 Sep 2025 10:30:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 10:30:21 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 4/7] powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for capturing DTL data
Date: Mon, 15 Sep 2025 15:59:44 +0530
Message-Id: <20250915102947.26681-5-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: GO_0jXqoSyncyuMyWKvPwCFMXl0B7lJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX+aXxglVM0r1w
 BkFenX6m9CiwGqNidXPS4ZCsKW859ru/Tru1+b4J3/sKTLapOkLYiU65jl4bXlF6/IJeB9pbiBL
 IjmXro+T+9RkOUpGTWCWmxGx6aq533SP4Ukolu6PFii6xZq3lbaOgtbxRVzS2wfDbY7dmKUsWNG
 3YYtIY5/zMseEzE19oa2FeNVK/sATvYQsXpuqscb5N9nPaCb2rGhKCeZIr82fbWJ0V8ESymyfv9
 YZESHNr9GNCf1gIuW+c4zGwBpbREHrqgMdGkgga3PhbJJebOI6DEzmVd2c63E2uc3aFlla7eq+5
 mMLdoATLsBMgeF7t7nuHdU5xGkFfpmTOK/9/lRyz1ORxHNEgP+QK1aL+Gp0auzNsE7wmlU7+oE0
 m/b92SiW
X-Proofpoint-ORIG-GUID: SAiT_Fb7Jss63yd-nW8B_t-rlwx4CO13
X-Authority-Analysis: v=2.4 cv=UJ7dHDfy c=1 sm=1 tr=0 ts=68c7eac8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=TmdHv53RB7oAEjOBHVoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
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


