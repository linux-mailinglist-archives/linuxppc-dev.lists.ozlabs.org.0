Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA92150F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 03:44:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0SzY0FzGzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 11:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qD6wZDJc; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Spk6vgBzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 11:36:46 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id f18so40213982wml.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 18:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IUwEwi1BCJdFbs+YBJ2L3cMvcFFBqSpNC0dMznrucOg=;
 b=qD6wZDJcUGypoFmqF7GNIOfRnHXlWGwACVHF4JJPmOXdfXq5Z+FNZbuSTenPjaFFPz
 rhXWB60aHoC7AEkvf9MOcK1O7l2avipQvfyprqd7W5OsMLGY0mLh0l+Li4fj2XrBgltM
 /c4+4Zsj/eqFgk9V4gkhhofUwZQjHj6vhOxfeIznI/Sd08BihzFe63JUzI/+bDEKya8t
 f9XonDlB4ElWcoz8KVwaYC1/D4Lz/g+t7qdkHjz2J3MO5jxc4qrHKAHHb/FYTJgbogMo
 G83PAuMJTKS6fxN+cxx3iyNOCIMz1ELvJPGRHLVnkB/Kww3YNQDdIOlZ649KX165xqAW
 lFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IUwEwi1BCJdFbs+YBJ2L3cMvcFFBqSpNC0dMznrucOg=;
 b=TutUjsla1y53ao/UOqmDaYhO9p/kFPoFC80PoBn/fe2SpC+quqdIHA0QiPKvjUlU+c
 jf8sLfImYvBcilSEWk0bxqzmbcc+2usJtioDwRU2HIHxYYt08djYqYWcoqGm6T9LUwyP
 ZZCOPvGlSNzhTk5vJNJmPndrC785BfP5NuczUeIRdm7hmyyGQPaahywKxbJufJbbxUD2
 60kGwaNQLSH+htMQYi8O30/3VTnquXyFAwtbyH5nqwdQoc/VJf2D4ymWRkvyVOYNI34n
 O/8sliFh5r9gvxm5NfnFZT4pT8S9mgeZMdrZIN1tK5RYE8MjTo5DF1rrtjAau1aAdUIo
 OCqw==
X-Gm-Message-State: AOAM532N823bkam0ny8WbFHR98yN9q0NBfvNtMIhXfFEaS3OpZyJQMz5
 fieiVZZMkg18Tsv2Hz2+YNQ3Iuo949E=
X-Google-Smtp-Source: ABdhPJzdTIGCcnr+Bz+R84sBYiQexK1Uclb/bSyPHK/KIi07qk7coDSHzPkmfYKx+0W+dXTKEbeO0w==
X-Received: by 2002:a1c:b686:: with SMTP id
 g128mr48817457wmf.145.1593999403306; 
 Sun, 05 Jul 2020 18:36:43 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au (59-102-73-59.tpgi.com.au.
 [59.102.73.59])
 by smtp.gmail.com with ESMTPSA id v6sm9533392wrr.85.2020.07.05.18.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:36:42 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/14] powerpc/eeh: Remove eeh_dev.c
Date: Mon,  6 Jul 2020 11:36:07 +1000
Message-Id: <20200706013619.459420-3-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200706013619.459420-1-oohall@gmail.com>
References: <20200706013619.459420-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only thing in this file is eeh_dev_init() which is allocates and
initialises an eeh_dev based on a pci_dn. This is only ever called from
pci_dn.c so move it into there and remove the file.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h |  6 ----
 arch/powerpc/kernel/Makefile   |  2 +-
 arch/powerpc/kernel/eeh_dev.c  | 54 ----------------------------------
 arch/powerpc/kernel/pci_dn.c   | 20 +++++++++++++
 4 files changed, 21 insertions(+), 61 deletions(-)
 delete mode 100644 arch/powerpc/kernel/eeh_dev.c

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 646307481493..e22881a0c415 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -293,7 +293,6 @@ void eeh_pe_restore_bars(struct eeh_pe *pe);
 const char *eeh_pe_loc_get(struct eeh_pe *pe);
 struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
 
-struct eeh_dev *eeh_dev_init(struct pci_dn *pdn);
 void eeh_show_enabled(void);
 int __init eeh_ops_register(struct eeh_ops *ops);
 int __exit eeh_ops_unregister(const char *name);
@@ -339,11 +338,6 @@ static inline bool eeh_enabled(void)
 
 static inline void eeh_show_enabled(void) { }
 
-static inline void *eeh_dev_init(struct pci_dn *pdn, void *data)
-{
-	return NULL;
-}
-
 static inline void eeh_dev_phb_init_dynamic(struct pci_controller *phb) { }
 
 static inline int eeh_check_failure(const volatile void __iomem *token)
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 244542ae2a91..c5211bdcf1b6 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -71,7 +71,7 @@ obj-$(CONFIG_PPC_RTAS_DAEMON)	+= rtasd.o
 obj-$(CONFIG_RTAS_FLASH)	+= rtas_flash.o
 obj-$(CONFIG_RTAS_PROC)		+= rtas-proc.o
 obj-$(CONFIG_PPC_DT_CPU_FTRS)	+= dt_cpu_ftrs.o
-obj-$(CONFIG_EEH)              += eeh.o eeh_pe.o eeh_dev.o eeh_cache.o \
+obj-$(CONFIG_EEH)              += eeh.o eeh_pe.o eeh_cache.o \
 				  eeh_driver.o eeh_event.o eeh_sysfs.o
 obj-$(CONFIG_GENERIC_TBSYNC)	+= smp-tbsync.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
diff --git a/arch/powerpc/kernel/eeh_dev.c b/arch/powerpc/kernel/eeh_dev.c
deleted file mode 100644
index 8e159a12f10c..000000000000
--- a/arch/powerpc/kernel/eeh_dev.c
+++ /dev/null
@@ -1,54 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * The file intends to implement dynamic creation of EEH device, which will
- * be bound with OF node and PCI device simutaneously. The EEH devices would
- * be foundamental information for EEH core components to work proerly. Besides,
- * We have to support multiple situations where dynamic creation of EEH device
- * is required:
- *
- * 1) Before PCI emunation starts, we need create EEH devices according to the
- *    PCI sensitive OF nodes.
- * 2) When PCI emunation is done, we need do the binding between PCI device and
- *    the associated EEH device.
- * 3) DR (Dynamic Reconfiguration) would create PCI sensitive OF node. EEH device
- *    will be created while PCI sensitive OF node is detected from DR.
- * 4) PCI hotplug needs redoing the binding between PCI device and EEH device. If
- *    PHB is newly inserted, we also need create EEH devices accordingly.
- *
- * Copyright Benjamin Herrenschmidt & Gavin Shan, IBM Corporation 2012.
- */
-
-#include <linux/export.h>
-#include <linux/gfp.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/string.h>
-
-#include <asm/pci-bridge.h>
-#include <asm/ppc-pci.h>
-
-/**
- * eeh_dev_init - Create EEH device according to OF node
- * @pdn: PCI device node
- *
- * It will create EEH device according to the given OF node. The function
- * might be called by PCI emunation, DR, PHB hotplug.
- */
-struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
-{
-	struct eeh_dev *edev;
-
-	/* Allocate EEH device */
-	edev = kzalloc(sizeof(*edev), GFP_KERNEL);
-	if (!edev)
-		return NULL;
-
-	/* Associate EEH device with OF node */
-	pdn->edev = edev;
-	edev->pdn = pdn;
-	edev->bdfn = (pdn->busno << 8) | pdn->devfn;
-	edev->controller = pdn->phb;
-
-	return edev;
-}
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 4e654df55969..f790a8d06f50 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -124,6 +124,26 @@ struct pci_dn *pci_get_pdn(struct pci_dev *pdev)
 	return NULL;
 }
 
+#ifdef CONFIG_EEH
+static struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
+{
+	struct eeh_dev *edev;
+
+	/* Allocate EEH device */
+	edev = kzalloc(sizeof(*edev), GFP_KERNEL);
+	if (!edev)
+		return NULL;
+
+	/* Associate EEH device with OF node */
+	pdn->edev = edev;
+	edev->pdn = pdn;
+	edev->bdfn = (pdn->busno << 8) | pdn->devfn;
+	edev->controller = pdn->phb;
+
+	return edev;
+}
+#endif /* CONFIG_EEH */
+
 #ifdef CONFIG_PCI_IOV
 static struct pci_dn *add_one_sriov_vf_pdn(struct pci_dn *parent,
 					   int vf_index,
-- 
2.26.2

