Return-Path: <linuxppc-dev+bounces-12281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966FEB58DE5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 07:26:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQr3v6lMhz30Lt;
	Tue, 16 Sep 2025 15:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758000395;
	cv=none; b=Xof81pkjob6XYfmCstAIbn+RlA+F6x2ZZu2o5nGMlmbzSIyhGCquJPT+uijLO0x95kXsSz3qqshsVav5BaijLcl8lgkHGir87jKMrkyg0XRTcLhbPDtjxIfqvN9IL1TAnH/ES5L0LfBvbERaumYJNTzzzbLiZYWCzIL/GB0vCtdXDcqHN5DV5SZJ+I/FMdWJY7ijjpQPzUZm533Xy7Vi13rT0s93b9rC6syz6O2NZDcrRjghHQrFX1b7y5tTrGzPOcosIztmBU2rG2i5PoPiu3WGHgPBx2yTQ3K85kmlxlo7MdanJerHtWz2VBmu16AH7X8OKDS4Txoc52jyI1OTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758000395; c=relaxed/relaxed;
	bh=jnISBdlb7Co/zBnO7esYVcEuGK3h55u470TorGvUNsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mVInfSPxnrB3Pyw4NBqFId4p2xJOGL2nXen5K9VxXxGcHMmQXIIJoXQMW6Z1HNZF6/U32FVqP7yfhHglB6pH1IEFGaVr1u6cinHaaLG66roIO4s2SPvPQy7U9ns4IJbxm4VMtQNR11KcvD56f25iMdWqvgFKmJWerAZy7+pTVLxYHkqEJc2y3QmaGHIWYyzZ/t3pexdnhvVxdvUPSq0f/2uWfdDq0vRK6WOExjjuFX7JPwLijv9WYbFjlFjNRWdvxc5htPsS1OZeq0Qm5hgjyd2zdp6M+KFNsGAfAu2FOBPGdNcfsvSorrFKgkFVQAgh4xrllJxyMZmfLpHdUYrslQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NsLCyILm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NsLCyILm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQr3t51x1z304h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 15:26:34 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G14arD021720;
	Tue, 16 Sep 2025 05:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jnISBdlb7Co/zBnO7
	esYVcEuGK3h55u470TorGvUNsw=; b=NsLCyILmjh4vUQWFnmueoTemB7V44Yh1+
	5Dpvpc8ENf5P9TSHKusQYq6Sfq/CkVpDNN9NLVoBrCI89BgTdagaTf/MOagg3diy
	vhinsX2pTHeuddbUp32neZv4lqgS3F77RK6vbLOJDQgoOMm3uXlkP97IBdbSzx2F
	zExuYyLKPtHw+ORU/JVHvVGo1dxF6DCg0zvNFlOQdBrvAqYveMWyAZt7uRoth0Mg
	8C0WPko7QTQTZspCEIe2jwBzjUjDmxd7ObumYC7gqGgGkEq28ZrRrG1MlcnoCtcA
	c6WieBwn4PYUUg5VF1rx03FmriBUhAzB88ozFQKsTbNhdzOM/nKbg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y75p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:31 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G5QBsG006447;
	Tue, 16 Sep 2025 05:26:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509y75p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:30 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G4DNMb009382;
	Tue, 16 Sep 2025 05:26:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn39x39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G5QQj433816894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 05:26:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51D162004D;
	Tue, 16 Sep 2025 05:26:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE5AF20043;
	Tue, 16 Sep 2025 05:26:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.245.152])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Sep 2025 05:26:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 5/6] tools/perf: Process the DTL entries in queue and deliver samples
Date: Tue, 16 Sep 2025 10:55:35 +0530
Message-Id: <20250916052536.93911-6-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250916052536.93911-1-atrajeev@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMCBTYWx0ZWRfX5034W51GHGJy
 V0ggC+l7r5ZLsELf4w1nturpMYkYxtK9mfYzy24+6jswhP0Xh4qw9sAW0EYwX5Ufm4FwZtBaImQ
 QBgTl1bjo6W6RylR3wHBVumZiUrkpEBOZ1ZO43pkH38RAYJOte/7edfB0JvkNlLdg5xKb6ZlL86
 uKScczNtr5Iz8ghb/rwYkctE2mt617R9IjyEMk5BnxgrnTBkvYLxCYW6aaD5O6ZbFbCnrqE05Av
 DJJcBbhQy+weOaY85Z16BdW3M9zpYDQZS8+oWgK6rOO/3BMv72zmnC0DkzE6mRnJkotUSnnj+d2
 Ei4lR1w8k+5i8VVyo2xPFylVrozo0YaTKM2Asiwzsx+FenyZ7vvR1d3B49ufVp8+21DJxX5GWEO
 UVmOB52w
X-Authority-Analysis: v=2.4 cv=OPYn3TaB c=1 sm=1 tr=0 ts=68c8f507 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=gtQlsWBBX9hJ5Zvz7HcA:9
X-Proofpoint-GUID: iM76hExG_ImwjQ99apSH8UMvZ35VmLiD
X-Proofpoint-ORIG-GUID: VxTONYlqK2L4ogdLDxXQ8PjzG4L5mjPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130020
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

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
v3:
Addressed review comments from Adrian:
- line lenth to fit 100 columns
- Added braces for else condition

- Added Tested by from Venkat

v2:
Addressed review comments from Adrian:
- Moved time calculation to different function
- Alignment and wording changes

 tools/perf/util/powerpc-vpadtl.c | 175 +++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
index 1000fbc7a74b..39a3fb3f1330 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -167,6 +167,44 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
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
+static int powerpc_vpadtl_sample(struct powerpc_vpadtl_entry *record,
+		struct powerpc_vpadtl *vpa, u64 save, int cpu)
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
@@ -240,6 +278,141 @@ static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
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
+		} else {
+			ts = timestamp;
+		}
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
@@ -353,6 +526,8 @@ static int powerpc_vpadtl_process_event(struct perf_session *session,
 		err = powerpc_vpadtl__update_queues(vpa);
 		if (err)
 			return err;
+
+		err = powerpc_vpadtl_process_queues(vpa, sample->time);
 	}
 
 	return err;
-- 
2.47.1


