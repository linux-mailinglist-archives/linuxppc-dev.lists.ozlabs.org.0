Return-Path: <linuxppc-dev+bounces-12211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B049EB57650
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLsJ5f4vz3dW2;
	Mon, 15 Sep 2025 20:30:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757932244;
	cv=none; b=NBb2eKFZICQ2i/Yaf4317ESqGdtBFKSGu3NxVERDicfBH//Zp2xbmQVbEQ/W8IYk30lJN8MEB1O1vmirlMZ+Y8XEx9chZLUIkJBFmkbzsk3m3a8x+/VKwEfnZzXFA/ZQL6JR+a5in5bhMfKu0uCCTSdUdofYPIN8kzGLYAKH7AKtVx4xa646/x98hKsjjuSJuMcH29vkZsSGaA3mItyJJ+YI9cq4MZ7SXthe61IV913m3YSuPjwXznC+VPDjL6Z2X31GpXs5ds56SwfDx6oxfpOY9xmw1RpVdhFOqb3exyJvRrlwYDImdU2uMeGcQiq7CkB8oE1z+c9jLm3zu6C9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757932244; c=relaxed/relaxed;
	bh=8edBg9sqZGhfCwH+e5H1zOPn8hYBReKdCX/GstVzFc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KoetvSGDESC9GwVj3ebe5+VrdKTlwHQ33qd6x6FFWSCHLIP8onWn2XBECibwojTIzGWML4c/zbZ8Sz8EXoa4/R/J+4RBwX1hZ6bX/jFmadoopiYlaTkttzX5R5sdvjHeYB+Gv7ra9gddHo0gwwRLuu8xVy8+xshrL1RNgVvoW5or6v+d8BN0CPOiCB8jSnc7qN2HfTg61H/1tPhjVuKQBA5pObJt821mfaE5wmxeit1lnA0lZNCgKTFB+ldb73sdlhCLS/SYBKzqYCmoFHqEmPWVE2gO4Y/pdOe7YtaGwoypkQtxX9RhakexoD4W7taWvXmza/joF61uLe0ZVWa9vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lrRj+m4v; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lrRj+m4v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLsH5nw1z3dL0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:30:43 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F3PV7i023433;
	Mon, 15 Sep 2025 10:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8edBg9sqZGhfCwH+e
	5H1zOPn8hYBReKdCX/GstVzFc8=; b=lrRj+m4veTFxbubfPAIHPYq+nRgKKuYzy
	4Q4NJHYE0Pyj9CpiG97wkQg3AlxGuiZdfhKLAgkLwud/lp+WYtrabxhtVU7bxZAl
	gfMi2L1kwHsGFc1c/ghqISxJsWhnbDOVxsTiOIsgZ2FuwljHcUr4hzshdaICiahU
	UOeDOEXJjjJ0JWDevd0NWbxEl+5XClDOsIyJoLo3fcLMN/5worIil+PM8rYnJ2Ob
	+qBNWMQGQzFpFUVneKF6CbvhsyNjt0COm0+1agcAAeMl01qfZMq2zETZXMthu0Hh
	6gOSif12NdRPUH5/4QGuOIPOqR/7vHoJZCSF0qE2hOPCSkOFRBRjw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnhw98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:40 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FAQ7ln028092;
	Mon, 15 Sep 2025 10:30:39 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnhw94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F71hoR029484;
	Mon, 15 Sep 2025 10:30:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0p38k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:38 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FAUYs741877768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 10:30:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A11582004F;
	Mon, 15 Sep 2025 10:30:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CBB320043;
	Mon, 15 Sep 2025 10:30:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 10:30:28 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 5/7] powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
Date: Mon, 15 Sep 2025 15:59:45 +0530
Message-Id: <20250915102947.26681-6-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Hle0aMkItj6gzk18-0DMcq8lhg3QW4TH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfX7jy0TJkft2j4
 8x1mqP5XdzJs1fjNjFvjyKMvezTd2EpCBuQPOmy8Jgko+Q2lZMCn4Nil80W6jsCjqsnmqkGqUFi
 WUkh/Bd6BO8PGWa6bP44IItkIhX5Etc3/XFIEVAAy+jd2CPUhIZv60DGaogZsGP7ADagvG1sN4B
 qOvgNqKwU5dq/aEYXVpNIeUwb4LMpZEiKRrA1yJAIE1h2kL/tDBOTYDqDxmcyffg5Bb2BGwuUNl
 Fy3d7zgah7WHw2auSTDimXJkL0HzdkRSyTxaGFuEpNpD/CjrtGYQP2EAQTmwym9rphAiQ6VZt9O
 qBPXd6JdupBD7W/FyI3q1Q0G4oGCBY8LBl4qaprDyAOlGJTwsugjtIoIlXlYCSwEpWwg/4bGq6t
 qYtAEU8Z
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c7ead0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=h-hinMeAw3qEPoOpTm4A:9
X-Proofpoint-GUID: VwXC8Ps-OpP58MiD_FVSYn60SfbVmKY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. When the
hrtimer expires, in the timer handler, code is added to save the DTL
data to perf event record via vpa_dtl_capture_aux() function.
The DTL (Dispatch Trace Log) contains information
about dispatch/preempt, enqueue time etc. We directly copy the DTL
buffer data as part of auxiliary buffer. Data will be written to
disk only when the allocated buffer is full.

By this approach, all the DTL data will be present as-is in the
perf.data. The data will be post-processed in perf tools side when doing
perf report/perf script and this will avoid time taken to create samples
in the kernel space.

To corelate each DTL entry with other events across CPU's, we need to
map timebase from "struct dtl_entry" which phyp provides with boot
timebase. This also needs timebase frequency. Define "struct boottb_freq"
to save these details.

Added changes to capture the Dispatch Trace Log details to AUX buffer
in vpa_dtl_dump_sample_data(). Boot timebase and frequency needs to be
saved only at once, added field to indicate this as part of
"vpa_pmu_buf" structure.

perf_aux_output_begin: This function is called before writing to AUX
area. This returns the pointer to aux area private structure, ie
"struct vpa_pmu_buf". The function obtains the output handle
(used in perf_aux_output_end). when capture completes in
vpa_dtl_capture_aux(), call perf_aux_output_end() to commit the recorded
data. perf_aux_output_end() is called to move the aux->head of
"struct perf_buffer" to indicate size of data in aux buffer.
aux_tail will be moved in perf tools side when writing the data from
aux buffer to perf.data file in disk.

It is responsiblity of PMU driver to make sure data is copied between
perf_aux_output_begin and perf_aux_output_end.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/perf/vpa-dtl.c | 131 +++++++++++++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
index 28e7fc6e7015..ead96af37997 100644
--- a/arch/powerpc/perf/vpa-dtl.c
+++ b/arch/powerpc/perf/vpa-dtl.c
@@ -85,6 +85,24 @@ struct vpa_pmu_buf {
 	u64     *base;
 	u64     size;
 	u64     head;
+	/* boot timebase and frequency needs to be saved only at once */
+	int	boottb_freq_saved;
+};
+
+/*
+ * To corelate each DTL entry with other events across CPU's,
+ * we need to map timebase from "struct dtl_entry" which phyp
+ * provides with boot timebase. This also needs timebase frequency.
+ * Formula is: ((timbase from DTL entry - boot time) / frequency)
+ *
+ * To match with size of "struct dtl_entry" to ease post processing,
+ * padded 24 bytes to the structure.
+ */
+struct boottb_freq {
+	u64	boot_tb;
+	u64	tb_freq;
+	u64	timebase;
+	u64	padded[3];
 };
 
 static DEFINE_PER_CPU(struct vpa_pmu_ctx, vpa_pmu_ctx);
@@ -94,13 +112,123 @@ static DEFINE_PER_CPU(struct vpa_dtl, vpa_dtl_cpu);
 static int dtl_global_refc;
 static spinlock_t dtl_global_lock = __SPIN_LOCK_UNLOCKED(dtl_global_lock);
 
+/*
+ * Capture DTL data in AUX buffer
+ */
+static void vpa_dtl_capture_aux(long *n_entries, struct vpa_pmu_buf *buf,
+		struct vpa_dtl *dtl, int index)
+{
+	struct dtl_entry *aux_copy_buf = (struct dtl_entry *)buf->base;
+
+	/*
+	 * Copy to AUX buffer from per-thread address
+	 */
+	memcpy(aux_copy_buf + buf->head, &dtl->buf[index], *n_entries * sizeof(struct dtl_entry));
+
+	buf->head += *n_entries;
+
+	return;
+}
+
 /*
  * Function to dump the dispatch trace log buffer data to the
  * perf data.
+ *
+ * perf_aux_output_begin: This function is called before writing
+ * to AUX area. This returns the pointer to aux area private structure,
+ * ie "struct vpa_pmu_buf" here which is set in setup_aux() function.
+ * The function obtains the output handle (used in perf_aux_output_end).
+ * when capture completes in vpa_dtl_capture_aux(), call perf_aux_output_end()
+ * to commit the recorded data.
+ *
+ * perf_aux_output_end: This function commits data by adjusting the
+ * aux_head of "struct perf_buffer". aux_tail will be moved in perf tools
+ * side when writing the data from aux buffer to perf.data file in disk.
+ *
+ * Here in the private aux structure, we maintain head to know where
+ * to copy data next time in the PMU driver. vpa_pmu_buf->head is moved to
+ * maintain the aux head for PMU driver. It is responsiblity of PMU
+ * driver to make sure data is copied between perf_aux_output_begin and
+ * perf_aux_output_end.
+ *
+ * After data is copied in vpa_dtl_capture_aux() function, perf_aux_output_end()
+ * is called to move the aux->head of "struct perf_buffer" to indicate size of
+ * data in aux buffer. This will post a PERF_RECORD_AUX into the perf buffer.
+ * Data will be written to disk only when the allocated buffer is full.
+ *
+ * By this approach, all the DTL data will be present as-is in the
+ * perf.data. The data will be pre-processed in perf tools side when doing
+ * perf report/perf script and this will avoid time taken to create samples
+ * in the kernel space.
  */
 static void vpa_dtl_dump_sample_data(struct perf_event *event)
 {
-	return;
+	u64 cur_idx, last_idx, i;
+	u64 boot_tb;
+	struct boottb_freq boottb_freq;
+
+	/* actual number of entries read */
+	long n_read = 0, read_size = 0;
+
+	/* number of entries added to dtl buffer */
+	long n_req;
+
+	struct vpa_pmu_ctx *vpa_ctx = this_cpu_ptr(&vpa_pmu_ctx);
+
+	struct vpa_pmu_buf *aux_buf;
+
+	struct vpa_dtl *dtl = &per_cpu(vpa_dtl_cpu, event->cpu);
+
+	cur_idx = be64_to_cpu(lppaca_of(event->cpu).dtl_idx);
+	last_idx = dtl->last_idx;
+
+	if (last_idx + N_DISPATCH_LOG <= cur_idx)
+		last_idx = cur_idx - N_DISPATCH_LOG + 1;
+
+	n_req = cur_idx - last_idx;
+
+	/* no new entry added to the buffer, return */
+	if (n_req <= 0)
+		return;
+
+	dtl->last_idx = last_idx + n_req;
+	boot_tb = get_boot_tb();
+
+	i = last_idx % N_DISPATCH_LOG;
+
+	aux_buf = perf_aux_output_begin(&vpa_ctx->handle, event);
+	if (!aux_buf) {
+		pr_debug("returning. no aux\n");
+		return;
+	}
+
+	if (!aux_buf->boottb_freq_saved) {
+		pr_debug("Copying boot tb to aux buffer: %lld\n", boot_tb);
+		/* Save boot_tb to convert raw timebase to it's relative system boot time */
+		boottb_freq.boot_tb = boot_tb;
+		/* Save tb_ticks_per_sec to convert timebase to sec */
+		boottb_freq.tb_freq = tb_ticks_per_sec;
+		boottb_freq.timebase = 0;
+		memcpy(aux_buf->base, &boottb_freq, sizeof(boottb_freq));
+		aux_buf->head += 1;
+		aux_buf->boottb_freq_saved = 1;
+		n_read += 1;
+	}
+
+	/* read the tail of the buffer if we've wrapped */
+	if (i + n_req > N_DISPATCH_LOG) {
+		read_size = N_DISPATCH_LOG - i;
+		vpa_dtl_capture_aux(&read_size, aux_buf, dtl, i);
+		n_req -= read_size;
+		n_read += read_size;
+		i = 0;
+	}
+
+	/* .. and now the head */
+	vpa_dtl_capture_aux(&n_req, aux_buf, dtl, i);
+
+	/* Move the aux->head to indicate size of data in aux buffer */
+	perf_aux_output_end(&vpa_ctx->handle, (n_req + n_read) * sizeof(struct dtl_entry));
 }
 
 /*
@@ -363,6 +491,7 @@ static void *vpa_dtl_setup_aux(struct perf_event *event, void **pages,
 
 	buf->size = nr_pages << PAGE_SHIFT;
 	buf->head = 0;
+	buf->boottb_freq_saved = 0;
 	return no_free_ptr(buf);
 }
 
-- 
2.47.1


