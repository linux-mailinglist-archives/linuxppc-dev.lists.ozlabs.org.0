Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 279182402A1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 09:33:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ73x67NtzDqRt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:33:17 +1000 (AEST)
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
 header.s=pp1 header.b=si6Aq6As; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ6lx0tpZzDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 17:19:24 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A72ACF189714; Mon, 10 Aug 2020 03:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ePIxbKmV5ZNng0lONakox1gGDGu6X/C2TXQjNRDBRHg=;
 b=si6Aq6Asxh6AW9mYji87i18F2LYGPZBc+dM6aTQzxFiWujHPH8xAbTEjX3dSJ6Awsioy
 XFfBY/502CMP64X+w6s8OBqo0EweSzvPnV43RZW+5TTSmJT1IuDE848SBGrIDE+QFPbx
 gc3T7Nl46yXHXb3n4weTYYMDsYyOsKF4nmeyiYehi+PqcVgHtriBOGVKNUhj8W9sA2dZ
 o8fw2/t5g/9nwf5KaXgNSN9Z7ect+c7qI/SBP81Xc/i2R2h41XxDUqTzzCdvt31JR6eX
 VrefMq1CgFyAT8ei4H3lg/yIAQIwv7BXZj7e7WjOZDSkVWGSSl/77QXLdC9K/VmvKtWM Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32sr7ubhk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:19:15 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07A733Tq193224;
 Mon, 10 Aug 2020 03:19:15 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32sr7ubhje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:19:14 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07A7GLtC019385;
 Mon, 10 Aug 2020 07:19:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 32skp81ynw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 07:19:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07A7JAOP28377434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 07:19:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0727711C04C;
 Mon, 10 Aug 2020 07:19:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 554D511C058;
 Mon, 10 Aug 2020 07:19:07 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.18.208])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 07:19:07 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 09/10] powerpc/smp: Create coregroup domain
Date: Mon, 10 Aug 2020 12:48:33 +0530
Message-Id: <20200810071834.92514-10-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_02:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100046
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
 "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
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
in favour of SMT/CACHE domain. Do note this patch is only creating stubs
for cpu_to_coregroup_id. The actual cpu_to_coregroup_id implementation
would be in a subsequent patch.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v4 ->v5:
	Updated commit msg to specify actual implementation of
	cpu_to_coregroup_id is in a subsequent patch (Michael Ellerman)

Changelog v3 ->v4:
	if coregroup_support doesn't exist, update MC mask to the next
	smaller domain mask.

Changelog v2 -> v3:
	Add optimization for mask updation under coregroup_support

Changelog v1 -> v2:
	Moved coregroup topology fixup to fixup_topology (Gautham)

 arch/powerpc/include/asm/topology.h | 10 ++++++
 arch/powerpc/kernel/smp.c           | 54 ++++++++++++++++++++++++++++-
 arch/powerpc/mm/numa.c              |  5 +++
 3 files changed, 68 insertions(+), 1 deletion(-)

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
index 0536ac06876b..566e3accac3e 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -80,12 +80,22 @@ DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_l2_cache_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_core_map);
+DEFINE_PER_CPU(cpumask_var_t, cpu_coregroup_map);
 
 EXPORT_PER_CPU_SYMBOL(cpu_sibling_map);
 EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
 EXPORT_PER_CPU_SYMBOL(cpu_core_map);
 EXPORT_SYMBOL_GPL(has_big_cores);
 
+enum {
+#ifdef CONFIG_SCHED_SMT
+	smt_idx,
+#endif
+	cache_idx,
+	mc_idx,
+	die_idx,
+};
+
 #define MAX_THREAD_LIST_SIZE	8
 #define THREAD_GROUP_SHARE_L1   1
 struct thread_groups {
@@ -861,11 +871,27 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
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
 static struct sched_domain_topology_level powerpc_topology[] = {
 #ifdef CONFIG_SCHED_SMT
 	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
 #endif
 	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
+	{ cpu_mc_mask, SD_INIT_NAME(MC) },
 	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
 	{ NULL, },
 };
@@ -912,6 +938,10 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
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
@@ -929,6 +959,9 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	cpumask_set_cpu(boot_cpuid, cpu_l2_cache_mask(boot_cpuid));
 	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
 
+	if (has_coregroup_support())
+		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
+
 	init_big_cores();
 	if (has_big_cores) {
 		cpumask_set_cpu(boot_cpuid,
@@ -1220,6 +1253,8 @@ static void remove_cpu_from_masks(int cpu)
 		set_cpus_unrelated(cpu, i, cpu_sibling_mask);
 		if (has_big_cores)
 			set_cpus_unrelated(cpu, i, cpu_smallcore_mask);
+		if (has_coregroup_support())
+			set_cpus_unrelated(cpu, i, cpu_coregroup_mask);
 	}
 }
 #endif
@@ -1280,6 +1315,20 @@ static void add_cpu_to_masks(int cpu)
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
 
@@ -1374,9 +1423,12 @@ static void fixup_topology(void)
 #ifdef CONFIG_SCHED_SMT
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
-		powerpc_topology[0].mask = smallcore_smt_mask;
+		powerpc_topology[smt_idx].mask = smallcore_smt_mask;
 	}
 #endif
+
+	if (!has_coregroup_support())
+		powerpc_topology[mc_idx].mask = powerpc_topology[cache_idx].mask;
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 51cb672f113b..0d57779e7942 100644
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

