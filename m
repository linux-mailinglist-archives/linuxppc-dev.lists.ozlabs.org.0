Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E21AC286795
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 20:43:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C639s1nM0zDqHl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 05:42:57 +1100 (AEDT)
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
 header.s=pp1 header.b=q27O+mKG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C634k5k7RzDq9b
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 05:38:30 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097IZR3s108971; Wed, 7 Oct 2020 14:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IrN0WbBEvaiWLVxCtdhDDvqfKW9WC2Kxw4e/JyCsXqE=;
 b=q27O+mKG3k+PjfbPZenc8VzzDVCyi/7WUBzF3kGgiCqEWQos1ycYBWHVRtlZaMyxxARj
 W+gNsUn+9mXYUx0pxn7I2FnVzrOoajGD75P0mr0XYut+6GUppY2voS5EfiPOhPZZuhO1
 lXZFCu7d//kiJEiX6YsZsGfRPR+FQiuqo0sIblsEVmrXD7U7QB5wk/eMRWyzWsQ3sX58
 qM8AedH6p9y7f9KSJ/0xKzn1WSqddOfVjxegWanC5w5cfKMr+8Ioxaj79/LC6JGZio9+
 SUmlPT75ssdbWa6DP1Q+7z9VTaCVjWEe9y0thJXJpaAumYJcuwoeLwChmKnsoASepjQd hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 341j3psuc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:20 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 097IZsPo111862;
 Wed, 7 Oct 2020 14:38:20 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 341j3psub1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:19 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097IRrh1015732;
 Wed, 7 Oct 2020 18:38:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 33xgx8cjn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 18:38:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097IcGTp32768390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 18:38:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD00BA406A;
 Wed,  7 Oct 2020 18:38:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74B86A405F;
 Wed,  7 Oct 2020 18:38:12 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.90.101])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 18:38:12 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 02/11] powerpc/smp: Stop updating cpu_core_mask
Date: Thu,  8 Oct 2020 00:07:51 +0530
Message-Id: <20201007183800.27415-3-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007183800.27415-1-srikar@linux.vnet.ibm.com>
References: <20201007183800.27415-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_10:2020-10-07,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070116
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
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Qian Cai <cai@redhat.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anton Blanchard reported that his 4096 vcpu KVM guest took around 30
minutes to boot. He also analyzed it to the time taken to iterate while
setting the cpu_core_mask.

Further analysis shows that cpu_core_mask and cpu_cpu_mask for any CPU
would be equal on Power. However updating cpu_core_mask took forever to
update as its a per cpu cpumask variable. Instead cpu_cpu_mask was a per
NODE /per DIE cpumask that was shared by all the respective CPUs.

Also cpu_cpu_mask is needed from a scheduler perspective. However
cpu_core_map is an exported symbol. Hence stop updating cpu_core_map
and make it point to cpu_cpu_mask.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Qian Cai <cai@redhat.com>
---
 arch/powerpc/include/asm/smp.h |  5 -----
 arch/powerpc/kernel/smp.c      | 33 +++++++--------------------------
 2 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 041f0b97c45b..40e121dd16af 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -119,11 +119,6 @@ static inline struct cpumask *cpu_sibling_mask(int cpu)
 	return per_cpu(cpu_sibling_map, cpu);
 }
 
-static inline struct cpumask *cpu_core_mask(int cpu)
-{
-	return per_cpu(cpu_core_map, cpu);
-}
-
 static inline struct cpumask *cpu_l2_cache_mask(int cpu)
 {
 	return per_cpu(cpu_l2_cache_map, cpu);
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 3d96752d6570..ec41491beca4 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -953,12 +953,17 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 				local_memory_node(numa_cpu_lookup_table[cpu]));
 		}
 #endif
+		/*
+		 * cpu_core_map is now more updated and exists only since
+		 * its been exported for long. It only will have a snapshot
+		 * of cpu_cpu_mask.
+		 */
+		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
 	}
 
 	/* Init the cpumasks so the boot CPU is related to itself */
 	cpumask_set_cpu(boot_cpuid, cpu_sibling_mask(boot_cpuid));
 	cpumask_set_cpu(boot_cpuid, cpu_l2_cache_mask(boot_cpuid));
-	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
 
 	if (has_coregroup_support())
 		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
@@ -1260,9 +1265,7 @@ static void remove_cpu_from_masks(int cpu)
 {
 	int i;
 
-	/* NB: cpu_core_mask is a superset of the others */
-	for_each_cpu(i, cpu_core_mask(cpu)) {
-		set_cpus_unrelated(cpu, i, cpu_core_mask);
+	for_each_cpu(i, cpu_cpu_mask(cpu)) {
 		set_cpus_unrelated(cpu, i, cpu_l2_cache_mask);
 		set_cpus_unrelated(cpu, i, cpu_sibling_mask);
 		if (has_big_cores)
@@ -1312,7 +1315,6 @@ EXPORT_SYMBOL_GPL(get_physical_package_id);
 static void add_cpu_to_masks(int cpu)
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
-	int pkg_id = get_physical_package_id(cpu);
 	int i;
 
 	/*
@@ -1320,7 +1322,6 @@ static void add_cpu_to_masks(int cpu)
 	 * add it to it's own thread sibling mask.
 	 */
 	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
-	cpumask_set_cpu(cpu, cpu_core_mask(cpu));
 
 	for (i = first_thread; i < first_thread + threads_per_core; i++)
 		if (cpu_online(i))
@@ -1342,26 +1343,6 @@ static void add_cpu_to_masks(int cpu)
 				set_cpus_related(cpu, i, cpu_coregroup_mask);
 		}
 	}
-
-	if (pkg_id == -1) {
-		struct cpumask *(*mask)(int) = cpu_sibling_mask;
-
-		/*
-		 * Copy the sibling mask into core sibling mask and
-		 * mark any CPUs on the same chip as this CPU.
-		 */
-		if (shared_caches)
-			mask = cpu_l2_cache_mask;
-
-		for_each_cpu(i, mask(cpu))
-			set_cpus_related(cpu, i, cpu_core_mask);
-
-		return;
-	}
-
-	for_each_cpu(i, cpu_online_mask)
-		if (get_physical_package_id(i) == pkg_id)
-			set_cpus_related(cpu, i, cpu_core_mask);
 }
 
 /* Activate a secondary processor. */
-- 
2.17.1

