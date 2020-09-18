Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C926F953
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 11:33:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt7t20Wx5zDqmd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UMyKBH/V; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt7qx4XwdzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:31:06 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id q12so2683525plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rf43mleWoxjf8ME/KG3RjIlsQQymIcetCYjCglnapYQ=;
 b=UMyKBH/VPDi5OMzTkh9XvBVyho/YHiFWFaJmgcK1MhhX1sLOAyf5ukiExth3n8aO0H
 jzD4fwExmzImP0uvVOW6U5fBInIsNlDXn76MCDdgGveMP80D+FhqzcOIxSZdnY7GQzON
 EqsmJ5PpQDqbeAoCl8uw3XO5CAObcwPuO36qZjOSnzZSpWmz7efPQm27hciyVhmwlM+Z
 EEw+fwVkeDlgdrLzTDcMHaxaRuZKED/5HVGXW3xYy9luYic0VEvLHDT9JKEXWhfOD57W
 U/94evrgXTvPN99FF/3DnDIwM7cp3vyvKdjpKhrJT5kuW8eGeqiE/yV50ZuMMxiPvBXq
 cbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rf43mleWoxjf8ME/KG3RjIlsQQymIcetCYjCglnapYQ=;
 b=tknEdBPnR47WCTI2D6yga8nsFSM5NQx73LUWddfOUBa705Z3ypfIa9ViJBoPk0EyiW
 QU+Omd5yO7Opk9hcLNgSG2lwOCoCfOWbEBAkrW/z6XM/0JYmapXApCEZU9drpy8zLCwr
 3Dpq+2lfs7736I4gwfvGPPfbwAUNxboyP+ZoO0MlvmGIa9Y2VrG2k4CEtGOBiAjX0bNP
 2mVGW6bZJDil6XQPz2pKTal3jQ4HNNHNO9Gp57hdAG0ZO15pIG+qznc6NW2fBaUnVCmf
 hMJPPYBXmALqUj8SopIBCWAIVWshmtgLyzhAnH2Z4KjhGn9pSJZC97Inu2SoA5m3PIV8
 BgjA==
X-Gm-Message-State: AOAM531CKVxC6XjIflYnv0yiPynGRYLX5bZMM4hKyYnKU8dqT1vMRNa6
 Oq7jTZ7+o0YiP6Qhb5F94uozD7BEi9i0Ng==
X-Google-Smtp-Source: ABdhPJzgWCm1A3ujj4Uqp+anSCarY3FXKdXiPsSp7A/iEnfLQgUpoQXcKp52K+mPC/r8TEwsL8D52g==
X-Received: by 2002:a17:902:9041:b029:d0:cc02:8540 with SMTP id
 w1-20020a1709029041b02900d0cc028540mr31524093plz.41.1600421462700; 
 Fri, 18 Sep 2020 02:31:02 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id cf7sm2258853pjb.52.2020.09.18.02.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:31:02 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/9] powerpc/eeh: Rework EEH initialisation
Date: Fri, 18 Sep 2020 19:30:42 +1000
Message-Id: <20200918093050.37344-1-oohall@gmail.com>
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
index 0cabe4e632e3..3eb0f2439da8 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1699,7 +1699,7 @@ static int __init eeh_powernv_init(void)
 {
 	int ret = -EINVAL;
 
-	ret = eeh_ops_register(&pnv_eeh_ops);
+	ret = eeh_init(&pnv_eeh_ops);
 	if (!ret)
 		pr_info("EEH: PowerNV platform initialized\n");
 	else
@@ -1707,4 +1707,4 @@ static int __init eeh_powernv_init(void)
 
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

