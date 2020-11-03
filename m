Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D382A3B79
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:43:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHG94jrnzDqHg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:42:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YGdJhJse; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH5t0fvJzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:45 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 72so6407458pfv.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MaVnrEusxnMfC02Fiqn5WXhl5UJquPzZDgMRzT03D0=;
 b=YGdJhJseQAwJCRQaMTMbTcjXCau9Gv1CK4dC1WXH8Gu1w0N5macx+deQ8yGCgwLpMk
 1U9TOHXF2W8K6goslA7pQDRC0vZEd0Tn3opH9FT3esSNN/+A856Z5hOlzm/6oGq9qbFL
 ZfTgxXG6i3P5EbWm+6dnNlrDtY8rsJiMt2zBui4NakPuEGfR6F8u6P4iuWtxtB5izznD
 tq8R26xRPWQlW/xFwa3YBmof9aPpKNmuPd9o2DY7ep1RS38bGfvRoNb4fg5ujS22TXR1
 1yenFp4/Nx5AaRkNyT89QlV6LQwcvNd5vSsOWJgjpAYlDyMsEUk76KVzGyKDtdxuNiUv
 0PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MaVnrEusxnMfC02Fiqn5WXhl5UJquPzZDgMRzT03D0=;
 b=f8mRhfHHqQjpREwa31xUChTmU6PgiEx69WAo1pnD5pSOZ+FzdK918KGM1uDAJUO3YU
 WNROJzWUz4egmSFKhA8vZ/JWQ5ULAXKINJeo6UYuS858+1fBiAZJ1KuGuCEL4LlPLF53
 WTDsSry/XB6M8a7QCcC+mfa4JGsKMipesRk/bUcHypgcUYShRTnnECIlAH4t2VnsfmJ2
 hpBubuTgZICmOss2v+NycSFB3wGM8SGLQSOZHxP+D2EIW6tWXMJq2pl5nsk86ad54bnY
 jl2feFpyANSANaG1U3Va8sYez72wMoyytoTSjATcvCo8jDLV78hmLB95iryf3LqZq9Y1
 Z+/Q==
X-Gm-Message-State: AOAM531aUw/d/DhHQ1V7XowixF1+rUZRqjQ1aGajIqLd6a16M8U4Qz8J
 VzcmlLz/KN+jF3JVM3hAL5HL0fl/MYs=
X-Google-Smtp-Source: ABdhPJwf/35LH4JKNw/oFekOD/vCodHKiacjl5tCbejHWumVhnb1Y9m8/F0oUDwu/fuWfRKC+NU6jQ==
X-Received: by 2002:a65:6649:: with SMTP id z9mr11067182pgv.18.1604378142563; 
 Mon, 02 Nov 2020 20:35:42 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:42 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/18] powerpc/512x: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:09 +1100
Message-Id: <20201103043523.916109-4-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103043523.916109-1-oohall@gmail.com>
References: <20201103043523.916109-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
only compile tested
---
 arch/powerpc/platforms/512x/mpc5121_ads.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc5121_ads.c b/arch/powerpc/platforms/512x/mpc5121_ads.c
index 6303fbfc4e4f..9d030c2e0004 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads.c
@@ -24,21 +24,23 @@
 
 static void __init mpc5121_ads_setup_arch(void)
 {
-#ifdef CONFIG_PCI
-	struct device_node *np;
-#endif
 	printk(KERN_INFO "MPC5121 ADS board from Freescale Semiconductor\n");
 	/*
 	 * cpld regs are needed early
 	 */
 	mpc5121_ads_cpld_map();
 
+	mpc512x_setup_arch();
+}
+
+static void __init mpc5121_ads_setup_pci(void)
+{
 #ifdef CONFIG_PCI
+	struct device_node *np;
+
 	for_each_compatible_node(np, "pci", "fsl,mpc5121-pci")
 		mpc83xx_add_bridge(np);
 #endif
-
-	mpc512x_setup_arch();
 }
 
 static void __init mpc5121_ads_init_IRQ(void)
@@ -64,6 +66,7 @@ define_machine(mpc5121_ads) {
 	.name			= "MPC5121 ADS",
 	.probe			= mpc5121_ads_probe,
 	.setup_arch		= mpc5121_ads_setup_arch,
+	.discover_phbs		= mpc5121_ads_setup_pci,
 	.init			= mpc512x_init,
 	.init_IRQ		= mpc5121_ads_init_IRQ,
 	.get_irq		= ipic_get_irq,
-- 
2.26.2

