Return-Path: <linuxppc-dev+bounces-14319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55973C6CE51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGr6Yqlz2yvX;
	Wed, 19 Nov 2025 17:22:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533348;
	cv=none; b=cTk5Cin9YSssg3pL+iEUwpw4wL8BnnMKRWtUoqBE7JFhBqQPDxVHtSSxq0W16aLf35/qIAWH/6IyqoxV/FDRWsJ/b1+eUDJTxrdX7rXQyA1uc/gc3reQ43L94cSsW2rq5eFE+VcAAmvHLgMx1CbXr7PgeisiJ/wh5yEK96oA9Tk58f8unnvsLn+FECCxSdX3u1cqt3HHK97DMk2MZ9/Q3FMcyYPs4NekXginbM/H4DOZJXgjc0lGCbl5U2PaMpzpqXi5YNNjXdoFC8F/MOUtBT70ybWevgI/z0dLeY29d7Vj6z1UbUSIcdQHgMsLYWyo3K3J3lnWEoJegDmTTbW6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533348; c=relaxed/relaxed;
	bh=q6alubEg5FFRdzA8knogoUcxkGqjuD5s+4s7T3Fi5SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+ZfsdmtIndckeCjXC6WOZMBUaJteVhKAy+Xx8Ls6bU3npc427e4U/pquL8wn8agv62DfViXCQfLlfp8D83Zh0UiYwhkICAxoU/YGg1cR5B8O0M5m4r55vXcYG5CC9uKwj7MqRMtwvLnOipn7FcbueEVPBrjRwPGEeip75nERb7V7CGRPl2d3ZVwi6C6AM8HZmZru7ftX1O0EWQVkuQNOJQ11hK0VE13u8YwXaFWZ6rsVMGdTNI/uB4gtMq3WrZOLiMIr7BpDbHORP/R59+AKBUroV9f0N0em6TJBeUtZjmF7bHgUicFYwHZo24ofogOM0EHlVzsi/BRt9b85z1EHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T1GXYsC0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T1GXYsC0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGr1BXDz2yv4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:28 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIGx6dG012449;
	Wed, 19 Nov 2025 06:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=q6alubEg5FFRdzA8k
	nogoUcxkGqjuD5s+4s7T3Fi5SI=; b=T1GXYsC0Rs7uv/QHiNhLkDtg0GVzlFOXg
	F4ZiFaMYdaVFvbfo67nlCYWWGr+XImpUHhUcCjHDrl0V/yv+7hWy2CP8Jdo0cNox
	DTMvEGBbR+OTYnCdGRm9Temyjn/YOl+xa6JbUKUZh/dCOBMG8fAXfzxYSKBGP2Pk
	+4jGFgrMpxXJeIJ5pr+Ia7N8jJ36ssvutqEQWxuj8AlNGWxjkkcZ7DRgUrc/tx6N
	v2LAluLhSOmP1aKTNUl5Ld8Z2r1n1TThYIas5j/9M1T7M6TAe+f0RPmdtHNioKgk
	QA+WsenV/TAgNrsq/dM9BeJqIlrFOC0+f0IkCAYDUC4ir8FcXFYXA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk9xtwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:07 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6M6pl027580;
	Wed, 19 Nov 2025 06:22:06 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk9xtwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ3jUKI005065;
	Wed, 19 Nov 2025 06:22:05 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bk74xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6M1la44761456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 070FA20040;
	Wed, 19 Nov 2025 06:22:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD42620043;
	Wed, 19 Nov 2025 06:21:56 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:21:56 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 07/17] sched/fair: Don't consider paravirt CPUs for wakeup and load balance
Date: Wed, 19 Nov 2025 11:50:50 +0530
Message-ID: <20251119062100.1112520-8-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: cF_lEh42771D0-YaTBx9sLoeG2LKFKkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXww6d+AJsJnfR
 fT8GQ5fRbRHNoCUjDb1FjArXVHww0hOnR+1UQ97tNrMduaXnF5fMq+olgNOCQ99SeDse5fxzSg/
 tCeQCU8Gd/jMoq8IHjv7w2NJqvFsLRT/GIuzlhvG8TKTOcKtzUPXuB3vByBHG//B6rq1HXz79lv
 Cy+D3WrtiHHCub3C3pIicKRHF95kZzN/uM6sgXNw2WnCM/Uoa6HHABHpgYH1hKqSlaBLFvVY0uY
 24a3+J7Sdc4O24b41XFswSmME0JpZBf98War3JtFd3BH3oND9IcUFq8LuQfZR6F4zATFiDy+DNH
 Ptowp0cLFH3GJmldwx1C+RLheNZU3ubxBAwc2PBqbMuRnDYbbJowb1V50opn58UrRyPdEvhTP2u
 qDYZbcSBwJd7le57bk3ETOTMgUCn8A==
X-Proofpoint-ORIG-GUID: GCeqIjd_YWhNmc9mTCfS_4rOnvjb5ucD
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691d620f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=zGSZXhnX_8tdEcBSxkwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For CFS load balancer,
- mask out paravirt CPUs from list of cpus to balance.
- This helps to restrict/expand the workload depending on the mask.

At wakeup,
- If prev_cpu is paravirt, see if recent_used_cpu can be chosen.
If not choose current cpu.
- For EAS system, put a warning if wake up happens on paravirt CPU.
At this point, not expecting any EAS system will have a overcommit of
CPUs.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/fair.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 015e00b370c9..760813802cb9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7358,6 +7358,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
 {
 	int target = nr_cpumask_bits;
 
+	if (cpu_paravirt(prev_cpu))
+		return this_cpu;
+
 	if (sched_feat(WA_IDLE))
 		target = wake_affine_idle(this_cpu, prev_cpu, sync);
 
@@ -7441,6 +7444,11 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
 {
 	int new_cpu = cpu;
 
+	if (cpu_paravirt(prev_cpu)) {
+		schedstat_inc(p->stats.nr_wakeups_paravirt);
+		return cpu;
+	}
+
 	if (!cpumask_intersects(sched_domain_span(sd), p->cpus_ptr))
 		return prev_cpu;
 
@@ -7777,10 +7785,25 @@ static int select_idle_sibling(struct task_struct *p, int this_cpu, int prev, in
 	unsigned long task_util, util_min, util_max;
 	int i, recent_used_cpu, prev_aff = -1;
 
+	/* Likely prev,target belong to same LLC, it is better at wakeup
+	 * to move away from them. at best return recent_used_cpu if it
+	 * is usable
+	 */
+	if (cpu_paravirt(prev) || cpu_paravirt(target)) {
+		schedstat_inc(p->stats.nr_wakeups_paravirt);
+
+		recent_used_cpu = p->recent_used_cpu;
+		if (!cpu_paravirt(recent_used_cpu))
+			return recent_used_cpu;
+		else
+			return this_cpu;
+	}
+
 	/*
 	 * On asymmetric system, update task utilization because we will check
 	 * that the task fits with CPU's capacity.
 	 */
+
 	if (sched_asym_cpucap_active()) {
 		sync_entity_load_avg(&p->se);
 		task_util = task_util_est(p);
@@ -8539,8 +8562,14 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 
 		if (!is_rd_overutilized(this_rq()->rd)) {
 			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
-			if (new_cpu >= 0)
+
+			/* System supporting Energy model isn't expected
+			 * have a CPU marked as paravirt
+			 */
+			if (new_cpu >= 0) {
+				WARN_ON_ONCE(cpu_paravirt(new_cpu));
 				return new_cpu;
+			}
 			new_cpu = prev_cpu;
 		}
 
@@ -11832,6 +11861,11 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 
 	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
 
+#ifdef CONFIG_PARAVIRT
+	/* Don't spread load to paravirt CPUs */
+	cpumask_andnot(cpus, cpus, cpu_paravirt_mask);
+#endif
+
 	schedstat_inc(sd->lb_count[idle]);
 
 redo:
-- 
2.47.3


