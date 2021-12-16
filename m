Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D314477FCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:04:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR3l1TsZz3cm6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:04:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YpR3jSdP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YpR3jSdP; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzW27p1z304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:55 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id t11so733681qtw.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSHtBTo1ydJpSO66jmdRMfNrh6JAb2T8VnJa9pfYD6E=;
 b=YpR3jSdPjrW4+jmu5UONM+mN4MbxVFpXTK/HeSJIy03lx3piNqXMe7EQ+BIh+3ORT6
 3TXMnA37oohxRsDGbWV0yvqdlMdyRQRHtPZJyIXmlYHjduAmlJfRwQTTaHFoHNSLLM55
 AcC0Y+vI1pPJYVjTHD/UH93aX5HkA1VDCMy+ViHNWVJVxCWn3kNAMPUDb36HK+Ypjhkv
 m4VkQtkpELtrfAN2gv1KZajUOjkyIpFeCeLujULeDvyMPO4n139lUHWDFTEo16aLrf6m
 fMsQ1WdyeWwQ0wtTzt7P121U5yw7svR9SsiWwckTcpaeh5ZrMrCfRbemRfzbN7yg/QCb
 3NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSHtBTo1ydJpSO66jmdRMfNrh6JAb2T8VnJa9pfYD6E=;
 b=Z79B3t1lI3exzrvaRmXAQ1ENfuPv9F4S3w5TnvaMbNbHkMZP1QQKIFSX37Gvr3jQPh
 1MtEvWsJVzMYMlBCI2vhXbOK6aKJ1MzHmJdrZofQpJtntqOvki0T83qjAApQeDmnvWPd
 1Mw0D6+mMoLH3+Acv4E9ZwKIAgyF3lch54c6k6lAnCyS3w78YvQYBh3RfNrBM55r6ac1
 lJd7aZbWqC/DaV0RNuqd60Zi9p+KmH1MSlO2HvYrFO2jpjPjE4+sf6q/1GyksbwJgEk3
 LQ/JFHsbZ/Cv0KX8ncfZJNLkKSUVZtDmr3cf4KASjLEnBLd0yQDBcKieZEcI5dS+5pXR
 xNzQ==
X-Gm-Message-State: AOAM530Pk0PJWC6pZG413J5BZvhrnGBLJUl9wnMLvv50E9eg6H0PzsxY
 PYIClo1qq2JzO64O8DrqskPyfWr3PsY=
X-Google-Smtp-Source: ABdhPJxbsa67FctzjVLaimlhTi+2OXpjXzCVG6cotT/mp0XlQjiWZgEg/N13kNIG1jY5dmXU01en5A==
X-Received: by 2002:a05:622a:1005:: with SMTP id
 d5mr19187116qte.533.1639692051891; 
 Thu, 16 Dec 2021 14:00:51 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:51 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/20] powerpc/sysdev: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:20 -0500
Message-Id: <20211216220035.605465-6-nick.child@ibm.com>
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

Some files functions in 'arch/powerpc/sysdev' are deserving of an `__init`
macro attribute. These functions are only called by other initialization
functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/cpm2.h        | 6 +++---
 arch/powerpc/include/asm/i8259.h       | 2 +-
 arch/powerpc/include/asm/ipic.h        | 2 +-
 arch/powerpc/include/asm/mpic.h        | 2 +-
 arch/powerpc/include/asm/xics.h        | 4 ++--
 arch/powerpc/sysdev/cpm2.c             | 6 +++---
 arch/powerpc/sysdev/dart_iommu.c       | 2 +-
 arch/powerpc/sysdev/fsl_mpic_err.c     | 4 ++--
 arch/powerpc/sysdev/fsl_pci.c          | 2 +-
 arch/powerpc/sysdev/fsl_pci.h          | 2 +-
 arch/powerpc/sysdev/i8259.c            | 2 +-
 arch/powerpc/sysdev/ipic.c             | 2 +-
 arch/powerpc/sysdev/mpic.c             | 2 +-
 arch/powerpc/sysdev/mpic.h             | 8 ++++----
 arch/powerpc/sysdev/mpic_msi.c         | 6 +++---
 arch/powerpc/sysdev/mpic_timer.c       | 6 +++---
 arch/powerpc/sysdev/mpic_u3msi.c       | 2 +-
 arch/powerpc/sysdev/tsi108_pci.c       | 2 +-
 arch/powerpc/sysdev/udbg_memcons.c     | 2 +-
 arch/powerpc/sysdev/xics/icp-hv.c      | 2 +-
 arch/powerpc/sysdev/xics/icp-opal.c    | 2 +-
 arch/powerpc/sysdev/xics/xics-common.c | 2 +-
 arch/powerpc/sysdev/xive/native.c      | 4 ++--
 arch/powerpc/sysdev/xive/spapr.c       | 6 +++---
 24 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/include/asm/cpm2.h b/arch/powerpc/include/asm/cpm2.h
index bda45788cfcc..9ee192a6c5d7 100644
--- a/arch/powerpc/include/asm/cpm2.h
+++ b/arch/powerpc/include/asm/cpm2.h
@@ -1133,8 +1133,8 @@ enum cpm_clk {
 	CPM_CLK_DUMMY
 };
 
-extern int cpm2_clk_setup(enum cpm_clk_target target, int clock, int mode);
-extern int cpm2_smc_clk_setup(enum cpm_clk_target target, int clock);
+int __init cpm2_clk_setup(enum cpm_clk_target target, int clock, int mode);
+int __init cpm2_smc_clk_setup(enum cpm_clk_target target, int clock);
 
 #define CPM_PIN_INPUT     0
 #define CPM_PIN_OUTPUT    1
@@ -1143,7 +1143,7 @@ extern int cpm2_smc_clk_setup(enum cpm_clk_target target, int clock);
 #define CPM_PIN_GPIO      4
 #define CPM_PIN_OPENDRAIN 8
 
-void cpm2_set_pin(int port, int pin, int flags);
+void __init cpm2_set_pin(int port, int pin, int flags);
 
 #endif /* __CPM2__ */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/i8259.h b/arch/powerpc/include/asm/i8259.h
index d7f08ae49e12..75481d363cd8 100644
--- a/arch/powerpc/include/asm/i8259.h
+++ b/arch/powerpc/include/asm/i8259.h
@@ -7,7 +7,7 @@
 
 extern void i8259_init(struct device_node *node, unsigned long intack_addr);
 extern unsigned int i8259_irq(void);
-extern struct irq_domain *i8259_get_host(void);
+struct irq_domain *__init i8259_get_host(void);
 
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_I8259_H */
diff --git a/arch/powerpc/include/asm/ipic.h b/arch/powerpc/include/asm/ipic.h
index 0524df31a7e6..b47ca7dc7199 100644
--- a/arch/powerpc/include/asm/ipic.h
+++ b/arch/powerpc/include/asm/ipic.h
@@ -65,7 +65,7 @@ enum ipic_mcp_irq {
 	IPIC_MCP_MU   = 7,
 };
 
-extern void ipic_set_default_priority(void);
+void __init ipic_set_default_priority(void);
 extern u32 ipic_get_mcp_status(void);
 extern void ipic_clear_mcp_status(u32 mask);
 
diff --git a/arch/powerpc/include/asm/mpic.h b/arch/powerpc/include/asm/mpic.h
index 0abf2e7fd222..58353c5bd3fb 100644
--- a/arch/powerpc/include/asm/mpic.h
+++ b/arch/powerpc/include/asm/mpic.h
@@ -472,7 +472,7 @@ extern int mpic_cpu_get_priority(void);
 extern void mpic_cpu_set_priority(int prio);
 
 /* Request IPIs on primary mpic */
-extern void mpic_request_ipis(void);
+void __init mpic_request_ipis(void);
 
 /* Send a message (IPI) to a given target (cpu number or MSG_*) */
 void smp_mpic_message_pass(int target, int msg);
diff --git a/arch/powerpc/include/asm/xics.h b/arch/powerpc/include/asm/xics.h
index 0ac9bfddf704..e2e704eca5f6 100644
--- a/arch/powerpc/include/asm/xics.h
+++ b/arch/powerpc/include/asm/xics.h
@@ -38,13 +38,13 @@ static inline int icp_native_init(void) { return -ENODEV; }
 
 /* PAPR ICP */
 #ifdef CONFIG_PPC_ICP_HV
-extern int icp_hv_init(void);
+int __init icp_hv_init(void);
 #else
 static inline int icp_hv_init(void) { return -ENODEV; }
 #endif
 
 #ifdef CONFIG_PPC_POWERNV
-extern int icp_opal_init(void);
+int __init icp_opal_init(void);
 extern void icp_opal_flush_interrupt(void);
 #else
 static inline int icp_opal_init(void) { return -ENODEV; }
diff --git a/arch/powerpc/sysdev/cpm2.c b/arch/powerpc/sysdev/cpm2.c
index 68538b8329f7..3f130312b6e9 100644
--- a/arch/powerpc/sysdev/cpm2.c
+++ b/arch/powerpc/sysdev/cpm2.c
@@ -135,7 +135,7 @@ void __cpm2_setbrg(uint brg, uint rate, uint clk, int div16, int src)
 }
 EXPORT_SYMBOL(__cpm2_setbrg);
 
-int cpm2_clk_setup(enum cpm_clk_target target, int clock, int mode)
+int __init cpm2_clk_setup(enum cpm_clk_target target, int clock, int mode)
 {
 	int ret = 0;
 	int shift;
@@ -265,7 +265,7 @@ int cpm2_clk_setup(enum cpm_clk_target target, int clock, int mode)
 	return ret;
 }
 
-int cpm2_smc_clk_setup(enum cpm_clk_target target, int clock)
+int __init cpm2_smc_clk_setup(enum cpm_clk_target target, int clock)
 {
 	int ret = 0;
 	int shift;
@@ -326,7 +326,7 @@ struct cpm2_ioports {
 	u32 res[3];
 };
 
-void cpm2_set_pin(int port, int pin, int flags)
+void __init cpm2_set_pin(int port, int pin, int flags)
 {
 	struct cpm2_ioports __iomem *iop =
 		(struct cpm2_ioports __iomem *)&cpm2_immr->im_ioport;
diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_iommu.c
index 1d33b7a5ea83..be6b99b1b352 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -226,7 +226,7 @@ static void dart_free(struct iommu_table *tbl, long index, long npages)
 	dart_cache_sync(orig_dp, orig_npages);
 }
 
-static void allocate_dart(void)
+static void __init allocate_dart(void)
 {
 	unsigned long tmp;
 
diff --git a/arch/powerpc/sysdev/fsl_mpic_err.c b/arch/powerpc/sysdev/fsl_mpic_err.c
index 9a98bb212922..df06bb6b838f 100644
--- a/arch/powerpc/sysdev/fsl_mpic_err.c
+++ b/arch/powerpc/sysdev/fsl_mpic_err.c
@@ -58,7 +58,7 @@ static struct irq_chip fsl_mpic_err_chip = {
 	.irq_unmask	= fsl_mpic_unmask_err,
 };
 
-int mpic_setup_error_int(struct mpic *mpic, int intvec)
+int __init mpic_setup_error_int(struct mpic *mpic, int intvec)
 {
 	int i;
 
@@ -121,7 +121,7 @@ static irqreturn_t fsl_error_int_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-void mpic_err_int_init(struct mpic *mpic, irq_hw_number_t irqnum)
+void __init mpic_err_int_init(struct mpic *mpic, irq_hw_number_t irqnum)
 {
 	unsigned int virq;
 	int ret;
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index b8f76f3fd994..674f047b7820 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1106,7 +1106,7 @@ static const struct of_device_id pci_ids[] = {
 
 struct device_node *fsl_pci_primary;
 
-void fsl_pci_assign_primary(void)
+void __init fsl_pci_assign_primary(void)
 {
 	struct device_node *np;
 
diff --git a/arch/powerpc/sysdev/fsl_pci.h b/arch/powerpc/sysdev/fsl_pci.h
index 1d7a41205695..cdbde2e0c96e 100644
--- a/arch/powerpc/sysdev/fsl_pci.h
+++ b/arch/powerpc/sysdev/fsl_pci.h
@@ -120,7 +120,7 @@ u64 fsl_pci_immrbar_base(struct pci_controller *hose);
 extern struct device_node *fsl_pci_primary;
 
 #ifdef CONFIG_PCI
-void fsl_pci_assign_primary(void);
+void __init fsl_pci_assign_primary(void);
 #else
 static inline void fsl_pci_assign_primary(void) {}
 #endif
diff --git a/arch/powerpc/sysdev/i8259.c b/arch/powerpc/sysdev/i8259.c
index dc1a151c63d7..3b1ae98e3ce9 100644
--- a/arch/powerpc/sysdev/i8259.c
+++ b/arch/powerpc/sysdev/i8259.c
@@ -208,7 +208,7 @@ static const struct irq_domain_ops i8259_host_ops = {
 	.xlate = i8259_host_xlate,
 };
 
-struct irq_domain *i8259_get_host(void)
+struct irq_domain *__init i8259_get_host(void)
 {
 	return i8259_host;
 }
diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index 7638a50a7c38..3f10c9fc3b68 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -767,7 +767,7 @@ struct ipic * __init ipic_init(struct device_node *node, unsigned int flags)
 	return ipic;
 }
 
-void ipic_set_default_priority(void)
+void __init ipic_set_default_priority(void)
 {
 	ipic_write(primary_ipic->regs, IPIC_SIPRR_A, IPIC_PRIORITY_DEFAULT);
 	ipic_write(primary_ipic->regs, IPIC_SIPRR_B, IPIC_PRIORITY_DEFAULT);
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 995fb2ada507..956676bda0d7 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1840,7 +1840,7 @@ unsigned int mpic_get_mcirq(void)
 }
 
 #ifdef CONFIG_SMP
-void mpic_request_ipis(void)
+void __init mpic_request_ipis(void)
 {
 	struct mpic *mpic = mpic_primary;
 	int i;
diff --git a/arch/powerpc/sysdev/mpic.h b/arch/powerpc/sysdev/mpic.h
index 73a31a429d46..cbcc3fee9fca 100644
--- a/arch/powerpc/sysdev/mpic.h
+++ b/arch/powerpc/sysdev/mpic.h
@@ -8,8 +8,8 @@
 
 #ifdef CONFIG_PCI_MSI
 extern void mpic_msi_reserve_hwirq(struct mpic *mpic, irq_hw_number_t hwirq);
-extern int mpic_msi_init_allocator(struct mpic *mpic);
-extern int mpic_u3msi_init(struct mpic *mpic);
+int __init mpic_msi_init_allocator(struct mpic *mpic);
+int __init mpic_u3msi_init(struct mpic *mpic);
 #else
 static inline void mpic_msi_reserve_hwirq(struct mpic *mpic,
 					  irq_hw_number_t hwirq)
@@ -37,8 +37,8 @@ extern void mpic_reset_core(int cpu);
 
 #ifdef CONFIG_FSL_SOC
 extern int mpic_map_error_int(struct mpic *mpic, unsigned int virq, irq_hw_number_t  hw);
-extern void mpic_err_int_init(struct mpic *mpic, irq_hw_number_t irqnum);
-extern int mpic_setup_error_int(struct mpic *mpic, int intvec);
+void __init mpic_err_int_init(struct mpic *mpic, irq_hw_number_t irqnum);
+int __init mpic_setup_error_int(struct mpic *mpic, int intvec);
 #else
 static inline int mpic_map_error_int(struct mpic *mpic, unsigned int virq, irq_hw_number_t  hw)
 {
diff --git a/arch/powerpc/sysdev/mpic_msi.c b/arch/powerpc/sysdev/mpic_msi.c
index 4695c04320ae..f412d6ad0b66 100644
--- a/arch/powerpc/sysdev/mpic_msi.c
+++ b/arch/powerpc/sysdev/mpic_msi.c
@@ -24,7 +24,7 @@ void mpic_msi_reserve_hwirq(struct mpic *mpic, irq_hw_number_t hwirq)
 }
 
 #ifdef CONFIG_MPIC_U3_HT_IRQS
-static int mpic_msi_reserve_u3_hwirqs(struct mpic *mpic)
+static int __init mpic_msi_reserve_u3_hwirqs(struct mpic *mpic)
 {
 	irq_hw_number_t hwirq;
 	const struct irq_domain_ops *ops = mpic->irqhost->ops;
@@ -68,13 +68,13 @@ static int mpic_msi_reserve_u3_hwirqs(struct mpic *mpic)
 	return 0;
 }
 #else
-static int mpic_msi_reserve_u3_hwirqs(struct mpic *mpic)
+static int __init mpic_msi_reserve_u3_hwirqs(struct mpic *mpic)
 {
 	return -1;
 }
 #endif
 
-int mpic_msi_init_allocator(struct mpic *mpic)
+int __init mpic_msi_init_allocator(struct mpic *mpic)
 {
 	int rc;
 
diff --git a/arch/powerpc/sysdev/mpic_timer.c b/arch/powerpc/sysdev/mpic_timer.c
index a42a20280035..444e9ce42d0a 100644
--- a/arch/powerpc/sysdev/mpic_timer.c
+++ b/arch/powerpc/sysdev/mpic_timer.c
@@ -384,7 +384,7 @@ struct mpic_timer *mpic_request_timer(irq_handler_t fn, void *dev,
 }
 EXPORT_SYMBOL(mpic_request_timer);
 
-static int timer_group_get_freq(struct device_node *np,
+static int __init timer_group_get_freq(struct device_node *np,
 			struct timer_group_priv *priv)
 {
 	u32 div;
@@ -411,7 +411,7 @@ static int timer_group_get_freq(struct device_node *np,
 	return 0;
 }
 
-static int timer_group_get_irq(struct device_node *np,
+static int __init timer_group_get_irq(struct device_node *np,
 		struct timer_group_priv *priv)
 {
 	const u32 all_timer[] = { 0, TIMERS_PER_GROUP };
@@ -459,7 +459,7 @@ static int timer_group_get_irq(struct device_node *np,
 	return 0;
 }
 
-static void timer_group_init(struct device_node *np)
+static void __init timer_group_init(struct device_node *np)
 {
 	struct timer_group_priv *priv;
 	unsigned int i = 0;
diff --git a/arch/powerpc/sysdev/mpic_u3msi.c b/arch/powerpc/sysdev/mpic_u3msi.c
index 3861023d378a..b1219eaa80cf 100644
--- a/arch/powerpc/sysdev/mpic_u3msi.c
+++ b/arch/powerpc/sysdev/mpic_u3msi.c
@@ -174,7 +174,7 @@ static int u3msi_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 	return 0;
 }
 
-int mpic_u3msi_init(struct mpic *mpic)
+int __init mpic_u3msi_init(struct mpic *mpic)
 {
 	int rc;
 	struct pci_controller *phb;
diff --git a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pci.c
index 042bb38fa5c2..1070220f15d5 100644
--- a/arch/powerpc/sysdev/tsi108_pci.c
+++ b/arch/powerpc/sysdev/tsi108_pci.c
@@ -257,7 +257,7 @@ static void tsi108_pci_int_unmask(u_int irq)
 	mb();
 }
 
-static void init_pci_source(void)
+static void __init init_pci_source(void)
 {
 	tsi108_write_reg(TSI108_PCI_OFFSET + TSI108_PCI_IRP_CFG_CTL,
 			0x0000ff00);
diff --git a/arch/powerpc/sysdev/udbg_memcons.c b/arch/powerpc/sysdev/udbg_memcons.c
index d38bbeed219b..5020044400dc 100644
--- a/arch/powerpc/sysdev/udbg_memcons.c
+++ b/arch/powerpc/sysdev/udbg_memcons.c
@@ -92,7 +92,7 @@ int memcons_getc(void)
 	return c;
 }
 
-void udbg_init_memcons(void)
+void __init udbg_init_memcons(void)
 {
 	udbg_putc = memcons_putc;
 	udbg_getc = memcons_getc;
diff --git a/arch/powerpc/sysdev/xics/icp-hv.c b/arch/powerpc/sysdev/xics/icp-hv.c
index 6765d9e264a3..cf8db19a4f7d 100644
--- a/arch/powerpc/sysdev/xics/icp-hv.c
+++ b/arch/powerpc/sysdev/xics/icp-hv.c
@@ -162,7 +162,7 @@ static const struct icp_ops icp_hv_ops = {
 #endif
 };
 
-int icp_hv_init(void)
+int __init icp_hv_init(void)
 {
 	struct device_node *np;
 
diff --git a/arch/powerpc/sysdev/xics/icp-opal.c b/arch/powerpc/sysdev/xics/icp-opal.c
index 675d708863d5..bda4c32582d9 100644
--- a/arch/powerpc/sysdev/xics/icp-opal.c
+++ b/arch/powerpc/sysdev/xics/icp-opal.c
@@ -184,7 +184,7 @@ static const struct icp_ops icp_opal_ops = {
 #endif
 };
 
-int icp_opal_init(void)
+int __init icp_opal_init(void)
 {
 	struct device_node *np;
 
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index 244a727c6ba4..f3fb2a12124c 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -121,7 +121,7 @@ void xics_mask_unknown_vec(unsigned int vec)
 
 #ifdef CONFIG_SMP
 
-static void xics_request_ipi(void)
+static void __init xics_request_ipi(void)
 {
 	unsigned int ipi;
 
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index d4243dab230e..f940428ad13f 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -492,7 +492,7 @@ static const struct xive_ops xive_native_ops = {
 	.name			= "native",
 };
 
-static bool xive_parse_provisioning(struct device_node *np)
+static bool __init xive_parse_provisioning(struct device_node *np)
 {
 	int rc;
 
@@ -532,7 +532,7 @@ static bool xive_parse_provisioning(struct device_node *np)
 	return true;
 }
 
-static void xive_native_setup_pools(void)
+static void __init xive_native_setup_pools(void)
 {
 	/* Allocate a pool big enough */
 	pr_debug("XIVE: Allocating VP block for pool size %u\n", nr_cpu_ids);
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 77943dc70860..dfc4634335cc 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -44,7 +44,7 @@ struct xive_irq_bitmap {
 
 static LIST_HEAD(xive_irq_bitmaps);
 
-static int xive_irq_bitmap_add(int base, int count)
+static int __init xive_irq_bitmap_add(int base, int count)
 {
 	struct xive_irq_bitmap *xibm;
 
@@ -687,7 +687,7 @@ static const struct xive_ops xive_spapr_ops = {
 /*
  * get max priority from "/ibm,plat-res-int-priorities"
  */
-static bool xive_get_max_prio(u8 *max_prio)
+static bool __init xive_get_max_prio(u8 *max_prio)
 {
 	struct device_node *rootdn;
 	const __be32 *reg;
@@ -741,7 +741,7 @@ static bool xive_get_max_prio(u8 *max_prio)
 	return true;
 }
 
-static const u8 *get_vec5_feature(unsigned int index)
+static const u8 *__init get_vec5_feature(unsigned int index)
 {
 	unsigned long root, chosen;
 	int size;
-- 
2.25.1

