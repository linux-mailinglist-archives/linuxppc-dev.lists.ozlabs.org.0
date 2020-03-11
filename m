Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E2A182594
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 00:09:53 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48d72k0qq2zDqYX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 10:09:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48d71H3RYTzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 10:08:35 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BN5kqY119458; Wed, 11 Mar 2020 19:08:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yq9ar85x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 19:08:18 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02BN5qrx120034;
 Wed, 11 Mar 2020 19:08:18 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yq9ar85wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 19:08:18 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02BN52Pd032471;
 Wed, 11 Mar 2020 23:08:17 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 2ypjxrag3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 23:08:17 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02BN8Gxx36569414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 23:08:16 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DB11B2065;
 Wed, 11 Mar 2020 23:08:16 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D393B2064;
 Wed, 11 Mar 2020 23:08:15 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 11 Mar 2020 23:08:15 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v1] pseries/drmem: don't cache node id in drmem_lmb struct
Date: Wed, 11 Mar 2020 18:08:15 -0500
Message-Id: <20200311230815.1432367-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_11:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=768
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110130
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Nathan Fontenont <ndfont@gmail.com>,
 David Hildenbrand <david@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At memory hot-remove time we can retrieve an LMB's nid from its
corresponding memory_block.  There is no need to store the nid
in multiple locations.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
The linear search in powerpc's memory_add_physaddr_to_nid() has become a
bottleneck at boot on systems with many LMBs.

As described in this patch here:

https://lore.kernel.org/linuxppc-dev/20200221172901.1596249-2-cheloha@linux.ibm.com/

the linear search seriously cripples drmem_init().

The obvious solution (shown in that patch) is to just make the search
in memory_add_physaddr_to_nid() faster.  An XArray seems well-suited
to the task of mapping an address range to an LMB object.

The less obvious approach is to just call memory_add_physaddr_to_nid()
in fewer places.

I'm not sure which approach is correct, hence the RFC.

The attached patch is an example of how we could just eliminate the
memory_add_physaddr_to_nid() calls during drmem_init().  Unless this
is somehow an abuse of the memory_block I think retrieving the nid in
this way deduplicates memoization.

There is another spot where we don't *need* to search by address to
find the node id.  In dlpar_memory_add() we're calling lmb_set_nid(),
which is just memory_add_physaddr_to_nid().  But we could easily bypass
the search and call of_drconf_to_nid_single() directly with the LMB we
already have a pointer to.

Then again, I see callers like the xen balloon driver and probe_store()
that seemingly need to do an address-to-nid lookup.

So, does memory_add_physaddr_to_nid() need to be fast?  Should I bite
the bullet and make it fast so we can leverage it without slowdown?
Or is calling it in fewer places an acceptable approach?

 arch/powerpc/include/asm/drmem.h              | 21 -------------------
 arch/powerpc/mm/drmem.c                       |  6 +-----
 .../platforms/pseries/hotplug-memory.c        | 19 ++++++++++-------
 3 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 3d76e1c388c2..4e7b6b70e366 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -13,9 +13,6 @@ struct drmem_lmb {
 	u32     drc_index;
 	u32     aa_index;
 	u32     flags;
-#ifdef CONFIG_MEMORY_HOTPLUG
-	int	nid;
-#endif
 };
 
 struct drmem_lmb_info {
@@ -103,22 +100,4 @@ static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
 	lmb->aa_index = 0xffffffff;
 }
 
-#ifdef CONFIG_MEMORY_HOTPLUG
-static inline void lmb_set_nid(struct drmem_lmb *lmb)
-{
-	lmb->nid = memory_add_physaddr_to_nid(lmb->base_addr);
-}
-static inline void lmb_clear_nid(struct drmem_lmb *lmb)
-{
-	lmb->nid = -1;
-}
-#else
-static inline void lmb_set_nid(struct drmem_lmb *lmb)
-{
-}
-static inline void lmb_clear_nid(struct drmem_lmb *lmb)
-{
-}
-#endif
-
 #endif /* _ASM_POWERPC_LMB_H */
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 59327cefbc6a..873fcfc7b875 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -362,10 +362,8 @@ static void __init init_drmem_v1_lmbs(const __be32 *prop)
 	if (!drmem_info->lmbs)
 		return;
 
-	for_each_drmem_lmb(lmb) {
+	for_each_drmem_lmb(lmb)
 		read_drconf_v1_cell(lmb, &prop);
-		lmb_set_nid(lmb);
-	}
 }
 
 static void __init init_drmem_v2_lmbs(const __be32 *prop)
@@ -410,8 +408,6 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
 
 			lmb->aa_index = dr_cell.aa_index;
 			lmb->flags = dr_cell.flags;
-
-			lmb_set_nid(lmb);
 		}
 	}
 }
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index a4d40a3ceea3..f6d4236286cf 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -376,25 +376,29 @@ static int dlpar_add_lmb(struct drmem_lmb *);
 
 static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 {
+	struct memory_block *mem_block;
 	unsigned long block_sz;
 	int rc;
 
 	if (!lmb_is_removable(lmb))
 		return -EINVAL;
 
+	mem_block = lmb_to_memblock(lmb);
+	if (mem_block == NULL)
+		return -EINVAL;
+
 	rc = dlpar_offline_lmb(lmb);
 	if (rc)
 		return rc;
 
 	block_sz = pseries_memory_block_size();
 
-	__remove_memory(lmb->nid, lmb->base_addr, block_sz);
+	__remove_memory(mem_block->nid, lmb->base_addr, block_sz);
 
 	/* Update memory regions for memory remove */
 	memblock_remove(lmb->base_addr, block_sz);
 
 	invalidate_lmb_associativity_index(lmb);
-	lmb_clear_nid(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
 
 	return 0;
@@ -651,7 +655,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 static int dlpar_add_lmb(struct drmem_lmb *lmb)
 {
 	unsigned long block_sz;
-	int rc;
+	int nid, rc;
 
 	if (lmb->flags & DRCONF_MEM_ASSIGNED)
 		return -EINVAL;
@@ -662,11 +666,13 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		return rc;
 	}
 
-	lmb_set_nid(lmb);
 	block_sz = memory_block_size_bytes();
 
+	/* Find the node id for this address. */
+	nid = memory_add_physaddr_to_nid(lmb->base_addr);
+
 	/* Add the memory */
-	rc = __add_memory(lmb->nid, lmb->base_addr, block_sz);
+	rc = __add_memory(nid, lmb->base_addr, block_sz);
 	if (rc) {
 		invalidate_lmb_associativity_index(lmb);
 		return rc;
@@ -674,9 +680,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	rc = dlpar_online_lmb(lmb);
 	if (rc) {
-		__remove_memory(lmb->nid, lmb->base_addr, block_sz);
+		__remove_memory(nid, lmb->base_addr, block_sz);
 		invalidate_lmb_associativity_index(lmb);
-		lmb_clear_nid(lmb);
 	} else {
 		lmb->flags |= DRCONF_MEM_ASSIGNED;
 	}
-- 
2.24.1

