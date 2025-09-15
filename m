Return-Path: <linuxppc-dev+bounces-12201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0FB57178
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:28:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGqQ0C8Mz3dV3;
	Mon, 15 Sep 2025 17:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921329;
	cv=none; b=QZp7GxHdzNDa7qjOTRosl8tzw/YKYtWMyt7CvDFT4n+X7Ep56tB/N7Xf5TQGyjNApBjEZwiWhnCPHeAo2GqN5x0SKbHsl37x4LLRM5OJK3dOawsW0i/wydi9RqakbvvUmZUoGVn8SE9R4RQCS3lwAi7nEGz2gpdJYEKkbP05GxSLv8tIXZYpXENp2a8krHbn1hab5NNmKAvZTMeI0Knlm8hGd3PufzddzsL1GQx9hybseBWYtVBOzeaNnB5gd+FZxw6VA8W+BZ4HKonanYhgr0FlPlb5DLAivIk23CwEF2iygIE7KEKsdvk47GX8FQFYcrKpiizihZwKuvLfLPQSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921329; c=relaxed/relaxed;
	bh=+Lsl894fQnDhI6MJOrR0gcwoe+tlVqL43hcSHIXNqJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KXltheqD+uqKC4csvptJrPIN+w9RngA6kQkVKCdRSava+4oh6K2Q5A2Bekg1QGif9ohFFHTs6cpvGxdket49BAhonWAM9Zk3jNmkrF41m32H1wtLEP1kjmxvXA5aacsli5/nsAUHWaCO9RSfpImpDiUgv38XobJTZ5OPISbsWnVEwE1IjfTU8+3wjT/Z0Br4+4SkplS7ki0EJywGKcdwZBekvfCIgkPsehXEf55sKCE3ZWPdEppmk1pq2CRnQixuf0/PzdlfmdMrST8gXZmv0uJW9k1EmeFIInppP+GkEj2fGJJK0nKC1xVipGz9KuEoXqQrh0e/3Ma98udQbf4Tmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eGihC1XF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eGihC1XF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGqN6h3Fz3dTx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:28:48 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EFFYRp025992;
	Mon, 15 Sep 2025 07:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+Lsl894fQnDhI6MJO
	rR0gcwoe+tlVqL43hcSHIXNqJk=; b=eGihC1XFLCN3c3Hrm20a6Qtyy+ULj69zC
	6yCkLsPbHvVreKJQNM3vCWyDJHp9SWJsOsBezao7AuA7XSwiNFmlCbUxME0Ynv6G
	Mp4WR86pYMXB6GXUKD+sBT12cH7ro7R9D94Dsd1r6bnPigkohvkka3ev4jD6G/Ev
	6bBX8HBgUqUnQyLejC0mrQCEgVU/HLBiTLL/JMgUucQvM6feqYHWBM81/z5/qLDJ
	WMDqmECCBAFKbFV/k6jOnllMwniSGTGoVO9W7jjavMJk+pIxC+UUBhdJLcy8clAF
	Ya+4p2WpAkgU+Wlnqqy89FMDInZjJQBYRCQ6lT/ex6HNyiDGyFGsA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496069b3jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:43 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7C747002354;
	Mon, 15 Sep 2025 07:28:43 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496069b3jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F4s5hX009382;
	Mon, 15 Sep 2025 07:28:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn34xav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:42 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7ScH851577260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:28:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8041320049;
	Mon, 15 Sep 2025 07:28:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 990C220040;
	Mon, 15 Sep 2025 07:28:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:28:32 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com
Subject: [PATCH V2 5/6] tools/perf: Process the DTL entries in queue and deliver samples
Date: Mon, 15 Sep 2025 12:57:53 +0530
Message-Id: <20250915072754.99850-6-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE0MDE0MiBTYWx0ZWRfX1mrfVl6zxo07
 AlPed1R084bsjvw6gO628df38sAWBVb7RFoMcR54TD3hcYngOcBAHThPVmNho1Ik4QmZY4Z+q7w
 M2ntCgwkjTxG/u8GsGdXx/U0SrFRkCsmD/tVTXh4xg2M0y2ZowS4sx7R5bE0W5y3m2SLsPiXF6d
 s7JyrPUQHcLXy01sU36xN5mp49m+A7J9FZgz6BryFB8UmCgm9Slq8BD7xOEjzMal2kC7KD0/Q2i
 TanM+uZ21x4sjR7Z9PIwP8u0Uwa6FPlPPZxaGDu0JwnvxHMkHXkERPeN9AZFJTQnL582B7PrdeT
 osNY86/ZEY0Gf3o58cpjqpVrctrYrlTEs96ss9zGb+3ZAg6gCvI/b+dRM8Uuo27/01gyfV1macv
 gO0bbkTa
X-Authority-Analysis: v=2.4 cv=QaJmvtbv c=1 sm=1 tr=0 ts=68c7c02b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=0BwqhFxtJAs8UL0y_CcA:9
X-Proofpoint-GUID: VLLpHgnu1-Ba0gZ706fHZGkUA9UY7Zzi
X-Proofpoint-ORIG-GUID: CBGPDiO4-mpCIMcczk0vS1FiM4PQBknG
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

Create samples from DTL entries for displaying in perf report
and perf script. When the different PERF_RECORD_XX records are
processed from perf session, powerpc_vpadtl_process_event() will
be invoked. For each of the PERF_RECORD_XX record, compare the timestamp
of perf record with timestamp of top element in the auxtrace heap.
Process the auxtrace queue if the timestamp of element from heap is
lower than timestamp from entry in perf record.

Sometimes it could happen that one buffer is only partially
processed. if the timestamp of occurrence of another event is more
than currently processed element in the queue, it will move on
to next perf record. So keep track of position of buffer to
continue processing next time. Update the timestamp of the
auxtrace heap with the timestamp of last processed entry from
the auxtrace buffer.

Generate perf sample for each entry in the dispatch trace log.
Fill in the sample details:
- sample ip is picked from srr0 field of dtl_entry
- sample cpu is picked from processor_id of dtl_entry
- sample id is from sample_id of powerpc_vpadtl
- cpumode is set to PERF_RECORD_MISC_KERNEL
- Additionally save the details in raw_data of sample. This
is to print the relevant fields in perf_sample__fprintf_synth()
when called from builtin-script

The sample is processed by calling perf_session__deliver_synth_event()
so that it gets included in perf report.

Sample Output:

  ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
  [ perf record: Woken up 1 times to write data ]
  [ perf record: Captured and wrote 0.300 MB perf.data ]

  ./perf report

  # Samples: 321  of event 'vpa-dtl'
  # Event count (approx.): 321
  #
  # Children      Self  Command  Shared Object      Symbol
  # ........  ........  .......  .................  ..............................
  #
     100.00%   100.00%  swapper  [kernel.kallsyms]  [k] plpar_hcall_norets_notrace

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
Addressed review comments from Adrian:
- Moved time calculation to different function
- Alignment and wording changes

 tools/perf/util/powerpc-vpadtl.c | 173 +++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
index 637abde60f44..dc437dae16b8 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -161,6 +161,43 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
 	powerpc_vpadtl_dump(vpa, buf, len);
 }
 
+/*
+ * Generate perf sample for each entry in the dispatch trace log.
+ *   - sample ip is picked from srr0 field of powerpc_vpadtl_entry
+ *   - sample cpu is logical cpu.
+ *   - cpumode is set to PERF_RECORD_MISC_KERNEL
+ *   - Additionally save the details in raw_data of sample. This
+ *   is to print the relevant fields in perf_sample__fprintf_synth()
+ *   when called from builtin-script
+ */
+static int powerpc_vpadtl_sample(struct powerpc_vpadtl_entry *record, struct powerpc_vpadtl *vpa, u64 save, int cpu)
+{
+	struct perf_sample sample;
+	union perf_event event;
+
+	sample.ip = be64_to_cpu(record->srr0);
+	sample.period = 1;
+	sample.cpu = cpu;
+	sample.id = vpa->sample_id;
+	sample.callchain = NULL;
+	sample.branch_stack = NULL;
+	memset(&event, 0, sizeof(event));
+	sample.cpumode = PERF_RECORD_MISC_KERNEL;
+	sample.time = save;
+	sample.raw_data = record;
+	sample.raw_size = sizeof(record);
+	event.sample.header.type = PERF_RECORD_SAMPLE;
+	event.sample.header.misc = sample.cpumode;
+	event.sample.header.size = sizeof(struct perf_event_header);
+
+	if (perf_session__deliver_synth_event(vpa->session, &event, &sample)) {
+		pr_debug("Failed to create sample for dtl entry\n");
+		return -1;
+	}
+
+	return 0;
+}
+
 static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue *vpaq)
 {
 	struct auxtrace_buffer *buffer = vpaq->buffer;
@@ -234,6 +271,140 @@ static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
 	return 1;
 }
 
+static int powerpc_vpadtl_decode_all(struct powerpc_vpadtl_queue *vpaq)
+{
+	int ret;
+	unsigned char *buf;
+
+	if (!vpaq->buf_len || vpaq->pkt_len == vpaq->size) {
+		ret = powerpc_vpadtl_get_buffer(vpaq);
+		if (ret <= 0)
+			return ret;
+	}
+
+	if (vpaq->buffer) {
+		buf = vpaq->buffer->data;
+		buf += vpaq->pkt_len;
+		vpaq->dtl = (struct powerpc_vpadtl_entry *)buf;
+		if ((long long)be64_to_cpu(vpaq->dtl->timebase) <= 0) {
+			if (vpaq->pkt_len != dtl_entry_size && vpaq->buf_len) {
+				vpaq->pkt_len += dtl_entry_size;
+				vpaq->buf_len -= dtl_entry_size;
+			}
+			return -1;
+		}
+		vpaq->pkt_len += dtl_entry_size;
+		vpaq->buf_len -= dtl_entry_size;
+	} else {
+		return 0;
+	}
+
+	return 1;
+}
+
+static int powerpc_vpadtl_run_decoder(struct powerpc_vpadtl_queue *vpaq, u64 *timestamp)
+{
+	struct powerpc_vpadtl *vpa = vpaq->vpa;
+	struct powerpc_vpadtl_entry *record;
+	int ret;
+	unsigned long long vpaq_timestamp;
+
+	while (1) {
+		ret = powerpc_vpadtl_decode_all(vpaq);
+		if (!ret) {
+			pr_debug("All data in the queue has been processed.\n");
+			return 1;
+		}
+
+		/*
+		 * Error is detected when decoding VPA PMU trace. Continue to
+		 * the next trace data and find out more dtl entries.
+		 */
+		if (ret < 0)
+			continue;
+
+		record = vpaq->dtl;
+
+		vpaq_timestamp = powerpc_vpadtl_timestamp(vpaq);
+
+		/* Update timestamp for the last record */
+		if (vpaq_timestamp > vpaq->timestamp)
+			vpaq->timestamp = vpaq_timestamp;
+
+		/*
+		 * If the timestamp of the queue is later than timestamp of the
+		 * coming perf event, bail out so can allow the perf event to
+		 * be processed ahead.
+		 */
+		if (vpaq->timestamp >= *timestamp) {
+			*timestamp = vpaq->timestamp;
+			vpaq->pkt_len -= dtl_entry_size;
+			vpaq->buf_len += dtl_entry_size;
+			return 0;
+		}
+
+		ret = powerpc_vpadtl_sample(record, vpa, vpaq_timestamp, vpaq->cpu);
+		if (ret)
+			continue;
+	}
+	return 0;
+}
+
+/*
+ * For each of the PERF_RECORD_XX record, compare the timestamp
+ * of perf record with timestamp of top element in the auxtrace heap.
+ * Process the auxtrace queue if the timestamp of element from heap is
+ * lower than timestamp from entry in perf record.
+ *
+ * Update the timestamp of the auxtrace heap with the timestamp
+ * of last processed entry from the auxtrace buffer.
+ */
+static int powerpc_vpadtl_process_queues(struct powerpc_vpadtl *vpa, u64 timestamp)
+{
+	unsigned int queue_nr;
+	u64 ts;
+	int ret;
+
+	while (1) {
+		struct auxtrace_queue *queue;
+		struct powerpc_vpadtl_queue *vpaq;
+
+		if (!vpa->heap.heap_cnt)
+			return 0;
+
+		if (vpa->heap.heap_array[0].ordinal >= timestamp)
+			return 0;
+
+		queue_nr = vpa->heap.heap_array[0].queue_nr;
+		queue = &vpa->queues.queue_array[queue_nr];
+		vpaq = queue->priv;
+
+		auxtrace_heap__pop(&vpa->heap);
+
+		if (vpa->heap.heap_cnt) {
+			ts = vpa->heap.heap_array[0].ordinal + 1;
+			if (ts > timestamp)
+				ts = timestamp;
+		} else
+			ts = timestamp;
+
+		ret = powerpc_vpadtl_run_decoder(vpaq, &ts);
+		if (ret < 0) {
+			auxtrace_heap__add(&vpa->heap, queue_nr, ts);
+			return ret;
+		}
+
+		if (!ret) {
+			ret = auxtrace_heap__add(&vpa->heap, queue_nr, ts);
+			if (ret < 0)
+				return ret;
+		} else {
+			vpaq->on_heap = false;
+		}
+	}
+	return 0;
+}
+
 static struct powerpc_vpadtl_queue *powerpc_vpadtl__alloc_queue(struct powerpc_vpadtl *vpa,
 						unsigned int queue_nr)
 {
@@ -347,6 +518,8 @@ static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unu
 		err = powerpc_vpadtl__update_queues(vpa);
 		if (err)
 			return err;
+
+		err = powerpc_vpadtl_process_queues(vpa, sample->time);
 	}
 
 	return err;
-- 
2.47.1


