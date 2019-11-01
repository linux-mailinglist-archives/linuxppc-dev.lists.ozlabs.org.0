Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3FEC3D0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 14:38:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474NYW3DR3zF4rm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 00:38:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="J/JRfV9H"; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474MKR0Dm3zF4p3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:42:35 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id f5so7150110lfp.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc+8R+PtxSGR+WKCXh82E6vFl/rmsOl6moV7TXDxFX4=;
 b=J/JRfV9HzoZlnhX1POjx2/SwNqsyMWkbfshx0nK22l45yXboNh1oT/kQneIEMji9Mr
 Xkyj+zQPd5Xgyit2kxA5vg3ijz9KftVH6bMKlKuecsBcLextkIZKQP3ZT9NBN0HW1CY4
 YJkUX9TbX91A9agwyObsFA9NolReMzGJ8+R6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc+8R+PtxSGR+WKCXh82E6vFl/rmsOl6moV7TXDxFX4=;
 b=l/rICLBwCtSbSivFBqmf7lnQuKRA+aYFl/uooc4Ovaqr1/3MzAiYO7HhNF++GF3ZtG
 6e9J/KgpnmmY0BzTZP/5leQlALIYoLCY2WO3E1Lc89sgkaq1sm/wMvP4V0IzA10PrA4M
 noQru/vtRGL0+V5ptdjgA9b/KjpTIm4t+WdkztvW7rNtJo7pHISQfCyYz76C97tKHmYR
 fTZxO7ZZuw6oBp9ubJv+/Nhl0uOsS+DnNEA6k6AEbBQUbsyaqHBapfSlEH7yKAJijcoM
 cnR2/a1C/x1+3J5ol3rcab4DPdYtV/F6sKFUo8f/rD64R63ZKcocLHys5GShi7/KXs7D
 qaWg==
X-Gm-Message-State: APjAAAWsp7nCZ/96xUYuoIFzMj3zfX0kuKhwese8S6TYvDtw9tkWmEfi
 HlDtPaaDOd/vsUNcK6VKsS+xjg==
X-Google-Smtp-Source: APXvYqzfQuxTX/Fb5EIzlc6k9DmbqG8hwoRnFGTMWBOyy5m45lD4WphCpHPM/D4sNCslSun9WnD07Q==
X-Received: by 2002:a19:4bd8:: with SMTP id y207mr6713994lfa.125.1572612152074; 
 Fri, 01 Nov 2019 05:42:32 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:31 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 13/36] powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
Date: Fri,  1 Nov 2019 13:41:47 +0100
Message-Id: <20191101124210.14510-14-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101124210.14510-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is now exactly the same as mpc83xx_ipic_init_IRQ, so just use
that directly.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/powerpc/platforms/83xx/km83xx.c      | 2 +-
 arch/powerpc/platforms/83xx/misc.c        | 7 -------
 arch/powerpc/platforms/83xx/mpc832x_mds.c | 2 +-
 arch/powerpc/platforms/83xx/mpc832x_rdb.c | 2 +-
 arch/powerpc/platforms/83xx/mpc836x_mds.c | 2 +-
 arch/powerpc/platforms/83xx/mpc836x_rdk.c | 2 +-
 arch/powerpc/platforms/83xx/mpc83xx.h     | 5 -----
 7 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index 5c6227f7bc37..3d89569e9e71 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -177,7 +177,7 @@ define_machine(mpc83xx_km) {
 	.name		= "mpc83xx-km-platform",
 	.probe		= mpc83xx_km_probe,
 	.setup_arch	= mpc83xx_km_setup_arch,
-	.init_IRQ	= mpc83xx_ipic_and_qe_init_IRQ,
+	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
 	.time_init	= mpc83xx_time_init,
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 6935a5b9fbd1..1d8306eb2958 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -88,13 +88,6 @@ void __init mpc83xx_ipic_init_IRQ(void)
 	ipic_set_default_priority();
 }
 
-#ifdef CONFIG_QUICC_ENGINE
-void __init mpc83xx_ipic_and_qe_init_IRQ(void)
-{
-	mpc83xx_ipic_init_IRQ();
-}
-#endif /* CONFIG_QUICC_ENGINE */
-
 static const struct of_device_id of_bus_ids[] __initconst = {
 	{ .type = "soc", },
 	{ .compatible = "soc", },
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
index 1c73af104d19..6fa5402ebf20 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
@@ -101,7 +101,7 @@ define_machine(mpc832x_mds) {
 	.name 		= "MPC832x MDS",
 	.probe 		= mpc832x_sys_probe,
 	.setup_arch 	= mpc832x_sys_setup_arch,
-	.init_IRQ	= mpc83xx_ipic_and_qe_init_IRQ,
+	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq 	= ipic_get_irq,
 	.restart 	= mpc83xx_restart,
 	.time_init 	= mpc83xx_time_init,
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index 87f68ca06255..622c625d5ce4 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -219,7 +219,7 @@ define_machine(mpc832x_rdb) {
 	.name		= "MPC832x RDB",
 	.probe		= mpc832x_rdb_probe,
 	.setup_arch	= mpc832x_rdb_setup_arch,
-	.init_IRQ	= mpc83xx_ipic_and_qe_init_IRQ,
+	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
 	.time_init	= mpc83xx_time_init,
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index 5b484da9533e..219a83ab6c00 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -208,7 +208,7 @@ define_machine(mpc836x_mds) {
 	.name		= "MPC836x MDS",
 	.probe		= mpc836x_mds_probe,
 	.setup_arch	= mpc836x_mds_setup_arch,
-	.init_IRQ	= mpc83xx_ipic_and_qe_init_IRQ,
+	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
 	.time_init	= mpc83xx_time_init,
diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
index b7119e443920..b4aac2cde849 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
@@ -41,7 +41,7 @@ define_machine(mpc836x_rdk) {
 	.name		= "MPC836x RDK",
 	.probe		= mpc836x_rdk_probe,
 	.setup_arch	= mpc836x_rdk_setup_arch,
-	.init_IRQ	= mpc83xx_ipic_and_qe_init_IRQ,
+	.init_IRQ	= mpc83xx_ipic_init_IRQ,
 	.get_irq	= ipic_get_irq,
 	.restart	= mpc83xx_restart,
 	.time_init	= mpc83xx_time_init,
diff --git a/arch/powerpc/platforms/83xx/mpc83xx.h b/arch/powerpc/platforms/83xx/mpc83xx.h
index d343f6ce2599..f37d04332fc7 100644
--- a/arch/powerpc/platforms/83xx/mpc83xx.h
+++ b/arch/powerpc/platforms/83xx/mpc83xx.h
@@ -72,11 +72,6 @@ extern int mpc837x_usb_cfg(void);
 extern int mpc834x_usb_cfg(void);
 extern int mpc831x_usb_cfg(void);
 extern void mpc83xx_ipic_init_IRQ(void);
-#ifdef CONFIG_QUICC_ENGINE
-extern void mpc83xx_ipic_and_qe_init_IRQ(void);
-#else
-#define mpc83xx_ipic_and_qe_init_IRQ mpc83xx_ipic_init_IRQ
-#endif /* CONFIG_QUICC_ENGINE */
 
 #ifdef CONFIG_PCI
 extern void mpc83xx_setup_pci(void);
-- 
2.23.0

