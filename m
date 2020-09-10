Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A06F263CBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 07:49:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7Hp2cmczDqbB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:49:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YJ5kCCyZ; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Cg1mklzDqYW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:45:50 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z19so3976867pfn.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L36TcGzdS9OQVPkALTDuSzwhH8ha3GtnJpHkFaSYO3E=;
 b=YJ5kCCyZ5YlcFQi4KXMaFPqfdKRjJBvWvLu8GRP0jTs24QVl4rYhIY2FVaxRpfKHFA
 a4IWBXMD+666LvATUxTqjcKmzFBovRR2pcXrA2NeXePXR5HwR0/GlJX8To6dCv8BHmmh
 1e2HcmYjzzTPrrHb7Iscq00b/Ij8uJb2zEg5H4M0Qqa/jjb8esfAhQCkMEgEsbg75XZJ
 ZY9K2wcbJlmGxCp7fJtLEt8fi3BM4gnJMo/TSlhLDiyds6LdmvAjhFYftIJ11FiAYUjT
 Dy06L2wOsHFL9FULZmRT0Q/t9ZIp5W/Yr4BWNlwEvVmjenGh7otrJ/uCGe7lNzcCq3/V
 GDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L36TcGzdS9OQVPkALTDuSzwhH8ha3GtnJpHkFaSYO3E=;
 b=FF89zN4FzcTZeMLlrzC4m3K+6GkE+R5HI75I60cPuWXWidVLhWNep9gVYNz7CmUrb4
 JT+B1lh+v4cH+rH/kzjthyLMp7Sjh5EgneeOMdGvUrnFs3+j3q/UMUR8+thcMLbHK2aU
 NfwgTgRKgkcOL6uijOvSdvNCKPt8PM93eogjTe+FEp9zE2OtQgvDKqC44GRr9G4IQkOk
 Tf8Otqup+knGc8NQnQW2LttPsbLdCMJABxqLGPdaYFb44/QqCAsJY23JmSkhfWabDxft
 lgXN1q4BouIxH3R/8EwjsR3pz4eeA9ExsV8+igHSUkSevZnR2LO5sK/r5DM52CYbmCY0
 vSqQ==
X-Gm-Message-State: AOAM532Jd1bjmrotSDCNxccqqZbRkNfXy2p+UG0a3hRJHGA1ktTKumYb
 aLFs5LUUSgS03Um3foKlFtbZnhzYlMgkaA==
X-Google-Smtp-Source: ABdhPJwbI2SVqN8gqUVXAW1mdwa6DqxP2xSC6/4yTN9WaPP1uvVl2oUdd9IetzEzMfpZ+Yi8oyIlsQ==
X-Received: by 2002:a63:29c7:: with SMTP id p190mr3237986pgp.292.1599716747610; 
 Wed, 09 Sep 2020 22:45:47 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:45:47 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/9] powerpc/eeh: Rework EEH initialisation
Date: Thu, 10 Sep 2020 15:45:24 +1000
Message-Id: <20200910054532.2043724-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910054532.2043724-1-oohall@gmail.com>
References: <20200910054532.2043724-1-oohall@gmail.com>
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

Drop the EEH register / unregister ops thing and have the platform pass the
ops structure into eeh_init() directly. This takes one initcall out of the
EEH setup path and it means we're only doing EEH setup on the platforms
which actually support it. It's also less code and generally easier to
follow.

No functional changes.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               |  3 +-
 arch/powerpc/kernel/eeh.c                    | 87 ++++----------------
 arch/powerpc/platforms/powernv/eeh-powernv.c |  4 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |  5 +-
 4 files changed, 21 insertions(+), 78 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index d5f369bcd130..765bcf63edea 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -295,8 +295,7 @@ const char *eeh_pe_loc_get(struct eeh_pe *pe);
 struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
 
 void eeh_show_enabled(void);
-int __init eeh_ops_register(struct eeh_ops *ops);
-int __exit eeh_ops_unregister(const char *name);
+int __init eeh_init(struct eeh_ops *ops);
 int eeh_check_failure(const volatile void __iomem *token);
 int eeh_dev_check_failure(struct eeh_dev *edev);
 void eeh_addr_cache_init(void);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 94682382fc8c..28a0ea5d9faa 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -929,56 +929,6 @@ void eeh_save_bars(struct eeh_dev *edev)
 		edev->config_space[1] |= PCI_COMMAND_MASTER;
 }
 
-/**
- * eeh_ops_register - Register platform dependent EEH operations
- * @ops: platform dependent EEH operations
- *
- * Register the platform dependent EEH operation callback
- * functions. The platform should call this function before
- * any other EEH operations.
- */
-int __init eeh_ops_register(struct eeh_ops *ops)
-{
-	if (!ops->name) {
-		pr_warn("%s: Invalid EEH ops name for %p\n",
-			__func__, ops);
-		return -EINVAL;
-	}
-
-	if (eeh_ops && eeh_ops != ops) {
-		pr_warn("%s: EEH ops of platform %s already existing (%s)\n",
-			__func__, eeh_ops->name, ops->name);
-		return -EEXIST;
-	}
-
-	eeh_ops = ops;
-
-	return 0;
-}
-
-/**
- * eeh_ops_unregister - Unreigster platform dependent EEH operations
- * @name: name of EEH platform operations
- *
- * Unregister the platform dependent EEH operation callback
- * functions.
- */
-int __exit eeh_ops_unregister(const char *name)
-{
-	if (!name || !strlen(name)) {
-		pr_warn("%s: Invalid EEH ops name\n",
-			__func__);
-		return -EINVAL;
-	}
-
-	if (eeh_ops && !strcmp(eeh_ops->name, name)) {
-		eeh_ops = NULL;
-		return 0;
-	}
-
-	return -EEXIST;
-}
-
 static int eeh_reboot_notifier(struct notifier_block *nb,
 			       unsigned long action, void *unused)
 {
@@ -991,25 +941,22 @@ static struct notifier_block eeh_reboot_nb = {
 };
 
 /**
- * eeh_init - EEH initialization
- *
- * Initialize EEH by trying to enable it for all of the adapters in the system.
- * As a side effect we can determine here if eeh is supported at all.
- * Note that we leave EEH on so failed config cycles won't cause a machine
- * check.  If a user turns off EEH for a particular adapter they are really
- * telling Linux to ignore errors.  Some hardware (e.g. POWER5) won't
- * grant access to a slot if EEH isn't enabled, and so we always enable
- * EEH for all slots/all devices.
+ * eeh_init - System wide EEH initialization
  *
- * The eeh-force-off option disables EEH checking globally, for all slots.
- * Even if force-off is set, the EEH hardware is still enabled, so that
- * newer systems can boot.
+ * It's the platform's job to call this from an arch_initcall().
  */
-static int eeh_init(void)
+int eeh_init(struct eeh_ops *ops)
 {
 	struct pci_controller *hose, *tmp;
 	int ret = 0;
 
+	/* the platform should only initialise EEH once */
+	if (WARN_ON(eeh_ops))
+		return -EEXIST;
+	if (WARN_ON(!ops))
+		return -ENOENT;
+	eeh_ops = ops;
+
 	/* Register reboot notifier */
 	ret = register_reboot_notifier(&eeh_reboot_nb);
 	if (ret) {
@@ -1018,13 +965,13 @@ static int eeh_init(void)
 		return ret;
 	}
 
-	/* call platform initialization function */
-	if (!eeh_ops) {
-		pr_warn("%s: Platform EEH operation not found\n",
-			__func__);
-		return -EEXIST;
-	} else if ((ret = eeh_ops->init()))
+	if (eeh_ops->init)
+		ret = eeh_ops->init();
+	if (ret) {
+		pr_warn("%s: platform EEH init failed (%d)\n",
+			__func__, ret);
 		return ret;
+	}
 
 	/* Initialize PHB PEs */
 	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
@@ -1036,8 +983,6 @@ static int eeh_init(void)
 	return eeh_event_init();
 }
 
-core_initcall_sync(eeh_init);
-
 static int eeh_device_notifier(struct notifier_block *nb,
 			       unsigned long action, void *data)
 {
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 9af8c3b98853..a550f837ccb5 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1717,7 +1717,7 @@ static int __init eeh_powernv_init(void)
 {
 	int ret = -EINVAL;
 
-	ret = eeh_ops_register(&pnv_eeh_ops);
+	ret = eeh_init(&pnv_eeh_ops);
 	if (!ret)
 		pr_info("EEH: PowerNV platform initialized\n");
 	else
@@ -1725,4 +1725,4 @@ static int __init eeh_powernv_init(void)
 
 	return ret;
 }
-machine_early_initcall(powernv, eeh_powernv_init);
+machine_core_initcall_sync(powernv, eeh_powernv_init);
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index cb2d9a970b7b..3cc569e8b6d4 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -994,13 +994,12 @@ static int __init eeh_pseries_init(void)
 {
 	int ret;
 
-	ret = eeh_ops_register(&pseries_eeh_ops);
+	ret = eeh_init(&pseries_eeh_ops);
 	if (!ret)
 		pr_info("EEH: pSeries platform initialized\n");
 	else
 		pr_info("EEH: pSeries platform initialization failure (%d)\n",
 			ret);
-
 	return ret;
 }
-machine_early_initcall(pseries, eeh_pseries_init);
+machine_core_initcall_sync(pseries, eeh_pseries_init);
-- 
2.26.2

