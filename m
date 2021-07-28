Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3033D94BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 19:58:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZhGZ65Vxz3cm2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 03:58:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U/QbTfc0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U/QbTfc0; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZhDq1snZz3bWd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 03:56:43 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SHbHxV033171; Wed, 28 Jul 2021 13:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fA52C/kd++s8IaI6tijylIzUShyl5BDq3g/w4jmEP7A=;
 b=U/QbTfc0vlKK71/lkSwLDvNMEyqgFcpCWfuRNZc9skJqj0ZylsYJCtwIoY7fA37qFiHN
 DIOK05Z5PwWYsckQ82ZZ0hAzpw6DYs6XwEi75BMeKYkEWkXAm9StYvcm2qYzXRfQgrQC
 /JCUYB9idir7oXS+qVNkCSN5jaJcI8EcPYVuAOQ90f5RWTSzgBX/UCwFqHtLrk3BMnjp
 Jdazngggq7mJFSMCAmFxKZLvJAIg+6JHnFlpzqAIR3KZkt2e79DivuZc0pujNmIiKfrs
 kKwb3yRfQHF4LXokAZmIYW3rCcAP/gI1dbjrJme1ajaTspolB1aT2bjEXd3IAAmcoZ7C 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a37jj12ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 13:56:37 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16SHbdI7035462;
 Wed, 28 Jul 2021 13:56:36 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a37jj12nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 13:56:36 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16SHuYVn018699;
 Wed, 28 Jul 2021 17:56:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3a235xrt8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 17:56:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16SHuWsU19792374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 17:56:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1FEA52054;
 Wed, 28 Jul 2021 17:56:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.1.109])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3858052051;
 Wed, 28 Jul 2021 17:56:24 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv2 3/3] powerpc/smp: Use existing L2 cache_map cpumask to find
 L3 cache siblings
Date: Wed, 28 Jul 2021 23:26:07 +0530
Message-Id: <20210728175607.591679-4-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210728175607.591679-1-parth@linux.ibm.com>
References: <20210728175607.591679-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kY8P2cVKrsEVbiTe5-0J5dbwItwUDqEE
X-Proofpoint-GUID: PRRKvxNTpo7n2bfux9ApJuJNFc-DfSo2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_08:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280099
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, srikar@linux.vnet.ibm.com,
 parths1229@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On POWER10 systems, the "ibm,thread-groups" property "2" indicates the cpus
in thread-group share both L2 and L3 caches. Hence, use cache_property = 2
itself to find both the L2 and L3 cache siblings.
Hence, create a new thread_group_l3_cache_map to keep list of L3 siblings,
but fill the mask using same property "2" array.

Signed-off-by: Parth Shah <parth@linux.ibm.com>
---
 arch/powerpc/include/asm/smp.h  |  3 ++
 arch/powerpc/kernel/cacheinfo.c |  3 ++
 arch/powerpc/kernel/smp.c       | 66 ++++++++++++++++++++++-----------
 3 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 1259040cc3a4..7ef1cd8168a0 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -35,6 +35,7 @@ extern int *chip_id_lookup_table;
 
 DECLARE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
 DECLARE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
+DECLARE_PER_CPU(cpumask_var_t, thread_group_l3_cache_map);
 
 #ifdef CONFIG_SMP
 
@@ -144,6 +145,7 @@ extern int cpu_to_core_id(int cpu);
 
 extern bool has_big_cores;
 extern bool thread_group_shares_l2;
+extern bool thread_group_shares_l3;
 
 #define cpu_smt_mask cpu_smt_mask
 #ifdef CONFIG_SCHED_SMT
@@ -198,6 +200,7 @@ extern void __cpu_die(unsigned int cpu);
 #define hard_smp_processor_id()		get_hard_smp_processor_id(0)
 #define smp_setup_cpu_maps()
 #define thread_group_shares_l2  0
+#define thread_group_shares_l3	0
 static inline void inhibit_secondary_onlining(void) {}
 static inline void uninhibit_secondary_onlining(void) {}
 static inline const struct cpumask *cpu_sibling_mask(int cpu)
diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 20d91693eac1..cf1be75b7833 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -469,6 +469,9 @@ static int get_group_id(unsigned int cpu_id, int level)
 	else if (thread_group_shares_l2 && level == 2)
 		return cpumask_first(per_cpu(thread_group_l2_cache_map,
 					     cpu_id));
+	else if (thread_group_shares_l3 && level == 3)
+		return cpumask_first(per_cpu(thread_group_l3_cache_map,
+					     cpu_id));
 	return -1;
 }
 
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index a7fcac44a8e2..f2abd88e0c25 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -78,6 +78,7 @@ struct task_struct *secondary_current;
 bool has_big_cores;
 bool coregroup_enabled;
 bool thread_group_shares_l2;
+bool thread_group_shares_l3;
 
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
@@ -101,7 +102,7 @@ enum {
 
 #define MAX_THREAD_LIST_SIZE	8
 #define THREAD_GROUP_SHARE_L1   1
-#define THREAD_GROUP_SHARE_L2   2
+#define THREAD_GROUP_SHARE_L2_L3 2
 struct thread_groups {
 	unsigned int property;
 	unsigned int nr_groups;
@@ -131,6 +132,12 @@ DEFINE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
  */
 DEFINE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
 
+/*
+ * On P10, thread_group_l3_cache_map for each CPU is equal to the
+ * thread_group_l2_cache_map
+ */
+DEFINE_PER_CPU(cpumask_var_t, thread_group_l3_cache_map);
+
 /* SMP operations for this machine */
 struct smp_ops_t *smp_ops;
 
@@ -889,19 +896,41 @@ static struct thread_groups *__init get_thread_groups(int cpu,
 	return tg;
 }
 
+static int update_mask_from_threadgroup(cpumask_var_t *mask, struct thread_groups *tg, int cpu, int cpu_group_start)
+{
+	int first_thread = cpu_first_thread_sibling(cpu);
+	int i;
+
+	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
+
+	for (i = first_thread; i < first_thread + threads_per_core; i++) {
+		int i_group_start = get_cpu_thread_group_start(i, tg);
+
+		if (unlikely(i_group_start == -1)) {
+			WARN_ON_ONCE(1);
+			return -ENODATA;
+		}
+
+		if (i_group_start == cpu_group_start)
+			cpumask_set_cpu(i, *mask);
+	}
+
+	return 0;
+}
+
 static int __init init_thread_group_cache_map(int cpu, int cache_property)
 
 {
-	int first_thread = cpu_first_thread_sibling(cpu);
-	int i, cpu_group_start = -1, err = 0;
+	int cpu_group_start = -1, err = 0;
 	struct thread_groups *tg = NULL;
 	cpumask_var_t *mask = NULL;
 
 	if (cache_property != THREAD_GROUP_SHARE_L1 &&
-	    cache_property != THREAD_GROUP_SHARE_L2)
+	    cache_property != THREAD_GROUP_SHARE_L2_L3)
 		return -EINVAL;
 
 	tg = get_thread_groups(cpu, cache_property, &err);
+
 	if (!tg)
 		return err;
 
@@ -912,25 +941,18 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
 		return -ENODATA;
 	}
 
-	if (cache_property == THREAD_GROUP_SHARE_L1)
+	if (cache_property == THREAD_GROUP_SHARE_L1) {
 		mask = &per_cpu(thread_group_l1_cache_map, cpu);
-	else if (cache_property == THREAD_GROUP_SHARE_L2)
+		update_mask_from_threadgroup(mask, tg, cpu, cpu_group_start);
+	}
+	else if (cache_property == THREAD_GROUP_SHARE_L2_L3) {
 		mask = &per_cpu(thread_group_l2_cache_map, cpu);
-
-	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
-
-	for (i = first_thread; i < first_thread + threads_per_core; i++) {
-		int i_group_start = get_cpu_thread_group_start(i, tg);
-
-		if (unlikely(i_group_start == -1)) {
-			WARN_ON_ONCE(1);
-			return -ENODATA;
-		}
-
-		if (i_group_start == cpu_group_start)
-			cpumask_set_cpu(i, *mask);
+		update_mask_from_threadgroup(mask, tg, cpu, cpu_group_start);
+		mask = &per_cpu(thread_group_l3_cache_map, cpu);
+		update_mask_from_threadgroup(mask, tg, cpu, cpu_group_start);
 	}
 
+
 	return 0;
 }
 
@@ -1020,14 +1042,16 @@ static int __init init_big_cores(void)
 	has_big_cores = true;
 
 	for_each_possible_cpu(cpu) {
-		int err = init_thread_group_cache_map(cpu, THREAD_GROUP_SHARE_L2);
+		int err = init_thread_group_cache_map(cpu, THREAD_GROUP_SHARE_L2_L3);
 
 		if (err)
 			return err;
 	}
 
 	thread_group_shares_l2 = true;
-	pr_debug("L2 cache only shared by the threads in the small core\n");
+	thread_group_shares_l3 = true;
+	pr_debug("L2/L3 cache only shared by the threads in the small core\n");
+
 	return 0;
 }
 
-- 
2.26.3

