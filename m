Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E00605773C3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 05:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlrN75xL4z3cDG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 13:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dKXkki4t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=shorne@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dKXkki4t;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlrMT17Lqz302d
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:35:14 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id b2so6330043plx.7
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 20:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tw+gjDmJoLsBiB8jh8ZvyDH4UCds4aoAQf/c7lWyids=;
        b=dKXkki4tGc1P2bEiBhktSDo+KHMgr9zKMGo+FvdNVmesp4zAz94R95IqCYAUo0n0SL
         b2lMFcvr2MY7IVgohWeQFHXBt8A4cbsY/OZIallU12nEeihqo1sVlHyGa0XfgcpV2kbf
         5BDSP4BJpNhF+kLFnzOnk+PWODeegzuKnkqzjUJ9W+u0098L0PcJzO4mYbmdojWrPDOf
         gcIB74D/eTx/yb2Ad8o3J9clOTzLbMKGPGZQ8puM5JEoc5cV5JOu2Pa9qA4AEDjVhkCU
         /NXWhqDRhgQwUPfZ2BdZ+dGCTWzxWTEEFGWW5klCC4DQ3RqfLFabEt+1YqMOaglGI1/6
         kzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tw+gjDmJoLsBiB8jh8ZvyDH4UCds4aoAQf/c7lWyids=;
        b=Zws/gVarTkcWztNh+vJ7M0PyKNWRXcT6eEICtxtKW3oAgqb7HnC5MJXoFlwrqAopk3
         yqEcZTUuA8VRJH2+NfbmdMEOZphoAGijGCeHM3zd5tXarnwlLFqNSW5DmAzqyTWtg7ti
         F5VAc6I3WFACfZtBxnRaCkSqU/1ZndsRc8WGVoVmSHsbLxj8Coc5eY/4+/gkPs+B19xv
         4ihHm0lEVYrW1mtsS1m1nCU4GgjsCAMHaX/SmSJGrS7SnFUJ1CW9bbycAWHkHkejH2ZT
         rC2RWpoB5c1Ns4Fd5/B4a8+u4BspB9nSqnkMhMLH4VgZPiCYC7ZX5NCa2BgyvvXJRgQ9
         lyrg==
X-Gm-Message-State: AJIora9oJFLOl62/7Tp2WZo1dYghAZFGotmg4lhSrfRh0vCYP4UHN8Fp
	97GWHm4QKXFK54RYeb3SXu0=
X-Google-Smtp-Source: AGRyM1tQ+Ab9ul66FqPFcU7j7eu9CzvXK97tnV4LJmmhXVTTWOyjXUoDLAhXp/IreTKcDzgYh630Dw==
X-Received: by 2002:a17:90b:3b51:b0:1f0:5ebc:ac9 with SMTP id ot17-20020a17090b3b5100b001f05ebc0ac9mr24747678pjb.229.1658028911948;
        Sat, 16 Jul 2022 20:35:11 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id o11-20020a170903210b00b001638a171558sm6243036ple.202.2022.07.16.20.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:35:11 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code to x86
Date: Sun, 17 Jul 2022 12:34:52 +0900
Message-Id: <20220717033453.2896843-2-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220717033453.2896843-1-shorne@gmail.com>
References: <20220717033453.2896843-1-shorne@gmail.com>
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
Cc: linux-ia64@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Stafford Horne <shorne@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux-riscv@lists.infradead.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@goo
 gle.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The generic pci.h header now only provides a definition of
pci_get_legacy_ide_irq which is used by architectures that support PNP.
Of the architectures that use asm-generic/pci.h this is only x86.

This patch removes the old pci.h in order to make room for a new
pci.h to be used by arm64, riscv, openrisc, etc.

The existing code in pci.h is moved out to x86.  On other architectures
we clean up any outstanding references.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 arch/alpha/include/asm/pci.h   |  1 -
 arch/ia64/include/asm/pci.h    |  1 -
 arch/m68k/include/asm/pci.h    |  7 +++++--
 arch/powerpc/include/asm/pci.h |  1 -
 arch/s390/include/asm/pci.h    |  1 -
 arch/sparc/include/asm/pci.h   |  9 ---------
 arch/x86/include/asm/pci.h     |  6 ++++--
 arch/xtensa/include/asm/pci.h  |  3 ---
 include/asm-generic/pci.h      | 17 -----------------
 9 files changed, 9 insertions(+), 37 deletions(-)
 delete mode 100644 include/asm-generic/pci.h

diff --git a/arch/alpha/include/asm/pci.h b/arch/alpha/include/asm/pci.h
index cf6bc1e64d66..8ac5af0fc4da 100644
--- a/arch/alpha/include/asm/pci.h
+++ b/arch/alpha/include/asm/pci.h
@@ -56,7 +56,6 @@ struct pci_controller {
 
 /* IOMMU controls.  */
 
-/* TODO: integrate with include/asm-generic/pci.h ? */
 static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 {
 	return channel ? 15 : 14;
diff --git a/arch/ia64/include/asm/pci.h b/arch/ia64/include/asm/pci.h
index 8c163d1d0189..218412d963c2 100644
--- a/arch/ia64/include/asm/pci.h
+++ b/arch/ia64/include/asm/pci.h
@@ -63,7 +63,6 @@ static inline int pci_proc_domain(struct pci_bus *bus)
 	return (pci_domain_nr(bus) != 0);
 }
 
-#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
 static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 {
 	return channel ? isa_irq_to_vector(15) : isa_irq_to_vector(14);
diff --git a/arch/m68k/include/asm/pci.h b/arch/m68k/include/asm/pci.h
index 5a4bc223743b..0c272ff515cc 100644
--- a/arch/m68k/include/asm/pci.h
+++ b/arch/m68k/include/asm/pci.h
@@ -2,11 +2,14 @@
 #ifndef _ASM_M68K_PCI_H
 #define _ASM_M68K_PCI_H
 
-#include <asm-generic/pci.h>
-
 #define	pcibios_assign_all_busses()	1
 
 #define	PCIBIOS_MIN_IO		0x00000100
 #define	PCIBIOS_MIN_MEM		0x02000000
 
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	return channel ? 15 : 14;
+}
+
 #endif /* _ASM_M68K_PCI_H */
diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 915d6ee4b40a..f9da506751bb 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -39,7 +39,6 @@
 #define pcibios_assign_all_busses() \
 	(pci_has_flag(PCI_REASSIGN_ALL_BUS))
 
-#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
 static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 {
 	if (ppc_md.pci_get_legacy_ide_irq)
diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
index fdb9745ee998..5889ddcbc374 100644
--- a/arch/s390/include/asm/pci.h
+++ b/arch/s390/include/asm/pci.h
@@ -6,7 +6,6 @@
 #include <linux/mutex.h>
 #include <linux/iommu.h>
 #include <linux/pci_hotplug.h>
-#include <asm-generic/pci.h>
 #include <asm/pci_clp.h>
 #include <asm/pci_debug.h>
 #include <asm/sclp.h>
diff --git a/arch/sparc/include/asm/pci.h b/arch/sparc/include/asm/pci.h
index 4deddf430e5d..0c58f65bd172 100644
--- a/arch/sparc/include/asm/pci.h
+++ b/arch/sparc/include/asm/pci.h
@@ -40,13 +40,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
 #define get_pci_unmapped_area get_fb_unmapped_area
 #endif /* CONFIG_SPARC64 */
 
-#if defined(CONFIG_SPARC64) || defined(CONFIG_LEON_PCI)
-static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
-{
-	return PCI_IRQ_NONE;
-}
-#else
-#include <asm-generic/pci.h>
-#endif
-
 #endif /* ___ASM_SPARC_PCI_H */
diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
index f3fd5928bcbb..7da27f665cfe 100644
--- a/arch/x86/include/asm/pci.h
+++ b/arch/x86/include/asm/pci.h
@@ -105,8 +105,10 @@ static inline void early_quirks(void) { }
 
 extern void pci_iommu_alloc(void);
 
-/* generic pci stuff */
-#include <asm-generic/pci.h>
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	return channel ? 15 : 14;
+}
 
 #ifdef CONFIG_NUMA
 /* Returns the node based on pci bus */
diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
index 8e2b48a268db..b56de9635b6c 100644
--- a/arch/xtensa/include/asm/pci.h
+++ b/arch/xtensa/include/asm/pci.h
@@ -43,7 +43,4 @@
 #define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
 #define arch_can_pci_mmap_io()		1
 
-/* Generic PCI */
-#include <asm-generic/pci.h>
-
 #endif	/* _XTENSA_PCI_H */
diff --git a/include/asm-generic/pci.h b/include/asm-generic/pci.h
deleted file mode 100644
index 6bb3cd3d695a..000000000000
--- a/include/asm-generic/pci.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * linux/include/asm-generic/pci.h
- *
- *  Copyright (C) 2003 Russell King
- */
-#ifndef _ASM_GENERIC_PCI_H
-#define _ASM_GENERIC_PCI_H
-
-#ifndef HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
-static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
-{
-	return channel ? 15 : 14;
-}
-#endif /* HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ */
-
-#endif /* _ASM_GENERIC_PCI_H */
-- 
2.36.1

