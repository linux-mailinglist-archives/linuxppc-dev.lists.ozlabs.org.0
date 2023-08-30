Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5365B78D5DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 14:27:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=beUSCGmf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbNq11ttvz3c2H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 22:27:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=beUSCGmf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbNp25ljRz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 22:26:49 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UCA5OQ011729;
	Wed, 30 Aug 2023 12:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=FeSWwQ0ZmyjKMd+Q/FObBJyqnwyudAvTUPrauZ0cAVs=;
 b=beUSCGmfxm6HhKbapRorjQO+rdWuT5XwU1eNY13uxEzLONk1fTuRXvnB1q84En968dwL
 Xg2AoVi2nQ3i7QSZxzrckdLoFio9yW9gDnWOtm/nMGV5Yaw+mkLIMZER2UZj+Zky028O
 tmMvnY9+N/JqmHKvjOS5s43kqmUi4m6SuiBcCjTM9+OiUMeLHQ1d3HHEt/L+qQ3sa4/n
 +B1cDoqnBoGiz8VNoFCP9n3L1PczZMziQXVYnCYMnX6Si2QhYWm/Oo2RQ2OlvP8Ei6yg
 kyYSwWPzoFRmYVXQeZWRf61XrJk6S6dkDdob9ECgOyLDCjW8JJtFHIhWIK2T4qi/xoUn nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3st3c2kxf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 12:26:30 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37UCJ6Wc015451;
	Wed, 30 Aug 2023 12:26:30 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3st3c2kxem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 12:26:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37UA1X4x020514;
	Wed, 30 Aug 2023 12:26:28 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqv3yky3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 12:26:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37UCQQWC41878186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Aug 2023 12:26:26 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BE5A2004B;
	Wed, 30 Aug 2023 12:26:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B38BD20043;
	Wed, 30 Aug 2023 12:26:23 +0000 (GMT)
Received: from saptarishi.in.ibm.com (unknown [9.43.8.96])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Aug 2023 12:26:23 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/smp: Dynamically build powerpc topology
Date: Wed, 30 Aug 2023 17:56:14 +0530
Message-ID: <20230830122614.73067-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OJMIQrGKRXFtXv3QRrfK3N4AUOyQgFdp
X-Proofpoint-ORIG-GUID: Qkqh6uqLUBG6jFF3K99Q25RwCN70fvEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308300113
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently there are four powerpc specific sched topologies.  These are
all statically defined.  However not all these topologies are used by
all powerpc systems.

To avoid unnecessary degenerations by the scheduler , masks and flags
are compared. However if the sched topologies are build dynamically then
the code is simpler and there are greater chances of avoiding
degenerations.

Even x86 builds its sched topologies dynamically and new changes are
very similar to the way x86 is building its topologies.

System Configuration
type=Shared mode=Uncapped smt=8 lcpu=128 mem=1063126592 kB cpus=96 ent=40.00

$ lscpu
Architecture:                    ppc64le
Byte Order:                      Little Endian
CPU(s):                          1024
On-line CPU(s) list:             0-1023
Model name:                      POWER10 (architected), altivec supported
Model:                           2.0 (pvr 0080 0200)
Thread(s) per core:              8
Core(s) per socket:              32
Socket(s):                       4
Hypervisor vendor:               pHyp
Virtualization type:             para
L1d cache:                       8 MiB (256 instances)
L1i cache:                       12 MiB (256 instances)
NUMA node(s):                    4

From dmesg of v6.5
[    0.174444] smp: Bringing up secondary CPUs ...
[    3.918535] smp: Brought up 4 nodes, 1024 CPUs
[   38.001402] sysrq: Changing Loglevel
[   38.001446] sysrq: Loglevel set to 9

From dmesg of v6.5 + patch
[    0.174462] smp: Bringing up secondary CPUs ...
[    3.421462] smp: Brought up 4 nodes, 1024 CPUs
[   35.417917] sysrq: Changing Loglevel
[   35.417959] sysrq: Loglevel set to 9

5 runs of ppc64_cpu --smt=1 (time measured: lesser is better)
Kernel  N  Min     Max     Median  Avg      Stddev     %Change
v6.5    5  518.08  574.27  528.61  535.388  22.341542
+patch  5  481.73  495.47  484.21  486.402  5.7997     -9.14963

5 runs of ppc64_cpu --smt=8 (time measured: lesser is better)
Kernel  N  Min      Max      Median   Avg       Stddev     %Change
v6.5    5  1094.12  1117.1   1108.97  1106.3    8.606361
+patch  5  1067.5   1090.03  1073.89  1076.574  9.4189347  -2.68697

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 78 ++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 48b8161179a8..c16443a04c26 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -92,15 +92,6 @@ EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
 EXPORT_PER_CPU_SYMBOL(cpu_core_map);
 EXPORT_SYMBOL_GPL(has_big_cores);
 
-enum {
-#ifdef CONFIG_SCHED_SMT
-	smt_idx,
-#endif
-	cache_idx,
-	mc_idx,
-	die_idx,
-};
-
 #define MAX_THREAD_LIST_SIZE	8
 #define THREAD_GROUP_SHARE_L1   1
 #define THREAD_GROUP_SHARE_L2_L3 2
@@ -1048,16 +1039,6 @@ static const struct cpumask *cpu_mc_mask(int cpu)
 	return cpu_coregroup_mask(cpu);
 }
 
-static struct sched_domain_topology_level powerpc_topology[] = {
-#ifdef CONFIG_SCHED_SMT
-	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
-#endif
-	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
-	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
-	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE) },
-	{ NULL, },
-};
-
 static int __init init_big_cores(void)
 {
 	int cpu;
@@ -1676,9 +1657,11 @@ void start_secondary(void *unused)
 	BUG();
 }
 
-static void __init fixup_topology(void)
+static struct sched_domain_topology_level powerpc_topology[6];
+
+static void __init build_sched_topology(void)
 {
-	int i;
+	int i = 0;
 
 	if (is_shared_processor()) {
 		asym_pack_flag = SD_ASYM_PACKING;
@@ -1690,36 +1673,33 @@ static void __init fixup_topology(void)
 #ifdef CONFIG_SCHED_SMT
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
-		powerpc_topology[smt_idx].mask = smallcore_smt_mask;
+		powerpc_topology[i++] = (struct sched_domain_topology_level){
+			smallcore_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT)
+		};
+	} else {
+		powerpc_topology[i++] = (struct sched_domain_topology_level){
+			cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT)
+		};
 	}
 #endif
+	if (shared_caches) {
+		powerpc_topology[i++] = (struct sched_domain_topology_level){
+			shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE)
+		};
+	}
+	if (has_coregroup_support()) {
+		powerpc_topology[i++] = (struct sched_domain_topology_level){
+			cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC)
+		};
+	}
+	powerpc_topology[i++] = (struct sched_domain_topology_level){
+		cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE)
+	};
 
-	if (!has_coregroup_support())
-		powerpc_topology[mc_idx].mask = powerpc_topology[cache_idx].mask;
-
-	/*
-	 * Try to consolidate topology levels here instead of
-	 * allowing scheduler to degenerate.
-	 * - Dont consolidate if masks are different.
-	 * - Dont consolidate if sd_flags exists and are different.
-	 */
-	for (i = 1; i <= die_idx; i++) {
-		if (powerpc_topology[i].mask != powerpc_topology[i - 1].mask)
-			continue;
-
-		if (powerpc_topology[i].sd_flags && powerpc_topology[i - 1].sd_flags &&
-				powerpc_topology[i].sd_flags != powerpc_topology[i - 1].sd_flags)
-			continue;
-
-		if (!powerpc_topology[i - 1].sd_flags)
-			powerpc_topology[i - 1].sd_flags = powerpc_topology[i].sd_flags;
+	/* There must be one trailing NULL entry left.  */
+	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
 
-		powerpc_topology[i].mask = powerpc_topology[i + 1].mask;
-		powerpc_topology[i].sd_flags = powerpc_topology[i + 1].sd_flags;
-#ifdef CONFIG_SCHED_DEBUG
-		powerpc_topology[i].name = powerpc_topology[i + 1].name;
-#endif
-	}
+	set_sched_topology(powerpc_topology);
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
@@ -1734,9 +1714,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 		smp_ops->bringup_done();
 
 	dump_numa_cpu_topology();
-
-	fixup_topology();
-	set_sched_topology(powerpc_topology);
+	build_sched_topology();
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-- 
2.41.0

