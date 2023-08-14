Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DDD77B797
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 13:30:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jSpivltG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPXJ55H5yz3cT2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 21:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jSpivltG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPXGF692Zz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 21:28:37 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EBL8aX012280;
	Mon, 14 Aug 2023 11:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xgwqiDZp2DvI0lMdP2JgEOU6FwOA12CZ/1giC5ldBtY=;
 b=jSpivltGEbbChuFdqGD/AdgA+w228zpmf1x0YaMioS4wGGsyeaaDLUubNbTIPMA7QTF0
 itommKSqZZRn/iMHoAaZpUcocq9IzWdDIDVVNTcR/Xv+Bhwzm8V7QTZzzkKOC7ZxH6DB
 sm0gStlLXeoQSqfeCkHn5lCdB96YAil4FaYbRnbyGS64dcHkGwSsnijFnYJ/wYhuVzJ9
 xjyaJc3k7QABbNvi562DEO/LA/41k5O6jF8jUUtog5HYRScWRRG6Dh9iEoFpPP6XpeZ4
 aeu4lwL812tFcHEIcT7GWqejDoNBbrXLiFNMWWW9C7TqXNLEdu1uhDNlbkR01Mq3hVp5 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfkak04uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:33 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EBPIaX023660;
	Mon, 14 Aug 2023 11:28:32 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfkak04u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:32 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37EAtu8f007839;
	Mon, 14 Aug 2023 11:28:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3senwjukdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:31 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EBSR6q23921330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 11:28:27 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C342D20043;
	Mon, 14 Aug 2023 11:28:27 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCF1420040;
	Mon, 14 Aug 2023 11:28:24 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.123.95])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Aug 2023 11:28:24 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 2/7] perf vendor events: Drop some of the JSON/events for power10 platform
Date: Mon, 14 Aug 2023 16:57:58 +0530
Message-Id: <20230814112803.1508296-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230814112803.1508296-1-kjain@linux.ibm.com>
References: <20230814112803.1508296-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pwPqrscDGbNmCnx9KSfDN2xoBBYoVTjh
X-Proofpoint-GUID: QKiSdXai7Wkv-fnG9siF9_XYlEk7ohCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_06,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140102
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
Cc: irogers@google.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop some of the JSON/events for power10 platform due to counter
data mismatch.

Fixes: 32daa5d7899e ("perf vendor events: Initial JSON/events list for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/floating_point.json           |  7 -------
 tools/perf/pmu-events/arch/powerpc/power10/marked.json | 10 ----------
 tools/perf/pmu-events/arch/powerpc/power10/others.json |  5 -----
 .../perf/pmu-events/arch/powerpc/power10/pipeline.json | 10 ----------
 .../pmu-events/arch/powerpc/power10/translation.json   |  5 -----
 5 files changed, 37 deletions(-)
 delete mode 100644 tools/perf/pmu-events/arch/powerpc/power10/floating_point.json

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json b/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
deleted file mode 100644
index 54acb55e2c8c..000000000000
--- a/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
+++ /dev/null
@@ -1,7 +0,0 @@
-[
-  {
-    "EventCode": "0x4016E",
-    "EventName": "PM_THRESH_NOT_MET",
-    "BriefDescription": "Threshold counter did not meet threshold."
-  }
-]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/marked.json b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
index 131f8d0e8831..f2436fc5537c 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/marked.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
@@ -19,11 +19,6 @@
     "EventName": "PM_MRK_BR_TAKEN_CMPL",
     "BriefDescription": "Marked Branch Taken instruction completed."
   },
-  {
-    "EventCode": "0x20112",
-    "EventName": "PM_MRK_NTF_FIN",
-    "BriefDescription": "The marked instruction became the oldest in the pipeline before it finished. It excludes instructions that finish at dispatch."
-  },
   {
     "EventCode": "0x2C01C",
     "EventName": "PM_EXEC_STALL_DMISS_OFF_CHIP",
@@ -64,11 +59,6 @@
     "EventName": "PM_L1_ICACHE_MISS",
     "BriefDescription": "Demand instruction cache miss."
   },
-  {
-    "EventCode": "0x30130",
-    "EventName": "PM_MRK_INST_FIN",
-    "BriefDescription": "marked instruction finished. Excludes instructions that finish at dispatch. Note that stores always finish twice since the address gets issued to the LSU and the data gets issued to the VSU."
-  },
   {
     "EventCode": "0x34146",
     "EventName": "PM_MRK_LD_CMPL",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
index a5319cdba89b..17c5424ef1ac 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
@@ -29,11 +29,6 @@
     "EventName": "PM_DISP_SS0_2_INSTR_CYC",
     "BriefDescription": "Cycles in which Superslice 0 dispatches either 1 or 2 instructions."
   },
-  {
-    "EventCode": "0x1F15C",
-    "EventName": "PM_MRK_STCX_L2_CYC",
-    "BriefDescription": "Cycles spent in the nest portion of a marked Stcx instruction. It starts counting when the operation starts to drain to the L2 and it stops counting when the instruction retires from the Instruction Completion Table (ICT) in the Instruction Sequencing Unit (ISU)."
-  },
   {
     "EventCode": "0x10066",
     "EventName": "PM_ADJUNCT_CYC",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
index 449f57e8ba6a..799893c56f32 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
@@ -194,11 +194,6 @@
     "EventName": "PM_TLBIE_FIN",
     "BriefDescription": "TLBIE instruction finished in the LSU. Two TLBIEs can finish each cycle. All will be counted."
   },
-  {
-    "EventCode": "0x3D058",
-    "EventName": "PM_SCALAR_FSQRT_FDIV_ISSUE",
-    "BriefDescription": "Scalar versions of four floating point operations: fdiv,fsqrt (xvdivdp, xvdivsp, xvsqrtdp, xvsqrtsp)."
-  },
   {
     "EventCode": "0x30066",
     "EventName": "PM_LSU_FIN",
@@ -269,11 +264,6 @@
     "EventName": "PM_IC_MISS_CMPL",
     "BriefDescription": "Non-speculative instruction cache miss, counted at completion."
   },
-  {
-    "EventCode": "0x4D050",
-    "EventName": "PM_VSU_NON_FLOP_CMPL",
-    "BriefDescription": "Non-floating point VSU instructions completed."
-  },
   {
     "EventCode": "0x4D052",
     "EventName": "PM_2FLOP_CMPL",
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/translation.json b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
index 3e47b804a0a8..961e2491e73f 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/translation.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
@@ -4,11 +4,6 @@
     "EventName": "PM_MRK_START_PROBE_NOP_CMPL",
     "BriefDescription": "Marked Start probe nop (AND R0,R0,R0) completed."
   },
-  {
-    "EventCode": "0x20016",
-    "EventName": "PM_ST_FIN",
-    "BriefDescription": "Store finish count. Includes speculative activity."
-  },
   {
     "EventCode": "0x20018",
     "EventName": "PM_ST_FWD",
-- 
2.39.3

