Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F145B476BAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:14:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4fR69vsz3dqf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:14:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z1PyRJCK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Z1PyRJCK; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgK24gblz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:26 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id f20so22310777qtb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/CSiV11No1JhBfE8n1sorYu/7lZ15nplhFQqubRs1Lo=;
 b=Z1PyRJCKmBylvLz+oUbQd7WW+yVNRwH0bgVCk5VnYrgvUlS0offAg/muwEynsqMjvX
 82yPf6jZBh6KmxLhq+pa+kIof1yuPpw5NvRfpMVJTe8czZLx/P7xxren+3B6Ym3UqO+D
 Io+uA/V+gO9KjryFUspo0DWE+CQgLgfUZ2Abd/P0xeh+WpoFfnKO/8atASNwpeXcdev8
 Bada2E/8GuxO4bVj9Rj474qi/OQzW2cFj9XZ3mn7SjswnzFeTjDP0PCFj0YiMqDiXZbW
 q0MT6sdE6Uy1Ue9UB3bDFPmSd30ObjeHJrJl3i0MhUESYQHnl4csi7vSFpIglRV0n+kp
 WT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/CSiV11No1JhBfE8n1sorYu/7lZ15nplhFQqubRs1Lo=;
 b=c2pSZ36aP4tL89yd3CnYxRG5uy9SEMOLxah+blT0Kw8Iu4rbmwCEPhVR36dIqaZqoZ
 sz3Y371/ArSza0E7Ns6MhykFPLPkrj7gzYohYcHbJndQD+7AvtmpEdl3wuc+lcEuwk6L
 ikmqy9p6hsaTz3oogxtdYGKRp8XOlN/8Ujs9bzLgXnhuzPGwHzECVrrOHegWcxGiDCvl
 WM5nhz4omCt4Bq7Utktde/dRUeiOz35M2AIZQVU2BhgJ5+nh8UdPCeyP7IYVJNq2Bzxs
 zFi6z344a5MiMupUkKsv1YDt5dr9hMGr4yEcrBwRjsywki7Cyxc3Nf3l2G0XjARzOC1H
 EJTQ==
X-Gm-Message-State: AOAM530LGZBzo/mpSsqkwPQ/2n5GK8fXpIePU+cu7BWNEdRw8NuXVLC/
 aSsGWn547Q/m3TcSAPkvGUw6m6RBfDE=
X-Google-Smtp-Source: ABdhPJxq/UI3XLhmxJPO/Z6STcHDJnJgtDqC1tPiyvd683e1oRYBT6s13P9abDafa6X+fvVA/SDqIA==
X-Received: by 2002:ac8:5c89:: with SMTP id r9mr12528441qta.525.1639584803590; 
 Wed, 15 Dec 2021 08:13:23 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:22 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/20] powerpc/cell: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:30 -0500
Message-Id: <20211215161243.16396-8-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/cell' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/cell/cbe_regs.c    |  2 +-
 arch/powerpc/platforms/cell/iommu.c       | 14 +++++++-------
 arch/powerpc/platforms/cell/spu_base.c    |  6 +++---
 arch/powerpc/platforms/cell/spu_manage.c  | 16 ++++++++--------
 arch/powerpc/platforms/cell/spufs/inode.c |  2 +-
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
index c2a0678d85db..1c4c53bec66c 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -165,7 +165,7 @@ u32 cbe_node_to_cpu(int node)
 }
 EXPORT_SYMBOL_GPL(cbe_node_to_cpu);
 
-static struct device_node *cbe_get_be_node(int cpu_id)
+static struct device_node *__init cbe_get_be_node(int cpu_id)
 {
 	struct device_node *np;
 
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index d32f24de8479..25e726bf0172 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -253,7 +253,7 @@ static irqreturn_t ioc_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int cell_iommu_find_ioc(int nid, unsigned long *base)
+static int __init cell_iommu_find_ioc(int nid, unsigned long *base)
 {
 	struct device_node *np;
 	struct resource r;
@@ -293,7 +293,7 @@ static int cell_iommu_find_ioc(int nid, unsigned long *base)
 	return -ENODEV;
 }
 
-static void cell_iommu_setup_stab(struct cbe_iommu *iommu,
+static void __init cell_iommu_setup_stab(struct cbe_iommu *iommu,
 				unsigned long dbase, unsigned long dsize,
 				unsigned long fbase, unsigned long fsize)
 {
@@ -313,7 +313,7 @@ static void cell_iommu_setup_stab(struct cbe_iommu *iommu,
 	memset(iommu->stab, 0, stab_size);
 }
 
-static unsigned long *cell_iommu_alloc_ptab(struct cbe_iommu *iommu,
+static unsigned long *__init cell_iommu_alloc_ptab(struct cbe_iommu *iommu,
 		unsigned long base, unsigned long size, unsigned long gap_base,
 		unsigned long gap_size, unsigned long page_shift)
 {
@@ -373,7 +373,7 @@ static unsigned long *cell_iommu_alloc_ptab(struct cbe_iommu *iommu,
 	return ptab;
 }
 
-static void cell_iommu_enable_hardware(struct cbe_iommu *iommu)
+static void __init cell_iommu_enable_hardware(struct cbe_iommu *iommu)
 {
 	int ret;
 	unsigned long reg, xlate_base;
@@ -413,7 +413,7 @@ static void cell_iommu_enable_hardware(struct cbe_iommu *iommu)
 	out_be64(iommu->cmd_regs + IOC_IOCmd_Cfg, reg);
 }
 
-static void cell_iommu_setup_hardware(struct cbe_iommu *iommu,
+static void __init cell_iommu_setup_hardware(struct cbe_iommu *iommu,
 	unsigned long base, unsigned long size)
 {
 	cell_iommu_setup_stab(iommu, base, size, 0, 0);
@@ -858,7 +858,7 @@ static bool cell_pci_iommu_bypass_supported(struct pci_dev *pdev, u64 mask)
 		cell_iommu_get_fixed_address(&pdev->dev) != OF_BAD_ADDR;
 }
 
-static void insert_16M_pte(unsigned long addr, unsigned long *ptab,
+static void __init insert_16M_pte(unsigned long addr, unsigned long *ptab,
 			   unsigned long base_pte)
 {
 	unsigned long segment, offset;
@@ -873,7 +873,7 @@ static void insert_16M_pte(unsigned long addr, unsigned long *ptab,
 	ptab[offset] = base_pte | (__pa(addr) & CBE_IOPTE_RPN_Mask);
 }
 
-static void cell_iommu_setup_fixed_ptab(struct cbe_iommu *iommu,
+static void __init cell_iommu_setup_fixed_ptab(struct cbe_iommu *iommu,
 	struct device_node *np, unsigned long dbase, unsigned long dsize,
 	unsigned long fbase, unsigned long fsize)
 {
diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index bc48234443b6..83cea9e7ee72 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -387,7 +387,7 @@ spu_irq_class_2(int irq, void *data)
 	return stat ? IRQ_HANDLED : IRQ_NONE;
 }
 
-static int spu_request_irqs(struct spu *spu)
+static int __init spu_request_irqs(struct spu *spu)
 {
 	int ret = 0;
 
@@ -540,7 +540,7 @@ void spu_remove_dev_attr_group(struct attribute_group *attrs)
 }
 EXPORT_SYMBOL_GPL(spu_remove_dev_attr_group);
 
-static int spu_create_dev(struct spu *spu)
+static int __init spu_create_dev(struct spu *spu)
 {
 	int ret;
 
@@ -711,7 +711,7 @@ static void crash_kexec_stop_spus(void)
 	}
 }
 
-static void crash_register_spus(struct list_head *list)
+static void __init crash_register_spus(struct list_head *list)
 {
 	struct spu *spu;
 	int ret;
diff --git a/arch/powerpc/platforms/cell/spu_manage.c b/arch/powerpc/platforms/cell/spu_manage.c
index 8e9ef65240c3..ddf8742f09a3 100644
--- a/arch/powerpc/platforms/cell/spu_manage.c
+++ b/arch/powerpc/platforms/cell/spu_manage.c
@@ -186,7 +186,7 @@ static int __init spu_map_interrupts(struct spu *spu, struct device_node *np)
 	return -EINVAL;
 }
 
-static int spu_map_resource(struct spu *spu, int nr,
+static int __init spu_map_resource(struct spu *spu, int nr,
 			    void __iomem** virt, unsigned long *phys)
 {
 	struct device_node *np = spu->devnode;
@@ -361,7 +361,7 @@ static void disable_spu_by_master_run(struct spu_context *ctx)
 static int qs20_reg_idxs[QS20_SPES_PER_BE] =   { 0, 2, 4, 6, 7, 5, 3, 1 };
 static int qs20_reg_memory[QS20_SPES_PER_BE] = { 1, 1, 0, 0, 0, 0, 0, 0 };
 
-static struct spu *spu_lookup_reg(int node, u32 reg)
+static struct spu *__init spu_lookup_reg(int node, u32 reg)
 {
 	struct spu *spu;
 	const u32 *spu_reg;
@@ -374,7 +374,7 @@ static struct spu *spu_lookup_reg(int node, u32 reg)
 	return NULL;
 }
 
-static void init_affinity_qs20_harcoded(void)
+static void __init init_affinity_qs20_harcoded(void)
 {
 	int node, i;
 	struct spu *last_spu, *spu;
@@ -396,7 +396,7 @@ static void init_affinity_qs20_harcoded(void)
 	}
 }
 
-static int of_has_vicinity(void)
+static int __init of_has_vicinity(void)
 {
 	struct device_node *dn;
 
@@ -409,7 +409,7 @@ static int of_has_vicinity(void)
 	return 0;
 }
 
-static struct spu *devnode_spu(int cbe, struct device_node *dn)
+static struct spu *__init devnode_spu(int cbe, struct device_node *dn)
 {
 	struct spu *spu;
 
@@ -419,7 +419,7 @@ static struct spu *devnode_spu(int cbe, struct device_node *dn)
 	return NULL;
 }
 
-static struct spu *
+static struct spu * __init
 neighbour_spu(int cbe, struct device_node *target, struct device_node *avoid)
 {
 	struct spu *spu;
@@ -440,7 +440,7 @@ neighbour_spu(int cbe, struct device_node *target, struct device_node *avoid)
 	return NULL;
 }
 
-static void init_affinity_node(int cbe)
+static void __init init_affinity_node(int cbe)
 {
 	struct spu *spu, *last_spu;
 	struct device_node *vic_dn, *last_spu_dn;
@@ -494,7 +494,7 @@ static void init_affinity_node(int cbe)
 	}
 }
 
-static void init_affinity_fw(void)
+static void __init init_affinity_fw(void)
 {
 	int cbe;
 
diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index cb25acccd746..4c702192412f 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -648,7 +648,7 @@ static void spufs_exit_isolated_loader(void)
 			get_order(isolated_loader_size));
 }
 
-static void
+static void __init
 spufs_init_isolated_loader(void)
 {
 	struct device_node *dn;
-- 
2.25.1

