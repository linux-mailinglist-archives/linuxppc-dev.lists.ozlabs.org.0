Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E33608F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 14:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLdVZ3XTQz3cRv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 22:11:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XoaFLSWF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XoaFLSWF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLdT05Z47z3c34
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 22:10:12 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FC44Dl079571; Thu, 15 Apr 2021 08:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/XC5KH0a1v3r8h6+5kjbo6BxYx4FSsfBiN+kOIIBFWw=;
 b=XoaFLSWFPBiaa3ccCzPLQujhhnLXM4hRGnWHHYMUPSX0RFadttc35TGVkb192NWyiNyb
 e19rCQvwKrx+eoujRYDlzgUwYs3B+JlE0CIcZnthweZxuX1z0PHBTphkeWWxxxp1KRaz
 cs15P46gFVoorZbSFd8JOCaNXGIox2+2DQzjQt3mdMisHZIrvy9samQTrmraQXzBio2C
 N6gZYa7BhFRF1SS5tcxYusPNCDNEBHrSxZkzjLLfS7DP7PaN2SrdUlXDlq/jbZLrjMtS
 nHfm3q+rsi2uisTF6VJIoA/8owBDaEONr9hhScv5rsDwNHoJWWFrLB55cxZ8InYhO4KN +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x13vfjha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:09:49 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FC4a2L083609;
 Thu, 15 Apr 2021 08:09:48 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x13vfjg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:09:48 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FC7REw007399;
 Thu, 15 Apr 2021 12:09:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8bv2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 12:09:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13FC9Lw934144756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 12:09:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0333A4054;
 Thu, 15 Apr 2021 12:09:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AFE1A4060;
 Thu, 15 Apr 2021 12:09:40 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.74.6])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 12:09:40 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] powerpc/smp: Reintroduce cpu_core_mask
Date: Thu, 15 Apr 2021 17:39:32 +0530
Message-Id: <20210415120934.232271-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pMFl8J7XD27QVSu7VFQMujxO_lhDf7Wk
X-Proofpoint-ORIG-GUID: yUb-UQxk282IAWJVGzh9s-Q_9Lrjrfwm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104150081
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

Daniel reported that with Commit 4ca234a9cbd7 ("powerpc/smp: Stop
updating cpu_core_mask") QEMU was unable to set single NUMA node SMP
topologies such as:
 -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
 i.e he expected 2 sockets in one NUMA node.

The above commit helped to reduce boot time on Large Systems for
example 4096 vCPU single socket QEMU instance. PAPR is silent on
having more than one socket within a NUMA node.

cpu_core_mask and cpu_cpu_mask for any CPU would be same unless the
number of sockets is different from the number of NUMA nodes.

One option is to reintroduce cpu_core_mask but use a slightly
different method to arrive at the cpu_core_mask. Previously each CPU's
chip-id would be compared with all other CPU's chip-id to verify if
both the CPUs were related at the chip level. Now if a CPU 'A' is
found related / (unrelated) to another CPU 'B', all the thread
siblings of 'A' and thread siblings of 'B' are automatically marked as
related / (unrelated).

Also if a platform doesn't support ibm,chip-id property, i.e its
cpu_to_chip_id returns -1, cpu_core_map holds a copy of
cpu_cpu_mask().

Fixes: 4ca234a9cbd7 ("powerpc/smp: Stop updating cpu_core_mask")
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
 arch/powerpc/include/asm/smp.h |  5 +++++
 arch/powerpc/kernel/smp.c      | 39 ++++++++++++++++++++++++++++------
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 7a13bc20f0a0..47081a9e13ca 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -121,6 +121,11 @@ static inline struct cpumask *cpu_sibling_mask(int cpu)
 	return per_cpu(cpu_sibling_map, cpu);
 }
 
+static inline struct cpumask *cpu_core_mask(int cpu)
+{
+	return per_cpu(cpu_core_map, cpu);
+}
+
 static inline struct cpumask *cpu_l2_cache_mask(int cpu)
 {
 	return per_cpu(cpu_l2_cache_map, cpu);
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5a4d59a1070d..5c7ce1d50631 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1057,17 +1057,12 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 				local_memory_node(numa_cpu_lookup_table[cpu]));
 		}
 #endif
-		/*
-		 * cpu_core_map is now more updated and exists only since
-		 * its been exported for long. It only will have a snapshot
-		 * of cpu_cpu_mask.
-		 */
-		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
 	}
 
 	/* Init the cpumasks so the boot CPU is related to itself */
 	cpumask_set_cpu(boot_cpuid, cpu_sibling_mask(boot_cpuid));
 	cpumask_set_cpu(boot_cpuid, cpu_l2_cache_mask(boot_cpuid));
+	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
 
 	if (has_coregroup_support())
 		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
@@ -1408,6 +1403,9 @@ static void remove_cpu_from_masks(int cpu)
 			set_cpus_unrelated(cpu, i, cpu_smallcore_mask);
 	}
 
+	for_each_cpu(i, cpu_core_mask(cpu))
+		set_cpus_unrelated(cpu, i, cpu_core_mask);
+
 	if (has_coregroup_support()) {
 		for_each_cpu(i, cpu_coregroup_mask(cpu))
 			set_cpus_unrelated(cpu, i, cpu_coregroup_mask);
@@ -1468,8 +1466,11 @@ static void update_coregroup_mask(int cpu, cpumask_var_t *mask)
 
 static void add_cpu_to_masks(int cpu)
 {
+	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
 	int first_thread = cpu_first_thread_sibling(cpu);
+	int chip_id = cpu_to_chip_id(cpu);
 	cpumask_var_t mask;
+	bool ret;
 	int i;
 
 	/*
@@ -1485,12 +1486,36 @@ static void add_cpu_to_masks(int cpu)
 	add_cpu_to_smallcore_masks(cpu);
 
 	/* In CPU-hotplug path, hence use GFP_ATOMIC */
-	alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
+	ret = alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
 	update_mask_by_l2(cpu, &mask);
 
 	if (has_coregroup_support())
 		update_coregroup_mask(cpu, &mask);
 
+	if (chip_id == -1 || !ret) {
+		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
+		goto out;
+	}
+
+	if (shared_caches)
+		submask_fn = cpu_l2_cache_mask;
+
+	/* Update core_mask with all the CPUs that are part of submask */
+	or_cpumasks_related(cpu, cpu, submask_fn, cpu_core_mask);
+
+	/* Skip all CPUs already part of current CPU core mask */
+	cpumask_andnot(mask, cpu_online_mask, cpu_core_mask(cpu));
+
+	for_each_cpu(i, mask) {
+		if (chip_id == cpu_to_chip_id(i)) {
+			or_cpumasks_related(cpu, i, submask_fn, cpu_core_mask);
+			cpumask_andnot(mask, mask, submask_fn(i));
+		} else {
+			cpumask_andnot(mask, mask, cpu_core_mask(i));
+		}
+	}
+
+out:
 	free_cpumask_var(mask);
 }
 
-- 
2.25.1

