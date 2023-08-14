Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B245277B7A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 13:33:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pv8tnPBv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPXN93hxQz3dKj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 21:33:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pv8tnPBv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPXGT0lXjz3c3s
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 21:28:48 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EBLTRG012572;
	Mon, 14 Aug 2023 11:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jR6UtC/rW6PrHqDVG/ckmQzJuO/hNVG3WYGvvR9FXfE=;
 b=pv8tnPBvRq7wA1RLx40dMRKZ3Cm3gijAxRdAB/ubCPdSbc91/FDF9tJo4p/xrkSXPW+0
 tO3hWr5hsnAJ5VuLRspddcBGbpuqq4SiYZg/hhjWcozCFZZFYz9Em2pgyLO5BzDd+LpN
 aMwOeKzR5OnVofrJbNSmaXA4nsaB88oLi+1K/VvDtknv7AZNolVvV93CV0Un4Glbo+mK
 7haicFmWGQFpts6Gdv/vR+LJ13iqdd2cybf9LVbQMGdrgy20t61H72Kf01mpa0twCuJJ
 TwJOasS/igHihHKyMurAkrzaolrxSHODCZdnnfqmuI7MP8khQUlux8e0h5XQpuLD5z6J Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfkak050f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:45 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EBMmr3016032;
	Mon, 14 Aug 2023 11:28:44 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfkak0504-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:44 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37E9DAhv003436;
	Mon, 14 Aug 2023 11:28:43 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3semds489x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:43 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EBSeOB43712928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 11:28:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B127E20043;
	Mon, 14 Aug 2023 11:28:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F03E20040;
	Mon, 14 Aug 2023 11:28:38 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.123.95])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Aug 2023 11:28:37 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 6/7] perf vendor events: Update metric event names for power10 platform
Date: Mon, 14 Aug 2023 16:58:02 +0530
Message-Id: <20230814112803.1508296-6-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230814112803.1508296-1-kjain@linux.ibm.com>
References: <20230814112803.1508296-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4Vr46kJODKMmjW4jIoy9TPRS06KL36gZ
X-Proofpoint-GUID: IiVrN8z-MeJwqAcG71vtsfQdmzg6_tIg
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

Update metric event name for some of the JSON/metric events for
power10 platform.

Fixes: 3ca3af7d1f23 ("perf vendor events power10: Add metric events JSON file for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/metrics.json         | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
index e3087eb1ccff..182369076d95 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
@@ -16,133 +16,133 @@
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled for any reason",
         "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI;CPI_STALL_RATIO",
-        "MetricName": "DISPATCHED_CPI"
+        "MetricName": "DISPATCH_STALL_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because there was a flush",
         "MetricExpr": "PM_DISP_STALL_FLUSH / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_FLUSH_CPI"
+        "MetricName": "DISPATCH_STALL_FLUSH_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because the MMU was handling a translation miss",
         "MetricExpr": "PM_DISP_STALL_TRANSLATION / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_TRANSLATION_CPI"
+        "MetricName": "DISPATCH_STALL_TRANSLATION_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled waiting to resolve an instruction ERAT miss",
         "MetricExpr": "PM_DISP_STALL_IERAT_ONLY_MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IERAT_ONLY_MISS_CPI"
+        "MetricName": "DISPATCH_STALL_IERAT_ONLY_MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled waiting to resolve an instruction TLB miss",
         "MetricExpr": "PM_DISP_STALL_ITLB_MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_ITLB_MISS_CPI"
+        "MetricName": "DISPATCH_STALL_ITLB_MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to an icache miss",
         "MetricExpr": "PM_DISP_STALL_IC_MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IC_MISS_CPI"
+        "MetricName": "DISPATCH_STALL_IC_MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from the local L2",
         "MetricExpr": "PM_DISP_STALL_IC_L2 / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IC_L2_CPI"
+        "MetricName": "DISPATCH_STALL_IC_L2_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from the local L3",
         "MetricExpr": "PM_DISP_STALL_IC_L3 / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IC_L3_CPI"
+        "MetricName": "DISPATCH_STALL_IC_L3_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while the instruction was fetched from any source beyond the local L3",
         "MetricExpr": "PM_DISP_STALL_IC_L3MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_IC_L3MISS_CPI"
+        "MetricName": "DISPATCH_STALL_IC_L3MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to an icache miss after a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED_ICMISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_ICMISS_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_ICMISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from the local L2 after suffering a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L2 / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_IC_L2_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_IC_L2_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from the local L3 after suffering a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3 / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_IC_L3_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_IC_L3_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled while instruction was fetched from any source beyond the local L3 after suffering a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3MISS / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_IC_L3MISS_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_IC_L3MISS_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled due to a branch mispredict",
         "MetricExpr": "PM_DISP_STALL_BR_MPRED / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_BR_MPRED_CPI"
+        "MetricName": "DISPATCH_STALL_BR_MPRED_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch for any reason",
         "MetricExpr": "PM_DISP_STALL_HELD_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch",
         "MetricExpr": "PM_DISP_STALL_HELD_SYNC_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISP_HELD_STALL_SYNC_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_SYNC_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch while waiting on the scoreboard",
         "MetricExpr": "PM_DISP_STALL_HELD_SCOREBOARD_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISP_HELD_STALL_SCOREBOARD_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_SCOREBOARD_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch due to issue queue full",
         "MetricExpr": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISP_HELD_STALL_ISSQ_FULL_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_ISSQ_FULL_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the mapper/SRB was full",
         "MetricExpr": "PM_DISP_STALL_HELD_RENAME_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_RENAME_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_RENAME_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the STF mapper/SRB was full",
         "MetricExpr": "PM_DISP_STALL_HELD_STF_MAPPER_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_STF_MAPPER_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_STF_MAPPER_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because the XVFC mapper/SRB was full",
         "MetricExpr": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_XVFC_MAPPER_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_XVFC_MAPPER_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch for any other reason",
         "MetricExpr": "PM_DISP_STALL_HELD_OTHER_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_OTHER_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_OTHER_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction has been dispatched but not issued for any reason",
@@ -352,13 +352,13 @@
         "BriefDescription": "Average cycles per completed instruction when dispatch was stalled because fetch was being held, so there was nothing in the pipeline for this thread",
         "MetricExpr": "PM_DISP_STALL_FETCH / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_FETCH_CPI"
+        "MetricName": "DISPATCH_STALL_FETCH_CPI"
     },
     {
         "BriefDescription": "Average cycles per completed instruction when the NTC instruction was held at dispatch because of power management",
         "MetricExpr": "PM_DISP_STALL_HELD_HALT_CYC / PM_RUN_INST_CMPL",
         "MetricGroup": "CPI",
-        "MetricName": "DISPATCHED_HELD_HALT_CPI"
+        "MetricName": "DISPATCH_STALL_HELD_HALT_CPI"
     },
     {
         "BriefDescription": "Percentage of flushes per completed instruction",
@@ -560,7 +560,7 @@
         "BriefDescription": "Average number of STCX instructions finshed per completed instruction",
         "MetricExpr": "PM_STCX_FIN / PM_RUN_INST_CMPL",
         "MetricGroup": "General",
-        "MetricName": "STXC_PER_INST"
+        "MetricName": "STCX_PER_INST"
     },
     {
         "BriefDescription": "Average number of LARX instructions finshed per completed instruction",
-- 
2.39.3

