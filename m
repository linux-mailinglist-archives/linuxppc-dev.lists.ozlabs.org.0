Return-Path: <linuxppc-dev+bounces-2081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E959998E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 03:15:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPpZd2BYqz3bmH;
	Fri, 11 Oct 2024 12:15:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728570659;
	cv=none; b=bBLb9Vj3VFyHpCcJmrhUDGlwh/fCkrGYBtHV/TPeUVEuvyV8ykYoCpOtI1UELatR8FTcglBWKE7ZYncbXXLUHH7m/uW6YX8JESC2RPRm44CEcLQJpHeV8f+QkVIdY5tZzQbnZOSGwSeBrm7c9bmr/MutPXM7pUnJxL9oTcGlyCIkJ9dvrThNuhA7YG+nFdX4s5j1uac+CA+q48A327UFb3vGYmNcrx0SzJiXrmU9t4X0C5wnJi0xaaT+rxeW9tochcbN58TDFxeL+1mjcycN/kzpJ33mz12QfNssvzcOhsBkuuZbtYncRDveFbyYyWrNX2xq6kcpF2igXaEFq7TopA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728570659; c=relaxed/relaxed;
	bh=ELhIwBss1wUBoSEOh3sKkWbymWoHN1i/6eY1qAowKSg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VHsbIMUUt4LmY3dwkn0V8aSC5Hk4I7P8kxsrzhWpoAz/ceinDwK0BLIklEEGejpYBWe0HiLIkmzx3jyu6aWbhBZRE3fGMchWAof8K+4ZPKzIDsfEK17/y17yDafGWlDOamDI31gvmFQWGwKkDj9iFiS3EQz0x2i6LYwqSyJs7eQhVbzzqjagFgHXPESsS4Zn8PtRkV6i8qYe6Kwgfwxe42/TW7BJf2W19etE4iyXfvYESmsFEvFY1kXEnzxcbcqNESfDZXSFqBg+ymwjnKetNMgGapgjsbwbYCS9ptH1genOzn0ysxoscWeEhEcd27iKPOkcBkoTzs0bQUNrWajnbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OxX1nUxN; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OxX1nUxN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPXHQ2vLGz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 01:30:58 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AEQQfD014407;
	Thu, 10 Oct 2024 14:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=ELhIwBss1wUBoSEOh3sKkWbymW
	oHN1i/6eY1qAowKSg=; b=OxX1nUxNLdtvv2vkN7/NbKBDUIyzulOURE1SipME9/
	9UTkNb/1cGBALM6ail7YnpcbJw+vbW+QuhQC6ZeFS/6VVkapl4ndDoShoUAl5vVY
	gsmFyQGhs3Nu6QCSjViMLU2LwzdBWalxF/9VmMlEq1b/9fkkKwY+H2CtnZWPEywh
	dmcTLrJju03EE37EcmZN6NGt2Tzh6TUxwUjpMp3atvt6AsnAravQhC3ErQ19h6db
	5L7CeW8evD/EuvBmw5NmFQhjzUq8nh0Qk0ZWkVnf5s/EEW31DLCwS7pyD0IAG6do
	64N7kBO/Wcg02NEq9GLX7MAzMYVFLulZlVVT58lWPvLg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426gpf00qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:30:53 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49AEU4dk023356;
	Thu, 10 Oct 2024 14:30:52 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426gpf00qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:30:52 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49AC9Pc9013804;
	Thu, 10 Oct 2024 14:30:51 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 423fssge47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:30:51 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49AEUmVN53477776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 14:30:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ACF520040;
	Thu, 10 Oct 2024 14:30:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4607820043;
	Thu, 10 Oct 2024 14:30:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.254.159])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Oct 2024 14:30:41 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, hbathini@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH 1/2] tools/perf/pmu-events/powerpc: Add support for compat events in json
Date: Thu, 10 Oct 2024 20:00:34 +0530
Message-Id: <20241010143035.50907-1-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-GUID: fVsIo_IFsl_r7dxGYJcjjOsea1lzl9nU
X-Proofpoint-ORIG-GUID: DMoAqsDtwJaETUKFknCbg2jmFuUYJkUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_11,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100096
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


