Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A47D72D587C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 11:46:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs9ZN1HBZzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 21:46:20 +1100 (AEDT)
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
 header.s=pp1 header.b=Nr5ME0F8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs9QT6vJRzDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 21:39:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAAVvb5078390; Thu, 10 Dec 2020 05:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=LxgLLpz+irVghYStEeD8uPOAarFBO2ltYEFa3rAIsRs=;
 b=Nr5ME0F8JQ+RUnpglOUQKKZOxj1mZdo1g7SfdO3en9dzfu80Cj7I7862UWR/QsTkBEKG
 RjCSdNk8ec6vzK4tMh09o0E66Pw8qRABlb6ihqWGrDO5RHwiuZ0S98JBBQOaFPNYthvt
 jFlhVQNX6bbtR7VPsEN2k0Y/23vVE5rEoGGj4tMYkY1JyqfNsvpY1LC1SksrzCRyXkn9
 sJ1AEEAZPPXWpbCsEMUbiGkpTxm39DEKZv8z9vu6pryciicgk8drONBX1TwoiQOQCL7L
 D1CTpSIQG60QscXQOP71aUlpSDoTqaDBeiXgwaqNFpVX/UWjHApE5jfMchYQnvJMSUzA ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bhw30dka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 05:39:13 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BAAWNSI081325;
 Thu, 10 Dec 2020 05:39:12 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bhw30dju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 05:39:12 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAAW7QA025573;
 Thu, 10 Dec 2020 10:39:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3581u9rebk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 10:39:11 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAAdA6u20709812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 10:39:10 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D3EC112064;
 Thu, 10 Dec 2020 10:39:10 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 021D6112062;
 Thu, 10 Dec 2020 10:39:09 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.53.52])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 10 Dec 2020 10:39:09 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 22E552E35BA; Thu, 10 Dec 2020 16:09:06 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH v3 4/5] powerpc/smp: Add support detecting thread-groups
 sharing L2 cache
Date: Thu, 10 Dec 2020 16:08:58 +0530
Message-Id: <1607596739-32439-5-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607596739-32439-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607596739-32439-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_03:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100067
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
 arch/powerpc/include/asm/smp.h |  2 ++
 arch/powerpc/kernel/smp.c      | 58 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index b2035b2..035459c 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -134,6 +134,7 @@ static inline struct cpumask *cpu_smallcore_mask(int cpu)
 extern int cpu_to_core_id(int cpu);
 
 extern bool has_big_cores;
+extern bool thread_group_shares_l2;
 
 #define cpu_smt_mask cpu_smt_mask
 #ifdef CONFIG_SCHED_SMT
@@ -187,6 +188,7 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
 /* for UP */
 #define hard_smp_processor_id()		get_hard_smp_processor_id(0)
 #define smp_setup_cpu_maps()
+#define thread_group_shares_l2  0
 static inline void inhibit_secondary_onlining(void) {}
 static inline void uninhibit_secondary_onlining(void) {}
 static inline const struct cpumask *cpu_sibling_mask(int cpu)
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 9078b5b5..2b9b1bb 100644
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
@@ -872,9 +883,10 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
 	int first_thread = cpu_first_thread_sibling(cpu);
 	int i, cpu_group_start = -1, err = 0;
 	struct thread_groups *tg = NULL;
-	cpumask_var_t *mask;
+	cpumask_var_t *mask = NULL;
 
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
+	 * If the threads in a thread-group share L2 cache, then the
+	 * L2-mask can be obtained from thread_group_l2_cache_map.
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

