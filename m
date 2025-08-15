Return-Path: <linuxppc-dev+bounces-11052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C955B27B29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:36:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3FnL0Mj5z3ccl;
	Fri, 15 Aug 2025 18:36:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246966;
	cv=none; b=JYicMKoZvd7vrD1pharlnCWjqrlgzlDZSBmsdMqvFDmJ3W1Ysq3CxYx1FEEs4PzYN/THRjXLbjLjjB7PXPU6QVuIepsWmANcm/BFw1s1gWmhdMwlhNvusZiGaJxWxkUTtPrFIZCiy9rddbRS9gjdS57tFV8TzSp+xgnvuWYrfRmFZVfntzB6ItWE4CqQ/D2OohmrCTKmsqZg2hNU6wflipMsdTHCeldKCvXFELLsN/c3D7Nv1+dicU35m60CuShgdv8suQwwyntdqcVp8z3QTidaFxlyJm/UsXV5d1EKCS90zoGII0JKfsdzRUWytnsq+YT0joOv8Qxf3TZmTQ4Mlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246966; c=relaxed/relaxed;
	bh=/OhBxoG0dsvtU3ZO7fpoa4yi8+Vq9Y/abbhEXf461hI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MRvOazQcvnWXm7WmEoadLTUF7Lstcge4ZWPJ4RKC4mJHA3wywtB6OxuTTH84GZVtAFG689ZUf68pc6gB6Dt4EZbyXk/ndgLH7weTj1To3S2p1T03DfX2XcHHBOiu5Z81CARgIr58NKqk9IXiMKJCNbDv/BYM7QwHscUUSTR9U0tCsbRw68kEsUAxrWdOF2xYr0Wvftpw+sAC32q/RXCaTwWzx3xLK3dxZt0yMkRVXMramg1zGRjr0iDSPeEGgQ06cKCWwyYIEtlZmIGNssgA50988H7YGzQVBy829DP7aSMGStjjL1Zw2IcTbnqFGojmXbQqjGsQsFLyAb+AbwG+Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HZuOEZ8K; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HZuOEZ8K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3FnK29f5z3ccf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:36:05 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F1vZam011946;
	Fri, 15 Aug 2025 08:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/OhBxoG0dsvtU3ZO7
	fpoa4yi8+Vq9Y/abbhEXf461hI=; b=HZuOEZ8KxAo3tZ1DXYP3ed6tlSMKA7EC6
	4UvnYau7yCdQYi3vHvGYYL6/y2PTDHk8MSaqGFg3msFbqZU801w/gslIVhexlPXf
	bT7iecm0AETF+/ouwfznHchlOat0moI0x9gJmctfn146vo5q6qGV3y68EAMHLn/y
	3Nie5Qfprt1e9J7qjbIrCCdKLL1b62xP6fdW8d0ybkIQl8edYj+WPfNFxdWsdDed
	LI0cunw2FIh8uHrcHPQp280ZmpYsjp1CxlaIidvJ03n0xBYTS32TGnOSNW7CsDjk
	OIavox9lZoYk05kx4M5wW/3xJAWRjl2+gdn4Si5e78t3vPIyNvSxA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48durupfb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:59 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8Z6dl022928;
	Fri, 15 Aug 2025 08:35:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48durupfb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F7rKxR028585;
	Fri, 15 Aug 2025 08:35:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ej5ng20w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:58 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8ZsKN51118466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:35:54 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD3A520043;
	Fri, 15 Aug 2025 08:35:54 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDFFA20040;
	Fri, 15 Aug 2025 08:35:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:35:47 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 10/14] tools/perf: Allocate and setup aux buffer queue to help co-relate with other events across CPU's
Date: Fri, 15 Aug 2025 14:04:03 +0530
Message-Id: <20250815083407.27953-11-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: d7Ah_8a7RtJPn_ivZYCMlh8CtfMzof2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX+cHSI90w5zJg
 IbovS+5k1SmP2ehY3W859n81XAqzzo50N9ctYzBnp1P80b/+f4lyZ46Rk9dJUbpQRn47feOpt5q
 ce8MikNmlRU3apu24cnh4Qx4+vT65WqsyY+fadr2NfDywVnZGXuVNt5GMpsX+hLoZiKHZhfQGIH
 kXntZHwO2a4h7Z4yZqZJBlI/39wPADBe2tWvB2HGaf7uOBxqbF6k2niOeb6/QTAsugHvstD7yM6
 OBgie63DC/8P8IAJwWIuwJGf/1YPem0ezmRZWp8GynMIn7NAELNarkggfUgBHiC34Z7lBU7hFk2
 z6ugBTvV7JFbjLrxpn77btdcKmw0zWzFbOTz1K6zSafV4Vx+pS/7lOT2BlQh/CthLGu1wTKglLJ
 q8vDL+tx
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689ef170 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=9jWZ9SMwFfNm59oFS4AA:9
X-Proofpoint-ORIG-GUID: PxQ-TFZIATZlTRPxaIdribODFzMhtF7q
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

When the Dispatch Trace Log data is collected along with other events
like sched tracepoint events, it needs to be correlated and present
interleaved along with these events. Perf events can be collected
parallely across the CPUs. Hence it needs to be ensured events/dtl
entries are processed in timestamp order.

An auxtrace_queue is created for each CPU. Data within each queue is in
increasing order of timestamp. Each auxtrace queue has a array/list of
auxtrace buffers. When processing the auxtrace buffer, the data is
mmapp'ed. All auxtrace queues is maintained in auxtrace heap. Each queue
has a queue number and a timestamp. The queues are sorted/added to head
based on the time stamp. So always the lowest timestamp (entries to be
processed first) is on top of the heap.

The auxtrace queue needs to be allocated and heap needs to be populated
in the sorted order of timestamp. The queue needs to be filled with data
only once via powerpc_vpadtl__update_queues() function.
powerpc_vpadtl__setup_queues() iterates through all the entries to
allocate and setup the auxtrace queue. To add to auxtrace heap, it is
required to fetch the timebase of first entry for each of the queue.

The first entry in the queue for VPA DTL PMU has the boot timebase,
frequency details which are needed to get timestamp which is required to
correlate with other events. The very next entry is the actual trace data
that provides timestamp for occurrence of DTL event. Formula used to get
the timestamp from dtl entry is:

((timbase from DTL entry - boot time) / frequency) * 1000000000

powerpc_vpadtl_decode() adds the boot time and frequency as part of
powerpc_vpadtl_queue structure so that it can be reused. Each of the
dtl_entry is of 48 bytes size. Sometimes it could happen that one buffer
is only partially processed (if the timestamp of occurrence of another
event is more than currently processed element in queue, it will move on
to next event). Inorder to keep track of position of buffer, additional
fields is added to powerpc_vpadtl_queue structure.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 tools/perf/util/powerpc-vpadtl.c | 219 ++++++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
index 36c02821cf0a..299927901c9d 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -28,6 +28,7 @@
 #include "map.h"
 #include "symbol_conf.h"
 #include "symbol.h"
+#include "tool.h"
 
 /*
  * The DTL entries are of below format
@@ -72,6 +73,14 @@ struct powerpc_vpadtl_queue {
 	struct auxtrace_buffer	*buffer;
 	struct thread		*thread;
 	bool			on_heap;
+	struct dtl_entry	*dtl;
+	u64			timestamp;
+	unsigned long		pkt_len;
+	unsigned long		buf_len;
+	u64			boot_tb;
+	u64			tb_freq;
+	unsigned int		tb_buffer;
+	unsigned int		size;
 	bool			done;
 	pid_t			pid;
 	pid_t			tid;
@@ -151,12 +160,217 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
 	powerpc_vpadtl_dump(vpa, buf, len);
 }
 
+static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue *vpaq)
+{
+	struct auxtrace_buffer *buffer = vpaq->buffer;
+	struct auxtrace_queues *queues = &vpaq->vpa->queues;
+	struct auxtrace_queue *queue;
+
+	queue = &queues->queue_array[vpaq->queue_nr];
+	buffer = auxtrace_buffer__next(queue, buffer);
+
+	if (!buffer)
+		return 0;
+
+	vpaq->buffer = buffer;
+	vpaq->size = buffer->size;
+
+	/* If the aux_buffer doesn't have data associated, try to load it */
+	if (!buffer->data) {
+		/* get the file desc associated with the perf data file */
+		int fd = perf_data__fd(vpaq->vpa->session->data);
+
+		buffer->data = auxtrace_buffer__get_data(buffer, fd);
+		if (!buffer->data)
+			return -ENOMEM;
+	}
+
+	vpaq->buf_len = buffer->size;
+
+	if (buffer->size % dtl_entry_size)
+		vpaq->buf_len = buffer->size - (buffer->size % dtl_entry_size);
+
+	if (vpaq->tb_buffer != buffer->buffer_nr) {
+		vpaq->pkt_len = 0;
+		vpaq->tb_buffer = 0;
+	}
+
+	return 1;
+}
+
+/*
+ * The first entry in the queue for VPA DTL PMU has the boot timebase,
+ * frequency details which are needed to get timestamp which is required to
+ * correlate with other events. Save the boot_tb and tb_freq as part of
+ * powerpc_vpadtl_queue. The very next entry is the actual trace data to
+ * be returned.
+ */
+static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
+{
+	int ret;
+	char *buf;
+	struct boottb_freq *boottb;
+
+	ret = powerpc_vpadtl_get_buffer(vpaq);
+	if (ret <= 0)
+		return ret;
+
+	boottb = (struct boottb_freq *)vpaq->buffer->data;
+	if (boottb->timebase == 0) {
+		vpaq->boot_tb = boottb->boot_tb;
+		vpaq->tb_freq = boottb->tb_freq;
+		vpaq->pkt_len += dtl_entry_size;
+	}
+
+	buf = vpaq->buffer->data;
+	buf += vpaq->pkt_len;
+	vpaq->dtl = (struct dtl_entry *)buf;
+
+	vpaq->tb_buffer = vpaq->buffer->buffer_nr;
+	vpaq->buffer = NULL;
+	vpaq->buf_len = 0;
+
+	return 1;
+}
+
+static struct powerpc_vpadtl_queue *powerpc_vpadtl__alloc_queue(struct powerpc_vpadtl *vpa,
+						unsigned int queue_nr)
+{
+	struct powerpc_vpadtl_queue *vpaq;
+
+	vpaq = zalloc(sizeof(*vpaq));
+	if (!vpaq)
+		return NULL;
+
+	vpaq->vpa = vpa;
+	vpaq->queue_nr = queue_nr;
+
+	return vpaq;
+}
+
+/*
+ * When the Dispatch Trace Log data is collected along with other events
+ * like sched tracepoint events, it needs to be correlated and present
+ * interleaved along with these events. Perf events can be collected
+ * parallely across the CPUs.
+ *
+ * An auxtrace_queue is created for each CPU. Data within each queue is in
+ * increasing order of timestamp. Allocate and setup auxtrace queues here.
+ * All auxtrace queues is maintained in auxtrace heap in the increasing order
+ * of timestamp. So always the lowest timestamp (entries to be processed first)
+ * is on top of the heap.
+ *
+ * To add to auxtrace heap, fetch the timestamp from first DTL entry
+ * for each of the queue.
+ */
+static int powerpc_vpadtl__setup_queue(struct powerpc_vpadtl *vpa,
+		struct auxtrace_queue *queue,
+		unsigned int queue_nr)
+{
+	struct powerpc_vpadtl_queue *vpaq = queue->priv;
+	struct dtl_entry *record;
+	double result, div;
+	double boot_freq;
+	unsigned long long boot_tb;
+	unsigned long long diff;
+	unsigned long long save = 0;
+
+	if (list_empty(&queue->head) || vpaq)
+		return 0;
+
+	vpaq = powerpc_vpadtl__alloc_queue(vpa, queue_nr);
+	if (!vpaq)
+		return -ENOMEM;
+
+	queue->priv = vpaq;
+
+	if (queue->cpu != -1)
+		vpaq->cpu = queue->cpu;
+
+	if (!vpaq->on_heap) {
+		int ret;
+retry:
+		ret = powerpc_vpadtl_decode(vpaq);
+		if (!ret)
+			return 0;
+
+		if (ret < 0)
+			goto retry;
+
+		record = vpaq->dtl;
+		/*
+		 * Formula used to get timestamp that can be co-related with
+		 * other perf events:
+		 * ((timbase from DTL entry - boot time) / frequency) * 1000000000
+		 */
+		if (record->timebase) {
+			boot_tb = vpaq->boot_tb;
+			boot_freq = vpaq->tb_freq;
+			diff = be64_to_cpu(record->timebase) - boot_tb;
+			div = diff / boot_freq;
+			result = div;
+			result = result * 1000000000;
+			save = result;
+		}
+
+		vpaq->timestamp = save;
+		ret = auxtrace_heap__add(&vpa->heap, queue_nr, vpaq->timestamp);
+		if (ret)
+			return ret;
+		vpaq->on_heap = true;
+	}
+
+	return 0;
+}
+
+static int powerpc_vpadtl__setup_queues(struct powerpc_vpadtl *vpa)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < vpa->queues.nr_queues; i++) {
+		ret = powerpc_vpadtl__setup_queue(vpa, &vpa->queues.queue_array[i], i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int powerpc_vpadtl__update_queues(struct powerpc_vpadtl *vpa)
+{
+	if (vpa->queues.new_data) {
+		vpa->queues.new_data = false;
+		return powerpc_vpadtl__setup_queues(vpa);
+	}
+
+	return 0;
+}
+
 static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unused,
 				 union perf_event *event __maybe_unused,
 				 struct perf_sample *sample __maybe_unused,
 				 const struct perf_tool *tool __maybe_unused)
 {
-	return 0;
+	int err = 0;
+	struct powerpc_vpadtl *vpa = container_of(session->auxtrace,
+			struct powerpc_vpadtl, auxtrace);
+
+	if (dump_trace)
+		return 0;
+
+	if (!tool->ordered_events) {
+		pr_err("VPA requires ordered events\n");
+		return -EINVAL;
+	}
+
+	if (sample->time) {
+		err = powerpc_vpadtl__update_queues(vpa);
+		if (err)
+			return err;
+	}
+
+	return err;
 }
 
 /*
@@ -181,6 +395,9 @@ static int powerpc_vpadtl_process_auxtrace_event(struct perf_session *session,
 			return -errno;
 	}
 
+	if (!dump_trace)
+		return 0;
+
 	err = auxtrace_queues__add_event(&vpa->queues, session, event,
 					 data_offset, &buffer);
 	if (err)
-- 
2.47.1


