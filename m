Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41C57D658
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 23:57:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpmdY1p7qz3dst
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 07:57:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G3gdHUg+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=shorne@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G3gdHUg+;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpYq94R5yz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 23:50:13 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d7so1857986plr.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uEjSfF+99/HRrfEMs0fz/oyvdJNIzMVZ2NrIMge9YDY=;
        b=G3gdHUg+uCjmsO/Wxn3dzoE8fIx2mUG0OaV5hLlC1XLq/ZHCRqNwUm+5GuueuEsfUi
         c2MdBDsaDXi7DZhBkpgE8lekeg+A8WMbFypcfJ8WypuyJAoyA2QGkHcY1KYQe5MJuD9A
         INT4DUno2z8EtcksjfmJuunh3959Mk5YyDb+T6OnFfGgHvf/XI0KB+BaX8c37YuNSyq6
         Mt+5fXZDO5jgPx3RUvxsQsECrDw6Wc27XYTCynd6+4AmgAyuaJRsu9G+EawVWHIM9AMt
         u6nATWl/tYtZwC0/bGXtjRt1A9Q+kcVhs5B5JEL79hNU1vdKiWecly7EMcamhjAQsi/O
         P8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uEjSfF+99/HRrfEMs0fz/oyvdJNIzMVZ2NrIMge9YDY=;
        b=w91Jxv0ro+qlLXGF3Szc2IhpsERWrnlG579Mx/07Bpjd8xMMZvaZTGfc0UXk6I0WI6
         tJ6ujWDFIl/JMkR1w+PlV7akCEqv9DxAgiA5iJgAog+snoDLc36PXRrVVQpnIY32irb7
         RL4aXzPdtrK7+A8fPjiNRRxrIeNNXrxRHqzmXFNEznZdo4o+O03N6agWIY2uoH5fXIaq
         s/gh78UgNYNm9CegwDefuX4Ti3V1j2as3Xx9HW++dxo6/eVYjiJrhbXSICT4YHxqca35
         I4ytPtQzBPP8sqs6Z+UmQLBQfZuYmiwDwl4AEAPSroTMQZKVTwllbkYHdawOIzoWQXAR
         SPbQ==
X-Gm-Message-State: AJIora9kxllMDsObtY7rvftX2W1y8PepsusjaQG2tP4DmFPNZiJa7glJ
	40BtJjR0Qx5D/RqWZt83eDU=
X-Google-Smtp-Source: AGRyM1tVlFJJ8D0O7DAi0MZsfHRpXKNAT5a//2gM7rpKtWvyT9EePoTM4PI8WjL1FhByjqqlx6ehHA==
X-Received: by 2002:a17:902:f646:b0:168:e2da:8931 with SMTP id m6-20020a170902f64600b00168e2da8931mr43850943plg.84.1658411411179;
        Thu, 21 Jul 2022 06:50:11 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a0bc200b001f239783e3dsm858074pjd.34.2022.07.21.06.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:50:10 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/4] PCI: Move isa_dma_bridge_buggy out of dma.h
Date: Thu, 21 Jul 2022 22:49:22 +0900
Message-Id: <20220721134924.596152-3-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721134924.596152-1-shorne@gmail.com>
References: <20220721134924.596152-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Jul 2022 07:56:29 +1000
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
Cc: alsa-devel@alsa-project.org, Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>, linux-sh@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-ia64@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>, Christoph Hellwig <hch@infradead.org>, linux-alpha@vger.kernel.org, I
 ngo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, Greg Kroah-Hartman <gregkh@linuxfoundati
 on.org>, Takashi Iwai <tiwai@suse.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During recent PCI cleanups we noticed that the isa_dma_bridge_buggy
symbol supported by all architectures is actually only used for x86_32.

This patch moves the symbol out of all architectures limiting usage to
only x86_32.  This is possible because only x86_32 platforms or quirks
existing in PCI devices supported on x86_32 ever set this.  A new global
header linux/isa-dma.h is added to provide a common place to maintain
the definition.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v4:
 - Also remove isa_dma_bridge_buggy from arm64, csky, riscv as this point.

 arch/alpha/include/asm/dma.h           |  9 ---------
 arch/arc/include/asm/dma.h             |  5 -----
 arch/arm/include/asm/dma.h             |  6 ------
 arch/arm64/include/asm/pci.h           |  2 --
 arch/csky/include/asm/pci.h            |  2 --
 arch/ia64/include/asm/dma.h            |  2 --
 arch/m68k/include/asm/dma.h            |  6 ------
 arch/microblaze/include/asm/dma.h      |  6 ------
 arch/mips/include/asm/dma.h            |  8 --------
 arch/parisc/include/asm/dma.h          |  6 ------
 arch/powerpc/include/asm/dma.h         |  6 ------
 arch/riscv/include/asm/pci.h           |  2 --
 arch/s390/include/asm/dma.h            |  6 ------
 arch/sh/include/asm/dma.h              |  6 ------
 arch/sparc/include/asm/dma.h           |  8 --------
 arch/um/include/asm/pci.h              |  2 --
 arch/x86/include/asm/dma.h             |  8 --------
 arch/xtensa/include/asm/dma.h          |  7 -------
 drivers/comedi/drivers/comedi_isadma.c |  2 +-
 drivers/pci/pci.c                      |  2 ++
 drivers/pci/quirks.c                   |  4 +++-
 include/linux/isa-dma.h                | 14 ++++++++++++++
 sound/core/isadma.c                    |  2 +-
 23 files changed, 21 insertions(+), 100 deletions(-)
 create mode 100644 include/linux/isa-dma.h

diff --git a/arch/alpha/include/asm/dma.h b/arch/alpha/include/asm/dma.h
index 28610ea7786d..a04d76b96089 100644
--- a/arch/alpha/include/asm/dma.h
+++ b/arch/alpha/include/asm/dma.h
@@ -365,13 +365,4 @@ extern void free_dma(unsigned int dmanr);	/* release it again */
 #define KERNEL_HAVE_CHECK_DMA
 extern int check_dma(unsigned int dmanr);
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/arc/include/asm/dma.h b/arch/arc/include/asm/dma.h
index 5b744f4b10a7..02431027ed2f 100644
--- a/arch/arc/include/asm/dma.h
+++ b/arch/arc/include/asm/dma.h
@@ -7,10 +7,5 @@
 #define ASM_ARC_DMA_H
 
 #define MAX_DMA_ADDRESS 0xC0000000
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	0
-#endif
 
 #endif
diff --git a/arch/arm/include/asm/dma.h b/arch/arm/include/asm/dma.h
index a81dda65c576..907d139be431 100644
--- a/arch/arm/include/asm/dma.h
+++ b/arch/arm/include/asm/dma.h
@@ -143,10 +143,4 @@ extern int  get_dma_residue(unsigned int chan);
 
 #endif /* CONFIG_ISA_DMA_API */
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy    (0)
-#endif
-
 #endif /* __ASM_ARM_DMA_H */
diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h
index 0aebc3488c32..682c922b5658 100644
--- a/arch/arm64/include/asm/pci.h
+++ b/arch/arm64/include/asm/pci.h
@@ -20,8 +20,6 @@
 #define arch_can_pci_mmap_wc() 1
 #define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
 
-extern int isa_dma_bridge_buggy;
-
 #ifdef CONFIG_PCI
 static inline int pci_proc_domain(struct pci_bus *bus)
 {
diff --git a/arch/csky/include/asm/pci.h b/arch/csky/include/asm/pci.h
index 0535f1aaae38..5c02454ec724 100644
--- a/arch/csky/include/asm/pci.h
+++ b/arch/csky/include/asm/pci.h
@@ -15,8 +15,6 @@
 /* C-SKY shim does not initialize PCI bus */
 #define pcibios_assign_all_busses() 1
 
-extern int isa_dma_bridge_buggy;
-
 #ifdef CONFIG_PCI
 static inline int pci_proc_domain(struct pci_bus *bus)
 {
diff --git a/arch/ia64/include/asm/dma.h b/arch/ia64/include/asm/dma.h
index 59625e9c1f9c..eaed2626ffda 100644
--- a/arch/ia64/include/asm/dma.h
+++ b/arch/ia64/include/asm/dma.h
@@ -12,8 +12,6 @@
 
 extern unsigned long MAX_DMA_ADDRESS;
 
-extern int isa_dma_bridge_buggy;
-
 #define free_dma(x)
 
 #endif /* _ASM_IA64_DMA_H */
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index f6c5e0dfb4e5..1c8d9c5bc2fa 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -6,10 +6,4 @@
    bootmem allocator (but this should do it for this) */
 #define MAX_DMA_ADDRESS PAGE_OFFSET
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy    (0)
-#endif
-
 #endif /* _M68K_DMA_H */
diff --git a/arch/microblaze/include/asm/dma.h b/arch/microblaze/include/asm/dma.h
index f801582be912..7484c9eb66c4 100644
--- a/arch/microblaze/include/asm/dma.h
+++ b/arch/microblaze/include/asm/dma.h
@@ -9,10 +9,4 @@
 /* Virtual address corresponding to last available physical memory address.  */
 #define MAX_DMA_ADDRESS (CONFIG_KERNEL_START + memory_size - 1)
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy     (0)
-#endif
-
 #endif /* _ASM_MICROBLAZE_DMA_H */
diff --git a/arch/mips/include/asm/dma.h b/arch/mips/include/asm/dma.h
index be726b943530..d6186e6bea7e 100644
--- a/arch/mips/include/asm/dma.h
+++ b/arch/mips/include/asm/dma.h
@@ -307,12 +307,4 @@ static __inline__ int get_dma_residue(unsigned int dmanr)
 extern int request_dma(unsigned int dmanr, const char * device_id);	/* reserve a DMA channel */
 extern void free_dma(unsigned int dmanr);	/* release it again */
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/parisc/include/asm/dma.h b/arch/parisc/include/asm/dma.h
index eea80ed34e6d..9e8c101de902 100644
--- a/arch/parisc/include/asm/dma.h
+++ b/arch/parisc/include/asm/dma.h
@@ -176,10 +176,4 @@ static __inline__ void set_dma_count(unsigned int dmanr, unsigned int count)
 
 #define free_dma(dmanr)
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/powerpc/include/asm/dma.h b/arch/powerpc/include/asm/dma.h
index 6161a9596196..d97c66d9ae34 100644
--- a/arch/powerpc/include/asm/dma.h
+++ b/arch/powerpc/include/asm/dma.h
@@ -340,11 +340,5 @@ extern int request_dma(unsigned int dmanr, const char *device_id);
 /* release it again */
 extern void free_dma(unsigned int dmanr);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_DMA_H */
diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index a7b8f0d0df7f..f904df586c03 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -20,8 +20,6 @@
 
 #define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
 
-extern int isa_dma_bridge_buggy;
-
 #ifdef CONFIG_PCI
 static inline int pci_proc_domain(struct pci_bus *bus)
 {
diff --git a/arch/s390/include/asm/dma.h b/arch/s390/include/asm/dma.h
index 6f26f35d4a71..dec1c4ce628c 100644
--- a/arch/s390/include/asm/dma.h
+++ b/arch/s390/include/asm/dma.h
@@ -11,10 +11,4 @@
  */
 #define MAX_DMA_ADDRESS         0x80000000
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* _ASM_S390_DMA_H */
diff --git a/arch/sh/include/asm/dma.h b/arch/sh/include/asm/dma.h
index 17d23ae98c77..c8bee3f985a2 100644
--- a/arch/sh/include/asm/dma.h
+++ b/arch/sh/include/asm/dma.h
@@ -137,10 +137,4 @@ extern int register_chan_caps(const char *dmac, struct dma_chan_caps *capslist);
 extern int dma_create_sysfs_files(struct dma_channel *, struct dma_info *);
 extern void dma_remove_sysfs_files(struct dma_channel *, struct dma_info *);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* __ASM_SH_DMA_H */
diff --git a/arch/sparc/include/asm/dma.h b/arch/sparc/include/asm/dma.h
index 462e7c794a09..08043f35b110 100644
--- a/arch/sparc/include/asm/dma.h
+++ b/arch/sparc/include/asm/dma.h
@@ -82,14 +82,6 @@
 #define DMA_BURST64      0x40
 #define DMA_BURSTBITS    0x7f
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
 #ifdef CONFIG_SPARC32
 struct device;
 
diff --git a/arch/um/include/asm/pci.h b/arch/um/include/asm/pci.h
index 26b96c02ef61..1211855aff34 100644
--- a/arch/um/include/asm/pci.h
+++ b/arch/um/include/asm/pci.h
@@ -9,8 +9,6 @@
 
 #define pcibios_assign_all_busses() 1
 
-extern int isa_dma_bridge_buggy;
-
 #ifdef CONFIG_PCI_DOMAINS
 static inline int pci_proc_domain(struct pci_bus *bus)
 {
diff --git a/arch/x86/include/asm/dma.h b/arch/x86/include/asm/dma.h
index 8e95aa4b0d17..8ae6e0e11b8b 100644
--- a/arch/x86/include/asm/dma.h
+++ b/arch/x86/include/asm/dma.h
@@ -307,12 +307,4 @@ extern int request_dma(unsigned int dmanr, const char *device_id);
 extern void free_dma(unsigned int dmanr);
 #endif
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* _ASM_X86_DMA_H */
diff --git a/arch/xtensa/include/asm/dma.h b/arch/xtensa/include/asm/dma.h
index bb099a373b5a..172644539032 100644
--- a/arch/xtensa/include/asm/dma.h
+++ b/arch/xtensa/include/asm/dma.h
@@ -52,11 +52,4 @@
 extern int request_dma(unsigned int dmanr, const char * device_id);
 extern void free_dma(unsigned int dmanr);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
-
 #endif
diff --git a/drivers/comedi/drivers/comedi_isadma.c b/drivers/comedi/drivers/comedi_isadma.c
index 700982464c53..020b3d1e1ac0 100644
--- a/drivers/comedi/drivers/comedi_isadma.c
+++ b/drivers/comedi/drivers/comedi_isadma.c
@@ -8,7 +8,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
-#include <asm/dma.h>
+#include <linux/isa-dma.h>
 #include <linux/comedi/comedidev.h>
 #include <linux/comedi/comedi_isadma.h>
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index cfaf40a540a8..60c55d2cb2cc 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -41,8 +41,10 @@ const char *pci_power_names[] = {
 };
 EXPORT_SYMBOL_GPL(pci_power_names);
 
+#ifdef CONFIG_X86_32
 int isa_dma_bridge_buggy;
 EXPORT_SYMBOL(isa_dma_bridge_buggy);
+#endif
 
 int pci_pci_problems;
 EXPORT_SYMBOL(pci_pci_problems);
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 41aeaa235132..6fc64509eee7 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/pci.h>
+#include <linux/isa-dma.h> /* isa_dma_bridge_buggy */
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/acpi.h>
@@ -30,7 +31,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
 #include <linux/switchtec.h>
-#include <asm/dma.h>	/* isa_dma_bridge_buggy */
 #include "pci.h"
 
 static ktime_t fixup_debug_start(struct pci_dev *dev,
@@ -239,6 +239,7 @@ static void quirk_passive_release(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82441,	quirk_passive_release);
 DECLARE_PCI_FIXUP_RESUME(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82441,	quirk_passive_release);
 
+#ifdef CONFIG_X86_32
 /*
  * The VIA VP2/VP3/MVP3 seem to have some 'features'. There may be a
  * workaround but VIA don't answer queries. If you happen to have good
@@ -265,6 +266,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AL,	PCI_DEVICE_ID_AL_M1533,		quirk_isa_dma
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_1,	quirk_isa_dma_hangs);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_2,	quirk_isa_dma_hangs);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_3,	quirk_isa_dma_hangs);
+#endif
 
 /*
  * Intel NM10 "TigerPoint" LPC PM1a_STS.BM_STS must be clear
diff --git a/include/linux/isa-dma.h b/include/linux/isa-dma.h
new file mode 100644
index 000000000000..61504a8c1b9e
--- /dev/null
+++ b/include/linux/isa-dma.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_ISA_DMA_H
+#define __LINUX_ISA_DMA_H
+
+#include <asm/dma.h>
+
+#if defined(CONFIG_PCI) && defined(CONFIG_X86_32)
+extern int isa_dma_bridge_buggy;
+#else
+#define isa_dma_bridge_buggy	(0)
+#endif
+
+#endif /* __LINUX_ISA_DMA_H */
diff --git a/sound/core/isadma.c b/sound/core/isadma.c
index 1f45ede023b4..18a86212e3a8 100644
--- a/sound/core/isadma.c
+++ b/sound/core/isadma.c
@@ -12,8 +12,8 @@
 #undef HAVE_REALLY_SLOW_DMA_CONTROLLER
 
 #include <linux/export.h>
+#include <linux/isa-dma.h>
 #include <sound/core.h>
-#include <asm/dma.h>
 
 /**
  * snd_dma_program - program an ISA DMA transfer
-- 
2.36.1

