Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F3175357
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:30:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W7y32k3VzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:30:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7ql5HZ4zDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:24:35 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225Jkrc015928
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:24:33 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfk5kcr67-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:24:33 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:24:30 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:26 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225OOeI23134332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82AEE52057;
 Mon,  2 Mar 2020 05:24:24 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2AC425204E;
 Mon,  2 Mar 2020 05:24:21 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 02/11] perf/core: Data structure to present hazard data
Date: Mon,  2 Mar 2020 10:53:46 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0020-0000-0000-000003AF5D1B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0021-0000-0000-00002207865A
Message-Id: <20200302052355.36365-3-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-01_09:2020-02-28,
 2020-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020038
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

Introduce new perf sample_type PERF_SAMPLE_PIPELINE_HAZ to request kernel
to provide cpu pipeline hazard data. Also, introduce arch independent
structure 'perf_pipeline_haz_data' to pass hazard data to userspace. This
is generic structure and arch specific data needs to be converted to this
format.

Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 include/linux/perf_event.h            |  7 ++++++
 include/uapi/linux/perf_event.h       | 32 ++++++++++++++++++++++++++-
 kernel/events/core.c                  |  6 +++++
 tools/include/uapi/linux/perf_event.h | 32 ++++++++++++++++++++++++++-
 4 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 547773f5894e..d5b606e3c57d 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1001,6 +1001,7 @@ struct perf_sample_data {
 	u64				stack_user_size;
 
 	u64				phys_addr;
+	struct perf_pipeline_haz_data	pipeline_haz;
 } ____cacheline_aligned;
 
 /* default value for data source */
@@ -1021,6 +1022,12 @@ static inline void perf_sample_data_init(struct perf_sample_data *data,
 	data->weight = 0;
 	data->data_src.val = PERF_MEM_NA;
 	data->txn = 0;
+	data->pipeline_haz.itype = PERF_HAZ__ITYPE_NA;
+	data->pipeline_haz.icache = PERF_HAZ__ICACHE_NA;
+	data->pipeline_haz.hazard_stage = PERF_HAZ__PIPE_STAGE_NA;
+	data->pipeline_haz.hazard_reason = PERF_HAZ__HREASON_NA;
+	data->pipeline_haz.stall_stage = PERF_HAZ__PIPE_STAGE_NA;
+	data->pipeline_haz.stall_reason = PERF_HAZ__SREASON_NA;
 }
 
 extern void perf_output_sample(struct perf_output_handle *handle,
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 377d794d3105..ff252618ca93 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -142,8 +142,9 @@ enum perf_event_sample_format {
 	PERF_SAMPLE_REGS_INTR			= 1U << 18,
 	PERF_SAMPLE_PHYS_ADDR			= 1U << 19,
 	PERF_SAMPLE_AUX				= 1U << 20,
+	PERF_SAMPLE_PIPELINE_HAZ		= 1U << 21,
 
-	PERF_SAMPLE_MAX = 1U << 21,		/* non-ABI */
+	PERF_SAMPLE_MAX = 1U << 22,		/* non-ABI */
 
 	__PERF_SAMPLE_CALLCHAIN_EARLY		= 1ULL << 63, /* non-ABI; internal use */
 };
@@ -870,6 +871,13 @@ enum perf_event_type {
 	 *	{ u64			phys_addr;} && PERF_SAMPLE_PHYS_ADDR
 	 *	{ u64			size;
 	 *	  char			data[size]; } && PERF_SAMPLE_AUX
+	 *	{ u8			itype;
+	 *	  u8			icache;
+	 *	  u8			hazard_stage;
+	 *	  u8			hazard_reason;
+	 *	  u8			stall_stage;
+	 *	  u8			stall_reason;
+	 *	  u16			pad;} && PERF_SAMPLE_PIPELINE_HAZ
 	 * };
 	 */
 	PERF_RECORD_SAMPLE			= 9,
@@ -1185,4 +1193,26 @@ struct perf_branch_entry {
 		reserved:40;
 };
 
+struct perf_pipeline_haz_data {
+	/* Instruction/Opcode type: Load, Store, Branch .... */
+	__u8	itype;
+	/* Instruction Cache source */
+	__u8	icache;
+	/* Instruction suffered hazard in pipeline stage */
+	__u8	hazard_stage;
+	/* Hazard reason */
+	__u8	hazard_reason;
+	/* Instruction suffered stall in pipeline stage */
+	__u8	stall_stage;
+	/* Stall reason */
+	__u8	stall_reason;
+	__u16	pad;
+};
+
+#define PERF_HAZ__ITYPE_NA	0x0
+#define PERF_HAZ__ICACHE_NA	0x0
+#define PERF_HAZ__PIPE_STAGE_NA	0x0
+#define PERF_HAZ__HREASON_NA	0x0
+#define PERF_HAZ__SREASON_NA	0x0
+
 #endif /* _UAPI_LINUX_PERF_EVENT_H */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index e453589da97c..d00037c77ccf 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1754,6 +1754,9 @@ static void __perf_event_header_size(struct perf_event *event, u64 sample_type)
 	if (sample_type & PERF_SAMPLE_PHYS_ADDR)
 		size += sizeof(data->phys_addr);
 
+	if (sample_type & PERF_SAMPLE_PIPELINE_HAZ)
+		size += sizeof(data->pipeline_haz);
+
 	event->header_size = size;
 }
 
@@ -6712,6 +6715,9 @@ void perf_output_sample(struct perf_output_handle *handle,
 			perf_aux_sample_output(event, handle, data);
 	}
 
+	if (sample_type & PERF_SAMPLE_PIPELINE_HAZ)
+		perf_output_put(handle, data->pipeline_haz);
+
 	if (!event->attr.watermark) {
 		int wakeup_events = event->attr.wakeup_events;
 
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 377d794d3105..ff252618ca93 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -142,8 +142,9 @@ enum perf_event_sample_format {
 	PERF_SAMPLE_REGS_INTR			= 1U << 18,
 	PERF_SAMPLE_PHYS_ADDR			= 1U << 19,
 	PERF_SAMPLE_AUX				= 1U << 20,
+	PERF_SAMPLE_PIPELINE_HAZ		= 1U << 21,
 
-	PERF_SAMPLE_MAX = 1U << 21,		/* non-ABI */
+	PERF_SAMPLE_MAX = 1U << 22,		/* non-ABI */
 
 	__PERF_SAMPLE_CALLCHAIN_EARLY		= 1ULL << 63, /* non-ABI; internal use */
 };
@@ -870,6 +871,13 @@ enum perf_event_type {
 	 *	{ u64			phys_addr;} && PERF_SAMPLE_PHYS_ADDR
 	 *	{ u64			size;
 	 *	  char			data[size]; } && PERF_SAMPLE_AUX
+	 *	{ u8			itype;
+	 *	  u8			icache;
+	 *	  u8			hazard_stage;
+	 *	  u8			hazard_reason;
+	 *	  u8			stall_stage;
+	 *	  u8			stall_reason;
+	 *	  u16			pad;} && PERF_SAMPLE_PIPELINE_HAZ
 	 * };
 	 */
 	PERF_RECORD_SAMPLE			= 9,
@@ -1185,4 +1193,26 @@ struct perf_branch_entry {
 		reserved:40;
 };
 
+struct perf_pipeline_haz_data {
+	/* Instruction/Opcode type: Load, Store, Branch .... */
+	__u8	itype;
+	/* Instruction Cache source */
+	__u8	icache;
+	/* Instruction suffered hazard in pipeline stage */
+	__u8	hazard_stage;
+	/* Hazard reason */
+	__u8	hazard_reason;
+	/* Instruction suffered stall in pipeline stage */
+	__u8	stall_stage;
+	/* Stall reason */
+	__u8	stall_reason;
+	__u16	pad;
+};
+
+#define PERF_HAZ__ITYPE_NA	0x0
+#define PERF_HAZ__ICACHE_NA	0x0
+#define PERF_HAZ__PIPE_STAGE_NA	0x0
+#define PERF_HAZ__HREASON_NA	0x0
+#define PERF_HAZ__SREASON_NA	0x0
+
 #endif /* _UAPI_LINUX_PERF_EVENT_H */
-- 
2.21.1

