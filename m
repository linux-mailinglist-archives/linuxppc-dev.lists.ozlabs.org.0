Return-Path: <linuxppc-dev+bounces-12005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7FCB51F48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 19:45:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMSkP2cBFz3dXD;
	Thu, 11 Sep 2025 03:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757526285;
	cv=none; b=FqBzy5GLd4tALMpxLed1c7MqokLPnqFrpQAYFfqIDuamMyHec+LVGwAf+8agMftYqMIXMe8omuJZ9JR/b0Uc/nzgpTOLTpXsnGqDggzSyYJORzNSF0LmY6O5g1eyqow2CrK8IkGB+WltQQNJziLILC62zEHFcjXTyVHrv3XnBr/6xjFKHtQC2siMK288HD2NxjCOyTJO1VLbyBLFpXxKD3JAp9mAVZQc4/JN0THekin8Nx3VaUIoc6kyVvJNlt/qVRhdSV5ImgsexCNMshQ1rZ44lnbwWZvxvjKf8gTFjGoPnLZkRJslObrmzyL8P6r0lLq/tucLoZyETHGQnuxvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757526285; c=relaxed/relaxed;
	bh=iaUu/2Mp/mFQhPUVj/V6GK/8VPcAhvBlUTLxmuu18bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTMTwVRFUux7FuhS+Nf9ht30RdsBBRSiEH7wQ2M/gYXr94Ddht1DHWrjqk751Z78MJq8fTv/WLSPulFkM5d+28n8+sJv8/1vOZzxBOIZ3bi7lLOCX8aphFVt+XS6yuAC70LscZQJ5VW0dL/MsMdMTY2ZfddavcwmLu9qCk1TTGuzEYsX/GgXVsSrMC2DLMMHM1Ugr+XLoYlpbCoEpRjTj1d9MrheaTxqio6iYGrCSbZh59vkD8gpvkHJ+e8ajON6juWz8obV0wHpa1SATCvTkKCbd5ejW9mbVrbJHSZblJDFqowpA3RVH0kFa7X8iVK/aTW/KzlpN9YLC4PTRvCeog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fVRcdExs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fVRcdExs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMSkN4l5Vz3dSs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 03:44:44 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AHC6b2010054;
	Wed, 10 Sep 2025 17:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=iaUu/2Mp/mFQhPUVj
	/V6GK/8VPcAhvBlUTLxmuu18bU=; b=fVRcdExsEq/lurRhYhETyRqWi1AWgM1XL
	F1bXxLFhkJDx3G3dq8lC8xmdLniLpu9YLwtyuL3lPEqIT51kbx1v/aXzpEQ1DZhk
	MJqPdCdUYjd0Ne66Xej7rYdzgS0VDEo5aQ0oX+Rubimba9wrOfYCQc0qOAUbXGzm
	TfEENPNLm39cPY6HG6MHBQZSrW2TEh01KHsjxcaU6Cs3rfDH+8V2IVTG4I6/BKxO
	cQsWDjochq/pf0ykk4oyOkjsehqY8Pm28taaYRj8qKuVopyvNVqwl04BCYRsUQKZ
	3Jidxa0lRAxT3xxrDccAAh36widxMtWngPsNPN8n/yPwXrKzfV7KQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmwyvyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:20 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58AHVPeN011782;
	Wed, 10 Sep 2025 17:44:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmwyvyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58AEQSiI017181;
	Wed, 10 Sep 2025 17:44:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gmhhtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:18 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58AHiFFJ57278914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 17:44:15 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67C3B20043;
	Wed, 10 Sep 2025 17:44:15 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72A5A20040;
	Wed, 10 Sep 2025 17:44:08 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.208.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 17:44:08 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
Subject: [RFC PATCH v3 06/10] sched/rt: Don't select paravirt CPU for wakeup and push/pull rt task
Date: Wed, 10 Sep 2025 23:12:06 +0530
Message-ID: <20250910174210.1969750-7-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910174210.1969750-1-sshegde@linux.ibm.com>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: qB77xK9NkoyUW4MB-50D2C0xLM1hybVG
X-Proofpoint-ORIG-GUID: ELOQul7ZcdzQdqla_hyU-IJhN4BustFX
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c1b8f4 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=2Scwftyo7L3m9cOp47sA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX97gOgjcnKCEe
 j6FKsIVGBwWN9bFYnPU1HgWL+fN3xQHnhnWneRO0LFddvKIkbgWSCVk2iOLSqnFWz0V8jfnMQ2C
 CGVESnmbilpe5jiKeVCxD1ntmGzCBEIXn+GlQFnGqUr17MLAkjM0DhM6tIzJaZA5DdbRjuAQm0U
 2oVpdHGqwgbs5Jx/736AKldx6KJnjGIZOA5HdOglPhZvy/sbpoPbrnTZHKMH5KvIa8tLDZfwX8W
 QgtR0BUwUGD+csccuIBkrvKNxYyf0Gh9JXRcFz1ZytUapPbAn04onhD+PbFc+goVUqRiYLNoaMr
 sPi5PRDQxR5g93rTFnfY0UHi37QRSgYdFr4TWFTCL/70k/4C2pn7iLd/f2kZovifnNGLR9easTQ
 fvim3WTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
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
index 7936d4333731..54bfac66624b 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1552,6 +1552,9 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
 		if (!test && target != -1 && !rt_task_fits_capacity(p, target))
 			goto out_unlock;
 
+		/* Avoid moving to a paravirt CPU */
+		if (is_cpu_paravirt(target))
+			goto out_unlock;
 		/*
 		 * Don't bother moving it if the destination CPU is
 		 * not running a lower priority task.
@@ -1876,7 +1879,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 	for (tries = 0; tries < RT_MAX_TRIES; tries++) {
 		cpu = find_lowest_rq(task);
 
-		if ((cpu == -1) || (cpu == rq->cpu))
+		if ((cpu == -1) || (cpu == rq->cpu) || is_cpu_paravirt(cpu))
 			break;
 
 		lowest_rq = cpu_rq(cpu);
@@ -1974,7 +1977,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 			return 0;
 
 		cpu = find_lowest_rq(rq->curr);
-		if (cpu == -1 || cpu == rq->cpu)
+		if (cpu == -1 || cpu == rq->cpu || is_cpu_paravirt(cpu))
 			return 0;
 
 		/*
@@ -2237,6 +2240,10 @@ static void pull_rt_task(struct rq *this_rq)
 	if (likely(!rt_overload_count))
 		return;
 
+	/* There is no point in pulling the task towards a paravirt cpu */
+	if (is_cpu_paravirt(this_rq->cpu))
+		return;
+
 	/*
 	 * Match the barrier from rt_set_overloaded; this guarantees that if we
 	 * see overloaded we must also see the rto_mask bit.
-- 
2.47.3


