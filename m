Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A53E527692D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 08:45:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxlt514vgzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 16:45:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GU1oOdqW; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxlkB69shzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:38:42 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d9so1292413pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MaVnrEusxnMfC02Fiqn5WXhl5UJquPzZDgMRzT03D0=;
 b=GU1oOdqWwxmBIj5+GIbMLhFYCkpWBr4VgdMQjpT5yYV12R7LgAIhUqZYXDbEXfrRIq
 /W48iDWJ8LjDfy+DyJ4IpgOhNeE/C5EW0geyFFomsEw6Yu+rkHzSX0X2dR80v+BgOnbr
 iAnMv1L35uhlvdt8VNZwk8Rpvu66kIyym1lSYPre8PIt0vlLMDlzLiCkDSnIb58BGGzC
 VH7DNGeq4W0EU1jJl9db3YXEuztobiBoqizUZLq/0+8B+EO9hLFcOzFFMS3x2/PCcrC/
 48LHHeMJxMnPCIrs2VsfHuvf3ut1qhlKKEiQkNFzLykf39C5px8CFXtxk0KhKxhN9qay
 PAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MaVnrEusxnMfC02Fiqn5WXhl5UJquPzZDgMRzT03D0=;
 b=qZrWiBo6fvUfSSsk9EgE690XjSWs2xNm+Uz0jpFsUnPz9Z6U0rg1k84U/yIGJXMCMB
 2TcSPbGXlV7QRs3iM9lEh9oeMW72l9fSIneAGO0CluJCGGxG9D+Iyu9owIvP/N/xM4sC
 VRanQtaLZ0GEIwvucOhlOi2L1789zF1kKPa2RtqZNUfleFgwlkGnAsR5V2G24lDDELhO
 zAuqczIsgQd6jhJu306aLP8yaELToHsW/iKnmIVLKc2OFO/E5RdYVCif+idr7CYbSJKQ
 w5e8Ha3Uez4y+pDw/o5AP+ru/bD3fAnXSCcGJMX0bjHDVNzEhTIVDQsmruAX9oZFg4cW
 rZdA==
X-Gm-Message-State: AOAM532H+6p+cQH2tg7a89Lmr/sakhIfotlX2Cj3IJcnTs7HpRE5Kxu2
 X0+J2XLZBmhCgAicdC0V0ytfFcjX2tT1WQ==
X-Google-Smtp-Source: ABdhPJxgFNzoBuexPaDdjA2YdUJHRvqd84LITwCVtThi21YSTDrJjGZsds0XUpe6PuCeSfGUGuot7g==
X-Received: by 2002:a62:e404:0:b029:150:7d36:cd88 with SMTP id
 r4-20020a62e4040000b02901507d36cd88mr3159377pfh.24.1600929520955; 
 Wed, 23 Sep 2020 23:38:40 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:40 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 04/18] powerpc/512x: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:05 +1000
Message-Id: <20200924063819.262830-4-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924063819.262830-1-oohall@gmail.com>
References: <20200924063819.262830-1-oohall@gmail.com>
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

