Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E422AB52
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 11:07:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC60P0hFgzDrF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 19:07:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC5gX63CBzDrDn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 18:52:24 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N8XLxY034708; Thu, 23 Jul 2020 04:52:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f23g075a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 04:52:10 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N8XPNs035086;
 Thu, 23 Jul 2020 04:52:09 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f23g074d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 04:52:09 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N8opDc001819;
 Thu, 23 Jul 2020 08:52:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 32brq85ynj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 08:52:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06N8q4X258458532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 08:52:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 522C7AE057;
 Thu, 23 Jul 2020 08:52:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89EA7AE045;
 Thu, 23 Jul 2020 08:52:01 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.199.56.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 08:52:01 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 09/10] powerpc/smp: Create coregroup domain
Date: Thu, 23 Jul 2020 14:21:15 +0530
Message-Id: <20200723085116.4731-10-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723085116.4731-1-srikar@linux.vnet.ibm.com>
References: <20200723085116.4731-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_02:2020-07-22,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230065
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add percpu coregroup maps and masks to create coregroup domain.
If a coregroup doesn't exist, the coregroup domain will be degenerated
in favour of SMT/CACHE domain.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v2 -> v3:
	Add optimization for mask updation under coregroup_support

Changelog v1 -> v2:
	Moved coregroup topology fixup to fixup_topology (Gautham)

 arch/powerpc/include/asm/topology.h | 10 +++++++
 arch/powerpc/kernel/smp.c           | 44 +++++++++++++++++++++++++++++
 arch/powerpc/mm/numa.c              |  5 ++++
 3 files changed, 59 insertions(+)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f0b6300e7dd3..6609174918ab 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -88,12 +88,22 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
 extern int find_and_online_cpu_nid(int cpu);
+extern int cpu_to_coregroup_id(int cpu);
 #else
 static inline int find_and_online_cpu_nid(int cpu)
 {
 	return 0;
 }
 
+static inline int cpu_to_coregroup_id(int cpu)
+{
+#ifdef CONFIG_SMP
+	return cpu_to_core_id(cpu);
+#else
+	return 0;
+#endif
+}
+
 #endif /* CONFIG_NUMA && CONFIG_PPC_SPLPAR */
 
 #include <asm-generic/topology.h>
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 7d8d44cbab11..1faedde3e406 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -80,6 +80,7 @@ DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_l2_cache_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_core_map);
+DEFINE_PER_CPU(cpumask_var_t, cpu_coregroup_map);
 
 EXPORT_PER_CPU_SYMBOL(cpu_sibling_map);
 EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
@@ -91,6 +92,7 @@ enum {
 	smt_idx,
 #endif
 	bigcore_idx,
+	mc_idx,
 	die_idx,
 };
 
@@ -869,6 +871,21 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
 }
 #endif
 
+static struct cpumask *cpu_coregroup_mask(int cpu)
+{
+	return per_cpu(cpu_coregroup_map, cpu);
+}
+
+static bool has_coregroup_support(void)
+{
+	return coregroup_enabled;
+}
+
+static const struct cpumask *cpu_mc_mask(int cpu)
+{
+	return cpu_coregroup_mask(cpu);
+}
+
 static const struct cpumask *cpu_bigcore_mask(int cpu)
 {
 	return per_cpu(cpu_sibling_map, cpu);
@@ -879,6 +896,7 @@ static struct sched_domain_topology_level powerpc_topology[] = {
 	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
 #endif
 	{ cpu_bigcore_mask, SD_INIT_NAME(BIGCORE) },
+	{ cpu_mc_mask, SD_INIT_NAME(MC) },
 	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
 	{ NULL, },
 };
@@ -925,6 +943,10 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 					GFP_KERNEL, cpu_to_node(cpu));
 		zalloc_cpumask_var_node(&per_cpu(cpu_core_map, cpu),
 					GFP_KERNEL, cpu_to_node(cpu));
+		if (has_coregroup_support())
+			zalloc_cpumask_var_node(&per_cpu(cpu_coregroup_map, cpu),
+						GFP_KERNEL, cpu_to_node(cpu));
+
 #ifdef CONFIG_NEED_MULTIPLE_NODES
 		/*
 		 * numa_node_id() works after this.
@@ -942,6 +964,9 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	cpumask_set_cpu(boot_cpuid, cpu_l2_cache_mask(boot_cpuid));
 	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
 
+	if (has_coregroup_support())
+		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
+
 	init_big_cores();
 	if (has_big_cores) {
 		cpumask_set_cpu(boot_cpuid,
@@ -1233,6 +1258,8 @@ static void remove_cpu_from_masks(int cpu)
 		set_cpus_unrelated(cpu, i, cpu_sibling_mask);
 		if (has_big_cores)
 			set_cpus_unrelated(cpu, i, cpu_smallcore_mask);
+		if (has_coregroup_support())
+			set_cpus_unrelated(cpu, i, cpu_coregroup_mask);
 	}
 }
 #endif
@@ -1293,6 +1320,20 @@ static void add_cpu_to_masks(int cpu)
 	add_cpu_to_smallcore_masks(cpu);
 	update_mask_by_l2(cpu, cpu_l2_cache_mask);
 
+	if (has_coregroup_support()) {
+		int coregroup_id = cpu_to_coregroup_id(cpu);
+
+		cpumask_set_cpu(cpu, cpu_coregroup_mask(cpu));
+		for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
+			int fcpu = cpu_first_thread_sibling(i);
+
+			if (fcpu == first_thread)
+				set_cpus_related(cpu, i, cpu_coregroup_mask);
+			else if (coregroup_id == cpu_to_coregroup_id(i))
+				set_cpus_related(cpu, i, cpu_coregroup_mask);
+		}
+	}
+
 	if (pkg_id == -1) {
 		struct cpumask *(*mask)(int) = cpu_sibling_mask;
 
@@ -1384,6 +1425,9 @@ int setup_profiling_timer(unsigned int multiplier)
 
 static void fixup_topology(void)
 {
+	if (!has_coregroup_support())
+		powerpc_topology[mc_idx].mask = cpu_bigcore_mask;
+
 	if (shared_caches) {
 		pr_info("Using shared cache scheduler topology\n");
 		powerpc_topology[bigcore_idx].mask = shared_cache_mask;
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 3248160c0327..ef8aa580da21 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1216,6 +1216,11 @@ int find_and_online_cpu_nid(int cpu)
 	return new_nid;
 }
 
+int cpu_to_coregroup_id(int cpu)
+{
+	return cpu_to_core_id(cpu);
+}
+
 static int topology_update_init(void)
 {
 	topology_inited = 1;
-- 
2.18.2

