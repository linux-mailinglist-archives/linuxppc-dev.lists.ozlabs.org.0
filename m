Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9968477FD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:05:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR5B5WLLz3cPg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:05:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EFMx7aV9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EFMx7aV9; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzY1mCCz304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:57 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id eq6so601752qvb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/CSiV11No1JhBfE8n1sorYu/7lZ15nplhFQqubRs1Lo=;
 b=EFMx7aV9YZBHj9dnMpijBKysQXwYjSMv1ybC1qsFJ1OECLnrBqdWDpoW+tqZnBuJvj
 cFLdq4ZM4UPr2wDMV38/vlCuHYJRMgoG9bX4pK5DTEcNrlejdiB47AI74u2yQBujzjdS
 iYS8w4kfmF2xjdVXgBc598Rt05uytxFnnGABEgN+rV/dTvZwtfjhoYmy3a8oriUCi3en
 2YrfZoKmGR3cXrdZtlfIrgKjXtYDqXLj/DZ1a3OvG5omQ3k90LBDoDd9f/DO0ycW1mcL
 B/fdR3IuTr3UOhEy9nYhrc/VdPR88KKoguWIHUcsEVUHesy9lW9FZ26VvBFW8MHcIHx/
 WUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/CSiV11No1JhBfE8n1sorYu/7lZ15nplhFQqubRs1Lo=;
 b=6mS1HLTDrikskOKsveSG8pV9dmSUMOnADpfvueQqVFmzVlEtkXedGBRJV+2jxP4se8
 PRBftXwX28IT3161MCJtEqHvRWe1GP+HV+Y4NVj3ycSF4KXhFpfsaENDQoMn4yk/qyU7
 phA3pU0tEzwMJcsByQpXsCUadTX8+1XaGTYEjgep7B0lFhXoOEhkxzPjfx9bHAMEDIYF
 LWb2Zj4Optycfs0CSiJQgdiTKRQMfLTbSiTDVtLTrL4iI4qQ4fCPqHwhFS1Gdh0W47YL
 /X2JmZyPmBjlE/HJXhcsxBLpwVBa5K4RGMyQ7pt4ArzSzEr3f/wYN+Y18+86LIXoOevm
 gf6A==
X-Gm-Message-State: AOAM532YrRcAT0+HVOTH9OpVwQMowFf1piT+qTI5elT5DiBI/2tdjtKB
 CQ67UFJ0QRkDkaPkMUP238XX1/qzOgw=
X-Google-Smtp-Source: ABdhPJywOq/zhFF6/KYKhll2nTIHe1RLQ0ibJKvQeELUVynrYoSR2s3jXbAOQfOZkNWuJELtrZn33A==
X-Received: by 2002:a05:6214:21aa:: with SMTP id
 t10mr126746qvc.110.1639692054292; 
 Thu, 16 Dec 2021 14:00:54 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:53 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/20] powerpc/cell: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:22 -0500
Message-Id: <20211216220035.605465-8-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

