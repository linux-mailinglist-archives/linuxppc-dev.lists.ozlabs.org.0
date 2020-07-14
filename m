Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D421E713
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 06:42:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5SYK2TptzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 14:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5SR437RVzDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 14:37:04 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06E4X46o172718; Tue, 14 Jul 2020 00:36:59 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 327tn9xwqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 00:36:59 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06E4RAsG028340;
 Tue, 14 Jul 2020 04:36:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgtuqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 04:36:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06E4aquR66125878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 04:36:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF14BA4054;
 Tue, 14 Jul 2020 04:36:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BAC7A4060;
 Tue, 14 Jul 2020 04:36:50 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.70.163])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jul 2020 04:36:50 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 03/11] powerpc/smp: Move powerpc_topology above
Date: Tue, 14 Jul 2020 10:06:16 +0530
Message-Id: <20200714043624.5648-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_17:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140029
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

Just moving the powerpc_topology description above.
This will help in using functions in this file and avoid declarations.

No other functional changes

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
 arch/powerpc/kernel/smp.c | 116 +++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 069ea4b21c6d..24529f6134aa 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -818,6 +818,64 @@ static int init_cpu_l1_cache_map(int cpu)
 	return err;
 }
 
+static bool shared_caches;
+
+#ifdef CONFIG_SCHED_SMT
+/* cpumask of CPUs with asymmetric SMT dependency */
+static int powerpc_smt_flags(void)
+{
+	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
+
+	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
+		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
+		flags |= SD_ASYM_PACKING;
+	}
+	return flags;
+}
+#endif
+
+/*
+ * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
+ * This topology makes it *much* cheaper to migrate tasks between adjacent cores
+ * since the migrated task remains cache hot. We want to take advantage of this
+ * at the scheduler level so an extra topology level is required.
+ */
+static int powerpc_shared_cache_flags(void)
+{
+	return SD_SHARE_PKG_RESOURCES;
+}
+
+/*
+ * We can't just pass cpu_l2_cache_mask() directly because
+ * returns a non-const pointer and the compiler barfs on that.
+ */
+static const struct cpumask *shared_cache_mask(int cpu)
+{
+	if (shared_caches)
+		return cpu_l2_cache_mask(cpu);
+
+	if (has_big_cores)
+		return cpu_smallcore_mask(cpu);
+
+	return cpu_smt_mask(cpu);
+}
+
+#ifdef CONFIG_SCHED_SMT
+static const struct cpumask *smallcore_smt_mask(int cpu)
+{
+	return cpu_smallcore_mask(cpu);
+}
+#endif
+
+static struct sched_domain_topology_level powerpc_topology[] = {
+#ifdef CONFIG_SCHED_SMT
+	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
+#endif
+	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
+	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
+	{ NULL, },
+};
+
 static int init_big_cores(void)
 {
 	int cpu;
@@ -1249,8 +1307,6 @@ static void add_cpu_to_masks(int cpu)
 			set_cpus_related(cpu, i, cpu_core_mask);
 }
 
-static bool shared_caches;
-
 /* Activate a secondary processor. */
 void start_secondary(void *unused)
 {
@@ -1314,62 +1370,6 @@ int setup_profiling_timer(unsigned int multiplier)
 	return 0;
 }
 
-#ifdef CONFIG_SCHED_SMT
-/* cpumask of CPUs with asymmetric SMT dependency */
-static int powerpc_smt_flags(void)
-{
-	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
-
-	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
-		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
-		flags |= SD_ASYM_PACKING;
-	}
-	return flags;
-}
-#endif
-
-/*
- * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
- * This topology makes it *much* cheaper to migrate tasks between adjacent cores
- * since the migrated task remains cache hot. We want to take advantage of this
- * at the scheduler level so an extra topology level is required.
- */
-static int powerpc_shared_cache_flags(void)
-{
-	return SD_SHARE_PKG_RESOURCES;
-}
-
-/*
- * We can't just pass cpu_l2_cache_mask() directly because
- * returns a non-const pointer and the compiler barfs on that.
- */
-static const struct cpumask *shared_cache_mask(int cpu)
-{
-	if (shared_caches)
-		return cpu_l2_cache_mask(cpu);
-
-	if (has_big_cores)
-		return cpu_smallcore_mask(cpu);
-
-	return cpu_smt_mask(cpu);
-}
-
-#ifdef CONFIG_SCHED_SMT
-static const struct cpumask *smallcore_smt_mask(int cpu)
-{
-	return cpu_smallcore_mask(cpu);
-}
-#endif
-
-static struct sched_domain_topology_level powerpc_topology[] = {
-#ifdef CONFIG_SCHED_SMT
-	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
-#endif
-	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
-	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
-	{ NULL, },
-};
-
 void __init smp_cpus_done(unsigned int max_cpus)
 {
 	/*
-- 
2.17.1

