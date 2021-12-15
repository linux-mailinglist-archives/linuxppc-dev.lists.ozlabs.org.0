Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2526476BCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:21:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4nt5xDYz2ywB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:21:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XaHNh1uN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XaHNh1uN; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgKH1CGJz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:39 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id f20so22311680qtb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKaJuA1cM4q/T+KF3uomBOCNdNfn9vMexnsrA3f7s0o=;
 b=XaHNh1uN6pBqV+/p010/S30QyMxIWE/GFEVF9oiVkPWiQerLHE4uO8oA3QCV5cSjKb
 odSQ5UC+WE2lo8Ci4UjSjcV18ZC93dbTdjTunLQ2GZ+/0mdPP33WTXmvPKPBgcvQuPaw
 At6P7uDkJOdEV19nd8nRZ4oFbHh5qmUXIx8e35396nyJ7cZKX5RGqV8wkImH5i2zRLvU
 9pwewGKkDXd4how1Md8NS4/3UFQQygVEwn9dOoYBrkOqqpfdDB28YpzycpsBo3oa77ry
 cZ4FO1yMexaH3OLZUlu6HUHVjaTSobqdEW5DwWkn+65FMRoTw9UO2vie+Xq7j14xLdrW
 DaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKaJuA1cM4q/T+KF3uomBOCNdNfn9vMexnsrA3f7s0o=;
 b=LchV5vTkRoFWQN+v7VzrnEm2yZIvPnJ7F8lwUYVCreCD1kSm/suhAwb5iVz+L4Dd5x
 KINPKHWBRwJv5nCGqGuyV3B7tBdSigxooV102i6d3t7Ot8JUsGm/MbDF9E8eUxiLNxW3
 Gq7OMrJvb9ENHN+EhC9RAyuXLihanPOHohqUJtPp1rZ29YQzw6tC3swcgA1AzPicIi6/
 Ac3AWkVDwSmATJyi3EIv0FdAe5gkeXRGy5LQe/SYSJWi8wrmTyB2IHwQzsBm673B8YeI
 raA69rHY+/uLncY/p2L+1z78xfp1u6d625rJxPQ8S4WvmLmOzyQDFB0k0nrgl7kq92Ui
 a24g==
X-Gm-Message-State: AOAM531sMsinivaBaviStYUHzScVI1awqUfkH/wEnPQZYEPdOxCUhs3A
 LkWlu+K1JWdvF7/Awa15LbG3MbCZ5W8=
X-Google-Smtp-Source: ABdhPJxxXC5J1NFRemFL82rNH53aTmKccJxYnZPED/t1F/7hjq+IO+rYh4MYwN4xrIvvb6xYu5LrdQ==
X-Received: by 2002:a05:622a:1444:: with SMTP id
 v4mr12414781qtx.343.1639584816529; 
 Wed, 15 Dec 2021 08:13:36 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:35 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/20] powerpc/83xx: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:40 -0500
Message-Id: <20211215161243.16396-18-nick.child@ibm.com>
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

Some functions defined in 'arch/powerpc/platforms/83xx' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/83xx/km83xx.c      | 2 +-
 arch/powerpc/platforms/83xx/mpc834x_mds.c | 2 +-
 arch/powerpc/platforms/83xx/mpc837x_mds.c | 2 +-
 arch/powerpc/platforms/83xx/mpc837x_rdb.c | 2 +-
 arch/powerpc/platforms/83xx/mpc83xx.h     | 6 +++---
 arch/powerpc/platforms/83xx/usb.c         | 6 +++---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index 108e1e4d2683..d9eed0decb28 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -39,7 +39,7 @@
 
 #define SVR_REV(svr)    (((svr) >>  0) & 0xFFFF) /* Revision field */
 
-static void quirk_mpc8360e_qe_enet10(void)
+static void __init quirk_mpc8360e_qe_enet10(void)
 {
 	/*
 	 * handle mpc8360E Erratum QE_ENET10:
diff --git a/arch/powerpc/platforms/83xx/mpc834x_mds.c b/arch/powerpc/platforms/83xx/mpc834x_mds.c
index 6d91bdce0a18..0713deffb40c 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_mds.c
@@ -35,7 +35,7 @@
 #include "mpc83xx.h"
 
 #define BCSR5_INT_USB		0x02
-static int mpc834xemds_usb_cfg(void)
+static int __init mpc834xemds_usb_cfg(void)
 {
 	struct device_node *np;
 	void __iomem *bcsr_regs = NULL;
diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
index f28d166ea7db..fc88ab97f6e3 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_mds.c
@@ -23,7 +23,7 @@
 #define BCSR12_USB_SER_PIN	0x80
 #define BCSR12_USB_SER_DEVICE	0x02
 
-static int mpc837xmds_usb_cfg(void)
+static int __init mpc837xmds_usb_cfg(void)
 {
 	struct device_node *np;
 	const void *phy_type, *mode;
diff --git a/arch/powerpc/platforms/83xx/mpc837x_rdb.c b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
index 7fb7684c256b..5d48c6842098 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
@@ -18,7 +18,7 @@
 
 #include "mpc83xx.h"
 
-static void mpc837x_rdb_sd_cfg(void)
+static void __init mpc837x_rdb_sd_cfg(void)
 {
 	void __iomem *im;
 
diff --git a/arch/powerpc/platforms/83xx/mpc83xx.h b/arch/powerpc/platforms/83xx/mpc83xx.h
index a30d30588cf6..06ca2687b974 100644
--- a/arch/powerpc/platforms/83xx/mpc83xx.h
+++ b/arch/powerpc/platforms/83xx/mpc83xx.h
@@ -68,9 +68,9 @@
 
 extern void __noreturn mpc83xx_restart(char *cmd);
 extern long mpc83xx_time_init(void);
-extern int mpc837x_usb_cfg(void);
-extern int mpc834x_usb_cfg(void);
-extern int mpc831x_usb_cfg(void);
+extern int mpc837x_usb_cfg(void) __init;
+extern int mpc834x_usb_cfg(void) __init;
+extern int mpc831x_usb_cfg(void) __init;
 extern void mpc83xx_ipic_init_IRQ(void);
 
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/83xx/usb.c b/arch/powerpc/platforms/83xx/usb.c
index 3d247d726ed5..b0bda20aaccf 100644
--- a/arch/powerpc/platforms/83xx/usb.c
+++ b/arch/powerpc/platforms/83xx/usb.c
@@ -20,7 +20,7 @@
 
 
 #ifdef CONFIG_PPC_MPC834x
-int mpc834x_usb_cfg(void)
+int __init mpc834x_usb_cfg(void)
 {
 	unsigned long sccr, sicrl, sicrh;
 	void __iomem *immap;
@@ -96,7 +96,7 @@ int mpc834x_usb_cfg(void)
 #endif /* CONFIG_PPC_MPC834x */
 
 #ifdef CONFIG_PPC_MPC831x
-int mpc831x_usb_cfg(void)
+int __init mpc831x_usb_cfg(void)
 {
 	u32 temp;
 	void __iomem *immap, *usb_regs;
@@ -209,7 +209,7 @@ int mpc831x_usb_cfg(void)
 #endif /* CONFIG_PPC_MPC831x */
 
 #ifdef CONFIG_PPC_MPC837x
-int mpc837x_usb_cfg(void)
+int __init mpc837x_usb_cfg(void)
 {
 	void __iomem *immap;
 	struct device_node *np = NULL;
-- 
2.25.1

