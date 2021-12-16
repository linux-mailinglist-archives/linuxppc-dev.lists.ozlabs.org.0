Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616C477FDA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:09:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR952tyQz3dmJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:09:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lGhmiFjr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lGhmiFjr; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzf27CKz3cBH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:02 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id ke6so645335qvb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9B5qgW0HBVzPqFUNOfUIHwC65WVVDR/PYpT2AxrYRRI=;
 b=lGhmiFjrWCBPIBHaV9B4M614iLL7ko40SgtTP+Q2Sv7f1LjPeAkrNy7LlnXHE98k0R
 iUbc8pYUfVmI7CJmAI9YpiKYbKhWD0//Vpd6vAKpkZE6oKwIB1e/C0TaUnbwIYwAP1lQ
 oXQ5Ja2dhHqQh1WQXa1G0BoMZ+kIZWcGqTvK//Dse6YwTy4qOaoX7j29eddu0+sZB9k9
 DgHtINMV22MerpSVBMbX/vIW1NdFc1pWGIO1bWVmRsdXQOrLTOSTwAvAOtpnZRqU93PN
 jH7LNCh9MIW4PW51ptTv0xuLcWREliWbMfmLDv/rJxgYFoG65H7yaYCCEE7pKkc7k/Uc
 BhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9B5qgW0HBVzPqFUNOfUIHwC65WVVDR/PYpT2AxrYRRI=;
 b=FvOl4hEFKixWrJV0aBpEtOLZJaBUIXcYUU1PUc4lqlRCTF3TmRtTq8Sj5q5fXiJISm
 xeEorqHVT6i2aUer28LwFZU+vs/JBXzhNQTCv8ZD67wckvfUlhk7LDToEvNasAxQbwUt
 nKnCFIzRBljzPRIWXJ643+A+j96POjjjzYHrPWIFVWj22/i/nesI7OgzoBGpjFX8Xbe6
 z4/ALV0JshYiuoApbinswVt0fBrEb2xqcoVHTuFmJLu3DIV+ULMpoinEbYgLniZaT+dl
 bamekV74RCw6PS26NE754mgNQ9hPS30re8GepbuRv1LBikgIjQw1hUSD9pB4EpT4D5Wq
 YCbg==
X-Gm-Message-State: AOAM532vIvAeGR4yTiR4VwzlFAp//Tzd6IpmpJ3BC5KOlVBun32G7vyH
 JsYSGf/nMPzNF3Fo08yuIOsmMwaZ6fI=
X-Google-Smtp-Source: ABdhPJxbs/cJEjdTnQO5Lqh/tqILbi4XeLWvWMKTmq5zr96pBwbcLhxodKBcZY70pt1YaaqAX9Rhuw==
X-Received: by 2002:a05:6214:c89:: with SMTP id
 r9mr17755229qvr.81.1639692059279; 
 Thu, 16 Dec 2021 14:00:59 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:58 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/20] powerpc/pseries: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:27 -0500
Message-Id: <20211216220035.605465-13-nick.child@ibm.com>
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

Some functions defined in 'arch/powerpc/platforms/pseries' are
deserving of an `__init` macro attribute. These functions are only
called by other initialization functions and therefore should inherit
the attribute.
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
index 7fee46e50377..ba5b1becf518 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -258,7 +258,7 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 }
 
 #ifdef CONFIG_PPC_PSERIES
-extern void radix_init_pseries(void);
+void __init radix_init_pseries(void);
 #else
 static inline void radix_init_pseries(void) { }
 #endif
diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index c361212ac160..d7912b66c874 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -275,7 +275,7 @@ extern void iommu_unmap_page(struct iommu_table *tbl, dma_addr_t dma_handle,
 			     size_t size, enum dma_data_direction direction,
 			     unsigned long attrs);
 
-extern void iommu_init_early_pSeries(void);
+void __init iommu_init_early_pSeries(void);
 extern void iommu_init_early_dart(struct pci_controller_ops *controller_ops);
 extern void iommu_init_early_pasemi(void);
 
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 607e42b8cbf0..71658504dadd 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -32,7 +32,7 @@ void setup_panic(void);
 extern bool pseries_enable_reloc_on_exc(void);
 extern void pseries_disable_reloc_on_exc(void);
 extern void pseries_big_endian_exceptions(void);
-extern void pseries_little_endian_exceptions(void);
+void __init pseries_little_endian_exceptions(void);
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
index fac5d86777db..f8899d506ea4 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -714,7 +714,7 @@ void vpa_init(int cpu)
 
 #ifdef CONFIG_PPC_BOOK3S_64
 
-static int pseries_lpar_register_process_table(unsigned long base,
+static int __init pseries_lpar_register_process_table(unsigned long base,
 			unsigned long page_size, unsigned long table_size)
 {
 	long rc;
@@ -1737,7 +1737,7 @@ void __init hpte_init_pseries(void)
 #endif /* CONFIG_PPC_64S_HASH_MMU */
 
 #ifdef CONFIG_PPC_RADIX_MMU
-void radix_init_pseries(void)
+void __init radix_init_pseries(void)
 {
 	pr_info("Using radix MMU under hypervisor\n");
 
@@ -1938,7 +1938,7 @@ int h_get_mpp_x(struct hvcall_mpp_x_data *mpp_x_data)
 }
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
-static unsigned long vsid_unscramble(unsigned long vsid, int ssize)
+static unsigned long __init vsid_unscramble(unsigned long vsid, int ssize)
 {
 	unsigned long protovsid;
 	unsigned long va_bits = VA_BITS;
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index b4c63c481f33..56c9ef9052e9 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -11,7 +11,7 @@
 
 struct device_node;
 
-extern void request_event_sources_irqs(struct device_node *np,
+void __init request_event_sources_irqs(struct device_node *np,
 				       irq_handler_t handler, const char *name);
 
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
index 7f69237d4fa4..83a04d967a59 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -447,7 +447,7 @@ void pseries_big_endian_exceptions(void)
 		panic("Could not enable big endian exceptions");
 }
 
-void pseries_little_endian_exceptions(void)
+void __init pseries_little_endian_exceptions(void)
 {
 	long rc;
 
@@ -907,7 +907,7 @@ void pSeries_coalesce_init(void)
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

