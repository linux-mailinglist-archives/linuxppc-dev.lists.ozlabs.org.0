Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D27263CD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 07:56:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7SF1flFzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:56:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FOLm7Qgh; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Cr3BQZzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:46:00 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b124so3957512pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3vRj4Moc96wsSoUNAszrNT/KuRF0z5gpUdqr1Keyhf4=;
 b=FOLm7QghhDbDcS0CSXPw6YHPOY7wyq53G6p3wBNKxfor88Z+1/mQCqiXS69sBzwO5e
 kQvvsk2oBVyLs24qZ6vL+aSq8rn8kBHzs3Ah4VkunmCrnU95BHC1uxlrRTF6FbK5VX6y
 TmBHakT6IwRP7Jm8rPI/sh9yrAcFBYbFVaGFm+zUaguVxeSR1QgKmoZbXT2i7Ibwn+3L
 +oRfAuolFh5w/DLBfTgYWCW75sxnU6PjV38Qimj11w/Meu5NHLaNllpVKNbjDnPJm32H
 kAMCS16HmSxnJOzf4XlKy5sS6Ji/Dptho3b25q5jd0OERtMHgh1ysXR0wH6QYEQRvGKu
 GYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3vRj4Moc96wsSoUNAszrNT/KuRF0z5gpUdqr1Keyhf4=;
 b=DvLhmwWQH/jos00IyvafDuTKBUkiq2mF/xSuS3nG0H4vjVmtutmNcoLGSv6IW3JYhb
 yvphn/DYQpS6O+uZUhvwb5GJvBHxZG9pAecI4H7GYzFMAgs/nA073EaWFsibPzxvV9aW
 coVemr6D3LwWj/gxTHZkfGgJ81xpDstWBsiRG8C9eHRhSRku8QVLWgxkA+z4sCQshEpi
 6k8nkbVssOg0xwuMHP57FMrZFNA0At3Wfly9uJH3I9+lKpOjCBn7RfxFo90Rvz9oAiog
 8I49WE/0GiaNozuW+CPBQGM74e9KswS8Y/k0JiRQg+UFGNHVDIgb+NlzeutEhvBq8e7u
 /J0w==
X-Gm-Message-State: AOAM531eNKTn85REPsmB0y/9ZtEIYnEmmQwqDX9g8mJ45PnUFsKUtC4b
 plknPMtJmCzJESbAUbeVyh5ORYKLVL7hog==
X-Google-Smtp-Source: ABdhPJzvP5psF0sronWLjDvHRqLjw78sJzfK/8lp7FkZQqzD4IJe64LH18YNwRA3H7TXzNTDWV4OyA==
X-Received: by 2002:a62:838a:: with SMTP id h132mr3817815pfe.72.1599716756178; 
 Wed, 09 Sep 2020 22:45:56 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:45:55 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/9] powerpc/eeh: Move EEH initialisation to an arch initcall
Date: Thu, 10 Sep 2020 15:45:28 +1000
Message-Id: <20200910054532.2043724-6-oohall@gmail.com>
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

The initialisation of EEH mostly happens in a core_initcall_sync initcall,
followed by registering a bus notifier later on in an arch_initcall.
Anything involving initcall dependecies is mostly incomprehensible unless
you've spent a while staring at code so here's the full sequence:

ppc_md.setup_arch       <-- pci_controllers are created here

...time passes...

core_initcall           <-- pci_dns are created from DT nodes
core_initcall_sync      <-- platforms call eeh_init()
postcore_initcall       <-- PCI bus type is registered
postcore_initcall_sync
arch_initcall           <-- EEH pci_bus notifier registered
subsys_initcall         <-- PHBs are scanned here

There's no real requirement to do the EEH setup at the core_initcall_sync
level. It just needs to be done after pci_dn's are created and before we
start scanning PHBs. Simplify the flow a bit by moving the platform EEH
inititalisation to an arch_initcall so we can fold the bus notifier
registration into eeh_init().

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c                    | 64 ++++++++++----------
 arch/powerpc/platforms/powernv/eeh-powernv.c |  2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |  2 +-
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 98faf139e676..c9e25cfce8f0 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -940,6 +940,30 @@ static struct notifier_block eeh_reboot_nb = {
 	.notifier_call = eeh_reboot_notifier,
 };
 
+static int eeh_device_notifier(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct device *dev = data;
+
+	switch (action) {
+	/*
+	 * Note: It's not possible to perform EEH device addition (i.e.
+	 * {pseries,pnv}_pcibios_bus_add_device()) here because it depends on
+	 * the device's resources, which have not yet been set up.
+	 */
+	case BUS_NOTIFY_DEL_DEVICE:
+		eeh_remove_device(to_pci_dev(dev));
+		break;
+	default:
+		break;
+	}
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block eeh_device_nb = {
+	.notifier_call = eeh_device_notifier,
+};
+
 /**
  * eeh_init - System wide EEH initialization
  *
@@ -960,7 +984,14 @@ int eeh_init(struct eeh_ops *ops)
 	/* Register reboot notifier */
 	ret = register_reboot_notifier(&eeh_reboot_nb);
 	if (ret) {
-		pr_warn("%s: Failed to register notifier (%d)\n",
+		pr_warn("%s: Failed to register reboot notifier (%d)\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = bus_register_notifier(&pci_bus_type, &eeh_device_nb);
+	if (ret) {
+		pr_warn("%s: Failed to register bus notifier (%d)\n",
 			__func__, ret);
 		return ret;
 	}
@@ -975,37 +1006,6 @@ int eeh_init(struct eeh_ops *ops)
 	return eeh_event_init();
 }
 
-static int eeh_device_notifier(struct notifier_block *nb,
-			       unsigned long action, void *data)
-{
-	struct device *dev = data;
-
-	switch (action) {
-	/*
-	 * Note: It's not possible to perform EEH device addition (i.e.
-	 * {pseries,pnv}_pcibios_bus_add_device()) here because it depends on
-	 * the device's resources, which have not yet been set up.
-	 */
-	case BUS_NOTIFY_DEL_DEVICE:
-		eeh_remove_device(to_pci_dev(dev));
-		break;
-	default:
-		break;
-	}
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block eeh_device_nb = {
-	.notifier_call = eeh_device_notifier,
-};
-
-static __init int eeh_set_bus_notifier(void)
-{
-	bus_register_notifier(&pci_bus_type, &eeh_device_nb);
-	return 0;
-}
-arch_initcall(eeh_set_bus_notifier);
-
 /**
  * eeh_probe_device() - Perform EEH initialization for the indicated pci device
  * @dev: pci device for which to set up EEH
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 03e566874595..d03c5873defc 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1721,4 +1721,4 @@ static int __init eeh_powernv_init(void)
 
 	return ret;
 }
-machine_core_initcall_sync(powernv, eeh_powernv_init);
+machine_arch_initcall(powernv, eeh_powernv_init);
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index fd3444428632..b1561961c7ff 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -989,4 +989,4 @@ static int __init eeh_pseries_init(void)
 			ret);
 	return ret;
 }
-machine_core_initcall_sync(pseries, eeh_pseries_init);
+machine_arch_initcall(pseries, eeh_pseries_init);
-- 
2.26.2

