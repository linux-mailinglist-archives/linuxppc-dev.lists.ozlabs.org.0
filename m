Return-Path: <linuxppc-dev+bounces-637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDDE961F25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 08:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtvDq4ftgz2yYJ;
	Wed, 28 Aug 2024 16:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724825483;
	cv=none; b=moiSSe3X9T+uGWzCitBS4TNOnma0C3nxeXAXg0DeHida+5T6S6Mi9zyT/DQRhLMVJVjImVJwmVM2skqEWaWvNeP28rx4NXncdUgymYv28M+GZnVMQ/asDF/0SZd/INoznIYVavLGAMMiJF1kOLbTpHPjFeeIQiL7q5+y8tI6e65tOcVZ6FIMRxpRhX2HAogDw8Oo5ycW+A9AqfOiVyL4+ehCFTcCkBALP0FZ2V+Z1/T/3BTBgF9hGmoCCMe0yRfrYvN6OoH/+lo2rtLiVDqjjet4lPm6XIoehrt2psOEgn6tFKGEhmSOvt/KL6VO1rk/HE7G+ZnujE/Y34ATvwgbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724825483; c=relaxed/relaxed;
	bh=wLOj1wm4quKRI7T//ojIfZpi6nYGjLfhudVG0GuNPR8=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SRS-Rewrite; b=GojjLcWx18Xfp++S+2NdwlHHTDSDV8t/ZDaWKKulFRDqw0twO8b3/LFYqg8GgAJNTpfeK82kvf2MwHFWJwj0kXpK+diGzJOmOIjCHMAjyzR/z7qrD5mPMVMDDH96aQHk5OGivnxE5GZY2qVRZWoiwjuYivPzAWHxAkWbZ/Sw6kvrj6pxgKapNZYoemhoNy3LBoDILkQnAVmu0Fr2RVnjAz90VHzlZEr7lrTK8DNc4u1rArLyk8JIcIQWKTQ08bwrEeN5xf/abbf+QC2UBugB1Z8MZBwEwtRuBPSRX9EACm8onzS+UrmX410EPvu5aMVq+rIGgxWZBSDjNlXCoUO/iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HY5EOWDv; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+4c6678e563c2e29e76cf+7675+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HY5EOWDv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+4c6678e563c2e29e76cf+7675+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtvDp0037z2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 16:11:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=wLOj1wm4quKRI7T//ojIfZpi6nYGjLfhudVG0GuNPR8=; b=HY5EOWDvAYPTwFU0+TFGql1uZh
	nbAq3VD6pJlrDT4lZOpvrnVWaCe6yIPpYkZEqcNiFBFslVnYFw1IPHBycNxDJd2CLktQ8p0Gjke9s
	QGOUNKDIkk3fUNqd5bJWJwhnnWM70JlLjAClfHJ6l4+cuddHMWb++DnrUXzhHrmWOS0VtyaWO5r4J
	l7GinfR91cpYZfXA47z615snfZm5LiUwDnFEqme/+VTQEKM1xBhrFo39+JTN6cRO7UGE4Jh6Wmicm
	ZgcZqS10Ad5UV+WhMS+vfAnmdwgWmnRWNKbuati0Xn19d2rIeatDB1efe1V9P3fEfL6pTqtsSnyW+
	/h07oy/g==;
Received: from [2001:4bb8:2dc:a2cd:2ccf:8fbe:8ab4:c9db] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBtk-0000000E1vN-3ebv;
	Wed, 28 Aug 2024 06:11:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/2] dma-mapping: clearly mark DMA ops as an architecture feature
Date: Wed, 28 Aug 2024 09:10:29 +0300
Message-ID: <20240828061104.1925127-3-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828061104.1925127-1-hch@lst.de>
References: <20240828061104.1925127-1-hch@lst.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

DMA ops are a helper for architectures and not for drivers to override
the DMA implementation.

Unfortunately driver authors keep ignoring this.  Make the fact more
clear by renaming the symbol to ARCH_HAS_DMA_OPS and having the two drivers
overriding their dma_ops depend on that.  These drivers should probably be
marked broken, but we can give them a bit of a grace period for that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> # for IPU6
Acked-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/Kconfig                         | 9 +++++++++
 arch/alpha/Kconfig                   | 2 +-
 arch/arm/Kconfig                     | 2 +-
 arch/arm64/Kconfig                   | 1 +
 arch/mips/Kconfig                    | 2 +-
 arch/parisc/Kconfig                  | 2 +-
 arch/powerpc/Kconfig                 | 2 +-
 arch/s390/Kconfig                    | 2 +-
 arch/sparc/Kconfig                   | 2 +-
 arch/x86/Kconfig                     | 2 +-
 drivers/macintosh/macio_asic.c       | 4 ++--
 drivers/media/pci/intel/ipu6/Kconfig | 7 ++++++-
 drivers/vdpa/Kconfig                 | 7 ++++++-
 drivers/xen/Kconfig                  | 4 ++--
 include/linux/device.h               | 2 +-
 include/linux/dma-map-ops.h          | 6 +++---
 kernel/dma/Kconfig                   | 9 ++-------
 kernel/dma/Makefile                  | 2 +-
 18 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 975dd22a2dbd22..61c4ec04878754 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -17,6 +17,15 @@ config CPU_MITIGATIONS
 	def_bool y
 endif
 
+#
+# Selected by architectures that need custom DMA operations for e.g. legacy
+# IOMMUs not handled by dma-iommu.  Drivers must never select this symbol.
+#
+config ARCH_HAS_DMA_OPS
+	depends on HAS_DMA
+	select DMA_OPS_HELPERS
+	bool
+
 menu "General architecture-dependent options"
 
 config ARCH_HAS_SUBPAGE_FAULTS
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 50ff06d5b799c9..109a4cddcd1389 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -4,12 +4,12 @@ config ALPHA
 	default y
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
+	select ARCH_HAS_DMA_OPS if PCI
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
 	select ARCH_USE_CMPXCHG_LOCKREF
-	select DMA_OPS if PCI
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 54b2bb817a7fc0..f5f7995a2f8f59 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -10,6 +10,7 @@ config ARM
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DMA_ALLOC if MMU
+	select ARCH_HAS_DMA_OPS
 	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
@@ -54,7 +55,6 @@ config ARM
 	select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select DMA_DECLARE_COHERENT
 	select DMA_GLOBAL_POOL if !MMU
-	select DMA_OPS
 	select DMA_NONCOHERENT_MMAP if MMU
 	select EDAC_SUPPORT
 	select EDAC_ATOMIC_SCRUB
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2f8ff354ca670..40940cbde435a3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -24,6 +24,7 @@ config ARM64
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
+	select ARCH_HAS_DMA_OPS if XEN
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
 	select ARCH_HAS_FAST_MULTIPLIER
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 60077e57693563..023ad33a7e945d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -8,6 +8,7 @@ config MIPS
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER if !CC_IS_CLANG || CLANG_VERSION >= 140000
 	select ARCH_HAS_DEBUG_VIRTUAL if !64BIT
+	select ARCH_HAS_DMA_OPS if MACH_JAZZ
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE if !EVA
@@ -393,7 +394,6 @@ config MACH_JAZZ
 	select ARC_PROMLIB
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
-	select DMA_OPS
 	select FW_ARC
 	select FW_ARC32
 	select ARCH_MAY_HAVE_PC_FDC
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index b0a2ac3ba91610..859835a0692c24 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -10,6 +10,7 @@ config PARISC
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_DMA_ALLOC if PA11
+	select ARCH_HAS_DMA_OPS
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_STRICT_MODULE_RWX
@@ -23,7 +24,6 @@ config PARISC
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select HAVE_RELIABLE_STACKTRACE
-	select DMA_OPS
 	select RTC_CLASS
 	select RTC_DRV_GENERIC
 	select INIT_ALL_POSSIBLE
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d7b09b064a8ac5..f87fc0375a92b3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -133,6 +133,7 @@ config PPC
 	select ARCH_HAS_DEBUG_WX		if STRICT_KERNEL_RWX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
+	select ARCH_HAS_DMA_OPS			if PPC64
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
@@ -185,7 +186,6 @@ config PPC
 	select CPUMASK_OFFSTACK			if NR_CPUS >= 8192
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DMA_OPS_BYPASS			if PPC64
-	select DMA_OPS				if PPC64
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
 	select EDAC_ATOMIC_SCRUB
 	select EDAC_SUPPORT
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index a822f952f64a9c..f31f6b85c25ccc 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -70,6 +70,7 @@ config S390
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
+	select ARCH_HAS_DMA_OPS if PCI
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	select ARCH_HAS_FORTIFY_SOURCE
@@ -137,7 +138,6 @@ config S390
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS2
 	select DCACHE_WORD_ACCESS if !KMSAN
-	select DMA_OPS if PCI
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select FUNCTION_ALIGNMENT_8B if CC_IS_GCC
 	select FUNCTION_ALIGNMENT_16B if !CC_IS_GCC
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 11bf9d312318c6..dcfdb7f1dae976 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -14,9 +14,9 @@ config SPARC
 	bool
 	default y
 	select ARCH_HAS_CPU_CACHE_ALIASING
+	select ARCH_HAS_DMA_OPS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
 	select ARCH_MIGHT_HAVE_PC_SERIO
-	select DMA_OPS
 	select OF
 	select OF_PROMTREE
 	select HAVE_ASM_MODVERSIONS
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 007bab9f2a0e39..9e2e7d361019fe 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -79,6 +79,7 @@ config X86
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE	if !X86_PAE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
+	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
 	select ARCH_HAS_EARLY_DEBUG		if KGDB
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FAST_MULTIPLIER
@@ -943,7 +944,6 @@ config DMI
 
 config GART_IOMMU
 	bool "Old AMD GART IOMMU support"
-	select DMA_OPS
 	select IOMMU_HELPER
 	select SWIOTLB
 	depends on X86_64 && PCI && AMD_NB
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 13626205530d36..bede200e32e8ff 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -387,7 +387,7 @@ static struct macio_dev * macio_add_one_device(struct macio_chip *chip,
 	dma_set_max_seg_size(&dev->ofdev.dev, 65536);
 	dma_set_seg_boundary(&dev->ofdev.dev, 0xffffffff);
 
-#if defined(CONFIG_PCI) && defined(CONFIG_DMA_OPS)
+#if defined(CONFIG_PCI) && defined(CONFIG_ARCH_HAS_DMA_OPS)
 	/* Set the DMA ops to the ones from the PCI device, this could be
 	 * fishy if we didn't know that on PowerMac it's always direct ops
 	 * or iommu ops that will work fine
@@ -396,7 +396,7 @@ static struct macio_dev * macio_add_one_device(struct macio_chip *chip,
 	 */
 	dev->ofdev.dev.archdata = chip->lbus.pdev->dev.archdata;
 	dev->ofdev.dev.dma_ops = chip->lbus.pdev->dev.dma_ops;
-#endif /* CONFIG_PCI && CONFIG_DMA_OPS */
+#endif /* CONFIG_PCI && CONFIG_ARCH_HAS_DMA_OPS */
 
 #ifdef DEBUG
 	printk("preparing mdev @%p, ofdev @%p, dev @%p, kobj @%p\n",
diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index 40e20f0aa5ae5d..49e4fb696573f6 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -4,8 +4,13 @@ config VIDEO_INTEL_IPU6
 	depends on VIDEO_DEV
 	depends on X86 && X86_64 && HAS_DMA
 	depends on IPU_BRIDGE || !IPU_BRIDGE
+	#
+	# This driver incorrectly tries to override the dma_ops.  It should
+	# never have done that, but for now keep it working on architectures
+	# that use dma ops
+	#
+	depends on ARCH_HAS_DMA_OPS
 	select AUXILIARY_BUS
-	select DMA_OPS
 	select IOMMU_IOVA
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index b08de3b7706109..559fb9d3271fcc 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -35,7 +35,12 @@ config VDPA_SIM_BLOCK
 config VDPA_USER
 	tristate "VDUSE (vDPA Device in Userspace) support"
 	depends on EVENTFD && MMU && HAS_DMA
-	select DMA_OPS
+	#
+	# This driver incorrectly tries to override the dma_ops.  It should
+	# never have done that, but for now keep it working on architectures
+	# that use dma ops
+	#
+	depends on ARCH_HAS_DMA_OPS
 	select VHOST_IOTLB
 	select IOMMU_IOVA
 	help
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index d5989871dd5de3..27f288b5f30c37 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -177,8 +177,8 @@ config XEN_GRANT_DMA_ALLOC
 
 config SWIOTLB_XEN
 	def_bool y
+	depends on ARCH_DMA_OPS
 	depends on XEN_PV || ARM || ARM64
-	select DMA_OPS
 	select SWIOTLB
 
 config XEN_PCI_STUB
@@ -348,10 +348,10 @@ config XEN_GRANT_DMA_IOMMU
 
 config XEN_GRANT_DMA_OPS
 	bool
-	select DMA_OPS
 
 config XEN_VIRTIO
 	bool "Xen virtio support"
+	depends on ARCH_DMA_OPS
 	depends on VIRTIO
 	select XEN_GRANT_DMA_OPS
 	select XEN_GRANT_DMA_IOMMU if OF
diff --git a/include/linux/device.h b/include/linux/device.h
index 1c5280d28bc389..b4bde8d226979b 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -750,7 +750,7 @@ struct device {
 	struct dev_pin_info	*pins;
 #endif
 	struct dev_msi_info	msi;
-#ifdef CONFIG_DMA_OPS
+#ifdef CONFIG_ARCH_HAS_DMA_OPS
 	const struct dma_map_ops *dma_ops;
 #endif
 	u64		*dma_mask;	/* dma mask (if dma'able device) */
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 077b15c93bb8ff..9668ddf3696e71 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -75,7 +75,7 @@ struct dma_map_ops {
 	unsigned long (*get_merge_boundary)(struct device *dev);
 };
 
-#ifdef CONFIG_DMA_OPS
+#ifdef CONFIG_ARCH_HAS_DMA_OPS
 #include <asm/dma-mapping.h>
 
 static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
@@ -90,7 +90,7 @@ static inline void set_dma_ops(struct device *dev,
 {
 	dev->dma_ops = dma_ops;
 }
-#else /* CONFIG_DMA_OPS */
+#else /* CONFIG_ARCH_HAS_DMA_OPS */
 static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
 {
 	return NULL;
@@ -99,7 +99,7 @@ static inline void set_dma_ops(struct device *dev,
 			       const struct dma_map_ops *dma_ops)
 {
 }
-#endif /* CONFIG_DMA_OPS */
+#endif /* CONFIG_ARCH_HAS_DMA_OPS */
 
 #ifdef CONFIG_DMA_CMA
 extern struct cma *dma_contiguous_default_area;
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 21bae17008368a..4c0dcd90912167 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -11,11 +11,6 @@ config HAS_DMA
 config DMA_OPS_HELPERS
 	bool
 
-config DMA_OPS
-	depends on HAS_DMA
-	select DMA_OPS_HELPERS
-	bool
-
 #
 # IOMMU drivers that can bypass the IOMMU code and optionally use the direct
 # mapping fast path should select this option and set the dma_ops_bypass
@@ -113,8 +108,8 @@ config DMA_BOUNCE_UNALIGNED_KMALLOC
 
 config DMA_NEED_SYNC
 	def_bool ARCH_HAS_SYNC_DMA_FOR_DEVICE || ARCH_HAS_SYNC_DMA_FOR_CPU || \
-		 ARCH_HAS_SYNC_DMA_FOR_CPU_ALL || DMA_API_DEBUG || DMA_OPS || \
-		 SWIOTLB
+		 ARCH_HAS_SYNC_DMA_FOR_CPU_ALL || DMA_API_DEBUG || \
+		 ARCH_HAS_DMA_OPS || SWIOTLB
 
 config DMA_RESTRICTED_POOL
 	bool "DMA Restricted Pool"
diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
index 2e6e933cf7f3fb..6977033444a375 100644
--- a/kernel/dma/Makefile
+++ b/kernel/dma/Makefile
@@ -2,7 +2,7 @@
 
 obj-$(CONFIG_HAS_DMA)			+= mapping.o direct.o
 obj-$(CONFIG_DMA_OPS_HELPERS)		+= ops_helpers.o
-obj-$(CONFIG_DMA_OPS)			+= dummy.o
+obj-$(CONFIG_ARCH_HAS_DMA_OPS)		+= dummy.o
 obj-$(CONFIG_DMA_CMA)			+= contiguous.o
 obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
 obj-$(CONFIG_DMA_API_DEBUG)		+= debug.o
-- 
2.43.0


