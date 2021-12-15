Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB7F476BC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:20:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4n75R8jz3fLQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:20:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QIWlRGcl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QIWlRGcl; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgKG1kGBz2x9K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:38 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id b67so20495894qkg.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MyhzcyOuBzBDfrZ/Lq7dbF2c795T4hiHVvsOP6FzlDc=;
 b=QIWlRGclIfsHWOhWC2mF0FuEAPKCbFG/K/oBKdVpFaWt+wCjQ+IHAzv+twwf9Oh0Qi
 G7gOpFZbAyHbEDKvmbiGEvhmZ/YP6pGjpc/N5Hnqs98Wrcv2TyijILgtCuiKoMyYhSEu
 scmNM8cHIwfhsAcTHFKj+qagkCyAnkPs1aZE+RvjLnE0P9wM99nPkmktfPg98MqHGbcV
 5xie3ntqNV+vyYin/odnObUjBqTIDuuxM29j2HaPmyocfIUsWYb8prVPjhJYfGFkYmTL
 LWJLMVLdf6+Ukwtj1ObpkYkVVPNWFTUsYqNJ8mK0PHIJkTsb/HcVh4V/V1Vl0ETGElCR
 MHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MyhzcyOuBzBDfrZ/Lq7dbF2c795T4hiHVvsOP6FzlDc=;
 b=p8v1C11EJFJnYlnBw9F8jvJYmVY9GhMWMZDfYTAREh/oZ7DOm8wK5csqnBOsxbH7NJ
 hnNkq3iSVZGQMU94UP+t4uv+XusU/qii/TtK00DxhyiNkumwkT7TLGIx8RcvkZE7PSwr
 pMo9ZuEXkiOwn3TCNupLhCPMa0xCKAVSGH9bpriFpSAGkEOlYPqOpusNAFKriA89uamw
 Z1IgrzsxAAFWxO3HleH1h2sZOgi+StS9LvZN2Op0xRSLxCHxJO4W3edKJawn/fiiiqF8
 DcidVdzV9eQnyDcHHdGb80tKFlOUQ8V07JbWRqf9w21I9qhXT9oxBZnIzgwXleKhPRJv
 BtKw==
X-Gm-Message-State: AOAM5302BE9mL0rKq9HOvMxYk+ww3FbBDUy/fll/a7pMqVyFYLEm6poC
 ktzYeSFnAjkhaGxXiJSZVKVKVzLmryM=
X-Google-Smtp-Source: ABdhPJyqCHkzVXBi4JhJjjS1XgCWYFZQoaLxJKSlKkFlhTUih332pdpxke87U2VkGIFPygfAwqPDmQ==
X-Received: by 2002:a05:620a:2451:: with SMTP id
 h17mr9104705qkn.587.1639584815327; 
 Wed, 15 Dec 2021 08:13:35 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:34 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/20] powerpc/embedded6xx: Add __init attribute to eligible
 functions
Date: Wed, 15 Dec 2021 11:12:39 -0500
Message-Id: <20211215161243.16396-17-nick.child@ibm.com>
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

Some functions defined in 'arch/powerpc/platforms/embedded6xx' are deserving
of an `__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c      | 4 ++--
 arch/powerpc/platforms/embedded6xx/hlwd-pic.h      | 2 +-
 arch/powerpc/platforms/embedded6xx/holly.c         | 2 +-
 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c | 4 ++--
 arch/powerpc/platforms/embedded6xx/wii.c           | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index a4b020e4b6af..380b4285cce4 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -153,7 +153,7 @@ static void __hlwd_quiesce(void __iomem *io_base)
 	out_be32(io_base + HW_BROADWAY_ICR, 0xffffffff);
 }
 
-static struct irq_domain *hlwd_pic_init(struct device_node *np)
+static struct irq_domain *__init hlwd_pic_init(struct device_node *np)
 {
 	struct irq_domain *irq_domain;
 	struct resource res;
@@ -197,7 +197,7 @@ unsigned int hlwd_pic_get_irq(void)
  *
  */
 
-void hlwd_pic_probe(void)
+void __init hlwd_pic_probe(void)
 {
 	struct irq_domain *host;
 	struct device_node *np;
diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.h b/arch/powerpc/platforms/embedded6xx/hlwd-pic.h
index f18eeeef0815..b1ff935c187e 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.h
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.h
@@ -11,7 +11,7 @@
 #define __HLWD_PIC_H
 
 extern unsigned int hlwd_pic_get_irq(void);
-extern void hlwd_pic_probe(void);
+extern void hlwd_pic_probe(void) __init;
 extern void hlwd_quiesce(void);
 
 #endif
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 7a85b117f7a4..07e71ba3e846 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -50,7 +50,7 @@ static int holly_exclude_device(struct pci_controller *hose, u_char bus,
 		return PCIBIOS_SUCCESSFUL;
 }
 
-static void holly_remap_bridge(void)
+static void __init holly_remap_bridge(void)
 {
 	u32 lut_val, lut_addr;
 	int i;
diff --git a/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c b/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
index ed45db70a781..5aea46566233 100644
--- a/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
+++ b/arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
@@ -194,7 +194,7 @@ static int ug_udbg_getc_poll(void)
 /*
  * Retrieves and prepares the virtual address needed to access the hardware.
  */
-static void __iomem *ug_udbg_setup_exi_io_base(struct device_node *np)
+static void __iomem *__init ug_udbg_setup_exi_io_base(struct device_node *np)
 {
 	void __iomem *exi_io_base = NULL;
 	phys_addr_t paddr;
@@ -212,7 +212,7 @@ static void __iomem *ug_udbg_setup_exi_io_base(struct device_node *np)
 /*
  * Checks if a USB Gecko adapter is inserted in any memory card slot.
  */
-static void __iomem *ug_udbg_probe(void __iomem *exi_io_base)
+static void __iomem *__init ug_udbg_probe(void __iomem *exi_io_base)
 {
 	int i;
 
diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index a802ef957d63..f60ade584bb2 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -69,7 +69,7 @@ static void __noreturn wii_spin(void)
 		cpu_relax();
 }
 
-static void __iomem *wii_ioremap_hw_regs(char *name, char *compatible)
+static void __iomem *__init wii_ioremap_hw_regs(char *name, char *compatible)
 {
 	void __iomem *hw_regs = NULL;
 	struct device_node *np;
-- 
2.25.1

