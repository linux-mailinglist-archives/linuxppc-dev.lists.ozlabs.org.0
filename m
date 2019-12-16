Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC712088B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 15:23:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c3RZ0VDXzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 01:23:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c3P80ypnzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 01:21:47 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBGEIHIx142898
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 09:21:44 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwe2pcs82-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 09:21:43 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Mon, 16 Dec 2019 14:21:42 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Dec 2019 14:21:40 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBGELdtM33488976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Dec 2019 14:21:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A9FE42041;
 Mon, 16 Dec 2019 14:21:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EBB042045;
 Mon, 16 Dec 2019 14:21:38 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.1.133])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 Dec 2019 14:21:38 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3] powerpc/smp: Use nid as fallback for package_id
Date: Mon, 16 Dec 2019 19:51:19 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 19121614-4275-0000-0000-0000038F9098
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121614-4276-0000-0000-000038A3530D
Message-Id: <20191216142119.5937-1-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-16_05:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912160128
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Package_id is to find out all cores that are part of the same chip. On
PowerNV machines, package_id defaults to chip_id. However ibm,chip_id
property is not present in device-tree of PowerVM Lpars. Hence lscpu
output shows one core per socket and multiple cores.

To overcome this, use nid as the package_id on PowerVM Lpars.

Before the patch.
---------------
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              128
On-line CPU(s) list: 0-127
Thread(s) per core:  8
Core(s) per socket:  1                           <----------------------
Socket(s):           16                          <----------------------
NUMA node(s):        2
Model:               2.2 (pvr 004e 0202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   pHyp
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-63
NUMA node1 CPU(s):   64-127
 #
 # cat /sys/devices/system/cpu/cpu0/topology/physical_package_id
 -1
 #

After the patch
---------------
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              128
On-line CPU(s) list: 0-127
Thread(s) per core:  8			<------------------------------
Core(s) per socket:  8			<------------------------------
Socket(s):           2
NUMA node(s):        2
Model:               2.2 (pvr 004e 0202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   pHyp
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-63
NUMA node1 CPU(s):   64-127
 #
 # cat /sys/devices/system/cpu/cpu0/topology/physical_package_id
 0
 #
Now lscpu output is more in line with the system configuration.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
---
Changelog from v2: https://patchwork.ozlabs.org/patch/1151649
- Rebased to v5.5-rc2
- Renamed the new function to cpu_to_nid
- Removed checks to fadump property. (Looked too excessive)
- Moved pseries specific code to pseries/lpar.c

Changelog from v1: https://patchwork.ozlabs.org/patch/1126145
- In v1 cpu_to_chip_id was overloaded to fallback on nid.  Michael
  Ellerman wasn't comfortable with nid being shown up as chip_id.

 arch/powerpc/include/asm/topology.h   |  7 ++++++-
 arch/powerpc/kernel/smp.c             |  6 +++---
 arch/powerpc/platforms/pseries/lpar.c | 22 ++++++++++++++++++++++
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 2f7e1ea5089e..7422ef913c75 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -130,11 +130,16 @@ static inline void shared_proc_topology_init(void) {}
 
 #ifdef CONFIG_SMP
 #include <asm/cputable.h>
+#ifdef CONFIG_PPC_SPLPAR
+int cpu_to_nid(int);
+#else
+#define cpu_to_nid(cpu)		cpu_to_chip_id(cpu)
+#endif
 
 #ifdef CONFIG_PPC64
 #include <asm/smp.h>
 
-#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
+#define topology_physical_package_id(cpu)	(cpu_to_nid(cpu))
 #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
 #define topology_core_cpumask(cpu)	(per_cpu(cpu_core_map, cpu))
 #define topology_core_id(cpu)		(cpu_to_core_id(cpu))
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ea6adbf6a221..b0c1438d8d9a 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1188,7 +1188,7 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
 static void add_cpu_to_masks(int cpu)
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
-	int chipid = cpu_to_chip_id(cpu);
+	int nid = cpu_to_nid(cpu);
 	int i;
 
 	/*
@@ -1217,11 +1217,11 @@ static void add_cpu_to_masks(int cpu)
 	for_each_cpu(i, cpu_l2_cache_mask(cpu))
 		set_cpus_related(cpu, i, cpu_core_mask);
 
-	if (chipid == -1)
+	if (nid == -1)
 		return;
 
 	for_each_cpu(i, cpu_online_mask)
-		if (cpu_to_chip_id(i) == chipid)
+		if (cpu_to_nid(i) == nid)
 			set_cpus_related(cpu, i, cpu_core_mask);
 }
 
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 60cb29ae4739..99583b9f00e4 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -650,6 +650,28 @@ static int __init vcpudispatch_stats_procfs_init(void)
 }
 
 machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
+
+int cpu_to_nid(cpu)
+{
+	int nid = cpu_to_chip_id(cpu);
+
+	/*
+	 * If the platform is PowerNV or Guest on KVM, ibm,chip-id is
+	 * defined. Hence we would return the chip-id as the
+	 * cpu_to_nid.
+	 */
+	if (nid == -1 && firmware_has_feature(FW_FEATURE_LPAR)) {
+		struct device_node *np = of_get_cpu_node(cpu, NULL);
+
+		if (np) {
+			nid = of_node_to_nid(np);
+			of_node_put(np);
+		}
+	}
+	return nid;
+}
+EXPORT_SYMBOL(cpu_to_nid);
+
 #endif /* CONFIG_PPC_SPLPAR */
 
 void vpa_init(int cpu)
-- 
2.18.1

