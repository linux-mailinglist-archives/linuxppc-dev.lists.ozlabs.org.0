Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC594C4076
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 09:48:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4k2J1C0Pz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 19:48:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4k1t3Nmgz30gg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 19:48:01 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 364BF68AA6; Fri, 25 Feb 2022 09:47:56 +0100 (CET)
Date: Fri, 25 Feb 2022 09:47:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: cleanup swiotlb initialization
Message-ID: <20220225084755.GA29630@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
 <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com>
 <20220224155854.GA30938@lst.de>
 <206ba6a3-770a-70ad-96bc-76c6380da988@oracle.com>
 <20220224163943.GA32088@lst.de>
 <8ffd8587-7eb3-d5b6-eab0-b86df5c0ebbd@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ffd8587-7eb3-d5b6-eab0-b86df5c0ebbd@oracle.com>
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 tboot-devel@lists.sourceforge.net, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 12:07:26PM -0500, Boris Ostrovsky wrote:
>>> Just to be clear: this crashes only as dom0. Boots fine as baremetal.
>> Ah.  I can gues what this might be.  On Xen the hypervisor controls the
>> IOMMU and we should never end up initializing it in Linux, right?
>
>
> Right, we shouldn't be in that code path.

Can you try the patch below on top of the series?


diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index b849f11a756d0..f88c9a4a5ed12 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -47,22 +47,6 @@ static unsigned int x86_swiotlb_flags;
  */
 static void __init pci_swiotlb_detect_4gb(void)
 {
-#ifdef CONFIG_SWIOTLB_XEN
-	if (xen_pv_domain()) {
-		if (xen_initial_domain())
-			x86_swiotlb_enable = true;
-
-		if (x86_swiotlb_enable) {
-			dma_ops = &xen_swiotlb_dma_ops;
-#ifdef CONFIG_PCI
-			/* Make sure ACS will be enabled */
-			pci_request_acs();
-#endif
-		}
-		return;
-	}
-#endif /* CONFIG_SWIOTLB_XEN */
-
 	/* don't initialize swiotlb if iommu=off (no_iommu=1) */
 	if (!no_iommu && max_possible_pfn > MAX_DMA32_PFN)
 		x86_swiotlb_enable = true;
@@ -82,16 +66,36 @@ static inline void __init pci_swiotlb_detect_4gb(void)
 }
 #endif /* CONFIG_SWIOTLB */
 
+#ifdef CONFIG_SWIOTLB_XEN
+static void __init xen_swiotlb_init(void)
+{
+	if (!xen_initial_domain() && !x86_swiotlb_enable)
+		return;
+	x86_swiotlb_enable = true;
+	dma_ops = &xen_swiotlb_dma_ops;
+#ifdef CONFIG_PCI
+	/* Make sure ACS will be enabled */
+	pci_request_acs();
+#endif
+	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
+}
+#else
+static inline void __init xen_swiotlb_init(void)
+{
+}
+#endif /* CONFIG_SWIOTLB_XEN */
+
 void __init pci_iommu_alloc(void)
 {
+	if (xen_pv_domain()) {
+		xen_swiotlb_init();
+		return;
+	}
 	pci_swiotlb_detect_4gb();
 	gart_iommu_hole_init();
 	amd_iommu_detect();
 	detect_intel_iommu();
-#ifdef CONFIG_SWIOTLB
-	swiotlb_init_remap(x86_swiotlb_enable, x86_swiotlb_flags,
-			   xen_pv_domain() ? xen_swiotlb_fixup : NULL);
-#endif
+	swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
 }
 
 /*
