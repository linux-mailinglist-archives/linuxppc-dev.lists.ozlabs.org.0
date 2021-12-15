Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4464C476BBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:18:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4k91PmRz3f7P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:18:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RrrTlqRB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RrrTlqRB; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgK83Ldtz3000
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:32 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id gu12so20708679qvb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J+p2ufkS44mj4L0bEZIBK0XDNk/laHCXbSvBgnbg/qw=;
 b=RrrTlqRBKDynApeG9UnCV5JT7Fh2zX0s0RlVn5dnfQMMaPduks6KvE23Gwws5sHo1C
 aVAjh3eCeMNJhkVRf78qPctlO6F23BcqdJmhJfN9HHS/0Yj1FHzgkQJKeHLZb9w4jCfL
 003EMcO+HByxHSnzJn7SAXhwaetYto+LvqC6m+ed8DGuCwSdOx6eEFn33gmK7LBMoegj
 KFlTKmbKFeuAfnziXUQw5sqCeWqsnVOH6PulCItjmLyQL8k5qzTuSU/YTK0+fH848wqE
 pcinbSMb2bMFPq5LLFHtDu31l/dWkw1Vv4jarQiPb+Y7RI/j/OMDoIJympXSdf7pf56H
 4M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J+p2ufkS44mj4L0bEZIBK0XDNk/laHCXbSvBgnbg/qw=;
 b=VCHOk0Kpuxgw5GCVVN2z+py8XeCTnVIsDw4ia3d41+zY4rPfn4zuK9D2bWDm+8K6yx
 jlazf/T1HVzQPAkkhaB1mr1PSmWR0w9OB4W6Qz6hRVONqn3lEt2lOeS0X/YavijVA0C8
 6afVeGnwA/jyd3cSgxh0fvcEawOIhnOSXL9p7xE7JB12IzfSymMXdrmLwMAjBCBayn9v
 s4j7AY9YNHOemqvZeg4pZlI7NIQJfua/o//ybFgRlEKDV31IPnIibBCwf0c5RgEFDc1u
 RNf7fQsGBh9LYrYrBM+R9LXHu9t3eTtY+yV4peMS3w0eWmEashOCWyutgrpLkoZKV5VN
 20aA==
X-Gm-Message-State: AOAM530cXvqDFZ2/2RgUZYG7WoYgbLtM749fukpgsLr1DK3m+UV5MkQP
 1ZL/7LcfQ23lMxcIp4giFruo3Kl4aig=
X-Google-Smtp-Source: ABdhPJzfwWOk4zCO1Urj7dc7i+8fqVCffENmaXGSIcigRjzsG+qwQ8Y9O4EhmNpel1rnkptFh3iPuw==
X-Received: by 2002:ad4:442e:: with SMTP id e14mr11666454qvt.99.1639584810043; 
 Wed, 15 Dec 2021 08:13:30 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:29 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/20] powerpc/pseries: Add __init attribute to eligible
 functions
Date: Wed, 15 Dec 2021 11:12:35 -0500
Message-Id: <20211215161243.16396-13-nick.child@ibm.com>
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

Some functions defined in 'arch/powerpc/platforms/pseries' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h       | 2 +-
 arch/powerpc/include/asm/iommu.h               | 2 +-
 arch/powerpc/include/asm/setup.h               | 2 +-
 arch/powerpc/platforms/pseries/event_sources.c | 2 +-
 arch/powerpc/platforms/pseries/iommu.c         | 2 +-
 arch/powerpc/platforms/pseries/lpar.c          | 6 +++---
 arch/powerpc/platforms/pseries/pseries.h       | 2 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c   | 6 +++---
 arch/powerpc/platforms/pseries/setup.c         | 4 ++--
 arch/powerpc/platforms/pseries/vas.c           | 2 +-
 arch/powerpc/platforms/pseries/vio.c           | 6 +++---
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index c02f42d1031e..7c6a210cb482 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -238,7 +238,7 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 }
 
 #ifdef CONFIG_PPC_PSERIES
-extern void radix_init_pseries(void);
+extern void radix_init_pseries(void) __init;
 #else
 static inline void radix_init_pseries(void) { }
 #endif
diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index c361212ac160..d38d43af4495 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -275,7 +275,7 @@ extern void iommu_unmap_page(struct iommu_table *tbl, dma_addr_t dma_handle,
 			     size_t size, enum dma_data_direction direction,
 			     unsigned long attrs);
 
-extern void iommu_init_early_pSeries(void);
+extern void iommu_init_early_pSeries(void) __init;
 extern void iommu_init_early_dart(struct pci_controller_ops *controller_ops);
 extern void iommu_init_early_pasemi(void);
 
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index fb2de1b1c266..5257f498d611 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -32,7 +32,7 @@ void setup_panic(void);
 extern bool pseries_enable_reloc_on_exc(void);
 extern void pseries_disable_reloc_on_exc(void);
 extern void pseries_big_endian_exceptions(void);
-extern void pseries_little_endian_exceptions(void);
+extern void pseries_little_endian_exceptions(void) __init;
 #else
 static inline bool pseries_enable_reloc_on_exc(void) { return false; }
 static inline void pseries_disable_reloc_on_exc(void) {}
diff --git a/arch/powerpc/platforms/pseries/event_sources.c b/arch/powerpc/platforms/pseries/event_sources.c
index be661e919c76..623dfe0d8e1c 100644
--- a/arch/powerpc/platforms/pseries/event_sources.c
+++ b/arch/powerpc/platforms/pseries/event_sources.c
@@ -8,7 +8,7 @@
 
 #include "pseries.h"
 
-void request_event_sources_irqs(struct device_node *np,
+void __init request_event_sources_irqs(struct device_node *np,
 				irq_handler_t handler,
 				const char *name)
 {
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 8f998e55735b..4d991cf840d9 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1654,7 +1654,7 @@ static struct notifier_block iommu_reconfig_nb = {
 };
 
 /* These are called very early. */
-void iommu_init_early_pSeries(void)
+void __init iommu_init_early_pSeries(void)
 {
 	if (of_chosen && of_get_property(of_chosen, "linux,iommu-off", NULL))
 		return;
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 3df6bdfea475..2729c489a533 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1680,7 +1680,7 @@ static int pseries_lpar_resize_hpt(unsigned long shift)
 	return 0;
 }
 
-static int pseries_lpar_register_process_table(unsigned long base,
+static int __init pseries_lpar_register_process_table(unsigned long base,
 			unsigned long page_size, unsigned long table_size)
 {
 	long rc;
@@ -1732,7 +1732,7 @@ void __init hpte_init_pseries(void)
 }
 
 #ifdef CONFIG_PPC_RADIX_MMU
-void radix_init_pseries(void)
+void __init radix_init_pseries(void)
 {
 	pr_info("Using radix MMU under hypervisor\n");
 
@@ -1932,7 +1932,7 @@ int h_get_mpp_x(struct hvcall_mpp_x_data *mpp_x_data)
 	return rc;
 }
 
-static unsigned long vsid_unscramble(unsigned long vsid, int ssize)
+static unsigned long __init vsid_unscramble(unsigned long vsid, int ssize)
 {
 	unsigned long protovsid;
 	unsigned long va_bits = VA_BITS;
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 3544778e06d0..ea69add75796 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -12,7 +12,7 @@
 struct device_node;
 
 extern void request_event_sources_irqs(struct device_node *np,
-				       irq_handler_t handler, const char *name);
+				       irq_handler_t handler, const char *name) __init;
 
 #include <linux/of.h>
 
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index f8f73b47b107..35f9cb602c30 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -39,7 +39,7 @@ static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
  * This function is called in the capture kernel to get configuration details
  * setup in the first kernel and passed to the f/w.
  */
-static void rtas_fadump_get_config(struct fw_dump *fadump_conf,
+static void __init rtas_fadump_get_config(struct fw_dump *fadump_conf,
 				   const struct rtas_fadump_mem_struct *fdm)
 {
 	fadump_conf->boot_mem_addr[0] =
@@ -247,7 +247,7 @@ static inline int rtas_fadump_gpr_index(u64 id)
 	return i;
 }
 
-static void rtas_fadump_set_regval(struct pt_regs *regs, u64 reg_id, u64 reg_val)
+static void __init rtas_fadump_set_regval(struct pt_regs *regs, u64 reg_id, u64 reg_val)
 {
 	int i;
 
@@ -272,7 +272,7 @@ static void rtas_fadump_set_regval(struct pt_regs *regs, u64 reg_id, u64 reg_val
 		regs->dsisr = (unsigned long)reg_val;
 }
 
-static struct rtas_fadump_reg_entry*
+static struct rtas_fadump_reg_entry* __init
 rtas_fadump_read_regs(struct rtas_fadump_reg_entry *reg_entry,
 		      struct pt_regs *regs)
 {
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 8a62af5b9c24..b9bf60689ac8 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -447,7 +447,7 @@ void pseries_big_endian_exceptions(void)
 		panic("Could not enable big endian exceptions");
 }
 
-void pseries_little_endian_exceptions(void)
+void __init pseries_little_endian_exceptions(void)
 {
 	long rc;
 
@@ -905,7 +905,7 @@ void pSeries_coalesce_init(void)
  * fw_cmo_feature_init - FW_FEATURE_CMO is not stored in ibm,hypertas-functions,
  * handle that here. (Stolen from parse_system_parameter_string)
  */
-static void pSeries_cmo_feature_init(void)
+static void __init pSeries_cmo_feature_init(void)
 {
 	char *ptr, *key, *value, *end;
 	int call_status;
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index b043e3936d21..3e59662d0181 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -482,7 +482,7 @@ EXPORT_SYMBOL_GPL(vas_unregister_api_pseries);
  * Get the specific capabilities based on the feature type.
  * Right now supports GZIP default and GZIP QoS capabilities.
  */
-static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
+static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 				struct hv_vas_cop_feat_caps *hv_caps)
 {
 	struct vas_cop_feat_caps *caps;
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index feafcb582e1b..c9f9be4ea26a 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1061,7 +1061,7 @@ static struct attribute *vio_bus_attrs[] = {
 };
 ATTRIBUTE_GROUPS(vio_bus);
 
-static void vio_cmo_sysfs_init(void)
+static void __init vio_cmo_sysfs_init(void)
 {
 	vio_bus_type.dev_groups = vio_cmo_dev_groups;
 	vio_bus_type.bus_groups = vio_bus_groups;
@@ -1073,7 +1073,7 @@ static int vio_cmo_bus_probe(struct vio_dev *viodev) { return 0; }
 static void vio_cmo_bus_remove(struct vio_dev *viodev) {}
 static void vio_cmo_set_dma_ops(struct vio_dev *viodev) {}
 static void vio_cmo_bus_init(void) {}
-static void vio_cmo_sysfs_init(void) { }
+static void __init vio_cmo_sysfs_init(void) { }
 #endif /* CONFIG_PPC_SMLPAR */
 EXPORT_SYMBOL(vio_cmo_entitlement_update);
 EXPORT_SYMBOL(vio_cmo_set_dev_desired);
@@ -1479,7 +1479,7 @@ EXPORT_SYMBOL(vio_register_device_node);
  * Starting from the root node provide, register the device node for
  * each child beneath the root.
  */
-static void vio_bus_scan_register_devices(char *root_name)
+static void __init vio_bus_scan_register_devices(char *root_name)
 {
 	struct device_node *node_root, *node_child;
 
-- 
2.25.1

