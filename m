Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D72FD2D47A6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 18:16:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrkH54xGxzDqd1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 04:16:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OWRrQjfF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crk6B23bwzDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 04:08:49 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9H3e4Z001932; Wed, 9 Dec 2020 12:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=qmPQFqq+7/r1LsAMvdw7oxcVroWSV6/GYiKrZPw268M=;
 b=OWRrQjfFCF1l1zJ8c8C+VmbzeKR855tsWP3UhKBWy0xB5S8SCAx4r+O/YiIMvLEaKOXC
 AWXQVhhDYyf22oyDheUfYJnQV75VqAPHMQ97MkX7/J4ofHfIhlytJ7SdqxQUch6caLdZ
 7Xhz2ICgEnsy34Kgj0S33jtAZKuWbtsBzwBHhttWmJ52WwcisWoSSbafq9g/y64suir4
 SjZlQphY69ZvsS4/Ze165CPTCazUBTIXaq9AOmXF2g6wm2hqKmdOiQi4YqKqhgi3Peb0
 dyDClkjay8jMWP6Zm8dmW+AXQ+vyiMrI0dxqK8kjfAwQ4MiEu7r06TBeD2klJ+KUQwoi hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ax9csnkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:08:35 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9H4JnD004605;
 Wed, 9 Dec 2020 12:08:34 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ax9csnk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:08:34 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9H59op027338;
 Wed, 9 Dec 2020 17:08:33 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3581u9h3ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:08:33 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9H8WAO14221746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:08:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96B66C605F;
 Wed,  9 Dec 2020 17:08:32 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B549EC6055;
 Wed,  9 Dec 2020 17:08:31 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.58.223])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:08:31 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 7DF1B2E35BA; Wed,  9 Dec 2020 22:38:28 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH v2 4/5] powerpc/smp: Add support detecting thread-groups
 sharing L2 cache
Date: Wed,  9 Dec 2020 22:38:19 +0530
Message-Id: <1607533700-5546-5-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607533700-5546-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607533700-5546-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012090120
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

On POWER systems, groups of threads within a core sharing the L2-cache
can be indicated by the "ibm,thread-groups" property array with the
identifier "2".

This patch adds support for detecting this, and when present, populate
the populating the cpu_l2_cache_mask of every CPU to the core-siblings
which share L2 with the CPU as specified in the by the
"ibm,thread-groups" property array.

On a platform with the following "ibm,thread-group" configuration
		 00000001 00000002 00000004 00000000
		 00000002 00000004 00000006 00000001
		 00000003 00000005 00000007 00000002
		 00000002 00000004 00000000 00000002
		 00000004 00000006 00000001 00000003
		 00000005 00000007

Without this patch, the sched-domain hierarchy for CPUs 0,1 would be
	CPU0 attaching sched-domain(s):
	domain-0: span=0,2,4,6 level=SMT
	domain-1: span=0-7 level=CACHE
	domain-2: span=0-15,24-39,48-55 level=MC
	domain-3: span=0-55 level=DIE

	CPU1 attaching sched-domain(s):
	domain-0: span=1,3,5,7 level=SMT
	domain-1: span=0-7 level=CACHE
	domain-2: span=0-15,24-39,48-55 level=MC
	domain-3: span=0-55 level=DIE

The CACHE domain at 0-7 is incorrect since the ibm,thread-groups
sub-array
[00000002 00000002 00000004
 00000000 00000002 00000004 00000006
 00000001 00000003 00000005 00000007]
indicates that L2 (Property "2") is shared only between the threads of a single
group. There are "2" groups of threads where each group contains "4"
threads each. The groups being {0,2,4,6} and {1,3,5,7}.

With this patch, the sched-domain hierarchy for CPUs 0,1 would be
     	CPU0 attaching sched-domain(s):
	domain-0: span=0,2,4,6 level=SMT
	domain-1: span=0-15,24-39,48-55 level=MC
	domain-2: span=0-55 level=DIE

	CPU1 attaching sched-domain(s):
	domain-0: span=1,3,5,7 level=SMT
	domain-1: span=0-15,24-39,48-55 level=MC
	domain-2: span=0-55 level=DIE

The CACHE domain with span=0,2,4,6 for CPU 0 (span=1,3,5,7 for CPU 1
resp.) gets degenerated into the SMT domain. Furthermore, the
last-level-cache domain gets correctly set to the SMT sched-domain.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/smp.h |  1 +
 arch/powerpc/kernel/smp.c      | 56 +++++++++++++++++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index b2035b2..8d3d081 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -134,6 +134,7 @@ static inline struct cpumask *cpu_smallcore_mask(int cpu)
 extern int cpu_to_core_id(int cpu);
 
 extern bool has_big_cores;
+extern bool thread_group_shares_l2;
 
 #define cpu_smt_mask cpu_smt_mask
 #ifdef CONFIG_SCHED_SMT
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 9078b5b5..a46cf3f 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -76,6 +76,7 @@
 struct task_struct *secondary_current;
 bool has_big_cores;
 bool coregroup_enabled;
+bool thread_group_shares_l2;
 
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
@@ -99,6 +100,7 @@ enum {
 
 #define MAX_THREAD_LIST_SIZE	8
 #define THREAD_GROUP_SHARE_L1   1
+#define THREAD_GROUP_SHARE_L2   2
 struct thread_groups {
 	unsigned int property;
 	unsigned int nr_groups;
@@ -107,7 +109,7 @@ struct thread_groups {
 };
 
 /* Maximum number of properties that groups of threads within a core can share */
-#define MAX_THREAD_GROUP_PROPERTIES 1
+#define MAX_THREAD_GROUP_PROPERTIES 2
 
 struct thread_groups_list {
 	unsigned int nr_properties;
@@ -121,6 +123,13 @@ struct thread_groups_list {
  */
 DEFINE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
 
+/*
+ * On some big-cores system, thread_group_l2_cache_map for each CPU
+ * corresponds to the set its siblings within the core that share the
+ * L2-cache.
+ */
+DEFINE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
+
 /* SMP operations for this machine */
 struct smp_ops_t *smp_ops;
 
@@ -718,7 +727,9 @@ static void or_cpumasks_related(int i, int j, struct cpumask *(*srcmask)(int),
  *
  * ibm,thread-groups[i + 0] tells us the property based on which the
  * threads are being grouped together. If this value is 1, it implies
- * that the threads in the same group share L1, translation cache.
+ * that the threads in the same group share L1, translation cache. If
+ * the value is 2, it implies that the threads in the same group share
+ * the same L2 cache.
  *
  * ibm,thread-groups[i+1] tells us how many such thread groups exist for the
  * property ibm,thread-groups[i]
@@ -874,7 +885,8 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
 	struct thread_groups *tg = NULL;
 	cpumask_var_t *mask;
 
-	if (cache_property != THREAD_GROUP_SHARE_L1)
+	if (cache_property != THREAD_GROUP_SHARE_L1 &&
+	    cache_property != THREAD_GROUP_SHARE_L2)
 		return -EINVAL;
 
 	tg = get_thread_groups(cpu, cache_property, &err);
@@ -888,7 +900,11 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
 		return -ENODATA;
 	}
 
-	mask = &per_cpu(thread_group_l1_cache_map, cpu);
+	if (cache_property == THREAD_GROUP_SHARE_L1)
+		mask = &per_cpu(thread_group_l1_cache_map, cpu);
+	else if (cache_property == THREAD_GROUP_SHARE_L2)
+		mask = &per_cpu(thread_group_l2_cache_map, cpu);
+
 	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
 
 	for (i = first_thread; i < first_thread + threads_per_core; i++) {
@@ -990,6 +1006,16 @@ static int init_big_cores(void)
 	}
 
 	has_big_cores = true;
+
+	for_each_possible_cpu(cpu) {
+		int err = init_thread_group_cache_map(cpu, THREAD_GROUP_SHARE_L2);
+
+		if (err)
+			return err;
+	}
+
+	thread_group_shares_l2 = true;
+	pr_debug("L2 cache only shared by the threads in the small core\n");
 	return 0;
 }
 
@@ -1304,6 +1330,28 @@ static bool update_mask_by_l2(int cpu, cpumask_var_t *mask)
 	if (has_big_cores)
 		submask_fn = cpu_smallcore_mask;
 
+	/*
+	 * If the threads in a thread-group share L2 cache, then then
+	 * the L2-mask can be obtained from thread_group_l2_cache_map.
+	 */
+	if (thread_group_shares_l2) {
+		cpumask_set_cpu(cpu, cpu_l2_cache_mask(cpu));
+
+		for_each_cpu(i, per_cpu(thread_group_l2_cache_map, cpu)) {
+			if (cpu_online(i))
+				set_cpus_related(i, cpu, cpu_l2_cache_mask);
+		}
+
+		/* Verify that L1-cache siblings are a subset of L2 cache-siblings */
+		if (!cpumask_equal(submask_fn(cpu), cpu_l2_cache_mask(cpu)) &&
+		    !cpumask_subset(submask_fn(cpu), cpu_l2_cache_mask(cpu))) {
+			pr_warn_once("CPU %d : Inconsistent L1 and L2 cache siblings\n",
+				     cpu);
+		}
+
+		return true;
+	}
+
 	l2_cache = cpu_to_l2cache(cpu);
 	if (!l2_cache || !*mask) {
 		/* Assume only core siblings share cache with this CPU */
-- 
1.9.4

