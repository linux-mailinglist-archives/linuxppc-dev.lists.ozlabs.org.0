Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C452A3BA8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:08:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHqd51cGzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:08:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uWRgHKW6; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH6Q2C59zDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:36:13 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id a200so13089913pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=do4QpgVUJH4FahzX+VOxgzwXwqh4ZG7TfyRWmg7zLms=;
 b=uWRgHKW6eoFIox+NA+aH2tec1T9bZWHOz9pzrhoKmfsdUr/qiqdjxYy5Tz/+YsJ51D
 RpDGIYaFridj2GQFSrt4fN/UzVzoLtptUeSo/Ws+YrqxVqv84hQ6ZI8Jmne9M8enJUIg
 9PwL+iuZ+WukYk4zx/9ZU04Od9OAel3Hv2jyZvDOexSCPl1epbS5AbNYrmRl40kKyWGS
 1f3IAVHiJfxVzKDVpm3sWiF+hKzQkw3ssYcmS4+0sB5xJhtLgySUPHD5yw51cvuF8nA6
 GegLrU/jFZhiERlvpZcw23IRY1GyMIPhwWCb7J3ePHkqIaKWUGVyWRKq/7iRachiv1n0
 eEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=do4QpgVUJH4FahzX+VOxgzwXwqh4ZG7TfyRWmg7zLms=;
 b=hdt31xQGpuMjWYuLFR8LRCi7ayVaG5D1xFYfkcV1impOS9ls+hO7UvJtIT1N5RMjXR
 K6t+f/lMOCWMvDEZcejQIbOsp7VK60i8iX0RCHaaevY7KLedwqaEPkHayjmiPGUetnmH
 2H/+h3Dp3TISmlLXvJp+y6w0xsAvGEt4Mo30kQpX9QTwH1PtJxPdEXJdKIdzSakKOdGx
 kJ6r5fOi1cOD2Unx2wH2SwJCvc/DhH5linw7AVLrtNPboljMAlWg2os4dk06LAa4YOwE
 pUKD+aakqCcqKQLHUvMb0FVRq49EBXJ1+QN776mVWoTzum5GPbsQkgfmPPIYXQLhIFbm
 g0ZQ==
X-Gm-Message-State: AOAM5330mLcsUJUrWkYDgfjlmI1/RKnR6zPuK7/gU1lmO5NJRnPlvtIA
 GAjjw1iL9jKg8p5LC4+eZbjMSg3wbwQ=
X-Google-Smtp-Source: ABdhPJxQVOGaH5miLqqxzgKXMvLCGYmR3B5PZnxp52mA6wad+5o9qayVycAd3I6pylUuOd8hcqkb5g==
X-Received: by 2002:a05:6a00:16c4:b029:162:bf9f:6458 with SMTP id
 l4-20020a056a0016c4b0290162bf9f6458mr24065170pfc.55.1604378170832; 
 Mon, 02 Nov 2020 20:36:10 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:36:10 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/18] powerpc/powermac: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:23 +1100
Message-Id: <20201103043523.916109-18-oohall@gmail.com>
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
compile tested with pmac32_defconfig and g5_defconfig
---
 arch/powerpc/platforms/powermac/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 2e2cc0c75d87..86aee3f2483f 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -298,9 +298,6 @@ static void __init pmac_setup_arch(void)
 		of_node_put(ic);
 	}
 
-	/* Lookup PCI hosts */
-	pmac_pci_init();
-
 #ifdef CONFIG_PPC32
 	ohare_init();
 	l2cr_init();
@@ -600,6 +597,7 @@ define_machine(powermac) {
 	.name			= "PowerMac",
 	.probe			= pmac_probe,
 	.setup_arch		= pmac_setup_arch,
+	.discover_phbs		= pmac_pci_init,
 	.show_cpuinfo		= pmac_show_cpuinfo,
 	.init_IRQ		= pmac_pic_init,
 	.get_irq		= NULL,	/* changed later */
-- 
2.26.2

