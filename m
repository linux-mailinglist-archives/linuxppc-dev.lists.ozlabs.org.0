Return-Path: <linuxppc-dev+bounces-14355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB9C6E8EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLnN2kNlz3f2B;
	Wed, 19 Nov 2025 23:46:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556360;
	cv=none; b=dTurQAZAG0mrYyJb91vqiVpQJTkfb8wNqq23H7HoUpUYU1OyNMyalT/8k3jhWkGDhk3blu4krl9z7EVpHEVVNRiBqYdTVKdkeyJQHJV6nTXqgMRZmzdCCyEYv7z0PTiVGo28C3teLP2/gHkn5fz+7yh7I0FI4ZygIUk4AyqPbYv48k/Ee6tGzlJpThV3hMAG0NDD/levgktCyM8bhnbxsLizFiVIlC7Ue3Zqls79kM9F9rLnUrpcMjZoBHK1XJ7ht7N8lKAgXxYheJD+/kOPrZ/n9RClyczk+D2EsiH8kemlRxDgMFmpWD5N2pe5mF/ky9PV2EH/83JDlFTnQVIGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556360; c=relaxed/relaxed;
	bh=lB+cbVN4Fmg5YKNDfNdeBco/d5wz2KyzZ0je1NFddos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsZqMxDgkNhqaoqpmbh3LjmMRJUOQRhdzzokzNieGNYFh+iEJBqt/2qgUHaT6PKcm1fmeRMeA6uvuD+fJvqH+EosWhribut1neMlmpnFoKfD767xEWEcVdMutHLqjGYGda22bElu/Ddcpp0gf45T6EH/V2/esQFdYbLOK3NIp8iFNZ9fyh7TGwORnqffOrEPZ+k0+XEK98UnaBFoF4FLso25qwKMCgiwBJuLutTkrouU9jzQ2V+HqNuueUa2fgA1mqY842MB3Z5s9xzRdmRq5PYdL5rA4IAw/Q5Jke4pusJr4nvUj294KPvzAp52YIqW+7AgHmes5/kIDhC/4dxlrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SgxI7BLk; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SgxI7BLk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLnM4bYRz3cR4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:45:59 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ97F3r020218;
	Wed, 19 Nov 2025 12:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=lB+cbVN4Fmg5YKNDf
	NdeBco/d5wz2KyzZ0je1NFddos=; b=SgxI7BLkkqfnxHFgJV/qTY+HskXCzJmkl
	PjgefPAOF+J/J96dhlsNnIY9NeJisjGp4s5FGZVzKIuV8+FXuhnTkUDh4caMT+Wk
	gAvFX89M4meCN1rkmnRamr6TEr5O5juwo8TI374TpSDPvqdR9Esv7pC5ozDy+QbF
	hSZNB21AiMsD3rGeb7sv8aRn8fc+0iMk2K0Id4NeXVbAqcUe1GCkZd+jFaunlN0y
	6DJ+AfKAjR9aBfC2vDckzFl2uWl2uJE6f03nbu8BLQ2KgqtfdvL19oiw8qsDI0+j
	w0aNSSY5dDkkgbSs30gSeUEm+/IX0Oyni2lbLacg0HuP8WTLhpwzg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka0d0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:40 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCjdBU023064;
	Wed, 19 Nov 2025 12:45:39 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka0d0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJBUmS8030805;
	Wed, 19 Nov 2025 12:45:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47y0rp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:38 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjYXf43057628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17D9720043;
	Wed, 19 Nov 2025 12:45:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1DD820040;
	Wed, 19 Nov 2025 12:45:29 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:29 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 08/17] sched/rt: Don't select paravirt CPU for wakeup and push/pull rt task
Date: Wed, 19 Nov 2025 18:14:40 +0530
Message-ID: <20251119124449.1149616-9-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: CjgZiGh28N3kLz-6H1TCKptKIClCh7le
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX2StIe5jMcjrU
 8JkCEOWL2uH8yPhf2yn4ECYNmiZjfX2oO9GF7KN9I0Fb3qCQAVRAl+6thihvMPPOBrO5k7fdQNx
 iVNJPfvXGDcVkcM+Cq0l7NsLcmNtC22qW2j/q0KQnDHK9ndbWjqqKadbVgyGdwWdHLpvQ6Fp5F9
 SUE0wNXMAsSHGQ8UQ3XQrjilnFVYjoxn4nVvjpAhTEzN85dqzy4zrCqIfW7LlrWnyu365A0LlMe
 oR4YCMoNwwsRFAiRfe6DM7hp3XI3y+k3yNksuUN+KbNR5BKt+l0kGSV1b6ImdW2FbY/Gv26eYV5
 SE/MjKbi9IE+Esg6TOepj87QjjV+j8LV0NrnOw7N8wFsc+a0YpGYPnowUIH7CuqcZ+GSMBvG42N
 /9qGg1aQ9aGN/bs8hWIKx6z9u9M2yw==
X-Proofpoint-ORIG-GUID: Jb856YEj9Bv6Xl77X6GJsQ1ASlrjgxNV
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691dbbf4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=2Scwftyo7L3m9cOp47sA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For RT class,
- During wakeup don't select a paravirt CPU.
- Don't pull a task towards a paravirt CPU.
- Don't push a task to a paravirt CPU.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/rt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index f1867fe8e5c5..0b78c74dbbe3 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1552,6 +1552,9 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
 		if (!test && target != -1 && !rt_task_fits_capacity(p, target))
 			goto out_unlock;
 
+		/* Avoid moving to a paravirt CPU */
+		if (cpu_paravirt(target))
+			goto out_unlock;
 		/*
 		 * Don't bother moving it if the destination CPU is
 		 * not running a lower priority task.
@@ -1876,7 +1879,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 	for (tries = 0; tries < RT_MAX_TRIES; tries++) {
 		cpu = find_lowest_rq(task);
 
-		if ((cpu == -1) || (cpu == rq->cpu))
+		if ((cpu == -1) || (cpu == rq->cpu) || cpu_paravirt(cpu))
 			break;
 
 		lowest_rq = cpu_rq(cpu);
@@ -1974,7 +1977,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 			return 0;
 
 		cpu = find_lowest_rq(rq->curr);
-		if (cpu == -1 || cpu == rq->cpu)
+		if (cpu == -1 || cpu == rq->cpu || cpu_paravirt(cpu))
 			return 0;
 
 		/*
@@ -2237,6 +2240,10 @@ static void pull_rt_task(struct rq *this_rq)
 	if (likely(!rt_overload_count))
 		return;
 
+	/* There is no point in pulling the task towards a paravirt cpu */
+	if (cpu_paravirt(this_rq->cpu))
+		return;
+
 	/*
 	 * Match the barrier from rt_set_overloaded; this guarantees that if we
 	 * see overloaded we must also see the rto_mask bit.
-- 
2.47.3


