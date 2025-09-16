Return-Path: <linuxppc-dev+bounces-12282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F244B58DE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 07:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQr460L0Nz30Pg;
	Tue, 16 Sep 2025 15:26:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758000405;
	cv=none; b=DOxRbpjTtvLW3mO/8SidqxgULbE0Y9hRC+hpavyXbFO4eej3CjwIW6zDQoF3/hD9MxDTKPvXfFF7Z1cufIxjiAgpqHSEC/SQr1v9RH2qemIHapPPi6d3mbKhvpNy9D7WPBtlLYpAZdyPxVBWjep9zFaHYyblu+iIA2mI6r3Uh0r/4Gh6sBRrv+vEbsVnHYEJ4SAZE4QQVJc0b7GwyjJRzg3o3YQYPqPi8SyWcK2rCO2BckR7nfhkN5laygTQ35nTsU8klcMhzBS9lzXGC9XQ/VY4KIOYe64qCg5wttPCsI0FSMu55HYlKzi89cfqp6AGHqEF4bgzp0GTXX78CSyxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758000405; c=relaxed/relaxed;
	bh=oNDWzAoGN3aknNGZc+AtMNM2Qq1csAW2mEdOxnhoT/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PEVgPn3sxOdOjVIzu2gRVDaHJr1ACBdnWyQJDs2JTBvlkWt9JGQ8mSdCv91QNPFKFPWovlHOwIMqliL4wl56qCrIrhheMXSk2V6UIUQ1C6VykOxU8Pcz9+73SNpmUFhR6Qni14Or+cWuRumPx3vVBVAHQGtZPcaDRuBX9AXXnM+c0SLbjReLSBkqe29FbEHl7fmMAlto685suaoWXbx3sxxnJfEjgIqY8gCwdMsEYG5UojK3RuMAFpvVfbt5olkk4E/NtPVvdGxkWczF4usfEYJd2WNVqhyEd6sTV+OKTQbddlaniQKy87iJyVthDMh/dXAoWwpya5xCHa1PGPrGRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rro6Pd4O; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rro6Pd4O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQr451mHtz301G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 15:26:45 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FNQQk7024250;
	Tue, 16 Sep 2025 05:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oNDWzAoGN3aknNGZc
	+AtMNM2Qq1csAW2mEdOxnhoT/Q=; b=rro6Pd4OttWLAh7rtnTdwnoAbs/U2Bkwy
	0eZeRCrHKm9UJBE8ks8pqWpFV5M4gINeBcdLn2rYRyoWEYOJ1cW5S0ZBGvK5olWQ
	A4uKUj0EvMjjih+FO6HRAwUk7ktsreR2GE4tqK3CV0/TDYCs9fmCIY2mItwQf/Aj
	5AN5qTQkJzE69Z36Dr+hYI02Ciz8pdDntqEv6xgBZAuuIYjOqbYiOOMq0uw89Mfb
	MT3HilHJZi0jCyT321UpvJ73jGJXhWMzDkRkHVz4HwSHIbPKnJ6RNRqWxLy3tU6a
	Qrtb9RRXpTfGMf52LAPrIgG4mtbVuqh6Xv002wMmHPTlTuHRIrLEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnq1cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:42 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G5Qfnm029820;
	Tue, 16 Sep 2025 05:26:41 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnq1ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:41 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G4DNMe009382;
	Tue, 16 Sep 2025 05:26:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn39x40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 05:26:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G5QY8f43843890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 05:26:34 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6905F20043;
	Tue, 16 Sep 2025 05:26:34 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 100762004B;
	Tue, 16 Sep 2025 05:26:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.245.152])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Sep 2025 05:26:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 6/6] tools/perf: Enable perf script to present the DTL entries
Date: Tue, 16 Sep 2025 10:55:36 +0530
Message-Id: <20250916052536.93911-7-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: D2Rn6XUTCFWpoh7LTTgaiaeMGcPV9t3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfX7ihAWIU5XCQd
 0s7jfbdYFcKCmDmEWEHg2w5/HXOoH4aIwU1pfjPnO/vACCIILI90VfDoci0a7H1nD31uh2IdO7P
 rDWy9LNjaP0R5PfKfI/p69gHijqX9nhC8JB5TY4Jm2z2KCpJ8+60WdN31JE7yPr+5pdTwO3T/QZ
 +sBWQQESit908thQrQPFe2tyvZwWQI2mR9hirqkCVg4Hg7FiY4YaevcMZtFMJurA2YJkL7JsEIL
 fnsXGB1uwQJG7FAWqxpQAwXIz+Q+0YyMsH18gJ7W6GSqagEGh9llPpr+nGZ0KmN7by7hjBvvr96
 4+ALxpjbJhJb2pxT7tCGsWRlr05b/80AOQMWl+y326dqbNBgoi890sVz+6fS5bmDQRrGUB8fLs1
 +Y3BIvR8
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c8f512 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=RdQqpAN3Jds4LtQoOEEA:9
X-Proofpoint-GUID: uL5RWd_RnCEsDE6acTn0fRdT7exBNTTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
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

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
v3:
Addressed review comments from Adrian
- Remove unnecessary line continuation and line length
- Return number of chars printed for perf_sample__fprintf_synth_vpadtl

- Added Tested by from Venkat

v2:
Addressed review comments from Adrian
- Removed default callback and used perf_sample__fprintf_synth_vpadtl
- fix build failure when using NO_AUXTRACE=1 by
  adding code around HAVE_AUXTRACE_SUPPORT

 tools/perf/builtin-script.c | 30 ++++++++++++++++++++++++++++++
 tools/perf/util/event.h     |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index d9fbdcf72f25..bda5e4914ee7 100644
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
@@ -2003,6 +2004,33 @@ static int perf_sample__fprintf_synth_iflag_chg(struct perf_sample *sample, FILE
 	return len + perf_sample__fprintf_pt_spacing(len, fp);
 }
 
+#ifdef HAVE_AUXTRACE_SUPPORT
+static int perf_sample__fprintf_synth_vpadtl(struct perf_sample *data, FILE *fp)
+{
+	struct powerpc_vpadtl_entry *dtl = (struct powerpc_vpadtl_entry *)data->raw_data;
+	int len;
+
+	len = fprintf(fp, "timebase: %" PRIu64 " dispatch_reason:%s, preempt_reason:%s,\n"
+			"enqueue_to_dispatch_time:%d, ready_to_enqueue_time:%d,"
+			"waiting_to_ready_time:%d, processor_id: %d",
+			get_unaligned_be64(&dtl->timebase),
+			dispatch_reasons[dtl->dispatch_reason],
+			preempt_reasons[dtl->preempt_reason],
+			be32_to_cpu(dtl->enqueue_to_dispatch_time),
+			be32_to_cpu(dtl->ready_to_enqueue_time),
+			be32_to_cpu(dtl->waiting_to_ready_time),
+			be16_to_cpu(dtl->processor_id));
+
+	return len;
+}
+#else
+static int perf_sample__fprintf_synth_vpadtl(struct perf_sample *data __maybe_unused,
+		FILE *fp __maybe_unused)
+{
+	return 0;
+}
+#endif
+
 static int perf_sample__fprintf_synth(struct perf_sample *sample,
 				      struct evsel *evsel, FILE *fp)
 {
@@ -2025,6 +2053,8 @@ static int perf_sample__fprintf_synth(struct perf_sample *sample,
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


