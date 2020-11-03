Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B653D2A3BA7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:06:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHnV5t6dzDqD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:06:38 +1100 (AEDT)
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
 header.s=20161025 header.b=Pxhx4Znf; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH6M11kJzDqSf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:36:11 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id z24so12706954pgk.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSskaiTZtrQLAA4HeLAU5RtvuPrJ/Mg3BppavGPHrS8=;
 b=Pxhx4ZnfpF4MJuvqQF051fx4rDfn+QEzaaeA7Ewl1kv7l9nnnyGhC3Vm1wSpD54BMO
 V043ussyAIpLszJkycoZBINhWQ/s2womdNwkPUPX6hRWwW6ByD2kkGBf2+YR6qXgjLc9
 PFCuNYDnA7VM5FMty7QX2qoa3t2DUwFBY3UqA9Yt4ONyS4qiaEDedOqUkxFF8cc5jVbJ
 HxiI/TvxpCD6+g2T8QcdduAuhSwWI60eadW2r14pT+YS0KpUNl8befwAlicAHvSC8wPB
 ObqkJn6tMdDqOszY/8q6be7aRoIKG3lU/QENdNH0KwHmRGgnmJM2zE5FF4ImFTSZIBOC
 riTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MSskaiTZtrQLAA4HeLAU5RtvuPrJ/Mg3BppavGPHrS8=;
 b=FBsBZOW/YllwaQ8ekxGAeMg6yXolQRJa3V4LI09FGzU0dWSBHrZu0x9aPC3auLMTE6
 KXT9r6HpNV9HLd0MXQBOnUy56bSm8coE5LF8HW8pZKE5eFhBHf2zZs7ZSgKw2flsx1Sg
 unWZqIAUmBU4E6lQsLQwUs8yH6boBdrqSJAAiRiq5ELRNQJdhXcP/4cVMZwZIXwwDaBN
 /zgvTYQb89dbwtFFU2h3i1o2eQhO5J6X9t7Xj5TecY1E6vEqyzuPmN0LfDDvbsgazjga
 Uc3hAI7K1kh0g1u+Ch82TqUSgPxIgmsWCGkQpG/nLKk1NrKPosEp7oU94mUe9jNMNBEo
 NYjQ==
X-Gm-Message-State: AOAM5318Z26df2CN+LfZ50Ct8SoflLBt1VzfLh/+fGTnjT1SMUJ720AA
 Uosy4uxKtHoCq6Yk/utHJqPnRceuEvg=
X-Google-Smtp-Source: ABdhPJwUFatMAbBMCEouaRLtlnDlmzHU32sFWew6dvMde08hrw+D609qSB7c+msMj0q5qkBBwumazA==
X-Received: by 2002:a63:6645:: with SMTP id a66mr16350577pgc.207.1604378168816; 
 Mon, 02 Nov 2020 20:36:08 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:36:08 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/18] powerpc/pasemi: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:22 +1100
Message-Id: <20201103043523.916109-17-oohall@gmail.com>
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
compile tested with pasemi_defconfig
---
 arch/powerpc/platforms/pasemi/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index b612474f8f8e..376797eb7894 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -144,8 +144,6 @@ static void __init pas_setup_arch(void)
 	/* Setup SMP callback */
 	smp_ops = &pas_smp_ops;
 #endif
-	/* Lookup PCI hosts */
-	pas_pci_init();
 
 	/* Remap SDC register for doing reset */
 	/* XXXOJN This should maybe come out of the device tree */
@@ -446,6 +444,7 @@ define_machine(pasemi) {
 	.name			= "PA Semi PWRficient",
 	.probe			= pas_probe,
 	.setup_arch		= pas_setup_arch,
+	.discover_phbs		= pas_pci_init,
 	.init_IRQ		= pas_init_IRQ,
 	.get_irq		= mpic_get_irq,
 	.restart		= pas_restart,
-- 
2.26.2

