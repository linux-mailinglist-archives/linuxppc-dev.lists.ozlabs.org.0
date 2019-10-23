Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9ECE1B85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 14:58:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yr5y3Nb2zDqRL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 23:58:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Km6cCa5D"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yr216kwHzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 23:55:03 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id v8so15407972lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pr5jyZMsP+3kod9VvT5jLLC58+kfpVegavN735X7V0c=;
 b=Km6cCa5DXSvlLJBbXZDQa2bQulIRzp+UWkLxrd1m2RqeRyw746rzQbdFLelv4UHwbI
 gR6YNEWJZoIOx46arMROI3WjGp2QxFBi5Ff2YobXl5QRNETwkvhPGM5Iuon7yjKQL/HI
 3uqIAvQLbLhA0TVRt7iuB/FgNfRhUrpPeVjAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pr5jyZMsP+3kod9VvT5jLLC58+kfpVegavN735X7V0c=;
 b=GSrHO9k2cH/F72JYiKYqdFCfXmVzNJe2UhTljdZG6vIqPbAxWYW9oLCPDUeCNiiC2W
 oJlu7jAC9aN/q00wcrq8vdOsQqP/M9ufo9nOpU2521J3eUz0hYfADQwUnADLIto4pPoa
 G6Pb/7BQqsCj3oDvqjsSNhLM+W3wPWidvRiXR06FfO2vQaHhFkpNE36ckHr4/XOGSHkp
 5/tfw81lVseRPLbNu7q6OrosKvZy7dU9xsu8f539hgZIIPMkaYg8kl0P5QWNFlPUPyXt
 x7c4JU4iI7esiCSREHBw15IGeiYFP9CpffvFUC2lfTz7yF7qdw4wJ0WnNEDReX79ACYw
 T2cg==
X-Gm-Message-State: APjAAAW32WXYovKk0kmp4NhjkPV2pJcG3LeKdx5CKNUcmAf2UTif5G5N
 eRwx7l5B1k5ZXFpQ6grTajpntQ==
X-Google-Smtp-Source: APXvYqxOE1Ycn6M7T18O3XerWNHcmUvLPbQzFSVn50aactdzR8X43nE3FfGKkdKxXX9ODULzKKE+4g==
X-Received: by 2002:a19:5201:: with SMTP id m1mr15152059lfb.56.1571835298454; 
 Wed, 23 Oct 2019 05:54:58 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id x17sm8672267lji.62.2019.10.23.05.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:54:57 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Scott Wood <oss@buserror.net>, Kumar Gala <galak@kernel.crashing.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/85xx: remove mostly pointless mpc85xx_qe_init()
Date: Wed, 23 Oct 2019 14:54:48 +0200
Message-Id: <20191023125448.383-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 302c059f2e7b (QE: use subsys_initcall to init qe),
mpc85xx_qe_init() has done nothing apart from possibly emitting a
pr_err(). As part of reducing the amount of QE-related code in
arch/powerpc/ (and eventually support QE on other architectures),
remove this low-hanging fruit.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/powerpc/platforms/85xx/common.c          | 23 -------------------
 arch/powerpc/platforms/85xx/corenet_generic.c |  2 --
 arch/powerpc/platforms/85xx/mpc85xx.h         |  2 --
 arch/powerpc/platforms/85xx/mpc85xx_mds.c     |  1 -
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  1 -
 arch/powerpc/platforms/85xx/twr_p102x.c       |  1 -
 6 files changed, 30 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/common.c b/arch/powerpc/platforms/85xx/common.c
index fe0606439b5a..a554b6d87cf7 100644
--- a/arch/powerpc/platforms/85xx/common.c
+++ b/arch/powerpc/platforms/85xx/common.c
@@ -86,29 +86,6 @@ void __init mpc85xx_cpm2_pic_init(void)
 #endif
 
 #ifdef CONFIG_QUICC_ENGINE
-void __init mpc85xx_qe_init(void)
-{
-	struct device_node *np;
-
-	np = of_find_compatible_node(NULL, NULL, "fsl,qe");
-	if (!np) {
-		np = of_find_node_by_name(NULL, "qe");
-		if (!np) {
-			pr_err("%s: Could not find Quicc Engine node\n",
-					__func__);
-			return;
-		}
-	}
-
-	if (!of_device_is_available(np)) {
-		of_node_put(np);
-		return;
-	}
-
-	of_node_put(np);
-
-}
-
 void __init mpc85xx_qe_par_io_init(void)
 {
 	struct device_node *np;
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 7ee2c6628f64..a328a741b457 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -66,8 +66,6 @@ void __init corenet_gen_setup_arch(void)
 	swiotlb_detect_4g();
 
 	pr_info("%s board\n", ppc_md.name);
-
-	mpc85xx_qe_init();
 }
 
 static const struct of_device_id of_device_ids[] = {
diff --git a/arch/powerpc/platforms/85xx/mpc85xx.h b/arch/powerpc/platforms/85xx/mpc85xx.h
index fa23f9b0592c..cb84c5c56c36 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx.h
+++ b/arch/powerpc/platforms/85xx/mpc85xx.h
@@ -10,10 +10,8 @@ static inline void __init mpc85xx_cpm2_pic_init(void) {}
 #endif /* CONFIG_CPM2 */
 
 #ifdef CONFIG_QUICC_ENGINE
-extern void mpc85xx_qe_init(void);
 extern void mpc85xx_qe_par_io_init(void);
 #else
-static inline void __init mpc85xx_qe_init(void) {}
 static inline void __init mpc85xx_qe_par_io_init(void) {}
 #endif
 
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 5ca254256c47..120633f99ea6 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -238,7 +238,6 @@ static void __init mpc85xx_mds_qe_init(void)
 {
 	struct device_node *np;
 
-	mpc85xx_qe_init();
 	mpc85xx_qe_par_io_init();
 	mpc85xx_mds_reset_ucc_phys();
 
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index d3c540ee558f..7f9a84f85766 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -89,7 +89,6 @@ static void __init mpc85xx_rdb_setup_arch(void)
 	fsl_pci_assign_primary();
 
 #ifdef CONFIG_QUICC_ENGINE
-	mpc85xx_qe_init();
 	mpc85xx_qe_par_io_init();
 #if defined(CONFIG_UCC_GETH) || defined(CONFIG_SERIAL_QE)
 	if (machine_is(p1025_rdb)) {
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index 720b0c0f03ba..6c3c0cdaee9a 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -72,7 +72,6 @@ static void __init twr_p1025_setup_arch(void)
 	fsl_pci_assign_primary();
 
 #ifdef CONFIG_QUICC_ENGINE
-	mpc85xx_qe_init();
 	mpc85xx_qe_par_io_init();
 
 #if IS_ENABLED(CONFIG_UCC_GETH) || IS_ENABLED(CONFIG_SERIAL_QE)
-- 
2.23.0

