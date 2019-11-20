Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F1C10314B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:50:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hlxq1mwfzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rqd+BR8d"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVB2089zDqhs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:38 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id b19so13350679pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IbwVBLO1A7CVpBUYwoUuowcXxam1frpNK9OKQsnPf5E=;
 b=rqd+BR8dWn/jK3etKsDcicuCqbKmz9cvK6bfp++cxLHwdnkXkvPbP3FRAH3dX/Ohsr
 Dl1vkcXW2++5ENWqmHovDHFgKNG/6cmScv8xa8WAxJgn5tYlMNAJ5jEt6aJAUEgPIJCY
 MExNzaUHm1rWJOtDzC3DekjYIJBausfkI2HqA5UoPL2/2NPWw0zJJ2/SeoUy3Aht9++2
 d4C7tfueug7XrqRYdXv/kcBjKOxtMBHBx2ETdnsjHBL+/HT06/43OvnsjkRIie+SehdC
 4zCoXoU2KP6AsixgJYqQDGEiguDMyBokYtfCEM4Yfnu+LGFGAm1YoEm9Y3moS/4XGdsM
 G+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IbwVBLO1A7CVpBUYwoUuowcXxam1frpNK9OKQsnPf5E=;
 b=ZdsrKWaqY39xxEaVPipXmECwQo2CwC5C4RmQQBDnBzPGGq3uoJuOb+a2w23lEVa82H
 gqMqDPdPTNz7tGHOe1snaHpMR1XzVi3kVaQnvOF48j/UvRsjPO/iSouOsVgCTlm1+YbL
 A9e8JS/DMhf7yE5f5LzuftA+CD756OQs97b3F5aGb7/4OpI5zOvFxi6RxbS1HP8UtIea
 3mjVQUM9qBxoVNHmr3IRm7hDJY+F6GEfmskz3o+EreaEUL77ievc7J7wpBSq4VZgmcAW
 vDZXpfjhaUWVpSjDAXxl9lErvAwnHyim5FadOZ5xvdRoqAPH+zKS9ULgtmRuChI5UoKY
 6rqA==
X-Gm-Message-State: APjAAAXnxy3J8qkydr1x01fs1LEFWjcK3xu3DVHotgTvAm0lHrROHrJA
 tq+xbtov4QI1Zz0m1nJJ55ARmOzX
X-Google-Smtp-Source: APXvYqzeH7AvkqAy6kqYKHj2Msb8Q4mn32GS60UwOfPtvuZPG2353vkv4U+tm5E6HcmGtTXh8zkgzw==
X-Received: by 2002:a63:e407:: with SMTP id a7mr186939pgi.92.1574213375687;
 Tue, 19 Nov 2019 17:29:35 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:35 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 10/46] powerpc/eeh: Pass eeh_dev to
 eeh_ops->restore_config()
Date: Wed, 20 Nov 2019 12:28:23 +1100
Message-Id: <20191120012859.23300-11-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove another pdn usage.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               |  2 +-
 arch/powerpc/kernel/eeh.c                    |  5 ++---
 arch/powerpc/kernel/eeh_pe.c                 |  6 ++----
 arch/powerpc/platforms/powernv/eeh-powernv.c | 11 +++++------
 4 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 62c4ee44ad2c..67847f8dfe71 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -227,7 +227,7 @@ struct eeh_ops {
 	int (*read_config)(struct eeh_dev *edev, int where, int size, u32 *val);
 	int (*write_config)(struct eeh_dev *edev, int where, int size, u32 val);
 	int (*next_error)(struct eeh_pe **pe);
-	int (*restore_config)(struct pci_dn *pdn);
+	int (*restore_config)(struct eeh_dev *edev);
 	int (*notify_resume)(struct pci_dn *pdn);
 };
 
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 7258fa04176d..63500e34e329 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -726,7 +726,6 @@ static void eeh_disable_and_save_dev_state(struct eeh_dev *edev,
 
 static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	struct pci_dev *pdev = eeh_dev_to_pci_dev(edev);
 	struct pci_dev *dev = userdata;
 
@@ -734,8 +733,8 @@ static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
 		return;
 
 	/* Apply customization from firmware */
-	if (pdn && eeh_ops->restore_config)
-		eeh_ops->restore_config(pdn);
+	if (eeh_ops->restore_config)
+		eeh_ops->restore_config(edev);
 
 	/* The caller should restore state for the specified device */
 	if (pdev != dev)
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index e11e0830f125..634963aa4a77 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -841,16 +841,14 @@ static void eeh_restore_device_bars(struct eeh_dev *edev)
  */
 static void eeh_restore_one_device_bars(struct eeh_dev *edev, void *flag)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-
 	/* Do special restore for bridges */
 	if (edev->mode & EEH_DEV_BRIDGE)
 		eeh_restore_bridge_bars(edev);
 	else
 		eeh_restore_device_bars(edev);
 
-	if (eeh_ops->restore_config && pdn)
-		eeh_ops->restore_config(pdn);
+	if (eeh_ops->restore_config)
+		eeh_ops->restore_config(edev);
 }
 
 /**
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 54d8ec77aef2..6c5d9f1bc378 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1644,12 +1644,10 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 	return ret;
 }
 
-static int pnv_eeh_restore_config(struct pci_dn *pdn)
+static int pnv_eeh_restore_config(struct eeh_dev *edev)
 {
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 	struct pnv_phb *phb;
 	s64 ret = 0;
-	int config_addr = (pdn->busno << 8) | (pdn->devfn);
 
 	if (!edev)
 		return -EEXIST;
@@ -1658,13 +1656,14 @@ static int pnv_eeh_restore_config(struct pci_dn *pdn)
 	if (edev->physfn)
 		return 0;
 
-	phb = pdn->phb->private_data;
+	phb = edev->pe->phb->private_data;
 	ret = opal_pci_reinit(phb->opal_id,
-			      OPAL_REINIT_PCI_DEV, config_addr);
+			      OPAL_REINIT_PCI_DEV, edev->bdfn);
 
+	ret = opal_pci_reinit(phb->opal_id, OPAL_REINIT_PCI_DEV, edev->bdfn);
 	if (ret) {
 		pr_warn("%s: Can't reinit PCI dev 0x%x (%lld)\n",
-			__func__, config_addr, ret);
+			__func__, edev->bdfn, ret);
 		return -EIO;
 	}
 
-- 
2.21.0

