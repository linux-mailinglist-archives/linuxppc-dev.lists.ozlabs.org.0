Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E910CC05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 16:46:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P26z2hjKzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 02:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="hCpJ2v2Y"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12Z1PRJzDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:26 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id e28so4647118ljo.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X1McMgePs5XZ43b3xIAKG7jsREgSGKyorX4ghDJk1G8=;
 b=hCpJ2v2YyOOBO9pgH5YOEAe8lPbxdadcOeEKkm7sCfoVhUrGcTz+BIWdenf7xz7P/D
 FMAqBp/fiAqBkdHHtTGVCxZkb8H8Hc1jEqDMBWUoTzTpaiyGSv7gPUelaCe/YNZ4skFS
 RoTx7UJpRNfHpWWwKjyDDWQq+a0nQOjmAhcXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1McMgePs5XZ43b3xIAKG7jsREgSGKyorX4ghDJk1G8=;
 b=p+OBDnWejoA6t7G4UUodWxlhZxdHtej/zqU8AX2w9hPGIm0zKO0pTfINx9u3Utpuo2
 QZeB/6V9g0UIW97wS9yes2+h8EMZcum9GT2GEVTQY8Qo3oRHcVBGKZV0WQcg+wH0cIAF
 sIQMPrxsgcG+4kgPAB/kM7akEQntEFn/+Y4Det9QCo5yA1+DOMMA2B8d2Eiq6oJ/gh85
 ih3bhDMegUm48CTQ6ykLG2Ej0rvEY2lU5w9HJlBACRggJ9kqSazN0c4pwdtGORnplvWd
 vVbbzsswDC4fPCIrif/hfmtB0/CF7gGsShXe/m8G+1ug4pBDtX/2Po1baJHuFT2lgAM1
 9O5w==
X-Gm-Message-State: APjAAAXvBGD1YyImRjtKdIA1tVrOboC0tKZcE7iOlKe5oXkNfRUsKkA5
 jLKIg0guJiuYjeuI2mIEQHuJEg==
X-Google-Smtp-Source: APXvYqynPqB+xuoOwibTWgFWD/KfhSAnUBWJm1NzmBS1NM1FemDd0gPCCN8gLjQQLwtnz2Uu96ovGQ==
X-Received: by 2002:a2e:8ed1:: with SMTP id e17mr10841647ljl.52.1574953042219; 
 Thu, 28 Nov 2019 06:57:22 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:21 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 13/49] powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
Date: Thu, 28 Nov 2019 15:55:18 +0100
Message-Id: <20191128145554.1297-14-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is now exactly the same as mpc83xx_ipic_init_IRQ, so just use
that directly.

Acked-by: Scott Wood <oss@buserror.net>
Reviewed-by: Timur Tabi <timur@kernel.org>
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

