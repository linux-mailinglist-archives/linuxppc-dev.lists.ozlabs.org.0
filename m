Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D6228F2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:30:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBMvr06ZszDqfb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:30:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BYRejM9S; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMqX2N0jzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:26:47 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id f16so509325pjt.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zUypcbpiJa4yRYECyGe8sRHEgmAKBrcDjEJ6UzJh0gk=;
 b=BYRejM9Sw0ywdaSsTaS2mlNeNeQW/r+sU16jF7yWsGFBiRniqHk3x/0qNHrrWNSRVp
 m8jNncedI9MhcgElm2PhCZS8sHLrFUUo96pUu17FaYP7ZgaxURofgTX14+d8jPW0F1cz
 bIWQonwqhlSmPQdK8wxVlKePv4vKL7NcJF3MD+sVSizn1n0Gku2XgyOSg5yJ0ZX2ZVqd
 AgJ1Xt8UbP/Wf4gOh3vXoncknqATPSASikBdTLYcldtU9p6xbAWlRrsTS3UpK+HTOYvo
 AddYrYvTt1/GTIH9MZ10LEo/KOXt32k4kVQXVqx/Hy8FF2EPIm5tCRUxOabARKZV5kG/
 6LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zUypcbpiJa4yRYECyGe8sRHEgmAKBrcDjEJ6UzJh0gk=;
 b=oAOmHj9lqoZAdgNYOeTtgKoP4O6Gdo7RH7YAarWgxLZY2QiF3h8G08ksHA0ZSYy377
 nt3Znpw9F/4s352Gtcya5OrIPebde+KFzYlpAW6IQ1RwK6UXyIm6ZxKf33LtTy0/Ig/C
 Piv248XwimFEYf3aMj5zTGp6HbDS/q0b3S1IZhmvdnWVLXP4CKXj/JN799EbCp/LbKBb
 T0idkJqpglnISbg9rUaubUARlorcMIzbz9QDc0HQUfoc5gzIJ7devdsVfjJ8YpA1VzwN
 JABfn/Vm5cif4cwna9i6IRi80Vprz22BTiTDruwnofFVrBtjDUo0vZQyN+Tp0HYx6c58
 9vtQ==
X-Gm-Message-State: AOAM5307D5Bx1J11iHjOAGnFFKgTvBHERGAHFXDsb4rCz0gCvvvIBbWy
 fWfit5F3gFQWBGvmT3eS+kk6Nxly1+E=
X-Google-Smtp-Source: ABdhPJzfkv4X7jlv3lyc6om1+x68qhSW/o+oOv/YLRH05h2FgcoxLiVnyqmafEtjDytIBaxVUvTWcw==
X-Received: by 2002:a17:90a:db0b:: with SMTP id
 g11mr8242094pjv.11.1595392003723; 
 Tue, 21 Jul 2020 21:26:43 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:26:43 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/14] powerpc/eeh: Remove eeh_dev_phb_init_dynamic()
Date: Wed, 22 Jul 2020 14:26:15 +1000
Message-Id: <20200722042628.1425880-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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

This function is a one line wrapper around eeh_phb_pe_create() and despite
the name it doesn't create any eeh_dev structures. Replace it with direct
calls to eeh_phb_pe_create() since that does what it says on the tin
and removes a layer of indirection.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: Added sub prototype of eeh_phb_pe_create() for the !CONFIG_EEH case.
---
 arch/powerpc/include/asm/eeh.h             |  3 ++-
 arch/powerpc/kernel/eeh.c                  |  2 +-
 arch/powerpc/kernel/eeh_dev.c              | 13 -------------
 arch/powerpc/kernel/of_platform.c          |  4 ++--
 arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
 5 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 964a54292b36..64487b88c569 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -294,7 +294,6 @@ const char *eeh_pe_loc_get(struct eeh_pe *pe);
 struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
 
 struct eeh_dev *eeh_dev_init(struct pci_dn *pdn);
-void eeh_dev_phb_init_dynamic(struct pci_controller *phb);
 void eeh_show_enabled(void);
 int __init eeh_ops_register(struct eeh_ops *ops);
 int __exit eeh_ops_unregister(const char *name);
@@ -370,6 +369,8 @@ void pseries_eeh_init_edev_recursive(struct pci_dn *pdn);
 #else
 static inline void pseries_eeh_add_device_early(struct pci_dn *pdn) { }
 static inline void pseries_eeh_add_device_tree_early(struct pci_dn *pdn) { }
+
+static inline int eeh_phb_pe_create(struct pci_controller *phb) { return 0; }
 #endif
 
 #ifdef CONFIG_PPC64
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

