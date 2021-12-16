Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B869D477FEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:12:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFRF24skfz3ccV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:12:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hLHVEP9N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hLHVEP9N; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzl1Kbkz3cPj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:07 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id l25so354270qkl.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UL3rbTGNgaqOHRdtvSl83+sagfVK6u06jI9rHmmPWNA=;
 b=hLHVEP9NXMdIdQzZdpE7a2odpIdSv5NQG+a2NPLs9S6l7wCElEYiCEImVaLHvJNRkE
 KF2s1pgF0dZp4SVmuNj+i1DVnuyplSOmsU6Lps1p8ytynW05XK+80HsiVSxs/7y7VgIs
 dEDp1TZBaG4sl0Qm3KADmEM1aQkoV2VJaiDPkvVGvsHUjAGGxpm/Mr2CeKBxY0YIUv8l
 YgFDnNXuroOLP88A79AInOQuBEKhZzn70IjWxiGvwxGvLmliQiaCTWhv5fpInNKiU54R
 YhFemTNUo/Dnmq1aCFxYJg/p2oJVRKXZTT43FHEnbWeDlOncKiYFZmE2iPfxs7ZUgp5X
 A4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UL3rbTGNgaqOHRdtvSl83+sagfVK6u06jI9rHmmPWNA=;
 b=HSr+EAWO11GXdPNUsqyHHOpe8/qMFFJq1w1EXmC0y5G09xkUUBxznLaAaPyXtUPQFU
 ewkAb7Hhl2ARMKQDqnvAGnLMabC138u77h9XDsf/9U2hnqPv8v3bCWoAFx+v4h+Uuauu
 21eje9qhY+jBphsh42OauriG0mlisU7lZAddnkp99Yz0ogeB0BLMsZ3RBamQPww0IpsH
 d9T9oCD1vnXhO3KF226fI1PROdsDQjrOU5Eptqq9BooUDB+sDa4iSeI0Na/3c5N0e27M
 ru1wqaL6w6gTJ4dNqSIQuYkGMnVzgZrIazMNyDtTyfuy4hSr/TvgnNgUu51OcQrSwARF
 jgVg==
X-Gm-Message-State: AOAM532hnF/OhtWAzotMByzhtoG449z4Zr3RajdIUYRiSKSmB9gRJIOL
 xyBu3wvP9lAEe7yD1cJH8ozAIA47JOQ=
X-Google-Smtp-Source: ABdhPJx0aju2l5hgfeav8Cspk44Q2hwvbpnqmDjAUCZkzRKrr5aUOJSZljXGP2W1VcHFHVjm/11xeQ==
X-Received: by 2002:a05:620a:306:: with SMTP id s6mr69085qkm.368.1639692064419; 
 Thu, 16 Dec 2021 14:01:04 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:01:03 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 17/20] powerpc/83xx: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:32 -0500
Message-Id: <20211216220035.605465-18-nick.child@ibm.com>
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
index a30d30588cf6..aea803ba3a15 100644
--- a/arch/powerpc/platforms/83xx/mpc83xx.h
+++ b/arch/powerpc/platforms/83xx/mpc83xx.h
@@ -68,9 +68,9 @@
 
 extern void __noreturn mpc83xx_restart(char *cmd);
 extern long mpc83xx_time_init(void);
-extern int mpc837x_usb_cfg(void);
-extern int mpc834x_usb_cfg(void);
-extern int mpc831x_usb_cfg(void);
+int __init mpc837x_usb_cfg(void);
+int __init mpc834x_usb_cfg(void);
+int __init mpc831x_usb_cfg(void);
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

