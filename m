Return-Path: <linuxppc-dev+bounces-14980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E5CDB5D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 06:06:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbfwn2ytgz2xrM;
	Wed, 24 Dec 2025 16:06:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766546267;
	cv=none; b=GP1+tStcN9qlbT0wbrJ41XOh4zEOn9Af4de8NPC6052WYFCArvKGpfcaFn2UXNnuoPmP8NxOvcDrQbXk72Jtwv4IGznbRsFKJ4cquep3oJq4u0eo/MNEMhNfyTin7GvHCDRvKh/FhVjIvCPU2LBje/hpFlanLNoYuGHJ+ws3mZv5L9aIWG0ERmglOWS1yqNu9faEDwI9IEGLacsGzuIFvbzXDpdOnVd5xP21soBRVK9BYuuzIhkJ9d9vGZgKyBCS6gO7Y2On2DElyDnJohnvgYxh2LZevd03vCIEdeNejWOuitrvpIQTkUrc4y1CrS7LAlsPLFqC3DZ9zUrnKOhL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766546267; c=relaxed/relaxed;
	bh=WvSyr7XA0i29bbzxgIBI3sG77c7+tf1tg5s4fX8+k6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOGrxRN0Whzrnp02tluxzsTrpz1l2PUDhDCaV+fzRQRMR18ylnry6V3WyYoaE72DRUCSwUnSJ4HrwGeHkB29u7Vnyzbq3bJW8Trk2cj1ZjTa2K2p9HF5qXemvZdmkdd7Ko+niTiXtCPfBj8id1mC0/tMHsuYHGSRzhAFyn8iHN8fN08GUZ8xsSgi4dqBBUoOKQj3L8Rejh28D0X5g5unB7H9xQE7jVPyZ0qOCLdI8UmFEkaUvNhROdWc6wkXsO73YZFawCIg36qsBewOos18twGlWclVNORi3WAqnqnESZuflJ6TiI/Sftma6lj2d+3tBhXN0GDMHpQMjrCI602Q6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 367 seconds by postgrey-1.37 at boromir; Wed, 24 Dec 2025 14:17:46 AEDT
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbcWZ4jrWz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 14:17:46 +1100 (AEDT)
Received: from [127.0.0.2] (unknown [114.241.82.59])
	by APP-05 (Coremail) with SMTP id zQCowADHXBDPWUtpQzS6AQ--.32153S3;
	Wed, 24 Dec 2025 11:11:12 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 24 Dec 2025 11:10:49 +0800
Subject: [PATCH 1/5] PCI/MSI: Conservatively generalize no_64bit_msi into
 msi_addr_mask
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-pci-msi-addr-mask-v1-1-05a6fcb4b4c0@iscas.ac.cn>
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
In-Reply-To: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID:zQCowADHXBDPWUtpQzS6AQ--.32153S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtF1rArWkZFyUJFWxKF15Arb_yoW3Gw4rpa
	yDCFWfKrWrK34UJayqy3WUZF13Xan093yfWrWUK3sa93ZIvFyUXFn7try3Jwn7XrsrCF1a
	qFyUKw4UWFnxX3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjTRMfOzDUUUU
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
implement less than 64 address bits. This breaks on platforms where such
a device is assigned an MSI address higher than what's reachable.

Currently, we deal with this with a single no_64bit_msi flag, and
(notably on powerpc) use 32-bit MSI address for these devices. However,
on some platforms the MSI doorbell address is above 32-bit but within
device ability.

As a first step, conservatively generalize the single-bit flag
no_64bit_msi into msi_addr_mask. (The name msi_addr_mask is chosen to
avoid confusion with msi_mask.)

The translation is essentially:

- no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
- no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
- if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))

Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) is
used, no functional change is intended. Future patches that make use of
intermediate values of msi_addr_mask will follow, allowing devices that
cannot use full 64-bit addresses for MSI to work on platforms with MSI
doorbell above 32-bit address space.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

---

checkpatch complains about the comment include/linux/pci.h, which I have
formatted similarly with other comments in the vicinity.
---
 arch/powerpc/platforms/powernv/pci-ioda.c           | 2 +-
 arch/powerpc/platforms/pseries/msi.c                | 4 ++--
 drivers/gpu/drm/radeon/radeon_irq_kms.c             | 2 +-
 drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 2 +-
 drivers/pci/msi/msi.c                               | 2 +-
 drivers/pci/msi/pcidev_msi.c                        | 2 +-
 drivers/pci/probe.c                                 | 7 +++++++
 include/linux/pci.h                                 | 8 +++++++-
 sound/hda/controllers/intel.c                       | 2 +-
 9 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index b0c1d9d16fb5..1c78fdfb7b03 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1666,7 +1666,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *dev,
 		return -ENXIO;
 
 	/* Force 32-bit MSI on some broken devices */
-	if (dev->no_64bit_msi)
+	if (dev->msi_addr_mask < DMA_BIT_MASK(64))
 		is_64 = 0;
 
 	/* Assign XIVE to PE */
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index a82aaa786e9e..7473c7ca1db0 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -383,7 +383,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
 	 */
 again:
 	if (type == PCI_CAP_ID_MSI) {
-		if (pdev->no_64bit_msi) {
+		if (pdev->msi_addr_mask < DMA_BIT_MASK(64)) {
 			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSI_FN, nvec);
 			if (rc < 0) {
 				/*
@@ -409,7 +409,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
 		if (use_32bit_msi_hack && rc > 0)
 			rtas_hack_32bit_msi_gen2(pdev);
 	} else {
-		if (pdev->no_64bit_msi)
+		if (pdev->msi_addr_mask < DMA_BIT_MASK(64))
 			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSIX_FN, nvec);
 		else
 			rc = rtas_change_msi(pdn, RTAS_CHANGE_MSIX_FN, nvec);
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index 9961251b44ba..d550554a6f3f 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -252,7 +252,7 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
 	 */
 	if (rdev->family < CHIP_BONAIRE) {
 		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
-		rdev->pdev->no_64bit_msi = 1;
+		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
 	}
 
 	/* force MSI on */
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
index 70d86c5f52fb..0671deae9a28 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
@@ -331,7 +331,7 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 #ifdef CONFIG_PPC64
 	/* Ensure MSI/MSI-X interrupts lie within addressable physical memory */
-	pdev->no_64bit_msi = 1;
+	pdev->msi_addr_mask = DMA_BIT_MASK(32);
 #endif
 
 	err = ionic_setup_one(ionic);
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 34d664139f48..48f5f03d1479 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -322,7 +322,7 @@ static int msi_verify_entries(struct pci_dev *dev)
 {
 	struct msi_desc *entry;
 
-	if (!dev->no_64bit_msi)
+	if (dev->msi_addr_mask == DMA_BIT_MASK(64))
 		return 0;
 
 	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
diff --git a/drivers/pci/msi/pcidev_msi.c b/drivers/pci/msi/pcidev_msi.c
index 5520aff53b56..0b0346813092 100644
--- a/drivers/pci/msi/pcidev_msi.c
+++ b/drivers/pci/msi/pcidev_msi.c
@@ -24,7 +24,7 @@ void pci_msi_init(struct pci_dev *dev)
 	}
 
 	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
-		dev->no_64bit_msi = 1;
+		dev->msi_addr_mask = DMA_BIT_MASK(32);
 }
 
 void pci_msix_init(struct pci_dev *dev)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 41183aed8f5d..a2bff57176a3 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2047,6 +2047,13 @@ int pci_setup_device(struct pci_dev *dev)
 	 */
 	dev->dma_mask = 0xffffffff;
 
+	/*
+	 * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
+	 * if MSI (rather than MSI-X) capability does not have
+	 * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
+	 */
+	dev->msi_addr_mask = DMA_BIT_MASK(64);
+
 	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(dev->bus),
 		     dev->bus->number, PCI_SLOT(dev->devfn),
 		     PCI_FUNC(dev->devfn));
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 864775651c6f..0fe32fef0331 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -377,6 +377,13 @@ struct pci_dev {
 					   0xffffffff.  You only need to change
 					   this if your device has broken DMA
 					   or supports 64-bit transfers.  */
+	u64		msi_addr_mask;	/* Mask of the bits of bus address for
+					   MSI that this device implements.
+					   Normally set based on device
+					   capabilities. You only need to
+					   change this if your device claims
+					   to support 64-bit MSI but implements
+					   fewer than 64 address bits. */
 
 	struct device_dma_parameters dma_parms;
 
@@ -441,7 +448,6 @@ struct pci_dev {
 
 	unsigned int	is_busmaster:1;		/* Is busmaster */
 	unsigned int	no_msi:1;		/* May not use MSI */
-	unsigned int	no_64bit_msi:1;		/* May only use 32-bit MSIs */
 	unsigned int	block_cfg_access:1;	/* Config space access blocked */
 	unsigned int	broken_parity_status:1;	/* Generates false positive parity */
 	unsigned int	irq_reroute_variant:2;	/* Needs IRQ rerouting variant */
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1e8e3d61291a..c9542ebdf7e2 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1905,7 +1905,7 @@ static int azx_first_init(struct azx *chip)
 
 	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
 		dev_dbg(card->dev, "Disabling 64bit MSI\n");
-		pci->no_64bit_msi = true;
+		pci->msi_addr_mask = DMA_BIT_MASK(32);
 	}
 
 	pci_set_master(pci);

-- 
2.51.2


