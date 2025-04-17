Return-Path: <linuxppc-dev+bounces-7722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E0A9103E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 02:23:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdJXT17cnz3bmS;
	Thu, 17 Apr 2025 10:23:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744849417;
	cv=none; b=I8M/6ctkQG3ieTD1yWx7aXePVYIumPcHoky4naT0RfO10O1zOD8LFOWwSl+DSnsupZEB4BWH06BFwXKYoT82XQT8RYlUHaC27w29GRtWKY0PkNgVugcXAodLXFzVblymycm+wL9lTwBfI4mkd92gtXyMOV+SE0guYstI2jHO6Pe48M66ZKah70OdsgMF2b7JYDW0jPL+qN7Wav25fIdqNTOT1myEo7dClmezEEIVlxeVUhm/0B782B+GSIPHdCPQu8b7VPBuRO6zWgrfRufjaOs/GFydF11VoTDrcrt4F8OT/HG/zs0MG6hU4M6sORCt+/wUjpTWv0r17+g42imZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744849417; c=relaxed/relaxed;
	bh=qa2Ocy3DwZxyE9uUKsxxktwzBAcJE9/czed/yRdFYM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZN2RL+iBW+6a8UIhWRE3cFtizFwdfV6FdGhEldkGKE0gcK/Vn38CtCKevCM7VnBeMpH1x1vlga7G0zxdz2abhuVjLJUw6Dc2Ut1gQ8jsJVyyRzCrjpXxhXJd86cwL5ox4goOlUprrXcXDoJeoQQPx4CXOJDQzgDxag+c1tSXvtcytX0uM6/F+ShvdcjdfOkHMvM/6p4cr472RgfZkbOoidV2f33x7aECmukAtJnHjiMpDBqMQgz4//ahv9nmpE/7+PXcBRAdSvPBvXiLx39mxunIHdT/XIVwCdLSJ66zngKOiN2U+L3VZfxzYjPSR54Rlgjp8aY0Z5cerN0fBPJaEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdJXR6NJqz3bhH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 10:23:33 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 62FA7200A46D;
	Thu, 17 Apr 2025 02:23:19 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7A2566AABD; Thu, 17 Apr 2025 02:23:26 +0200 (CEST)
Date: Thu, 17 Apr 2025 02:23:26 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kw@linux.com>, Rob Herring <robh@kernel.org>,
	dingwei@marvell.com, cassel@kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] PCI/ERR: Add support for resetting the slot in a
 platforms specific way
Message-ID: <aABJ_u8-FXeJoPyF@wunner.de>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
 <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
 <Z--cY5Uf6JyTYL9y@wunner.de>
 <3dokyirkf47lqxgx5k2ybij5b5an6qnceifsub3mcmjvzp3kdb@sm7f2jxxepdc>
 <Z__AyQeZmXiNwT7c@wunner.de>
 <rrqn7hlefn7klaczi2jkfta72pwmtentj3zp37yvw3brwpnalk@3eapwfeo5y4d>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rrqn7hlefn7klaczi2jkfta72pwmtentj3zp37yvw3brwpnalk@3eapwfeo5y4d>
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 08:34:21PM +0530, Manivannan Sadhasivam wrote:
> I don't think it is possible to get rid of the powerpc version. It has
> its own pci_dev::sysdata pointing to 'struct pci_controller' pointer
> which is internal to powerpc arch code. And the generic code would need
> 'struct pci_host_bridge' to access the callback.

Below is my proposal to convert powerpc to the new ->slot_reset() callback.
Compile-tested only.

Feel free to include this in your series, alternatively I can submit it
to powerpc maintainers once your series has landed.  Thanks!

-- >8 --

From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH] powerpc/powernv/pci: Migrate to pci_host_bridge::reset_slot
 callback

struct pci_host_bridge has just been amended with a ->reset_slot()
callback to allow for a per-host-bridge Secondary Bus Reset procedure.

PowerNV needs a platform-specific reset procedure and has historically
implemented it by overriding pcibios_reset_secondary_bus().

Migrate PowerNV to the new ->reset_slot() callback for simplicity and
cleanliness.  Assign the callback as soon as the pci_host_bridge is
allocated through the following call chain:

pcibios_init()
  pcibios_scan_phb()
    pci_create_root_bus()
      pci_register_host_bridge()
        pcibios_root_bridge_prepare()

The powerpc-specific implementation of pcibios_reset_secondary_bus() can
thus be deleted and the remaining default implementation in the PCI core
can be made private.  The ->reset_secondary_bus() callback in struct
pci_controller_ops likewise becomes obsolete and can be deleted.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 arch/powerpc/include/asm/pci-bridge.h        |  1 -
 arch/powerpc/kernel/pci-common.c             | 12 ------------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 14 +++++++++-----
 arch/powerpc/platforms/powernv/pci-ioda.c    |  9 +++++++--
 arch/powerpc/platforms/powernv/pci.h         |  3 ++-
 drivers/pci/pci.c                            |  2 +-
 include/linux/pci.h                          |  1 -
 7 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 2aa3a091ef20..0de09fc90641 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -36,7 +36,6 @@ struct pci_controller_ops {
 					    unsigned long type);
 	void		(*setup_bridge)(struct pci_bus *bus,
 					unsigned long type);
-	void		(*reset_secondary_bus)(struct pci_dev *pdev);
 
 #ifdef CONFIG_PCI_MSI
 	int		(*setup_msi_irqs)(struct pci_dev *pdev,
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index eac84d687b53..dad15fbec4e0 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -233,18 +233,6 @@ void pcibios_setup_bridge(struct pci_bus *bus, unsigned long type)
 		hose->controller_ops.setup_bridge(bus, type);
 }
 
-void pcibios_reset_secondary_bus(struct pci_dev *dev)
-{
-	struct pci_controller *phb = pci_bus_to_host(dev->bus);
-
-	if (phb->controller_ops.reset_secondary_bus) {
-		phb->controller_ops.reset_secondary_bus(dev);
-		return;
-	}
-
-	pci_reset_secondary_bus(dev);
-}
-
 resource_size_t pcibios_default_alignment(void)
 {
 	if (ppc_md.pcibios_default_alignment)
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index db3370d1673c..9b9517cb6ab7 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -890,18 +890,22 @@ static int pnv_eeh_bridge_reset(struct pci_dev *pdev, int option)
 	return (rc == OPAL_SUCCESS) ? 0 : -EIO;
 }
 
-void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
+int pnv_pci_reset_secondary_bus(struct pci_host_bridge *host,
+				struct pci_dev *dev)
 {
 	struct pci_controller *hose;
+	int rc_hot, rc_dea;
 
 	if (pci_is_root_bus(dev->bus)) {
 		hose = pci_bus_to_host(dev->bus);
-		pnv_eeh_root_reset(hose, EEH_RESET_HOT);
-		pnv_eeh_root_reset(hose, EEH_RESET_DEACTIVATE);
+		rc_hot = pnv_eeh_root_reset(hose, EEH_RESET_HOT);
+		rc_dea = pnv_eeh_root_reset(hose, EEH_RESET_DEACTIVATE);
 	} else {
-		pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
-		pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
+		rc_hot = pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
+		rc_dea = pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
 	}
+
+	return rc_hot ? : rc_dea ? : 0;
 }
 
 static void pnv_eeh_wait_for_pending(struct pci_dn *pdn, const char *type,
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index ae4b549b5ca0..e1b75a4bc681 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2145,6 +2145,12 @@ static void pnv_pci_ioda_fixup(void)
 #endif
 }
 
+static int pnv_pci_root_bridge_prepare(struct pci_host_bridge *bridge)
+{
+	bridge->reset_slot = pnv_pci_reset_secondary_bus;
+	return 0;
+}
+
 /*
  * Returns the alignment for I/O or memory windows for P2P
  * bridges. That actually depends on how PEs are segmented.
@@ -2504,7 +2510,6 @@ static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.release_device		= pnv_pci_release_device,
 	.window_alignment	= pnv_pci_window_alignment,
 	.setup_bridge		= pnv_pci_fixup_bridge_resources,
-	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
 #ifdef CONFIG_IOMMU_API
 	.device_group		= pnv_pci_device_group,
@@ -2515,7 +2520,6 @@ static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
 	.enable_device_hook	= pnv_ocapi_enable_device_hook,
 	.release_device		= pnv_pci_release_device,
 	.window_alignment	= pnv_pci_window_alignment,
-	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
 };
 
@@ -2724,6 +2728,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	}
 
 	ppc_md.pcibios_default_alignment = pnv_pci_default_alignment;
+	ppc_md.pcibios_root_bridge_prepare = pnv_pci_root_bridge_prepare;
 
 #ifdef CONFIG_PCI_IOV
 	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov;
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 42075501663b..44e8969c7729 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -275,7 +275,8 @@ extern struct iommu_table *pnv_pci_table_alloc(int nid);
 
 extern void pnv_pci_init_ioda2_phb(struct device_node *np);
 extern void pnv_pci_init_npu2_opencapi_phb(struct device_node *np);
-extern void pnv_pci_reset_secondary_bus(struct pci_dev *dev);
+extern int pnv_pci_reset_secondary_bus(struct pci_host_bridge *host,
+				       struct pci_dev *dev);
 extern int pnv_eeh_phb_reset(struct pci_controller *hose, int option);
 
 extern struct pnv_ioda_pe *pnv_pci_bdfn_to_pe(struct pnv_phb *phb, u16 bdfn);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 13709bb898a9..fe66d69c6429 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4980,7 +4980,7 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, ctrl);
 }
 
-void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
+static void pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	int ret;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 76e977af2d52..43d952361e84 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1398,7 +1398,6 @@ int pci_probe_reset_slot(struct pci_slot *slot);
 int pci_probe_reset_bus(struct pci_bus *bus);
 int pci_reset_bus(struct pci_dev *dev);
 void pci_reset_secondary_bus(struct pci_dev *dev);
-void pcibios_reset_secondary_bus(struct pci_dev *dev);
 void pci_update_resource(struct pci_dev *dev, int resno);
 int __must_check pci_assign_resource(struct pci_dev *dev, int i);
 void pci_release_resource(struct pci_dev *dev, int resno);
-- 
2.43.0


