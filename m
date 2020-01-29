Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 677F614CBE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 14:54:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4874jp4Bg9zDqRx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 00:54:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4874f7740czDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 00:51:40 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TDnhqP139128
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:51:38 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xttntpdsu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:51:37 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 29 Jan 2020 13:51:36 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 13:51:33 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00TDoekF48234758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 13:50:40 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AAF952054;
 Wed, 29 Jan 2020 13:51:32 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.193.110.254])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id CEADF5204F;
 Wed, 29 Jan 2020 13:51:30 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4] powerpc/smp: Use nid as fallback for package_id
Date: Wed, 29 Jan 2020 19:21:21 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 20012913-0028-0000-0000-000003D57FB3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012913-0029-0000-0000-00002499CB1E
Message-Id: <20200129135121.24617-1-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290115
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
Changelog from v3: https://lore.kernel.org/linuxppc-dev/20191216142119.5937-1-srikar@linux.vnet.ibm.com/t/#u
- Handled comments from Michael Ellerman.
  - Rename function cpu_to_nid to get_physical_package_id
  - Moved code back to arch/powerpc/kernel/smp.c from pseries/lpar.c
  - Use export_symbol_gpl instead of export_symbol.
  - Rebased to v5.5-rc6

Changelog from v2: https://patchwork.ozlabs.org/patch/1151649
- Rebased to v5.5-rc2
- Renamed the new function to cpu_to_nid
- Removed checks to fadump property. (Looked too excessive)
- Moved pseries specific code to pseries/lpar.c

Changelog from v1: https://patchwork.ozlabs.org/patch/1126145
- In v1 cpu_to_chip_id was overloaded to fallback on nid.  Michael
  Ellerman wasn't comfortable with nid being shown up as chip_id.

 arch/powerpc/include/asm/topology.h |  6 ++++++
 arch/powerpc/kernel/smp.c           | 30 ++++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 2f7e1ea5089e..e2e1ccd4a18d 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -134,7 +134,13 @@ static inline void shared_proc_topology_init(void) {}
 #ifdef CONFIG_PPC64
 #include <asm/smp.h>
 
+#ifdef CONFIG_PPC_SPLPAR
+int get_physical_package_id(int cpu);
+#define topology_physical_package_id(cpu)	(get_physical_package_id(cpu))
+#else
 #define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
+#endif
+
 #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
 #define topology_core_cpumask(cpu)	(per_cpu(cpu_core_map, cpu))
 #define topology_core_id(cpu)		(cpu_to_core_id(cpu))
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ea6adbf6a221..d75fc8fd8168 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1185,10 +1185,34 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
 	}
 }
 
+int get_physical_package_id(int cpu)
+{
+	int ppid = cpu_to_chip_id(cpu);
+
+#ifdef CONFIG_PPC_SPLPAR
+	/*
+	 * If the platform is PowerNV or Guest on KVM, ibm,chip-id is
+	 * defined. Hence we would return the chip-id as the
+	 * get_physical_package_id.
+	 */
+	if (ppid == -1 && firmware_has_feature(FW_FEATURE_LPAR)) {
+		struct device_node *np = of_get_cpu_node(cpu, NULL);
+
+		if (np) {
+			ppid = of_node_to_nid(np);
+			of_node_put(np);
+		}
+	}
+#endif /* CONFIG_PPC_SPLPAR */
+
+	return ppid;
+}
+EXPORT_SYMBOL_GPL(get_physical_package_id);
+
 static void add_cpu_to_masks(int cpu)
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
-	int chipid = cpu_to_chip_id(cpu);
+	int ppid = get_physical_package_id(cpu);
 	int i;
 
 	/*
@@ -1217,11 +1241,11 @@ static void add_cpu_to_masks(int cpu)
 	for_each_cpu(i, cpu_l2_cache_mask(cpu))
 		set_cpus_related(cpu, i, cpu_core_mask);
 
-	if (chipid == -1)
+	if (ppid == -1)
 		return;
 
 	for_each_cpu(i, cpu_online_mask)
-		if (cpu_to_chip_id(i) == chipid)
+		if (get_physical_package_id(i) == ppid)
 			set_cpus_related(cpu, i, cpu_core_mask);
 }
 
-- 
2.18.1

