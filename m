Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E04E4C88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 15:43:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47050X2BsjzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:43:08 +1100 (AEDT)
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
 header.b="NHr0eLge"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703dN6cfszDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:28 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id 139so2360028ljf.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ALLDdvAQ5LNMRJEx4JjrDqX3dC2+C2shaJm9tn1b0pg=;
 b=NHr0eLged/BjfzFCKmKtRtvK4h6aWm8JsDJKf3c/UVu1L4cPrJIfy66+sHdNqFD8ic
 0v5egLKNWUD6LAci4qOpdYKcK0XjXnsSfe7mnUvrUIrLj0ddHJZwVvt3v0GffuFq+vS3
 oqeqW6AFRA45hI9d9UgNSA9rcejw36HjifhTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ALLDdvAQ5LNMRJEx4JjrDqX3dC2+C2shaJm9tn1b0pg=;
 b=GlpC1vCLcc0aItwrqZq56IHISqv+e8xXIFI5kQoxeH7At75RoZc3FaEdFDCjAeWM7s
 3ECshUb3sLGxvkomUIw2r5+20qMkdfhaPGZ2czSntjPPAbEzh/9L73JLEpDOIBi8By9M
 q6AskKxBsYO+9zZ3WHMCa+YiY4mzu+rmUkXyhYSYpCn2rEp49EiUZrGL/SHJQu3LnKxs
 9+cJgyThbVkEx66eHUj+C6TCqG/fnZNWzFLX3tb7gYDeN0+oaf38pxop88tiG/zebhDZ
 X+nmcelbZR4l5wikoRMFIwFCZ3IgzfR+MLQKjSajDVExAVOyoYC3O5VPHzB2RxUPoBgC
 fkeg==
X-Gm-Message-State: APjAAAX4FJe03WtEzFhC8V7S22KoErfjy6nbNo/x1T7bVm9YcTqttJ8G
 Kz6aLn/AEXQh43EPGoU+GZPbhQ==
X-Google-Smtp-Source: APXvYqx/yohi5dWzGeRk2lnfHRK31K0rZAb0Ih65logPywg3kE1KKzlawAouFgOlE6NWJfkXV2eaCA==
X-Received: by 2002:a2e:29dd:: with SMTP id p90mr2416516ljp.26.1572007283541; 
 Fri, 25 Oct 2019 05:41:23 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:23 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 16/23] powerpc/85xx: remove mostly pointless
 mpc85xx_qe_init()
Date: Fri, 25 Oct 2019 14:40:51 +0200
Message-Id: <20191025124058.22580-17-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025124058.22580-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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
index 8c1bb3941642..27ac38f7e1a9 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -56,8 +56,6 @@ void __init corenet_gen_setup_arch(void)
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
index 4bc49e5ec0b6..fb05b4d5bf1e 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -237,7 +237,6 @@ static void __init mpc85xx_mds_qe_init(void)
 {
 	struct device_node *np;
 
-	mpc85xx_qe_init();
 	mpc85xx_qe_par_io_init();
 	mpc85xx_mds_reset_ucc_phys();
 
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index 14b5a61d49c1..80a80174768c 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -72,7 +72,6 @@ static void __init mpc85xx_rdb_setup_arch(void)
 	fsl_pci_assign_primary();
 
 #ifdef CONFIG_QUICC_ENGINE
-	mpc85xx_qe_init();
 	mpc85xx_qe_par_io_init();
 #if defined(CONFIG_UCC_GETH) || defined(CONFIG_SERIAL_QE)
 	if (machine_is(p1025_rdb)) {
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index b099f5607120..9abb1e9f73c4 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -57,7 +57,6 @@ static void __init twr_p1025_setup_arch(void)
 	fsl_pci_assign_primary();
 
 #ifdef CONFIG_QUICC_ENGINE
-	mpc85xx_qe_init();
 	mpc85xx_qe_par_io_init();
 
 #if IS_ENABLED(CONFIG_UCC_GETH) || IS_ENABLED(CONFIG_SERIAL_QE)
-- 
2.23.0

