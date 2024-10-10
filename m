Return-Path: <linuxppc-dev+bounces-2083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6957C9998E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 03:15:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPpbD2mZfz3btn;
	Fri, 11 Oct 2024 12:15:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728571889;
	cv=none; b=Mb3jmXBDn9EmGa1HOCMkaq9PrU7gnZMNo3Po84oq6cDxs09SVuOkrMetDiSFbd9AETXKLKMg9Ddhi9EM1FDtiXT7MhEfe4kTo0zMWVS8kEfi3MO8zGT8/+jxpNoPXxhCtX1ZmgeyAuZlx0l41bEUr7yYNl789K0enb4YrNiAKndvv5ajzy7/9dhzl92aXMDSufGwQ6WT4YhnFXvL0x+zDdnCFbOGaDFJGlSNf26fQT2kh1ImppEN/Ks1JmqAov7Po1jF6dspJAIhv4APKi9YtVp/W9VmXoEEiZuUx8g/uY1yTFoYNqKau5bi3FaF9eafAjKi0QMw8j+JsdY+eIbsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728571889; c=relaxed/relaxed;
	bh=ELhIwBss1wUBoSEOh3sKkWbymWoHN1i/6eY1qAowKSg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RG2lNgeM/sF4e79TarGrgtpwgIrdi+FkztbXLiSNcUTLQQDy5cQd4W6Ocft3An/rQOyJbjKw57UWj4ULTsAvhy5f+hcI9K4EI30EatHOUqWeBI78WDW5tS9jbBOZ9CWqEAN6ws/a/1RdTE7BJ88APgrlXZ0Uoe+MqUt6GC1q8DavqOAPcZxbqHzUpu8FZwO/i361cW8SF1+KvtWNYyb8fbwcv2UoAz1WWbe8Q2ZbZlm9i9xca/zW4vgbJCpYht6J3bMhLfpz/zhP9GWMhRoTHJUPuFh+Nx2e+UIa/yf8GdqRqa1wgCFCSd1VhQPP79h2jen/l1E8S2ZaDgQaBH53dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MwJALxor; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MwJALxor;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPXl42B1rz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 01:51:27 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AEikqJ010966;
	Thu, 10 Oct 2024 14:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=ELhIwBss1wUBoSEOh3sKkWbymW
	oHN1i/6eY1qAowKSg=; b=MwJALxordiT5omSw+o0uA/vrX/yknrTSVkLYuyUaz2
	h0+8Jm3wUbjjXRcfg7PhbGYmaXcYWSd1N1cXCBdfpgrUb1vDrB8KlE6aV+8mqR+D
	kbWAi7N3HgA8xO0AmTVxOs/QCfGvR+9zhFIwsL7a3lentm2cvyiDQB7dOTtly1dL
	GFRbCfaQhQy3V0zz2h91bt6TDct39w4+YdBGCP7+e6vdvMjQ/hPTUJyp5uLGaHik
	Km6lMPCKb+jJDAsKisIfOBFP/Krgc5RfqphkC2IWw2/GKn0hi6QMzru0GaE8/74N
	JMUVfynEYbf3BL6TmjT/wDvODEWYBMEpqDptCbxwsc9w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426gy1g12t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:51:23 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49AEpNjx027510;
	Thu, 10 Oct 2024 14:51:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426gy1g12p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:51:22 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49ACsM0K030153;
	Thu, 10 Oct 2024 14:51:21 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423gsn0bbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:51:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49AEpHDA53936564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 14:51:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EBA920040;
	Thu, 10 Oct 2024 14:51:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD4C620043;
	Thu, 10 Oct 2024 14:51:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.254.159])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Oct 2024 14:51:11 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, hbathini@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 1/2] tools/perf/pmu-events/powerpc: Add support for compat events in json
Date: Thu, 10 Oct 2024 20:21:06 +0530
Message-Id: <20241010145107.51211-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DOCve6Yox7apoo2IfhNh2E5Wi2M9yqkL
X-Proofpoint-ORIG-GUID: xzFukiCvxNbC5U7DzH4RJVd-gz17Bkz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_11,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100097
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

perf list picks the events supported for specific platform
from pmu-events/arch/powerpc/<platform>. Example power10 events
are in pmu-events/arch/powerpc/power10, power9 events are part
of pmu-events/arch/powerpc/power9. The decision of which
platform to pick is determined based on PVR value in powerpc.
The PVR value is matched from pmu-events/arch/powerpc/mapfile.csv

Example:

Format:
        PVR,Version,JSON/file/pathname,Type

0x004[bcd][[:xdigit:]]{4},1,power8,core
0x0066[[:xdigit:]]{4},1,power8,core
0x004e[[:xdigit:]]{4},1,power9,core
0x0080[[:xdigit:]]{4},1,power10,core
0x0082[[:xdigit:]]{4},1,power10,core

The code gets the PVR from system using get_cpuid_str function
in arch/powerpc/util/headers.c ( from SPRN_PVR ) and compares
with value from mapfile.csv

In case of compat mode, say when partition is booted in a power9
mode when the system is a power10, add an entry to pick the
ISA architected events from "pmu-events/arch/powerpc/compat".
Add json file generic-events.json which will contain these
events which is supported in compat mode.

Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---

 .../arch/powerpc/compat/generic-events.json   | 117 ++++++++++++++++++
 .../perf/pmu-events/arch/powerpc/mapfile.csv  |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/powerpc/compat/generic-events.json

diff --git a/tools/perf/pmu-events/arch/powerpc/compat/generic-events.json b/tools/perf/pmu-events/arch/powerpc/compat/generic-events.json
new file mode 100644
index 000000000000..6f5e8efcb098
--- /dev/null
+++ b/tools/perf/pmu-events/arch/powerpc/compat/generic-events.json
@@ -0,0 +1,117 @@
+[
+  {
+    "EventCode": "0x600F4",
+    "EventName": "PM_CYC",
+    "BriefDescription": "Processor cycles."
+  },
+  {
+    "EventCode": "0x100F2",
+    "EventName": "PM_CYC_INST_CMPL",
+    "BriefDescription": "1 or more ppc insts finished"
+  },
+  {
+    "EventCode": "0x100f4",
+    "EventName": "PM_FLOP_CMPL",
+    "BriefDescription": "Floating Point Operations Finished."
+  },
+  {
+    "EventCode": "0x100F6",
+    "EventName": "PM_L1_ITLB_MISS",
+    "BriefDescription": "Number of I-ERAT reloads."
+  },
+  {
+    "EventCode": "0x100F8",
+    "EventName": "PM_NO_INST_AVAIL",
+    "BriefDescription": "Number of cycles the ICT has no itags assigned to this thread."
+  },
+  {
+    "EventCode": "0x100fc",
+    "EventName": "PM_LD_CMPL",
+    "BriefDescription": "Load instruction completed."
+  },
+  {
+    "EventCode": "0x200F0",
+    "EventName": "PM_ST_CMPL",
+    "BriefDescription": "Stores completed from S2Q (2nd-level store queue)."
+  },
+  {
+    "EventCode": "0x200F2",
+    "EventName": "PM_INST_DISP",
+    "BriefDescription": "PowerPC instruction dispatched."
+  },
+  {
+    "EventCode": "0x200F4",
+    "EventName": "PM_RUN_CYC",
+    "BriefDescription": "Processor cycles gated by the run latch."
+  },
+  {
+    "EventCode": "0x200F6",
+    "EventName": "PM_L1_DTLB_RELOAD",
+    "BriefDescription": "DERAT Reloaded due to a DERAT miss."
+  },
+  {
+    "EventCode": "0x200FA",
+    "EventName": "PM_BR_TAKEN_CMPL",
+    "BriefDescription": "Branch Taken instruction completed."
+  },
+  {
+    "EventCode": "0x200FC",
+    "EventName": "PM_L1_ICACHE_MISS",
+    "BriefDescription": "Demand instruction cache miss."
+  },
+  {
+    "EventCode": "0x200FE",
+    "EventName": "PM_L1_RELOAD_FROM_MEM",
+    "BriefDescription": "L1 Dcache reload from memory"
+  },
+  {
+    "EventCode": "0x300F0",
+    "EventName": "PM_ST_MISS_L1",
+    "BriefDescription": "Store Missed L1"
+  },
+  {
+    "EventCode": "0x300FC",
+    "EventName": "PM_DTLB_MISS",
+    "BriefDescription": "Data PTEG reload"
+  },
+  {
+    "EventCode": "0x300FE",
+    "EventName": "PM_DATA_FROM_L3MISS",
+    "BriefDescription": "Demand LD - L3 Miss (not L2 hit and not L3 hit)"
+  },
+  {
+    "EventCode": "0x400F0",
+    "EventName": "PM_LD_MISS_L1",
+    "BriefDescription": "L1 Dcache load miss"
+  },
+  {
+    "EventCode": "0x400F2",
+    "EventName": "PM_CYC_INST_DISP",
+    "BriefDescription": "Cycle when instruction(s) dispatched."
+  },
+  {
+    "EventCode": "0x400F6",
+    "EventName": "PM_BR_MPRED_CMPL",
+    "BriefDescription": "A mispredicted branch completed. Includes direction and target."
+  },
+  {
+    "EventCode": "0x400FA",
+    "EventName": "PM_RUN_INST_CMPL",
+    "BriefDescription": "PowerPC instruction completed while the run latch is set."
+  },
+  {
+    "EventCode": "0x400FC",
+    "EventName": "PM_ITLB_MISS",
+    "BriefDescription": "Instruction TLB reload (after a miss), all page sizes. Includes only demand misses."
+  },
+  {
+    "EventCode": "0x400fe",
+    "EventName": "PM_LD_NOT_CACHED",
+    "BriefDescription": "Load data not cached."
+  },
+  {
+    "EventCode": "0x500fa",
+    "EventName": "PM_INST_CMPL",
+    "BriefDescription": "Instructions."
+  }
+]
diff --git a/tools/perf/pmu-events/arch/powerpc/mapfile.csv b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
index 4d5e9138d4cc..cbd3cb443784 100644
--- a/tools/perf/pmu-events/arch/powerpc/mapfile.csv
+++ b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
@@ -16,3 +16,4 @@
 0x004e[[:xdigit:]]{4},1,power9,core
 0x0080[[:xdigit:]]{4},1,power10,core
 0x0082[[:xdigit:]]{4},1,power10,core
+0x00ffffff,1,compat,core
-- 
2.27.0


