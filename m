Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8482573E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 08:43:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg0yK06DyzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 16:43:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg0vg2lXNzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 16:40:47 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 245D868CF0; Mon, 31 Aug 2020 08:40:39 +0200 (CEST)
Date: Mon, 31 Aug 2020 08:40:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 5/5] powerpc: use the generic dma_ops_bypass mode
Message-ID: <20200831064038.GB27617@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-6-hch@lst.de>
 <505bcc1d-01a7-9655-88e1-ebddd0b94d56@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <505bcc1d-01a7-9655-88e1-ebddd0b94d56@kaod.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linuxppc-dev@lists.ozlabs.org, Daniel Borkmann <daniel@iogearbox.net>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Jesper Dangaard Brouer <brouer@redhat.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Oliver O'Halloran <oohall@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, aacraid@microsemi.com,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 30, 2020 at 11:04:21AM +0200, Cédric Le Goater wrote:
> Hello,
> 
> On 7/8/20 5:24 PM, Christoph Hellwig wrote:
> > Use the DMA API bypass mechanism for direct window mappings.  This uses
> > common code and speed up the direct mapping case by avoiding indirect
> > calls just when not using dma ops at all.  It also fixes a problem where
> > the sync_* methods were using the bypass check for DMA allocations, but
> > those are part of the streaming ops.
> > 
> > Note that this patch loses the DMA_ATTR_WEAK_ORDERING override, which
> > has never been well defined, as is only used by a few drivers, which
> > IIRC never showed up in the typical Cell blade setups that are affected
> > by the ordering workaround.
> > 
> > Fixes: efd176a04bef ("powerpc/pseries/dma: Allow SWIOTLB")
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/powerpc/Kconfig              |  1 +
> >  arch/powerpc/include/asm/device.h |  5 --
> >  arch/powerpc/kernel/dma-iommu.c   | 90 ++++---------------------------
> >  3 files changed, 10 insertions(+), 86 deletions(-)
> 
> I am seeing corruptions on a couple of POWER9 systems (boston) when
> stressed with IO. stress-ng gives some results but I have first seen
> it when compiling the kernel in a guest and this is still the best way
> to raise the issue.
> 
> These systems have of a SAS Adaptec controller :
> 
>   0003:01:00.0 Serial Attached SCSI controller: Adaptec Series 8 12G SAS/PCIe 3 (rev 01)
> 
> When the failure occurs, the POWERPC EEH interrupt fires and dumps
> lowlevel PHB4 registers among which :
> 					  
>   [ 2179.251069490,3] PHB#0003[0:3]:           phbErrorStatus = 0000028000000000
>   [ 2179.251117476,3] PHB#0003[0:3]:      phbFirstErrorStatus = 0000020000000000
> 
> The bits raised identify a PPC 'TCE' error, which means it is related
> to DMAs. See below for more details.
> 
> 
> Reverting this patch "fixes" the issue but it is probably else where,
> in some other layers or in the aacraid driver. How should I proceed 
> to get more information ?

The aacraid DMA masks look like a mess.  Can you try the hack
below and see it it helps?

diff --git a/drivers/scsi/aacraid/aachba.c b/drivers/scsi/aacraid/aachba.c
index 769af4ca9ca97e..79c6b744dbb66c 100644
--- a/drivers/scsi/aacraid/aachba.c
+++ b/drivers/scsi/aacraid/aachba.c
@@ -2228,18 +2228,6 @@ int aac_get_adapter_info(struct aac_dev* dev)
 		expose_physicals = 0;
 	}
 
-	if (dev->dac_support) {
-		if (!pci_set_dma_mask(dev->pdev, DMA_BIT_MASK(64))) {
-			if (!dev->in_reset)
-				dev_info(&dev->pdev->dev, "64 Bit DAC enabled\n");
-		} else if (!pci_set_dma_mask(dev->pdev, DMA_BIT_MASK(32))) {
-			dev_info(&dev->pdev->dev, "DMA mask set failed, 64 Bit DAC disabled\n");
-			dev->dac_support = 0;
-		} else {
-			dev_info(&dev->pdev->dev, "No suitable DMA available\n");
-			rcode = -ENOMEM;
-		}
-	}
 	/*
 	 * Deal with configuring for the individualized limits of each packet
 	 * interface.
diff --git a/drivers/scsi/aacraid/commsup.c b/drivers/scsi/aacraid/commsup.c
index adbdc3b7c7a706..dbb23b351a4e7d 100644
--- a/drivers/scsi/aacraid/commsup.c
+++ b/drivers/scsi/aacraid/commsup.c
@@ -1479,7 +1479,6 @@ static int _aac_reset_adapter(struct aac_dev *aac, int forced, u8 reset_type)
 	struct Scsi_Host *host = aac->scsi_host_ptr;
 	int jafo = 0;
 	int bled;
-	u64 dmamask;
 	int num_of_fibs = 0;
 
 	/*
@@ -1558,22 +1557,7 @@ static int _aac_reset_adapter(struct aac_dev *aac, int forced, u8 reset_type)
 	kfree(aac->fsa_dev);
 	aac->fsa_dev = NULL;
 
-	dmamask = DMA_BIT_MASK(32);
 	quirks = aac_get_driver_ident(index)->quirks;
-	if (quirks & AAC_QUIRK_31BIT)
-		retval = pci_set_dma_mask(aac->pdev, dmamask);
-	else if (!(quirks & AAC_QUIRK_SRC))
-		retval = pci_set_dma_mask(aac->pdev, dmamask);
-	else
-		retval = pci_set_consistent_dma_mask(aac->pdev, dmamask);
-
-	if (quirks & AAC_QUIRK_31BIT && !retval) {
-		dmamask = DMA_BIT_MASK(31);
-		retval = pci_set_consistent_dma_mask(aac->pdev, dmamask);
-	}
-
-	if (retval)
-		goto out;
 
 	if ((retval = (*(aac_get_driver_ident(index)->init))(aac)))
 		goto out;
diff --git a/drivers/scsi/aacraid/linit.c b/drivers/scsi/aacraid/linit.c
index 8588da0a065551..d897a9d59e24a1 100644
--- a/drivers/scsi/aacraid/linit.c
+++ b/drivers/scsi/aacraid/linit.c
@@ -1634,8 +1634,6 @@ static int aac_probe_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct list_head *insert = &aac_devices;
 	int error;
 	int unique_id = 0;
-	u64 dmamask;
-	int mask_bits = 0;
 	extern int aac_sync_mode;
 
 	/*
@@ -1658,33 +1656,6 @@ static int aac_probe_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (error)
 		goto out;
 
-	if (!(aac_drivers[index].quirks & AAC_QUIRK_SRC)) {
-		error = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
-		if (error) {
-			dev_err(&pdev->dev, "PCI 32 BIT dma mask set failed");
-			goto out_disable_pdev;
-		}
-	}
-
-	/*
-	 * If the quirk31 bit is set, the adapter needs adapter
-	 * to driver communication memory to be allocated below 2gig
-	 */
-	if (aac_drivers[index].quirks & AAC_QUIRK_31BIT) {
-		dmamask = DMA_BIT_MASK(31);
-		mask_bits = 31;
-	} else {
-		dmamask = DMA_BIT_MASK(32);
-		mask_bits = 32;
-	}
-
-	error = pci_set_consistent_dma_mask(pdev, dmamask);
-	if (error) {
-		dev_err(&pdev->dev, "PCI %d B consistent dma mask set failed\n"
-				, mask_bits);
-		goto out_disable_pdev;
-	}
-
 	pci_set_master(pdev);
 
 	shost = scsi_host_alloc(&aac_driver_template, sizeof(struct aac_dev));
