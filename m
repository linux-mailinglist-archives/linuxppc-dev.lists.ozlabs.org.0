Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 114102A3B8B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:52:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHSZ1rs2zDqTq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:51:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FUiXS/y6; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH640sYBzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:55 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id o3so12673187pgr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sW/UzNztx1LJZzb4Lv8dPnaVX4ry9sbuSemrP+m6GqM=;
 b=FUiXS/y6OeOqvOGpAtR/p1yQ+vgvyPb0KWnbCVBR6wLz+nBUCKrgbtn0ZfSOKbgPhL
 SD4DsJ96DMT6rXhar6WfbKlP9Rd7uWDvSaD9ZBq0ORhnytNORwde799bMF3kbTmlRfR3
 KTpdldaqVelYslgbfO3svYNiFt0JKGBGz8IlrcnHuN/XU8TjPywbarLe9SgyWK0SjatC
 Jv54xC+mKx7UqToaXWs5KDppycWh5Q+YAW6+T3kuxhL1EUw6M6lqsX2Me847PJcdIVi8
 jEFmOUo975n4nGlAeZglXje9P0UHnUe/8e76t9z8kLhmbAFaRysT1NNQSYtQLQAoLZhZ
 WClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sW/UzNztx1LJZzb4Lv8dPnaVX4ry9sbuSemrP+m6GqM=;
 b=MpCn23Cc1RoOzDXMIfzksmTOCRPzfk0MNOcmEcvxTQzvyM4s3BdsWsr2zZG8d1ujnB
 Uzqi+0qTnflPCTsh0M1Umr78+dpUyjNzpvgJIZJT8LRUkInJT2MS+mSqtlpvBJ/hoW3F
 u2sM0jk5/die2KyEdeeVCaxh+Vz/A9jZwfeg2qWEQ4VY50cyHXXccnCUI61a30L2hzSH
 ulHZ6Ol7TbgriTrsz+7N0kxDSwWqO4eaGyWcAggthUZtCD6b9KwMgAm4gQQ8YLEGjZOz
 rxNps1GgzxST3dVNaHJ7RwM7Z3YiQTaZ5CohLSMKKcv3fbOp/+Ga+Fmp2iG4ZqUCI3C5
 qoSg==
X-Gm-Message-State: AOAM531Z1Q4d6+FlE73oK40olKuHLxW4MebL7BhlFCUhyAPo+A1Ml8rF
 4XvTUk2jK3Au4u5Yl93PG89GwtFPNMs=
X-Google-Smtp-Source: ABdhPJwh/6YQ2U8ktr+WMWdm6zuaNgmfrI8cWIns140GG4pfFOOv1Mf3DjMLS34tJdtH4LeUN7K2JA==
X-Received: by 2002:aa7:950b:0:b029:18a:df47:ef90 with SMTP id
 b11-20020aa7950b0000b029018adf47ef90mr9717529pfp.74.1604378152485; 
 Mon, 02 Nov 2020 20:35:52 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:52 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/18] powerpc/82xx/*: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:14 +1100
Message-Id: <20201103043523.916109-9-oohall@gmail.com>
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
compile tested with pq2fads_defconfig
---
 arch/powerpc/platforms/82xx/mpc8272_ads.c | 2 +-
 arch/powerpc/platforms/82xx/pq2fads.c     | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/82xx/mpc8272_ads.c b/arch/powerpc/platforms/82xx/mpc8272_ads.c
index 3fe1a6593280..0b5b9dec16d5 100644
--- a/arch/powerpc/platforms/82xx/mpc8272_ads.c
+++ b/arch/powerpc/platforms/82xx/mpc8272_ads.c
@@ -171,7 +171,6 @@ static void __init mpc8272_ads_setup_arch(void)
 	iounmap(bcsr);
 
 	init_ioports();
-	pq2_init_pci();
 
 	if (ppc_md.progress)
 		ppc_md.progress("mpc8272_ads_setup_arch(), finish", 0);
@@ -205,6 +204,7 @@ define_machine(mpc8272_ads)
 	.name = "Freescale MPC8272 ADS",
 	.probe = mpc8272_ads_probe,
 	.setup_arch = mpc8272_ads_setup_arch,
+	.discover_phbs = pq2_init_pci,
 	.init_IRQ = mpc8272_ads_pic_init,
 	.get_irq = cpm2_get_irq,
 	.calibrate_decr = generic_calibrate_decr,
diff --git a/arch/powerpc/platforms/82xx/pq2fads.c b/arch/powerpc/platforms/82xx/pq2fads.c
index a74082140718..ac9113d524af 100644
--- a/arch/powerpc/platforms/82xx/pq2fads.c
+++ b/arch/powerpc/platforms/82xx/pq2fads.c
@@ -150,8 +150,6 @@ static void __init pq2fads_setup_arch(void)
 	/* Enable external IRQs */
 	clrbits32(&cpm2_immr->im_siu_conf.siu_82xx.sc_siumcr, 0x0c000000);
 
-	pq2_init_pci();
-
 	if (ppc_md.progress)
 		ppc_md.progress("pq2fads_setup_arch(), finish", 0);
 }
@@ -184,6 +182,7 @@ define_machine(pq2fads)
 	.name = "Freescale PQ2FADS",
 	.probe = pq2fads_probe,
 	.setup_arch = pq2fads_setup_arch,
+	.discover_phbs = pq2_init_pci,
 	.init_IRQ = pq2fads_pic_init,
 	.get_irq = cpm2_get_irq,
 	.calibrate_decr = generic_calibrate_decr,
-- 
2.26.2

