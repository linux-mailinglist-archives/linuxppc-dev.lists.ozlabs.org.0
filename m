Return-Path: <linuxppc-dev+bounces-564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8787960114
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 07:33:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtGRy55dzz2yP8;
	Tue, 27 Aug 2024 15:33:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724736830;
	cv=none; b=d7cV14f4W2i2FiOtUKZu/HPE7/N6J19za56wO6oKS7+kgPNDRT19u2yrzTSMNLIrY8UrFcnMM+CJTYGz2W4TQFAOfmFyVdj80aw2zSRvQ7jLRbWVWohPOyyU5AW9L4wMLrokjQXZkxvR7QBRLRNaLufZ4mQ5DDRx3TUaZEIRtHl4D0n1MGPoL1J/GEEOw/2nP7hrH13kZH2i+n3nN8LmUMaKAN9pMuzQxQGO/kYdiIAuNhh4Lg1oqgSxEH3hQ0fb8RfF0UfxHqJld9jrjQekyxzlDKp+DFmMd6GTo8/9VHZu+EuakALiFe1fA6Y/c5aHNnjttMX61XeKau3YOffAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724736830; c=relaxed/relaxed;
	bh=L8Sjx5YSltujzI60JahR8FVhesLAlU00v4fqtvSMiGY=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=YNzLpyOOOT3dYbMj73ThqHIrMlbzXZwT1FcO//CidPM2+dLVyKrt8ouoBvvcAMbSIAhPo/OHAZpiE55FLU7M2WyqWCZi0iFW5/LijKNh4ID+Xt+7GIijcxFCNjGzy3w6GxqjcS1TbDy2qMRv4ToDkdS1P5Mn1D0JC6lM1PNGmBT8QzWC1mSg+gyhmExfuCMRhUrGD2yjScF2yhWB/lnc0WG8HzedGXbkFRBk9gcJAk/lJnQJUyj2F50qrSjEExPN/c/zxb2jZbsLPpA3D9sShBElVPC7SjW7PZ8X2jkhyXG87HWE9vZO/zCwaNU3mJcA1iDv9s0hgsad66b1EB5w7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p2laHNNH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p2laHNNH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtGRy255mz2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 15:33:49 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R1tVLo015136;
	Tue, 27 Aug 2024 05:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=L8Sjx5YSltujz
	I60JahR8FVhesLAlU00v4fqtvSMiGY=; b=p2laHNNHTI/0ykTeuNBTu5GWbb9Kk
	DrpSNih83djzsCqkomzswBwCAJDagHd/3jY4yBrorY0VZjdOdwwnFbSn3fD+uXoO
	s2i+I7lTd8Iq7uSaDTE0hTVtYscsxfpTZK89tMgqywDAo7I8OUSXmtqio/27kXBy
	1NsKHv2xYjadkrIfHYuVMI1Dx66VwHW+CdRmt6GbM6fh+//FesD9K4Eu7Flwlob/
	OsKBX16y1J7d9tAYC89JrPihXZORvp+1Bn4WEz8GLEEKssffkEonpsWB1PNBS0j5
	emUDuAgjzFCrBo6DKvSuW3NkCKfGrJmLVt4TByx8ZqBzTCZ18z1YITSaA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417fvc1tsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:33:45 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47R5XiDA028487;
	Tue, 27 Aug 2024 05:33:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417fvc1tsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:33:44 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47R3XFZ9008239;
	Tue, 27 Aug 2024 05:33:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 417v2mh4xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 05:33:40 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47R5Xb9u55509362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2024 05:33:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E9512004B;
	Tue, 27 Aug 2024 05:33:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C580B20040;
	Tue, 27 Aug 2024 05:33:30 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.ustream.lldns.net (unknown [9.200.51.96])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Aug 2024 05:33:30 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, irogers@google.com
Cc: namhyung@kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        hbathini@linux.ibm.com, disgoel@linux.vnet.ibm.com
Subject: [PATCH 3/3] perf vendor events: Move PM_BR_MPRED_CMPL event for power10 platform
Date: Tue, 27 Aug 2024 11:02:06 +0530
Message-ID: <20240827053206.538814-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240827053206.538814-1-kjain@linux.ibm.com>
References: <20240827053206.538814-1-kjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: _PMNOpisS7R51y7GDlnBtpvGFuTfQJod
X-Proofpoint-GUID: l8-l_rXsSQmF8Lv2U7hQ4MJIdQl8Lwg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_04,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270039

Move PM_BR_MPRED_CMPL event from cache.json to frontend.json file
for power10 platform

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/pmu-events/arch/powerpc/power10/cache.json    | 5 -----
 tools/perf/pmu-events/arch/powerpc/power10/frontend.json | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/cache.json b/tools/perf/pmu-events/arch/powerpc/power10/cache.json
index 9814a59fce31..b7e0be09ff57 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/cache.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/cache.json
@@ -18,10 +18,5 @@
     "EventCode": "0x300F4",
     "EventName": "PM_RUN_INST_CMPL_CONC",
     "BriefDescription": "PowerPC instruction completed by this thread when all threads in the core had the run-latch set."
-  },
-  {
-    "EventCode": "0x400F6",
-    "EventName": "PM_BR_MPRED_CMPL",
-    "BriefDescription": "A mispredicted branch completed. Includes direction and target."
   }
 ]
diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
index 684374fe5699..b6998987ab75 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
@@ -94,6 +94,11 @@
     "EventName": "PM_DTLB_HIT_1G",
     "BriefDescription": "Data TLB hit (DERAT reload) page size 1G. Implies radix translation. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
   },
+  {
+    "EventCode": "0x400F6",
+    "EventName": "PM_BR_MPRED_CMPL",
+    "BriefDescription": "A mispredicted branch completed. Includes direction and target."
+  },
   {
     "EventCode": "0x400FC",
     "EventName": "PM_ITLB_MISS",
-- 
2.43.5


