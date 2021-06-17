Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB993AADCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:38:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5DSV5ztnz30CZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:38:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TAKnGNAM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TAKnGNAM; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5DPG1K6Rz3bx6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:35:45 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H7Z6OY176404; Thu, 17 Jun 2021 03:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=i3Bih0axf5ZLaxAGoIu5tIgJ1I8v9QvGZOX9cF9w70A=;
 b=TAKnGNAMYlt4+v+cnVDmjvW8LjeC84GDJnLipLppO+yeqcIdEIWD6bGhMlCnPr1PufF5
 eQiyymXcJFfTIQU1vUmSJulHqWj53uxK4kOGugQyCIKsDzAP1zYnqRLQxfrqo+Z1f6Z7
 v/JA2kPCMECeeBZ0g+4wyucSmjnbKGcqoc3hiD51v0+TrtPS9khPliXQUeYgWAZGJMLh
 rhwfLr0ZURHf9kPxeyrXwL0Z+jzxNhlyZUsDGDyrgjb+5f1zB+XK/fJsTvfn6YO72Fml
 bmPCjNMSyCYENs2lzy3X04wMVrj6X9gy6P+vOYekZav7HU4XRL7EXwF7sdxkj1fBR7II 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3980jfav7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:35:36 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15H7ZFcd177109;
 Thu, 17 Jun 2021 03:35:36 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3980jfav7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:35:36 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15H7XMq3031231;
 Thu, 17 Jun 2021 07:35:35 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3954gkj8wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:35:35 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15H7ZYbL27328984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 07:35:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D745711206E;
 Thu, 17 Jun 2021 07:35:34 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3361112066;
 Thu, 17 Jun 2021 07:35:31 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.31.110])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 07:35:31 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 7/8] powerpc/pseries: Add support for FORM2 associativity
Date: Thu, 17 Jun 2021 13:04:57 +0530
Message-Id: <20210617073458.510545-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617073458.510545-1-aneesh.kumar@linux.ibm.com>
References: <20210617073458.510545-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2BanG22g82wC-myVWj78YlLwz32R_r9K
X-Proofpoint-GUID: KiROzqxcs-LFRVqx-LdpPLDtuQVrUIVV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_02:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170052
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, nvdimm@lists.linux.dev,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, dan.j.williams@intel.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR interface currently supports two different ways of communicating resource
grouping details to the OS. These are referred to as Form 0 and Form 1
associativity grouping. Form 0 is the older format and is now considered
deprecated. This patch adds another resource grouping named FORM2.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 Documentation/powerpc/associativity.rst   | 177 ++++++++++++++++++++++
 arch/powerpc/include/asm/firmware.h       |   3 +-
 arch/powerpc/include/asm/prom.h           |   1 +
 arch/powerpc/kernel/prom_init.c           |   3 +-
 arch/powerpc/mm/numa.c                    | 149 +++++++++++++++++-
 arch/powerpc/platforms/pseries/firmware.c |   1 +
 6 files changed, 328 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/powerpc/associativity.rst

diff --git a/Documentation/powerpc/associativity.rst b/Documentation/powerpc/associativity.rst
new file mode 100644
index 000000000000..5fa9352dfc05
--- /dev/null
+++ b/Documentation/powerpc/associativity.rst
@@ -0,0 +1,177 @@
+============================
+NUMA resource associativity
+=============================
+
+Associativity represents the groupings of the various platform resources into
+domains of substantially similar mean performance relative to resources outside
+of that domain. Resources subsets of a given domain that exhibit better
+performance relative to each other than relative to other resources subsets
+are represented as being members of a sub-grouping domain. This performance
+characteristic is presented in terms of NUMA node distance within the Linux kernel.
+From the platform view, these groups are also referred to as domains.
+
+PAPR interface currently supports different ways of communicating these resource
+grouping details to the OS. These are referred to as Form 0, Form 1 and Form2
+associativity grouping. Form 0 is the older format and is now considered deprecated.
+
+Hypervisor indicates the type/form of associativity used via "ibm,arcitecture-vec-5 property".
+Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates usage of Form 0 or Form 1.
+A value of 1 indicates the usage of Form 1 associativity. For Form 2 associativity
+bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
+
+Form 0
+-----
+Form 0 associativity supports only two NUMA distance (LOCAL and REMOTE).
+
+Form 1
+-----
+With Form 1 a combination of ibm,associativity-reference-points and ibm,associativity
+device tree properties are used to determine the NUMA distance between resource groups/domains.
+
+The “ibm,associativity” property contains one or more lists of numbers (domainID)
+representing the resource’s platform grouping domains.
+
+The “ibm,associativity-reference-points” property contains one or more list of numbers
+(domainID index) that represents the 1 based ordinal in the associativity lists of the
+least significant boundary, with subsequent entries indicating progressively higher
+significant boundaries.
+
+ex:
+{ primary domainID index, secondary domainID index, tertiary domainID index.. }
+
+Linux kernel uses the domainID of the least significant boundary (aka primary domain)
+as the NUMA node id. Linux kernel computes NUMA distance between two domains by
+recursively comparing if they belong to the same higher-level domains. For mismatch
+at every higher level of the resource group, the kernel doubles the NUMA distance between
+the comparing domains.
+
+Form 2
+-------
+Form 2 associativity format adds separate device tree properties representing NUMA node distance
+thereby making the node distance computation flexible. Form 2 also allows flexible primary
+domain numbering. With numa distance computation now detached from the index value of
+"ibm,associativity" property, Form 2 allows a large number of primary domain ids at the
+same domainID index representing resource groups of different performance/latency characteristics.
+
+Hypervisor indicates the usage of FORM2 associativity using bit 2 of byte 5 in the
+"ibm,architecture-vec-5" property.
+
+"ibm,numa-lookup-index-table" property contains one or more list numbers representing
+the domainIDs present in the system. The offset of the domainID in this property is considered
+the domainID index.
+
+prop-encoded-array: The number N of the domainIDs encoded as with encode-int, followed by
+N domainID encoded as with encode-int
+
+For ex:
+ibm,numa-lookup-index-table =  {4, 0, 8, 250, 252}, domainID index for domainID 8 is 1.
+
+"ibm,numa-distance-table" property contains one or more list of numbers representing the NUMA
+distance between resource groups/domains present in the system.
+
+prop-encoded-array: The number N of the distance values encoded as with encode-int, followed by
+N distance values encoded as with encode-bytes. The max distance value we could encode is 255.
+
+For ex:
+ibm,numa-lookup-index-table =  {3, 0, 8, 40}
+ibm,numa-distance-table     =  {9, 10, 20, 80, 20, 10, 160, 80, 160, 10}
+
+  | 0    8   40
+--|------------
+  |
+0 | 10   20  80
+  |
+8 | 20   10  160
+  |
+40| 80   160  10
+
+With Form2 "ibm,associativity" for resources is listed as below:
+
+"ibm,associativity" property for resources in node 0, 8 and 40
+{ 4, 6, 7, 0, 0}
+{ 4, 6, 9, 8, 8}
+{ 4, 6, 7, 0, 40}
+
+With "ibm,associativity-reference-points"  { 0x4, 0x3, 0x2 }
+
+With Form2 the primary domainID and secondary domainID are used to identify the NUMA nodes
+the kernel should use when using persistent memory devices. Persistent memory devices
+can also be used as regular memory using DAX KMEM driver and primary domainID indicates
+the numa node number OS should use when using these devices as regular memory. Secondary
+domainID is the numa node number that should be used when using this device as
+persistent memory device. In the later case, we are interested in the locality of the
+device to an established numa node. In the above example, if the last row represents a
+persistent memory device/resource, NUMA node number 40 will be used when using the device
+as regular memory and NUMA node number 0 will be the device numa node when using it as
+a persistent memory device.
+
+ex:
+
+   --------------------------------------
+  |                            NUMA node0 |
+  |    ProcA -----> MEMA                  |
+  |     |                                 |
+  |	|                                 |
+  |	-------------------> PMEMB        |
+  |                                       |
+   ---------------------------------------
+
+   ---------------------------------------
+  |                            NUMA node1 |
+  |                                       |
+  |    ProcB -------> MEMC                |
+  |	|                                 |
+  |	-------------------> PMEMD        |
+  |                                       |
+  |                                       |
+   ---------------------------------------
+
+
+For a topology like the above application running of ProcA wants to find out
+persistent memory mount local to its NUMA node. Hence when using it as
+pmem fsdax mount or devdax device we want PMEMB to have associativity
+of NUMA node0 and PMEMD to have associativity of NUMA node1. But when
+we want to use it as memory using dax kmem driver, we want both PMEMB
+and PMEMD to appear as memory only NUMA node at a distance that is
+derived based on the latency of the media.
+
+Each resource (drcIndex) now also supports additional optional device tree properties.
+These properties are marked optional because the platform can choose not to export
+them and provide the system topology details using the earlier defined device tree
+properties alone. The optional device tree properties are used when adding new resources
+(DLPAR) and when the platform didn't provide the topology details of the domain which
+contains the newly added resource during boot.
+
+"ibm,numa-lookup-index" property contains a number representing the domainID index to be used
+when building the NUMA distance of the numa node to which this resource belongs. This can
+be looked at as the index at which this new domainID would have appeared in
+"ibm,numa-lookup-index-table" if the domain was present during boot. The domainID
+of the new resource can be obtained from the existing "ibm,associativity" property. This
+can be used to build distance information of a newly onlined NUMA node via DLPAR operation.
+The value is 1 based array index value.
+
+prop-encoded-array: An integer encoded as with encode-int specifying the domainID index
+
+"ibm,numa-distance" property contains one or more list of numbers presenting the NUMA distance
+from this resource domain to other resources.
+
+prop-encoded-array: The number N of the distance values encoded as with encode-int, followed by
+N distance values encoded as with encode-bytes. The max distance value we could encode is 255.
+
+For ex:
+ibm,associativity     = { 4, 5, 6, 7, 50}
+ibm,numa-lookup-index = { 4 }
+ibm,numa-distance   =  {8, 160, 255, 80, 10, 160, 255, 80, 10}
+
+resulting in a new toplogy as below.
+  | 0    8   40   50
+--|------------------
+  |
+0 | 10   20  80   160
+  |
+8 | 20   10  160  255
+  |
+40| 80   160  10  80
+  |
+50| 160  255  80  10
+
diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 60b631161360..97a3bd9ffeb9 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -53,6 +53,7 @@
 #define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
 #define FW_FEATURE_STUFF_TCE	ASM_CONST(0x0000008000000000)
 #define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
+#define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -73,7 +74,7 @@ enum {
 		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
 		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
-		FW_FEATURE_RPT_INVALIDATE,
+		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
 	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index df9fec9d232c..5c80152e8f18 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -149,6 +149,7 @@ extern int of_read_drc_info_cell(struct property **prop,
 #define OV5_XCMO		0x0440	/* Page Coalescing */
 #define OV5_FORM1_AFFINITY	0x0580	/* FORM1 NUMA affinity */
 #define OV5_PRRN		0x0540	/* Platform Resource Reassignment */
+#define OV5_FORM2_AFFINITY	0x0520	/* Form2 NUMA affinity */
 #define OV5_HP_EVT		0x0604	/* Hot Plug Event support */
 #define OV5_RESIZE_HPT		0x0601	/* Hash Page Table resizing */
 #define OV5_PFO_HW_RNG		0x1180	/* PFO Random Number Generator */
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 64b9593038a7..496fdac54c29 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1070,7 +1070,8 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 #else
 		0,
 #endif
-		.associativity = OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN),
+		.associativity = OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN) |
+		OV5_FEAT(OV5_FORM2_AFFINITY),
 		.bin_opts = OV5_FEAT(OV5_RESIZE_HPT) | OV5_FEAT(OV5_HP_EVT),
 		.micro_checkpoint = 0,
 		.reserved0 = 0,
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index d32729f235b8..5a7d94960fb7 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -56,12 +56,17 @@ static int n_mem_addr_cells, n_mem_size_cells;
 
 #define FORM0_AFFINITY 0
 #define FORM1_AFFINITY 1
+#define FORM2_AFFINITY 2
 static int affinity_form;
 
 #define MAX_DISTANCE_REF_POINTS 4
 static int max_associativity_domain_index;
 static const __be32 *distance_ref_points;
 static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINTS];
+static int numa_distance_table[MAX_NUMNODES][MAX_NUMNODES] = {
+	[0 ... MAX_NUMNODES - 1] = { [0 ... MAX_NUMNODES - 1] = -1 }
+};
+static int numa_id_index_table[MAX_NUMNODES];
 
 /*
  * Allocate node_to_cpumask_map based on number of available nodes
@@ -166,6 +171,27 @@ static void unmap_cpu_from_node(unsigned long cpu)
 }
 #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
 
+/*
+ * With FORM2 if we are not using logical domain ids, we will find
+ * both primary and seconday domains with same value. Hence always
+ * start comparison from secondary domains
+ */
+static int __cpu_form2_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+{
+	int dist = 0;
+
+	int i, index;
+
+	for (i = 1; i < max_associativity_domain_index; i++) {
+		index = be32_to_cpu(distance_ref_points[i]);
+		if (cpu1_assoc[index] == cpu2_assoc[index])
+			break;
+		dist++;
+	}
+
+	return dist;
+}
+
 static int __cpu_form1_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	int dist = 0;
@@ -178,7 +204,6 @@ static int __cpu_form1_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 			break;
 		dist++;
 	}
-
 	return dist;
 }
 
@@ -186,8 +211,9 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	/* We should not get called with FORM0 */
 	VM_WARN_ON(affinity_form == FORM0_AFFINITY);
-
-	return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
+	if (affinity_form == FORM1_AFFINITY)
+		return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
+	return __cpu_form2_distance(cpu1_assoc, cpu2_assoc);
 }
 
 /* must hold reference to node during call */
@@ -201,7 +227,9 @@ int __node_distance(int a, int b)
 	int i;
 	int distance = LOCAL_DISTANCE;
 
-	if (affinity_form == FORM0_AFFINITY)
+	if (affinity_form == FORM2_AFFINITY)
+		return numa_distance_table[a][b];
+	else if (affinity_form == FORM0_AFFINITY)
 		return ((a == b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
 
 	for (i = 0; i < max_associativity_domain_index; i++) {
@@ -303,15 +331,116 @@ static void initialize_form1_numa_distance(struct device_node *node)
 
 /*
  * Used to update distance information w.r.t newly added node.
+ * ibm,numa-lookup-index -> 4
+ * ibm,numa-distance -> {5, 20, 40, 60, 80, 10 }
  */
 void update_numa_distance(struct device_node *node)
 {
+	int i, nid, other_nid, other_nid_index = 0;
+	const __be32 *numa_indexp;
+	const __u8  *numa_distancep;
+	int numa_index, max_numa_index, numa_distance;
+
 	if (affinity_form == FORM0_AFFINITY)
 		return;
 	else if (affinity_form == FORM1_AFFINITY) {
 		initialize_form1_numa_distance(node);
 		return;
 	}
+	/* FORM2 affinity  */
+
+	nid = of_node_to_nid_single(node);
+	if (nid == NUMA_NO_NODE)
+		return;
+
+	/* Already initialized */
+	if (numa_distance_table[nid][nid] != -1)
+		return;
+	/*
+	 * update node distance if not already populated.
+	 */
+	numa_distancep = of_get_property(node, "ibm,numa-distance", NULL);
+	if (!numa_distancep)
+		return;
+
+	numa_indexp = of_get_property(node, "ibm,numa-lookup-index", NULL);
+	if (!numa_indexp)
+		return;
+
+	numa_index = of_read_number(numa_indexp, 1);
+	/*
+	 * update the numa_id_index_table. Device tree look at index table as
+	 * 1 based array indexing.
+	 */
+	numa_id_index_table[numa_index - 1] = nid;
+
+	max_numa_index = of_read_number((const __be32 *)numa_distancep, 1);
+	VM_WARN_ON(max_numa_index != 2 * numa_index);
+	/* Skip the size which is encoded int */
+	numa_distancep += sizeof(__be32);
+
+	/*
+	 * First fill the distance information from other node to this node.
+	 */
+	other_nid_index = 0;
+	for (i = 0; i < numa_index; i++) {
+		numa_distance = numa_distancep[i];
+		other_nid = numa_id_index_table[other_nid_index++];
+		numa_distance_table[other_nid][nid] = numa_distance;
+	}
+
+	other_nid_index = 0;
+	for (; i < max_numa_index; i++) {
+		numa_distance = numa_distancep[i];
+		other_nid = numa_id_index_table[other_nid_index++];
+		numa_distance_table[nid][other_nid] = numa_distance;
+	}
+}
+
+/*
+ * ibm,numa-lookup-index-table= {N, domainid1, domainid2, ..... domainidN}
+ * ibm,numa-distance-table = { N, 1, 2, 4, 5, 1, 6, .... N elements}
+ */
+static void initialize_form2_numa_distance_lookup_table(struct device_node *root)
+{
+	const __u8 *numa_dist_table;
+	const __be32 *numa_lookup_index;
+	int numa_dist_table_length;
+	int max_numa_index, distance_index;
+	int i, curr_row = 0, curr_column = 0;
+
+	numa_lookup_index = of_get_property(root, "ibm,numa-lookup-index-table", NULL);
+	max_numa_index = of_read_number(&numa_lookup_index[0], 1);
+
+	/* first element of the array is the size and is encode-int */
+	numa_dist_table = of_get_property(root, "ibm,numa-distance-table", NULL);
+	numa_dist_table_length = of_read_number((const __be32 *)&numa_dist_table[0], 1);
+	/* Skip the size which is encoded int */
+	numa_dist_table += sizeof(__be32);
+
+	pr_debug("numa_dist_table_len = %d, numa_dist_indexes_len = %d \n",
+		 numa_dist_table_length, max_numa_index);
+
+	for (i = 0; i < max_numa_index; i++)
+		/* +1 skip the max_numa_index in the property */
+		numa_id_index_table[i] = of_read_number(&numa_lookup_index[i + 1], 1);
+
+
+	VM_WARN_ON(numa_dist_table_length != max_numa_index * max_numa_index);
+
+	for (distance_index = 0; distance_index < numa_dist_table_length; distance_index++) {
+		int nodeA = numa_id_index_table[curr_row];
+		int nodeB = numa_id_index_table[curr_column++];
+
+		numa_distance_table[nodeA][nodeB] = numa_dist_table[distance_index];
+
+		pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, numa_distance_table[nodeA][nodeB]);
+		if (curr_column >= max_numa_index) {
+			curr_row++;
+			/* reset the column */
+			curr_column = 0;
+		}
+	}
 }
 
 static int __init find_primary_domain_index(void)
@@ -324,6 +453,9 @@ static int __init find_primary_domain_index(void)
 	 */
 	if (firmware_has_feature(FW_FEATURE_OPAL)) {
 		affinity_form = FORM1_AFFINITY;
+	} else if (firmware_has_feature(FW_FEATURE_FORM2_AFFINITY)) {
+		dbg("Using form 2 affinity\n");
+		affinity_form = FORM2_AFFINITY;
 	} else if (firmware_has_feature(FW_FEATURE_FORM1_AFFINITY)) {
 		dbg("Using form 1 affinity\n");
 		affinity_form = FORM1_AFFINITY;
@@ -368,8 +500,17 @@ static int __init find_primary_domain_index(void)
 
 		index = of_read_number(&distance_ref_points[1], 1);
 	} else {
+		/*
+		 * Both FORM1 and FORM2 affinity find the primary domain details
+		 * at the same offset.
+		 */
 		index = of_read_number(distance_ref_points, 1);
 	}
+	/*
+	 * If it is FORM2 also initialize the distance table here.
+	 */
+	if (affinity_form == FORM2_AFFINITY)
+		initialize_form2_numa_distance_lookup_table(root);
 
 	/*
 	 * Warn and cap if the hardware supports more than
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 5d4c2bc20bba..f162156b7b68 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -123,6 +123,7 @@ vec5_fw_features_table[] = {
 	{FW_FEATURE_PRRN,		OV5_PRRN},
 	{FW_FEATURE_DRMEM_V2,		OV5_DRMEM_V2},
 	{FW_FEATURE_DRC_INFO,		OV5_DRC_INFO},
+	{FW_FEATURE_FORM2_AFFINITY,	OV5_FORM2_AFFINITY},
 };
 
 static void __init fw_vec5_feature_init(const char *vec5, unsigned long len)
-- 
2.31.1

