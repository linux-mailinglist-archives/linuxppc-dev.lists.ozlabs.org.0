Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661CF3A77AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:10:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zwm6h4Kz3cHw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:10:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HEh9t19u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HEh9t19u; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zts5FJ3z30DG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:08:37 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F74Sco128224; Tue, 15 Jun 2021 03:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DahPp+Pd/BkilHIQxZNCCOaQ7llue7mmBRSmzwGkIiw=;
 b=HEh9t19uFwoIxnGn+MfJMTnsbfRcP/Glp5tlusw3vje58Jq93Zfj5Df/iLVd2IuDJS36
 QZPDsuey0lyc1vIbnFBp85KqAbE3G9V752ReNQ1SovzU2HzhF0IqDh1k7sFZIT//jWOy
 eXfxHw3WqqqMAhMW/uu+BHW9b/XX778swSjaOjtRS1dP9nm5zjyOQkZjfH92f2LafSgY
 zIj4cda1KwdObi0pTRei8qQlhPm2LJb5M1rAyTUTJUFokTlTSkp9S3BW0HOMSb/R1cDK
 Bgbt4zgfW/JA98zOB3bp9SR82XM43Fv4ZitjYgaEBuEME5Hghszrbrtfv55ohglGHFms EQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396qf388dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:08:31 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F78Q3B002343;
 Tue, 15 Jun 2021 07:08:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 395c3t8g1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 07:08:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F78Rpa12059068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 07:08:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1542F4C052;
 Tue, 15 Jun 2021 07:08:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D76B4C040;
 Tue, 15 Jun 2021 07:08:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.27.150])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 07:08:24 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/smp: Use existing L2 cache_map cpumask to find L3
 cache siblings
Date: Tue, 15 Jun 2021 12:38:04 +0530
Message-Id: <20210615070804.390341-4-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210615070804.390341-1-parth@linux.ibm.com>
References: <20210615070804.390341-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l-SyVin-gd0-ivL9b6x1omF1LDOaDsEC
X-Proofpoint-GUID: l-SyVin-gd0-ivL9b6x1omF1LDOaDsEC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150042
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
Cc: mikey@neuling.org, svaidy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On POWER10 systems, the "ibm,thread-groups" property "2" indicates the cpus
in thread-group share both L2 and L3 caches. Hence, use cache_property = 2
itself to find both the L2 and L3 cache siblings.
Hence, rename existing macros to detect if the cache property is for L2 or
L3 and use the L2 cache map itself to find the presence of L3 siblings.

Signed-off-by: Parth Shah <parth@linux.ibm.com>
---
 arch/powerpc/include/asm/smp.h  |  2 ++
 arch/powerpc/kernel/cacheinfo.c |  3 +++
 arch/powerpc/kernel/smp.c       | 20 +++++++++++++++-----
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 1259040cc3a4..55082d343bd2 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -144,6 +144,7 @@ extern int cpu_to_core_id(int cpu);
 
 extern bool has_big_cores;
 extern bool thread_group_shares_l2;
+extern bool thread_group_shares_l3;
 
 #define cpu_smt_mask cpu_smt_mask
 #ifdef CONFIG_SCHED_SMT
@@ -198,6 +199,7 @@ extern void __cpu_die(unsigned int cpu);
 #define hard_smp_processor_id()		get_hard_smp_processor_id(0)
 #define smp_setup_cpu_maps()
 #define thread_group_shares_l2  0
+#define thread_group_shares_l3	0
 static inline void inhibit_secondary_onlining(void) {}
 static inline void uninhibit_secondary_onlining(void) {}
 static inline const struct cpumask *cpu_sibling_mask(int cpu)
diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 20d91693eac1..378ae20d05a9 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -469,6 +469,9 @@ static int get_group_id(unsigned int cpu_id, int level)
 	else if (thread_group_shares_l2 && level == 2)
 		return cpumask_first(per_cpu(thread_group_l2_cache_map,
 					     cpu_id));
+	else if (thread_group_shares_l3 && level == 3)
+		return cpumask_first(per_cpu(thread_group_l2_cache_map,
+					     cpu_id));
 	return -1;
 }
 
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index a34877257f2d..d0c70fcd0068 100644
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
@@ -887,9 +888,16 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
 	cpumask_var_t *mask = NULL;
 
 	if (cache_property != THREAD_GROUP_SHARE_L1 &&
-	    cache_property != THREAD_GROUP_SHARE_L2)
+	    cache_property != THREAD_GROUP_SHARE_L2_L3)
 		return -EINVAL;
 
+	/*
+	 * On P10 fused-core system, the L3 cache is shared between threads of a
+	 * small core only, but the "ibm,thread-groups" property is indicated as
+	 * "2" only which is interpreted as the thread-groups sharing both L2
+	 * and L3 caches. Hence cache_property of THREAD_GROUP_SHARE_L2_L3 is
+	 * used for both L2 and L3 cache sibling detection.
+	 */
 	tg = get_thread_groups(cpu, cache_property, &err);
 	if (!tg)
 		return err;
@@ -903,7 +911,7 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
 
 	if (cache_property == THREAD_GROUP_SHARE_L1)
 		mask = &per_cpu(thread_group_l1_cache_map, cpu);
-	else if (cache_property == THREAD_GROUP_SHARE_L2)
+	else if (cache_property == THREAD_GROUP_SHARE_L2_L3)
 		mask = &per_cpu(thread_group_l2_cache_map, cpu);
 
 	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
@@ -1009,14 +1017,16 @@ static int __init init_big_cores(void)
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

