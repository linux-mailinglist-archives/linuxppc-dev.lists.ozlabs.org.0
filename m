Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E262776E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 09:51:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458hWl3HMnzDqXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 17:50:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c417bddcefb42f015981+5751+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="h1I6BdTt"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458hV64hVkzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 17:49:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3QshoR814UezMCTEz98zE387X/1ByxH8EAmDw2F8rpU=; b=h1I6BdTteo8lUHGVy/NrJNznLq
 szWaNacO5673mHIQkor5MVREufQ6layECelp2VoLYMlZboy4WO3yUjC43Qo2Q9BHDS3ORdccbiGmy
 tZvAaTK07HHAUpCFiuXa5cMLyjWM/UM51ZPUQHsbSPzOUHQUqI0BMphq9U8mKm2xJaEasG0sfWKFo
 m99rweEb5fErIZLINg50PgQzHuYAFQwKYt0p88C7GWRmS9e55jgDiMdynCvkxHYUpfb5J2wVkyDWH
 apQ8alW4IdV6UBDFUCaRgUU0Gq/hayEvtdk6YWtq2AGVfCiftJy3u+nwsZ+JzzxdH01isGebmM5gy
 DwoJjcRw==;
Received: from 213-225-10-46.nat.highway.a1.net ([213.225.10.46]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTiTh-00043N-5F; Thu, 23 May 2019 07:49:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/4] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Date: Thu, 23 May 2019 09:49:21 +0200
Message-Id: <20190523074924.19659-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523074924.19659-1-hch@lst.de>
References: <20190523074924.19659-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This function has never been used since it has been added to the tree.
We also now have proper PCIe P2P APIs in the core kernel, and any new
P2P support should be using those.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/opal-api.h        |  6 --
 arch/powerpc/include/asm/opal.h            |  2 -
 arch/powerpc/include/asm/pnv-pci.h         |  2 -
 arch/powerpc/platforms/powernv/opal-call.c |  1 -
 arch/powerpc/platforms/powernv/pci.c       | 74 ----------------------
 arch/powerpc/platforms/powernv/pci.h       |  5 --
 6 files changed, 90 deletions(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index e1577cfa7186..cd34c328774d 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -1132,12 +1132,6 @@ enum {
 	OPAL_IMC_COUNTERS_TRACE = 3,
 };
 
-
-/* PCI p2p descriptor */
-#define OPAL_PCI_P2P_ENABLE		0x1
-#define OPAL_PCI_P2P_LOAD		0x2
-#define OPAL_PCI_P2P_STORE		0x4
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* __OPAL_API_H */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 4cc37e708bc7..15c488ce4225 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -287,8 +287,6 @@ int64_t opal_xive_set_queue_state(uint64_t vp, uint32_t prio,
 				  uint32_t qtoggle,
 				  uint32_t qindex);
 int64_t opal_xive_get_vp_state(uint64_t vp, __be64 *out_w01);
-int64_t opal_pci_set_p2p(uint64_t phb_init, uint64_t phb_target,
-			uint64_t desc, uint16_t pe_number);
 
 int64_t opal_imc_counters_init(uint32_t type, uint64_t address,
 							uint64_t cpu_pir);
diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
index 630eb8b1b7ed..9fcb0bc462c6 100644
--- a/arch/powerpc/include/asm/pnv-pci.h
+++ b/arch/powerpc/include/asm/pnv-pci.h
@@ -26,8 +26,6 @@ extern int pnv_pci_get_presence_state(uint64_t id, uint8_t *state);
 extern int pnv_pci_get_power_state(uint64_t id, uint8_t *state);
 extern int pnv_pci_set_power_state(uint64_t id, uint8_t state,
 				   struct opal_msg *msg);
-extern int pnv_pci_set_p2p(struct pci_dev *initiator, struct pci_dev *target,
-			   u64 desc);
 
 extern int pnv_pci_enable_tunnel(struct pci_dev *dev, uint64_t *asnind);
 extern int pnv_pci_disable_tunnel(struct pci_dev *dev);
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 36c8fa3647a2..29ca523c1c79 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -273,7 +273,6 @@ OPAL_CALL(opal_npu_map_lpar,			OPAL_NPU_MAP_LPAR);
 OPAL_CALL(opal_imc_counters_init,		OPAL_IMC_COUNTERS_INIT);
 OPAL_CALL(opal_imc_counters_start,		OPAL_IMC_COUNTERS_START);
 OPAL_CALL(opal_imc_counters_stop,		OPAL_IMC_COUNTERS_STOP);
-OPAL_CALL(opal_pci_set_p2p,			OPAL_PCI_SET_P2P);
 OPAL_CALL(opal_get_powercap,			OPAL_GET_POWERCAP);
 OPAL_CALL(opal_set_powercap,			OPAL_SET_POWERCAP);
 OPAL_CALL(opal_get_power_shift_ratio,		OPAL_GET_POWER_SHIFT_RATIO);
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index ef9448a907c6..8d28f2932c3b 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -38,7 +38,6 @@
 #include "powernv.h"
 #include "pci.h"
 
-static DEFINE_MUTEX(p2p_mutex);
 static DEFINE_MUTEX(tunnel_mutex);
 
 int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id)
@@ -861,79 +860,6 @@ void pnv_pci_dma_bus_setup(struct pci_bus *bus)
 	}
 }
 
-int pnv_pci_set_p2p(struct pci_dev *initiator, struct pci_dev *target, u64 desc)
-{
-	struct pci_controller *hose;
-	struct pnv_phb *phb_init, *phb_target;
-	struct pnv_ioda_pe *pe_init;
-	int rc;
-
-	if (!opal_check_token(OPAL_PCI_SET_P2P))
-		return -ENXIO;
-
-	hose = pci_bus_to_host(initiator->bus);
-	phb_init = hose->private_data;
-
-	hose = pci_bus_to_host(target->bus);
-	phb_target = hose->private_data;
-
-	pe_init = pnv_ioda_get_pe(initiator);
-	if (!pe_init)
-		return -ENODEV;
-
-	/*
-	 * Configuring the initiator's PHB requires to adjust its
-	 * TVE#1 setting. Since the same device can be an initiator
-	 * several times for different target devices, we need to keep
-	 * a reference count to know when we can restore the default
-	 * bypass setting on its TVE#1 when disabling. Opal is not
-	 * tracking PE states, so we add a reference count on the PE
-	 * in linux.
-	 *
-	 * For the target, the configuration is per PHB, so we keep a
-	 * target reference count on the PHB.
-	 */
-	mutex_lock(&p2p_mutex);
-
-	if (desc & OPAL_PCI_P2P_ENABLE) {
-		/* always go to opal to validate the configuration */
-		rc = opal_pci_set_p2p(phb_init->opal_id, phb_target->opal_id,
-				      desc, pe_init->pe_number);
-
-		if (rc != OPAL_SUCCESS) {
-			rc = -EIO;
-			goto out;
-		}
-
-		pe_init->p2p_initiator_count++;
-		phb_target->p2p_target_count++;
-	} else {
-		if (!pe_init->p2p_initiator_count ||
-			!phb_target->p2p_target_count) {
-			rc = -EINVAL;
-			goto out;
-		}
-
-		if (--pe_init->p2p_initiator_count == 0)
-			pnv_pci_ioda2_set_bypass(pe_init, true);
-
-		if (--phb_target->p2p_target_count == 0) {
-			rc = opal_pci_set_p2p(phb_init->opal_id,
-					      phb_target->opal_id, desc,
-					      pe_init->pe_number);
-			if (rc != OPAL_SUCCESS) {
-				rc = -EIO;
-				goto out;
-			}
-		}
-	}
-	rc = 0;
-out:
-	mutex_unlock(&p2p_mutex);
-	return rc;
-}
-EXPORT_SYMBOL_GPL(pnv_pci_set_p2p);
-
 struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev)
 {
 	struct pci_controller *hose = pci_bus_to_host(dev->bus);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index be26ab3d99e0..4f11c077af62 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -79,9 +79,6 @@ struct pnv_ioda_pe {
 	struct pnv_ioda_pe	*master;
 	struct list_head	slaves;
 
-	/* PCI peer-to-peer*/
-	int			p2p_initiator_count;
-
 	/* Link in list of PE#s */
 	struct list_head	list;
 };
@@ -172,8 +169,6 @@ struct pnv_phb {
 	/* PHB and hub diagnostics */
 	unsigned int		diag_data_size;
 	u8			*diag_data;
-
-	int p2p_target_count;
 };
 
 extern struct pci_ops pnv_pci_ops;
-- 
2.20.1

