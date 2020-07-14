Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45021E719
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 06:47:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Sfl3VRWzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 14:47:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5SRF3ZqQzDqSy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 14:37:13 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06E4YwJI056102; Tue, 14 Jul 2020 00:37:07 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 327u1h65x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 00:37:07 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06E4UfAQ026907;
 Tue, 14 Jul 2020 04:37:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 327527twtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 04:37:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06E4b1aW64749872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 04:37:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 269FBA405F;
 Tue, 14 Jul 2020 04:37:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6D93A405B;
 Tue, 14 Jul 2020 04:36:58 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.70.163])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jul 2020 04:36:58 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 06/11] powerpc/smp: Generalize 2nd sched domain
Date: Tue, 14 Jul 2020 10:06:19 +0530
Message-Id: <20200714043624.5648-7-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_17:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140034
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
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently "CACHE" domain happens to be the 2nd sched domain as per
powerpc_topology. This domain will collapse if cpumask of l2-cache is
same as SMT domain. However we could generalize this domain such that it
could mean either be a "CACHE" domain or a "BIGCORE" domain.

While setting up the "CACHE" domain, check if shared_cache is already
set.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <michaele@au1.ibm.com>
Cc: Nick Piggin <npiggin@au1.ibm.com>
Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@linux.ibm.com>
Cc: Anton Blanchard <anton@au1.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 48 +++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 875f57e41355..f8faf75135af 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -85,6 +85,14 @@ EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
 EXPORT_PER_CPU_SYMBOL(cpu_core_map);
 EXPORT_SYMBOL_GPL(has_big_cores);
 
+enum {
+#ifdef CONFIG_SCHED_SMT
+	smt_idx,
+#endif
+	bigcore_idx,
+	die_idx,
+};
+
 #define MAX_THREAD_LIST_SIZE	8
 #define THREAD_GROUP_SHARE_L1   1
 struct thread_groups {
@@ -851,13 +859,7 @@ static int powerpc_shared_cache_flags(void)
  */
 static const struct cpumask *shared_cache_mask(int cpu)
 {
-	if (shared_caches)
-		return cpu_l2_cache_mask(cpu);
-
-	if (has_big_cores)
-		return cpu_smallcore_mask(cpu);
-
-	return cpu_smt_mask(cpu);
+	return per_cpu(cpu_l2_cache_map, cpu);
 }
 
 #ifdef CONFIG_SCHED_SMT
@@ -867,11 +869,16 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
 }
 #endif
 
+static const struct cpumask *cpu_bigcore_mask(int cpu)
+{
+	return cpu_core_mask(cpu);
+}
+
 static struct sched_domain_topology_level powerpc_topology[] = {
 #ifdef CONFIG_SCHED_SMT
 	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
 #endif
-	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
+	{ cpu_bigcore_mask, SD_INIT_NAME(BIGCORE) },
 	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
 	{ NULL, },
 };
@@ -895,7 +902,7 @@ static int init_big_cores(void)
 
 #ifdef CONFIG_SCHED_SMT
 	pr_info("Big cores detected. Using small core scheduling\n");
-	powerpc_topology[0].mask = smallcore_smt_mask;
+	powerpc_topology[smt_idx].mask = smallcore_smt_mask;
 #endif
 
 	return 0;
@@ -1319,7 +1326,6 @@ static void add_cpu_to_masks(int cpu)
 void start_secondary(void *unused)
 {
 	unsigned int cpu = smp_processor_id();
-	struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
 
 	mmgrab(&init_mm);
 	current->active_mm = &init_mm;
@@ -1345,14 +1351,20 @@ void start_secondary(void *unused)
 	/* Update topology CPU masks */
 	add_cpu_to_masks(cpu);
 
-	if (has_big_cores)
-		sibling_mask = cpu_smallcore_mask;
 	/*
 	 * Check for any shared caches. Note that this must be done on a
 	 * per-core basis because one core in the pair might be disabled.
 	 */
-	if (!cpumask_equal(cpu_l2_cache_mask(cpu), sibling_mask(cpu)))
-		shared_caches = true;
+	if (!shared_caches) {
+		struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
+		struct cpumask *mask = cpu_l2_cache_mask(cpu);
+
+		if (has_big_cores)
+			sibling_mask = cpu_smallcore_mask;
+
+		if (cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu)))
+			shared_caches = true;
+	}
 
 	set_numa_node(numa_cpu_lookup_table[cpu]);
 	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
@@ -1390,6 +1402,14 @@ void __init smp_cpus_done(unsigned int max_cpus)
 		smp_ops->bringup_done();
 
 	dump_numa_cpu_topology();
+	if (shared_caches) {
+		pr_info("Using shared cache scheduler topology\n");
+		powerpc_topology[bigcore_idx].mask = shared_cache_mask;
+#ifdef CONFIG_SCHED_DEBUG
+		powerpc_topology[bigcore_idx].name = "CACHE";
+#endif
+		powerpc_topology[bigcore_idx].sd_flags = powerpc_shared_cache_flags;
+	}
 
 	set_sched_topology(powerpc_topology);
 }
-- 
2.17.1

