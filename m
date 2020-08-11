Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7A2414B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 03:53:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQbT11FVRzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 11:53:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQbQy1wmMzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 11:51:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NvVO/YfK; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BQbQy0gLfz8tXn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 11:51:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BQbQy0Jdqz9sTR; Tue, 11 Aug 2020 11:51:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NvVO/YfK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BQbQx3c02z9sTN;
 Tue, 11 Aug 2020 11:51:20 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07B1VsjR051436; Mon, 10 Aug 2020 21:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=o9X6cXtOeV5nAldI/qEUMT1kem4qWT6hFxxUnVfNXz4=;
 b=NvVO/YfKacpntFLdeYkYOKncUlAANe99irpZpzxo9sOsJMCImayoqbxbygLuTNapTTZm
 0jcKAUEz6ylDMnwHOJOp22rgtkQU0kiptB3qwCp36pLWhJCI3m88ngJpdYpqjnVUT399
 sSxTiERew6+mTpq2ikO7JCkHtAcC+jC8ZfoQ6/UgohCaCqGk3X3QX+9zE4wOK69zI2pn
 iZlMMUhKtI/+/pEOx6Wrej89f4qz8bCFqAEcZLsRIbKToW1oOaHGxWdVpdWJDZJqnR3a
 tLCv4k3ShDFD/oThkycX2i6itj4qw2vst259fvJ/Kt4WNNiLcLSB7kdBVEM0VtJD8EM1 Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6edeqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 21:51:17 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07B1WcTo053857;
 Mon, 10 Aug 2020 21:51:17 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6edeqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 21:51:17 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07B1nrxF022933;
 Tue, 11 Aug 2020 01:51:16 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 32skp8wygy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 01:51:16 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07B1pGx153608916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Aug 2020 01:51:16 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CB44124058;
 Tue, 11 Aug 2020 01:51:16 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7F53124052;
 Tue, 11 Aug 2020 01:51:15 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 Aug 2020 01:51:15 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3] pseries/drmem: don't cache node id in drmem_lmb struct
Date: Mon, 10 Aug 2020 20:51:15 -0500
Message-Id: <20200811015115.63677-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_22:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=929 malwarescore=0 suspectscore=1 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008110005
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
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Michal Suchanek <msuchanek@suse.de>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At memory hot-remove time we can retrieve an LMB's nid from its
corresponding memory_block.  There is no need to store the nid
in multiple locations.

Note that lmb_to_memblock() uses find_memory_block() to get the
corresponding memory_block.  As find_memory_block() runs in sub-linear
time this approach is negligibly slower than what we do at present.

In exchange for this lookup at hot-remove time we no longer need to
call memory_add_physaddr_to_nid() during drmem_init() for each LMB.
On powerpc, memory_add_physaddr_to_nid() is a linear search, so this
spares us an O(n^2) initialization during boot.

On systems with many LMBs that initialization overhead is palpable and
disruptive.  For example, on a box with 249854 LMBs we're seeing
drmem_init() take upwards of 30 seconds to complete:

[   53.721639] drmem: initializing drmem v2
[   80.604346] watchdog: BUG: soft lockup - CPU#65 stuck for 23s! [swapper/0:1]
[   80.604377] Modules linked in:
[   80.604389] CPU: 65 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2+ #4
[   80.604397] NIP:  c0000000000a4980 LR: c0000000000a4940 CTR: 0000000000000000
[   80.604407] REGS: c0002dbff8493830 TRAP: 0901   Not tainted  (5.6.0-rc2+)
[   80.604412] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44000248  XER: 0000000d
[   80.604431] CFAR: c0000000000a4a38 IRQMASK: 0
[   80.604431] GPR00: c0000000000a4940 c0002dbff8493ac0 c000000001904400 c0003cfffffede30
[   80.604431] GPR04: 0000000000000000 c000000000f4095a 000000000000002f 0000000010000000
[   80.604431] GPR08: c0000bf7ecdb7fb8 c0000bf7ecc2d3c8 0000000000000008 c00c0002fdfb2001
[   80.604431] GPR12: 0000000000000000 c00000001e8ec200
[   80.604477] NIP [c0000000000a4980] hot_add_scn_to_nid+0xa0/0x3e0
[   80.604486] LR [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0
[   80.604492] Call Trace:
[   80.604498] [c0002dbff8493ac0] [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0 (unreliable)
[   80.604509] [c0002dbff8493b20] [c000000000087c10] memory_add_physaddr_to_nid+0x20/0x60
[   80.604521] [c0002dbff8493b40] [c0000000010d4880] drmem_init+0x25c/0x2f0
[   80.604530] [c0002dbff8493c10] [c000000000010154] do_one_initcall+0x64/0x2c0
[   80.604540] [c0002dbff8493ce0] [c0000000010c4aa0] kernel_init_freeable+0x2d8/0x3a0
[   80.604550] [c0002dbff8493db0] [c000000000010824] kernel_init+0x2c/0x148
[   80.604560] [c0002dbff8493e20] [c00000000000b648] ret_from_kernel_thread+0x5c/0x74
[   80.604567] Instruction dump:
[   80.604574] 392918e8 e9490000 e90a000a e92a0000 80ea000c 1d080018 3908ffe8 7d094214
[   80.604586] 7fa94040 419d00dc e9490010 714a0088 <2faa0008> 409e00ac e9490000 7fbe5040
[   89.047390] drmem: 249854 LMB(s)

With a patched kernel on the same machine we're no longer seeing the
soft lockup.  drmem_init() now completes in negligible time, even when
the LMB count is large.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
v1:
 - RFC

v2:
 - Adjusted commit message.
 - Miscellaneous cleanup.

v3:
 - Correct issue found by Laurent Dufour <ldufour@linux.vnet.ibm.com>:
   - Add missing put_device() call in dlpar_remove_lmb() for the
     lmb's associated mem_block.

 arch/powerpc/include/asm/drmem.h              | 21 ----------------
 arch/powerpc/mm/drmem.c                       |  6 +----
 .../platforms/pseries/hotplug-memory.c        | 24 ++++++++++++-------
 3 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 414d209f45bb..34e4e9b257f5 100644
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
@@ -104,22 +101,4 @@ static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
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
index 5ace2f9a277e..e34326d22400 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -356,25 +356,32 @@ static int dlpar_add_lmb(struct drmem_lmb *);
 
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
-	if (rc)
+	if (rc) {
+		put_device(&mem_block->dev);
 		return rc;
+	}
 
 	block_sz = pseries_memory_block_size();
 
-	__remove_memory(lmb->nid, lmb->base_addr, block_sz);
+	__remove_memory(mem_block->nid, lmb->base_addr, block_sz);
+	put_device(&mem_block->dev);
 
 	/* Update memory regions for memory remove */
 	memblock_remove(lmb->base_addr, block_sz);
 
 	invalidate_lmb_associativity_index(lmb);
-	lmb_clear_nid(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
 
 	return 0;
@@ -631,7 +638,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 static int dlpar_add_lmb(struct drmem_lmb *lmb)
 {
 	unsigned long block_sz;
-	int rc;
+	int nid, rc;
 
 	if (lmb->flags & DRCONF_MEM_ASSIGNED)
 		return -EINVAL;
@@ -642,11 +649,13 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
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
@@ -654,9 +663,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
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

