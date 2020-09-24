Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4652769F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:02:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmF75sdWzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:02:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qBFz4n8s; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxlkZ59lkzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:39:02 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id f2so1310366pgd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZPqzei1Fv+qLr1ovU3GS5sWwxVaLo335Z4KS7ZGWxs=;
 b=qBFz4n8soV3KT7AsHKyExwxxzw1uY+Xma4R+1bN92XZpatp1yNNLqNcJQXkT7uWvlF
 aQvQwJZYx9eCSB5brM0DnpzxRzWTndNmojJMDaEwYaZoy4TRDY7E3w3qXcELpikXPr5A
 dWf3BVHpwJ8NR1NFCCWuNJTw50jm2MzOCaLoHjPeH2kbjeduYHWd2HNVgQRfwXyFZRzH
 voZ9b8jnWcABHjov7Ln9vEdFERRgnX3R55ww51+mdZCJCD/+K688Ip76TTDEmv/c6jHd
 A4JbRE2WwFHyrQlOFmr1BqcGiUiI2hrHpxP2lY1vfeYukRDWX9rQxmQeq1bOErdb4OKZ
 Hw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZPqzei1Fv+qLr1ovU3GS5sWwxVaLo335Z4KS7ZGWxs=;
 b=B4cmFe0qt7t/8N/7ZvaTMkekireYtH+Ay5nKUdJL8foqz23wYtCwWysvBpzl6immnf
 cQxFnbdYa4YBpgQIL2M6v2afDDicJUjDE9aAqEqxP3giYAEq/Ga43IbVBEZoewBp9+kj
 26/AZbC2p0VpILCz5GtB+5bjsWqXZ7SuhyOuunrIPKiVWKXsNbviw9YNm27S4iAGXRoN
 K8VWqt3Kk8iNv1jUTZ+HYHC5I70+gQUxESpsibIqjknj+hk3AriyaYTmshnBrB73atPx
 TKwT6D2AprgIDz0QHyEa5+8xoM+9l7xHBcs1nq00TYdN+G+PPS6f8eZVssXZKtCaoquA
 V7kQ==
X-Gm-Message-State: AOAM530upVKV+jjgYDX9gMD3hf6bDV+GbhkEtka8g/XqVL6ZTS2FOWZa
 LMQdh0WQsQWOmK7vNslE3dsA3Ud6nCCk+A==
X-Google-Smtp-Source: ABdhPJwS0xHMYqkl1R0fj/1fRAPKMw6HuL/M0ngsZJsqhyprwo/9+vIdj2ZpAyA3nPE29aRebbVzZQ==
X-Received: by 2002:a65:45c5:: with SMTP id m5mr2872122pgr.252.1600929538784; 
 Wed, 23 Sep 2020 23:38:58 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:58 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 12/18] powerpc/chrp: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:13 +1000
Message-Id: <20200924063819.262830-12-oohall@gmail.com>
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
compile tested with chrp32_defconfig
---
 arch/powerpc/platforms/chrp/pci.c   |  8 ++++++++
 arch/powerpc/platforms/chrp/setup.c | 12 +-----------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index b2c2bf35b76c..8c421dc78b28 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -314,6 +314,14 @@ chrp_find_bridges(void)
 		}
 	}
 	of_node_put(root);
+
+	/*
+	 *  "Temporary" fixes for PCI devices.
+	 *  -- Geert
+	 */
+	hydra_init();		/* Mac I/O */
+
+	pci_create_OF_bus_map();
 }
 
 /* SL82C105 IDE Control/Status Register */
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index c45435aa5e36..3cfc382841e5 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -334,22 +334,11 @@ static void __init chrp_setup_arch(void)
 	/* On pegasos, enable the L2 cache if not already done by OF */
 	pegasos_set_l2cr();
 
-	/* Lookup PCI host bridges */
-	chrp_find_bridges();
-
-	/*
-	 *  Temporary fixes for PCI devices.
-	 *  -- Geert
-	 */
-	hydra_init();		/* Mac I/O */
-
 	/*
 	 *  Fix the Super I/O configuration
 	 */
 	sio_init();
 
-	pci_create_OF_bus_map();
-
 	/*
 	 * Print the banner, then scroll down so boot progress
 	 * can be printed.  -- Cort
@@ -582,6 +571,7 @@ define_machine(chrp) {
 	.name			= "CHRP",
 	.probe			= chrp_probe,
 	.setup_arch		= chrp_setup_arch,
+	.discover_phbs		= chrp_find_bridges,
 	.init			= chrp_init2,
 	.show_cpuinfo		= chrp_show_cpuinfo,
 	.init_IRQ		= chrp_init_IRQ,
-- 
2.26.2

