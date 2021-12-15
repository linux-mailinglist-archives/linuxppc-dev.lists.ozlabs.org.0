Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07287476BB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4gv639vz3dys
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:16:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fywgu/D8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fywgu/D8; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgK52Wldz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:29 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id d21so13167327qkl.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5gYEEpCy4wlum+HgbLQqvmrtBqTNHvuSMoW8rRM0KnA=;
 b=fywgu/D8ZpK5Rmwe2aLBsIhFKznnJElgyZaTG9ouTrX8CE5xYP8QrYZotFZYHD0hsR
 xFADaI73NoldMvO+BC9/o5R0E+Ym/4ipX9Rrb8YrUvEPjh7KJXrOvDka/O2TxfCmyPH9
 JpS5NsYOxAjVjl3pFQmCz84Pf3PTP9uRmNf+UJjVnidgywmLCsLvewDLAH43b2yS9hCY
 4EFbybk6TNiIq4HbEFTkBKv7KxUAtujvZzi3v/q4RfNSBnwhfHhxLRI/e+fG5L8fZdR1
 G6Tq791oM2focYxSdG2yk5tCG1AIG0iL7ZssaQjK+oGoMVy7ocN/ygxbieKkDFeKIQJz
 Wq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5gYEEpCy4wlum+HgbLQqvmrtBqTNHvuSMoW8rRM0KnA=;
 b=KMD/OWZlZvA+a5npnM8FIcs+Xc9XRmgRnrLNBAWNA+2RDyQ+wYFWaJ0vnBdjS8O92m
 Ea3C9CMhyYYOfecl3YaDEapebs2FKidbCeI4NbAsoQsb8lk2Lt4gCs12ozGO1A0/JJl8
 Px48YakqaGwi3em3mPk46W9FPhefLJOS48k3B67WuAC67JA+MucH7aogImtr3pbTXKA8
 h5fnsYSIAxke0uNxhEl0KneFcv0+BDsfDo8Fw1sd2WE7F+Q4T2e/5w4oRzeqJaSGFEui
 2+KcxacfLraJME1HlP7c6Q6CofDBHNKRyT8QD9GBQN9hJ8ZucY5c9O4cZ1XQBNaf+8cv
 Re5Q==
X-Gm-Message-State: AOAM533/BNzgWycjFRolVr8vDxR9LO64u+x9NLfY2CYfbW/2/Fc8aCdv
 OB8kj3CZYrcA4gi/dqwRswOPWt22luo=
X-Google-Smtp-Source: ABdhPJycu7D/iV1zsBqsmm5P8yLG0l1n2724+Wj5SiPmc+PdelkGs+gHGbHDcQSXw/bjTUmpNnoBDw==
X-Received: by 2002:a05:620a:20da:: with SMTP id
 f26mr9349393qka.344.1639584806359; 
 Wed, 15 Dec 2021 08:13:26 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:25 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/20] powerpc/pasemi: Add __init attribute to eligible
 functions
Date: Wed, 15 Dec 2021 11:12:32 -0500
Message-Id: <20211215161243.16396-10-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/pasemi' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/pasemi/msi.c    | 2 +-
 arch/powerpc/platforms/pasemi/pasemi.h | 2 +-
 arch/powerpc/platforms/pasemi/pci.c    | 2 +-
 arch/powerpc/platforms/pasemi/setup.c  | 2 +-
 arch/powerpc/sysdev/mpic.h             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/msi.c b/arch/powerpc/platforms/pasemi/msi.c
index d38944a1e258..11ab9c13457c 100644
--- a/arch/powerpc/platforms/pasemi/msi.c
+++ b/arch/powerpc/platforms/pasemi/msi.c
@@ -135,7 +135,7 @@ static int pasemi_msi_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 	return 0;
 }
 
-int mpic_pasemi_msi_init(struct mpic *mpic)
+int __init mpic_pasemi_msi_init(struct mpic *mpic)
 {
 	int rc;
 	struct pci_controller *phb;
diff --git a/arch/powerpc/platforms/pasemi/pasemi.h b/arch/powerpc/platforms/pasemi/pasemi.h
index 70b56048ed1b..c915bf177865 100644
--- a/arch/powerpc/platforms/pasemi/pasemi.h
+++ b/arch/powerpc/platforms/pasemi/pasemi.h
@@ -7,7 +7,7 @@ extern void pas_pci_init(void);
 extern void pas_pci_irq_fixup(struct pci_dev *dev);
 extern void pas_pci_dma_dev_setup(struct pci_dev *dev);
 
-extern void __iomem *pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset);
+extern void __iomem *pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset) __init;
 
 extern void __init pasemi_map_registers(void);
 
diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platforms/pasemi/pci.c
index 8779b107d872..d4b922759d6e 100644
--- a/arch/powerpc/platforms/pasemi/pci.c
+++ b/arch/powerpc/platforms/pasemi/pci.c
@@ -287,7 +287,7 @@ void __init pas_pci_init(void)
 	}
 }
 
-void __iomem *pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset)
+void __iomem *__init pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset)
 {
 	struct pci_controller *hose;
 
diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index 376797eb7894..f974bfe7fde1 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -212,7 +212,7 @@ static void sb600_8259_cascade(struct irq_desc *desc)
 	chip->irq_eoi(&desc->irq_data);
 }
 
-static void nemo_init_IRQ(struct mpic *mpic)
+static void __init nemo_init_IRQ(struct mpic *mpic)
 {
 	struct device_node *np;
 	int gpio_virq;
diff --git a/arch/powerpc/sysdev/mpic.h b/arch/powerpc/sysdev/mpic.h
index 931648d81c53..21638b581dae 100644
--- a/arch/powerpc/sysdev/mpic.h
+++ b/arch/powerpc/sysdev/mpic.h
@@ -24,7 +24,7 @@ static inline int mpic_u3msi_init(struct mpic *mpic)
 #endif
 
 #if defined(CONFIG_PCI_MSI) && defined(CONFIG_PPC_PASEMI)
-int mpic_pasemi_msi_init(struct mpic *mpic);
+int mpic_pasemi_msi_init(struct mpic *mpic) __init;
 #else
 static inline int mpic_pasemi_msi_init(struct mpic *mpic) { return -1; }
 #endif
-- 
2.25.1

