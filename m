Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4B276A13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:08:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmN80x4yzDqgf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:08:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PvAwg4xb; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxlkk53p1zDqZk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:39:10 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mn7so1072066pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5t1oqeJTdmTDIFhaXJivPBTTrbZGolePOo9vp9IXGm4=;
 b=PvAwg4xbFfy9BrDgDOs9qn8XeG+MSI+PTQvItEEmYh+WKLD+cSCHZP1j3dvo1RdM+H
 kvRLWfl5T7mT49GkvrJdFJhXpWOVJTl3ToUy/uITVEHcfw33ZZTo7w+9a4cvjHWvmaBP
 tXwl3H7KHA3Jak7NKPrjVL+GphP6Lm2s0NQkovr8LMt7YefJfFMLVgrN6Lsc5l+wrA+z
 37UCGNueWwC4kvRxb0SI5VLZ4Lign5zMzfa3oJCbZ3kvk8rv+GugFio2OjMzhIh50VMM
 y3QB9W7bMpSRw1HRvXWhzQ2umVCH4xZax16GEopF+nBnMbldV46+Qk2cjyLWa3y9zbvV
 J0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5t1oqeJTdmTDIFhaXJivPBTTrbZGolePOo9vp9IXGm4=;
 b=cGejj+Egd9Bvkz9HC6pAmQ37iRReOvSGPfIn0yOvtt1qHP6sjMO9dasExli2IKLKaV
 ySwKLD8R93/ZJdjOVnT95v9JNfUYSeXIlWm7OEg1wG4ekaFkvucswltFXBIXyaBrnaJG
 tlwyHHTuldftHKAnJlXqhmcjthrIFVNQZSNSku4DcPcbW1EiVgBZXpwN2JZ/w/pfEM8L
 NKKh3ybZPE7Aj/l8JB/51yjwRTwT5agXK7jDrfnDJpu+FNDr86ErL9MDnWAD6XXvy0Hs
 4j5SXyf5qxwpDMkQUAfQQOAQmVS/HD3As1Hj+2DSZUus9jCvFJKS6GBdpxl2f9cCpkeI
 pufw==
X-Gm-Message-State: AOAM532bOsq8vniQKl3rtO1/2hQSi9d7GrHQyisoEsNSlf1KhLI58HVW
 TkIzBmH7TZOqF4N8KpmX1xWwBZ38HeACPQ==
X-Google-Smtp-Source: ABdhPJxsTWhGu+IZeMGpw5r4rwb7mm3za+dDFLQyH0/fXJUtPRVxbYR6sUbjkWzGLQNILdCB7D/uTQ==
X-Received: by 2002:a17:902:8548:b029:d0:cbe1:e70b with SMTP id
 d8-20020a1709028548b02900d0cbe1e70bmr3181411plo.25.1600929545321; 
 Wed, 23 Sep 2020 23:39:05 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:39:04 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 15/18] powerpc/embedded6xx/mpc7448: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:16 +1000
Message-Id: <20200924063819.262830-15-oohall@gmail.com>
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
compile tested with mpc7448_hpc2_defconfig
---
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index 15437abe1f6d..20b727584e40 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -58,16 +58,14 @@ int mpc7448_hpc2_exclude_device(struct pci_controller *hose,
 		return PCIBIOS_SUCCESSFUL;
 }
 
-static void __init mpc7448_hpc2_setup_arch(void)
+static void __init mpc7448_hpc2_setup_pci(void)
 {
+#ifdef CONFIG_PCI
 	struct device_node *np;
 	if (ppc_md.progress)
-		ppc_md.progress("mpc7448_hpc2_setup_arch():set_bridge", 0);
-
-	tsi108_csr_vir_base = get_vir_csrbase();
+		ppc_md.progress("mpc7448_hpc2_setup_pci():set_bridge", 0);
 
 	/* setup PCI host bridge */
-#ifdef CONFIG_PCI
 	for_each_compatible_node(np, "pci", "tsi108-pci")
 		tsi108_setup_pci(np, MPC7448HPC2_PCI_CFG_PHYS, 0);
 
@@ -75,6 +73,11 @@ static void __init mpc7448_hpc2_setup_arch(void)
 	if (ppc_md.progress)
 		ppc_md.progress("tsi108: resources set", 0x100);
 #endif
+}
+
+static void __init mpc7448_hpc2_setup_arch(void)
+{
+	tsi108_csr_vir_base = get_vir_csrbase();
 
 	printk(KERN_INFO "MPC7448HPC2 (TAIGA) Platform\n");
 	printk(KERN_INFO
@@ -180,6 +183,7 @@ define_machine(mpc7448_hpc2){
 	.name 			= "MPC7448 HPC2",
 	.probe 			= mpc7448_hpc2_probe,
 	.setup_arch 		= mpc7448_hpc2_setup_arch,
+	.discover_phbs		= mpc7448_hpc2_setup_pci,
 	.init_IRQ 		= mpc7448_hpc2_init_IRQ,
 	.show_cpuinfo 		= mpc7448_hpc2_show_cpuinfo,
 	.get_irq 		= mpic_get_irq,
-- 
2.26.2

