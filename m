Return-Path: <linuxppc-dev+bounces-3541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2E79D7AC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 05:23:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxXcq4BK5z2yYq;
	Mon, 25 Nov 2024 15:23:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732508587;
	cv=none; b=U/p6bzKdTyKK54GIOsPTqn4edvr5MBAYKuZHRTXxk70IRlVnPEuMz1OeaKFwWjkD1RG1WLKN2z+d2RGQ6khoneW13Pkrx3U81bqj727x7eC02d3tq5zqqV5SV8XpPr+qGDteRJFUMjeRaudyP+rM79Diu7AiYwH0gqr+8afSXn3nJamYF66/q3dP33T408GPq/W6WAZCSvMLU9aZWeV+90jgKR2dYjRccGyxw9NbyxVCCzPZPmCysQ6fFVWGxFn5ogmxUYlFMxprfYcvB3knsioUK2Ae7E1tSbUxlXGBoVOT6MxvsUFR4r7iJGOo5fkLdwyxYsj/3L8OMcLhQFF2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732508587; c=relaxed/relaxed;
	bh=4nU4MIX3xYAeJ0lJGXjBJOSSOxJkS/XKJUgGDVLl9bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACFGwer13xwH4qaWiIgFuHB8OKnqZ5wOpBuIrBWHCudpP1fT6l3gSFPoznQ4mMzRebr8NxaaGcgV4LADdZ2VQTknePRCrwH/uBtwNyTuXOr51NuWhXu5LGUOTgxgdyL9wl7/wjhf2LsRhqLCmoz4FOlSESmWlyaOzjKicPj3XiVyvm2K+ZibSeHYYKeE5yhDLKf6f1DQynB7JFVCDMZS3HFYvY374490XpNfCNHAK8H04KneCuw1Uq0R9DZJQo0rIRq1WUiZj3nEKHKOAbdz4N7qVzr+E51YsQhdzfrprbEmWTTvjC0040lsMZwWKDEimaZVKK892nNB08tvXb1LVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mDdwdgYI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mDdwdgYI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxXcm5TGtz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 15:23:04 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOKuqGF013001;
	Mon, 25 Nov 2024 04:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=4nU4MIX3xYAeJ0lJGXjBJOSSOxJkS/XKJUgGDVLl9
	bw=; b=mDdwdgYILdS6P+io7gbNLKX/ybaG/ONUCsts+aAXJ2sZV6cDkfJPUqccv
	QY7e7IsY0OVypgYPh1ANGLwC4H+ZXm194WA+ZDqa42+bVE8Bu8Lk2dIoJPKl3wqI
	EWoihYXK8M4WBNcVo290myIot13rIf/fsGuAfze5UtHAexjRVosZwx9JmEaxbnQV
	q3AUCsmkrLsB/kYoeVDKInI8LZBmUCsn6GMzEtsJ/Ru3/4ak4bD8JqpVTJVBXFHW
	9n6CsROTBgZGhASgx3aaIG+Fy12G4YrZBo4rcj6F8DA/I8nZ1B/wO9Dl/YgMqWnR
	eLAjtdQTXqrLBz1u0xGZNNm0ZWgcQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4338d1x38v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:33 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AP4MW2o025761;
	Mon, 25 Nov 2024 04:22:33 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4338d1x38t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:32 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOFrtLm009374;
	Mon, 25 Nov 2024 04:22:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 433scrstb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AP4MS1652953510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Nov 2024 04:22:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A16C42004B;
	Mon, 25 Nov 2024 04:22:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 760D720040;
	Mon, 25 Nov 2024 04:22:26 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Nov 2024 04:22:26 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, bigeasy@linutronix.de, ankur.a.arora@oracle.com,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        vschneid@redhat.com, peterz@infradead.org
Subject: [PATCH 0/3] powerpc: Enable dynamic preemption
Date: Mon, 25 Nov 2024 09:52:09 +0530
Message-ID: <20241125042212.1522315-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P9TjpY9FJsgJI2meGKM--s2bRF6fHUHb
X-Proofpoint-ORIG-GUID: 5ecB8bydt7EaE4rmFUbU1G60nig5UE6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=505
 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Once the lazy preemption is supported, it makes sense to enable dynamic
preemption. One can change the preemption model without changing the
kernel. 

Overheads of dynamic preemption seems reasonable for some of the
workloads. Tested with db2 database workload, unixbench, schbench
and hackbench. Except hackbench pipe rest show similar numbers as
without dynamic preemption specially for preempt=none. 

These patches *depend* on lazy preemption patches[1] to be applied
first on tip/sched/core tree. 

The reason for arch/asm/preempt.h is to enable arch specific preempt
enablements. Also, there is plan to move preempt count to paca for 64
bit systems as idea was discussed in [2]

[1] https://lore.kernel.org/all/20241116192306.88217-1-sshegde@linux.ibm.com/#t 
[2] https://lore.kernel.org/all/14d4584d-a087-4674-9e2b-810e96078b3a@linux.ibm.com/ 

Shrikanth Hegde (3):
  powerpc: copy preempt.h into arch/include/asm
  powerpc: support dynamic preemption
  powerpc: print right preemption model in die

 arch/powerpc/Kconfig               |   1 +
 arch/powerpc/include/asm/preempt.h | 101 +++++++++++++++++++++++++++++
 arch/powerpc/kernel/interrupt.c    |   6 +-
 arch/powerpc/kernel/traps.c        |   6 +-
 arch/powerpc/lib/vmx-helper.c      |   2 +-
 5 files changed, 113 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/include/asm/preempt.h

-- 
2.39.3


