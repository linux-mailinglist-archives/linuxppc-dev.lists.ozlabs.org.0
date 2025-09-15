Return-Path: <linuxppc-dev+bounces-12202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFEAB57179
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGqW2lRhz3dVX;
	Mon, 15 Sep 2025 17:28:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921335;
	cv=none; b=NVxSgmIVxZr3zZYjcjRLlWX7U+ok2OLpDk3kCU6Td9jyDEH7kYruWc1pbzSirakeP2wHKWXxZ+pdyjlRLt2WVF6bWxLWLyemJoyE2+wWw6LyZ4E5Qgzm5OegNLgDoI1+j43rkByP31fT4D9tjxCJS3a3ligS/Ul71PnDalDzsHrwAtrvGo4y/lKGFSbGUMcb1n6OAEY59q1Sf2k4iG3D1IGGXfvljgLh37e4fCMOhAKWnCoCiMHk/jDelWd5H0K6yPhNcR0OwfYINzGYLAXCYBVnFRjPjsDpNUz1yZlECi1LDyqsU2PqQ9LqgXSkFqv+xWWpjRxrHo5Tt9cy2Uvg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921335; c=relaxed/relaxed;
	bh=WpMqphf5yxD+1kewNndVHiMow19YdwwW3QNqTPR1R3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mS4bfbpL6EwOZ53CK/0TrM2uk9wbQKzl+vpXL//Xa9x311OLOUHsP9qL5Paa/E/ghlwRiLB2FqneSVDXvqcRfDgA57h3I/hkuCQh2HLXGM0UPbVbRt9XH6UPLwt01IcviaTj5dFhAaQpOmEgE+DBe0gRuqSCJrzDHBb0QX08k6AwNXvTd5qH2xjGu5yW/zz57HfmWuh7MFko0xQqS3cweWM//+K3mKJ1QhGr/6lUsupmMbb0YPbayf/t7V5vVp6yGoWsRhPc7wpOWdf5MKc9+JBFeVeBPP6UmJfGzXF8a3LkfC7L8I8w8lvv799R4B2KH+8onRMpZlEdFgWM4x+i/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIXGDR1n; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIXGDR1n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGqV4nGvz3dGr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:28:54 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F36fGj031126;
	Mon, 15 Sep 2025 07:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=WpMqphf5yxD+1kewN
	ndVHiMow19YdwwW3QNqTPR1R3U=; b=oIXGDR1nWSUdtevOnMinFRy2l+8fS4II9
	PXdIZEaHvcNLwB3izva/OKTLZ8HX/v1aqS5cT2+IXjxajLFIuDYok8tq/L/4sboW
	Oge9fUzZK7UOtR2tDWHfamkIP99xzAzC7TSxjYnTpTVxvJpfuJAkZaxsSZ7VRklz
	N0MKMPYtEXXqkXB2sXlcP5eT5KqTv9Vf9w7fyjmDqg6O6uueeCcz+nHkx/pj6huO
	gRFiQ/oNQjGHqCSdylEX58vXeZZWUGqL6Q4+bDriJt9SlXFr5QpTG18ORSvDYC1Y
	fYOa75ddN7BGJfe66sEmWcnJ3coxo45P38m2ewzplkNcTDBeyNGMw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49504b14ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:50 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7SAfc011273;
	Mon, 15 Sep 2025 07:28:50 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49504b14nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F70wJW029817;
	Mon, 15 Sep 2025 07:28:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0ndaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:49 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7SjBP48234970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:28:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D51820049;
	Mon, 15 Sep 2025 07:28:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C55120040;
	Mon, 15 Sep 2025 07:28:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:28:38 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com
Subject: [PATCH V2 6/6] tools/perf: Enable perf script to present the DTL entries
Date: Mon, 15 Sep 2025 12:57:54 +0530
Message-Id: <20250915072754.99850-7-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMCBTYWx0ZWRfX12jSDOkxhSTm
 e8D19JZAgTxBGHTs5LiCLC2Ux5lcxtIbdezHBzI0h2jYOemWvffWgv8mIi+PguSmLs9omebduUO
 gl3GFTyNZZ8SxaAV9cm1vwWmkPxGugay4i+g7Yvf+Pj9uiCKaHhn7c5vix3Qr5RY+BhFAnnKfVd
 2fbq+vD+Nsg8FGnKrn/cxxTegq6At7EPc59yitgWKCmcWOa6XjXb5swzTJHs1IrkwG92QgYuwB6
 Dnc9oe7+/CTqOme/uOdRFSHvljGtP9Kz+QdTd36uV0t1nPlyWM4EQClUzqfdqh+GLiaPNqDL5Qm
 gsn7Av1WBCI3zLvLjuKedAs06ySbiVvEYwndRHG6oNjuHcD0eCRFO7SdfINljleV7fJqxtQm7NU
 Xfimqb64
X-Proofpoint-ORIG-GUID: zWb0kpqJrJ9DzI3CZH-t43MiC5BSPfP1
X-Authority-Analysis: v=2.4 cv=dt/bC0g4 c=1 sm=1 tr=0 ts=68c7c032 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=RdQqpAN3Jds4LtQoOEEA:9
X-Proofpoint-GUID: uWgyVdlHCU-x03RzpwGzR10yI_pnCeND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The process_event() function in "builtin-script.c" invokes
perf_sample__fprintf_synth() for displaying PERF_TYPE_SYNTH
type events.

   if (attr->type == PERF_TYPE_SYNTH && PRINT_FIELD(SYNTH))
   	perf_sample__fprintf_synth(sample, evsel, fp);

perf_sample__fprintf_synth() process the sample depending on the value
in evsel->core.attr.config. Introduce perf_sample__fprintf_synth_vpadtl()
and invoke this for PERF_SYNTH_POWERPC_VPA_DTL

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
Changelog:
Addressed review comments from Adrian
- Removed default callback and used perf_sample__fprintf_synth_vpadtl
- fix build failure when using NO_AUXTRACE=1 by
  adding code around HAVE_AUXTRACE_SUPPORT

 tools/perf/builtin-script.c | 27 +++++++++++++++++++++++++++
 tools/perf/util/event.h     |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index d9fbdcf72f25..8a03fdbfce5e 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -43,6 +43,7 @@
 #include <linux/stringify.h>
 #include <linux/time64.h>
 #include <linux/zalloc.h>
+#include <linux/unaligned.h>
 #include <sys/utsname.h>
 #include "asm/bug.h"
 #include "util/mem-events.h"
@@ -2003,6 +2004,30 @@ static int perf_sample__fprintf_synth_iflag_chg(struct perf_sample *sample, FILE
 	return len + perf_sample__fprintf_pt_spacing(len, fp);
 }
 
+#ifdef HAVE_AUXTRACE_SUPPORT
+static int perf_sample__fprintf_synth_vpadtl(struct perf_sample *data, FILE *fp)
+{
+	struct powerpc_vpadtl_entry *dtl = (struct powerpc_vpadtl_entry *)data->raw_data;
+
+	fprintf(fp, "timebase: %" PRIu64 " dispatch_reason:%s, preempt_reason:%s,\n"
+			"enqueue_to_dispatch_time:%d, ready_to_enqueue_time:%d, waiting_to_ready_time:%d, processor_id: %d",\
+			get_unaligned_be64(&dtl->timebase),
+			dispatch_reasons[dtl->dispatch_reason],
+			preempt_reasons[dtl->preempt_reason],
+			be32_to_cpu(dtl->enqueue_to_dispatch_time),
+			be32_to_cpu(dtl->ready_to_enqueue_time),
+			be32_to_cpu(dtl->waiting_to_ready_time),
+			be16_to_cpu(dtl->processor_id));
+
+	return 1;
+}
+#else
+static int perf_sample__fprintf_synth_vpadtl(struct perf_sample *data __maybe_unused, FILE *fp __maybe_unused)
+{
+	return 0;
+}
+#endif
+
 static int perf_sample__fprintf_synth(struct perf_sample *sample,
 				      struct evsel *evsel, FILE *fp)
 {
@@ -2025,6 +2050,8 @@ static int perf_sample__fprintf_synth(struct perf_sample *sample,
 		return perf_sample__fprintf_synth_evt(sample, fp);
 	case PERF_SYNTH_INTEL_IFLAG_CHG:
 		return perf_sample__fprintf_synth_iflag_chg(sample, fp);
+	case PERF_SYNTH_POWERPC_VPA_DTL:
+		return perf_sample__fprintf_synth_vpadtl(sample, fp);
 	default:
 		break;
 	}
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index 7e0e58979e9c..64c63b59d617 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -271,6 +271,9 @@ struct powerpc_vpadtl_entry {
 	u64     srr1;
 };
 
+extern const char *dispatch_reasons[11];
+extern const char *preempt_reasons[10];
+
 static inline void *perf_synth__raw_data(void *p)
 {
 	return p + 4;
-- 
2.47.1


