Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED92579223B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 13:42:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WpU797F7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg3Xb6HkKz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 21:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WpU797F7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg3Vh4RrZz2y1f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 21:41:16 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385Bcquf000658;
	Tue, 5 Sep 2023 11:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NW4FzMz6UpipfR6mOGfFWM09jdtytMIE4L3Xw9K3oDo=;
 b=WpU797F7hdVsjyDAWI7jkPtDK/bEH3Lo2ZMF+0uyTW81CG76M0PGFsNWcxXtFtaGs9nf
 nBkzvd1uPrNt3JpKKQJ7u2Noipj95Xzw0wYMhl4xNozXKxguVIlDiZ5JH6aXym8KQf1f
 jPYiF2U/k5UFVt07gZMa3oSGXV8HEzSkMkBEOLKiqOEai4xFbq8hcU/BXoWwnb0FXVPr
 p8u83HuJucGQalYr1Fe+6j7BkGNy/RJIg0syXPiKfilSp6dkHugojtadyyQpOdrTtG/m
 xtfmAHBVK+p3PZajMLnZQ7jjrv+5i7BpUjGIV+Rk2gpZTcUk2MS4OQ7JUHdJedlW8aoW uQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3swtk8k0us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 11:41:10 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 385BEAwC011145;
	Tue, 5 Sep 2023 11:41:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svj31hn8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 11:41:09 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 385Bf6qM26542656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Sep 2023 11:41:06 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C7AD2004B;
	Tue,  5 Sep 2023 11:41:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39FCF20043;
	Tue,  5 Sep 2023 11:41:04 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.100.85])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Sep 2023 11:41:03 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH v2 2/3] perf vendor events: Update JSON/events for power10 platform
Date: Tue,  5 Sep 2023 17:10:38 +0530
Message-Id: <20230905114039.176645-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230905114039.176645-1-kjain@linux.ibm.com>
References: <20230905114039.176645-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ewbNSioy1QlPKsg-BN-zoT7Ycq0xKZP2
X-Proofpoint-ORIG-GUID: ewbNSioy1QlPKsg-BN-zoT7Ycq0xKZP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309050103
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update JSON/Events list with additional data-source events
for power10 platform.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../arch/powerpc/power10/datasource.json      | 505 ++++++++++++++++++
 1 file changed, 505 insertions(+)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
index 12cfb9785433..6b0356f2d301 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
@@ -1278,5 +1278,510 @@
     "EventCode": "0x0A4240000000C142",
     "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_MOD",
     "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
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
   }
 ]
-- 
2.39.3

