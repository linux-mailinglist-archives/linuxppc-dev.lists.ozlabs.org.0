Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E353F3A35
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 12:28:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GsF875MQDz3dDg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 20:28:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dOhOW3sC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dOhOW3sC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GsF5q20BHz2yPB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 20:26:07 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17LA6wO8033965; Sat, 21 Aug 2021 06:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wylMKsSzvTWSllU+fA/YA0WwKgzAhcQNw8YcCXn6Y0g=;
 b=dOhOW3sCBe4M+5YbMboatQ+F8xREvn78tjcYtXNawgXs20GXOKjwXsA0Ao/+mWwntlcT
 Jr+hkNoM2ZSrArC6gzs2iSOJUfl02U47Kn9IscFLk46KZFcgVbrXfiXwyYb0pZfKcAWK
 vEW/pCTzPZaXI9C65mXdfZC+7DHqFD+dy/pSMNQvnjWT7llVaq+YazpqlRMqwu8FM1Ef
 rHGQFqPmLxaeJ0dFgD7C0d+wDXEvC1Cd1m+nEEOXR94i8FRoHOPQaUtx20BnKSQOXlwj
 VGqFlcg4Nd6FlxLZr4ycNgCcAtbijglXlasIefqLP4ZbqVHmJpAOQeKJxyeKjt1G0D5x Uw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ajwrvsvhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 06:25:55 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17LA7bHN026168;
 Sat, 21 Aug 2021 10:25:54 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3ajrrh8gbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 10:25:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17LAPoMZ55706056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Aug 2021 10:25:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5433611C011;
 Sat, 21 Aug 2021 10:25:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D272A11C012;
 Sat, 21 Aug 2021 10:25:46 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.90.43])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 21 Aug 2021 10:25:46 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/3] powerpc/numa: Update cpu_cpu_map on CPU online/offline
Date: Sat, 21 Aug 2021 15:55:34 +0530
Message-Id: <20210821102535.169643-3-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z9fNT2uOgFnxiqowipDVMqqawfDkBD_Z
X-Proofpoint-ORIG-GUID: z9fNT2uOgFnxiqowipDVMqqawfDkBD_Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-21_03:2021-08-20,
 2021-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108210059
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
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Ingo Molnar <mingo@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpu_cpu_map holds all the CPUs in the DIE. However in PowerPC, when
onlining/offlining of CPUs, this mask doesn't get updated.  This mask
is however updated when CPUs are added/removed. So when both
operations like online/offline of CPUs and adding/removing of CPUs are
done simultaneously, then cpumaps end up broken.

WARNING: CPU: 13 PID: 1142 at kernel/sched/topology.c:898
build_sched_domains+0xd48/0x1720
Modules linked in: rpadlpar_io rpaphp mptcp_diag xsk_diag tcp_diag
udp_diag raw_diag inet_diag unix_diag af_packet_diag netlink_diag
bonding tls nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set
rfkill nf_tables nfnetlink pseries_rng xts vmx_crypto uio_pdrv_genirq
uio binfmt_misc ip_tables xfs libcrc32c dm_service_time sd_mod t10_pi sg
ibmvfc scsi_transport_fc ibmveth dm_multipath dm_mirror dm_region_hash
dm_log dm_mod fuse
CPU: 13 PID: 1142 Comm: kworker/13:2 Not tainted 5.13.0-rc6+ #28
Workqueue: events cpuset_hotplug_workfn
NIP:  c0000000001caac8 LR: c0000000001caac4 CTR: 00000000007088ec
REGS: c00000005596f220 TRAP: 0700   Not tainted  (5.13.0-rc6+)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48828222  XER:
00000009
CFAR: c0000000001ea698 IRQMASK: 0
GPR00: c0000000001caac4 c00000005596f4c0 c000000001c4a400 0000000000000036
GPR04: 00000000fffdffff c00000005596f1d0 0000000000000027 c0000018cfd07f90
GPR08: 0000000000000023 0000000000000001 0000000000000027 c0000018fe68ffe8
GPR12: 0000000000008000 c00000001e9d1880 c00000013a047200 0000000000000800
GPR16: c000000001d3c7d0 0000000000000240 0000000000000048 c000000010aacd18
GPR20: 0000000000000001 c000000010aacc18 c00000013a047c00 c000000139ec2400
GPR24: 0000000000000280 c000000139ec2520 c000000136c1b400 c000000001c93060
GPR28: c00000013a047c20 c000000001d3c6c0 c000000001c978a0 000000000000000d
NIP [c0000000001caac8] build_sched_domains+0xd48/0x1720
LR [c0000000001caac4] build_sched_domains+0xd44/0x1720
Call Trace:
[c00000005596f4c0] [c0000000001caac4] build_sched_domains+0xd44/0x1720 (unreliable)
[c00000005596f670] [c0000000001cc5ec] partition_sched_domains_locked+0x3ac/0x4b0
[c00000005596f710] [c0000000002804e4] rebuild_sched_domains_locked+0x404/0x9e0
[c00000005596f810] [c000000000283e60] rebuild_sched_domains+0x40/0x70
[c00000005596f840] [c000000000284124] cpuset_hotplug_workfn+0x294/0xf10
[c00000005596fc60] [c000000000175040] process_one_work+0x290/0x590
[c00000005596fd00] [c0000000001753c8] worker_thread+0x88/0x620
[c00000005596fda0] [c000000000181704] kthread+0x194/0x1a0
[c00000005596fe10] [c00000000000ccec] ret_from_kernel_thread+0x5c/0x70
Instruction dump:
485af049 60000000 2fa30800 409e0028 80fe0000 e89a00f8 e86100e8 38da0120
7f88e378 7ce53b78 4801fb91 60000000 <0fe00000> 39000000 38e00000 38c00000

Fix this by updating cpu_cpu_map aka cpumask_of_node() on every CPU
online/offline.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/topology.h | 12 ++++++++++++
 arch/powerpc/kernel/smp.c           |  3 +++
 arch/powerpc/mm/numa.c              |  7 ++-----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index e4db64c0e184..2f0a4d7b95f6 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -65,6 +65,11 @@ static inline int early_cpu_to_node(int cpu)
 
 int of_drconf_to_nid_single(struct drmem_lmb *lmb);
 
+extern void map_cpu_to_node(int cpu, int node);
+#ifdef CONFIG_HOTPLUG_CPU
+extern void unmap_cpu_from_node(unsigned long cpu);
+#endif /* CONFIG_HOTPLUG_CPU */
+
 #else
 
 static inline int early_cpu_to_node(int cpu) { return 0; }
@@ -93,6 +98,13 @@ static inline int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 	return first_online_node;
 }
 
+#ifdef CONFIG_SMP
+static inline void map_cpu_to_node(int cpu, int node) {}
+#ifdef CONFIG_HOTPLUG_CPU
+static inline void unmap_cpu_from_node(unsigned long cpu) {}
+#endif /* CONFIG_HOTPLUG_CPU */
+#endif /* CONFIG_SMP */
+
 #endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 47b15f31cc29..5ede4b1c7473 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1407,6 +1407,8 @@ static void remove_cpu_from_masks(int cpu)
 	struct cpumask *(*mask_fn)(int) = cpu_sibling_mask;
 	int i;
 
+	unmap_cpu_from_node(cpu);
+
 	if (shared_caches)
 		mask_fn = cpu_l2_cache_mask;
 
@@ -1491,6 +1493,7 @@ static void add_cpu_to_masks(int cpu)
 	 * This CPU will not be in the online mask yet so we need to manually
 	 * add it to it's own thread sibling mask.
 	 */
+	map_cpu_to_node(cpu, cpu_to_node(cpu));
 	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
 	cpumask_set_cpu(cpu, cpu_core_mask(cpu));
 
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index fbe03f6840e0..3c124928a16d 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -137,7 +137,7 @@ static void reset_numa_cpu_lookup_table(void)
 		numa_cpu_lookup_table[cpu] = -1;
 }
 
-static void map_cpu_to_node(int cpu, int node)
+void map_cpu_to_node(int cpu, int node)
 {
 	update_numa_cpu_lookup_table(cpu, node);
 
@@ -149,7 +149,7 @@ static void map_cpu_to_node(int cpu, int node)
 }
 
 #if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_PPC_SPLPAR)
-static void unmap_cpu_from_node(unsigned long cpu)
+void unmap_cpu_from_node(unsigned long cpu)
 {
 	int node = numa_cpu_lookup_table[cpu];
 
@@ -597,9 +597,6 @@ static int ppc_numa_cpu_prepare(unsigned int cpu)
 
 static int ppc_numa_cpu_dead(unsigned int cpu)
 {
-#ifdef CONFIG_HOTPLUG_CPU
-	unmap_cpu_from_node(cpu);
-#endif
 	return 0;
 }
 
-- 
2.18.2

