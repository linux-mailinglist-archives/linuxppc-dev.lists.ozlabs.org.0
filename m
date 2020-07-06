Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB792150F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 03:41:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0Sw21P6PzDqKf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 11:41:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P3e6dH7J; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Sph2jBqzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 11:36:44 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id z13so39130384wrw.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 18:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E3CuCX76VEEQECRRjhcQAsPt6BJFjWYoyIHeLkt8vMM=;
 b=P3e6dH7JHTDfv2w28bHpKkAMdsQTjFgpf5mG5R+x7NcqW8LY55Xd/eYkJxslz8d4HE
 YHKq/jEmjWR1jOtD8Inp0tn5yv3YBGkzRTbK5BK4siAXwTT/h6xCH74kKPj0+ASLqneZ
 DaVTftyrHpWjG+NHsgL1kN6IpnGVA6J/jv6YnxUeBfxVPaQ5+ECZ9nmYWHtwFgC+MhMV
 1aDjpe0hQAfMJfffghFxcVJjyOgqCiSKXtE/k7kYk6eMWDSHe39kB/XUR8qpttAxC6KR
 59WR5uBK3JX9ZeauC6jB6vWo46AOoqqp4k3DGp9A0YTL0A4VH6VmzTdyO+qiRNc2oco0
 KBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E3CuCX76VEEQECRRjhcQAsPt6BJFjWYoyIHeLkt8vMM=;
 b=K7QAVu6HdpzhE+OeOzz7sH5r6/61J62Q7z3fmuydTFe/wzJPTLE+3PYrdp+6GG848m
 Vxc4VVGGIwZgzz1GWZXfEBy9GLHWZt3w4x6kTCHFM2+sxe7mH0vF9YIlBGQpqtGTzmW1
 NrZ3fOroPZ0+dKu/z/FLHyo9HOneYtQVmSIb03YdL5w8xM5evqSkzzm90CGfCjbcp4rM
 fjgo2hSMQWNbZSAdWzedIk9ZKfqb954gU7oZTG7h91Tatn0pxkphuicbI43tToZTAvsG
 n/IUeR6YavF/sEsM5ZHoRBtbIH5MNLbyEbz5iRdvOCsP2IFZ8PVLeQqi0gpshAbj0RCC
 ZEWg==
X-Gm-Message-State: AOAM531tmjsND02YZLiLURniM7Ssg7I3mZEeV/d1lUjpBu/OFXEJJe2X
 eoQuB7xburcSygio2ToBBOVpXB0x4+A=
X-Google-Smtp-Source: ABdhPJw25CYvfE6mfcRyKMzk0uPxusFm7/utsywTmA0C/YW9GUfMJ6FYHC0aJBzXvx9o509Huou+HA==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr44043280wrs.4.1593999400778;
 Sun, 05 Jul 2020 18:36:40 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au (59-102-73-59.tpgi.com.au.
 [59.102.73.59])
 by smtp.gmail.com with ESMTPSA id v6sm9533392wrr.85.2020.07.05.18.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:36:40 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/14] powerpc/eeh: Remove eeh_dev_phb_init_dynamic()
Date: Mon,  6 Jul 2020 11:36:06 +1000
Message-Id: <20200706013619.459420-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200706013619.459420-1-oohall@gmail.com>
References: <20200706013619.459420-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This function is a one line wrapper around eeh_phb_pe_create() and despite
the name it doesn't create any eeh_dev structures. Replace it with direct
calls to eeh_phb_pe_create() since that does what it says on the tin
and removes a layer of indirection.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h             |  1 -
 arch/powerpc/kernel/eeh.c                  |  2 +-
 arch/powerpc/kernel/eeh_dev.c              | 13 -------------
 arch/powerpc/kernel/of_platform.c          |  4 ++--
 arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
 5 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 964a54292b36..646307481493 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -294,7 +294,6 @@ const char *eeh_pe_loc_get(struct eeh_pe *pe);
 struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
 
 struct eeh_dev *eeh_dev_init(struct pci_dn *pdn);
-void eeh_dev_phb_init_dynamic(struct pci_controller *phb);
 void eeh_show_enabled(void);
 int __init eeh_ops_register(struct eeh_ops *ops);
 int __exit eeh_ops_unregister(const char *name);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index d407981dec76..859f76020256 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1096,7 +1096,7 @@ static int eeh_init(void)
 
 	/* Initialize PHB PEs */
 	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
-		eeh_dev_phb_init_dynamic(hose);
+		eeh_phb_pe_create(hose);
 
 	eeh_addr_cache_init();
 
diff --git a/arch/powerpc/kernel/eeh_dev.c b/arch/powerpc/kernel/eeh_dev.c
index 7370185c7a05..8e159a12f10c 100644
--- a/arch/powerpc/kernel/eeh_dev.c
+++ b/arch/powerpc/kernel/eeh_dev.c
@@ -52,16 +52,3 @@ struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
 
 	return edev;
 }
-
-/**
- * eeh_dev_phb_init_dynamic - Create EEH devices for devices included in PHB
- * @phb: PHB
- *
- * Scan the PHB OF node and its child association, then create the
- * EEH devices accordingly
- */
-void eeh_dev_phb_init_dynamic(struct pci_controller *phb)
-{
-	/* EEH PE for PHB */
-	eeh_phb_pe_create(phb);
-}
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index 71a3f97dc988..f89376ff633e 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -62,8 +62,8 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	/* Init pci_dn data structures */
 	pci_devs_phb_init_dynamic(phb);
 
-	/* Create EEH PEs for the PHB */
-	eeh_dev_phb_init_dynamic(phb);
+	/* Create EEH PE for the PHB */
+	eeh_phb_pe_create(phb);
 
 	/* Scan the bus */
 	pcibios_scan_phb(phb);
diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index b3a38f5a6b68..f9ae17e8a0f4 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -34,7 +34,7 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
 	pci_devs_phb_init_dynamic(phb);
 
 	/* Create EEH devices for the PHB */
-	eeh_dev_phb_init_dynamic(phb);
+	eeh_phb_pe_create(phb);
 
 	if (dn->child)
 		pseries_eeh_init_edev_recursive(PCI_DN(dn));
-- 
2.26.2

