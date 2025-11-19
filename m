Return-Path: <linuxppc-dev+bounces-14320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4762DC6CE54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:23:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGs0lm4z3bqy;
	Wed, 19 Nov 2025 17:22:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533349;
	cv=none; b=mRScQaYRFL+fdhfF32fyW2kv3XFqbHc1GkmX2jPqx5h716dCYcDF0yMqdVJA8o9svEuhNRC1Em3k9qynM4BjunamgxVSPY6KWGNd2E81wJmAj5TPqv1VqIcD22DpQ7ExxIZIofK7PL5/UW/76O9+tKpbNnMmdXvYtmM1nnOgjJdCoxutk8JLYIaVC6xVpx80vp1cMUZmnA9Ry85M8ASzogTkBUDgc05Tx6B3xKC3ZPclbt9qokabKZCVkrk/lCmfo/RixOwFa9goSVYJvZSwbD550vaXuZ8US3TqYPurWYjhUuP6lQQhhUwN8HSGUj8YOSBTCWQhkHbfP5WJwNAFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533349; c=relaxed/relaxed;
	bh=lB+cbVN4Fmg5YKNDfNdeBco/d5wz2KyzZ0je1NFddos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOutpfn+b2IjcrCenc+VHiQTzbHRO1U7kAjjFDIoZprSVxfLj8woxidiaRjIHf1+8VZCmiz5RiQZ81OIG2jW7n/GwtPU+E6B4ZGmxc5dXnXjbLyJww+bFx/cebPFZ+wyUkiTGrWEwmGST+G9+/MnZkQ0qWMPjnokNudl6/BAwgW7SrbE4hxvzAo1CRqlS8UglCs4EsayudovnGBD/oq/1E/fXKp55CttWoSG1OJ/Vjyhq2EpQvUbmIeRR1muqUUn02/H0z57BWBkeKwDzBuQ3bbfzMFslb0/9Fio6XgKjDpByIKjqCrv2QSioyv5oa1mbbQPPwYw7MOLSYIn5rqrDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RiWhx6d2; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RiWhx6d2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGr2xKtz3bps
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:28 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIGRXha000631;
	Wed, 19 Nov 2025 06:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=lB+cbVN4Fmg5YKNDf
	NdeBco/d5wz2KyzZ0je1NFddos=; b=RiWhx6d2HYIxOXBv5IPHvU3Ku5g9pgUXY
	lOhfUhoNMj/TpzqyVN6z6saS1XNUgNIrWRE8nX84y7QPFp9aX/YdB8EcYiSbE3nO
	IAmboR8DdSOOcxXDXacSFUs3augreMtaflHBfyaT7zdXPJnTpGNXo+7TvwKT0udt
	szAmhMDY88I9J0XHYqiZiIOd0BrpNsYJh51Xdp5fTu2dpwY+sGDVeYTXYoShI8uY
	btvCIYwvYsrprlu5pk2/rPdyGhjTvfcL+EJ747G4DRxuiw97hLYga/In0kyN5+35
	vDwxImyV46rr6hCYFa5e18F7nm11nOmyMErRv9eJP//U3SIM5FKfA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:10 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6EL4l008768;
	Wed, 19 Nov 2025 06:22:10 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:10 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ4lFw6017335;
	Wed, 19 Nov 2025 06:22:09 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1pvkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6M5Iw25297256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6972920043;
	Wed, 19 Nov 2025 06:22:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A44820040;
	Wed, 19 Nov 2025 06:22:01 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:01 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 08/17] sched/rt: Don't select paravirt CPU for wakeup and push/pull rt task
Date: Wed, 19 Nov 2025 11:50:51 +0530
Message-ID: <20251119062100.1112520-9-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119062100.1112520-1-sshegde@linux.ibm.com>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691d6212 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=2Scwftyo7L3m9cOp47sA:9
X-Proofpoint-GUID: GhGYJbtrug5W5sezDSlLEgxqud-X_Off
X-Proofpoint-ORIG-GUID: UhACJ7BTkEdsSuImjiVivNYI4j3gD3cA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwzXpbqspGw8t
 TqTh+kf0BLhovPPpd8ZqZzvk8LJ3S1otv91OVf36CR+Zrw3zvU0LHhJu2pLudL/FSfsfAFFblbc
 Cu52u/VS/LhvgVZTLA7/T9u3gHQ6+gy5JGbn0jz9IxR/vb+RLKUeMoTv1yqqYd6f5mU+7YMJww8
 W9hKv/DN+tBsr3ABIjil+ujCKrRw6lrwVB5PgJX/wW4Z5sSGNTl0xaJWg31f4KCE+qxtFbfH4uy
 OX/rEnRMG5d/+1CLLx/CB2LVPcvSaErvj5NjrkWK1y1FwKyqLErT9UQBmpN88sCFQ9S0LuDjzvM
 4vRhyPpngDzWAOHXftZxRBmphCi8DdaOXvFpL0wXitiLKVmo39LXCKimn8k/i3H/XacvUT0TorR
 Mt1Kl1DYG63qn7B2scQOO8xW2V3uXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
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


