Return-Path: <linuxppc-dev+bounces-13486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62FC18617
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 07:09:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxGz61C2mz3bfN;
	Wed, 29 Oct 2025 17:09:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761718145;
	cv=none; b=GIPO4EgYkHdA3IaxcTmO0Avn+Vb6W05dIJOtjYmyp6EA7B8qiaVTgZfoKIvduStFai8GfY/mF6ceM1v04+6zb3hPaoWS9lXb4UNn4G9DDOrDzlELIMqvuCPM/T20x3+/DwyYjLGdp8ahciAfVSjEx+n9ItvojU6uY7giXcYGSvxAkmDhf9rqaflT5NYO+b4NMBrDZ1pjLhwokL+tYosFK/cY7hjGqtxL7al9uWoj50TZkyDQ/ABMrfIJmpZA+aMtkPc+zutFnDmpTPbZc0kv6cnyjwaueV/FA80TZBO2L6iW7OYkn+HQADLeKanjaXPUwmAxKzPLU7KmNwlYCTVmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761718145; c=relaxed/relaxed;
	bh=ps1y55yFkZDJJHaJzT5XTnVwMJdcxOX64Tonof/saTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hiTdutDuw+0YGd6Q2bOPeSRpKdIlBW7yqJq7gwgNTICCn6WFJ+Q2ef9Nqy0N8cis43uM4OurCRhjBktF0FCWR0xKrrqSaDqQBwZ4Wg71FoO3wMfetggH0ZNQ5h60wAr0WH3BuKEWfyAqk+jD+S8VwtJdbgm/0JAUQmCx2YxK2MrctWGGw+riAhi6kfr7Ou/E3fa9SQdKxwtN1YMHJRfYinkN1lAXew3OKAmATjOw88Wmow2iXSYb79ieNBjmie0ouFQLcGngzCkVTslX6eLBYvdxPCmjF/hicE9bxr0Dk9MslqOJYPF29s3FrlWFkFPmnFfCHFor4DownIlllfgE8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cgtp+m2m; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cgtp+m2m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxGz514K3z2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 17:09:04 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59SJlmJQ003300;
	Wed, 29 Oct 2025 06:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ps1y55yFkZDJJHaJzT5XTnVwMJdcxOX64Tonof/sa
	TI=; b=Cgtp+m2mu3//ogUFuDm9g9t7bQNXVgekR89EtD6pkG8iQu4t/R1RFSj0c
	mbGWiJsMf9C1bY6NNIRdAvADrJ8U1I9KoHfmW9QlPglirLwcssvka16JvDxRtzBM
	4mRQFBGk69IvTjT0qme9T9JnQb21EsW7yUj3MFKNv2fcmU26qeF2JxyMKTHK8vcM
	sPnMjlesb5wHwRSlJyIoxBiaJ/QdRF/icISGMSvjQrzH2txrpxVoq8HsKoIZiEJo
	Ecl+GiD59nZ1bCoFSX4ZhRvkhAy1OZhUcv0g/B5e96LXZHU7sqesHosx/fZAkZ8t
	Wnlu+T3Ayb98ML8g7ywp2UWmCpP9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34a8hs4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 06:08:16 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59T66LjC005756;
	Wed, 29 Oct 2025 06:08:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34a8hs4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 06:08:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T5EHEv030747;
	Wed, 29 Oct 2025 06:08:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a33wwhwv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 06:08:14 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59T68AsM38404548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Oct 2025 06:08:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 292AC2004B;
	Wed, 29 Oct 2025 06:08:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 526DF20043;
	Wed, 29 Oct 2025 06:08:07 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.124.209.85])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Oct 2025 06:08:07 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v2 1/2] sched/core: Option if steal should update CPU capacity
Date: Wed, 29 Oct 2025 11:37:56 +0530
Message-ID: <20251029060757.2007601-1-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Authority-Analysis: v=2.4 cv=DYkaa/tW c=1 sm=1 tr=0 ts=6901af50 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=liBcvnYOncl2PUwJbjAA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: h2X_iKhAEMrh0TY-YEoxG37q14xdmpKm
X-Proofpoint-ORIG-GUID: KQuqysoGiHpUIT3mUc9hqjCZOaXJfFbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX7qO0/3/BN/ex
 5jhUY5fS3I6HTT7TKublsp1++/F2SnKo5yL8s4C0iLKT8/0Z9+k//QfTDn0wh/xOEmPnSllzSq+
 r7ZagXwLIp+5PCRDDd825VsKUUcmWm9KFxpPTHaZt+ppjel79twFjp6Codn6TBjHc2MSXFPz5s4
 ayX3lIa/pyoyXC/n25tZr3ZkLqbbZTHST0NkLwzw/kNQFDcYnMrWVlnmu35QEwIJXH4xAExv+OQ
 JuP/wosnAWBrR5pwigCHfZTJORj5Zua+ayt362pFN8dMBGazEqO7udfSlsq+A3YCs9vTRCAAa8L
 OjK2barCPToHgw6lZH0PccjFfUavIyehx5Au9UwFH28klJLujVQHuBil8NkFNot8YjxGySvpJeP
 pgZM/xro2KnTZdU+aMZRQ+6o5glr2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

At present, scheduler scales CPU capacity for fair tasks based on time
spent on irq and steal time. If a CPU sees irq or steal time, its
capacity for fair tasks decreases causing tasks to migrate to other CPU
that are not affected by irq and steal time. All of this is gated by
scheduler feature NONTASK_CAPACITY.

In virtualized setups, a CPU that reports steal time (time taken by the
hypervisor) can cause tasks to migrate unnecessarily to sibling CPUs that
appear to be less busy, only for the situation to reverse shortly.

To mitigate this ping-pong behaviour, this change introduces a new
static branch sched_acct_steal_cap which will control whether steal time
contributes to non-task capacity adjustments (used for fair scheduling).

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
Changelog v1->v2:
v1: https://lkml.kernel.org/r/20251028104255.1892485-1-srikar@linux.ibm.com
Peter suggested to use static branch instead of sched feat

 include/linux/sched/topology.h |  6 ++++++
 kernel/sched/core.c            | 15 +++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 198bb5cc1774..88e34c60cffd 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -285,4 +285,10 @@ static inline int task_node(const struct task_struct *p)
 	return cpu_to_node(task_cpu(p));
 }
 
+#ifdef CONFIG_HAVE_SCHED_AVG_IRQ
+extern void sched_disable_steal_acct(void);
+#else
+static __always_inline void sched_disable_steal_acct(void) { }
+#endif
+
 #endif /* _LINUX_SCHED_TOPOLOGY_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 81c6df746df1..09884da6b085 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -738,6 +738,14 @@ struct rq *task_rq_lock(struct task_struct *p, struct rq_flags *rf)
 /*
  * RQ-clock updating methods:
  */
+#ifdef CONFIG_HAVE_SCHED_AVG_IRQ
+static DEFINE_STATIC_KEY_TRUE(sched_acct_steal_cap);
+
+void sched_disable_steal_acct(void)
+{
+	return static_branch_disable(&sched_acct_steal_cap);
+}
+#endif
 
 static void update_rq_clock_task(struct rq *rq, s64 delta)
 {
@@ -792,8 +800,11 @@ static void update_rq_clock_task(struct rq *rq, s64 delta)
 	rq->clock_task += delta;
 
 #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
-	if ((irq_delta + steal) && sched_feat(NONTASK_CAPACITY))
-		update_irq_load_avg(rq, irq_delta + steal);
+	if ((irq_delta + steal) && sched_feat(NONTASK_CAPACITY)) {
+		if (steal && static_branch_likely(&sched_acct_steal_cap))
+			irq_delta += steal;
+		update_irq_load_avg(rq, irq_delta);
+	}
 #endif
 	update_rq_clock_pelt(rq, delta);
 }
-- 
2.47.3


