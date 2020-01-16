Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BF413FA2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 21:06:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zFZZ3PqdzDqkW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 07:06:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+e120a4276ddc5f5fb55f+5989+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zBR4355RzDqCB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:44:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P0ujeKY7h/62OJnX1PYjinltna+YaYSFTchSZ0TA9WA=; b=RD6amf3ZQL/0bf9oJtita8Ly6
 TRFI18VJHo5iLj3eHVWnW3bzCtvUy3ZaMrBgZqe4HHNjdbOQho2cOpOEhA/J08NuQTm0cDZGNJM3Z
 tqG6d7ehcMYo5AK62JDM/ckapAVXsaBKVOXCM597TByf7ftJnrJpni3irARG6fW6GuHErCp5FZljt
 c7hJO95yMx8vpb4Sz9d86xkoGDrUFRtxvNXm71sajTsOQEVuHNfABj161iMm5cxLNLZNmeJi2bR4S
 ZdQ6QqcSDkNrRrNvu689AwFl6X4ZZt7Hm1spbvrgBEsnNXP9Dp92VmvrmdSmnCIj/To+U6OxZxv2r
 lYIZYOsDw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1is9CF-0004c6-7v; Thu, 16 Jan 2020 17:44:43 +0000
Date: Thu, 16 Jan 2020 09:44:43 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when unloading
 mpt3sas driver
Message-ID: <20200116174443.GA30158@infradead.org>
References: <1578489498.29952.11.camel@abdul>
 <1578560245.30409.0.camel@abdul.in.ibm.com>
 <20200109142218.GA16477@infradead.org>
 <1578980874.11996.3.camel@abdul.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578980874.11996.3.camel@abdul.in.ibm.com>
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Chaitra P B <chaitra.basappa@broadcom.com>,
 linux-scsi <linux-scsi@vger.kernel.org>, MPT-FusionLinux.pdl@broadcom.com,
 manvanth <manvanth@linux.vnet.ibm.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Christoph Hellwig <hch@infradead.org>, jcmvbkbc@gmail.com,
 iommu@lists.linux-foundation.org, linux-next <linux-next@vger.kernel.org>,
 Oliver <oohall@gmail.com>, "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Abdul,

I think the problem is that mpt3sas has some convoluted logic to do
some DMA allocations with a 32-bit coherent mask, and then switches
to a 63 or 64 bit mask, which is not supported by the DMA API.

Can you try the patch below?

---
From 0738b1704ed528497b41b0408325f6828a8e51f6 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Thu, 16 Jan 2020 18:31:38 +0100
Subject: mpt3sas: don't change the dma coherent mask after allocations

The DMA layer does not allow changing the DMA coherent mask after
there are outstanding allocations.  Stop doing that and always
use a 32-bit coherent DMA mask in mpt3sas.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/mpt3sas/mpt3sas_base.c | 67 ++++++++---------------------
 drivers/scsi/mpt3sas/mpt3sas_base.h |  2 -
 2 files changed, 19 insertions(+), 50 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
index fea3cb6a090b..3b51bed05008 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -2706,58 +2706,38 @@ _base_build_sg_ieee(struct MPT3SAS_ADAPTER *ioc, void *psge,
 static int
 _base_config_dma_addressing(struct MPT3SAS_ADAPTER *ioc, struct pci_dev *pdev)
 {
-	u64 required_mask, coherent_mask;
 	struct sysinfo s;
-	/* Set 63 bit DMA mask for all SAS3 and SAS35 controllers */
-	int dma_mask = (ioc->hba_mpi_version_belonged > MPI2_VERSION) ? 63 : 64;
-
-	if (ioc->is_mcpu_endpoint)
-		goto try_32bit;
+	int dma_mask;
 
-	required_mask = dma_get_required_mask(&pdev->dev);
-	if (sizeof(dma_addr_t) == 4 || required_mask == 32)
-		goto try_32bit;
-
-	if (ioc->dma_mask)
-		coherent_mask = DMA_BIT_MASK(dma_mask);
+	if (ioc->is_mcpu_endpoint ||
+	    sizeof(dma_addr_t) == 4 ||
+	    dma_get_required_mask(&pdev->dev) <= 32)
+		dma_mask = 32;
+	/* Set 63 bit DMA mask for all SAS3 and SAS35 controllers */
+	else if (ioc->hba_mpi_version_belonged > MPI2_VERSION)
+		dma_mask = 63;
 	else
-		coherent_mask = DMA_BIT_MASK(32);
+		dma_mask = 64;
 
 	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(dma_mask)) ||
-	    dma_set_coherent_mask(&pdev->dev, coherent_mask))
-		goto try_32bit;
-
-	ioc->base_add_sg_single = &_base_add_sg_single_64;
-	ioc->sge_size = sizeof(Mpi2SGESimple64_t);
-	ioc->dma_mask = dma_mask;
-	goto out;
-
- try_32bit:
-	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)))
+	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32)))
 		return -ENODEV;
 
-	ioc->base_add_sg_single = &_base_add_sg_single_32;
-	ioc->sge_size = sizeof(Mpi2SGESimple32_t);
-	ioc->dma_mask = 32;
- out:
+	if (dma_mask > 32) {
+		ioc->base_add_sg_single = &_base_add_sg_single_64;
+		ioc->sge_size = sizeof(Mpi2SGESimple64_t);
+	} else {
+		ioc->base_add_sg_single = &_base_add_sg_single_32;
+		ioc->sge_size = sizeof(Mpi2SGESimple32_t);
+	}
+
 	si_meminfo(&s);
 	ioc_info(ioc, "%d BIT PCI BUS DMA ADDRESSING SUPPORTED, total mem (%ld kB)\n",
-		 ioc->dma_mask, convert_to_kb(s.totalram));
+		 dma_mask, convert_to_kb(s.totalram));
 
 	return 0;
 }
 
-static int
-_base_change_consistent_dma_mask(struct MPT3SAS_ADAPTER *ioc,
-				      struct pci_dev *pdev)
-{
-	if (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(ioc->dma_mask))) {
-		if (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32)))
-			return -ENODEV;
-	}
-	return 0;
-}
-
 /**
  * _base_check_enable_msix - checks MSIX capabable.
  * @ioc: per adapter object
@@ -5030,14 +5010,6 @@ _base_allocate_memory_pools(struct MPT3SAS_ADAPTER *ioc)
 		total_sz += sz;
 	} while (ioc->rdpq_array_enable && (++i < ioc->reply_queue_count));
 
-	if (ioc->dma_mask > 32) {
-		if (_base_change_consistent_dma_mask(ioc, ioc->pdev) != 0) {
-			ioc_warn(ioc, "no suitable consistent DMA mask for %s\n",
-				 pci_name(ioc->pdev));
-			goto out;
-		}
-	}
-
 	ioc->scsiio_depth = ioc->hba_queue_depth -
 	    ioc->hi_priority_depth - ioc->internal_depth;
 
@@ -6965,7 +6937,6 @@ mpt3sas_base_attach(struct MPT3SAS_ADAPTER *ioc)
 	ioc->smp_affinity_enable = smp_affinity_enable;
 
 	ioc->rdpq_array_enable_assigned = 0;
-	ioc->dma_mask = 0;
 	if (ioc->is_aero_ioc)
 		ioc->base_readl = &_base_readl_aero;
 	else
diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.h b/drivers/scsi/mpt3sas/mpt3sas_base.h
index faca0a5e71f8..e57cade1155c 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.h
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.h
@@ -1011,7 +1011,6 @@ typedef void (*MPT3SAS_FLUSH_RUNNING_CMDS)(struct MPT3SAS_ADAPTER *ioc);
  * @ir_firmware: IR firmware present
  * @bars: bitmask of BAR's that must be configured
  * @mask_interrupts: ignore interrupt
- * @dma_mask: used to set the consistent dma mask
  * @pci_access_mutex: Mutex to synchronize ioctl, sysfs show path and
  *			pci resource handling
  * @fault_reset_work_q_name: fw fault work queue
@@ -1185,7 +1184,6 @@ struct MPT3SAS_ADAPTER {
 	u8		ir_firmware;
 	int		bars;
 	u8		mask_interrupts;
-	int		dma_mask;
 
 	/* fw fault handler */
 	char		fault_reset_work_q_name[20];
-- 
2.24.1

