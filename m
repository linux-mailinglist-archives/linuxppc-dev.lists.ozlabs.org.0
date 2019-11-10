Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270FF640D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 03:57:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479dvm6lJFzF6Gc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 13:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="N9TYJLMe"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479dY46vxPzF3xT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 13:40:56 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFB7921019;
 Sun, 10 Nov 2019 02:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353654;
 bh=D6i0PBGpQi8DoXFXJF0XOJN1Ykh6p5p2Tl6AgfyLtJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N9TYJLMex/Lm5ZhSMOkvT1oSNAR5L2CS7LNX4bDsIurjnvP+myYTASJ84rrsl+enu
 ByveaekQyvk5eWjJJk+4SjOMdK96alkbRAFIqx/9h2iiEkhe0PWHo3gu/1aBXzGFkg
 9u/Oe9MpDnVPYHagz2Ni1fdrKayVD1jLhfEieRD0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 029/191] powerpc/pseries/memory-hotplug: Only
 update DT once per memory DLPAR request
Date: Sat,  9 Nov 2019 21:37:31 -0500
Message-Id: <20191110024013.29782-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Fontenot <nfont@linux.vnet.ibm.com>

[ Upstream commit 063b8b1251fd069f3740339fca56119d218f11ba ]

The updates to powerpc numa and memory hotplug code now use the
in-kernel LMB array instead of the device tree. This change allows the
pseries memory DLPAR code to only update the device tree once after
successfully handling a DLPAR request.

Prior to the in-kernel LMB array, the numa code looked up the affinity
for memory being added in the device tree, the code now looks this up
in the LMB array. This change means the memory hotplug code can just
update the affinity for an LMB in the LMB array instead of updating
the device tree.

This also provides a savings in kernel memory. When updating the
device tree old properties are never free'ed since there is no
usecount on properties. This behavior leads to a new copy of the
property being allocated every time a LMB is added or removed (i.e. a
request to add 100 LMBs creates 100 new copies of the property). With
this update only a single new property is created when a DLPAR request
completes successfully.

Signed-off-by: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/drmem.h              |  5 ++
 .../platforms/pseries/hotplug-memory.c        | 55 ++++++-------------
 2 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index ce242b9ea8c67..7c1d8e74b25d4 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -99,4 +99,9 @@ void __init walk_drmem_lmbs_early(unsigned long node,
 			void (*func)(struct drmem_lmb *, const __be32 **));
 #endif
 
+static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
+{
+	lmb->aa_index = 0xffffffff;
+}
+
 #endif /* _ASM_POWERPC_LMB_H */
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index f99cd31b6fd1a..2f166136bb50a 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -163,7 +163,7 @@ static u32 find_aa_index(struct device_node *dr_node,
 	return aa_index;
 }
 
-static u32 lookup_lmb_associativity_index(struct drmem_lmb *lmb)
+static int update_lmb_associativity_index(struct drmem_lmb *lmb)
 {
 	struct device_node *parent, *lmb_node, *dr_node;
 	struct property *ala_prop;
@@ -203,43 +203,14 @@ static u32 lookup_lmb_associativity_index(struct drmem_lmb *lmb)
 	aa_index = find_aa_index(dr_node, ala_prop, lmb_assoc);
 
 	dlpar_free_cc_nodes(lmb_node);
-	return aa_index;
-}
-
-static int dlpar_add_device_tree_lmb(struct drmem_lmb *lmb)
-{
-	int rc, aa_index;
-
-	lmb->flags |= DRCONF_MEM_ASSIGNED;
 
-	aa_index = lookup_lmb_associativity_index(lmb);
 	if (aa_index < 0) {
-		pr_err("Couldn't find associativity index for drc index %x\n",
-		       lmb->drc_index);
-		return aa_index;
+		pr_err("Could not find LMB associativity\n");
+		return -1;
 	}
 
 	lmb->aa_index = aa_index;
-
-	rtas_hp_event = true;
-	rc = drmem_update_dt();
-	rtas_hp_event = false;
-
-	return rc;
-}
-
-static int dlpar_remove_device_tree_lmb(struct drmem_lmb *lmb)
-{
-	int rc;
-
-	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
-	lmb->aa_index = 0xffffffff;
-
-	rtas_hp_event = true;
-	rc = drmem_update_dt();
-	rtas_hp_event = false;
-
-	return rc;
+	return 0;
 }
 
 static struct memory_block *lmb_to_memblock(struct drmem_lmb *lmb)
@@ -431,7 +402,9 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 	/* Update memory regions for memory remove */
 	memblock_remove(lmb->base_addr, block_sz);
 
-	dlpar_remove_device_tree_lmb(lmb);
+	invalidate_lmb_associativity_index(lmb);
+	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+
 	return 0;
 }
 
@@ -691,10 +664,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	if (lmb->flags & DRCONF_MEM_ASSIGNED)
 		return -EINVAL;
 
-	rc = dlpar_add_device_tree_lmb(lmb);
+	rc = update_lmb_associativity_index(lmb);
 	if (rc) {
-		pr_err("Couldn't update device tree for drc index %x\n",
-		       lmb->drc_index);
 		dlpar_release_drc(lmb->drc_index);
 		return rc;
 	}
@@ -707,14 +678,14 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	/* Add the memory */
 	rc = add_memory(nid, lmb->base_addr, block_sz);
 	if (rc) {
-		dlpar_remove_device_tree_lmb(lmb);
+		invalidate_lmb_associativity_index(lmb);
 		return rc;
 	}
 
 	rc = dlpar_online_lmb(lmb);
 	if (rc) {
 		remove_memory(nid, lmb->base_addr, block_sz);
-		dlpar_remove_device_tree_lmb(lmb);
+		invalidate_lmb_associativity_index(lmb);
 	} else {
 		lmb->flags |= DRCONF_MEM_ASSIGNED;
 	}
@@ -961,6 +932,12 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 		break;
 	}
 
+	if (!rc) {
+		rtas_hp_event = true;
+		rc = drmem_update_dt();
+		rtas_hp_event = false;
+	}
+
 	unlock_device_hotplug();
 	return rc;
 }
-- 
2.20.1

