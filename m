Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C234A190
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 07:14:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6BXB0g6Gz3c1X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 17:14:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MIbZ1MFu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+31783f3a8021f30233dc+6424+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=MIbZ1MFu; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6BVk1QpTz3bcw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 17:13:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7R3FYx/VSeEiEJOz2uYFNibCm/30TE6qd/CRtuXZYMI=; b=MIbZ1MFuIL0jkpD1JTCwAajp1c
 BQerDGkcHgA7e+GK5bSEGtu5Jfyd/U/zFNsSherYPytHjoQtSvkF6Zr/H+FKrO2/xtBRtiK8XKUPu
 6JSaWHGHOMQ3CFrkHGTRYfI7++CwdK+ZsQrBnsuijXA2MPqPnHEt9ghC7rEQ7+DuWFW5ErcSikr7C
 8oW+L7yEG/zTVoj42LoFYbNqU3jrbxfdrRM+nhKUrieUt9I7Qr799BoE/G054sf8jbmwmSJ4yIiIT
 NJfUA6x0t4SMC3icW+37ktU9fCei2FkmJ8+zcIc/1S+77L5E//cUaQOkMGUphDr+dN1RUW72BRN++
 EhVUNsPg==;
Received: from [2001:4bb8:191:f692:97ff:1e47:aee2:c7e5] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lPfid-005AmW-NQ; Fri, 26 Mar 2021 06:13:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 1/2] vfio/pci: remove vfio_pci_nvlink2
Date: Fri, 26 Mar 2021 07:13:10 +0100
Message-Id: <20210326061311.1497642-2-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210326061311.1497642-1-hch@lst.de>
References: <20210326061311.1497642-1-hch@lst.de>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver never had any open userspace (which for VFIO would include
VM kernel drivers) that use it, and thus should never have been added
by our normal userspace ABI rules.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/vfio/pci/Kconfig            |   6 -
 drivers/vfio/pci/Makefile           |   1 -
 drivers/vfio/pci/vfio_pci.c         |  18 -
 drivers/vfio/pci/vfio_pci_nvlink2.c | 490 ----------------------------
 drivers/vfio/pci/vfio_pci_private.h |  14 -
 include/uapi/linux/vfio.h           |  38 +--
 6 files changed, 4 insertions(+), 563 deletions(-)
 delete mode 100644 drivers/vfio/pci/vfio_pci_nvlink2.c

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index ac3c1dd3edeff1..53ce78d7d07be0 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -39,9 +39,3 @@ config VFIO_PCI_IGD
 	  and LPC bridge config space.
 
 	  To enable Intel IGD assignment through vfio-pci, say Y.
-
-config VFIO_PCI_NVLINK2
-	def_bool y
-	depends on VFIO_PCI && PPC_POWERNV
-	help
-	  VFIO PCI support for P9 Witherspoon machine with NVIDIA V100 GPUs
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index eff97a7cd9f139..3ff42093962f6f 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -2,7 +2,6 @@
 
 vfio-pci-y := vfio_pci.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
 vfio-pci-$(CONFIG_VFIO_PCI_IGD) += vfio_pci_igd.o
-vfio-pci-$(CONFIG_VFIO_PCI_NVLINK2) += vfio_pci_nvlink2.o
 vfio-pci-$(CONFIG_S390) += vfio_pci_zdev.o
 
 obj-$(CONFIG_VFIO_PCI) += vfio-pci.o
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 65e7e6b44578c2..d691006b642839 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -389,24 +389,6 @@ static int vfio_pci_enable(struct vfio_pci_device *vdev)
 		}
 	}
 
-	if (pdev->vendor == PCI_VENDOR_ID_NVIDIA &&
-	    IS_ENABLED(CONFIG_VFIO_PCI_NVLINK2)) {
-		ret = vfio_pci_nvdia_v100_nvlink2_init(vdev);
-		if (ret && ret != -ENODEV) {
-			pci_warn(pdev, "Failed to setup NVIDIA NV2 RAM region\n");
-			goto disable_exit;
-		}
-	}
-
-	if (pdev->vendor == PCI_VENDOR_ID_IBM &&
-	    IS_ENABLED(CONFIG_VFIO_PCI_NVLINK2)) {
-		ret = vfio_pci_ibm_npu2_init(vdev);
-		if (ret && ret != -ENODEV) {
-			pci_warn(pdev, "Failed to setup NVIDIA NV2 ATSD region\n");
-			goto disable_exit;
-		}
-	}
-
 	vfio_pci_probe_mmaps(vdev);
 
 	return 0;
diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/vfio_pci_nvlink2.c
deleted file mode 100644
index 9adcf6a8f88857..00000000000000
--- a/drivers/vfio/pci/vfio_pci_nvlink2.c
+++ /dev/null
@@ -1,490 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * VFIO PCI NVIDIA Whitherspoon GPU support a.k.a. NVLink2.
- *
- * Copyright (C) 2018 IBM Corp.  All rights reserved.
- *     Author: Alexey Kardashevskiy <aik@ozlabs.ru>
- *
- * Register an on-GPU RAM region for cacheable access.
- *
- * Derived from original vfio_pci_igd.c:
- * Copyright (C) 2016 Red Hat, Inc.  All rights reserved.
- *	Author: Alex Williamson <alex.williamson@redhat.com>
- */
-
-#include <linux/io.h>
-#include <linux/pci.h>
-#include <linux/uaccess.h>
-#include <linux/vfio.h>
-#include <linux/sched/mm.h>
-#include <linux/mmu_context.h>
-#include <asm/kvm_ppc.h>
-#include "vfio_pci_private.h"
-
-#define CREATE_TRACE_POINTS
-#include "trace.h"
-
-EXPORT_TRACEPOINT_SYMBOL_GPL(vfio_pci_nvgpu_mmap_fault);
-EXPORT_TRACEPOINT_SYMBOL_GPL(vfio_pci_nvgpu_mmap);
-EXPORT_TRACEPOINT_SYMBOL_GPL(vfio_pci_npu2_mmap);
-
-struct vfio_pci_nvgpu_data {
-	unsigned long gpu_hpa; /* GPU RAM physical address */
-	unsigned long gpu_tgt; /* TGT address of corresponding GPU RAM */
-	unsigned long useraddr; /* GPU RAM userspace address */
-	unsigned long size; /* Size of the GPU RAM window (usually 128GB) */
-	struct mm_struct *mm;
-	struct mm_iommu_table_group_mem_t *mem; /* Pre-registered RAM descr. */
-	struct pci_dev *gpdev;
-	struct notifier_block group_notifier;
-};
-
-static size_t vfio_pci_nvgpu_rw(struct vfio_pci_device *vdev,
-		char __user *buf, size_t count, loff_t *ppos, bool iswrite)
-{
-	unsigned int i = VFIO_PCI_OFFSET_TO_INDEX(*ppos) - VFIO_PCI_NUM_REGIONS;
-	struct vfio_pci_nvgpu_data *data = vdev->region[i].data;
-	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
-	loff_t posaligned = pos & PAGE_MASK, posoff = pos & ~PAGE_MASK;
-	size_t sizealigned;
-	void __iomem *ptr;
-
-	if (pos >= vdev->region[i].size)
-		return -EINVAL;
-
-	count = min(count, (size_t)(vdev->region[i].size - pos));
-
-	/*
-	 * We map only a bit of GPU RAM for a short time instead of mapping it
-	 * for the guest lifetime as:
-	 *
-	 * 1) we do not know GPU RAM size, only aperture which is 4-8 times
-	 *    bigger than actual RAM size (16/32GB RAM vs. 128GB aperture);
-	 * 2) mapping GPU RAM allows CPU to prefetch and if this happens
-	 *    before NVLink bridge is reset (which fences GPU RAM),
-	 *    hardware management interrupts (HMI) might happen, this
-	 *    will freeze NVLink bridge.
-	 *
-	 * This is not fast path anyway.
-	 */
-	sizealigned = ALIGN(posoff + count, PAGE_SIZE);
-	ptr = ioremap_cache(data->gpu_hpa + posaligned, sizealigned);
-	if (!ptr)
-		return -EFAULT;
-
-	if (iswrite) {
-		if (copy_from_user(ptr + posoff, buf, count))
-			count = -EFAULT;
-		else
-			*ppos += count;
-	} else {
-		if (copy_to_user(buf, ptr + posoff, count))
-			count = -EFAULT;
-		else
-			*ppos += count;
-	}
-
-	iounmap(ptr);
-
-	return count;
-}
-
-static void vfio_pci_nvgpu_release(struct vfio_pci_device *vdev,
-		struct vfio_pci_region *region)
-{
-	struct vfio_pci_nvgpu_data *data = region->data;
-	long ret;
-
-	/* If there were any mappings at all... */
-	if (data->mm) {
-		if (data->mem) {
-			ret = mm_iommu_put(data->mm, data->mem);
-			WARN_ON(ret);
-		}
-
-		mmdrop(data->mm);
-	}
-
-	vfio_unregister_notifier(&data->gpdev->dev, VFIO_GROUP_NOTIFY,
-			&data->group_notifier);
-
-	pnv_npu2_unmap_lpar_dev(data->gpdev);
-
-	kfree(data);
-}
-
-static vm_fault_t vfio_pci_nvgpu_mmap_fault(struct vm_fault *vmf)
-{
-	vm_fault_t ret;
-	struct vm_area_struct *vma = vmf->vma;
-	struct vfio_pci_region *region = vma->vm_private_data;
-	struct vfio_pci_nvgpu_data *data = region->data;
-	unsigned long vmf_off = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
-	unsigned long nv2pg = data->gpu_hpa >> PAGE_SHIFT;
-	unsigned long vm_pgoff = vma->vm_pgoff &
-		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
-	unsigned long pfn = nv2pg + vm_pgoff + vmf_off;
-
-	ret = vmf_insert_pfn(vma, vmf->address, pfn);
-	trace_vfio_pci_nvgpu_mmap_fault(data->gpdev, pfn << PAGE_SHIFT,
-			vmf->address, ret);
-
-	return ret;
-}
-
-static const struct vm_operations_struct vfio_pci_nvgpu_mmap_vmops = {
-	.fault = vfio_pci_nvgpu_mmap_fault,
-};
-
-static int vfio_pci_nvgpu_mmap(struct vfio_pci_device *vdev,
-		struct vfio_pci_region *region, struct vm_area_struct *vma)
-{
-	int ret;
-	struct vfio_pci_nvgpu_data *data = region->data;
-
-	if (data->useraddr)
-		return -EPERM;
-
-	if (vma->vm_end - vma->vm_start > data->size)
-		return -EINVAL;
-
-	vma->vm_private_data = region;
-	vma->vm_flags |= VM_PFNMAP;
-	vma->vm_ops = &vfio_pci_nvgpu_mmap_vmops;
-
-	/*
-	 * Calling mm_iommu_newdev() here once as the region is not
-	 * registered yet and therefore right initialization will happen now.
-	 * Other places will use mm_iommu_find() which returns
-	 * registered @mem and does not go gup().
-	 */
-	data->useraddr = vma->vm_start;
-	data->mm = current->mm;
-
-	mmgrab(data->mm);
-	ret = (int) mm_iommu_newdev(data->mm, data->useraddr,
-			vma_pages(vma), data->gpu_hpa, &data->mem);
-
-	trace_vfio_pci_nvgpu_mmap(vdev->pdev, data->gpu_hpa, data->useraddr,
-			vma->vm_end - vma->vm_start, ret);
-
-	return ret;
-}
-
-static int vfio_pci_nvgpu_add_capability(struct vfio_pci_device *vdev,
-		struct vfio_pci_region *region, struct vfio_info_cap *caps)
-{
-	struct vfio_pci_nvgpu_data *data = region->data;
-	struct vfio_region_info_cap_nvlink2_ssatgt cap = {
-		.header.id = VFIO_REGION_INFO_CAP_NVLINK2_SSATGT,
-		.header.version = 1,
-		.tgt = data->gpu_tgt
-	};
-
-	return vfio_info_add_capability(caps, &cap.header, sizeof(cap));
-}
-
-static const struct vfio_pci_regops vfio_pci_nvgpu_regops = {
-	.rw = vfio_pci_nvgpu_rw,
-	.release = vfio_pci_nvgpu_release,
-	.mmap = vfio_pci_nvgpu_mmap,
-	.add_capability = vfio_pci_nvgpu_add_capability,
-};
-
-static int vfio_pci_nvgpu_group_notifier(struct notifier_block *nb,
-		unsigned long action, void *opaque)
-{
-	struct kvm *kvm = opaque;
-	struct vfio_pci_nvgpu_data *data = container_of(nb,
-			struct vfio_pci_nvgpu_data,
-			group_notifier);
-
-	if (action == VFIO_GROUP_NOTIFY_SET_KVM && kvm &&
-			pnv_npu2_map_lpar_dev(data->gpdev,
-				kvm->arch.lpid, MSR_DR | MSR_PR))
-		return NOTIFY_BAD;
-
-	return NOTIFY_OK;
-}
-
-int vfio_pci_nvdia_v100_nvlink2_init(struct vfio_pci_device *vdev)
-{
-	int ret;
-	u64 reg[2];
-	u64 tgt = 0;
-	struct device_node *npu_node, *mem_node;
-	struct pci_dev *npu_dev;
-	struct vfio_pci_nvgpu_data *data;
-	uint32_t mem_phandle = 0;
-	unsigned long events = VFIO_GROUP_NOTIFY_SET_KVM;
-
-	/*
-	 * PCI config space does not tell us about NVLink presense but
-	 * platform does, use this.
-	 */
-	npu_dev = pnv_pci_get_npu_dev(vdev->pdev, 0);
-	if (!npu_dev)
-		return -ENODEV;
-
-	npu_node = pci_device_to_OF_node(npu_dev);
-	if (!npu_node)
-		return -EINVAL;
-
-	if (of_property_read_u32(npu_node, "memory-region", &mem_phandle))
-		return -ENODEV;
-
-	mem_node = of_find_node_by_phandle(mem_phandle);
-	if (!mem_node)
-		return -EINVAL;
-
-	if (of_property_read_variable_u64_array(mem_node, "reg", reg,
-				ARRAY_SIZE(reg), ARRAY_SIZE(reg)) !=
-			ARRAY_SIZE(reg))
-		return -EINVAL;
-
-	if (of_property_read_u64(npu_node, "ibm,device-tgt-addr", &tgt)) {
-		dev_warn(&vdev->pdev->dev, "No ibm,device-tgt-addr found\n");
-		return -EFAULT;
-	}
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->gpu_hpa = reg[0];
-	data->gpu_tgt = tgt;
-	data->size = reg[1];
-
-	dev_dbg(&vdev->pdev->dev, "%lx..%lx\n", data->gpu_hpa,
-			data->gpu_hpa + data->size - 1);
-
-	data->gpdev = vdev->pdev;
-	data->group_notifier.notifier_call = vfio_pci_nvgpu_group_notifier;
-
-	ret = vfio_register_notifier(&data->gpdev->dev, VFIO_GROUP_NOTIFY,
-			&events, &data->group_notifier);
-	if (ret)
-		goto free_exit;
-
-	/*
-	 * We have just set KVM, we do not need the listener anymore.
-	 * Also, keeping it registered means that if more than one GPU is
-	 * assigned, we will get several similar notifiers notifying about
-	 * the same device again which does not help with anything.
-	 */
-	vfio_unregister_notifier(&data->gpdev->dev, VFIO_GROUP_NOTIFY,
-			&data->group_notifier);
-
-	ret = vfio_pci_register_dev_region(vdev,
-			PCI_VENDOR_ID_NVIDIA | VFIO_REGION_TYPE_PCI_VENDOR_TYPE,
-			VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM,
-			&vfio_pci_nvgpu_regops,
-			data->size,
-			VFIO_REGION_INFO_FLAG_READ |
-			VFIO_REGION_INFO_FLAG_WRITE |
-			VFIO_REGION_INFO_FLAG_MMAP,
-			data);
-	if (ret)
-		goto free_exit;
-
-	return 0;
-free_exit:
-	kfree(data);
-
-	return ret;
-}
-
-/*
- * IBM NPU2 bridge
- */
-struct vfio_pci_npu2_data {
-	void *base; /* ATSD register virtual address, for emulated access */
-	unsigned long mmio_atsd; /* ATSD physical address */
-	unsigned long gpu_tgt; /* TGT address of corresponding GPU RAM */
-	unsigned int link_speed; /* The link speed from DT's ibm,nvlink-speed */
-};
-
-static size_t vfio_pci_npu2_rw(struct vfio_pci_device *vdev,
-		char __user *buf, size_t count, loff_t *ppos, bool iswrite)
-{
-	unsigned int i = VFIO_PCI_OFFSET_TO_INDEX(*ppos) - VFIO_PCI_NUM_REGIONS;
-	struct vfio_pci_npu2_data *data = vdev->region[i].data;
-	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
-
-	if (pos >= vdev->region[i].size)
-		return -EINVAL;
-
-	count = min(count, (size_t)(vdev->region[i].size - pos));
-
-	if (iswrite) {
-		if (copy_from_user(data->base + pos, buf, count))
-			return -EFAULT;
-	} else {
-		if (copy_to_user(buf, data->base + pos, count))
-			return -EFAULT;
-	}
-	*ppos += count;
-
-	return count;
-}
-
-static int vfio_pci_npu2_mmap(struct vfio_pci_device *vdev,
-		struct vfio_pci_region *region, struct vm_area_struct *vma)
-{
-	int ret;
-	struct vfio_pci_npu2_data *data = region->data;
-	unsigned long req_len = vma->vm_end - vma->vm_start;
-
-	if (req_len != PAGE_SIZE)
-		return -EINVAL;
-
-	vma->vm_flags |= VM_PFNMAP;
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-
-	ret = remap_pfn_range(vma, vma->vm_start, data->mmio_atsd >> PAGE_SHIFT,
-			req_len, vma->vm_page_prot);
-	trace_vfio_pci_npu2_mmap(vdev->pdev, data->mmio_atsd, vma->vm_start,
-			vma->vm_end - vma->vm_start, ret);
-
-	return ret;
-}
-
-static void vfio_pci_npu2_release(struct vfio_pci_device *vdev,
-		struct vfio_pci_region *region)
-{
-	struct vfio_pci_npu2_data *data = region->data;
-
-	memunmap(data->base);
-	kfree(data);
-}
-
-static int vfio_pci_npu2_add_capability(struct vfio_pci_device *vdev,
-		struct vfio_pci_region *region, struct vfio_info_cap *caps)
-{
-	struct vfio_pci_npu2_data *data = region->data;
-	struct vfio_region_info_cap_nvlink2_ssatgt captgt = {
-		.header.id = VFIO_REGION_INFO_CAP_NVLINK2_SSATGT,
-		.header.version = 1,
-		.tgt = data->gpu_tgt
-	};
-	struct vfio_region_info_cap_nvlink2_lnkspd capspd = {
-		.header.id = VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD,
-		.header.version = 1,
-		.link_speed = data->link_speed
-	};
-	int ret;
-
-	ret = vfio_info_add_capability(caps, &captgt.header, sizeof(captgt));
-	if (ret)
-		return ret;
-
-	return vfio_info_add_capability(caps, &capspd.header, sizeof(capspd));
-}
-
-static const struct vfio_pci_regops vfio_pci_npu2_regops = {
-	.rw = vfio_pci_npu2_rw,
-	.mmap = vfio_pci_npu2_mmap,
-	.release = vfio_pci_npu2_release,
-	.add_capability = vfio_pci_npu2_add_capability,
-};
-
-int vfio_pci_ibm_npu2_init(struct vfio_pci_device *vdev)
-{
-	int ret;
-	struct vfio_pci_npu2_data *data;
-	struct device_node *nvlink_dn;
-	u32 nvlink_index = 0, mem_phandle = 0;
-	struct pci_dev *npdev = vdev->pdev;
-	struct device_node *npu_node = pci_device_to_OF_node(npdev);
-	struct pci_controller *hose = pci_bus_to_host(npdev->bus);
-	u64 mmio_atsd = 0;
-	u64 tgt = 0;
-	u32 link_speed = 0xff;
-
-	/*
-	 * PCI config space does not tell us about NVLink presense but
-	 * platform does, use this.
-	 */
-	if (!pnv_pci_get_gpu_dev(vdev->pdev))
-		return -ENODEV;
-
-	if (of_property_read_u32(npu_node, "memory-region", &mem_phandle))
-		return -ENODEV;
-
-	/*
-	 * NPU2 normally has 8 ATSD registers (for concurrency) and 6 links
-	 * so we can allocate one register per link, using nvlink index as
-	 * a key.
-	 * There is always at least one ATSD register so as long as at least
-	 * NVLink bridge #0 is passed to the guest, ATSD will be available.
-	 */
-	nvlink_dn = of_parse_phandle(npdev->dev.of_node, "ibm,nvlink", 0);
-	if (WARN_ON(of_property_read_u32(nvlink_dn, "ibm,npu-link-index",
-			&nvlink_index)))
-		return -ENODEV;
-
-	if (of_property_read_u64_index(hose->dn, "ibm,mmio-atsd", nvlink_index,
-			&mmio_atsd)) {
-		if (of_property_read_u64_index(hose->dn, "ibm,mmio-atsd", 0,
-				&mmio_atsd)) {
-			dev_warn(&vdev->pdev->dev, "No available ATSD found\n");
-			mmio_atsd = 0;
-		} else {
-			dev_warn(&vdev->pdev->dev,
-				 "Using fallback ibm,mmio-atsd[0] for ATSD.\n");
-		}
-	}
-
-	if (of_property_read_u64(npu_node, "ibm,device-tgt-addr", &tgt)) {
-		dev_warn(&vdev->pdev->dev, "No ibm,device-tgt-addr found\n");
-		return -EFAULT;
-	}
-
-	if (of_property_read_u32(npu_node, "ibm,nvlink-speed", &link_speed)) {
-		dev_warn(&vdev->pdev->dev, "No ibm,nvlink-speed found\n");
-		return -EFAULT;
-	}
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->mmio_atsd = mmio_atsd;
-	data->gpu_tgt = tgt;
-	data->link_speed = link_speed;
-	if (data->mmio_atsd) {
-		data->base = memremap(data->mmio_atsd, SZ_64K, MEMREMAP_WT);
-		if (!data->base) {
-			ret = -ENOMEM;
-			goto free_exit;
-		}
-	}
-
-	/*
-	 * We want to expose the capability even if this specific NVLink
-	 * did not get its own ATSD register because capabilities
-	 * belong to VFIO regions and normally there will be ATSD register
-	 * assigned to the NVLink bridge.
-	 */
-	ret = vfio_pci_register_dev_region(vdev,
-			PCI_VENDOR_ID_IBM |
-			VFIO_REGION_TYPE_PCI_VENDOR_TYPE,
-			VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD,
-			&vfio_pci_npu2_regops,
-			data->mmio_atsd ? PAGE_SIZE : 0,
-			VFIO_REGION_INFO_FLAG_READ |
-			VFIO_REGION_INFO_FLAG_WRITE |
-			VFIO_REGION_INFO_FLAG_MMAP,
-			data);
-	if (ret)
-		goto free_exit;
-
-	return 0;
-
-free_exit:
-	if (data->base)
-		memunmap(data->base);
-	kfree(data);
-
-	return ret;
-}
diff --git a/drivers/vfio/pci/vfio_pci_private.h b/drivers/vfio/pci/vfio_pci_private.h
index 9cd1882a05af69..cdae2e4cf11cca 100644
--- a/drivers/vfio/pci/vfio_pci_private.h
+++ b/drivers/vfio/pci/vfio_pci_private.h
@@ -199,20 +199,6 @@ static inline int vfio_pci_igd_init(struct vfio_pci_device *vdev)
 	return -ENODEV;
 }
 #endif
-#ifdef CONFIG_VFIO_PCI_NVLINK2
-extern int vfio_pci_nvdia_v100_nvlink2_init(struct vfio_pci_device *vdev);
-extern int vfio_pci_ibm_npu2_init(struct vfio_pci_device *vdev);
-#else
-static inline int vfio_pci_nvdia_v100_nvlink2_init(struct vfio_pci_device *vdev)
-{
-	return -ENODEV;
-}
-
-static inline int vfio_pci_ibm_npu2_init(struct vfio_pci_device *vdev)
-{
-	return -ENODEV;
-}
-#endif
 
 #ifdef CONFIG_S390
 extern int vfio_pci_info_zdev_add_caps(struct vfio_pci_device *vdev,
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 8ce36c1d53ca11..34b1f53a3901cb 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -333,17 +333,10 @@ struct vfio_region_info_cap_type {
 #define VFIO_REGION_SUBTYPE_INTEL_IGD_LPC_CFG	(3)
 
 /* 10de vendor PCI sub-types */
-/*
- * NVIDIA GPU NVlink2 RAM is coherent RAM mapped onto the host address space.
- */
-#define VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM	(1)
+/* subtype 1 was VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM, don't use */
 
 /* 1014 vendor PCI sub-types */
-/*
- * IBM NPU NVlink2 ATSD (Address Translation Shootdown) register of NPU
- * to do TLB invalidation on a GPU.
- */
-#define VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD	(1)
+/* subtype 1 was VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD, don't use */
 
 /* sub-types for VFIO_REGION_TYPE_GFX */
 #define VFIO_REGION_SUBTYPE_GFX_EDID            (1)
@@ -637,32 +630,9 @@ struct vfio_device_migration_info {
  */
 #define VFIO_REGION_INFO_CAP_MSIX_MAPPABLE	3
 
-/*
- * Capability with compressed real address (aka SSA - small system address)
- * where GPU RAM is mapped on a system bus. Used by a GPU for DMA routing
- * and by the userspace to associate a NVLink bridge with a GPU.
- */
-#define VFIO_REGION_INFO_CAP_NVLINK2_SSATGT	4
-
-struct vfio_region_info_cap_nvlink2_ssatgt {
-	struct vfio_info_cap_header header;
-	__u64 tgt;
-};
+/* subtype 4 was VFIO_REGION_INFO_CAP_NVLINK2_SSATGT, don't use */
 
-/*
- * Capability with an NVLink link speed. The value is read by
- * the NVlink2 bridge driver from the bridge's "ibm,nvlink-speed"
- * property in the device tree. The value is fixed in the hardware
- * and failing to provide the correct value results in the link
- * not working with no indication from the driver why.
- */
-#define VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD	5
-
-struct vfio_region_info_cap_nvlink2_lnkspd {
-	struct vfio_info_cap_header header;
-	__u32 link_speed;
-	__u32 __pad;
-};
+/* subtype 5 was VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD, don't use */
 
 /**
  * VFIO_DEVICE_GET_IRQ_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 9,
-- 
2.30.1

