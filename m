Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E21276929
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 08:42:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxlpl1gvkzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 16:42:39 +1000 (AEST)
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
 header.s=20161025 header.b=mAxjhWMM; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxlk74ZhKzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:38:39 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id d9so1292338pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cdtzpyUkbWQDw2GmzVp1fBCkWNF6lLAstzuR4qPS42Q=;
 b=mAxjhWMM4p3EEOx2ZRTjSuz8ijPnwcuHFXSxh/s78zSnwIBYnjaxS0V7Wk8ner+/sL
 IkzE6iiWqwdK8AiwaeizAM5EB9KNwNA2b9KgywTOyzTFAUHlDRAoQHHTFl5x0Oa3wAG4
 tDKvbQqYBgbGW0N837sBH5N1jYJzv9pF3tO9rIp5g2cb57VkvwMRQzGLbuESruBhtDLC
 tg0PtRolbzkDFdF11lDmHyQZ5tQ4RbugGwhBgK+R1j7DcXvP8ok8szNsQYr4AupU1CjQ
 zoR0121DUmp1wv/pUC0q1bsKojmN9xhmBqUwQ3hUAkXJZrNtjEEP3fVHLpik1/3rRBWC
 q5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cdtzpyUkbWQDw2GmzVp1fBCkWNF6lLAstzuR4qPS42Q=;
 b=W1Wm2WRf0yRUMiXcDT6P7sIcU/+YcvntSitI9QhjolJy4JbIA5JYRhRFW9HHteIZKW
 7wNWUcxDBa8Q6KS6m/nlNEBuJCWn+s8j94ApMvC2lbJjz6+AKvAxoXZZ1SRN91mxT73c
 32fQRkrADiJdze7rbXIXbPCXFxWi0quJELSpOvFFxJRYHzj51Bc9LRENNB/N7okjo6BJ
 z4IQ2zFg4RKU0oVjhk/1OFdv9R7/O2AYGDGknGnzNqsiajL7CEVdybUnfXMjnBZw2iHH
 T+y1lbhn9AkxAvGp9CS4nQtZjYhb9QISraYy6yrdTgpHHIkzOlge5CSQyIgplnWv+uUd
 zILA==
X-Gm-Message-State: AOAM533jK5trSjUEf0XDFEUaQXs5m2RPNYVxlGMOXUYhcLLx7nOtezZD
 KgdwB8LuuDtn06K54ipKUfkb/daFdmj20w==
X-Google-Smtp-Source: ABdhPJwl8Lc0Pq68smuotyXWUrY7mm1Tq83gCx39a6jdOpaLSvOqpbSoPG1RlXwq5/+k+9uYaUnL8Q==
X-Received: by 2002:a63:1e03:: with SMTP id e3mr2792992pge.69.1600929516703;
 Wed, 23 Sep 2020 23:38:36 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:36 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 02/18] powerpc/{powernv,pseries}: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:03 +1000
Message-Id: <20200924063819.262830-2-oohall@gmail.com>
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

Make powernv and pseries use ppc_mc.discover_phbs. These two platforms need
to be done together because they both depends on pci_dn's being created
from the DT. The pci_dn contains a pointer to the relevant pci_controller
so they need to be created after the pci_controller structures are
available, but before  and before PCI devices are scanned. Currently this
ordering is provided by initcalls and the sequence is:

1. PHBs are discovered (setup_arch) (early boot, pre-initcalls)
2. pci_dn are created from the unflattended DT (core initcall)
3. PHBs are scanned pcibios_init() (subsys initcall)

The new ppc_md.discover_phbs() function is also a core_initcall so we can't
guarantee ordering between the creations of pci_controllers and the
creation of pci_dn's which require a pci_controller. We could use the
postcore, or core_sync initcall levels, but it's cleaner to just move the
pci_dn setup into the per-PHB inits which occur inside of .discover_phb()
for these platforms. This brings the boot-time path in line with the PHB
hotplug path that is used for pseries DLPAR operations too.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/pci_dn.c              | 22 ----------------------
 arch/powerpc/platforms/powernv/pci-ioda.c |  3 +++
 arch/powerpc/platforms/powernv/setup.c    |  4 +---
 arch/powerpc/platforms/pseries/setup.c    |  7 +++++--
 4 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 54e240597fd9..61571ae23953 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -481,28 +481,6 @@ void pci_devs_phb_init_dynamic(struct pci_controller *phb)
 	pci_traverse_device_nodes(dn, add_pdn, phb);
 }
 
-/** 
- * pci_devs_phb_init - Initialize phbs and pci devs under them.
- * 
- * This routine walks over all phb's (pci-host bridges) on the
- * system, and sets up assorted pci-related structures 
- * (including pci info in the device node structs) for each
- * pci device found underneath.  This routine runs once,
- * early in the boot sequence.
- */
-static int __init pci_devs_phb_init(void)
-{
-	struct pci_controller *phb, *tmp;
-
-	/* This must be done first so the device nodes have valid pci info! */
-	list_for_each_entry_safe(phb, tmp, &hose_list, list_node)
-		pci_devs_phb_init_dynamic(phb);
-
-	return 0;
-}
-
-core_initcall(pci_devs_phb_init);
-
 static void pci_dev_pdn_setup(struct pci_dev *pdev)
 {
 	struct pci_dn *pdn;
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 023a4f987bb2..987654a08e2e 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3184,6 +3184,9 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	/* Remove M64 resource if we can't configure it successfully */
 	if (!phb->init_m64 || phb->init_m64(phb))
 		hose->mem_resources[1].flags = 0;
+
+	/* create pci_dn's for DT nodes under this PHB */
+	pci_devs_phb_init_dynamic(hose);
 }
 
 void __init pnv_pci_init_ioda2_phb(struct device_node *np)
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 7fcb88623081..a4d6d41b1155 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -140,9 +140,6 @@ static void __init pnv_setup_arch(void)
 	/* Initialize SMP */
 	pnv_smp_init();
 
-	/* Setup PCI */
-	pnv_pci_init();
-
 	/* Setup RTC and NVRAM callbacks */
 	if (firmware_has_feature(FW_FEATURE_OPAL))
 		opal_nvram_init();
@@ -500,6 +497,7 @@ define_machine(powernv) {
 	.init_IRQ		= pnv_init_IRQ,
 	.show_cpuinfo		= pnv_show_cpuinfo,
 	.get_proc_freq          = pnv_get_proc_freq,
+	.discover_phbs		= pnv_pci_init,
 	.progress		= pnv_progress,
 	.machine_shutdown	= pnv_shutdown,
 	.power_save             = NULL,
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 2f4ee0a90284..d0bf487fadf5 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -463,7 +463,7 @@ void pseries_little_endian_exceptions(void)
 }
 #endif
 
-static void __init find_and_init_phbs(void)
+static void __init pSeries_discover_phbs(void)
 {
 	struct device_node *node;
 	struct pci_controller *phb;
@@ -481,6 +481,9 @@ static void __init find_and_init_phbs(void)
 		pci_process_bridge_OF_ranges(phb, node, 0);
 		isa_bridge_find_early(phb);
 		phb->controller_ops = pseries_pci_controller_ops;
+
+		/* create pci_dn's for DT nodes under this PHB */
+		pci_devs_phb_init_dynamic(phb);
 	}
 
 	of_node_put(root);
@@ -771,7 +774,6 @@ static void __init pSeries_setup_arch(void)
 
 	/* Find and initialize PCI host bridges */
 	init_pci_config_tokens();
-	find_and_init_phbs();
 	of_reconfig_notifier_register(&pci_dn_reconfig_nb);
 
 	pSeries_nvram_init();
@@ -1035,6 +1037,7 @@ define_machine(pseries) {
 	.init_IRQ		= pseries_init_irq,
 	.show_cpuinfo		= pSeries_show_cpuinfo,
 	.log_error		= pSeries_log_error,
+	.discover_phbs		= pSeries_discover_phbs,
 	.pcibios_fixup		= pSeries_final_fixup,
 	.restart		= rtas_restart,
 	.halt			= rtas_halt,
-- 
2.26.2

