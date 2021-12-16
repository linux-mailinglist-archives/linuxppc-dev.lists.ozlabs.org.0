Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81346477FD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:07:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR6j2czsz3dgF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:07:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HgNPBt5Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HgNPBt5Z; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzZ37NBz304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:58 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id m17so600278qvx.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOWsjM49PvjAWEmIKMD+y7vLj0uMzmbT1HB5Vay77pM=;
 b=HgNPBt5Zm7W7+gfI8ugmDlB2L+v6wFdX24wNRTXGTmBVTA7/w4trUAw3DhK+rW9ov+
 6t2ZRJ/oZ9G0ry1vERYLiByBUx03vo1GMZ+3oHcmshlikbExU+4mvDkXqbpSwx6wV/Ie
 PCoqRMPsAQwHJ45pyPMpYYMoy/9XDvBJiqwZL5Bqc7I61fq6VxENlWfcwXBQgSSzHJ05
 Zb+3EqDPTWo/LSMDDL19X6SxcoQU5I0+9khVP0RKhad13y7FEVzbB5dcfLkbD58dUeHL
 iDgOcFxYb3GwOK4D9KEWZ8XnHgoaehYiQevb25z2rYQovFw1v62wIGLtI7TJpZeIKjOp
 1xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOWsjM49PvjAWEmIKMD+y7vLj0uMzmbT1HB5Vay77pM=;
 b=KOt9zM4hEYxZoDWZ+uU0X4b0OF223LdhEVMf3/nWNOmMYGJCdB07/+4Hm/hJlWxQ0r
 MIowRF8dyZAV2V9sOq75EJqsWg74oYk8xqRJ83YmFgc7PUEdps5c1ts3iFd5ZERflb/N
 XGRxPbGcZJBQEApF35vqUZUAm5Y56++OuhDzoOcr6qVJyeULKqHdb2mK3skzkulZNvZ8
 9bOxmBvevIHkMy922GRgKWUwtaHfezVKLRenHlMIMmxPxQdo8+RmLB4NaKiWdjK5kqMl
 9KyHv7LFil1fWFqgx+/Eqk7oVbm2Tv3rpJcA12z9EWvWo7bquDrLcWi9E7s3HVNeepD/
 lhAA==
X-Gm-Message-State: AOAM533aCiySHACA14rU8qroO/BjvqOI3s47RnujkE2eVKis0ouOiRMQ
 mMS7J0h/ilN1vZtAkEnxfliTF+2X8JY=
X-Google-Smtp-Source: ABdhPJxuLAxepsbewe9E/NQQW2QdgijjfhU4pG7IBJCRhOflX4OlZvOtnwy+SBrErPBofbQR535VXw==
X-Received: by 2002:a05:6214:c6e:: with SMTP id
 t14mr12597951qvj.57.1639692056045; 
 Thu, 16 Dec 2021 14:00:56 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:55 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/20] powerpc/pasemi: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:24 -0500
Message-Id: <20211216220035.605465-10-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/pasemi' are deserving
of an `__init` macro attribute. These functions are only called by other
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
index 70b56048ed1b..3f277a200fd8 100644
--- a/arch/powerpc/platforms/pasemi/pasemi.h
+++ b/arch/powerpc/platforms/pasemi/pasemi.h
@@ -7,7 +7,7 @@ extern void pas_pci_init(void);
 extern void pas_pci_irq_fixup(struct pci_dev *dev);
 extern void pas_pci_dma_dev_setup(struct pci_dev *dev);
 
-extern void __iomem *pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset);
+void __iomem *__init pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset);
 
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
index cbcc3fee9fca..bb460ff57a06 100644
--- a/arch/powerpc/sysdev/mpic.h
+++ b/arch/powerpc/sysdev/mpic.h
@@ -24,7 +24,7 @@ static inline int mpic_u3msi_init(struct mpic *mpic)
 #endif
 
 #if defined(CONFIG_PCI_MSI) && defined(CONFIG_PPC_PASEMI)
-int mpic_pasemi_msi_init(struct mpic *mpic);
+int __init mpic_pasemi_msi_init(struct mpic *mpic);
 #else
 static inline int mpic_pasemi_msi_init(struct mpic *mpic) { return -1; }
 #endif
-- 
2.25.1

