Return-Path: <linuxppc-dev+bounces-11053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807E5B27B2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3FnS16WHz3ccf;
	Fri, 15 Aug 2025 18:36:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246972;
	cv=none; b=Si6HxMDClpqCdy8z24ARdXY1rmh8nqiWgnz14WITHzWmgfpQa/EDHeQBc4gKr/z57J9L0l7e+2eDXaBX15KU9aMrVIKCI3/iS4ll5RKciqDWJUjD99Ts/YwfWhyJyZKBUfwVnQWLz5bHtG6o4H2bvBJN1kNZ8PCpiJHQYyH7z994rJ8hbClBmfeOD13m8mODKyWs0XXx3zXLsA41yGpVxl/PDunYj7X0IQsyFdIoiSvOqxJ6ITKnsSZIZSIJxJrvgB38dqnGpKtfn+/cc8n3tKY1/+8Ie13vbJ6dKo0dOvgqkkh5lnHifJmWwtwnm8r0J5hqJ/8pDVwBIHzoizNUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246972; c=relaxed/relaxed;
	bh=hcgOdTTn/xFLPnarax5D6L3Fdmdh2/hBD51nngXF33g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bmm+Fc08QQlgoNE1fV3yF4630GBwCC78NT2Qhw3iPwszTz1yrKcLPQs1KLZ7kEaxnP4rrpSLR/aUGHODByLdrARvI1+k6NT4j8fDSTptmgrHxzkCZrSc/KsD8tG4Oy6c9uI8O/oDr2erM7Nd23uhUQpb4KU7Pogai/98XgfTqzEmfysuN1LNwLqyMqlBgvBHgME6Pz3nIJ3Zwb8azGs+8VqUpJYTzl/zI9vPbKjm5OUGTIKoIzRioIHu88rU+hwNryLeKlzcG4NugoPs9/kfA9ofY4hdMp6uvTJWBBTfrn8D/t3zEvMiqBPGKOZ3AvffCgk9hR6SeZAWu1YA9fGakg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jku7h+mO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jku7h+mO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3FnR2Y0Sz3ccV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:36:11 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EMrdaD019301;
	Fri, 15 Aug 2025 08:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=hcgOdTTn/xFLPnara
	x5D6L3Fdmdh2/hBD51nngXF33g=; b=jku7h+mODSaYKgmkhh4Zryciax0a64Rxx
	DmEm6OVcN2QuBgt2Lxji0qbMNXCGIY8KtWLLdl3AznnemJfPW1si9X1IaWteZeeU
	LF+4oMOp71S1EEyMl1BfvRF8WQj2YmKQesMpXTzqZOWGZg6gP/yaIXAL5AonWaGs
	JhDNmTsleiZcwG82i7GZV9NMyxLWgQBSonoYTsqX6NN3W2BuGBFQWRtkW16OkcBF
	kZ9BXQ5wp1HMh0Mg55k/JnMVKREcWJjHbBbJLoy25QCExnVsdDrjo2tj8Pi0kKNn
	1SVy+ZJbKb5Y/dPkr5Z+MlUPo/gGfw/jrH1XYcVes6FjpH+CvV1WA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48gypeggyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:36:07 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8a6qo003629;
	Fri, 15 Aug 2025 08:36:06 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48gypeggyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:36:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F6OpOp010656;
	Fri, 15 Aug 2025 08:36:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48egnv0bbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:36:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8a2DY56361242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:36:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4704C20043;
	Fri, 15 Aug 2025 08:36:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FD6320040;
	Fri, 15 Aug 2025 08:35:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:35:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 11/14] tools/perf: Process the DTL entries in queue and deliver samples
Date: Fri, 15 Aug 2025 14:04:04 +0530
Message-Id: <20250815083407.27953-12-atrajeev@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=eaU9f6EH c=1 sm=1 tr=0 ts=689ef177 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=0BwqhFxtJAs8UL0y_CcA:9
X-Proofpoint-GUID: dx3fGZBeRNA5m2U9b9IQIdtBRKdbw0sL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE2NyBTYWx0ZWRfX7uBvdQAc3CU9
 wolN9gB2dt5sTCnq/PCAlHah8VuDTauoqywkJ9hQ3rVEa+wYE2qVlg2IEojQyw/DXGGq57QXJIb
 f9GI4ybjH0MEgj/qi0cLGxXIDbsDBtg2eVklJk52HkQb1WRbzUSzRwSM80v4rkHi6e1VE0Ve16h
 tTN3/A2Z4Zf7yKagYfQ5TF4Mktg081KhzC2EIFhocAmY8jsAUnCI7/7hAKR2ZeBk0KOHRF/0sJf
 9Dy0dTXji2YHM7ox9j7K9qcdybtXBquAbSnN65eyOJMt97uJySKY3qqzPmDG0Yrk9jrGzOesb7q
 WrTeaF+DT26u4TNhoXU+mqsPh2Uxly1h6S2RBPTpdqBetlUNfH++V5GlfQQYnljuqGUa3wZ30qB
 /wTAerVL
X-Proofpoint-ORIG-GUID: Lte7VYXBIYg2ZEeHmXau_uR4EUbjYA44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508130167
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
 tools/perf/util/powerpc-vpadtl.c | 181 +++++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
index 299927901c9d..370c566f9ac2 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -160,6 +160,43 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
 	powerpc_vpadtl_dump(vpa, buf, len);
 }
 
+/*
+ * Generate perf sample for each entry in the dispatch trace log.
+ *   - sample ip is picked from srr0 field of dtl_entry
+ *   - sample cpu is picked from logical cpu.
+ *   - sample id is from sample_id of powerpc_vpadtl
+ *   - cpumode is set to PERF_RECORD_MISC_KERNEL
+ *   - Additionally save the details in raw_data of sample. This
+ *   is to print the relevant fields in perf_sample__fprintf_synth()
+ *   when called from builtin-script
+ */
+static int powerpc_vpadtl_sample(struct dtl_entry *record, struct powerpc_vpadtl *vpa, u64 save, int cpu)
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
+	if (perf_session__deliver_synth_event(vpa->session, &event,
+				&sample)) {
+		pr_debug("Failed to create sample for dtl entry\n");
+		return -1;
+	}
+	return 0;
+}
+
 static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue *vpaq)
 {
 	struct auxtrace_buffer *buffer = vpaq->buffer;
@@ -233,6 +270,148 @@ static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
 	return 1;
 }
 
+static int powerpc_vpadtl_decode_all(struct powerpc_vpadtl_queue *vpaq)
+{
+	int ret;
+	unsigned char *buf;
+
+	if (!vpaq->buf_len || (vpaq->pkt_len == vpaq->size)) {
+		ret = powerpc_vpadtl_get_buffer(vpaq);
+		if (ret <= 0)
+			return ret;
+	}
+
+	if (vpaq->buffer) {
+		buf = vpaq->buffer->data;
+		buf += vpaq->pkt_len;
+		vpaq->dtl = (struct dtl_entry *)buf;
+		if ((long long)be64_to_cpu(vpaq->dtl->timebase) <= 0) {
+			if (vpaq->pkt_len != dtl_entry_size && vpaq->buf_len) {
+				vpaq->pkt_len += dtl_entry_size;
+				vpaq->buf_len -= dtl_entry_size;
+			}
+			return -1;
+		}
+		vpaq->pkt_len += dtl_entry_size;
+		vpaq->buf_len -= dtl_entry_size;
+	} else
+		return 0;
+
+
+	return 1;
+}
+
+static int powerpc_vpadtl_run_decoder(struct powerpc_vpadtl_queue *vpaq, u64 *timestamp)
+{
+	struct powerpc_vpadtl *vpa = vpaq->vpa;
+	struct dtl_entry *record;
+	int ret;
+	double result, div;
+	double boot_freq = vpaq->tb_freq;
+	unsigned long long boot_tb = vpaq->boot_tb;
+	unsigned long long diff;
+	unsigned long long save;
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
+		diff = be64_to_cpu(record->timebase) - boot_tb;
+		div = diff / boot_freq;
+		result = div;
+		result = result * 1000000000;
+		save = result;
+
+		/* Update timestamp for the last record */
+		if (save > vpaq->timestamp)
+			vpaq->timestamp = save;
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
+		ret = powerpc_vpadtl_sample(record, vpa, save, vpaq->cpu);
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
@@ -368,6 +547,8 @@ static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unu
 		err = powerpc_vpadtl__update_queues(vpa);
 		if (err)
 			return err;
+
+		err = powerpc_vpadtl_process_queues(vpa, sample->time);
 	}
 
 	return err;
-- 
2.47.1


