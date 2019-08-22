Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF80F99725
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 16:43:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DnMM47ggzDrJv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 00:43:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DnH83B6tzDrPc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 00:39:31 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MEXYta125673
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:39:28 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhvhesfxv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:39:28 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 22 Aug 2019 15:39:26 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 15:39:24 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7MEd28o34079176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 14:39:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81E46A4057;
 Thu, 22 Aug 2019 14:39:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81752A4051;
 Thu, 22 Aug 2019 14:39:22 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.52])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 14:39:22 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/smp: Use nid as fallback for package_id
Date: Thu, 22 Aug 2019 20:08:53 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 19082214-0016-0000-0000-000002A18875
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082214-0017-0000-0000-00003301C244
Message-Id: <20190822143853.19138-1-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220148
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

Link to previous posting: https://patchwork.ozlabs.org/patch/1126145

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
---
Changelog from v1:
In V1 cpu_to_chip_id was overloaded to fallback on nid.  Michael Ellerman
wasn't comfortable with nid being shown up as chip_id.

 arch/powerpc/include/asm/topology.h |  3 +-
 arch/powerpc/kernel/smp.c           | 46 +++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 2f7e1ea5089e..f0c4b2f06665 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -134,7 +134,8 @@ static inline void shared_proc_topology_init(void) {}
 #ifdef CONFIG_PPC64
 #include <asm/smp.h>
 
-#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
+extern int get_physical_package_id(int);
+#define topology_physical_package_id(cpu)	(get_physical_package_id(cpu))
 #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
 #define topology_core_cpumask(cpu)	(per_cpu(cpu_core_map, cpu))
 #define topology_core_id(cpu)		(cpu_to_core_id(cpu))
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ea6adbf6a221..4d1541cc5e95 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1185,10 +1185,50 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
 	}
 }
 
+#ifdef CONFIG_PPC64
+int get_physical_package_id(cpu)
+{
+	struct device_node *np, *root;
+	struct property *pp;
+	int gppid = cpu_to_chip_id(cpu);
+
+	/*
+	 * If the platform is PowerNV or Guest on KVM, ibm,chip-id is
+	 * defined. Hence we would return the chip-id as the
+	 * get_physical_package_id.
+	 */
+	if (gppid == -1 && firmware_has_feature(FW_FEATURE_LPAR) &&
+				machine_is(pseries)) {
+		/*
+		 * PowerVM hypervisor doesn't export ibm,chip-id property.
+		 * Currently only PowerVM hypervisor supports
+		 * /rtas/ibm,configure-kernel-dump property. Use this
+		 * property to identify PowerVM LPARs within pseries
+		 * platform.
+		 */
+		root = of_find_node_by_path("/rtas");
+		if (root) {
+			pp = of_find_property(root,
+					"ibm,configure-kernel-dump", NULL);
+			if (pp) {
+				np = of_get_cpu_node(cpu, NULL);
+				if (np) {
+					gppid = of_node_to_nid(np);
+					of_node_put(np);
+				}
+			}
+			of_node_put(root);
+		}
+	}
+	return gppid;
+}
+EXPORT_SYMBOL(get_physical_package_id);
+#endif
+
 static void add_cpu_to_masks(int cpu)
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
-	int chipid = cpu_to_chip_id(cpu);
+	int gppid = get_physical_package_id(cpu);
 	int i;
 
 	/*
@@ -1217,11 +1257,11 @@ static void add_cpu_to_masks(int cpu)
 	for_each_cpu(i, cpu_l2_cache_mask(cpu))
 		set_cpus_related(cpu, i, cpu_core_mask);
 
-	if (chipid == -1)
+	if (gppid == -1)
 		return;
 
 	for_each_cpu(i, cpu_online_mask)
-		if (cpu_to_chip_id(i) == chipid)
+		if (get_physical_package_id(i) == gppid)
 			set_cpus_related(cpu, i, cpu_core_mask);
 }
 
-- 
2.17.1

