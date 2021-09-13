Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E3409746
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 17:28:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7Vjf1GNcz2ypP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 01:28:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iEd1ch44;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iEd1ch44; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Vhz6dqfz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 01:27:30 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so293967pji.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/tK5hxsL9MKG9mZXvZLPwX/0laXRMWVr+vDqTQ0On9o=;
 b=iEd1ch44ADvzc7AnSXEjexg63fNl59NQecaaBa7kfUyi1h02BdQhzwcYN+6iOd8chn
 9dgRf9MHYUvc1s484FH+SSqSqKZatgQwWf3Jgc5oJZfA1F2BQxXc+JO7zNWD0cirggxM
 Y5R1LvVJZPZGdeRXa1ClwM7Lh4A7NyYB8I3JEfXmZncIz1RBrq2A/t/0ASSRuqrEEunJ
 42rYEjeaUuaP962e1+M0wknqwHkctOePV8yJdk2alrbwl0hjNQ0WKJOI0AJY9C8nuhPS
 4dUqYTpZ4mN0Ig2t4FTU8pqRo+S8DzrzU6z0lF1SDUiigSVIOxr+zo0PvVc/8hBxxGIA
 vt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/tK5hxsL9MKG9mZXvZLPwX/0laXRMWVr+vDqTQ0On9o=;
 b=anizpe9LC1h6czxUksKPQP3Xlvc5zs9HtPrS+P42adlqVMIL1lvm080vNiaIy3UetK
 oYj/n8GEY16qnPRQvAPnQXMlAj9V5HT1pCBR9ADIH7b3BLkubj5WFWZjVXWkeJCQWHUy
 jjFivz7tDfjcVmZ/ydv09iYbpx0kS0m+ShNw3jqUOENPLdGVqZ7sLHAg68DZ7rZZRDlv
 nT8OE7LmlvzgR6YfNOHllOzB4O+KZ4QsAE5/IggznJne2PWfQ9vwE9NnitGC5EnciUgs
 tRR4Sfy/FzbkkIPmMsMjt8uYEXeA1Li28v6Sueu1+/Du/PYZnpkty7KE4o/mgdKLc+OY
 5rxA==
X-Gm-Message-State: AOAM531KoiYilW6JxhVLb9ejMAr4HbXnA09xuicKxV3wOw21YWxls6c0
 ue7bwLTuRP3eox5Nip/xszI=
X-Google-Smtp-Source: ABdhPJxKLqjOhkuORNZ3Up/yYXp3q7+GN3+gwvIWOUw2ecMs6Sg+9n/SUtp6aa6IAYZEAQhfuXcoRQ==
X-Received: by 2002:a17:90b:3b84:: with SMTP id
 pc4mr54776pjb.220.1631546846505; 
 Mon, 13 Sep 2021 08:27:26 -0700 (PDT)
Received: from localhost.localdomain (14-200-52-220.static.tpgi.com.au.
 [14.200.52.220])
 by smtp.gmail.com with ESMTPSA id k127sm7597875pfd.1.2021.09.13.08.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 08:27:26 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: Michal Simek <monstr@monstr.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] pci: Rename pcibios_add_device to match
Date: Tue, 14 Sep 2021 01:27:08 +1000
Message-Id: <20210913152709.48013-1-oohall@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-s390@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The general convention for pcibios_* hooks is that they're named after
the corresponding pci_* function they provide a hook for. The exception
is pcibios_add_device() which provides a hook for pci_device_add(). This
has been irritating me for years so rename it.

Also, remove the export of the microblaze version. The only caller
must be compiled as a built-in so there's no reason for the export.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/microblaze/pci/pci-common.c           | 3 +--
 arch/powerpc/kernel/pci-common.c           | 2 +-
 arch/powerpc/platforms/powernv/pci-sriov.c | 2 +-
 arch/s390/pci/pci.c                        | 2 +-
 arch/sparc/kernel/pci.c                    | 2 +-
 arch/x86/pci/common.c                      | 2 +-
 drivers/pci/pci.c                          | 4 ++--
 drivers/pci/probe.c                        | 4 ++--
 include/linux/pci.h                        | 2 +-
 9 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/microblaze/pci/pci-common.c b/arch/microblaze/pci/pci-common.c
index 557585f1be41..622a4867f9e9 100644
--- a/arch/microblaze/pci/pci-common.c
+++ b/arch/microblaze/pci/pci-common.c
@@ -587,13 +587,12 @@ static void pcibios_fixup_resources(struct pci_dev *dev)
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pcibios_fixup_resources);
 
-int pcibios_add_device(struct pci_dev *dev)
+int pcibios_device_add(struct pci_dev *dev)
 {
 	dev->irq = of_irq_parse_and_map_pci(dev, 0, 0);
 
 	return 0;
 }
-EXPORT_SYMBOL(pcibios_add_device);
 
 /*
  * Reparent resource children of pr that conflict with res
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index c3573430919d..6749905932f4 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1059,7 +1059,7 @@ void pcibios_bus_add_device(struct pci_dev *dev)
 		ppc_md.pcibios_bus_add_device(dev);
 }
 
-int pcibios_add_device(struct pci_dev *dev)
+int pcibios_device_add(struct pci_dev *dev)
 {
 	struct irq_domain *d;
 
diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 28aac933a439..486c2937b159 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -54,7 +54,7 @@
  * to "new_size", calculated above. Implementing this is a convoluted process
  * which requires several hooks in the PCI core:
  *
- * 1. In pcibios_add_device() we call pnv_pci_ioda_fixup_iov().
+ * 1. In pcibios_device_add() we call pnv_pci_ioda_fixup_iov().
  *
  *    At this point the device has been probed and the device's BARs are sized,
  *    but no resource allocations have been done. The SR-IOV BARs are sized
diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
index e7e6788d75a8..ded3321b7208 100644
--- a/arch/s390/pci/pci.c
+++ b/arch/s390/pci/pci.c
@@ -561,7 +561,7 @@ static void zpci_cleanup_bus_resources(struct zpci_dev *zdev)
 	zdev->has_resources = 0;
 }
 
-int pcibios_add_device(struct pci_dev *pdev)
+int pcibios_device_add(struct pci_dev *pdev)
 {
 	struct zpci_dev *zdev = to_zpci(pdev);
 	struct resource *res;
diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index 9c2b720bfd20..31b0c1983286 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -1010,7 +1010,7 @@ void pcibios_set_master(struct pci_dev *dev)
 }
 
 #ifdef CONFIG_PCI_IOV
-int pcibios_add_device(struct pci_dev *dev)
+int pcibios_device_add(struct pci_dev *dev)
 {
 	struct pci_dev *pdev;
 
diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
index 3507f456fcd0..9e1e6b8d8876 100644
--- a/arch/x86/pci/common.c
+++ b/arch/x86/pci/common.c
@@ -632,7 +632,7 @@ static void set_dev_domain_options(struct pci_dev *pdev)
 		pdev->hotplug_user_indicators = 1;
 }
 
-int pcibios_add_device(struct pci_dev *dev)
+int pcibios_device_add(struct pci_dev *dev)
 {
 	struct pci_setup_rom *rom;
 	struct irq_domain *msidom;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ce2ab62b64cf..c63598c1cdd8 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2091,14 +2091,14 @@ void pcim_pin_device(struct pci_dev *pdev)
 EXPORT_SYMBOL(pcim_pin_device);
 
 /*
- * pcibios_add_device - provide arch specific hooks when adding device dev
+ * pcibios_device_add - provide arch specific hooks when adding device dev
  * @dev: the PCI device being added
  *
  * Permits the platform to provide architecture specific functionality when
  * devices are added. This is the default implementation. Architecture
  * implementations can override this.
  */
-int __weak pcibios_add_device(struct pci_dev *dev)
+int __weak pcibios_device_add(struct pci_dev *dev)
 {
 	return 0;
 }
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index d9fc02a71baa..2ba43b6adf31 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2450,7 +2450,7 @@ static struct irq_domain *pci_dev_msi_domain(struct pci_dev *dev)
 	struct irq_domain *d;
 
 	/*
-	 * If a domain has been set through the pcibios_add_device()
+	 * If a domain has been set through the pcibios_device_add()
 	 * callback, then this is the one (platform code knows best).
 	 */
 	d = dev_get_msi_domain(&dev->dev);
@@ -2518,7 +2518,7 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	list_add_tail(&dev->bus_list, &bus->devices);
 	up_write(&pci_bus_sem);
 
-	ret = pcibios_add_device(dev);
+	ret = pcibios_device_add(dev);
 	WARN_ON(ret < 0);
 
 	/* Set up MSI IRQ domain */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index cd8aa6fce204..7e0ce3a4d5a1 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2126,7 +2126,7 @@ void pcibios_disable_device(struct pci_dev *dev);
 void pcibios_set_master(struct pci_dev *dev);
 int pcibios_set_pcie_reset_state(struct pci_dev *dev,
 				 enum pcie_reset_state state);
-int pcibios_add_device(struct pci_dev *dev);
+int pcibios_device_add(struct pci_dev *dev);
 void pcibios_release_device(struct pci_dev *dev);
 #ifdef CONFIG_PCI
 void pcibios_penalize_isa_irq(int irq, int active);
-- 
2.31.1

