Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB9227692A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 08:44:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxlrM5BHdzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 16:44:03 +1000 (AEST)
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
 header.s=20161025 header.b=ArsnPD3g; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxlkB1TbfzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:38:41 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id o20so1261113pfp.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cMf1RE1FgJIEOpVzKnxoKyobML/s2DJ3qBS6LP8HEaA=;
 b=ArsnPD3gBOS9KxKFFonp++bC4Jg5mZP1oERua6mF3mR/5M7SK3hQyKSiqjQRFZ5nZY
 AdkqDW0z3IORK5Ej47UjgVZiNr1Qu3G3am44xSdCB3XWi9YlfECpSRhl91mHG+i0NNBd
 IMLl5wxawe42L4t99PDpPvkRDXmafgUJ5etqs0UGrZgjRuc2gM4Aj3FIvdkTX1s3ZwTT
 fDdiI3g8uYJHy1bApCCNaEZP/T+gJtkJLx4XkhC2i+iBgy5LaX8Q2dmCeSN97rvFkhHW
 IS77JPhHVkIJEJBKeWu85W45zQ5jav8ztGs9TwHwA8G+aGUKLxRzFBVhi5AZmfG2vXXi
 fbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cMf1RE1FgJIEOpVzKnxoKyobML/s2DJ3qBS6LP8HEaA=;
 b=NzsN7VDN4Q4mibWF3NR4txsS5do9owIXXtg3RyQengHAjMGUGwBLwZNLsjIQ5X6NJG
 cPPz+B7h1fxV1dBFoJV9GqQPGiVPgsISfUe0/CAsSHutcaikhu730nLvbWxjusk3ubkt
 i1dErYdoaU4Dh9jFDC4sNxG56IZqFCrsFphUu/thq6OAoku6wE2C9THqm0LjdS1GbbAA
 9fCtSYURjg2KR7fpGZV1NdydNK7RiFoBfzBiOK066ppn5LfPqwWYkWu1yY78owqlbYYK
 PUUN2M61BZvaoP712xmiBNmhKhJE5N+T+BFUCR0I6T9WTfnwrklgM4LBp6+4le/cXG9K
 WHWg==
X-Gm-Message-State: AOAM5300BW1ZKjv5ksXBme8EnhCjdZxqKqedP4V5WMYaYwDyymg8who6
 REQ/ROwAwwFgpuHUa37YnnyppYwhQIRApg==
X-Google-Smtp-Source: ABdhPJxbt9JHcLQrMFtTH03Aw1iOelZkD1w0SNxgg+HB13/FE0/4moOHnWz97R8FxeT3kAKYNjP5ZA==
X-Received: by 2002:a62:2c09:0:b029:142:2501:34f8 with SMTP id
 s9-20020a622c090000b0290142250134f8mr3056721pfs.81.1600929518849; 
 Wed, 23 Sep 2020 23:38:38 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:38 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 03/18] powerpc/maple: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:04 +1000
Message-Id: <20200924063819.262830-3-oohall@gmail.com>
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
 arch/powerpc/platforms/maple/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index f7e66a2005b4..4e9ad5bf3efb 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -179,9 +179,6 @@ static void __init maple_setup_arch(void)
 #ifdef CONFIG_SMP
 	smp_ops = &maple_smp_ops;
 #endif
-	/* Lookup PCI hosts */
-       	maple_pci_init();
-
 	maple_use_rtas_reboot_and_halt_if_present();
 
 	printk(KERN_DEBUG "Using native/NAP idle loop\n");
@@ -351,6 +348,7 @@ define_machine(maple) {
 	.name			= "Maple",
 	.probe			= maple_probe,
 	.setup_arch		= maple_setup_arch,
+	.discover_phbs		= maple_pci_init,
 	.init_IRQ		= maple_init_IRQ,
 	.pci_irq_fixup		= maple_pci_irq_fixup,
 	.pci_get_legacy_ide_irq	= maple_pci_get_legacy_ide_irq,
-- 
2.26.2

