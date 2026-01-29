Return-Path: <linuxppc-dev+bounces-16381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE4cJXa+emnw+AEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 02:57:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F283BAAEF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 02:57:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1j1W1Lmqz2ydq;
	Thu, 29 Jan 2026 12:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769651806;
	cv=none; b=oTaT9UGmRUUONTc9L1MxL63TEkk0atIqSI7rmD6pz9xfPW8C8JjB/NkSqVuV4BKmCsq3DCp/Ty9rC952KGtaL1hilEfPu1lBTwVG0N1CXDEFhQcVk5C6RP+N6xltiDegBQWiMTw0pqJTJSFabMl7Oi8WvGvGnSFvhdCjcsltMci0UXQR47rNZyhhzOGEq5XWow4Ir0e+nGJe4HJ0dhlyby9jGfYMSdmS1SQe4wf7TBTRVQEliOTsgRB+669k2K7VLlfyVRrzvjLPHLgzPYwhJN8nWSXYNIv4zeTZYRR8bsGRMgLhmRvvLarb7US4t9NcnK6SmogJjAMJ7yBpa3HmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769651806; c=relaxed/relaxed;
	bh=0XzVgSdddsSSYNbyzqYOjiSYa7RfDjstn2kH6rM0ahc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULmmzzDFkhk34P4o+ZxB3Ey5o9CPWEhZCLIqJuG+PQHN+3pB3G13bjq7uYiOcd4qREV7noGA+mwaZW5Ko1vY7xH03FfrLpzz11RQEJIMpYyBsnktz5rxVQj5CRK9ZV5uvb5uvNPnoXlMA8wKipL0s/fdIxKwe2+y5gXvbYKm567uFlzxLE2/JDcC4bPTSBYrzqBLg4f8Hibnt0diFzTwy4F09BJ2ZkwO4aNorTdAzt/7oVyVhJVqV+KrmqvbYFvwJ1/N5HSQBd2g1qZUnYp6Evc5EiDICXsQOGVRY5FTKXLQPR7w7FcpyJVHOSL5Y2ojR41MalofLXAXbuyjarnhMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1j1S01jqz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 12:56:42 +1100 (AEDT)
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAntwpDvnpps5z0Bg--.39391S3;
	Thu, 29 Jan 2026 09:56:19 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Thu, 29 Jan 2026 09:56:06 +0800
Subject: [PATCH v4 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
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
Message-Id: <20260129-pci-msi-addr-mask-v4-1-70da998f2750@iscas.ac.cn>
References: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
In-Reply-To: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Brett Creeley <brett.creeley@amd.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Thomas Gleixner <tglx@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
 Takashi Iwai <tiwai@suse.de>
X-Mailer: b4 0.14.3
X-CM-TRANSID:zQCowAAntwpDvnpps5z0Bg--.39391S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WryfWw1rKrWUXFW3Ar43Jrb_yoW3Arykpa
	yDGFWfKrWrK3yUJayqy3WUZF13Xan093yfWrWUK3sa9anIvFyUXFn7try3Jwn7XrsFkF4a
	qFyDKw4UWFnxX3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRREfO7UUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:perex@perex.cz,m:tiwai@suse.com,m:brett.creeley@amd.com,m:gaohan@iscas.ac.cn,m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:sophgo@lists.linux.dev,m:tiwai@suse.de,m:andrew@lunn.ch,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16381-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,iscas.ac.cn:mid,iscas.ac.cn:email,amd.com:email]
X-Rspamd-Queue-Id: F283BAAEF7
X-Rspamd-Action: no action

Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
implement less than 64 address bits. This breaks on platforms where such
a device is assigned an MSI address higher than what's reachable.

Currently, the no_64bit_msi bit is set for these devices, meaning that
only 32-bit MSI addresses are allowed for them. However, on some
platforms the MSI doorbell address is above the 32-bit limit but within
the addressable range of the device.

As a first step to enabling MSI on those combinations of devices and
platforms, conservatively generalize the single-bit flag no_64bit_msi
into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
with msi_mask.)

The translation is essentially:

- no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
- no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
- if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))

Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) are
used, no functional change is intended. Future patches that make use of
intermediate values of msi_addr_mask will follow, allowing devices that
cannot use full 64-bit addresses for MSI to work on platforms with MSI
doorbell above the 32-bit limit.

Acked-by: Takashi Iwai <tiwai@suse.de> # sound
Reviewed-by: Brett Creeley <brett.creeley@amd.com> # ionic
Reviewed-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
v4: Patch message rewording (Thomas)

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
2.52.0


