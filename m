Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F9C240263
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 09:23:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ6rX1KrCzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:23:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rFmALNkj; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ6lc1kVXzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 17:19:08 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A72TPG181588; Mon, 10 Aug 2020 03:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eRLWg26/L6ImSEWXnyQZRjg8oEo9TyNgMpr422m/eGA=;
 b=rFmALNkjeJN+zUf8qz8rtJZKoTZxtVeiL7ZHb0S7cGEMpyOUz6z9WYGXXeleIporCrxU
 C4H8JMqJwU9GcaN5V/smA2pRVoSMblDQelrEHQ+SAZyfR4m0eE8E5jptdQKX+Krx6n1C
 J1RkECh8AXKlf3WHSB0Y4/lWY7pFPpRChQw53U5AerERfr0YkatOX/YwuRmselp8InY7
 SarS6Wikl6pn8lJWEM4pXK8l2TPmyLqpeudp6APHd5xtKBqA0ZBIM2TlkRu6m+XHXtmP
 IAa5ZJHIJU2F1n5Ld8IvwBzuhFpbQRuTvmnl0OKW0Wwsi6xk8z/kv+egRNL0mgCs9djP Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32t93q1rrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:18:57 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07A72oFW183066;
 Mon, 10 Aug 2020 03:18:56 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32t93q1rqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:18:56 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07A7EgMN012607;
 Mon, 10 Aug 2020 07:18:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 32skp89ygf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 07:18:54 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07A7HOhx58065390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 07:17:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E737D11C04C;
 Mon, 10 Aug 2020 07:18:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 267EE11C052;
 Mon, 10 Aug 2020 07:18:49 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.18.208])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 07:18:48 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 03/10] powerpc/smp: Move powerpc_topology above
Date: Mon, 10 Aug 2020 12:48:27 +0530
Message-Id: <20200810071834.92514-4-srikar@linux.vnet.ibm.com>
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
 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100048
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

Just moving the powerpc_topology description above.
This will help in using functions in this file and avoid declarations.

No other functional changes

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
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 104 +++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 08da765b91f1..39224a042468 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -818,6 +818,58 @@ static int init_cpu_l1_cache_map(int cpu)
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
+	return cpu_l2_cache_mask(cpu);
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
@@ -1247,8 +1299,6 @@ static void add_cpu_to_masks(int cpu)
 			set_cpus_related(cpu, i, cpu_core_mask);
 }
 
-static bool shared_caches;
-
 /* Activate a secondary processor. */
 void start_secondary(void *unused)
 {
@@ -1312,56 +1362,6 @@ int setup_profiling_timer(unsigned int multiplier)
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
-	return cpu_l2_cache_mask(cpu);
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
2.18.2

