Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AC78521C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 09:57:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=STF+EhTh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVz820ytTz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 17:57:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=STF+EhTh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVz736j0tz2xdc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 17:56:15 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N7pPIw021224;
	Wed, 23 Aug 2023 07:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9Hw++pvAjgqLnitENDXtUbOOT5GbrwkuxnANsTh3wMs=;
 b=STF+EhThSPTsaKhLY6RaT73O8k9C3rxCqSVCuJ0l3vmTjaPKxKVNN7QwCPMXMwGYVZN1
 ZcrNl8n61i7+VVvGaXr9QepyqQ56tt7jF8bfoUPCRt83CuONCqbdu99wpB4i7KCSVSWw
 4M6lbsU4kZv8cItT2yKoWsT1vNAa+lGW+m9k1yQQk/HKI05RHtQYZuZJgxfMfQ0DCwFO
 YFL2gy0bPDVEfC5ZaI2Us1koljGBo+p9You8e2ATxnhhEFNhHFqpydjB45Nm/xD+6gUE
 gj9Px9Vw8n1QLuup5v1+SI7YiIYnUT06cUR53NISztcl2QKyX4kkRsHqICtCVaGQLNAx cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sndts0dvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 07:56:04 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37N7q8bD024701;
	Wed, 23 Aug 2023 07:56:04 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sndts0dvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 07:56:04 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37N7D4bO020117;
	Wed, 23 Aug 2023 07:56:03 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sn22acmj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 07:56:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37N7txPf22610592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Aug 2023 07:55:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52C4C2004E;
	Wed, 23 Aug 2023 07:55:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F15320040;
	Wed, 23 Aug 2023 07:55:56 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.40.46])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Aug 2023 07:55:55 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 1/2] perf vendor events: Update JSON/events for power10 platform
Date: Wed, 23 Aug 2023 13:25:42 +0530
Message-Id: <20230823075543.191126-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TPXqCFddHdaglVst5Js7qn56L4fMYJwm
X-Proofpoint-ORIG-GUID: mYtrJwZBKU0TskDj0Opily_DkYiX_pBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_05,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2308230068
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

Update JSON/Events list with data-source events for power10 platform.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/datasource.json      | 1787 +++++++++++++++++
 .../arch/powerpc/power10/others.json          |   10 -
 .../arch/powerpc/power10/translation.json     |    5 -
 3 files changed, 1787 insertions(+), 15 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/datasource.json

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
new file mode 100644
index 000000000000..6b0356f2d301
--- /dev/null
+++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
@@ -0,0 +1,1787 @@
+[
+  {
+    "EventCode": "0x200FE",
+    "EventName": "PM_DATA_FROM_L2MISS",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x300FE",
+    "EventName": "PM_DATA_FROM_L3MISS",
+    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss."
+  },
+  {
+    "EventCode": "0x400FE",
+    "EventName": "PM_DATA_FROM_MEMORY",
+    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x000300000000C040",
+    "EventName": "PM_INST_FROM_L2",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x000340000000C040",
+    "EventName": "PM_DATA_FROM_L2",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x000300000010C040",
+    "EventName": "PM_INST_FROM_L2_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L2 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x000340000020C040",
+    "EventName": "PM_DATA_FROM_L2_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L2 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x003F00000000C040",
+    "EventName": "PM_INST_FROM_L1MISS",
+    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L1 due to a demand miss."
+  },
+  {
+    "EventCode": "0x003F40000000C040",
+    "EventName": "PM_DATA_FROM_L1MISS",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L1 due to a demand miss."
+  },
+  {
+    "EventCode": "0x003F00000010C040",
+    "EventName": "PM_INST_FROM_L1MISS_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L1 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x003F40000020C040",
+    "EventName": "PM_DATA_FROM_L1MISS_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L1 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x000040000000C040",
+    "EventName": "PM_DATA_FROM_L2_NO_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x000040000020C040",
+    "EventName": "PM_DATA_FROM_L2_NO_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L2 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x004040000000C040",
+    "EventName": "PM_DATA_FROM_L2_MEPF",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x004040000020C040",
+    "EventName": "PM_DATA_FROM_L2_MEPF_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L2 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x008040000000C040",
+    "EventName": "PM_DATA_FROM_L2_LDHITST_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict on ld-hit-store from the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x008040000020C040",
+    "EventName": "PM_DATA_FROM_L2_LDHITST_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict on ld-hit-store from the local core's L2 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x00C040000000C040",
+    "EventName": "PM_DATA_FROM_L2_OTHER_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict other than ld-hit-store from the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x00C040000020C040",
+    "EventName": "PM_DATA_FROM_L2_OTHER_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict other than ld-hit-store from the local core's L2 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x000380000000C040",
+    "EventName": "PM_INST_FROM_L2MISS",
+    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss."
+  },
+  {
+    "EventCode": "0x000380000010C040",
+    "EventName": "PM_INST_FROM_L2MISS_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0003C0000020C040",
+    "EventName": "PM_DATA_FROM_L2MISS_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x010300000000C040",
+    "EventName": "PM_INST_FROM_L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L3 due to a demand miss."
+  },
+  {
+    "EventCode": "0x010340000000C040",
+    "EventName": "PM_DATA_FROM_L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss."
+  },
+  {
+    "EventCode": "0x010300000010C040",
+    "EventName": "PM_INST_FROM_L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L3 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x010340000020C040",
+    "EventName": "PM_DATA_FROM_L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x010040000000C040",
+    "EventName": "PM_DATA_FROM_L3_NO_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L3 due to a demand miss."
+  },
+  {
+    "EventCode": "0x010040000020C040",
+    "EventName": "PM_DATA_FROM_L3_NO_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L3 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x014040000000C040",
+    "EventName": "PM_DATA_FROM_L3_MEPF",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L3 due to a demand miss."
+  },
+  {
+    "EventCode": "0x014040000020C040",
+    "EventName": "PM_DATA_FROM_L3_MEPF_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L3 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x01C040000000C040",
+    "EventName": "PM_DATA_FROM_L3_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss."
+  },
+  {
+    "EventCode": "0x01C040000020C040",
+    "EventName": "PM_DATA_FROM_L3_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x000780000000C040",
+    "EventName": "PM_INST_FROM_L3MISS",
+    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss."
+  },
+  {
+    "EventCode": "0x000780000010C040",
+    "EventName": "PM_INST_FROM_L3MISS_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0007C0000020C040",
+    "EventName": "PM_DATA_FROM_L3MISS_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x080040000000C040",
+    "EventName": "PM_DATA_FROM_L21_REGENT_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x080040000020C040",
+    "EventName": "PM_DATA_FROM_L21_REGENT_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x084040000000C040",
+    "EventName": "PM_DATA_FROM_L21_REGENT_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x084040000020C040",
+    "EventName": "PM_DATA_FROM_L21_REGENT_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x080100000000C040",
+    "EventName": "PM_INST_FROM_L21_REGENT",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x080140000000C040",
+    "EventName": "PM_DATA_FROM_L21_REGENT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x080100000010C040",
+    "EventName": "PM_INST_FROM_L21_REGENT_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x080140000020C040",
+    "EventName": "PM_DATA_FROM_L21_REGENT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x088040000000C040",
+    "EventName": "PM_DATA_FROM_L31_REGENT_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x088040000020C040",
+    "EventName": "PM_DATA_FROM_L31_REGENT_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x08C040000000C040",
+    "EventName": "PM_DATA_FROM_L31_REGENT_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x08C040000020C040",
+    "EventName": "PM_DATA_FROM_L31_REGENT_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x088100000000C040",
+    "EventName": "PM_INST_FROM_L31_REGENT",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x088140000000C040",
+    "EventName": "PM_DATA_FROM_L31_REGENT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x088100000010C040",
+    "EventName": "PM_INST_FROM_L31_REGENT_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x088140000020C040",
+    "EventName": "PM_DATA_FROM_L31_REGENT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x080240000000C040",
+    "EventName": "PM_DATA_FROM_REGENT_L2L3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x080240000020C040",
+    "EventName": "PM_DATA_FROM_REGENT_L2L3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x084240000000C040",
+    "EventName": "PM_DATA_FROM_REGENT_L2L3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x084240000020C040",
+    "EventName": "PM_DATA_FROM_REGENT_L2L3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x080300000000C040",
+    "EventName": "PM_INST_FROM_REGENT_L2L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x080340000000C040",
+    "EventName": "PM_DATA_FROM_REGENT_L2L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x080300000010C040",
+    "EventName": "PM_INST_FROM_REGENT_L2L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x080340000020C040",
+    "EventName": "PM_DATA_FROM_REGENT_L2L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A0040000000C040",
+    "EventName": "PM_DATA_FROM_L21_NON_REGENT_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A0040000020C040",
+    "EventName": "PM_DATA_FROM_L21_NON_REGENT_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A4040000000C040",
+    "EventName": "PM_DATA_FROM_L21_NON_REGENT_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A4040000020C040",
+    "EventName": "PM_DATA_FROM_L21_NON_REGENT_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A0100000000C040",
+    "EventName": "PM_INST_FROM_L21_NON_REGENT",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A0140000000C040",
+    "EventName": "PM_DATA_FROM_L21_NON_REGENT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A0100000010C040",
+    "EventName": "PM_INST_FROM_L21_NON_REGENT_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A0140000020C040",
+    "EventName": "PM_DATA_FROM_L21_NON_REGENT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A8040000000C040",
+    "EventName": "PM_DATA_FROM_L31_NON_REGENT_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A8040000020C040",
+    "EventName": "PM_DATA_FROM_L31_NON_REGENT_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0AC040000000C040",
+    "EventName": "PM_DATA_FROM_L31_NON_REGENT_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0AC040000020C040",
+    "EventName": "PM_DATA_FROM_L31_NON_REGENT_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A8100000000C040",
+    "EventName": "PM_INST_FROM_L31_NON_REGENT",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A8140000000C040",
+    "EventName": "PM_DATA_FROM_L31_NON_REGENT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A8100000010C040",
+    "EventName": "PM_INST_FROM_L31_NON_REGENT_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A8140000020C040",
+    "EventName": "PM_DATA_FROM_L31_NON_REGENT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A0240000000C040",
+    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A0240000020C040",
+    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A4240000000C040",
+    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A4240000020C040",
+    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A0300000000C040",
+    "EventName": "PM_INST_FROM_NON_REGENT_L2L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A0340000000C040",
+    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss."
+  },
+  {
+    "EventCode": "0x0A0300000010C040",
+    "EventName": "PM_INST_FROM_NON_REGENT_L2L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0A0340000020C040",
+    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x094100000000C040",
+    "EventName": "PM_INST_FROM_LMEM",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x094040000000C040",
+    "EventName": "PM_DATA_FROM_LMEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x094100000010C040",
+    "EventName": "PM_INST_FROM_LMEM_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x094040000020C040",
+    "EventName": "PM_DATA_FROM_LMEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x098040000000C040",
+    "EventName": "PM_DATA_FROM_L_OC_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache due to a demand miss."
+  },
+  {
+    "EventCode": "0x098040000020C040",
+    "EventName": "PM_DATA_FROM_L_OC_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x09C040000000C040",
+    "EventName": "PM_DATA_FROM_L_OC_MEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x09C040000020C040",
+    "EventName": "PM_DATA_FROM_L_OC_MEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x098100000000C040",
+    "EventName": "PM_INST_FROM_L_OC_ANY",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x098140000000C040",
+    "EventName": "PM_DATA_FROM_L_OC_ANY",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x098100000010C040",
+    "EventName": "PM_INST_FROM_L_OC_ANY_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x098140000020C040",
+    "EventName": "PM_DATA_FROM_L_OC_ANY_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C0040000000C040",
+    "EventName": "PM_DATA_FROM_RL2_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C0040000020C040",
+    "EventName": "PM_DATA_FROM_RL2_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C4040000000C040",
+    "EventName": "PM_DATA_FROM_RL2_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C4040000020C040",
+    "EventName": "PM_DATA_FROM_RL2_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C0100000000C040",
+    "EventName": "PM_INST_FROM_RL2",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C0140000000C040",
+    "EventName": "PM_DATA_FROM_RL2",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C0100000010C040",
+    "EventName": "PM_INST_FROM_RL2_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C0140000020C040",
+    "EventName": "PM_DATA_FROM_RL2_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C8040000000C040",
+    "EventName": "PM_DATA_FROM_RL3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C8040000020C040",
+    "EventName": "PM_DATA_FROM_RL3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0CC040000000C040",
+    "EventName": "PM_DATA_FROM_RL3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0CC040000020C040",
+    "EventName": "PM_DATA_FROM_RL3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C8100000000C040",
+    "EventName": "PM_INST_FROM_RL3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C8140000000C040",
+    "EventName": "PM_DATA_FROM_RL3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C8100000010C040",
+    "EventName": "PM_INST_FROM_RL3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C8140000020C040",
+    "EventName": "PM_DATA_FROM_RL3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C0240000000C040",
+    "EventName": "PM_DATA_FROM_RL2L3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C0240000020C040",
+    "EventName": "PM_DATA_FROM_RL2L3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C4240000000C040",
+    "EventName": "PM_DATA_FROM_RL2L3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C4240000020C040",
+    "EventName": "PM_DATA_FROM_RL2L3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C0300000000C040",
+    "EventName": "PM_INST_FROM_RL2L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C0340000000C040",
+    "EventName": "PM_DATA_FROM_RL2L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C0300000010C040",
+    "EventName": "PM_INST_FROM_RL2L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C0340000020C040",
+    "EventName": "PM_DATA_FROM_RL2L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0D4100000000C040",
+    "EventName": "PM_INST_FROM_RMEM",
+    "BriefDescription": "The processor's instruction cache was reloaded from remote memory (MC slow) due to a demand miss."
+  },
+  {
+    "EventCode": "0x0D4040000000C040",
+    "EventName": "PM_DATA_FROM_RMEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from remote memory (MC slow) due to a demand miss."
+  },
+  {
+    "EventCode": "0x0D4100000010C040",
+    "EventName": "PM_INST_FROM_RMEM_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from remote memory (MC slow) due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0D4040000020C040",
+    "EventName": "PM_DATA_FROM_RMEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from remote memory (MC slow) due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0D8040000000C040",
+    "EventName": "PM_DATA_FROM_R_OC_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache due to a demand miss."
+  },
+  {
+    "EventCode": "0x0D8040000020C040",
+    "EventName": "PM_DATA_FROM_R_OC_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0DC040000000C040",
+    "EventName": "PM_DATA_FROM_R_OC_MEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x0DC040000020C040",
+    "EventName": "PM_DATA_FROM_R_OC_MEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0D8100000000C040",
+    "EventName": "PM_INST_FROM_R_OC_ANY",
+    "BriefDescription": "The processor's instruction cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x0D8140000000C040",
+    "EventName": "PM_DATA_FROM_R_OC_ANY",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x0D8100000010C040",
+    "EventName": "PM_INST_FROM_R_OC_ANY_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0D8140000020C040",
+    "EventName": "PM_DATA_FROM_R_OC_ANY_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E0040000000C040",
+    "EventName": "PM_DATA_FROM_DL2_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E0040000020C040",
+    "EventName": "PM_DATA_FROM_DL2_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E4040000000C040",
+    "EventName": "PM_DATA_FROM_DL2_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E4040000020C040",
+    "EventName": "PM_DATA_FROM_DL2_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E0100000000C040",
+    "EventName": "PM_INST_FROM_DL2",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E0140000000C040",
+    "EventName": "PM_DATA_FROM_DL2",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E0100000010C040",
+    "EventName": "PM_INST_FROM_DL2_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E0140000020C040",
+    "EventName": "PM_DATA_FROM_DL2_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E8040000000C040",
+    "EventName": "PM_DATA_FROM_DL3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E8040000020C040",
+    "EventName": "PM_DATA_FROM_DL3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0EC040000000C040",
+    "EventName": "PM_DATA_FROM_DL3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0EC040000020C040",
+    "EventName": "PM_DATA_FROM_DL3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E8100000000C040",
+    "EventName": "PM_INST_FROM_DL3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E8140000000C040",
+    "EventName": "PM_DATA_FROM_DL3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E8100000010C040",
+    "EventName": "PM_INST_FROM_DL3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E8140000020C040",
+    "EventName": "PM_DATA_FROM_DL3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E0240000000C040",
+    "EventName": "PM_DATA_FROM_DL2L3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E0240000020C040",
+    "EventName": "PM_DATA_FROM_DL2L3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E4240000000C040",
+    "EventName": "PM_DATA_FROM_DL2L3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E4240000020C040",
+    "EventName": "PM_DATA_FROM_DL2L3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E0300000000C040",
+    "EventName": "PM_INST_FROM_DL2L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E0340000000C040",
+    "EventName": "PM_DATA_FROM_DL2L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0E0300000010C040",
+    "EventName": "PM_INST_FROM_DL2L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0E0340000020C040",
+    "EventName": "PM_DATA_FROM_DL2L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0F4100000000C040",
+    "EventName": "PM_INST_FROM_DMEM",
+    "BriefDescription": "The processor's instruction cache was reloaded from distant memory (MC slow) due to a demand miss."
+  },
+  {
+    "EventCode": "0x0F4040000000C040",
+    "EventName": "PM_DATA_FROM_DMEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from distant memory (MC slow) due to a demand miss."
+  },
+  {
+    "EventCode": "0x0F4100000010C040",
+    "EventName": "PM_INST_FROM_DMEM_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from distant memory (MC slow) due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0F4040000020C040",
+    "EventName": "PM_DATA_FROM_DMEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from distant memory (MC slow) due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0F8040000000C040",
+    "EventName": "PM_DATA_FROM_D_OC_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache due to a demand miss."
+  },
+  {
+    "EventCode": "0x0F8040000020C040",
+    "EventName": "PM_DATA_FROM_D_OC_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0FC040000000C040",
+    "EventName": "PM_DATA_FROM_D_OC_MEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x0FC040000020C040",
+    "EventName": "PM_DATA_FROM_D_OC_MEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0F8100000000C040",
+    "EventName": "PM_INST_FROM_D_OC_ANY",
+    "BriefDescription": "The processor's instruction cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x0F8140000000C040",
+    "EventName": "PM_DATA_FROM_D_OC_ANY",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss."
+  },
+  {
+    "EventCode": "0x0F8100000010C040",
+    "EventName": "PM_INST_FROM_D_OC_ANY_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0F8140000020C040",
+    "EventName": "PM_DATA_FROM_D_OC_ANY_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x080B00000000C040",
+    "EventName": "PM_INST_FROM_ONCHIP_CACHE",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x080B40000000C040",
+    "EventName": "PM_DATA_FROM_ONCHIP_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x080B00000010C040",
+    "EventName": "PM_INST_FROM_ONCHIP_CACHE_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x080B40000020C040",
+    "EventName": "PM_DATA_FROM_ONCHIP_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C0B00000000C040",
+    "EventName": "PM_INST_FROM_OFFCHIP_CACHE",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C0B40000000C040",
+    "EventName": "PM_DATA_FROM_OFFCHIP_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss."
+  },
+  {
+    "EventCode": "0x0C0B00000010C040",
+    "EventName": "PM_INST_FROM_OFFCHIP_CACHE_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x0C0B40000020C040",
+    "EventName": "PM_DATA_FROM_OFFCHIP_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x095900000000C040",
+    "EventName": "PM_INST_FROM_ANY_MEMORY",
+    "BriefDescription": "The processor's instruction cache was reloaded from any chip's memory (MC slow) due to a demand miss."
+  },
+  {
+    "EventCode": "0x095840000000C040",
+    "EventName": "PM_DATA_FROM_ANY_MEMORY",
+    "BriefDescription": "The processor's L1 data cache was reloaded from any chip's memory (MC slow) due to a demand miss."
+  },
+  {
+    "EventCode": "0x095900000010C040",
+    "EventName": "PM_INST_FROM_ANY_MEMORY_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from any chip's memory (MC slow) due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x095840000020C040",
+    "EventName": "PM_DATA_FROM_ANY_MEMORY_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from any chip's memory (MC slow) due to a demand miss or prefetch reload."
+  },
+  {
+    "EventCode": "0x000300000000C142",
+    "EventName": "PM_MRK_INST_FROM_L2",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L2 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x000340000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L2",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L2 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x000300000010C142",
+    "EventName": "PM_MRK_INST_FROM_L2_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x000340000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x003F00000000C142",
+    "EventName": "PM_MRK_INST_FROM_L1MISS",
+    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L1 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x003F40000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L1MISS",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L1 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x003F00000010C142",
+    "EventName": "PM_MRK_INST_FROM_L1MISS_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L1 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x003F40000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L1MISS_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L1 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x000040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_NO_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L2 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x000040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_NO_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x004040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_MEPF",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L2 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x004040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_MEPF_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x008040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_LDHITST_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict on ld-hit-store from the local core's L2 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x008040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_LDHITST_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict on ld-hit-store from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x00C040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_OTHER_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict other than ld-hit-store from the local core's L2 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x00C040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L2_OTHER_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict other than ld-hit-store from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x000380000000C142",
+    "EventName": "PM_MRK_INST_FROM_L2MISS",
+    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0003C0000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L2MISS",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x000380000010C142",
+    "EventName": "PM_MRK_INST_FROM_L2MISS_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0003C0000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L2MISS_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x010300000000C142",
+    "EventName": "PM_MRK_INST_FROM_L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L3 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x010340000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x010300000010C142",
+    "EventName": "PM_MRK_INST_FROM_L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x010340000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x010040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L3_NO_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L3 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x010040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L3_NO_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x014040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L3_MEPF",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L3 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x014040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L3_MEPF_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x01C040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L3_CONFLICT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x01C040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L3_CONFLICT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x000780000000C142",
+    "EventName": "PM_MRK_INST_FROM_L3MISS",
+    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0007C0000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L3MISS",
+    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x000780000010C142",
+    "EventName": "PM_MRK_INST_FROM_L3MISS_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0007C0000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L3MISS_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x080040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x080040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x084040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x084040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x080100000000C142",
+    "EventName": "PM_MRK_INST_FROM_L21_REGENT",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x080140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_REGENT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x080100000010C142",
+    "EventName": "PM_MRK_INST_FROM_L21_REGENT_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x080140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x088040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x088040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x08C040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x08C040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x088100000000C142",
+    "EventName": "PM_MRK_INST_FROM_L31_REGENT",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x088140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_REGENT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x088100000010C142",
+    "EventName": "PM_MRK_INST_FROM_L31_REGENT_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x088140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x080240000000C142",
+    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x080240000020C142",
+    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x084240000000C142",
+    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x084240000020C142",
+    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x080300000000C142",
+    "EventName": "PM_MRK_INST_FROM_REGENT_L2L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x080340000000C142",
+    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x080300000010C142",
+    "EventName": "PM_MRK_INST_FROM_REGENT_L2L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x080340000020C142",
+    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A4040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A4040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0100000000C142",
+    "EventName": "PM_MRK_INST_FROM_L21_NON_REGENT",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0100000010C142",
+    "EventName": "PM_MRK_INST_FROM_L21_NON_REGENT_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A8040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A8040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0AC040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0AC040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A8100000000C142",
+    "EventName": "PM_MRK_INST_FROM_L31_NON_REGENT",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A8140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A8100000010C142",
+    "EventName": "PM_MRK_INST_FROM_L31_NON_REGENT_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A8140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0240000000C142",
+    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0240000020C142",
+    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A4240000000C142",
+    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A4240000020C142",
+    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0300000000C142",
+    "EventName": "PM_MRK_INST_FROM_NON_REGENT_L2L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0340000000C142",
+    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0300000010C142",
+    "EventName": "PM_MRK_INST_FROM_NON_REGENT_L2L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0A0340000020C142",
+    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x094100000000C142",
+    "EventName": "PM_MRK_INST_FROM_LMEM",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x094040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_LMEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x094100000010C142",
+    "EventName": "PM_MRK_INST_FROM_LMEM_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x094040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_LMEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x098040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L_OC_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x098040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L_OC_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x09C040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L_OC_MEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x09C040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L_OC_MEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x098100000000C142",
+    "EventName": "PM_MRK_INST_FROM_L_OC_ANY",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x098140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_L_OC_ANY",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x098100000010C142",
+    "EventName": "PM_MRK_INST_FROM_L_OC_ANY_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x098140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_L_OC_ANY_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C4040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C4040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0100000000C142",
+    "EventName": "PM_MRK_INST_FROM_RL2",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0100000010C142",
+    "EventName": "PM_MRK_INST_FROM_RL2_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C8040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C8040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0CC040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0CC040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C8100000000C142",
+    "EventName": "PM_MRK_INST_FROM_RL3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C8140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C8100000010C142",
+    "EventName": "PM_MRK_INST_FROM_RL3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C8140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0240000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2L3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0240000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2L3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C4240000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2L3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C4240000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2L3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0300000000C142",
+    "EventName": "PM_MRK_INST_FROM_RL2L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0340000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0300000010C142",
+    "EventName": "PM_MRK_INST_FROM_RL2L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0340000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RL2L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D4100000000C142",
+    "EventName": "PM_MRK_INST_FROM_RMEM",
+    "BriefDescription": "The processor's instruction cache was reloaded from remote memory (MC slow) due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D4040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_RMEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from remote memory (MC slow) due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D4100000010C142",
+    "EventName": "PM_MRK_INST_FROM_RMEM_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from remote memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D4040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_RMEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from remote memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D8040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_R_OC_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D8040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_R_OC_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0DC040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_R_OC_MEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0DC040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_R_OC_MEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D8100000000C142",
+    "EventName": "PM_MRK_INST_FROM_R_OC_ANY",
+    "BriefDescription": "The processor's instruction cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D8140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_R_OC_ANY",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D8100000010C142",
+    "EventName": "PM_MRK_INST_FROM_R_OC_ANY_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0D8140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_R_OC_ANY_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E4040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E4040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0100000000C142",
+    "EventName": "PM_MRK_INST_FROM_DL2",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0100000010C142",
+    "EventName": "PM_MRK_INST_FROM_DL2_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E8040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E8040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0EC040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0EC040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E8100000000C142",
+    "EventName": "PM_MRK_INST_FROM_DL3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E8140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E8100000010C142",
+    "EventName": "PM_MRK_INST_FROM_DL3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E8140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0240000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2L3_SHR",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0240000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2L3_SHR_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E4240000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2L3_MOD",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E4240000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2L3_MOD_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0300000000C142",
+    "EventName": "PM_MRK_INST_FROM_DL2L3",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0340000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2L3",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0300000010C142",
+    "EventName": "PM_MRK_INST_FROM_DL2L3_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0E0340000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DL2L3_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F4100000000C142",
+    "EventName": "PM_MRK_INST_FROM_DMEM",
+    "BriefDescription": "The processor's instruction cache was reloaded from distant memory (MC slow) due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F4040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_DMEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from distant memory (MC slow) due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F4100000010C142",
+    "EventName": "PM_MRK_INST_FROM_DMEM_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from distant memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F4040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_DMEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from distant memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F8040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_D_OC_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F8040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_D_OC_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0FC040000000C142",
+    "EventName": "PM_MRK_DATA_FROM_D_OC_MEM",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0FC040000020C142",
+    "EventName": "PM_MRK_DATA_FROM_D_OC_MEM_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F8100000000C142",
+    "EventName": "PM_MRK_INST_FROM_D_OC_ANY",
+    "BriefDescription": "The processor's instruction cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F8140000000C142",
+    "EventName": "PM_MRK_DATA_FROM_D_OC_ANY",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F8100000010C142",
+    "EventName": "PM_MRK_INST_FROM_D_OC_ANY_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0F8140000020C142",
+    "EventName": "PM_MRK_DATA_FROM_D_OC_ANY_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x080B00000000C142",
+    "EventName": "PM_MRK_INST_FROM_ONCHIP_CACHE",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x080B40000000C142",
+    "EventName": "PM_MRK_DATA_FROM_ONCHIP_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x080B00000010C142",
+    "EventName": "PM_MRK_INST_FROM_ONCHIP_CACHE_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x080B40000020C142",
+    "EventName": "PM_MRK_DATA_FROM_ONCHIP_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0B00000000C142",
+    "EventName": "PM_MRK_INST_FROM_OFFCHIP_CACHE",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0B40000000C142",
+    "EventName": "PM_MRK_DATA_FROM_OFFCHIP_CACHE",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0B00000010C142",
+    "EventName": "PM_MRK_INST_FROM_OFFCHIP_CACHE_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x0C0B40000020C142",
+    "EventName": "PM_MRK_DATA_FROM_OFFCHIP_CACHE_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x095900000000C142",
+    "EventName": "PM_MRK_INST_FROM_ANY_MEMORY",
+    "BriefDescription": "The processor's instruction cache was reloaded from any chip's memory (MC slow) due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x095840000000C142",
+    "EventName": "PM_MRK_DATA_FROM_ANY_MEMORY",
+    "BriefDescription": "The processor's L1 data cache was reloaded from any chip's memory (MC slow) due to a demand miss for a marked instruction."
+  },
+  {
+    "EventCode": "0x095900000010C142",
+    "EventName": "PM_MRK_INST_FROM_ANY_MEMORY_ALL",
+    "BriefDescription": "The processor's instruction cache was reloaded from any chip's memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
+  },
+  {
+    "EventCode": "0x095840000020C142",
+    "EventName": "PM_MRK_DATA_FROM_ANY_MEMORY_ALL",
+    "BriefDescription": "The processor's L1 data cache was reloaded from any chip's memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
+  }
+]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
index 0e21e7ba1959..fcf8a8ebe7bd 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
@@ -89,11 +89,6 @@
     "EventName": "PM_LD_DEMAND_MISS_L1",
     "BriefDescription": "The L1 cache was reloaded with a line that fulfills a demand miss request. Counted at reload time, before finish."
   },
-  {
-    "EventCode": "0x300FE",
-    "EventName": "PM_DATA_FROM_L3MISS",
-    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss."
-  },
   {
     "EventCode": "0x40012",
     "EventName": "PM_L1_ICACHE_RELOADED_ALL",
@@ -113,10 +108,5 @@
     "EventCode": "0x400F0",
     "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
     "BriefDescription": "Load missed L1, counted at finish time."
-  },
-  {
-    "EventCode": "0x400FE",
-    "EventName": "PM_DATA_FROM_MEMORY",
-    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/translation.json b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
index ea73900d248a..a96f76797da0 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/translation.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
@@ -9,11 +9,6 @@
     "EventName": "PM_ST_CMPL",
     "BriefDescription": "Stores completed from S2Q (2nd-level store queue). This event includes regular stores, stcx and cache inhibited stores. The following operations are excluded (pteupdate, snoop tlbie complete, store atomics, miso, load atomic payloads, tlbie, tlbsync, slbieg, isync, msgsnd, slbiag, cpabort, copy, tcheck, tend, stsync, dcbst, icbi, dcbf, hwsync, lwsync, ptesync, eieio, msgsync)."
   },
-  {
-    "EventCode": "0x200FE",
-    "EventName": "PM_DATA_FROM_L2MISS",
-    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
-  },
   {
     "EventCode": "0x300F0",
     "EventName": "PM_ST_MISS_L1",
-- 
2.39.3

