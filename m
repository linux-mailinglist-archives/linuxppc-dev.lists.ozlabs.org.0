Return-Path: <linuxppc-dev+bounces-12278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A65D6B58DE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 07:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQr3T5X6Xz3cYV;
	Tue, 16 Sep 2025 15:26:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758000373;
	cv=none; b=YP/tysL2vmh4BX7dxTvjpVKjR/p6l2zw+hGIIMmBwphtbfuKPP52bNdzMAWJFTqGC9NdlGAFG+HDBZp0BKoDGfco7D+/rq0Kz6H/4ZU3/XYyzy6wQya4aRD0l6lAoWa+Pyc8AoTaMQ5AdMouv2dxN2dADAsHOyWkYfbmr9QUyiLFbY0cfSOheKgAynU0+E8OKuxNNeFTJDJIs576Kk9bsp6hfh0FihLpZYw1BS4FDZkGrV259njBBZoCWpETMJUTERutxeM1H0vb1eTEYWTBzScQCJnfAJc+YUrs8fpOgOwYW+HLdu1Umd+c+GRXpfJ9W9DofhosglrerxNiuwKgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758000373; c=relaxed/relaxed;
	bh=2wTnNlQ7BzYDrtKJw391XmF/4HMQFGKKt2hIB70+lc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oRWZRzkNcjWNParUzDv7xzRYxHE1vwm4XjHzgQ4wIP6/G1Bcylt87sxGxv9GZ/k5dBN+U6HKKycJUtRUrowSOY6T1wU3TuRUNisFi2zZ3nK0Mullpg9O1rpuJqkq+fUxpyyMKbZtpn7hcAH5wnR34FeKhSmzgRgZ/CLHw/rNi1HTa2KapWSgQbuvYaFmyPJ5BSnwDuqcJ6TiAwoXj8UJZ1gVFBzcmN9K65w872wCbqmxQfd91csBooNEa4Nw2clYn0BRbKMB6NOWifeMOU0yP72k1WL07TnTRGB2a7P0/45IKynaxo+poWHLM4TbA79oBjuXaEDCsl+OeBc//RehoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U45Uf7fc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U45Uf7fc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQr3S6cjvz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 15:26:12 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FIw77Q020054;
	Tue, 16 Sep 2025 05:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=2wTnNlQ7BzYDrtKJw
	391XmF/4HMQFGKKt2hIB70+lc8=; b=U45Uf7fcms3a7E58g6RTXUXV0M5BV98z8
	gBTF92V5Jn80Zmq+M7iS+eNYzpN2l034LXEp6u9m6kHy3yj+lHyK/9MJxNczxrFH
	jUGcZbm/eSkiqNB+JAGdj7eMx4zs6balXoNU1TnDZS8k+pFai35Yq3f1ZXc5VY3z
	OClGhNSUi4Qm418FX1wWlVB+34ujO3ZaYf6Tflg8VtmygpBdQkJDv4/M5ECKtvx6
	41ztjJxEOG0e168h+qwN8Dmch0gSV9DrrvgCMLz2HaN8fEb5lkoWcF0QtOQICij2
	Gkz+iwh6lV0GwN5tzMRi6MnCxl/B6oWIjBBQMhjBY9sjWI5ZnCb7Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat5dm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:08 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G5K5dW020984;
	Tue, 16 Sep 2025 05:26:08 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat5dm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:08 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G2AnEu029536;
	Tue, 16 Sep 2025 05:26:06 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0tdcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:06 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G5Q2Bl15139300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 05:26:02 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B858620040;
	Tue, 16 Sep 2025 05:26:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D25920043;
	Tue, 16 Sep 2025 05:25:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.245.152])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Sep 2025 05:25:56 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 2/6] tools/perf: process auxtrace events and display in perf report -D
Date: Tue, 16 Sep 2025 10:55:32 +0530
Message-Id: <20250916052536.93911-3-atrajeev@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BKWzrEQG c=1 sm=1 tr=0 ts=68c8f4f0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=db6D43No38nVuAvBkOcA:9
X-Proofpoint-GUID: dvx258uaQHJwib56xjXwzBryC5y7Fhk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfXzTOlESEFGVzR
 dutA5+4j41leV62fDSGSs+OPoWAH9Q0nDapli0t1G7DOVrJX6A9f6zbbVLaLDbuWYyNlvgLxC+1
 mnccHY4X6YAyDPd0YG2Oe/lwYgKpI71+vwD3OL+4Ke+GyjdEWXWJIIxHxyT1MZ5+uFDZRhgxFN/
 uJ4olZzBYEfqNrLh7KQjkYVmEWkacJUuK3Jq9YbbZkSRCgAVvSVYqydbVGLRv+gDNWeIpEVoFWo
 qn8IF41HeguOlhI7t9aP21syRU0W+FV3RUKgD87uqu1ZGfSNzPEKQdnBAMN0wnfDldm/jlq7cs/
 kBa/x9HA/sJcNHZUmpk5m698B4olKiMJhTBEBcYS60koVGKq8JaEdW2IVl0EKVI4MSmZj248SfU
 KymhF4yJ
X-Proofpoint-ORIG-GUID: hPykgeT8pG7E9MpnzVdHdNE2SUWlUTwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add vpa dtl pmu auxtrace process function for "perf report -D".
The auxtrace event processing functions are defined in file
"util/powerpc-vpadtl.c". Data structures used includes "struct
powerpc_vpadtl_queue", "struct powerpc_vpadtl" to store the auxtrace
buffers in queue. Different PERF_RECORD_XXX are generated
during recording. PERF_RECORD_AUXTRACE_INFO is processed first
since it is of type perf_user_event_type and perf session event
delivers perf_session__process_user_event() first. Define function
powerpc_vpadtl_process_auxtrace_info() to handle the processing of
PERF_RECORD_AUXTRACE_INFO records. In this function, initialize
the aux buffer queues using auxtrace_queues__init(). Setup the
required infrastructure for aux data processing. The data is collected
per CPU and auxtrace_queue is created for each CPU.

Define powerpc_vpadtl_process_event() function to process
PERF_RECORD_AUXTRACE records. In this, add the event to queue using
auxtrace_queues__add_event() and process the buffer in
powerpc_vpadtl_dump_event(). The first entry in the buffer with
timebase as zero has boot timebase and frequency. Remaining data is of
format for "struct powerpc_vpadtl_entry". Define the translation for
dispatch_reasons and preempt_reasons, report this when dump trace is
invoked via powerpc_vpadtl_dump()

Sample output:

   ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
   [ perf record: Woken up 1 times to write data ]
   [ perf record: Captured and wrote 0.300 MB perf.data ]

   ./perf report -D

   0 0 0x39b10 [0x30]: PERF_RECORD_AUXTRACE size: 0x690  offset: 0  ref: 0  idx: 0  tid: -1  cpu: 0
   .
   . ... VPA DTL PMU data: size 1680 bytes, entries is 35
   .  00000000: boot_tb: 21349649546353231, tb_freq: 512000000
   .  00000030: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:7064, ready_to_enqueue_time:187, waiting_to_ready_time:6611773
   .  00000060: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:146, ready_to_enqueue_time:0, waiting_to_ready_time:15359437
   .  00000090: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:4868, ready_to_enqueue_time:232, waiting_to_ready_time:5100709
   .  000000c0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:179, ready_to_enqueue_time:0, waiting_to_ready_time:30714243
   .  000000f0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:197, ready_to_enqueue_time:0, waiting_to_ready_time:15350648
   .  00000120: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:213, ready_to_enqueue_time:0, waiting_to_ready_time:15353446
   .  00000150: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:212, ready_to_enqueue_time:0, waiting_to_ready_time:15355126
   .  00000180: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:6368, ready_to_enqueue_time:164, waiting_to_ready_time:5104665

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
v3:
Addressed review comments from Adrian
- Added header files which were missing
- line length change to fit 100 columns
- zfree for auxtrace queue can be used directly without
  checking if queue exists

- Added Tested by from Venkat

v2:
Addressed review comments from Adrian
- Renamed dtl_entry to powerpc_vpadtl_entry in util/event.h
- Removed unused #includes in powerpc-vpadtl.c
- Added helper session_to_vpa to get "struct powerpc_vpadtl"
- Updated auxtrace_queues__add_event only for piped data
- Used zfree to free "struct powerpc_vpadtl_queue"

 tools/perf/util/Build            |   1 +
 tools/perf/util/auxtrace.c       |   3 +
 tools/perf/util/event.h          |  16 ++
 tools/perf/util/powerpc-vpadtl.c | 264 +++++++++++++++++++++++++++++++
 tools/perf/util/powerpc-vpadtl.h |   7 +
 5 files changed, 291 insertions(+)
 create mode 100644 tools/perf/util/powerpc-vpadtl.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 4959e7a990e4..5ead46dc98e7 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -136,6 +136,7 @@ perf-util-$(CONFIG_AUXTRACE) += arm-spe-decoder/
 perf-util-$(CONFIG_AUXTRACE) += hisi-ptt.o
 perf-util-$(CONFIG_AUXTRACE) += hisi-ptt-decoder/
 perf-util-$(CONFIG_AUXTRACE) += s390-cpumsf.o
+perf-util-$(CONFIG_AUXTRACE) += powerpc-vpadtl.o
 
 ifdef CONFIG_LIBOPENCSD
 perf-util-$(CONFIG_AUXTRACE) += cs-etm.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index f294658bb948..6d10f3d61ff8 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -55,6 +55,7 @@
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
 #include "util/mmap.h"
+#include "powerpc-vpadtl.h"
 
 #include <linux/ctype.h>
 #include "symbol/kallsyms.h"
@@ -1394,6 +1395,8 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
 		err = hisi_ptt_process_auxtrace_info(event, session);
 		break;
 	case PERF_AUXTRACE_VPA_DTL:
+		err = powerpc_vpadtl_process_auxtrace_info(event, session);
+		break;
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index e40d16d3246c..7ba208ae86fd 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -254,6 +254,22 @@ struct perf_synth_intel_iflag_chg {
 	u64	branch_ip; /* If via_branch */
 };
 
+/*
+ * The powerpc VPA DTL entries are of below format
+ */
+struct powerpc_vpadtl_entry {
+	u8      dispatch_reason;
+	u8      preempt_reason;
+	u16     processor_id;
+	u32     enqueue_to_dispatch_time;
+	u32     ready_to_enqueue_time;
+	u32     waiting_to_ready_time;
+	u64     timebase;
+	u64     fault_addr;
+	u64     srr0;
+	u64     srr1;
+};
+
 static inline void *perf_synth__raw_data(void *p)
 {
 	return p + 4;
diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
new file mode 100644
index 000000000000..9aff05470b13
--- /dev/null
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VPA DTL PMU support
+ */
+
+#include <inttypes.h>
+#include "color.h"
+#include "evlist.h"
+#include "session.h"
+#include "auxtrace.h"
+#include "data.h"
+#include "machine.h"
+#include "debug.h"
+#include "powerpc-vpadtl.h"
+
+/*
+ * Structure to save the auxtrace queue
+ */
+struct powerpc_vpadtl {
+	struct auxtrace			auxtrace;
+	struct auxtrace_queues		queues;
+	struct auxtrace_heap		heap;
+	u32				auxtrace_type;
+	struct perf_session		*session;
+	struct machine			*machine;
+	u32				pmu_type;
+};
+
+struct boottb_freq {
+	u64     boot_tb;
+	u64     tb_freq;
+	u64     timebase;
+	u64     padded[3];
+};
+
+struct powerpc_vpadtl_queue {
+	struct powerpc_vpadtl	*vpa;
+	unsigned int		queue_nr;
+	struct auxtrace_buffer	*buffer;
+	struct thread		*thread;
+	bool			on_heap;
+	bool			done;
+	pid_t			pid;
+	pid_t			tid;
+	int			cpu;
+};
+
+const char *dispatch_reasons[11] = {
+	"external_interrupt",
+	"firmware_internal_event",
+	"H_PROD",
+	"decrementer_interrupt",
+	"system_reset",
+	"firmware_internal_event",
+	"conferred_cycles",
+	"time_slice",
+	"virtual_memory_page_fault",
+	"expropriated_adjunct",
+	"priv_doorbell"};
+
+const char *preempt_reasons[10] = {
+	"unused",
+	"firmware_internal_event",
+	"H_CEDE",
+	"H_CONFER",
+	"time_slice",
+	"migration_hibernation_page_fault",
+	"virtual_memory_page_fault",
+	"H_CONFER_ADJUNCT",
+	"hcall_adjunct",
+	"HDEC_adjunct"};
+
+#define	dtl_entry_size	sizeof(struct powerpc_vpadtl_entry)
+
+/*
+ * Function to dump the dispatch trace data when perf report
+ * is invoked with -D
+ */
+static void powerpc_vpadtl_dump(struct powerpc_vpadtl *vpa __maybe_unused,
+			 unsigned char *buf, size_t len)
+{
+	struct powerpc_vpadtl_entry *dtl;
+	int pkt_len, pos = 0;
+	const char *color = PERF_COLOR_BLUE;
+
+	color_fprintf(stdout, color,
+			". ... VPA DTL PMU data: size %zu bytes, entries is %zu\n",
+			len, len/dtl_entry_size);
+
+	if (len % dtl_entry_size)
+		len = len - (len % dtl_entry_size);
+
+	while (len) {
+		pkt_len = dtl_entry_size;
+		printf(".");
+		color_fprintf(stdout, color, "  %08x: ", pos);
+		dtl = (struct powerpc_vpadtl_entry *)buf;
+		if (dtl->timebase != 0) {
+			printf("dispatch_reason:%s, preempt_reason:%s, "
+					"enqueue_to_dispatch_time:%d, ready_to_enqueue_time:%d, "
+					"waiting_to_ready_time:%d\n",
+					dispatch_reasons[dtl->dispatch_reason],
+					preempt_reasons[dtl->preempt_reason],
+					be32_to_cpu(dtl->enqueue_to_dispatch_time),
+					be32_to_cpu(dtl->ready_to_enqueue_time),
+					be32_to_cpu(dtl->waiting_to_ready_time));
+		} else {
+			struct boottb_freq *boot_tb = (struct boottb_freq *)buf;
+
+			printf("boot_tb: %" PRIu64 ", tb_freq: %" PRIu64 "\n",
+					boot_tb->boot_tb, boot_tb->tb_freq);
+		}
+
+		pos += pkt_len;
+		buf += pkt_len;
+		len -= pkt_len;
+	}
+}
+
+static struct powerpc_vpadtl *session_to_vpa(struct perf_session *session)
+{
+	return container_of(session->auxtrace, struct powerpc_vpadtl, auxtrace);
+}
+
+static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char *buf,
+			       size_t len)
+{
+	printf(".\n");
+	powerpc_vpadtl_dump(vpa, buf, len);
+}
+
+static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unused,
+				 union perf_event *event __maybe_unused,
+				 struct perf_sample *sample __maybe_unused,
+				 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+/*
+ * Process PERF_RECORD_AUXTRACE records
+ */
+static int powerpc_vpadtl_process_auxtrace_event(struct perf_session *session,
+					  union perf_event *event,
+					  const struct perf_tool *tool __maybe_unused)
+{
+	struct powerpc_vpadtl *vpa = session_to_vpa(session);
+	struct auxtrace_buffer *buffer;
+	int fd = perf_data__fd(session->data);
+	off_t data_offset;
+	int err;
+
+	if (!dump_trace)
+		return 0;
+
+	if (perf_data__is_pipe(session->data)) {
+		data_offset = 0;
+	} else {
+		data_offset = lseek(fd, 0, SEEK_CUR);
+		if (data_offset == -1)
+			return -errno;
+	}
+
+	err = auxtrace_queues__add_event(&vpa->queues, session, event,
+			data_offset, &buffer);
+
+	if (err)
+		return err;
+
+	/* Dump here now we have copied a piped trace out of the pipe */
+	if (auxtrace_buffer__get_data(buffer, fd)) {
+		powerpc_vpadtl_dump_event(vpa, buffer->data, buffer->size);
+		auxtrace_buffer__put_data(buffer);
+	}
+
+	return 0;
+}
+
+static int powerpc_vpadtl_flush(struct perf_session *session __maybe_unused,
+			 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static void powerpc_vpadtl_free_events(struct perf_session *session)
+{
+	struct powerpc_vpadtl *vpa = session_to_vpa(session);
+	struct auxtrace_queues *queues = &vpa->queues;
+
+	for (unsigned int i = 0; i < queues->nr_queues; i++)
+		zfree(&queues->queue_array[i].priv);
+
+	auxtrace_queues__free(queues);
+}
+
+static void powerpc_vpadtl_free(struct perf_session *session)
+{
+	struct powerpc_vpadtl *vpa = session_to_vpa(session);
+
+	auxtrace_heap__free(&vpa->heap);
+	powerpc_vpadtl_free_events(session);
+	session->auxtrace = NULL;
+	free(vpa);
+}
+
+static const char * const powerpc_vpadtl_info_fmts[] = {
+	[POWERPC_VPADTL_TYPE]		= "  PMU Type           %"PRId64"\n",
+};
+
+static void powerpc_vpadtl_print_info(__u64 *arr)
+{
+	if (!dump_trace)
+		return;
+
+	fprintf(stdout, powerpc_vpadtl_info_fmts[POWERPC_VPADTL_TYPE], arr[POWERPC_VPADTL_TYPE]);
+}
+
+/*
+ * Process the PERF_RECORD_AUXTRACE_INFO records and setup
+ * the infrastructure to process auxtrace events. PERF_RECORD_AUXTRACE_INFO
+ * is processed first since it is of type perf_user_event_type.
+ * Initialise the aux buffer queues using auxtrace_queues__init().
+ * auxtrace_queue is created for each CPU.
+ */
+int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
+				  struct perf_session *session)
+{
+	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
+	size_t min_sz = sizeof(u64) * POWERPC_VPADTL_TYPE;
+	struct powerpc_vpadtl *vpa;
+	int err;
+
+	if (auxtrace_info->header.size < sizeof(struct perf_record_auxtrace_info) +
+					min_sz)
+		return -EINVAL;
+
+	vpa = zalloc(sizeof(struct powerpc_vpadtl));
+	if (!vpa)
+		return -ENOMEM;
+
+	err = auxtrace_queues__init(&vpa->queues);
+	if (err)
+		goto err_free;
+
+	vpa->session = session;
+	vpa->machine = &session->machines.host; /* No kvm support */
+	vpa->auxtrace_type = auxtrace_info->type;
+	vpa->pmu_type = auxtrace_info->priv[POWERPC_VPADTL_TYPE];
+
+	vpa->auxtrace.process_event = powerpc_vpadtl_process_event;
+	vpa->auxtrace.process_auxtrace_event = powerpc_vpadtl_process_auxtrace_event;
+	vpa->auxtrace.flush_events = powerpc_vpadtl_flush;
+	vpa->auxtrace.free_events = powerpc_vpadtl_free_events;
+	vpa->auxtrace.free = powerpc_vpadtl_free;
+	session->auxtrace = &vpa->auxtrace;
+
+	powerpc_vpadtl_print_info(&auxtrace_info->priv[0]);
+
+	return 0;
+
+err_free:
+	free(vpa);
+	return err;
+}
diff --git a/tools/perf/util/powerpc-vpadtl.h b/tools/perf/util/powerpc-vpadtl.h
index 0bca9b56379d..ca809660b9bb 100644
--- a/tools/perf/util/powerpc-vpadtl.h
+++ b/tools/perf/util/powerpc-vpadtl.h
@@ -13,4 +13,11 @@ enum {
 
 #define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * sizeof(u64))
 
+union perf_event;
+struct perf_session;
+struct perf_pmu;
+
+int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
+				  struct perf_session *session);
+
 #endif
-- 
2.47.1


