Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AACF4D90
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 14:54:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478hbf1YVWzF77h
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 00:54:54 +1100 (AEDT)
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
 header.b="DHGXNL3F"; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQN4ZqBzF6t8
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:01:48 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id v4so4390344lfd.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc+8R+PtxSGR+WKCXh82E6vFl/rmsOl6moV7TXDxFX4=;
 b=DHGXNL3FwDnFN1h0TodDE2uyaNOuN9R8G3PKs/v6XWU5PQWHGA1bkRdiYmr8ZHmt7j
 ypFz6rqutfze2tlaMFen1OEki3V4FVAfqY1YzaLd+eDPrm/UufAhhuyH7fKEVpd5p1Ua
 dbn/6Y63qUxYYDUJMfVTTaxWCNBJ6gQwjghJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc+8R+PtxSGR+WKCXh82E6vFl/rmsOl6moV7TXDxFX4=;
 b=tWLsC3tn3Tjj+HzmKeqLltB2fTKBrFOr4FDxVrsbRknNOMIzBtOD4bvxxdWfVgwk5J
 ka5cyFu+XnnkWvQJzQ+UmRC2/RNvYLd9weaQHKcbqhjQsEcgIupQUwPD5jWUgDZ2Ikpm
 OwqrnC9QEI+8A2hFezUEbK/tUQ1xZyGlcePJdFwmaL1JtpS7jyOZqUlzkIXhQr51H5iF
 wWhMC4cXwFNE98wYLBlAWUpmh5CGTFv/b0z6FEZb9RAEa4J0QOIjezqKTcyIIaAtcBSa
 YnV+bytN2JjQo34TQOmsoH9bXhS7eC8ESxgn6PZD2HUTvzchRONuRQ0//U5LetxapMQB
 kiXw==
X-Gm-Message-State: APjAAAXJNWv9Hhv0pkhnNVJU9+p9puz5YT0q08Go05aK15jBVAYZapH7
 AXyKbaiX2UeFuzXAQsbQODsHmQ==
X-Google-Smtp-Source: APXvYqwbDJNvRFgoz1Gh1V6nLMxZw08ojqlEbbksBCfcH0Aoo0v0AKrmQdBMsXhZdZeoPocQbV8PdA==
X-Received: by 2002:a19:8c1c:: with SMTP id o28mr6599461lfd.105.1573218105404; 
 Fri, 08 Nov 2019 05:01:45 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:01:44 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 13/47] powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
Date: Fri,  8 Nov 2019 14:00:49 +0100
Message-Id: <20191108130123.6839-14-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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

