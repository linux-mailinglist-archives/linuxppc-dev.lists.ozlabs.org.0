Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0D82921F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 06:33:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF3lZ2K5rzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 15:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U1ZFN2VC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF3dd17JzzDqZD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 15:27:48 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09J42Nq2135534; Mon, 19 Oct 2020 00:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9o1kNGYWf321ixQGxPr1DGpxv0IeGFh+c+sb/uYgNdU=;
 b=U1ZFN2VCNS+6zAyIQgPE/oeSd+lA7nFa+oAuaSY97af5WRkiRzFaw/y+FO87YYAa7ThW
 51/mA05WH6i8CwzaK06b2ICXsP1f+ebsvvVD0rOpilrtF/VXD0lRdT8cd68p13p5buj+
 sxM87ZW/WOXozjw99rNh8WJEcnL/5uf+CcgdMkTVSwI3RQ8vX6y4GT3Y6UlwWfoedSyj
 MDVwLtWePgIqe+1veIHMVfbb4lX+5GBn+TmNGQXtl3IfBvAr0MOERN/hQM1ke2yRVV4D
 tN8ucR4obuMHEN6I+ZHg/7Au2Tz1e8iiJ8WyjL5oUF7KaT0Ni87Sct/qU3xfdN2jIwMl uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3493d4rgg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 00:27:35 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09J4JpZO178155;
 Mon, 19 Oct 2020 00:27:35 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3493d4rgft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 00:27:35 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09J4RXAc031948;
 Mon, 19 Oct 2020 04:27:33 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 348d5qrump-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 04:27:33 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09J4RVpV32964898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 04:27:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 374BDA404D;
 Mon, 19 Oct 2020 04:27:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7D34A4055;
 Mon, 19 Oct 2020 04:27:28 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.79.221.103])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 04:27:28 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc/smp: Use GFP_ATOMIC while allocating tmp mask
Date: Mon, 19 Oct 2020 09:57:16 +0530
Message-Id: <20201019042716.106234-3-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019042716.106234-1-srikar@linux.vnet.ibm.com>
References: <20201019042716.106234-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-18_13:2020-10-16,
 2020-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010190028
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
mask with GFP_ATOMIC flag. Also instead of having to allocate twice,
allocate the mask in the caller so that we only have to allocate once.
If the allocation fails, assume the mask to be same as sibling mask, which
will make the scheduler to drop this domain for this CPU.

Fixes: 70a94089d7f7 ("powerpc/smp: Optimize update_coregroup_mask")
Fixes: 3ab33d6dc3e9 ("powerpc/smp: Optimize update_mask_by_l2")
Reported-by: Qian Cai <cai@redhat.com>
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
Changelog v1->v2:
https://lore.kernel.org/linuxppc-dev/20201008034240.34059-1-srikar@linux.vnet.ibm.com/t/#u
Updated 2nd patch based on comments from Michael Ellerman
- Remove the WARN_ON.
- Handle allocation failures in a more subtle fashion
- Allocate in the caller so that we allocate once.

 arch/powerpc/kernel/smp.c | 57 +++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index a864b9b3228c..028479e9b66b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1257,38 +1257,33 @@ static struct device_node *cpu_to_l2cache(int cpu)
 	return cache;
 }
 
-static bool update_mask_by_l2(int cpu)
+static bool update_mask_by_l2(int cpu, cpumask_var_t *mask)
 {
 	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
 	struct device_node *l2_cache, *np;
-	cpumask_var_t mask;
 	int i;
 
 	if (has_big_cores)
 		submask_fn = cpu_smallcore_mask;
 
 	l2_cache = cpu_to_l2cache(cpu);
-	if (!l2_cache) {
-		/*
-		 * If no l2cache for this CPU, assume all siblings to share
-		 * cache with this CPU.
-		 */
+	if (!l2_cache || !*mask) {
+		/* Assume only core siblings share cache with this CPU */
 		for_each_cpu(i, submask_fn(cpu))
 			set_cpus_related(cpu, i, cpu_l2_cache_mask);
 
 		return false;
 	}
 
-	alloc_cpumask_var_node(&mask, GFP_KERNEL, cpu_to_node(cpu));
-	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
+	cpumask_and(*mask, cpu_online_mask, cpu_cpu_mask(cpu));
 
 	/* Update l2-cache mask with all the CPUs that are part of submask */
 	or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
 
 	/* Skip all CPUs already part of current CPU l2-cache mask */
-	cpumask_andnot(mask, mask, cpu_l2_cache_mask(cpu));
+	cpumask_andnot(*mask, *mask, cpu_l2_cache_mask(cpu));
 
-	for_each_cpu(i, mask) {
+	for_each_cpu(i, *mask) {
 		/*
 		 * when updating the marks the current CPU has not been marked
 		 * online, but we need to update the cache masks
@@ -1298,15 +1293,14 @@ static bool update_mask_by_l2(int cpu)
 		/* Skip all CPUs already part of current CPU l2-cache */
 		if (np == l2_cache) {
 			or_cpumasks_related(cpu, i, submask_fn, cpu_l2_cache_mask);
-			cpumask_andnot(mask, mask, submask_fn(i));
+			cpumask_andnot(*mask, *mask, submask_fn(i));
 		} else {
-			cpumask_andnot(mask, mask, cpu_l2_cache_mask(i));
+			cpumask_andnot(*mask, *mask, cpu_l2_cache_mask(i));
 		}
 
 		of_node_put(np);
 	}
 	of_node_put(l2_cache);
-	free_cpumask_var(mask);
 
 	return true;
 }
@@ -1349,40 +1343,46 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
 	}
 }
 
-static void update_coregroup_mask(int cpu)
+static void update_coregroup_mask(int cpu, cpumask_var_t *mask)
 {
 	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
-	cpumask_var_t mask;
 	int coregroup_id = cpu_to_coregroup_id(cpu);
 	int i;
 
-	alloc_cpumask_var_node(&mask, GFP_KERNEL, cpu_to_node(cpu));
-	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
-
 	if (shared_caches)
 		submask_fn = cpu_l2_cache_mask;
 
+	if (!*mask) {
+		/* Assume only siblings are part of this CPU's coregroup */
+		for_each_cpu(i, submask_fn(cpu))
+			set_cpus_related(cpu, i, cpu_coregroup_mask);
+
+		return;
+	}
+
+	cpumask_and(*mask, cpu_online_mask, cpu_cpu_mask(cpu));
+
 	/* Update coregroup mask with all the CPUs that are part of submask */
 	or_cpumasks_related(cpu, cpu, submask_fn, cpu_coregroup_mask);
 
 	/* Skip all CPUs already part of coregroup mask */
-	cpumask_andnot(mask, mask, cpu_coregroup_mask(cpu));
+	cpumask_andnot(*mask, *mask, cpu_coregroup_mask(cpu));
 
-	for_each_cpu(i, mask) {
+	for_each_cpu(i, *mask) {
 		/* Skip all CPUs not part of this coregroup */
 		if (coregroup_id == cpu_to_coregroup_id(i)) {
 			or_cpumasks_related(cpu, i, submask_fn, cpu_coregroup_mask);
-			cpumask_andnot(mask, mask, submask_fn(i));
+			cpumask_andnot(*mask, *mask, submask_fn(i));
 		} else {
-			cpumask_andnot(mask, mask, cpu_coregroup_mask(i));
+			cpumask_andnot(*mask, *mask, cpu_coregroup_mask(i));
 		}
 	}
-	free_cpumask_var(mask);
 }
 
 static void add_cpu_to_masks(int cpu)
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
+	cpumask_var_t mask;
 	int i;
 
 	/*
@@ -1396,10 +1396,15 @@ static void add_cpu_to_masks(int cpu)
 			set_cpus_related(i, cpu, cpu_sibling_mask);
 
 	add_cpu_to_smallcore_masks(cpu);
-	update_mask_by_l2(cpu);
+
+	/* In CPU-hotplug path, hence use GFP_ATOMIC */
+	alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
+	update_mask_by_l2(cpu, &mask);
 
 	if (has_coregroup_support())
-		update_coregroup_mask(cpu);
+		update_coregroup_mask(cpu, &mask);
+
+	free_cpumask_var(mask);
 }
 
 /* Activate a secondary processor. */
-- 
2.18.2

