Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D163608EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 14:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLdV60PLkz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 22:11:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W4geZwjI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W4geZwjI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLdSw4p8pz3c2g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 22:10:07 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FC3LVq160297; Thu, 15 Apr 2021 08:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HF3qGuCfN54TMoF55rVsvQNq4k84FcQ6R74yrB2SxnA=;
 b=W4geZwjI56vAe665obWDH4fQMyZr446ao7zih1JXQ6Czhr4Et9lX8wL32MtwBvAFWdFg
 qjenRRv4Fek5EBEKcVHkcbHGBlFt2H3j0s/50x/wES23MybAR7JnJ6uUY8fQQVk2U1iy
 DJElyJzNFpcK15jQgAI2SRWxiS2WtD7eUflC/Rocl/yqYRQDaFQt7/eUNPG43qq6ZEuM
 qZy/Xg9G1CdWESgxoWpVYD3IQuhp49tLb0YeKzmxJ0fC4ChAtwYTKNMiFAVs/mngex2U
 dlFlzZccyEGXpoBZ0eDSVywoclBGRowAi1kNzpD/8parh7iyfihJztdjRVZ80siyr6Po Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x46x91wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:09:55 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FC3VHq161689;
 Thu, 15 Apr 2021 08:09:54 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x46x91vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:09:54 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FC89oU014683;
 Thu, 15 Apr 2021 12:09:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 37u3n8uv56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 12:09:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13FC9RwG36897038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 12:09:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E980BA4060;
 Thu, 15 Apr 2021 12:09:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21829A4054;
 Thu, 15 Apr 2021 12:09:47 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.74.6])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 12:09:46 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/smp: Cache CPU to chip lookup
Date: Thu, 15 Apr 2021 17:39:34 +0530
Message-Id: <20210415120934.232271-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AH76UiO3vX9_6GfPHsnnJrVSFxeURQic
X-Proofpoint-ORIG-GUID: N-E_Vo1KhAPBgYMgTiW8ICWFa8Lb7QIs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150081
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On systems with large CPUs per node, even with the filtered matching of
related CPUs, there can be large number of calls to cpu_to_chip_id for
the same CPU. For example with 4096 vCPU, 1 node QEMU configuration,
with 4 threads per core, system could be see upto 1024 calls to
cpu_to_chip_id() for the same CPU. On a given system, cpu_to_chip_id()
for a given CPU would always return the same. Hence cache the result in
a lookup table for use in subsequent calls.

Since all CPUs sharing the same core will belong to the same chip, the
lookup_table has an entry for one CPU per core.  chip_id_lookup_table is
not being freed and would be used on subsequent CPU online post CPU
offline.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: qemu-ppc@nongnu.org
Cc: Cedric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Reported-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/smp.h |  1 +
 arch/powerpc/kernel/prom.c     | 19 +++++++++++++++----
 arch/powerpc/kernel/smp.c      | 21 +++++++++++++++++++--
 3 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 47081a9e13ca..03b3d010cbab 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -31,6 +31,7 @@ extern u32 *cpu_to_phys_id;
 extern bool coregroup_enabled;
 
 extern int cpu_to_chip_id(int cpu);
+extern int *chip_id_lookup_table;
 
 #ifdef CONFIG_SMP
 
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9a4797d1d40d..6d2e4a5bc471 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -65,6 +65,8 @@
 #define DBG(fmt...)
 #endif
 
+int *chip_id_lookup_table;
+
 #ifdef CONFIG_PPC64
 int __initdata iommu_is_off;
 int __initdata iommu_force_on;
@@ -914,13 +916,22 @@ EXPORT_SYMBOL(of_get_ibm_chip_id);
 int cpu_to_chip_id(int cpu)
 {
 	struct device_node *np;
+	int ret = -1, idx;
+
+	idx = cpu / threads_per_core;
+	if (chip_id_lookup_table && chip_id_lookup_table[idx] != -1)
+		return chip_id_lookup_table[idx];
 
 	np = of_get_cpu_node(cpu, NULL);
-	if (!np)
-		return -1;
+	if (np) {
+		ret = of_get_ibm_chip_id(np);
+		of_node_put(np);
+
+		if (chip_id_lookup_table)
+			chip_id_lookup_table[idx] = ret;
+	}
 
-	of_node_put(np);
-	return of_get_ibm_chip_id(np);
+	return ret;
 }
 EXPORT_SYMBOL(cpu_to_chip_id);
 
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5c7ce1d50631..50520fbea424 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1073,6 +1073,20 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 				cpu_smallcore_mask(boot_cpuid));
 	}
 
+	if (cpu_to_chip_id(boot_cpuid) != -1) {
+		int idx = num_possible_cpus() / threads_per_core;
+
+		/*
+		 * All threads of a core will all belong to the same core,
+		 * chip_id_lookup_table will have one entry per core.
+		 * Assumption: if boot_cpuid doesn't have a chip-id, then no
+		 * other CPUs, will also not have chip-id.
+		 */
+		chip_id_lookup_table = kcalloc(idx, sizeof(int), GFP_KERNEL);
+		if (chip_id_lookup_table)
+			memset(chip_id_lookup_table, -1, sizeof(int) * idx);
+	}
+
 	if (smp_ops && smp_ops->probe)
 		smp_ops->probe();
 }
@@ -1468,8 +1482,8 @@ static void add_cpu_to_masks(int cpu)
 {
 	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
 	int first_thread = cpu_first_thread_sibling(cpu);
-	int chip_id = cpu_to_chip_id(cpu);
 	cpumask_var_t mask;
+	int chip_id = -1;
 	bool ret;
 	int i;
 
@@ -1492,7 +1506,10 @@ static void add_cpu_to_masks(int cpu)
 	if (has_coregroup_support())
 		update_coregroup_mask(cpu, &mask);
 
-	if (chip_id == -1 || !ret) {
+	if (chip_id_lookup_table && ret)
+		chip_id = cpu_to_chip_id(cpu);
+
+	if (chip_id == -1) {
 		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
 		goto out;
 	}
-- 
2.25.1

