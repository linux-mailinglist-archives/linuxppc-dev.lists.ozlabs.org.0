Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47332477FEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:11:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFRD91ZRTz3dfp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:11:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U5Q12lUp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U5Q12lUp; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzk4bPnz3cDN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:06 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id m186so358390qkb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ko/YXSAgMkjWSF58OrDhOsXjJsHT4sLzOxvTVXgbgmQ=;
 b=U5Q12lUpvI6vwivqYZJY+EkbEoZ2P3wIzfm3zkBpo3gGF5NSPN5wohsjmUFEypWnrK
 gnunQIen2l/lp8NQ+IZd8VPf1m286wVS8EvY+S/uTTd/ssAZxFpwl3EJpFl3DX0yG+wa
 HQ7OjZUNpZDg6gjT8SbcwDL8kb/rLogxhaK/Fro3kxzNtSwMx6vkz/HpJ34jq81Id0Pa
 elOtDqaP8MLwgRAPRdRgBAgf/RxHAHtNN7zWkll/rb67D/TsHr+PPVR7pt3CtPACFPoM
 UX01Et8rZJVM6IB9K/oSLnFBUV1nxu8/DfqBrFVUuUeowtM+//EfTbpYcjD617dSEZ3p
 FI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ko/YXSAgMkjWSF58OrDhOsXjJsHT4sLzOxvTVXgbgmQ=;
 b=JlMDnuUmSC4fjmh4eqdoYf8xyjSqjOqjsWopZ9oNIeXWJNgqdAJvZF5yzWb6MEXfvh
 PBQK4smwKDsdOi9/L8dftXShL/Sj09sVhg/Fv2Rrlpv374SLEQ0UHkX1/fXyeHX8pgWw
 FBOjnQMPo59xEbzRSP3SArZkz4hYyDaEgUEbetIpn3hRurb1OwVmImUsoAdF78VvOWBY
 gaXoaWs5K+gq2t0oMR4BhL4BpGOUcU96/90r5U3OQhwXjoMmxCndfA8O3RjSrNliLPBg
 8eNYPUW1OXZ2W2jJpjlZ8TA7Gmm+gZvHxHywsTDnZakl1G12heTZXUGidni+80FyYQjd
 HXZg==
X-Gm-Message-State: AOAM531C4GgGTWA3jf9iT/lLsa/++iWNxzWzoMiem54DRpULYODdI/6R
 PPuaLiC8R9LxjG/1I8PWGJW9osvrGVk=
X-Google-Smtp-Source: ABdhPJz0ouzUUoPyHzt3Cpc57uoNeXRwWptuRFtuM38pCIONVgW5N2Y/Drfqq9EE7RtJAvEw1nZC8A==
X-Received: by 2002:a05:620a:22c3:: with SMTP id
 o3mr56253qki.748.1639692063515; 
 Thu, 16 Dec 2021 14:01:03 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:01:02 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/20] powerpc/embedded6xx: Add __init attribute to
 eligible functions
Date: Thu, 16 Dec 2021 17:00:31 -0500
Message-Id: <20211216220035.605465-17-nick.child@ibm.com>
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

Some functions defined in 'arch/powerpc/platforms/embedded6xx' are
deserving of an `__init` macro attribute. These functions are only
called by other initialization functions and therefore should inherit
the attribute.
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
index f18eeeef0815..c2fa42e191dc 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.h
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.h
@@ -11,7 +11,7 @@
 #define __HLWD_PIC_H
 
 extern unsigned int hlwd_pic_get_irq(void);
-extern void hlwd_pic_probe(void);
+void __init hlwd_pic_probe(void);
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

