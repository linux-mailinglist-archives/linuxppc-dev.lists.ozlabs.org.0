Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690A2A3B9D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:02:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHht3WTYzDqDr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:02:38 +1100 (AEDT)
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
 header.s=20161025 header.b=EvPm3vF2; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH6G6sGYzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:36:06 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 13so13104570pfy.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCHzuMPZXrJObHdp0kUs4hoTBdSxkmby1XwHPOpSYxQ=;
 b=EvPm3vF25SEikHT+7cGWctpanOVcFWqdmq1z/rz2vQmMnJ+QtYqQHM9Fh9nWTov+uR
 juTNlI+HFqRlbyd5m+/rHzhwMvs0n4bYHu1/dYfps0BiKjkl3uESAYTA/bb+eZpqIkhr
 4ztYayQy+YBFjV0ZTaIr+3KxS/CBRKgezCretmdXs/oqdcwobRnTegrXA6F24qvp8btF
 8HUSu3Uy8qNz1MA64UJBS+xZMmp46EqegtekYNeh8b+8L+bO7kZXAXVLlcPTRxoJ8MiV
 DGyt35Mb7qvfnQHznmRrul3q1RpaXl5TFyv8xJO43GWr6f9sXG5xBQivPkzwv8fDuud0
 4odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCHzuMPZXrJObHdp0kUs4hoTBdSxkmby1XwHPOpSYxQ=;
 b=nSIMHOKy5z4jbDmF0hbf1Iomf6eUFarUVv2N6KX6a3GyWOMHUd6TGXi2gqi43wWcBO
 Jh6NMPzHi1f68f7b2dRqPEHiMdgTdDfWU7ekqmAyBbjosvUyySbgUZCA4EBjZmZ62X3n
 JV+ox0bHJJN75UPzlHw0Pz53961HMnv2umvAU01p/xCc9hPbH7ORliPB7dfRvCxpT1SD
 JUWQ+HbdcA7ADZ+SibeqBLMIbqMRYrHjk6TQgyRpF7BadvCrEw0aMhVRMmMNEteCWzoy
 mG7FiVNKKIS1mHPkMDnrGqPRtobxmeDA+vHKkkSAKD6/3XHikig4c9teYyax7aDX4ehu
 EF3g==
X-Gm-Message-State: AOAM532N65LXHEE7mAh8MJSFXCYVbJ3nCSrfYfKYgSrpw1TCvTpXo3X3
 2SMgERvJdCBqkbxbi4YecDplNOjPMV4=
X-Google-Smtp-Source: ABdhPJzNT8My+Hm7nf6QKrm3ToACsXNNia0JPhW/+3kxfDctO5P/KLP5neK2Qyymbx08NZm03aQmWg==
X-Received: by 2002:a62:5253:0:b029:18a:b277:6be2 with SMTP id
 g80-20020a6252530000b029018ab2776be2mr13264719pfb.0.1604378164620; 
 Mon, 02 Nov 2020 20:36:04 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:36:04 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/18] powerpc/embedded6xx/mpc7448: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:20 +1100
Message-Id: <20201103043523.916109-15-oohall@gmail.com>
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

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
compile tested with mpc7448_hpc2_defconfig
---
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index b95c3380d2b5..5565647dc879 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -58,16 +58,14 @@ int mpc7448_hpc2_exclude_device(struct pci_controller *hose,
 		return PCIBIOS_SUCCESSFUL;
 }
 
-static void __init mpc7448_hpc2_setup_arch(void)
+static void __init mpc7448_hpc2_setup_pci(void)
 {
+#ifdef CONFIG_PCI
 	struct device_node *np;
 	if (ppc_md.progress)
-		ppc_md.progress("mpc7448_hpc2_setup_arch():set_bridge", 0);
-
-	tsi108_csr_vir_base = get_vir_csrbase();
+		ppc_md.progress("mpc7448_hpc2_setup_pci():set_bridge", 0);
 
 	/* setup PCI host bridge */
-#ifdef CONFIG_PCI
 	for_each_compatible_node(np, "pci", "tsi108-pci")
 		tsi108_setup_pci(np, MPC7448HPC2_PCI_CFG_PHYS, 0);
 
@@ -75,6 +73,11 @@ static void __init mpc7448_hpc2_setup_arch(void)
 	if (ppc_md.progress)
 		ppc_md.progress("tsi108: resources set", 0x100);
 #endif
+}
+
+static void __init mpc7448_hpc2_setup_arch(void)
+{
+	tsi108_csr_vir_base = get_vir_csrbase();
 
 	printk(KERN_INFO "MPC7448HPC2 (TAIGA) Platform\n");
 	printk(KERN_INFO
@@ -181,6 +184,7 @@ define_machine(mpc7448_hpc2){
 	.name 			= "MPC7448 HPC2",
 	.probe 			= mpc7448_hpc2_probe,
 	.setup_arch 		= mpc7448_hpc2_setup_arch,
+	.discover_phbs		= mpc7448_hpc2_setup_pci,
 	.init_IRQ 		= mpc7448_hpc2_init_IRQ,
 	.show_cpuinfo 		= mpc7448_hpc2_show_cpuinfo,
 	.get_irq 		= mpic_get_irq,
-- 
2.26.2

