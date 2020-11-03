Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5662A3B73
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:39:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHB85l0dzDq7F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:39:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hf1IB78L; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH5q1cwjzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:41 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id f21so7967076plr.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WWQy/KGpQazwEdkBoXJDExW1MCb5ecC1N581bBUcpKY=;
 b=Hf1IB78Llrn2jHIxERu9ZAwC2jQ9/A4gsm16MfBeBrrK3QZ2YNl+CyH+Wi5Jv1xac7
 zAAbTg0FhEbuGXkWdyDJMvcfB57m69+UMm1IVVddrRcL9sHI5pNtd5VolQkNklshuQ37
 ru1fJmU5/eRvtEd/Qtod7ENcj7IFa+TbUu1WY2qOU4SQS4GUjvgbStgWP9RDPvk+AbZ4
 HnrfdR9WWnPTp60PZFBSTdmPmxocfMui+unK5a17F0g76iaDNgEj3tRVp387ZSLvtUSM
 9GcK0eMrKgfWl+azgq1JBY+hI4YtaYNGvXqXJkqNliarJgrT116CQBB0Nae9zWlgbqOU
 NF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWQy/KGpQazwEdkBoXJDExW1MCb5ecC1N581bBUcpKY=;
 b=tSoyXL7K6eVPU4PdQq/YAfJivFHJ4nTJzm6K6xnM6e1ilMkKGTq0gmw7uMI6OgQTbs
 IaRgPnEeaAyukM/S2ubsXzcyf/tEpwb4EJJ2wCYTKz17xMbDVlAdzvvXDmYeK1ncU3TZ
 cRsivFL6yNMq/5ozzazJhNPtQwZZtWE5bJsNywNg4zKXBOVrTDS81+SqlNolHWyQYb8B
 7ctcVRrikunr37PW/Ql3f+eh2CBr7XTVN4onKwzysBSouDAQDYEJCyeGRgUUlhncneXZ
 2lSnqlslXB0mbi13/OLsH5e6DDxmJBJIg6HXiyaQZ1MY9FapgscdlXkoWAtirkmhs6r4
 z3MQ==
X-Gm-Message-State: AOAM531SEZvA95wmFTEdDxfG7nVa6SMQC5MX2rCotRnHJjw6kQp55Qb8
 +kY1QL3lLURmkyrJPzjiqCY04ph7a44=
X-Google-Smtp-Source: ABdhPJyPW0mpxa0vKMcecTbbEuAQqb4YXagTI4+vImJUHJZuHZe9Pcdy2H89TxHjdYIMin8Nah4rbQ==
X-Received: by 2002:a17:902:bc82:b029:d6:4ee5:87d0 with SMTP id
 bb2-20020a170902bc82b02900d64ee587d0mr23409710plb.40.1604378138304; 
 Mon, 02 Nov 2020 20:35:38 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:37 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/18] powerpc/{powernv,pseries}: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:07 +1100
Message-Id: <20201103043523.916109-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103043523.916109-1-oohall@gmail.com>
References: <20201103043523.916109-1-oohall@gmail.com>
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
index 2b4ceb5e6ce4..d6815f03fee3 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3176,6 +3176,9 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	/* Remove M64 resource if we can't configure it successfully */
 	if (!phb->init_m64 || phb->init_m64(phb))
 		hose->mem_resources[1].flags = 0;
+
+	/* create pci_dn's for DT nodes under this PHB */
+	pci_devs_phb_init_dynamic(hose);
 }
 
 void __init pnv_pci_init_ioda2_phb(struct device_node *np)
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 9acaa0f131b9..92f5fa827909 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -162,9 +162,6 @@ static void __init pnv_setup_arch(void)
 	/* Initialize SMP */
 	pnv_smp_init();
 
-	/* Setup PCI */
-	pnv_pci_init();
-
 	/* Setup RTC and NVRAM callbacks */
 	if (firmware_has_feature(FW_FEATURE_OPAL))
 		opal_nvram_init();
@@ -524,6 +521,7 @@ define_machine(powernv) {
 	.init_IRQ		= pnv_init_IRQ,
 	.show_cpuinfo		= pnv_show_cpuinfo,
 	.get_proc_freq          = pnv_get_proc_freq,
+	.discover_phbs		= pnv_pci_init,
 	.progress		= pnv_progress,
 	.machine_shutdown	= pnv_shutdown,
 	.power_save             = NULL,
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 633c45ec406d..e88b30d4b6cd 100644
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
@@ -777,7 +780,6 @@ static void __init pSeries_setup_arch(void)
 
 	/* Find and initialize PCI host bridges */
 	init_pci_config_tokens();
-	find_and_init_phbs();
 	of_reconfig_notifier_register(&pci_dn_reconfig_nb);
 
 	pSeries_nvram_init();
@@ -1041,6 +1043,7 @@ define_machine(pseries) {
 	.init_IRQ		= pseries_init_irq,
 	.show_cpuinfo		= pSeries_show_cpuinfo,
 	.log_error		= pSeries_log_error,
+	.discover_phbs		= pSeries_discover_phbs,
 	.pcibios_fixup		= pSeries_final_fixup,
 	.restart		= rtas_restart,
 	.halt			= rtas_halt,
-- 
2.26.2

