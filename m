Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 365C5C111C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 17:01:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46gX1S594WzDqsN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 01:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46gWrg6H34zDqsl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2019 00:53:55 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8SEqVNJ047237; Sat, 28 Sep 2019 10:53:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2va1u9g6k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 28 Sep 2019 10:53:48 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8SErm2q048777;
 Sat, 28 Sep 2019 10:53:48 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2va1u9g6ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 28 Sep 2019 10:53:48 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8SEnWb1024973;
 Sat, 28 Sep 2019 14:53:47 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 2v9y563qhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 28 Sep 2019 14:53:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8SErkg365143282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 28 Sep 2019 14:53:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6757BC605D;
 Sat, 28 Sep 2019 14:53:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 927D8C6062;
 Sat, 28 Sep 2019 14:53:44 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.47.160])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 28 Sep 2019 14:53:44 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH 3/3] powerpc/book3s64/hash: Use secondary hash for bolted
 mapping if the primary is full
Date: Sat, 28 Sep 2019 20:23:32 +0530
Message-Id: <20190928145332.32120-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190928145332.32120-1-aneesh.kumar@linux.ibm.com>
References: <20190928145332.32120-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-28_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909280160
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With bolted hash page table entry, kernel currently only use primary hash group
when inserting the hash page table entry. In the rare case where we find all the
8 primary hash slot occupied by bolted entries, this can result in hash page
table insert failure for bolted entries. Avoid this by using the secondary hash
group.
This is different from what kernel does the non-bolted mapping. With non-bolted
we try secondary before removing an existing entry from hash page table group.
With bolted we prefer primary hash group and hence try to insert the page table
entry by removing a slot from primary before trying the secondary hash group.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 38 ++++++++++++++++++++------
 arch/powerpc/mm/book3s64/hash_utils.c  | 13 ++++++++-
 arch/powerpc/platforms/pseries/lpar.c  | 14 ++++++++--
 3 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 90ab4f31e2b3..f1d979cc662a 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -459,19 +459,12 @@ static long native_hpte_updatepp(unsigned long slot, unsigned long newpp,
 	return ret;
 }
 
-static long native_hpte_find(unsigned long vpn, int psize, int ssize)
+static long __native_hpte_find(unsigned long want_v, unsigned long slot)
 {
 	struct hash_pte *hptep;
-	unsigned long hash;
+	unsigned long hpte_v;
 	unsigned long i;
-	long slot;
-	unsigned long want_v, hpte_v;
 
-	hash = hpt_hash(vpn, mmu_psize_defs[psize].shift, ssize);
-	want_v = hpte_encode_avpn(vpn, psize, ssize);
-
-	/* Bolted mappings are only ever in the primary group */
-	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
 	for (i = 0; i < HPTES_PER_GROUP; i++) {
 
 		hptep = htab_address + slot;
@@ -485,6 +478,33 @@ static long native_hpte_find(unsigned long vpn, int psize, int ssize)
 	return -1;
 }
 
+static long native_hpte_find(unsigned long vpn, int psize, int ssize)
+{
+	unsigned long hpte_group;
+	unsigned long want_v;
+	unsigned long hash;
+	long slot;
+
+	hash = hpt_hash(vpn, mmu_psize_defs[psize].shift, ssize);
+	want_v = hpte_encode_avpn(vpn, psize, ssize);
+
+	/*
+	 * We try to keep bolted entries always in primary hash
+	 * But in some case we can find them in secondary too.
+	 */
+	hpte_group = (hash & htab_hash_mask) * HPTES_PER_GROUP;
+	slot = __native_hpte_find(want_v, hpte_group);
+	if (slot < 0) {
+		/* Try in secondary */
+		hpte_group = (~hash & htab_hash_mask) * HPTES_PER_GROUP;
+		slot = __native_hpte_find(want_v, hpte_group);
+		if (slot < 0)
+			return -1;
+	}
+
+	return slot;
+}
+
 /*
  * Update the page protection bits. Intended to be used to create
  * guard pages for kernel data structures on pages which are bolted
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 9afff4fa8b07..ae38120a94e3 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -263,6 +263,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 		unsigned long vsid = get_kernel_vsid(vaddr, ssize);
 		unsigned long vpn  = hpt_vpn(vaddr, vsid, ssize);
 		unsigned long tprot = prot;
+		bool secondary_hash = false;
 
 		/*
 		 * If we hit a bad address return error.
@@ -291,17 +292,27 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 		hpteg = ((hash & htab_hash_mask) * HPTES_PER_GROUP);
 
 		BUG_ON(!mmu_hash_ops.hpte_insert);
+repeat:
 		ret = mmu_hash_ops.hpte_insert(hpteg, vpn, paddr, tprot,
 					       HPTE_V_BOLTED, psize, psize,
 					       ssize);
 		if (ret == -1) {
-			/* Try to remove a non bolted entry */
+			/*
+			 * Try to to keep bolted entries in primary.
+			 * Remove non bolted entries and try insert again
+			 */
 			ret = mmu_hash_ops.hpte_remove(hpteg);
 			if (ret != -1)
 				ret = mmu_hash_ops.hpte_insert(hpteg, vpn, paddr, tprot,
 							       HPTE_V_BOLTED, psize, psize,
 							       ssize);
+			if (ret == -1 && !secondary_hash) {
+				secondary_hash = true;
+				hpteg = ((~hash & htab_hash_mask) * HPTES_PER_GROUP);
+				goto repeat;
+			}
 		}
+
 		if (ret < 0)
 			break;
 
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index fdd8933d15a2..0acb2f096dd8 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -922,11 +922,19 @@ static long pSeries_lpar_hpte_find(unsigned long vpn, int psize, int ssize)
 	hash = hpt_hash(vpn, mmu_psize_defs[psize].shift, ssize);
 	want_v = hpte_encode_avpn(vpn, psize, ssize);
 
-	/* Bolted entries are always in the primary group */
+	/*
+	 * We try to keep bolted entries always in primary hash
+	 * But in some case we can find them in secondary too.
+	 */
 	hpte_group = (hash & htab_hash_mask) * HPTES_PER_GROUP;
 	slot = __pSeries_lpar_hpte_find(want_v, hpte_group);
-	if (slot < 0)
-		return -1;
+	if (slot < 0) {
+		/* Try in secondary */
+		hpte_group = (~hash & htab_hash_mask) * HPTES_PER_GROUP;
+		slot = __pSeries_lpar_hpte_find(want_v, hpte_group);
+		if (slot < 0)
+			return -1;
+	}
 	return hpte_group + slot;
 }
 
-- 
2.21.0

