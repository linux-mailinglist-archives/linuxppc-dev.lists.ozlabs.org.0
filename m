Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D923C286D42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 05:44:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6HBj6CdCzDqTk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 14:44:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TjPQw2zR; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6H972Nj3zDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 14:43:07 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0983W0x0101844; Wed, 7 Oct 2020 23:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=A+HyoPe3SpSF2CjI1SR2p5fjP9Q16+V7O0gnGEfz/5A=;
 b=TjPQw2zR3y615zF0fGc0T3ghEKa2hDTkM7SCmUmpq1dqjnBDdYoFwYPB/vuJDSR7L2N6
 kYFAPOYSmR8o9epSLc+eOVZgpexsFyTF8L6qhyOrYNsRQC6Osj0XuI03ZJjcyUOcwNXd
 LpMvYRXTEIqihWC0Ak7F57pA0NZ5t81fLDbmMQF5DFo79TZwhOb8BkQg6JhmC3jMw98n
 a9I2UOWbd+sb6AnXEly1q6JIY6eliSGwLXFvOM69Ol+s+HftwLmJIP1hgFE6RLZuPEiV
 7mJozXTpejC5e50aiFkJCYYPbBMIq4+rXh7rCn+BZcQG2Z9/ro5IwwSZHM7N03hn5mp6 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341t2v9aaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 23:42:53 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0983bGm3115534;
 Wed, 7 Oct 2020 23:42:53 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341t2v9aa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 23:42:53 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0983UWXF028650;
 Thu, 8 Oct 2020 03:42:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 33xgx82hu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 03:42:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0983gn4C25297354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 03:42:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2ACE1A4053;
 Thu,  8 Oct 2020 03:42:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAE5AA4051;
 Thu,  8 Oct 2020 03:42:46 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.77.205.56])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 03:42:46 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/smp: Use GFP_ATOMIC while allocating tmp mask
Date: Thu,  8 Oct 2020 09:12:40 +0530
Message-Id: <20201008034240.34059-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_01:2020-10-07,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010080027
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Qian Cai <cai@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai reported a regression where CPU Hotplug fails with the latest
powerpc/next

BUG: sleeping function called from invalid context at mm/slab.h:494
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/88
no locks held by swapper/88/0.
irq event stamp: 18074448
hardirqs last  enabled at (18074447): [<c0000000001a2a7c>] tick_nohz_idle_enter+0x9c/0x110
hardirqs last disabled at (18074448): [<c000000000106798>] do_idle+0x138/0x3b0
do_idle at kernel/sched/idle.c:253 (discriminator 1)
softirqs last  enabled at (18074440): [<c0000000000bbec4>] irq_enter_rcu+0x94/0xa0
softirqs last disabled at (18074439): [<c0000000000bbea0>] irq_enter_rcu+0x70/0xa0
CPU: 88 PID: 0 Comm: swapper/88 Tainted: G        W         5.9.0-rc8-next-20201007 #1
Call Trace:
[c00020000a4bfcf0] [c000000000649e98] dump_stack+0xec/0x144 (unreliable)
[c00020000a4bfd30] [c0000000000f6c34] ___might_sleep+0x2f4/0x310
[c00020000a4bfdb0] [c000000000354f94] slab_pre_alloc_hook.constprop.82+0x124/0x190
[c00020000a4bfe00] [c00000000035e9e8] __kmalloc_node+0x88/0x3a0
slab_alloc_node at mm/slub.c:2817
(inlined by) __kmalloc_node at mm/slub.c:4013
[c00020000a4bfe80] [c0000000006494d8] alloc_cpumask_var_node+0x38/0x80
kmalloc_node at include/linux/slab.h:577
(inlined by) alloc_cpumask_var_node at lib/cpumask.c:116
[c00020000a4bfef0] [c00000000003eedc] start_secondary+0x27c/0x800
update_mask_by_l2 at arch/powerpc/kernel/smp.c:1267
(inlined by) add_cpu_to_masks at arch/powerpc/kernel/smp.c:1387
(inlined by) start_secondary at arch/powerpc/kernel/smp.c:1420
[c00020000a4bff90] [c00000000000c468] start_secondary_resume+0x10/0x14

Allocating a temporary mask while performing a CPU Hotplug operation
with CONFIG_CPUMASK_OFFSTACK enabled, leads to calling a sleepable
function from a atomic context. Fix this by allocating the temporary
mask with GFP_ATOMIC flag.

If there is a failure to allocate a mask, scheduler is going to observe
that this CPU's topology is broken. Instead of having to speculate why
the topology is broken, add a WARN_ON_ONCE.

Fixes: 70a94089d7f7 ("powerpc/smp: Optimize update_coregroup_mask")
Fixes: 3ab33d6dc3e9 ("powerpc/smp: Optimize update_mask_by_l2")
Reported-by: Qian Cai <cai@redhat.com>
Suggested-by: Qian Cai <cai@redhat.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Qian Cai <cai@redhat.com>
---
 arch/powerpc/kernel/smp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 0dc1b85..1268558 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1264,7 +1264,8 @@ static bool update_mask_by_l2(int cpu)
 		return false;
 	}
 
-	alloc_cpumask_var_node(&mask, GFP_KERNEL, cpu_to_node(cpu));
+	/* In CPU-hotplug path, hence use GFP_ATOMIC */
+	WARN_ON_ONCE(!alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu)));
 	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
 
 	if (has_big_cores)
@@ -1344,7 +1345,8 @@ static void update_coregroup_mask(int cpu)
 	int coregroup_id = cpu_to_coregroup_id(cpu);
 	int i;
 
-	alloc_cpumask_var_node(&mask, GFP_KERNEL, cpu_to_node(cpu));
+	/* In CPU-hotplug path, hence use GFP_ATOMIC */
+	WARN_ON_ONCE(!alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu)));
 	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
 
 	if (shared_caches)
-- 
1.8.3.1

