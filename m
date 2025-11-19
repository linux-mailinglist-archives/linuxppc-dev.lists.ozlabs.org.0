Return-Path: <linuxppc-dev+bounces-14350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45487C6E8CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:45:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLmy4qYVz3dJR;
	Wed, 19 Nov 2025 23:45:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556338;
	cv=none; b=QIf1LPwKJiQa5+RKKS8ZQj3w48o0ZEKfgXgZMeTPLjIl4+Sr+zc1/fikT6lj1Eclw9OTQmBreOfV9px6eIWnH0iLWBGByhlSrLDKgqzusV+Sug/fAi7oWghZ3XuE9wOGHQurMDAeCujEW9nrs+szEi2KMXz0szh5L5nI5NxTHyFvr577HSoA05nN+QUpe8dMyQBRrTsvModJgHKOKkMuFMvmwZlGzqv/I2nwi8AYrHtFQHdjpr0HOhyRR1sfbesd3IwkXaqPz2Zyp70B64vaTQmgoTnri2hjE5x+nQWZe4zlyW8pO+HbQgacKQEfeETKicFwS2nKSpStYRTeeusqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556338; c=relaxed/relaxed;
	bh=TdgnQQqw3dse0Fr7rtbUgEkaeZgAUCl9B4/S5gvCyY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBoN4uURUehN02O5A5A+5uXXJqMQn3YlPQNZjQxXK6Er3CJT4JoG+somJAvT2EFhZ0eC4FeDVshrBmfKuIquxdROplyVwT/EEkKatfAo72h1IM5jqBq4YPtfqV5E4rAmMdEqQUCcnkqrJLtbbhTtEAZr3PORpjUiwTRKyugJ2WypB/sYk6GwnhV0qi4KaDHc7Mf8fo+BGTAyN9alTkXiFNYcxxCs+4bqvqtkvQMczlknz8AIEwGQ0sVZiNoqLWyefwhDwYXUrCpGnp372aUzxzSo80r+PsSijXrErZtTToPm5b2jqsWPBGDw4zDxMzv4hsBZWyqvhM4KALu1l6ebvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zm0w65hJ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zm0w65hJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLmx4glGz3dJB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:45:37 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ8KJAR030703;
	Wed, 19 Nov 2025 12:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TdgnQQqw3dse0Fr7r
	tbUgEkaeZgAUCl9B4/S5gvCyY4=; b=Zm0w65hJyWnfp24pjU+L5sZA1cgYHTCnL
	YLxt893lt9VCQQ5dFvzU2Rq3r8/7uuDgbuKjsl8c2/WI95PoBPyVG+X8KTXwyCb/
	YdttqdrZlWRtgvnsRv7PU8rcP9qqokQjcV4RhxnQaknUb8UMRSyOPCno3U8oVO5j
	TPAtvwHnt20iLgBFxSA+OkUbjS68wlwcEZdUBahoJOrsoBsqIawLM813Rk1bH0k6
	bhhELc8kmkbr/NrpZrepCDWrPr7TZRKEo24vQTv0k5KOLbUNlEB1Jzy/Dkd01GUC
	Y3x/oEtqSAPt3tJx7UlVg5t8bBpRDTsNZ8KTRiN7bylhRihAlLb0Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw8fbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:17 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCjGr7015003;
	Wed, 19 Nov 2025 12:45:16 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw8fbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJCHdw2017319;
	Wed, 19 Nov 2025 12:45:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1rcaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:15 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjBSB58327408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D64AB20043;
	Wed, 19 Nov 2025 12:45:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAEDA20040;
	Wed, 19 Nov 2025 12:45:07 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:07 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 03/17] sched/core: Dont allow to use CPU marked as paravirt
Date: Wed, 19 Nov 2025 18:14:35 +0530
Message-ID: <20251119124449.1149616-4-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691dbbdd cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=uXBPIk7YWzXHA4pK:21 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=P8M16rivtmrVeddd8boA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+88NmJCzFF+z
 p2JgKeRuT2UBw1Xc1tb7C/0+13+AvFKoOXdKQJcMtGx8PykUFeiLR5/GEbuLNvZSgHLrs4cXjj4
 NaUS7Vno6/S40RlHA1nCO7OsHWcWRUYL4uHw+/OyCSqpoIagkNgNQfIJpoEMISkSrPMKLnlJYa7
 SZuFwv+ikdXm6dlH7jIhfYnExkSWlWasxjjgnCXgYFN4kFGrHxmR8yg3gO4DOko929tQi2VbhBb
 tpoF57Q3t2QVHqs4xn+EKHtzlCVKmOXQy9irjxc7XvC1r/ITFTAnIi/qADwUpDXl9Awrge2bgEY
 go8m/882ZsOzy7+bmFvfNZQvA+xlEYbhjfGAhW7WcAbP5d5h5RnBXMODOYmyXJ3/z713s1P+JdZ
 u4wjDfwEhEVoXViVrYUEN2R/P+05bg==
X-Proofpoint-GUID: vw7_NsIAk2cZqNBvjGxQNDHy46UTcYUr
X-Proofpoint-ORIG-GUID: qdSjYMpwCHZoj85jCh5fosZgVY_O6JZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Don't allow a paravirt CPU to be used while looking for a CPU to use.

Push task mechanism uses stopper thread which going to call
select_fallback_rq and use this mechanism to avoid picking a paravirt CPU.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 40db5e659994..90fc04d84b74 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2397,8 +2397,13 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 		return cpu_online(cpu);
 
 	/* Non kernel threads are not allowed during either online or offline. */
-	if (!(p->flags & PF_KTHREAD))
-		return cpu_active(cpu);
+	if (!(p->flags & PF_KTHREAD)) {
+		/* A user thread shouldn't be allowed on a paravirt cpu */
+		if (cpu_paravirt(cpu))
+			return false;
+		else
+			return cpu_active(cpu);
+	}
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2408,6 +2413,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
+	/* Non percpu kthreads should stay away from paravirt cpu*/
+	if (cpu_paravirt(cpu))
+		return false;
+
 	/* But are allowed during online. */
 	return cpu_online(cpu);
 }
-- 
2.47.3


