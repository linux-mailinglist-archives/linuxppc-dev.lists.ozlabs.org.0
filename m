Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A307D447A4B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 07:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HngTk4Byyz2yxm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 17:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fam4S2/L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fam4S2/L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HngSx2SSYz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 17:00:32 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A84hj1x030358; 
 Mon, 8 Nov 2021 06:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=WgBxuyY3iqqn3IWDoqjLLiItYxPhjHkLpykcDOKKJ3Y=;
 b=Fam4S2/LHb/DpQljPHN8TQo2ZYDlznhfSAHW5VNgnhCMY3yNwj26ZnaephrvZFoNCd7g
 XSOHxb+OTyJpayelCvHTPzK/TUOZ56KCdkQJh7JsxakkOqjVRClaqFlj1lIOXkS9r/gE
 FLwMeEoWdagMSJUXmhTXLcyhaXWLfVtKhZSlzQ7iO1zP/0sO0wAo935Rk8eBq3vRcQLE
 pg9Rv3B0U/qVVL2Ix6g5BK2Zz8aH2rUPCfyasZKTkZ+aqLisaAIXpKe/zM4RVG9eQYPG
 dCxksRkLo/rXHIY3NhscKqWeZbXkCi53dvuzq6WBH5kk+LjSbE8xboDlnwNH0fxTOIhC 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6jpp3e5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 06:00:28 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A85w7D9019718;
 Mon, 8 Nov 2021 06:00:28 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6jpp3e3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 06:00:27 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A85vQf6017064;
 Mon, 8 Nov 2021 06:00:25 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3c5hb911ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 06:00:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A860L6t62128410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 06:00:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 426C7A406D;
 Mon,  8 Nov 2021 06:00:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49B18A404D;
 Mon,  8 Nov 2021 06:00:17 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.5.217]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 06:00:17 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH v3] perf vendor events power10: Add metric events json file
 for power10 platform
Date: Mon,  8 Nov 2021 11:30:10 +0530
Message-Id: <20211108060010.177517-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Dy93faZQdfmO5BUh0dVWoP68n-So5SJU
X-Proofpoint-ORIG-GUID: Z0Frzl7c4eZ652jvgt-tqlePNEVegaNv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111080037
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
Cc: atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, pc@us.ibm.com,
 kjain@linux.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add pmu metric json file for power10 platform.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
Changelog
v2 -> v3:
- Did nit changes in BriefDescription as suggested
  by Paul A. Clarke and Michael Ellermen

- Link tot the v2 patch: https://lkml.org/lkml/2021/10/22/48

v1 -> v2:
- Did some nit changes in BriefDescription field
  as suggested by Paul A. Clarke

- Link to the v1 patch: https://lkml.org/lkml/2021/10/6/131

 .../arch/powerpc/power10/metrics.json         | 676 ++++++++++++++++++
 1 file changed, 676 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/metrics.json

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
new file mode 100644
index 000000000000..8adab5cd9934
--- /dev/null
+++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
@@ -0,0 +1,676 @@
+[
+    {
+        "BriefDescription": "Percentage of cycles that are run cycles",
+        "MetricExpr": "PM_RUN_CYC / PM_CYC * 100",
+        "MetricGroup": "General",
+        "MetricName": "RUN_CYCLES_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction",
+        "MetricExpr": "PM_CYC / PM_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "CYCLES_PER_INSTRUCTION"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled for any reason",
+        "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because there was a flush",
+        "MetricExpr": "PM_DISP_STALL_FLUSH / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_FLUSH_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because the MMU was handling a translation miss",
+        "MetricExpr": "PM_DISP_STALL_TRANSLATION / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_TRANSLATION_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled waiting to resolve an instruction ERAT miss",
+        "MetricExpr": "PM_DISP_STALL_IERAT_ONLY_MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_IERAT_ONLY_MISS_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled waiting to resolve an instruction TLB miss",
+        "MetricExpr": "PM_DISP_STALL_ITLB_MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_ITLB_MISS_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to an icache miss",
+        "MetricExpr": "PM_DISP_STALL_IC_MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_IC_MISS_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from the local L2",
+        "MetricExpr": "PM_DISP_STALL_IC_L2 / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_IC_L2_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from the local L3",
+        "MetricExpr": "PM_DISP_STALL_IC_L3 / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_IC_L3_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from any source beyond the local L3",
+        "MetricExpr": "PM_DISP_STALL_IC_L3MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_IC_L3MISS_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to an icache miss after a branch mispredict",
+        "MetricExpr": "PM_DISP_STALL_BR_MPRED_ICMISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_BR_MPRED_ICMISS_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from the local L2 after suffering a branch mispredict",
+        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L2 / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_BR_MPRED_IC_L2_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from the local L3 after suffering a branch mispredict",
+        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3 / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_BR_MPRED_IC_L3_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from any source beyond the local L3 after suffering a branch mispredict",
+        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_BR_MPRED_IC_L3MISS_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to a branch mispredict",
+        "MetricExpr": "PM_DISP_STALL_BR_MPRED / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_BR_MPRED_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch for any reason",
+        "MetricExpr": "PM_DISP_STALL_HELD_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_HELD_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch",
+        "MetricExpr": "PM_DISP_STALL_HELD_SYNC_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISP_HELD_STALL_SYNC_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch while waiting on the scoreboard",
+        "MetricExpr": "PM_DISP_STALL_HELD_SCOREBOARD_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISP_HELD_STALL_SCOREBOARD_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch due to issue queue full",
+        "MetricExpr": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISP_HELD_STALL_ISSQ_FULL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the mapper/SRB was full",
+        "MetricExpr": "PM_DISP_STALL_HELD_RENAME_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_HELD_RENAME_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the STF mapper/SRB was full",
+        "MetricExpr": "PM_DISP_STALL_HELD_STF_MAPPER_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_HELD_STF_MAPPER_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the XVFC mapper/SRB was full",
+        "MetricExpr": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_HELD_XVFC_MAPPER_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch for any other reason",
+        "MetricExpr": "PM_DISP_STALL_HELD_OTHER_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_HELD_OTHER_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction has been dispatched but not issued for any reason",
+        "MetricExpr": "PM_ISSUE_STALL / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "ISSUE_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting to be finished in one of the execution units",
+        "MetricExpr": "PM_EXEC_STALL / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "EXECUTION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction spent executing an NTC instruction that gets flushed some time after dispatch",
+        "MetricExpr": "PM_EXEC_STALL_NTC_FLUSH / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "NTC_FLUSH_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTF instruction finishes at dispatch",
+        "MetricExpr": "PM_EXEC_STALL_FIN_AT_DISP / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "FIN_AT_DISP_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is executing in the branch unit",
+        "MetricExpr": "PM_EXEC_STALL_BRU / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "BRU_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a simple fixed point instruction that is executing in the LSU",
+        "MetricExpr": "PM_EXEC_STALL_SIMPLE_FX / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "SIMPLE_FX_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is executing in the VSU",
+        "MetricExpr": "PM_EXEC_STALL_VSU / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "VSU_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting to be finished in one of the execution units",
+        "MetricExpr": "PM_EXEC_STALL_TRANSLATION / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "TRANSLATION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a load or store that suffered a translation miss",
+        "MetricExpr": "PM_EXEC_STALL_DERAT_ONLY_MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DERAT_ONLY_MISS_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is recovering from a TLB miss",
+        "MetricExpr": "PM_EXEC_STALL_DERAT_DTLB_MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DERAT_DTLB_MISS_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is executing in the LSU",
+        "MetricExpr": "PM_EXEC_STALL_LSU / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "LSU_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a load that is executing in the LSU",
+        "MetricExpr": "PM_EXEC_STALL_LOAD / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "LOAD_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3",
+        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3 / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DMISS_L2L3_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3, with an RC dispatch conflict",
+        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3_CONFLICT / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DMISS_L2L3_CONFLICT_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3, without an RC dispatch conflict",
+        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3_NOCONFLICT / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DMISS_L2L3_NOCONFLICT_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting for a load miss to resolve from a source beyond the local L2 and local L3",
+        "MetricExpr": "PM_EXEC_STALL_DMISS_L3MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DMISS_L3MISS_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting for a load miss to resolve from a neighbor chiplet's L2 or L3 in the same chip",
+        "MetricExpr": "PM_EXEC_STALL_DMISS_L21_L31 / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DMISS_L21_L31_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting for a load miss to resolve from L4, local memory or OpenCAPI chip",
+        "MetricExpr": "PM_EXEC_STALL_DMISS_LMEM / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DMISS_LMEM_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting for a load miss to resolve from a remote chip (cache, L4, memory or OpenCAPI) in the same group",
+        "MetricExpr": "PM_EXEC_STALL_DMISS_OFF_CHIP / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DMISS_OFF_CHIP_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting for a load miss to resolve from a distant chip (cache, L4, memory or OpenCAPI chip)",
+        "MetricExpr": "PM_EXEC_STALL_DMISS_OFF_NODE / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DMISS_OFF_NODE_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is executing a TLBIEL instruction",
+        "MetricExpr": "PM_EXEC_STALL_TLBIEL / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "TLBIEL_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is finishing a load after its data has been reloaded from a data source beyond the local L1, OR when the LSU is processing an L1-hit, OR when the NTF instruction merged with another load in the LMQ",
+        "MetricExpr": "PM_EXEC_STALL_LOAD_FINISH / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "LOAD_FINISH_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a store that is executing in the LSU",
+        "MetricExpr": "PM_EXEC_STALL_STORE / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "STORE_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is in the store unit outside of handling store misses or other special store operations",
+        "MetricExpr": "PM_EXEC_STALL_STORE_PIPE / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "STORE_PIPE_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a store whose cache line was not resident in the L1 and had to wait for allocation of the missing line into the L1",
+        "MetricExpr": "PM_EXEC_STALL_STORE_MISS / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "STORE_MISS_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a TLBIE instruction waiting for a response from the L2",
+        "MetricExpr": "PM_EXEC_STALL_TLBIE / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "TLBIE_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is executing a PTESYNC instruction",
+        "MetricExpr": "PM_EXEC_STALL_PTESYNC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "PTESYNC_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction cannot complete because the thread was blocked",
+        "MetricExpr": "PM_CMPL_STALL / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "COMPLETION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction cannot complete because it was interrupted by ANY exception",
+        "MetricExpr": "PM_CMPL_STALL_EXCEPTION / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "EXCEPTION_COMPLETION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is stuck at finish waiting for the non-speculative finish of either a STCX instruction waiting for its result or a load waiting for non-critical sectors of data and ECC",
+        "MetricExpr": "PM_CMPL_STALL_MEM_ECC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "MEM_ECC_COMPLETION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a STCX instruction waiting for resolution from the nest",
+        "MetricExpr": "PM_CMPL_STALL_STCX / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "STCX_COMPLETION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a LWSYNC instruction waiting to complete",
+        "MetricExpr": "PM_CMPL_STALL_LWSYNC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "LWSYNC_COMPLETION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction is a HWSYNC instruction stuck at finish waiting for a response from the L2",
+        "MetricExpr": "PM_CMPL_STALL_HWSYNC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "HWSYNC_COMPLETION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction required special handling before completion",
+        "MetricExpr": "PM_CMPL_STALL_SPECIAL / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "SPECIAL_COMPLETION_STALL_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because fetch was being held, so there was nothing in the pipeline for this thread",
+        "MetricExpr": "PM_DISP_STALL_FETCH / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_FETCH_CPI"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because of power management",
+        "MetricExpr": "PM_DISP_STALL_HELD_HALT_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "CPI",
+        "MetricName": "DISPATCHED_HELD_HALT_CPI"
+    },
+    {
+        "BriefDescription": "Percentage of flushes per completed instruction",
+        "MetricExpr": "PM_FLUSH / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Others",
+        "MetricName": "FLUSH_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of flushes due to a branch mispredict per completed instruction",
+        "MetricExpr": "PM_FLUSH_MPRED / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Others",
+        "MetricName": "BR_MPRED_FLUSH_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of branch mispredictions per completed instruction",
+        "MetricExpr": "PM_BR_MPRED_CMPL / PM_RUN_INST_CMPL",
+        "MetricGroup": "Others",
+        "MetricName": "BRANCH_MISPREDICTION_RATE"
+    },
+    {
+        "BriefDescription": "Percentage of finished loads that missed in the L1",
+        "MetricExpr": "PM_LD_MISS_L1 / PM_LD_REF_L1 * 100",
+        "MetricGroup": "Others",
+        "MetricName": "L1_LD_MISS_RATIO",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of completed instructions that were loads that missed the L1",
+        "MetricExpr": "PM_LD_MISS_L1 / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Others",
+        "MetricName": "L1_LD_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of completed instructions when the DPTEG required for the load/store instruction in execution was missing from the TLB",
+        "MetricExpr": "PM_DTLB_MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Others",
+        "MetricName": "DTLB_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Average number of completed instructions dispatched per instruction completed",
+        "MetricExpr": "PM_INST_DISP / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "DISPATCH_PER_INST_CMPL"
+    },
+    {
+        "BriefDescription": "Percentage of completed instructions that were a demand load that did not hit in the L1 or L2",
+        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "General",
+        "MetricName": "L2_LD_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of completed instructions that were demand fetches that missed the L1 icache",
+        "MetricExpr": "PM_L1_ICACHE_MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "L1_INST_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of completed instructions that were demand fetches that reloaded from beyond the L3 icache",
+        "MetricExpr": "PM_INST_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "General",
+        "MetricName": "L3_INST_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Average number of completed instructions per cycle",
+        "MetricExpr": "PM_INST_CMPL / PM_CYC",
+        "MetricGroup": "General",
+        "MetricName": "IPC"
+    },
+    {
+        "BriefDescription": "Average number of cycles per completed instruction group",
+        "MetricExpr": "PM_CYC / PM_1PLUS_PPC_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "CYCLES_PER_COMPLETED_INSTRUCTIONS_SET"
+    },
+    {
+        "BriefDescription": "Percentage of cycles when at least 1 instruction dispatched",
+        "MetricExpr": "PM_1PLUS_PPC_DISP / PM_RUN_CYC * 100",
+        "MetricGroup": "General",
+        "MetricName": "CYCLES_ATLEAST_ONE_INST_DISPATCHED",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Average number of finished loads per completed instruction",
+        "MetricExpr": "PM_LD_REF_L1 / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "LOADS_PER_INST"
+    },
+    {
+        "BriefDescription": "Average number of finished stores per completed instruction",
+        "MetricExpr": "PM_ST_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "STORES_PER_INST"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded from beyond the L2 per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L2_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand loads that reloaded from beyond the L3 per completed instruction",
+        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L3_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of DERAT misses with 4k page size per completed instruction",
+        "MetricExpr": "PM_DERAT_MISS_4K / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_4K_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of DERAT misses with 64k page size per completed instruction",
+        "MetricExpr": "PM_DERAT_MISS_64K / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_64K_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Average number of run cycles per completed instruction",
+        "MetricExpr": "PM_RUN_CYC / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "RUN_CPI"
+    },
+    {
+        "BriefDescription": "Percentage of DERAT misses per completed instruction",
+        "MetricExpr": "PM_DERAT_MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Average number of completed instructions per run cycle",
+        "MetricExpr": "PM_RUN_INST_CMPL / PM_RUN_CYC",
+        "MetricGroup": "General",
+        "MetricName": "RUN_IPC"
+    },
+    {
+        "BriefDescription": "Average number of completed instructions per instruction group",
+        "MetricExpr": "PM_RUN_INST_CMPL / PM_1PLUS_PPC_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "AVERAGE_COMPLETED_INSTRUCTION_SET_SIZE"
+    },
+    {
+        "BriefDescription": "Average number of finished instructions per completed instructions",
+        "MetricExpr": "PM_INST_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "INST_FIN_PER_CMPL"
+    },
+    {
+        "BriefDescription": "Average cycles per completed instruction when the NTF instruction is completing and the finish was overlooked",
+        "MetricExpr": "PM_EXEC_STALL_UNKNOWN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "EXEC_STALL_UNKOWN_CPI"
+    },
+    {
+        "BriefDescription": "Percentage of finished branches that were taken",
+        "MetricExpr": "PM_BR_TAKEN_CMPL / PM_BR_FIN * 100",
+        "MetricGroup": "General",
+        "MetricName": "TAKEN_BRANCHES",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of completed instructions that were a demand load that did not hit in the L1, L2, or the L3",
+        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "General",
+        "MetricName": "L3_LD_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Average number of finished branches per completed instruction",
+        "MetricExpr": "PM_BR_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "BRANCHES_PER_INST"
+    },
+    {
+        "BriefDescription": "Average number of instructions finished in the LSU per completed instruction",
+        "MetricExpr": "PM_LSU_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "LSU_PER_INST"
+    },
+    {
+        "BriefDescription": "Average number of instructions finished in the VSU per completed instruction",
+        "MetricExpr": "PM_VSU_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "VSU_PER_INST"
+    },
+    {
+        "BriefDescription": "Average number of TLBIE instructions finished in the LSU per completed instruction",
+        "MetricExpr": "PM_TLBIE_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "TLBIE_PER_INST"
+    },
+    {
+        "BriefDescription": "Average number of STCX instructions finshed per completed instruction",
+        "MetricExpr": "PM_STCX_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "STXC_PER_INST"
+    },
+    {
+        "BriefDescription": "Average number of LARX instructions finshed per completed instruction",
+        "MetricExpr": "PM_LARX_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "LARX_PER_INST"
+    },
+    {
+        "BriefDescription": "Average number of PTESYNC instructions finshed per completed instruction",
+        "MetricExpr": "PM_PTESYNC_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "PTESYNC_PER_INST"
+    },
+    {
+        "BriefDescription": "Average number of simple fixed-point instructions finshed in the store unit per completed instruction",
+        "MetricExpr": "PM_FX_LSU_FIN / PM_RUN_INST_CMPL",
+        "MetricGroup": "General",
+        "MetricName": "FX_PER_INST"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded the L1 cache",
+        "MetricExpr": "PM_LD_DEMAND_MISS_L1 / PM_LD_MISS_L1 * 100",
+        "MetricGroup": "General",
+        "MetricName": "DL1_MISS_RELOADS",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from beyond the local L2",
+        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_LD_DEMAND_MISS_L1 * 100",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L2_MISS",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of demand load misses that reloaded from beyond the local L3",
+        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_LD_DEMAND_MISS_L1 * 100",
+        "MetricGroup": "dL1_Reloads",
+        "MetricName": "DL1_RELOAD_FROM_L3_MISS",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of cycles stalled due to the NTC instruction waiting for a load miss to resolve from a source beyond the local L2 and local L3",
+        "MetricExpr": "DMISS_L3MISS_STALL_CPI / RUN_CPI * 100",
+        "MetricGroup": "General",
+        "MetricName": "DCACHE_MISS_CPI",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of DERAT misses with 2M page size per completed instruction",
+        "MetricExpr": "PM_DERAT_MISS_2M / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_2M_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of DERAT misses with 16M page size per completed instruction",
+        "MetricExpr": "PM_DERAT_MISS_16M / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_16M_MISS_RATE",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "DERAT miss ratio for 4K page size",
+        "MetricExpr": "PM_DERAT_MISS_4K / PM_DERAT_MISS",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_4K_MISS_RATIO"
+    },
+    {
+        "BriefDescription": "DERAT miss ratio for 2M page size",
+        "MetricExpr": "PM_DERAT_MISS_2M / PM_DERAT_MISS",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_2M_MISS_RATIO"
+    },
+    {
+        "BriefDescription": "DERAT miss ratio for 16M page size",
+        "MetricExpr": "PM_DERAT_MISS_16M / PM_DERAT_MISS",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_16M_MISS_RATIO"
+    },
+    {
+        "BriefDescription": "DERAT miss ratio for 64K page size",
+        "MetricExpr": "PM_DERAT_MISS_64K / PM_DERAT_MISS",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_64K_MISS_RATIO"
+    },
+    {
+        "BriefDescription": "Percentage of DERAT misses that resulted in TLB reloads",
+        "MetricExpr": "PM_DTLB_MISS / PM_DERAT_MISS * 100",
+        "MetricGroup": "Translation",
+        "MetricName": "DERAT_MISS_RELOAD",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of icache misses that were reloaded from beyond the local L3",
+        "MetricExpr": "PM_INST_FROM_L3MISS / PM_L1_ICACHE_MISS * 100",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_L3_MISS",
+        "ScaleUnit": "1%"
+    },
+    {
+        "BriefDescription": "Percentage of icache reloads from the beyond the L3 per completed instruction",
+        "MetricExpr": "PM_INST_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
+        "MetricGroup": "Instruction_Misses",
+        "MetricName": "INST_FROM_L3_MISS_RATE",
+        "ScaleUnit": "1%"
+    }
+]
-- 
2.26.2

