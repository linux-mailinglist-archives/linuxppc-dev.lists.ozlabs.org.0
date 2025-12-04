Return-Path: <linuxppc-dev+bounces-14608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E350DCA4D1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:55:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhy25BWrz2xJ8;
	Fri, 05 Dec 2025 04:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870954;
	cv=none; b=UXNmPx99S6pBKLbrXtN1s/G3ZrQLtEQDim8xD+msdHS+6ukol9ArmmBb8NGYofqaq3ckRRpzheVQWQvIOu0X2GiFfK5QhsRwNHtbDq09cLxnKk5aKZhFPd+fBZs49giMtT1ru+IHPNYuffz+Fj7PCicZnlt9YOlcAO7LacaWgKzJ7W9/cjVc1lyKYi7fKtRsIzdbu98JNbpGbYT84uWnvjQTffuJjkmntEZG9zcDmUKtsoZfmN1SGnLCCrTMiTehreCgn49mwdGxZEy3MGsUOoFQXmxtRh+tTQCtd/Wm8DrGsbmbcT6pekkAsOCKV7Ku069WXo15u98k+vdQpNaRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870954; c=relaxed/relaxed;
	bh=C6cLDbx1EBc/TgbiE7lRqMqL23tRUH4UTqj083YxY7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRqNzNzgz0n1OkKWHDPIqp9wlvpj7nZRaRkGgLvZ+nN4LPbP0V0wlkRH4SFqcz+cuy4y5exAdgm3UAcs9RE3de7EoO4J97nD640sVCCECyCyd/WBSSH9eFLEZPmM7uKdJy1tAuPuixhHurilyEplqGz1ga6yDJGA2ItzKAXvXlsxnLUgUGJ6FyqT/8c8AChPH59Y+I4wQhzn6x0AZAXKXifkTeu5ORfbn8XjYJiq2EkenCjT1YIvcq0gLDWZcl8EaLQ7wx8/aAVf6N78GAGREMtAyHB4UZI5/GHdBywRjVoBKCKQMXGSZB1nkbYtIjQWxKmXBgTopbfcMEYEaqchVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dSz3Qteo; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dSz3Qteo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhy16JvWz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:55:53 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4EhQnB026734;
	Thu, 4 Dec 2025 17:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=C6cLDbx1EBc/TgbiE
	7lRqMqL23tRUH4UTqj083YxY7I=; b=dSz3QteoZihaY3G63NlGo3QkcuW2nD2wm
	JsgDWdWJbOrEw0GjWOtKVfz2vobB5UCWaKVuLYBIHAEkYXp9rKZ6mNXrexb2k+fl
	rD6ffuU4Q57Y7FZGd6A7YMK0QV34jf0Io+RpI9M+TKtQT42YhNP/nNcmpDBvJAmu
	mS3YcMeUJ/s5+yURNVoQRt4sbxHz35giM/XoSsUE9OAASjUJN3kkQNPVk+rLw7Ou
	71ws1NM1/8LwI3/Ge8+SNVJ+bkqaeDhotK4d2rW6cMqviSPO9JTu4+a1/1FIdFBT
	RAUnY9XjZhklNhQMCP4ndbRYSbh6w0ZYP0dnfTh08tg9nMNyUIn+Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh79vs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:23 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4Hg50o026211;
	Thu, 4 Dec 2025 17:55:22 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh79vrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:22 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4GHegC021731;
	Thu, 4 Dec 2025 17:55:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4at8c6jb88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:21 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HtHg536176220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 501FF20043;
	Thu,  4 Dec 2025 17:55:17 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD5CF20040;
	Thu,  4 Dec 2025 17:55:13 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:13 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Peter Zijlstra <peterz@infradead.org>
Cc: Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux.dev, Yicong Yang <yangyicong@hisilicon.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 01/17] sched/fair: Enable group_asym_packing in find_idlest_group
Date: Thu,  4 Dec 2025 23:23:49 +0530
Message-ID: <20251204175405.1511340-2-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251204175405.1511340-1-srikar@linux.ibm.com>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=dK+rWeZb c=1 sm=1 tr=0 ts=6931cb0b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=ckJkcgXifS0MwuEMmiIA:9
X-Proofpoint-GUID: p4N8cC9Ej_pjMTdg3tr_-fwWHO81rS5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX0K8Nzru4dAWO
 R21IXfvwbKS6T23j3HTsfBhZDUgKtDtSPvyQwaLvwmvQoWurdWjAK1orhWzXRb6zLZkMkqtagbh
 cwQQSnroNmxxRlKg5UpvOyEFMz71lfnTcFvu+LsFfltRoXaEBU6S4ogQySOieivCEEaswIQkoyr
 6N1yeWfz8uPTXAD2Z0/bzmRK7eqh96GJYdOrhiIgGZwHSeDQhoa/YUQBNsz4w0i8L91ha7qCUCU
 J1A7miRZn29e9BCBXq11G1DzPLzNJKPoN8KO3NPfL75CFcykn1lNsswjHJC0lLz1tsmsOtjFFzY
 Pgh2RdtQUmwSSC2lum0ojc2AloRjrQt1SEGN191igbdM3zJq5+kQa+fxBZAFlJWaiIwf6vYaWgK
 xPCRX7MjiFjLn/yXO3dMMSVh3KfXow==
X-Proofpoint-ORIG-GUID: 343_fIdgCxRbnqSTtODuZ3sGy1Qu_OmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Current scheduler code doesn't handle SD_ASYM_PACKING in the
find_idlest_cpu path. On few architectures, like Powerpc, cache is at a
core. Moving threads across cores may end up in cache misses.

While asym_packing can be enabled above SMT level, enabling Asym packing
across cores could result in poorer performance due to cache misses.
However if the initial task placement via find_idlest_cpu does take
asym_packing into consideration, then scheduler can avoid asym_packing
migrations. This will result in lesser migrations and better packing and
better overall performance.

Previous version was posted at
https://lore.kernel.org/all/20231018155036.2314342-1-srikar@linux.vnet.ibm.com/t

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 kernel/sched/fair.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5b752324270b..979c3e333fba 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10664,11 +10664,13 @@ static int idle_cpu_without(int cpu, struct task_struct *p)
  * @group: sched_group whose statistics are to be updated.
  * @sgs: variable to hold the statistics for this group.
  * @p: The task for which we look for the idlest group/CPU.
+ * @this_cpu: current cpu
  */
 static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 					  struct sched_group *group,
 					  struct sg_lb_stats *sgs,
-					  struct task_struct *p)
+					  struct task_struct *p,
+					  int asym_prefer_cpu)
 {
 	int i, nr_running;
 
@@ -10705,6 +10707,12 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 
 	}
 
+	if (asym_prefer_cpu != READ_ONCE(group->asym_prefer_cpu) &&
+			sched_asym(sd, READ_ONCE(group->asym_prefer_cpu),
+			READ_ONCE(asym_prefer_cpu))) {
+		sgs->group_asym_packing = 1;
+	}
+
 	sgs->group_capacity = group->sgc->capacity;
 
 	sgs->group_weight = group->group_weight;
@@ -10721,7 +10729,8 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 				sgs->group_capacity;
 }
 
-static bool update_pick_idlest(struct sched_group *idlest,
+static bool update_pick_idlest(struct sched_domain *sd,
+			       struct sched_group *idlest,
 			       struct sg_lb_stats *idlest_sgs,
 			       struct sched_group *group,
 			       struct sg_lb_stats *sgs)
@@ -10745,8 +10754,11 @@ static bool update_pick_idlest(struct sched_group *idlest,
 			return false;
 		break;
 
-	case group_imbalanced:
 	case group_asym_packing:
+		return sched_asym(sd, READ_ONCE(group->asym_prefer_cpu),
+				READ_ONCE(idlest->asym_prefer_cpu));
+
+	case group_imbalanced:
 	case group_smt_balance:
 		/* Those types are not used in the slow wakeup path */
 		return false;
@@ -10790,6 +10802,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 			.avg_load = UINT_MAX,
 			.group_type = group_overloaded,
 	};
+	int asym_prefer_cpu;
 
 	do {
 		int local_group;
@@ -10812,10 +10825,12 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		} else {
 			sgs = &tmp_sgs;
 		}
+		if (!local || local_group)
+			asym_prefer_cpu = READ_ONCE(group->asym_prefer_cpu);
 
-		update_sg_wakeup_stats(sd, group, sgs, p);
+		update_sg_wakeup_stats(sd, group, sgs, p, asym_prefer_cpu);
 
-		if (!local_group && update_pick_idlest(idlest, &idlest_sgs, group, sgs)) {
+		if (!local_group && update_pick_idlest(sd, idlest, &idlest_sgs, group, sgs)) {
 			idlest = group;
 			idlest_sgs = *sgs;
 		}
@@ -10845,6 +10860,14 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 	if (local_sgs.group_type > idlest_sgs.group_type)
 		return idlest;
 
+	if (idlest_sgs.group_type == group_asym_packing) {
+		if (sched_asym(sd, READ_ONCE(idlest->asym_prefer_cpu),
+				READ_ONCE(local->asym_prefer_cpu))) {
+			return idlest;
+		}
+		return NULL;
+	}
+
 	switch (local_sgs.group_type) {
 	case group_overloaded:
 	case group_fully_busy:
-- 
2.43.7


