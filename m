Return-Path: <linuxppc-dev+bounces-11055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B311B27B2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:36:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3Fnl163mz3cf7;
	Fri, 15 Aug 2025 18:36:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246987;
	cv=none; b=ElOw1a8yfkKEU+tvrSIa72/hiwoKSuiEkJKnBmm5D1FTKo1aGrNksicZKD/XvO1QIZI5x0WlYcNNtj+3uS9D5o2gAsUmCsqisNs/jCJ0+EX/4WohEkZHLZZ8ijm1w9P1XyA+L7hPwo1lIdca7U03b8ihLvYtL/UXIRA77Bi6Qw5OldiJnfmtI5B+5l7b+K7iDKIrh8yqPeAQHBM9ekM6f4/x09c7vXzlYLriLsCs3q+qAWguKsyg0U8bAjLb2nvBQv4feFpzkHUoOpDMiLyO/RytRjWjyE6buIZYWzCRGm5ZURKDmlOBirK9EUhre6spwhzBpjyWbp2F7wFI8qS8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246987; c=relaxed/relaxed;
	bh=M5IaTxOHGkc63KME0wpS6L5Sokecu4r4FIvK612qxIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jXTaV8OFz8EZujYxhyL/qPGQB+5siFZY18xUEHL9SnGzkexioMaqmKBSFp3/HwjWeWbgy3YK9RQx1rmWln9Dyv+U8rbd4M0abHQWiL6fMOJ6xj+bOKlMP93caBY+UDSaPCvmSYgJbgQQINEJQn3l3RqS9LESbbjI6/SUvgE8+O0c5HWUHTk1UDMqf9UyWFDv7qB6cn/652EQycRpT/K9PYcdkonOlzosxK9GI2vjTBbB4bMT7ERdFEcVAy+t4h3AZLZdwYxdUKxc3VcYMKLyG7e55VRVIxp5eYtqOl9pTTtDOD9nkuG43lf3uMruEDdgKXvtgfo6OGZLLo004zMZ4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AOeuSTyh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AOeuSTyh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3Fnk3TnMz3cdn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:36:26 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F029uT022440;
	Fri, 15 Aug 2025 08:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=M5IaTxOHGkc63KME0
	wpS6L5Sokecu4r4FIvK612qxIk=; b=AOeuSTyhpsl+WO/dPDCSOdgiLkp98nGVN
	GywFa+7H+/tjU9z+q8fAQnvj20lKTcwVEw6rR7fe+VNWB7lyMvAHPvVKZQ3Ca/yO
	HA8xJa2gHQ6ARjx5FryLzlro3OxmXiWqD8hPyA43mPtML51uoFaxNMpMUbGW/W4N
	bVGPpAkc1ikcwEpsqDZLAzuhEkvmV5ukz2OG6FzfWrl1w+LydnjJ/SfIaanJDksl
	hUBT2KZncEfIRZcC17siwhiOTZh//r4NKLRvCe/2zBxIv+kMPyw+cLJpOQqyzJDg
	/Nm3bJPTEZmggDf8sl4lRF9ZuoXjShpqhG1f0fwrLi7mGGjiBJd3g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14xgy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:36:23 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8XpDc031563;
	Fri, 15 Aug 2025 08:36:22 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14xgy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:36:22 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F73tOQ020632;
	Fri, 15 Aug 2025 08:36:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ehnq83ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:36:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8aHa035324614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:36:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8489120043;
	Fri, 15 Aug 2025 08:36:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5F5B20040;
	Fri, 15 Aug 2025 08:36:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:36:10 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 13/14] tools/perf: Enable perf script to present the DTL entries
Date: Fri, 15 Aug 2025 14:04:06 +0530
Message-Id: <20250815083407.27953-14-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: xD30sNIm8Y16RZMcP7pDdCY6_zm3sDJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX/XjrzUwhTPha
 asFP9r0wf0a6EE3EbrK1DfR0s2vcw8kdSIBHFxEM4GEPPvKcg5v7B21/hV5yu3kbZarTYN7xFLZ
 CRDZ5BdQ6G1MgAqk54QQzrZrfukXGzIv9huUnoHXVZxnvitg3p9AosF/yUZlBE2McuJ90xq5Inw
 Yinr6oTQAx8GTk6VX7hvR5McpgwY8s+zPcouw2cZqgM3zNt23cGyHQXHlLC7BA+ObAiwiK7N78Z
 tZUt12ERk5+m3R0/qQpsw5J7Pgt8hghO2ZMCGN+U7tuFIVbfGXsDns7MvsMhYK/2UB2MDH8Fx0Z
 Fyr0XkvzForwl3dxenZysaZn2D5XeXMGkDWAtJaw9LPg5OEnpIm7o1WI0r98Ij0sN5satKlr7Z6
 6QHDAh0i
X-Proofpoint-GUID: TJuOYSTC6L8THmSwqJ517o1h5T1Tw7lS
X-Authority-Analysis: v=2.4 cv=fLg53Yae c=1 sm=1 tr=0 ts=689ef187 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=u1D-RBGd0xOBWWY2JRAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enable perf script to present the DTL entries. Process the
dispatch trace log details in arch_perf_sample__fprintf_synth_evt()
defined in buiultin-script.c file for config value:
PERF_SYNTH_POWERPC_VPA_DTL.

Sample output:

   ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
   [ perf record: Woken up 1 times to write data ]
   [ perf record: Captured and wrote 0.300 MB perf.data ]

   ./perf script
            perf   13322 [002]   233.835807:                     sched:sched_switch: perf:13322 [120] R ==> migration/2:27 [0]
     migration/2      27 [002]   233.835811:               sched:sched_migrate_task: comm=perf pid=13322 prio=120 orig_cpu=2 dest_cpu=3
     migration/2      27 [002]   233.835818:               sched:sched_stat_runtime: comm=migration/2 pid=27 runtime=9214 [ns]
     migration/2      27 [002]   233.835819:                     sched:sched_switch: migration/2:27 [0] S ==> swapper/2:0 [120]
         swapper       0 [002]   233.835822:                                vpa-dtl: timebase: 338954486062657 dispatch_reason:decrementer_interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:435,			ready_to_enqueue_time:0, waiting_to_ready_time:34775058, processor_id: 202 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
         swapper       0 [001]   233.835886:                                vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:542,			ready_to_enqueue_time:0, waiting_to_ready_time:1245360, processor_id: 201 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 tools/perf/builtin-script.c      | 23 +++++++++++++++++++++--
 tools/perf/util/powerpc-vpadtl.c | 16 ----------------
 tools/perf/util/powerpc-vpadtl.h | 19 +++++++++++++++++++
 3 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index eff584735980..a0faadaadc4d 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -66,6 +66,7 @@
 #include "util/cgroup.h"
 #include "util/annotate.h"
 #include "perf.h"
+#include "util/powerpc-vpadtl.h"
 
 #include <linux/ctype.h>
 #ifdef HAVE_LIBTRACEEVENT
@@ -2004,8 +2005,26 @@ static int perf_sample__fprintf_synth_iflag_chg(struct perf_sample *sample, FILE
 }
 
 static void arch_perf_sample__fprintf_synth_evt(struct perf_sample *data __maybe_unused,
-		 FILE *fp __maybe_unused, u64 config __maybe_unused)
+		 FILE *fp __maybe_unused, u64 config __maybe_unused, struct perf_env *env)
 {
+	const char *arch = perf_env__arch(env);
+
+	if (!strcmp("powerpc", arch)) {
+		struct dtl_entry *dtl = (struct dtl_entry *)data->raw_data;
+
+		if (config != PERF_SYNTH_POWERPC_VPA_DTL)
+			return;
+		fprintf(fp, "timebase: %" PRIu64 "dispatch_reason:%s, preempt_reason:%s, enqueue_to_dispatch_time:%d,\
+				ready_to_enqueue_time:%d, waiting_to_ready_time:%d, processor_id: %d",\
+				be64_to_cpu(dtl->timebase),
+				dispatch_reasons[dtl->dispatch_reason],
+				preempt_reasons[dtl->preempt_reason],
+				be32_to_cpu(dtl->enqueue_to_dispatch_time),
+				be32_to_cpu(dtl->ready_to_enqueue_time),
+				be32_to_cpu(dtl->waiting_to_ready_time),
+				be16_to_cpu(dtl->processor_id));
+	}
+
 	return;
 }
 
@@ -2032,7 +2051,7 @@ static int perf_sample__fprintf_synth(struct perf_sample *sample,
 	case PERF_SYNTH_INTEL_IFLAG_CHG:
 		return perf_sample__fprintf_synth_iflag_chg(sample, fp);
 	default:
-		arch_perf_sample__fprintf_synth_evt(sample, fp, evsel->core.attr.config);
+		arch_perf_sample__fprintf_synth_evt(sample, fp, evsel->core.attr.config, evsel__env(evsel));
 		break;
 	}
 
diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
index 370c566f9ac2..482ddf1a2d51 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -30,22 +30,6 @@
 #include "symbol.h"
 #include "tool.h"
 
-/*
- * The DTL entries are of below format
- */
-struct dtl_entry {
-	u8      dispatch_reason;
-	u8      preempt_reason;
-	u16     processor_id;
-	u32     enqueue_to_dispatch_time;
-	u32     ready_to_enqueue_time;
-	u32     waiting_to_ready_time;
-	u64     timebase;
-	u64     fault_addr;
-	u64     srr0;
-	u64     srr1;
-};
-
 /*
  * Structure to save the auxtrace queue
  */
diff --git a/tools/perf/util/powerpc-vpadtl.h b/tools/perf/util/powerpc-vpadtl.h
index 625172adaba5..497f704787a5 100644
--- a/tools/perf/util/powerpc-vpadtl.h
+++ b/tools/perf/util/powerpc-vpadtl.h
@@ -20,6 +20,25 @@ union perf_event;
 struct perf_session;
 struct perf_pmu;
 
+/*
+ * The DTL entries are of below format
+ */
+struct dtl_entry {
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
+extern const char *dispatch_reasons[11];
+extern const char *preempt_reasons[10];
+
 int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
 				  struct perf_session *session);
 
-- 
2.47.1


