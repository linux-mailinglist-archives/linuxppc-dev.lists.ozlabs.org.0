Return-Path: <linuxppc-dev+bounces-12200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EACB57177
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:28:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGqH1tp5z3dSC;
	Mon, 15 Sep 2025 17:28:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921323;
	cv=none; b=d1m8g1o06lcZMlj83HTiD26HzIIfcq+GY3IrJFyaY1T8f73rudYbu50TWPVKrdxEaOybs+z+bfEqI6nEEmAnAIQroQ+P39o+U8EfI0K+kXqiXmvS6iPJ2d2LfDSPwV5v/RYshTfc3lYj/eRpakjueNSHj4E8dZab//5R+eRAe1GBT6k1mdSab3w5eIsnY3Le2/wA99UDWBX6nVXfQrWQDUnoq2HinSSrDZxjYn8sXbyS6HQsIxnoBeKu9V4StPcFu+4D9ct+8D5Eq8/5kuBQPUa0gJY6jadYOPN00zaf4vs4bv17byxGfzRwlHleePUxSJ28DGxUZ+qDk3Z+4fVQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921323; c=relaxed/relaxed;
	bh=MjkPoLVF8EgfpXcN7KG0n1tN5Zb4z8cE26qVF7oPhVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mDtu+vCC9iuJXhNcfiTkAXFIydQPCLLtjhj/+4V27JE47ic9Xmmo/3p8GsiGLaJvkF42q5fUdmLPRb5HeNrEhucvskfX/XpwoQu7bWcoEz3p5CuBUugCVM4lKfCC8cv8V/DUF40OL2BBO+EFEsB0CKxpO/MRRN+IG7WMUEuN7ByJEFBOzPqEudcmmlMQtuHUv8U0Z9VtGlRtlH86Imuq0r/kOdbBuMFST4fxRbEBoU6ZxXUrA6CRTpIFSarnf4TbeuonElDAVdCrysSr2UQFOuPibJ0JgwHWmk6UrDrICXTO/OVJTBenTl5ZpivCYxVjCEb81v/PdugABs5ladUnKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZKlWQaJL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZKlWQaJL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGqG39mRz3dDy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:28:42 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ELbbg7029113;
	Mon, 15 Sep 2025 07:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=MjkPoLVF8EgfpXcN7
	KG0n1tN5Zb4z8cE26qVF7oPhVo=; b=ZKlWQaJLLGYOQDJ7EyWEX7nE+CzN/LePC
	iC+qJ2Dn21aSWYu9cjDWZZDiVCSCtjOBGqip41PevrP3VDvw4oEKNpDaD/G6uM9r
	47M+Sb1BPzfoG8OGfm2tWoTfBvvX6nagM9AMkNUsqsKY7XFKyDzowliwHqtMHMwA
	vrvzKwmD9nEE/YjH5avWM2fE5hJzjVfC98PfDftbP9OQkezz8NWPGlH/LqjjcmA2
	OWK2vlvGxD9ckd0k/k03ydy3RYI+Amqa1yhHJEm7BqAAnTt2p08mvDPD+N9N+NOm
	tq+eqx6fPlbpH9WVFRblOoHRnsFwR4B4QbiHN8qpQSUFyhxBL2WLw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496069b3j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:36 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F6eOKn005040;
	Mon, 15 Sep 2025 07:28:36 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496069b3j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:36 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F4kVML008988;
	Mon, 15 Sep 2025 07:28:35 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn34xa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:35 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7SWth56295756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:28:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E22A82004B;
	Mon, 15 Sep 2025 07:28:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAA2320040;
	Mon, 15 Sep 2025 07:28:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:28:25 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com
Subject: [PATCH V2 4/6] tools/perf: Allocate and setup aux buffer queue to help co-relate with other events across CPU's
Date: Mon, 15 Sep 2025 12:57:52 +0530
Message-Id: <20250915072754.99850-5-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915072754.99850-1-atrajeev@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE0MDE0MiBTYWx0ZWRfX5cle1hCPDbts
 nZolMlYca+fEW4UF6BxnWaepZT/ZKTr+ufmSChFsAxy1AA9XvYKww/DqglUEdoOT4DWeg4Aq2fj
 ObWxLQlHArkW1Nnt2XW82oC+n9U0/XB5s8lKE8vOUycEiBTNWAsYuonS2IteCcfokNQFhnhHzf7
 yf7vWLmXVp98QB8UngS55veRR8Cq64UYDOx+Yqlnp4q26F30IjdNJ6M0ZPMVQxHCaR2b3xFxhCw
 ZObqYTPAcvE7EBwnyKO4wCCW0/Mt4OEZc1GYoHIrPor1kaE+jSPCc+gFVd/Q2Agz+i+6WXPsMLA
 UVAgcOU4E6dSpFKdjd2ttRFChDjx/qGKYciu+Bi6Y8LUDDnPoDFr2K+fo6YZiDSFyLsLrfukgYL
 irmEaeVj
X-Authority-Analysis: v=2.4 cv=QaJmvtbv c=1 sm=1 tr=0 ts=68c7c024 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=9jWZ9SMwFfNm59oFS4AA:9
X-Proofpoint-GUID: KvhXpAJqD4aBArpdcQapfcWfe9iWdnxk
X-Proofpoint-ORIG-GUID: _ZynflTzrzNy2SrxKLJV-B-n4SZjREiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509140142
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
to next event). In order to keep track of position of buffer, additional
fields is added to powerpc_vpadtl_queue structure.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
Addressed review comments from Adrian
- Moved time calculation to separate function

 tools/perf/util/powerpc-vpadtl.c | 226 ++++++++++++++++++++++++++++++-
 1 file changed, 223 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
index 9098cbe00bfd..637abde60f44 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -10,6 +10,8 @@
 #include "session.h"
 #include "debug.h"
 #include "powerpc-vpadtl.h"
+#include "sample.h"
+#include "tool.h"
 
 /*
  * Structure to save the auxtrace queue
@@ -38,6 +40,14 @@ struct powerpc_vpadtl_queue {
 	struct auxtrace_buffer	*buffer;
 	struct thread		*thread;
 	bool			on_heap;
+	struct powerpc_vpadtl_entry	*dtl;
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
@@ -112,6 +122,33 @@ static void powerpc_vpadtl_dump(struct powerpc_vpadtl *vpa __maybe_unused,
 	}
 }
 
+static unsigned long long powerpc_vpadtl_timestamp(struct powerpc_vpadtl_queue *vpaq)
+{
+	struct powerpc_vpadtl_entry *record = vpaq->dtl;
+	double result, div;
+	double boot_freq;
+	unsigned long long boot_tb;
+	unsigned long long diff;
+	unsigned long long timestamp = 0;
+
+	/*
+	 * Formula used to get timestamp that can be co-related with
+	 * other perf events:
+	 * ((timbase from DTL entry - boot time) / frequency) * 1000000000
+	 */
+	if (record->timebase) {
+		boot_tb = vpaq->boot_tb;
+		boot_freq = vpaq->tb_freq;
+		diff = be64_to_cpu(record->timebase) - boot_tb;
+		div = diff / boot_freq;
+		result = div;
+		result = result * 1000000000;
+		timestamp = result;
+	}
+
+	return timestamp;
+}
+
 static struct powerpc_vpadtl *session_to_vpa(struct perf_session *session)
 {
 	return container_of(session->auxtrace, struct powerpc_vpadtl, auxtrace);
@@ -124,12 +161,195 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
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
+	vpaq->dtl = (struct powerpc_vpadtl_entry *)buf;
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
+		vpaq->timestamp = powerpc_vpadtl_timestamp(vpaq);
+
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
-				 struct perf_sample *sample __maybe_unused,
-				 const struct perf_tool *tool __maybe_unused)
+				 struct perf_sample *sample,
+				 const struct perf_tool *tool)
 {
-	return 0;
+	struct powerpc_vpadtl *vpa = session_to_vpa(session);
+	int err = 0;
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
-- 
2.47.1


