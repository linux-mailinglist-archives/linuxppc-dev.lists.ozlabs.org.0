Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBC8276936
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 08:48:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxlxj2gsvzDr2m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 16:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JeNHKQEd; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxlkK4LPRzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:38:49 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id r19so1165183pls.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fE2xl1SfpG/JbbzqMFYfA0Ul38UprkCR9u030OCuybI=;
 b=JeNHKQEd7kuHB8jqtWKOYguOhfBbnG7iPVCeqkm/cT9tgxH7bA/CrLfwvh3abNsJiw
 uvLYhEtHEBBWrCsNHsk8fUm4oznR+BF6h/HnbIXTs388VsynP/h3aYUXR5j19TOqk5us
 1JYHh1OujTRwh/F6eOmABhJDQbwsbifLuOxWNvuU2rPS5SCB+aW5EmVLe1P0IlcxGr1b
 gXoTXByxBIS+ki2LWn9wf+Dos9IEkFPSMHkgIdNYecczDTGsIsn1PwYI8O83iWcOl9kr
 MSpF629/bJTYQX7fn9KX10ss7Wm6yfNDiQdmmD73z19eJk3K0R+FBCTTq7nSBwXMC5uT
 22VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fE2xl1SfpG/JbbzqMFYfA0Ul38UprkCR9u030OCuybI=;
 b=IiwT56ivTphnfDU+C3S9U/pCxEfEz64w7aGbA07RMVjAzs42MFo+HA1dmhWGvGlEwp
 3GIOSF79G6bWgO5vy3zHgyOCotyWbE7Q6dpLNmqDH1bxmDW+p6VjO37iiwaunlZTXb6o
 Eu0C8ilbtslZyW9Xa8IPbDPUhOdVbjaOPOPpKsAA+jtLzVQTtz9O+3P6tvWceHhXu96j
 UZd7fM5Mu2gSfpyd/bB6pGfM2xqaiNQBNxK/NF9HzoNXuq/dluBarLPZdurfMBBMQ6v0
 nr3BJUhZ/9gHZT73dvHUoXAm0f1cTCPk18nkwyPRvnOqGEV78373mYTkCMU3d6f5wwiW
 IEKQ==
X-Gm-Message-State: AOAM530SyofCZV1UMHLQwSd2jB2C1+o1pka1y3hGb6puThpA2dpnDxqy
 FfWCwXTRSJRVEvQ2vLk93oPGR8ZIogqNVA==
X-Google-Smtp-Source: ABdhPJzYT1usXG1AmRVm60SeQd8D/Ndw1kiQ+ucGVqjEhPXwjcFsWBX2QikHDTRzCePnV/HoDXMf1Q==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr2793500pjb.117.1600929525155; 
 Wed, 23 Sep 2020 23:38:45 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:44 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 06/18] powerpc/52xx/lite5200: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:07 +1000
Message-Id: <20200924063819.262830-6-oohall@gmail.com>
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
compile tested with 52xx/lite5200b_defconfig
---
 arch/powerpc/platforms/52xx/lite5200.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/lite5200.c b/arch/powerpc/platforms/52xx/lite5200.c
index 3181aac08225..04cc97397095 100644
--- a/arch/powerpc/platforms/52xx/lite5200.c
+++ b/arch/powerpc/platforms/52xx/lite5200.c
@@ -165,8 +165,6 @@ static void __init lite5200_setup_arch(void)
 	mpc52xx_suspend.board_resume_finish = lite5200_resume_finish;
 	lite5200_pm_init();
 #endif
-
-	mpc52xx_setup_pci();
 }
 
 static const char * const board[] __initconst = {
@@ -187,6 +185,7 @@ define_machine(lite5200) {
 	.name 		= "lite5200",
 	.probe 		= lite5200_probe,
 	.setup_arch 	= lite5200_setup_arch,
+	.discover_phbs	= mpc52xx_setup_pci,
 	.init		= mpc52xx_declare_of_platform_devices,
 	.init_IRQ 	= mpc52xx_init_irq,
 	.get_irq 	= mpc52xx_get_irq,
-- 
2.26.2

