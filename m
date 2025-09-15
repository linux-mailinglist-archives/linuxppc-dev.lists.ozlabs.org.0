Return-Path: <linuxppc-dev+bounces-12198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D44B57175
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGq13Gk7z3dLB;
	Mon, 15 Sep 2025 17:28:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921309;
	cv=none; b=C2wzLOy7UfB5KUg12atf0PNdf5ZKPu3prmZMNyw2zI6B+oEnERFR2E8eJfmj2YN7ZNMQr/1O4C2oLr8V0nP+IGpHQ8SG1Fk/xrq2raBqJjmsju7tu4Qe/VQSoSGELBVunXjDnxwVTBhU2EKWyMLrK6Icu/MmRKGy9JKy5LxIlxU69yQXgBILhtpbwdAOxd1FnepILvCBN2xtePkJFQv9jV071dQGMcsudC61W6U68cC5GfhXTZlZWpm17+Z0OmP3qoevhR+/nvmsKo7dC1nZeNWf1bPU7Gh9EkxiOCcvrpiNCuqYyXT7+moesqw5+u77IFx0HLlbAwIgg4Kqdj54/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921309; c=relaxed/relaxed;
	bh=JzwvTKjFO8lmj16pZtitG0jLKR3U3wZpC3FOgMTdrBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LIRuXcRD07cYDjl6bq0fxiFYCbYZv5OBjxUP0ipqdBEAG9s+jLUMUte/oLtYzGTWcY+NBR5qabf+MMsOYcWGi7EUVGrTG3IOsbvwzomOhUgd6AHdwGVzxUBv9CzWc3pvjfPv2y8sPyoN5LyiieykCVFBxEMIyh6rQyrIjqeDflH/F8EdKW7yWFT6AqioN0yTPNOE7gH51FXoSMHNOlKL5zOdDzw7t0tugC0VxFz1CEEFGWpn5ST+1kJ+z3tN4Eeh/jTD+CUNBPRT7TGLrL3JyWGY8O2eBWRdchSrsSg+2KEDct7w4DLZRPdQJxFQsHUBHFZ+2RqWdzi6StKnRgczYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ssyE0kEm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ssyE0kEm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGpz73Rgz3dL3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:28:27 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F3PUrb023417;
	Mon, 15 Sep 2025 07:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JzwvTKjFO8lmj16pZ
	titG0jLKR3U3wZpC3FOgMTdrBI=; b=ssyE0kEmgtjg+bF2pJLem1nbv2d0SsHy2
	6EneTUcEbqwiEpvXYPS97SO1x34Qk8aJ12DlrrM0gk19ngugbMS3ya8+UulGIRhv
	qpw/nESeV51AISa8ET13FYwVY4LGUhfmPwkUN4I7Yaf0TK4oVkiO5VK7iqR2no6I
	v51hyxrH8op5Q50gb/6Eq5GtGHnvFnu8+xPHnopCrWnyc0w1Qtl0lF9YqHPn4rYk
	uOyDzBgf1HmBpWEcg6/i6GRp63n1CtUGJkMihRomh0Tuy+zIihTk0Y07tRPU5JFL
	cHvm3hKaz43IgB5mjAabdURRNdHcLx46HtsfB/aad+HEJS+77AsWw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avngyen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:23 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7MI40025847;
	Mon, 15 Sep 2025 07:28:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avngyem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7QgYh022384;
	Mon, 15 Sep 2025 07:28:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kxpd8fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:22 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7SIuK56295750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:28:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3789B20040;
	Mon, 15 Sep 2025 07:28:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FA5720049;
	Mon, 15 Sep 2025 07:28:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:28:11 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com
Subject: [PATCH V2 2/6] tools/perf: process auxtrace events and display in perf report -D
Date: Mon, 15 Sep 2025 12:57:50 +0530
Message-Id: <20250915072754.99850-3-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: bzKQ9x-xIViHZK__G3u57_BRc5JFCETb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfX97l5RJ7JsbSd
 38mwvUyLm+tQ/sI9/imIh7eIIG+3FN4Ijw6vsJU9HiALBkS8TWT7JK8LAHIyWjCVmhBV0Bh3k3k
 KQXirRadqRwLyA8AS5QX1SOVUVQVdpC4tBxdViZa0mmPvJfBk6OxwICXvNUsy6CORnw7NVDlYXD
 jr56NDG6Ur7CF9WM+JZ29v11bshRKwvzSQNSI8GNHQE8m8f0o9WEwX7Wzov4/ilJobDgUyUCXSj
 kjfZTihBacFceHVeRZu1lEcy9uPGbzrEF+QDPDNNf7Pkgexhoj7nqGl2iROIn2pvOh1J7VG1erV
 oY56lt2MyntHifqmN0m7vY0xb5zFgOrcKUlDDCyKUEEjpxoRoCa3TtmANHv4ZksD3lxxqWtWJls
 R3vWMnwF
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c7c017 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=OzKdmid5rgPCbxX5rsUA:9
X-Proofpoint-GUID: N7WRWZhYmPT6TzW7iZ32lxbLxV-8lyMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
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

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
Addressed review comments from Adrian
- Renamed dtl_entry to powerpc_vpadtl_entry in util/event.h
- Removed unused #includes in powerpc-vpadtl.c
- Added helper session_to_vpa to get "struct powerpc_vpadtl"
- Updated auxtrace_queues__add_event only for piped data
- Used zfree to free "struct powerpc_vpadtl_queue"

 tools/perf/util/Build            |   1 +
 tools/perf/util/auxtrace.c       |   3 +
 tools/perf/util/event.h          |  16 ++
 tools/perf/util/powerpc-vpadtl.c | 263 +++++++++++++++++++++++++++++++
 tools/perf/util/powerpc-vpadtl.h |   7 +
 5 files changed, 290 insertions(+)
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
index 000000000000..2e8488a3dbd7
--- /dev/null
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * VPA DTL PMU support
+ */
+
+#include <inttypes.h>
+#include "color.h"
+#include "evlist.h"
+#include "session.h"
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
+			printf("dispatch_reason:%s, preempt_reason:%s, enqueue_to_dispatch_time:%d,"
+					"ready_to_enqueue_time:%d, waiting_to_ready_time:%d\n",
+					dispatch_reasons[dtl->dispatch_reason], preempt_reasons[dtl->preempt_reason],\
+					be32_to_cpu(dtl->enqueue_to_dispatch_time),\
+					be32_to_cpu(dtl->ready_to_enqueue_time), be32_to_cpu(dtl->waiting_to_ready_time));
+		} else {
+			struct boottb_freq *boot_tb = (struct boottb_freq *)buf;
+
+			printf("boot_tb: %" PRIu64 ", tb_freq: %" PRIu64 "\n", boot_tb->boot_tb, boot_tb->tb_freq);
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
+	struct powerpc_vpadtl_queue *vpaq;
+
+	unsigned int i;
+
+	for (i = 0; i < queues->nr_queues; i++) {
+		vpaq = queues->queue_array[i].priv;
+		if (vpaq)
+			zfree(&vpaq);
+	}
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
index 50a7aa24acbe..aa76f5beac2c 100644
--- a/tools/perf/util/powerpc-vpadtl.h
+++ b/tools/perf/util/powerpc-vpadtl.h
@@ -15,4 +15,11 @@ enum {
 
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


