Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103D2A3B90
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:57:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHZV3wvlzDqX8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:57:06 +1100 (AEDT)
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
 header.s=20161025 header.b=fJdL0oyW; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH6836nFzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:36:00 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id o129so13118543pfb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZPqzei1Fv+qLr1ovU3GS5sWwxVaLo335Z4KS7ZGWxs=;
 b=fJdL0oyWTL+Vm/i9FwT/uaT9ipLpQ6hHYfehKxCzfc8o4LjqcwM5nVonyZLH/oTEno
 GGOqj3nJVOEPsIo9QbM/2mvJqmM9cIp1apVF7QvCqPBQ/zkdVeNrI65gtjsMsxM3YwiC
 y3s879nQBGq6UeGxuzJqHt9X+i6K6R4vzC/n+/g7W4cHOM3dgpgLQA//DXr1iUexcbQw
 sXrYqbcM1NzYVgz8xPv1aZb8iGc6QzkXSYqZR+Jcvd/3pnV8LqXBpmO77lB9iv7GRO2I
 Yqe+I79aAirudLQKBv56iyv8nFGoMfdh05c9CBKASagt8rQB+LWRxVaaTULVxNi5WMsI
 rHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZPqzei1Fv+qLr1ovU3GS5sWwxVaLo335Z4KS7ZGWxs=;
 b=kvxouxNXMSaIyEA2GaWMiXmxeIyd3OEgIyDdWiPlSPb7TQM97wcO3abND39yfTzXeC
 aTXaeKOVflgfgJfE/cwmo1OJVC5iF3OSxxzzd3pCjLOz5l0tiTKozonOvN2otjn/6XSN
 8DZG9Ko6la09pL0Hjk1hWBSOXgpIdliQGVIVxiuBDNwL6YFF/vKAfAFjNkvwXhNs+73A
 rsPFIWRYk+u1vub+Isex2WGeWG35NyeeIRhOFYZnjbqIjeyNdjygJQ5Hgwm6VM/564Nb
 /IxbE6/B71oOpEKP1BbpAu4xDEtq/QRRIKy2kjjupklQFHi8OkaYyIaJthM3L7xpiKht
 /Fmg==
X-Gm-Message-State: AOAM530w+5HEPIVjYFLdIB5+0dR+JrWNK3LpjgqAUHpln7k8tPDAHFVi
 kvSSFsRcmOpFCfn/AvEip5R1pY9zgUQ=
X-Google-Smtp-Source: ABdhPJyBV9R7+jJPa3HuIkgMbIzMHSrm7l0/thUO/5jwBMfxK5AlTTJGCiXseDLRxKSxQPQRwFCovw==
X-Received: by 2002:a63:540d:: with SMTP id i13mr6892505pgb.37.1604378158513; 
 Mon, 02 Nov 2020 20:35:58 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:58 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/18] powerpc/chrp: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:17 +1100
Message-Id: <20201103043523.916109-12-oohall@gmail.com>
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

