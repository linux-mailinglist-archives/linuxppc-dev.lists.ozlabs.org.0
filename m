Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41B2CE728
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 05:53:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnL1f0CxWzDrMC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:53:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aX8WBR45; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnKxK0PZ0zDrHm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 15:49:24 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B44bVIM145848; Thu, 3 Dec 2020 23:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=U0r4XEZvrvVVL+gfq8PpFGyJnoKttXE+3/lNTXlim7s=;
 b=aX8WBR45Eg3Pa4hQfBmAUxvYpBmGn2+Ad5briKBfdImvyQo83QtkAtRBwOgVWGfPh0sL
 VvD8ANVcsloKponAJHbQg4QZ5PgMyLDA+AXWqH1AZJaXL2vTM2nSfMqbJJ2Xlrxj3XeV
 /p7n6bgAWqgWdxNTdGhwXDeIBrmVc2pE80v73igH7dIkgqI8Ski3BxoJEiSjdspWMcc+
 06etOUpQCkSrFa7Y4sgSkO0L5mrGsYtzbAJNUrTFgvhptPCMqt7Cn89L87c91+3tyvQZ
 8rHBv15t1hoOq8W27ebNZIlRNJLN/I1/KOT2AKWHJn7wW7O9v1Wo8+VJOmvQQrbXcNa3 dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357d31stx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 23:49:11 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B44bZCL146096;
 Thu, 3 Dec 2020 23:49:10 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357d31stx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 23:49:10 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B44lXEN025539;
 Fri, 4 Dec 2020 04:49:10 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3569xutbwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 04:49:10 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B44n6MB20250928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 04:49:06 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 427EA6A04F;
 Fri,  4 Dec 2020 04:49:06 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79A2C6A051;
 Fri,  4 Dec 2020 04:49:05 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.56.248])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 04:49:05 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id AED9D2E3D00; Fri,  4 Dec 2020 10:19:01 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH 2/3] powerpc/smp: Add support detecting thread-groups sharing
 L2 cache
Date: Fri,  4 Dec 2020 10:18:46 +0530
Message-Id: <1607057327-29822-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_01:2020-12-03,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040021
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
 arch/powerpc/kernel/smp.c | 66 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6a242a3..a116d2d 100644
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
 DEFINE_PER_CPU(cpumask_var_t, cpu_l1_cache_map);
 
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
@@ -745,10 +756,10 @@ static void or_cpumasks_related(int i, int j, struct cpumask *(*srcmask)(int),
  * 12}.
  *
  * b) there are 2 groups of 4 threads each, where each group of
- *    threads share some property indicated by the first value 2. The
- *    "ibm,ppc-interrupt-server#s" of the first group is {5,7,9,11}
- *    and the "ibm,ppc-interrupt-server#s" of the second group is
- *    {6,8,10,12} structure
+ *    threads share some property indicated by the first value 2 (L2
+ *    cache). The "ibm,ppc-interrupt-server#s" of the first group is
+ *    {5,7,9,11} and the "ibm,ppc-interrupt-server#s" of the second
+ *    group is {6,8,10,12} structure
  *
  * Returns 0 on success, -EINVAL if the property does not exist,
  * -ENODATA if property does not have a value, and -EOVERFLOW if the
@@ -840,7 +851,8 @@ static int init_cpu_cache_map(int cpu, unsigned int cache_property)
 	if (!dn)
 		return -ENODATA;
 
-	if (!(cache_property == THREAD_GROUP_SHARE_L1))
+	if (!(cache_property == THREAD_GROUP_SHARE_L1 ||
+	      cache_property == THREAD_GROUP_SHARE_L2))
 		return -EINVAL;
 
 	if (!cpu_tgl->nr_properties) {
@@ -867,7 +879,10 @@ static int init_cpu_cache_map(int cpu, unsigned int cache_property)
 		goto out;
 	}
 
-	mask = &per_cpu(cpu_l1_cache_map, cpu);
+	if (cache_property == THREAD_GROUP_SHARE_L1)
+		mask = &per_cpu(cpu_l1_cache_map, cpu);
+	else if (cache_property == THREAD_GROUP_SHARE_L2)
+		mask = &per_cpu(thread_group_l2_cache_map, cpu);
 
 	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
 
@@ -973,6 +988,16 @@ static int init_big_cores(void)
 	}
 
 	has_big_cores = true;
+
+	for_each_possible_cpu(cpu) {
+		int err = init_cpu_cache_map(cpu, THREAD_GROUP_SHARE_L2);
+
+		if (err)
+			return err;
+	}
+
+	thread_group_shares_l2 = true;
+	pr_info("Thread-groups in a core share L2-cache\n");
 	return 0;
 }
 
@@ -1287,6 +1312,31 @@ static bool update_mask_by_l2(int cpu, cpumask_var_t *mask)
 	if (has_big_cores)
 		submask_fn = cpu_smallcore_mask;
 
+
+	/*
+	 * If the threads in a thread-group share L2 cache, then then
+	 * the L2-mask can be obtained from thread_group_l2_cache_map.
+	 */
+	if (thread_group_shares_l2) {
+		/* Siblings that share L1 is a subset of siblings that share L2.*/
+		or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
+		if (*mask) {
+			cpumask_andnot(*mask,
+				       per_cpu(thread_group_l2_cache_map, cpu),
+				       cpu_l2_cache_mask(cpu));
+		} else {
+			mask = &per_cpu(thread_group_l2_cache_map, cpu);
+		}
+
+		for_each_cpu(i, *mask) {
+			if (!cpu_online(i))
+				continue;
+			set_cpus_related(i, cpu, cpu_l2_cache_mask);
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

