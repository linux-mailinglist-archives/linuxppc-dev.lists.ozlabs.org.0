Return-Path: <linuxppc-dev+bounces-5768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15923A24DF8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2025 13:28:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ym87J1fVrz2yDr;
	Sun,  2 Feb 2025 23:28:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738499324;
	cv=none; b=P3bRqpUEKqSVvcK64Kb9O+mROo3XFwpLJnAzrZwuasM94QIKsGmlSn+I/nIAaU6P1bTGqY84sTT8+w6WwtzQI9YXthHToReUS3FyxzxKTG721IN4GgBTQzBtg/2ZPE8n6BQg32Je1Ec04+oXnTudHahFGbDgOsXg+KR2ROZOeVupxxhhe/3b9YYsei/wGFmXOj2/SiqomVIAdg01pP59xJ8vfALXATEU/emChHyaNP2ZyNvT9LJjkXKuayw0hM9WtaOEVib7rQUnL8Iow/mZdm0uTX3Z6oAQWx79ZUj431mBhwIMBCrHKgz/p1Uw7e8qb3MKoDQXc6gGXvQ66tc5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738499324; c=relaxed/relaxed;
	bh=6lwCesnsnz02y4sZuEe40Oem50Iv5vA/WP8hCw9xJ+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WhGBMZkjPPtK4wKvQk0FXUZu/Ay+YmHkcPYZdHCGu07WNb2qL3Q1xwoQGq7WAbX4w6+RgXBMcjAYslhgePdpXNmHRiwXJb07Vz1Z/cFZs1OEmxydrEowfH8UjQVQyTXgrkWIEbnU2xc4b0y+Ax7ZtI7kGQqWxpSEPkaRKTu3LNhWTGxgM6MqkYoZVJ2jNUzkjdH8xrJbXHKFw2/TlM9Us4r85BUkOFdbkiHcGrKVQ15Up627kHzAWEUDnARv6Mu7VLLvgN8kbDuQ6X8+M6sODXZ1YrqiJ2hhtC3RlGM5TjDa31v/+LxDtRWGtnKe9w87OaMb/PXO5/bCLP8lzlueYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=acfOpRHx; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=acfOpRHx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ym87G44qjz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2025 23:28:42 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-540201cfedbso3081284e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Feb 2025 04:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738499315; x=1739104115; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lwCesnsnz02y4sZuEe40Oem50Iv5vA/WP8hCw9xJ+c=;
        b=acfOpRHxsuG70KVkw3uaP+1iSObH+SLH1dwKznxrIvMSvmnL1kontMyoQKMkAlRufc
         jGwsw4mQDv/fPnjc7S/K9NTg8cOa+REEsdK9qoNkwDj7yIilbxF8SOatV7UGQxSJ9z69
         +VJu0zpBHJGU2MFm4NHOuOVeMN+QoXBFZfNkZC6jdF9F4e3MxChVhfPZptUjLrky/flW
         cBNwmz/yoQkXiANMtEHCfjTMbbRGeEVi1vUfoVpzzfsGOaffnmW1XndugxAnW+7ZwSnc
         AzWqmmvgUbnTItzF9btSiWIanXMdeL2GCz2Eg2abuPnIaGbgH8t//t+hcoubLLAWtXGB
         vA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738499315; x=1739104115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lwCesnsnz02y4sZuEe40Oem50Iv5vA/WP8hCw9xJ+c=;
        b=gcGQLnr13Th0dONNFo8L1hCSvLq5gJXiiPDa7Un7gi918iaJykhkWFPU4FhAjyJG4F
         LUSTD5ZhAGJj5LYj2HzK/ipyAjUQTKXgAv0jydKNP+sGJpr8iFZ4YKV4LR8cZPm0ycTc
         g6q0MiL+SQk9C/e/ogFsNy36YhJ86qm7eVH0CghKu/5e7nJxJ8sMU3pOhxIeCjQJDtKh
         v40UD7im1mio/+9uwBha21nG2dKb1zZWA+RKumhBa4vN4o+34d1EJ83jLP5EiqBrc7vb
         LO2Z3PKwGJQuG7aOUekI9QKUiF9A9dX+M9zmbwL4MjMSGSwhqMxsOA4w3cidoHQW+IkW
         klKw==
X-Gm-Message-State: AOJu0Yy+UKuUlwSNdrqOSNoLdNR6T9T7+vM3fkHtcOPYFj3C4m/dHNl+
	RHnWQ2WXIoml9WtfoX59PrCEQrDd/3Y2oO3wzPa6G2BD2jDndqHl4vi+/d+6iIo=
X-Gm-Gg: ASbGncto7YFw8nZk9QnK459QwWOJf2Et8f1NXE8iZgohSEFKCivHoAVLFOUjIeX1+p4
	uD4V3umX4Ue7Ns0tGisR5XpDBHbCkoMNhRaXU2mrZG0Aeib/u6LU+om+cA1NBFhekTw2hRyyrnD
	Ujj/Mtqc69SCU1FdJ+cwrDvSLDpUgMYkAwGvcpgQ0dxWH8lYekYVdRbLLWN1X6tiTbxnCFCtxuK
	3nyj+HuS0DtyoMRenyhR7TfM5jKbp5Y1RSltw1N46lHfijBbelC33itrMJjLjivwyfkIfUtVOJw
	4OQaAB4fnIfvmFB+tdh7zqM8euA6
X-Google-Smtp-Source: AGHT+IHo1gpOgNi38F2DeFo3GdMNU03XA4sWjoFJrC64wTGYVJA0h2sgRQjX4CRaq1VbnQjUJTjvug==
X-Received: by 2002:a05:6512:b8f:b0:542:2e04:edb4 with SMTP id 2adb3069b0e04-543e4be9c42mr4863056e87.13.1738499314862;
        Sun, 02 Feb 2025 04:28:34 -0800 (PST)
Received: from hydra-ppc64.kdaintranet ([83.217.203.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebeb3esm968104e87.220.2025.02.02.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:28:33 -0800 (PST)
From: Denis Kirjanov <kirjanov@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	Denis Kirjanov <kirjanov@gmail.com>
Subject: [PATCH] powerpc/powermac: replace KERN_INFO calls with pr_info
Date: Sun,  2 Feb 2025 07:28:03 -0500
Message-ID: <20250202122803.2566-1-kirjanov@gmail.com>
X-Mailer: git-send-email 2.47.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

pr_info makes code cleaner and simplifies syntax

Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
---
 arch/powerpc/platforms/powermac/feature.c |  8 ++++----
 arch/powerpc/platforms/powermac/low_i2c.c | 12 ++++++------
 arch/powerpc/platforms/powermac/pci.c     | 12 ++++++------
 arch/powerpc/platforms/powermac/pic.c     |  6 +++---
 arch/powerpc/platforms/powermac/setup.c   |  2 +-
 arch/powerpc/platforms/powermac/smp.c     | 12 ++++++------
 6 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 6365cea27abc..d3bcfe590384 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2527,7 +2527,7 @@ static int __init probe_motherboard(void)
 		pmac_mb.board_flags |= PMAC_MB_MOBILE;
 
 
-	printk(KERN_INFO "PowerMac motherboard: %s\n", pmac_mb.model_name);
+	pr_info("PowerMac motherboard: %s\n", pmac_mb.model_name);
 done:
 	of_node_put(dt);
 	return ret;
@@ -2574,11 +2574,11 @@ static void __init probe_uninorth(void)
 		}
 	}
 
-	printk(KERN_INFO "Found %s memory controller & host bridge"
+	pr_info("Found %s memory controller & host bridge"
 	       " @ 0x%08x revision: 0x%02x\n", uninorth_maj == 3 ? "U3" :
 	       uninorth_maj == 4 ? "U4" : "UniNorth",
 	       (unsigned int)res.start, uninorth_rev);
-	printk(KERN_INFO "Mapped at 0x%08lx\n", (unsigned long)uninorth_base);
+	pr_info("Mapped at 0x%08lx\n", (unsigned long)uninorth_base);
 
 	/* Set the arbitrer QAck delay according to what Apple does
 	 */
@@ -2664,7 +2664,7 @@ static void __init probe_one_macio(const char *name, const char *compat, int typ
 	revp = of_get_property(node, "revision-id", NULL);
 	if (revp)
 		macio_chips[i].rev = *revp;
-	printk(KERN_INFO "Found a %s mac-io controller, rev: %d, mapped at 0x%p\n",
+	pr_info("Found a %s mac-io controller, rev: %d, mapped at 0x%p\n",
 		macio_names[type], macio_chips[i].rev, macio_chips[i].base);
 
 	return;
diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index c097d591670e..fe38e6e0f8db 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -554,7 +554,7 @@ static struct pmac_i2c_host_kw *__init kw_i2c_host_init(struct device_node *np)
 			"keywest i2c", host))
 		host->irq = 0;
 
-	printk(KERN_INFO "KeyWest i2c @0x%08x irq %d %pOF\n",
+	pr_info("KeyWest i2c @0x%08x irq %d %pOF\n",
 	       *addrp, host->irq, np);
 
 	return host;
@@ -588,7 +588,7 @@ static void __init kw_i2c_add(struct pmac_i2c_host_kw *host,
 		bus->flags = pmac_i2c_multibus;
 	list_add(&bus->link, &pmac_i2c_busses);
 
-	printk(KERN_INFO " channel %d bus %s\n", channel,
+	pr_info(" channel %d bus %s\n", channel,
 	       (controller == busnode) ? "<multibus>" : busnode->full_name);
 }
 
@@ -793,7 +793,7 @@ static void __init pmu_i2c_probe(void)
 	if (busnode == NULL)
 		return;
 
-	printk(KERN_INFO "PMU i2c %pOF\n", busnode);
+	pr_info("PMU i2c %pOF\n", busnode);
 
 	/*
 	 * We add bus 1 and 2 only for now, bus 0 is "special"
@@ -817,7 +817,7 @@ static void __init pmu_i2c_probe(void)
 		bus->flags = pmac_i2c_multibus;
 		list_add(&bus->link, &pmac_i2c_busses);
 
-		printk(KERN_INFO " channel %d bus <multibus>\n", channel);
+		pr_info(" channel %d bus <multibus>\n", channel);
 	}
 }
 
@@ -909,7 +909,7 @@ static void __init smu_i2c_probe(void)
 	if (controller == NULL)
 		return;
 
-	printk(KERN_INFO "SMU i2c %pOF\n", controller);
+	pr_info("SMU i2c %pOF\n", controller);
 
 	/* Look for childs, note that they might not be of the right
 	 * type as older device trees mix i2c busses and other things
@@ -943,7 +943,7 @@ static void __init smu_i2c_probe(void)
 		bus->flags = 0;
 		list_add(&bus->link, &pmac_i2c_busses);
 
-		printk(KERN_INFO " channel %x bus %pOF\n",
+		pr_info(" channel %x bus %pOF\n",
 		       bus->channel, busnode);
 	}
 }
diff --git a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platforms/powermac/pci.c
index d71359b5331c..5404189866af 100644
--- a/arch/powerpc/platforms/powermac/pci.c
+++ b/arch/powerpc/platforms/powermac/pci.c
@@ -482,7 +482,7 @@ static void __init init_bandit(struct pci_controller *bp)
 	magic |= BANDIT_COHERENT;
 	udelay(2);
 	out_le32(bp->cfg_data, magic);
-	printk(KERN_INFO "Cache coherency enabled for bandit/PSX\n");
+	pr_info("Cache coherency enabled for bandit/PSX\n");
 }
 
 /*
@@ -814,7 +814,7 @@ static int __init pmac_add_bridge(struct device_node *dev)
 		disp_name = "U4-PCIE";
 		primary = 0;
 	}
-	printk(KERN_INFO "Found %s PCI host bridge.  Firmware bus number:"
+	pr_info("Found %s PCI host bridge.  Firmware bus number:"
 	       " %d->%d\n", disp_name, hose->first_busno, hose->last_busno);
 #endif /* CONFIG_PPC64 */
 
@@ -835,7 +835,7 @@ static int __init pmac_add_bridge(struct device_node *dev)
 		disp_name = "Chaos";
 		primary = 0;
 	}
-	printk(KERN_INFO "Found %s PCI host bridge at 0x%016llx. "
+	pr_info("Found %s PCI host bridge at 0x%016llx. "
 	       "Firmware bus number: %d->%d\n",
 		disp_name, (unsigned long long)rsrc.start, hose->first_busno,
 		hose->last_busno);
@@ -966,7 +966,7 @@ static bool pmac_pci_enable_device_hook(struct pci_dev *dev)
 	if (dev->vendor == PCI_VENDOR_ID_APPLE
 	    && dev->class == PCI_CLASS_SERIAL_USB_OHCI
 	    && !node) {
-		printk(KERN_INFO "Apple USB OHCI %s disabled by firmware\n",
+		pr_info("Apple USB OHCI %s disabled by firmware\n",
 		       pci_name(dev));
 		return false;
 	}
@@ -1122,7 +1122,7 @@ static void pmac_pci_fixup_pciata(struct pci_dev *dev)
  good:
 	pci_read_config_byte(dev, PCI_CLASS_PROG, &progif);
 	if ((progif & 5) != 5) {
-		printk(KERN_INFO "PCI: %s Forcing PCI IDE into native mode\n",
+		pr_info("PCI: %s Forcing PCI IDE into native mode\n",
 		       pci_name(dev));
 		(void) pci_write_config_byte(dev, PCI_CLASS_PROG, progif|5);
 		if (pci_read_config_byte(dev, PCI_CLASS_PROG, &progif) ||
@@ -1220,7 +1220,7 @@ static void fixup_u4_pcie(struct pci_dev* dev)
 		return;
 
 	/* Print things out */
-	printk(KERN_INFO "PCI: Fixup U4 PCIe bridge range: %pR\n", region);
+	pr_info("PCI: Fixup U4 PCIe bridge range: %pR\n", region);
 
 	/* Fixup bridge config space. We know it's a Mac, resource aren't
 	 * offset so let's just blast them as-is. We also know that they
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 2202bf77c7a3..c9a5326aae41 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -345,7 +345,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 			(addr + 0x10);
 	of_node_put(master);
 
-	printk(KERN_INFO "irq: Found primary Apple PIC %pOF for %d irqs\n",
+	pr_info("irq: Found primary Apple PIC %pOF for %d irqs\n",
 	       master, max_real_irqs);
 
 	/* Map interrupts of cascaded controller */
@@ -359,7 +359,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 				(addr + 0x10);
 		pmac_irq_cascade = irq_of_parse_and_map(slave, 0);
 
-		printk(KERN_INFO "irq: Found slave Apple PIC %pOF for %d irqs"
+		pr_info("irq: Found slave Apple PIC %pOF for %d irqs"
 		       " cascade: %d\n", slave,
 		       max_irqs - max_real_irqs, pmac_irq_cascade);
 	}
@@ -376,7 +376,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 			pr_err("Failed to register cascade interrupt\n");
 	}
 
-	printk(KERN_INFO "irq: System has %d possible interrupts\n", max_irqs);
+	pr_info("irq: System has %d possible interrupts\n", max_irqs);
 #ifdef CONFIG_XMON
 	i = irq_create_mapping(NULL, 20);
 	if (request_irq(i, xmon_irq, IRQF_NO_THREAD, "NMI - XMON", NULL))
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 6de1cd5d8a58..cb7d9f1db7fe 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -220,7 +220,7 @@ static void __init ohare_init(void)
 			else
 				sysctrl_regs[4] |= 0x04000000;
 			if(has_l2cache)
-				printk(KERN_INFO "Level 2 cache enabled\n");
+				pr_info("Level 2 cache enabled\n");
 		}
 	}
 }
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index ffd5bc96b92c..49843b6e88b3 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -602,7 +602,7 @@ static void __init smp_core99_setup_i2c_hwsync(int ncpus)
 			       " sync, fallback to software sync !\n");
 			goto no_i2c_sync;
 		}
-		printk(KERN_INFO "Processor timebase sync using %s i2c clock\n",
+		pr_info("Processor timebase sync using %s i2c clock\n",
 		       name);
 		return;
 	}
@@ -702,7 +702,7 @@ static void __init smp_core99_setup(int ncpus)
 		if (cpus &&
 		    of_property_read_bool(cpus, "platform-cpu-timebase")) {
 			pmac_tb_freeze = smp_core99_pfunc_tb_freeze;
-			printk(KERN_INFO "Processor timebase sync using"
+			pr_info("Processor timebase sync using"
 			       " platform function\n");
 		}
 		of_node_put(cpus);
@@ -724,7 +724,7 @@ static void __init smp_core99_setup(int ncpus)
 			of_node_put(cpu);
 		}
 		pmac_tb_freeze = smp_core99_gpio_tb_freeze;
-		printk(KERN_INFO "Processor timebase sync using"
+		pr_info("Processor timebase sync using"
 		       " GPIO 0x%02x\n", core99_tb_gpio);
 	}
 
@@ -734,7 +734,7 @@ static void __init smp_core99_setup(int ncpus)
 	if (pmac_tb_freeze == NULL) {
 		smp_ops->give_timebase = smp_generic_give_timebase;
 		smp_ops->take_timebase = smp_generic_take_timebase;
-		printk(KERN_INFO "Processor timebase sync using software\n");
+		pr_info("Processor timebase sync using software\n");
 	}
 
 #ifndef CONFIG_PPC64
@@ -763,7 +763,7 @@ static void __init smp_core99_probe(void)
 	for_each_node_by_type(cpus, "cpu")
 		++ncpus;
 
-	printk(KERN_INFO "PowerMac SMP probe found %d cpus\n", ncpus);
+	pr_info("PowerMac SMP probe found %d cpus\n", ncpus);
 
 	/* Nothing more to do if less than 2 of them */
 	if (ncpus <= 1)
@@ -940,7 +940,7 @@ static void pmac_cpu_offline_self(void)
 	 * on core99 platforms for now ...
 	 */
 
-	printk(KERN_INFO "CPU#%d offline\n", cpu);
+	pr_info("CPU#%d offline\n", cpu);
 	generic_set_cpu_dead(cpu);
 	smp_wmb();
 
-- 
2.47.2


