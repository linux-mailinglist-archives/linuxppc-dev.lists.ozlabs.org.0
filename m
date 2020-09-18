Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C626F972
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 11:40:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt82Z0NZ4zDqpk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:40:22 +1000 (AEST)
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
 header.s=20161025 header.b=XSXp6iwm; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt7r30VBXzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:31:15 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id m15so2694064pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1PKQL1x5S6kkLbaU3tOHw9Ea5z1O20xZmfaCbFSDr8=;
 b=XSXp6iwmakYe5dwu5+uKV5k/+fqguzAgR9clGOISJBklDGbrfbpdKsw270JLfNW3WX
 1XMxVihz6mSDSDDGLeJxJC3FgbaDE3oq1txVBsBZ1wiHjZv8fspzGM6+w8vKPoA+xMNi
 wBWMzVQ7oQmC5RsFJXncTngJ8QdPrMpRAAykSE/RcmCOzYxiUJxDA2NwlOQqfMOsavgt
 hKrVtpY4Eg4K1tzHYBx3R2CfuUN8Lk/OlxgEMFSML5jfKh9u9my4bSNB4YoaElZAO2ev
 sVi4bV9yd/bQGlopw0xswZr2q6XjAkgra08JAlbOrt5iW7NlToAqKALGiAzrn9RNqXzx
 3BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q1PKQL1x5S6kkLbaU3tOHw9Ea5z1O20xZmfaCbFSDr8=;
 b=RXLNarNaKecFz1/06SrvELnKOzntdsYXd5rhKw9m0+9ncWtU7A4mVi0C/WRmsAetUo
 KIUr9YKWwMbWs0I08v0ipz2SXg0zw/YjNkaDji5dqDiAnc2Y0GMuwQgg1qzd9M9U7KYv
 6ePLL3RDozSwt6OW8qaIUVC4uZFQMCLgM69cKX+25ZSuwFvCEycJsTLFkTfxBXPXdRLe
 4DWw5NYfkX9AJbaGpcH/oml6S3EvL7R4eRINkqVqt/xd2X3nmW99bB/mjSQ31jb9QrAJ
 g2k16DbOmwwjSEOBgQ76RqayjE0BSGWGHKyCvgLyV2PNb9AIloGv2np+CocQ4ZXcvnau
 P/jQ==
X-Gm-Message-State: AOAM531WxbYtxrrJKKI+EqFQkaQVT+nl6tp5IjtkvQZsF7RVUEai9EE3
 rQc4iVuLQcLqFIvsPlIGUxYHEGnrcQIyyw==
X-Google-Smtp-Source: ABdhPJxCXJVh7Vdwd6Tt3uckEZi5JRMMr/RCoM8v0+V8NK0EYXAUce3ylghV/XiEWR27u57Tx5yrDg==
X-Received: by 2002:a17:90b:3004:: with SMTP id
 hg4mr11959654pjb.7.1600421472526; 
 Fri, 18 Sep 2020 02:31:12 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id cf7sm2258853pjb.52.2020.09.18.02.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:31:11 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/9] powerpc/eeh: Move EEH initialisation to an arch
 initcall
Date: Fri, 18 Sep 2020 19:30:46 +1000
Message-Id: <20200918093050.37344-5-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200918093050.37344-1-oohall@gmail.com>
References: <20200918093050.37344-1-oohall@gmail.com>
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
index 8b0fb6c8b8d9..6d95e774bded 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1703,4 +1703,4 @@ static int __init eeh_powernv_init(void)
 
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

