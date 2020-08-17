Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46692464A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 12:40:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVVtq55wszDqRy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 20:40:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q63M/Uyy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVVjt3tSvzDqVJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:32:50 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HAWAkf086089; Mon, 17 Aug 2020 06:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lMmYr+jJk6Ae8vkDqA/gs80vyALVZfbh/3BbAjpq+AU=;
 b=q63M/UyyQBx7dbSqZMLNDNlK3ioFFAD9Yh/aTBXdhuvZQE9+eSTZXWmmbRmlpa6ccmuU
 i4ScwdBTyHMLrBGn/hMl32LUjaV/FnlGgInSahw1UM5KvOZJFI1TvvzHlFibC8f0jEIX
 kubP5FVxRKtBv7/QWmawP60tDjjiqQ2IB80I1nRN7uhEb6ldQdFrFKLV0EBROXGoSIxO
 +vPfcpRerKQ0bSNUL/NPARu9Apo4lO2D3KGaa9XuOwy1tKNGV3rWOwFOgGi3Bbsgsy3q
 f3eCT+sL7cA1ohNju7hb+IDua7Db2wHrNkO+fH9oAt1NOST9Ro20MIB25WvKMbKKgIGp tw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y85ycs0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:32:45 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HAUedl026906;
 Mon, 17 Aug 2020 10:32:44 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 32x7b8g2ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 10:32:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HAWiEZ53084614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 10:32:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00DAE112062;
 Mon, 17 Aug 2020 10:32:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8B97112067;
 Mon, 17 Aug 2020 10:32:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.56])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 10:32:41 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 1/3] powerpc/numa: Introduce logical numa id
Date: Mon, 17 Aug 2020 16:02:36 +0530
Message-Id: <20200817103238.158133-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=2 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170075
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We use ibm,associativity and ibm,associativity-lookup-arrays to derive the numa
node numbers. These device tree properties are firmware indicated grouping of
resources based on their hierarchy in the platform. These numbers (group id) are
not sequential and hypervisor/firmware can follow different numbering schemes.
For ex: on powernv platforms, we group them in the below order.

 *     - CCM node ID
 *     - HW card ID
 *     - HW module ID
 *     - Chip ID
 *     - Core ID

Based on ibm,associativity-reference-points we use one of the above group ids as
Linux NUMA node id. (On PowerNV platform Chip ID is used). This results
in Linux reporting non-linear NUMA node id and which also results in Linux
reporting empty node 0 NUMA nodes.

This can  be resolved by mapping the firmware provided group id to a logical Linux
NUMA id. In this patch, we do this only for pseries platforms considering the
firmware group id is a virtualized entity and users would not have drawn any
conclusion based on the Linux Numa Node id.

On PowerNV platform since we have historically mapped Chip ID as Linux NUMA node
id, we keep the existing Linux NUMA node id numbering.

Before Fix:
 # numactl -H
available: 2 nodes (0-1)
node 0 cpus:
node 0 size: 0 MB
node 0 free: 0 MB
node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71
node 1 size: 50912 MB
node 1 free: 45248 MB
node distances:
node   0   1
  0:  10  40
  1:  40  10

after fix
 # numactl  -H
available: 1 nodes (0)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71
node 0 size: 50912 MB
node 0 free: 49724 MB
node distances:
node   0
  0:  10

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h |  5 ++
 arch/powerpc/mm/numa.c              | 74 ++++++++++++++++++++++++-----
 2 files changed, 68 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f0b6300e7dd3..7c18883cee9c 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -118,5 +118,10 @@ int get_physical_package_id(int cpu);
 #endif
 #endif
 
+struct affinity_domain {
+	int id;
+};
+
+int affinity_domain_to_nid(struct affinity_domain *domain);
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_TOPOLOGY_H */
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 1f61fa2148b5..d29f60e15777 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -221,26 +221,76 @@ static void initialize_distance_lookup_table(int nid,
 	}
 }
 
+
+static int domain_id_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  -1 };
+
+static int __affinity_domain_to_nid(int domain_id, int max_nid)
+{
+	int i;
+
+	for (i = 0; i < max_nid; i++) {
+		if (domain_id_map[i] == domain_id)
+			return i;
+	}
+	return NUMA_NO_NODE;
+}
+
+int affinity_domain_to_nid(struct affinity_domain *domain)
+{
+	int nid, domain_id;
+	static int last_nid = 0;
+	static DEFINE_SPINLOCK(node_id_lock);
+
+	domain_id = domain->id;
+	/*
+	 * For PowerNV we don't change the node id. This helps to avoid
+	 * confusion w.r.t the expected node ids. On pseries, node numbers
+	 * are virtualized. Hence do logical node id for pseries.
+	 */
+	if (!firmware_has_feature(FW_FEATURE_LPAR))
+		return domain_id;
+
+	if (domain_id ==  -1)
+		return NUMA_NO_NODE;
+
+	nid = __affinity_domain_to_nid(domain_id, last_nid);
+	if (nid == NUMA_NO_NODE) {
+		spin_lock(&node_id_lock);
+		/*  recheck with lock held */
+		nid = __affinity_domain_to_nid(domain_id, last_nid);
+		if (nid == NUMA_NO_NODE && last_nid < MAX_NUMNODES) {
+			nid = last_nid++;
+			domain_id_map[nid] = domain_id;
+		}
+		spin_unlock(&node_id_lock);
+	}
+
+	return nid;
+}
+
 /*
  * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
  * info is found.
  */
 static int associativity_to_nid(const __be32 *associativity)
 {
+	struct affinity_domain domain = { .id = -1 };
 	int nid = NUMA_NO_NODE;
 
 	if (!numa_enabled)
 		goto out;
 
 	if (of_read_number(associativity, 1) >= min_common_depth)
-		nid = of_read_number(&associativity[min_common_depth], 1);
+		domain.id = of_read_number(&associativity[min_common_depth], 1);
 
 	/* POWER4 LPAR uses 0xffff as invalid node */
-	if (nid == 0xffff || nid >= nr_node_ids)
-		nid = NUMA_NO_NODE;
+	if (domain.id == 0xffff)
+		domain.id = -1;
+
+	nid = affinity_domain_to_nid(&domain);
 
 	if (nid > 0 &&
-		of_read_number(associativity, 1) >= distance_ref_points_depth) {
+	    of_read_number(associativity, 1) >= distance_ref_points_depth) {
 		/*
 		 * Skip the length field and send start of associativity array
 		 */
@@ -432,25 +482,27 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
  */
 static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 {
+	struct affinity_domain domain;
 	struct assoc_arrays aa = { .arrays = NULL };
-	int default_nid = NUMA_NO_NODE;
-	int nid = default_nid;
+	int nid = NUMA_NO_NODE;
 	int rc, index;
 
 	if ((min_common_depth < 0) || !numa_enabled)
-		return default_nid;
+		return NUMA_NO_NODE;
 
 	rc = of_get_assoc_arrays(&aa);
 	if (rc)
-		return default_nid;
+		return NUMA_NO_NODE;
 
 	if (min_common_depth <= aa.array_sz &&
 	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
 		index = lmb->aa_index * aa.array_sz + min_common_depth - 1;
-		nid = of_read_number(&aa.arrays[index], 1);
+		domain.id = of_read_number(&aa.arrays[index], 1);
 
-		if (nid == 0xffff || nid >= nr_node_ids)
-			nid = default_nid;
+		if (domain.id == 0xffff)
+			domain.id = -1;
+
+		nid = affinity_domain_to_nid(&domain);
 
 		if (nid > 0) {
 			index = lmb->aa_index * aa.array_sz;
-- 
2.26.2

