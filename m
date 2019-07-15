Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 895F768603
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 11:08:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nHkf03CKzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 19:08:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L7T1JwLb"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nHSz6rxdzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 18:56:35 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id p184so7105376pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 01:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eS/9mMyCx/umiRMz4C0GDQdEH0XNXkIVKstdfBzpTgI=;
 b=L7T1JwLbICl0sU8GxGOyINvgGEbIaXxbHdLdhOZLpHuZKto9qH5BkQ6Dw+w9CUqs4F
 2fzOZYz7zVg8AeBtFfyydUyHKgEE0L1agNRcc3xmwuivnxGJAovJTsqhydaew5mK4XB3
 n8vaVwfXCW6rty5ctzGp/pfURb5yDIpkT7IE2j602FywraxoUgJbtS+Z9lf8Xbgh78K5
 1sPlaeJLnzd3StnJXJdLFT1XEF0cyB1bLvTS/LgUZZFSo+1iW9tg0+hgdgQOO/76XDMr
 fHnfsN5WSW7eBbsJLS0YVShU6gH4mx56d5hKt1E4jnHeDwKvRh1MBsv+KbDu/6ZYf/DV
 0xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eS/9mMyCx/umiRMz4C0GDQdEH0XNXkIVKstdfBzpTgI=;
 b=EnV1Wex39S1ZKIYDx3z7HiSrOGuuDD2+wClQ+rbwlkJKqNgM9smNAKsq0yaPQ/cfYD
 7RJ7NFiZ6eDR6gIAuS+wnMXNRDJmSXg6C0AaLbdYHz/ukSHz5Y4ImgpRPejEIp7Pd4Aj
 r8V2tES/D189PPUeLEHTXaPTcuBkQSbOqWtEz93yGt27btMZE0H29tGKMWKP6DVcRc+y
 kgbwewarIxAx82U/CeSk5bMxYgfad9DTvEO+86sZ1QBHDiy6hopfe3yff1mDS26QOkR7
 Ff9YQ/WKujgtSLlYER+Lc5ic9MuC/S5id6dAaaGtu36bs3ObyvFuqoZy/L4Ir1T0RbL6
 SfUg==
X-Gm-Message-State: APjAAAUU5sadupdJYogT3ymWys5leJ+Eo3L0sJBrabXVVhVtURl+z9kr
 uu5wt61Ahy7Iw+TI57O8s/0KuxId4vc=
X-Google-Smtp-Source: APXvYqy1DfFVtpftpJ1xyuGJ71VE/uhrU4EBG+X9m3Fj5CiAHA2eSKs4aOB5HgMx5uyKJlal5YuOeQ==
X-Received: by 2002:a17:90a:d997:: with SMTP id
 d23mr26809432pjv.84.1563180993841; 
 Mon, 15 Jul 2019 01:56:33 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d14sm22514815pfo.154.2019.07.15.01.56.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 01:56:33 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc/eeh_sysfs: Make clearing EEH_DEV_SYSFS saner
Date: Mon, 15 Jul 2019 18:56:12 +1000
Message-Id: <20190715085612.8802-6-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715085612.8802-1-oohall@gmail.com>
References: <20190715085612.8802-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The eeh_sysfs_remove_device() function is supposed to clear the
EEH_DEV_SYSFS flag since it indicates the EEH sysfs entries have been added
for a pci_dev.

When the sysfs files are removed eeh_remove_device() the eeh_dev and the
pci_dev have already been de-associated. This then causes the
pci_dev_to_eeh_dev() call in eeh_sysfs_remove_device() to return NULL so
the flag can't be cleared from the still-live eeh_dev. This problem is
worked around in the caller by clearing the flag manually. However, this
behaviour doesn't make a whole lot of sense, so this patch fixes it by:

a) Re-ordering eeh_remove_device() so that eeh_sysfs_remove_device() is
   called before de-associating the pci_dev and eeh_dev.

b) Making eeh_sysfs_remove_device() emit a warning if there's no
   corresponding eeh_dev for a pci_dev. The paths where the sysfs
   files are only reachable if EEH was setup for the device
   for the device in the first place so hitting this warning
   indicates a programming error.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c       | 30 +++++++++++++++++-------------
 arch/powerpc/kernel/eeh_sysfs.c | 15 ++++++++-------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index f192d57..6e24896 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1203,7 +1203,6 @@ void eeh_add_device_late(struct pci_dev *dev)
 		eeh_rmv_from_parent_pe(edev);
 		eeh_addr_cache_rmv_dev(edev->pdev);
 		eeh_sysfs_remove_device(edev->pdev);
-		edev->mode &= ~EEH_DEV_SYSFS;
 
 		/*
 		 * We definitely should have the PCI device removed
@@ -1306,17 +1305,11 @@ void eeh_remove_device(struct pci_dev *dev)
 	edev->pdev = NULL;
 
 	/*
-	 * The flag "in_error" is used to trace EEH devices for VFs
-	 * in error state or not. It's set in eeh_report_error(). If
-	 * it's not set, eeh_report_{reset,resume}() won't be called
-	 * for the VF EEH device.
+	 * eeh_sysfs_remove_device() uses pci_dev_to_eeh_dev() so we need to
+	 * remove the sysfs files before clearing dev.archdata.edev
 	 */
-	edev->in_error = false;
-	dev->dev.archdata.edev = NULL;
-	if (!(edev->pe->state & EEH_PE_KEEP))
-		eeh_rmv_from_parent_pe(edev);
-	else
-		edev->mode |= EEH_DEV_DISCONNECTED;
+	if (edev->mode & EEH_DEV_SYSFS)
+		eeh_sysfs_remove_device(dev);
 
 	/*
 	 * We're removing from the PCI subsystem, that means
@@ -1327,8 +1320,19 @@ void eeh_remove_device(struct pci_dev *dev)
 	edev->mode |= EEH_DEV_NO_HANDLER;
 
 	eeh_addr_cache_rmv_dev(dev);
-	eeh_sysfs_remove_device(dev);
-	edev->mode &= ~EEH_DEV_SYSFS;
+
+	/*
+	 * The flag "in_error" is used to trace EEH devices for VFs
+	 * in error state or not. It's set in eeh_report_error(). If
+	 * it's not set, eeh_report_{reset,resume}() won't be called
+	 * for the VF EEH device.
+	 */
+	edev->in_error = false;
+	dev->dev.archdata.edev = NULL;
+	if (!(edev->pe->state & EEH_PE_KEEP))
+		eeh_rmv_from_parent_pe(edev);
+	else
+		edev->mode |= EEH_DEV_DISCONNECTED;
 }
 
 int eeh_unfreeze_pe(struct eeh_pe *pe)
diff --git a/arch/powerpc/kernel/eeh_sysfs.c b/arch/powerpc/kernel/eeh_sysfs.c
index c4cc8fc..5614fd83 100644
--- a/arch/powerpc/kernel/eeh_sysfs.c
+++ b/arch/powerpc/kernel/eeh_sysfs.c
@@ -175,22 +175,23 @@ void eeh_sysfs_remove_device(struct pci_dev *pdev)
 {
 	struct eeh_dev *edev = pci_dev_to_eeh_dev(pdev);
 
+	if (!edev) {
+		WARN_ON(eeh_enabled());
+		return;
+	}
+
+	edev->mode &= ~EEH_DEV_SYSFS;
+
 	/*
 	 * The parent directory might have been removed. We needn't
 	 * continue for that case.
 	 */
-	if (!pdev->dev.kobj.sd) {
-		if (edev)
-			edev->mode &= ~EEH_DEV_SYSFS;
+	if (!pdev->dev.kobj.sd)
 		return;
-	}
 
 	device_remove_file(&pdev->dev, &dev_attr_eeh_mode);
 	device_remove_file(&pdev->dev, &dev_attr_eeh_pe_config_addr);
 	device_remove_file(&pdev->dev, &dev_attr_eeh_pe_state);
 
 	eeh_notify_resume_remove(pdev);
-
-	if (edev)
-		edev->mode &= ~EEH_DEV_SYSFS;
 }
-- 
2.9.5

