Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BE57C847
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 11:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpSdZ1YKZz3dqJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 19:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.175; helo=mail-yb1-f175.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpSd62gHxz30LC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 19:56:09 +1000 (AEST)
Received: by mail-yb1-f175.google.com with SMTP id b143so696333yba.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 02:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANVQjRLj94qjQOscYLBb9UlJmEmjYMw+jneTE9rf+Lg=;
        b=RCEB6VwiPHySU5J2z02c2OFChWfmt9gadWiry9dK6oiN3Bl/vTfp2OObGq6Gg7rDM3
         +RiG1OBkbMTXKwpr2yQK5zCxEnN2PIF6a2p1BvYkEn2DuRJqsA0ToT6CjKKxfh54WH2Q
         kcZaP/7h5Bae1g2B/b3wt4ZDMkLgeQ5VpzsgqW7NlPc9RZhP975I+eTRxj/s75PsBVHw
         /+vsh1rb+V9836V6ubH/QXV5xrY8CjiCDWnLK6VzPHwzY0zDzj0qyt+JL3GR6ZMEreZ9
         cUHNfpqGIOuH/6fjLPOxk1ktO5yBTPlwpyLxCYWPVbYoP8VQjPabtcfn+S56uawap5E5
         Eehw==
X-Gm-Message-State: AJIora+xxFLIIcG+4qTeMZTqeYB5PjGWJIE91sAEzFtMXfugbN8t2x+c
	ZVAF7N0YT8atrBjMQrJs4eq4d67ay23qUPXNHgI=
X-Google-Smtp-Source: AGRyM1t8kFQjQEDBkr07pO16L3OXL1cNKoJ1y/rLmHj/g8TgqsT4OJy2z2Wny8VxGZcQFsLVkuoLWVLyBG1u3U7oigA=
X-Received: by 2002:a05:6902:1541:b0:670:ac02:58c3 with SMTP id
 r1-20020a056902154100b00670ac0258c3mr4661901ybu.622.1658397366294; Thu, 21
 Jul 2022 02:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220720131934.373932-1-shorne@gmail.com> <20220720131934.373932-2-shorne@gmail.com>
In-Reply-To: <20220720131934.373932-2-shorne@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 21 Jul 2022 11:55:54 +0200
Message-ID: <CAJZ5v0ghRHcJ-6dAxBMq55tbftnvdMrKvi1Kq-ZDZF1g7KzLyA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] PCI: Remove pci_get_legacy_ide_irq and asm-generic/pci.h
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, Linux-sh list <linux-sh@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Linux PCI <linux-pci@vger.kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Kees Cook <keescook@chromium.org>, linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Ingo Molnar <mingo@
 redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Sven Schnelle <svens@
 linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 20, 2022 at 3:20 PM Stafford Horne <shorne@gmail.com> wrote:
>
> The definition of the pci header function pci_get_legacy_ide_irq is only
> used in platforms that support PNP.  So many of the architecutres where
> it is defined do not use it.  This also means we can remove
> asm-generic/pci.h as all it provides is a definition of
> pci_get_legacy_ide_irq.
>
> Where referenced, replace the usage of pci_get_legacy_ide_irq with the
> libata.h macros ATA_PRIMARY_IRQ and ATA_SECONDARY_IRQ which provide the
> same functionality.  This allows removing pci_get_legacy_ide_irq from
> headers where it is no longer used.
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Pierre Morel <pmorel@linux.ibm.com>
> Co-developed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>
> Since v3:
>  - Further remove the definictions of pci_get_legacy_ide_irq from x86 and use
>    the libata macros.
>  - Add Acked-bys.
>
>  arch/alpha/include/asm/pci.h   |  6 ------
>  arch/arm/include/asm/pci.h     |  5 -----
>  arch/arm64/include/asm/pci.h   |  6 ------
>  arch/ia64/include/asm/pci.h    |  6 ------
>  arch/m68k/include/asm/pci.h    |  2 --
>  arch/mips/include/asm/pci.h    |  6 ------
>  arch/parisc/include/asm/pci.h  |  5 -----
>  arch/powerpc/include/asm/pci.h |  1 -
>  arch/s390/include/asm/pci.h    |  1 -
>  arch/sh/include/asm/pci.h      |  6 ------
>  arch/sparc/include/asm/pci.h   |  9 ---------
>  arch/x86/include/asm/pci.h     |  3 ---
>  arch/xtensa/include/asm/pci.h  |  3 ---
>  drivers/pnp/resource.c         |  5 +++--
>  include/asm-generic/pci.h      | 17 -----------------
>  15 files changed, 3 insertions(+), 78 deletions(-)
>  delete mode 100644 include/asm-generic/pci.h
>
> diff --git a/arch/alpha/include/asm/pci.h b/arch/alpha/include/asm/pci.h
> index cf6bc1e64d66..6312656279d7 100644
> --- a/arch/alpha/include/asm/pci.h
> +++ b/arch/alpha/include/asm/pci.h
> @@ -56,12 +56,6 @@ struct pci_controller {
>
>  /* IOMMU controls.  */
>
> -/* TODO: integrate with include/asm-generic/pci.h ? */
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       return channel ? 15 : 14;
> -}
> -
>  #define pci_domain_nr(bus) ((struct pci_controller *)(bus)->sysdata)->index
>
>  static inline int pci_proc_domain(struct pci_bus *bus)
> diff --git a/arch/arm/include/asm/pci.h b/arch/arm/include/asm/pci.h
> index 68e6f25784a4..5916b88d4c94 100644
> --- a/arch/arm/include/asm/pci.h
> +++ b/arch/arm/include/asm/pci.h
> @@ -22,11 +22,6 @@ static inline int pci_proc_domain(struct pci_bus *bus)
>  #define HAVE_PCI_MMAP
>  #define ARCH_GENERIC_PCI_MMAP_RESOURCE
>
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       return channel ? 15 : 14;
> -}
> -
>  extern void pcibios_report_status(unsigned int status_mask, int warn);
>
>  #endif /* __KERNEL__ */
> diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h
> index b33ca260e3c9..0aebc3488c32 100644
> --- a/arch/arm64/include/asm/pci.h
> +++ b/arch/arm64/include/asm/pci.h
> @@ -23,12 +23,6 @@
>  extern int isa_dma_bridge_buggy;
>
>  #ifdef CONFIG_PCI
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       /* no legacy IRQ on arm64 */
> -       return -ENODEV;
> -}
> -
>  static inline int pci_proc_domain(struct pci_bus *bus)
>  {
>         return 1;
> diff --git a/arch/ia64/include/asm/pci.h b/arch/ia64/include/asm/pci.h
> index 8c163d1d0189..fa8f545c24c9 100644
> --- a/arch/ia64/include/asm/pci.h
> +++ b/arch/ia64/include/asm/pci.h
> @@ -63,10 +63,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
>         return (pci_domain_nr(bus) != 0);
>  }
>
> -#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       return channel ? isa_irq_to_vector(15) : isa_irq_to_vector(14);
> -}
> -
>  #endif /* _ASM_IA64_PCI_H */
> diff --git a/arch/m68k/include/asm/pci.h b/arch/m68k/include/asm/pci.h
> index 5a4bc223743b..ccdfa0dc8413 100644
> --- a/arch/m68k/include/asm/pci.h
> +++ b/arch/m68k/include/asm/pci.h
> @@ -2,8 +2,6 @@
>  #ifndef _ASM_M68K_PCI_H
>  #define _ASM_M68K_PCI_H
>
> -#include <asm-generic/pci.h>
> -
>  #define        pcibios_assign_all_busses()     1
>
>  #define        PCIBIOS_MIN_IO          0x00000100
> diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
> index 9ffc8192adae..3fd6e22c108b 100644
> --- a/arch/mips/include/asm/pci.h
> +++ b/arch/mips/include/asm/pci.h
> @@ -139,10 +139,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
>  /* Do platform specific device initialization at pci_enable_device() time */
>  extern int pcibios_plat_dev_init(struct pci_dev *dev);
>
> -/* Chances are this interrupt is wired PC-style ...  */
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       return channel ? 15 : 14;
> -}
> -
>  #endif /* _ASM_PCI_H */
> diff --git a/arch/parisc/include/asm/pci.h b/arch/parisc/include/asm/pci.h
> index f14465b84de4..127ed5021ae3 100644
> --- a/arch/parisc/include/asm/pci.h
> +++ b/arch/parisc/include/asm/pci.h
> @@ -162,11 +162,6 @@ extern void pcibios_init_bridge(struct pci_dev *);
>  #define PCIBIOS_MIN_IO          0x10
>  #define PCIBIOS_MIN_MEM         0x1000 /* NBPG - but pci/setup-res.c dies */
>
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       return channel ? 15 : 14;
> -}
> -
>  #define HAVE_PCI_MMAP
>  #define ARCH_GENERIC_PCI_MMAP_RESOURCE
>
> diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
> index 915d6ee4b40a..f9da506751bb 100644
> --- a/arch/powerpc/include/asm/pci.h
> +++ b/arch/powerpc/include/asm/pci.h
> @@ -39,7 +39,6 @@
>  #define pcibios_assign_all_busses() \
>         (pci_has_flag(PCI_REASSIGN_ALL_BUS))
>
> -#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
>  static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
>  {
>         if (ppc_md.pci_get_legacy_ide_irq)
> diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
> index fdb9745ee998..5889ddcbc374 100644
> --- a/arch/s390/include/asm/pci.h
> +++ b/arch/s390/include/asm/pci.h
> @@ -6,7 +6,6 @@
>  #include <linux/mutex.h>
>  #include <linux/iommu.h>
>  #include <linux/pci_hotplug.h>
> -#include <asm-generic/pci.h>
>  #include <asm/pci_clp.h>
>  #include <asm/pci_debug.h>
>  #include <asm/sclp.h>
> diff --git a/arch/sh/include/asm/pci.h b/arch/sh/include/asm/pci.h
> index ad22e88c6657..54c30126ea17 100644
> --- a/arch/sh/include/asm/pci.h
> +++ b/arch/sh/include/asm/pci.h
> @@ -88,10 +88,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
>         return hose->need_domain_info;
>  }
>
> -/* Chances are this interrupt is wired PC-style ...  */
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       return channel ? 15 : 14;
> -}
> -
>  #endif /* __ASM_SH_PCI_H */
> diff --git a/arch/sparc/include/asm/pci.h b/arch/sparc/include/asm/pci.h
> index 4deddf430e5d..0c58f65bd172 100644
> --- a/arch/sparc/include/asm/pci.h
> +++ b/arch/sparc/include/asm/pci.h
> @@ -40,13 +40,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
>  #define get_pci_unmapped_area get_fb_unmapped_area
>  #endif /* CONFIG_SPARC64 */
>
> -#if defined(CONFIG_SPARC64) || defined(CONFIG_LEON_PCI)
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       return PCI_IRQ_NONE;
> -}
> -#else
> -#include <asm-generic/pci.h>
> -#endif
> -
>  #endif /* ___ASM_SPARC_PCI_H */
> diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
> index f3fd5928bcbb..736793d65bcb 100644
> --- a/arch/x86/include/asm/pci.h
> +++ b/arch/x86/include/asm/pci.h
> @@ -105,9 +105,6 @@ static inline void early_quirks(void) { }
>
>  extern void pci_iommu_alloc(void);
>
> -/* generic pci stuff */
> -#include <asm-generic/pci.h>
> -
>  #ifdef CONFIG_NUMA
>  /* Returns the node based on pci bus */
>  static inline int __pcibus_to_node(const struct pci_bus *bus)
> diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
> index 8e2b48a268db..b56de9635b6c 100644
> --- a/arch/xtensa/include/asm/pci.h
> +++ b/arch/xtensa/include/asm/pci.h
> @@ -43,7 +43,4 @@
>  #define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
>  #define arch_can_pci_mmap_io()         1
>
> -/* Generic PCI */
> -#include <asm-generic/pci.h>
> -
>  #endif /* _XTENSA_PCI_H */
> diff --git a/drivers/pnp/resource.c b/drivers/pnp/resource.c
> index 2fa0f7d55259..8f7695624c8c 100644
> --- a/drivers/pnp/resource.c
> +++ b/drivers/pnp/resource.c
> @@ -17,6 +17,7 @@
>  #include <asm/dma.h>
>  #include <asm/irq.h>
>  #include <linux/pci.h>
> +#include <linux/libata.h>
>  #include <linux/ioport.h>
>  #include <linux/init.h>
>
> @@ -322,8 +323,8 @@ static int pci_dev_uses_irq(struct pnp_dev *pnp, struct pci_dev *pci,
>                  * treat the compatibility IRQs as busy.
>                  */
>                 if ((progif & 0x5) != 0x5)
> -                       if (pci_get_legacy_ide_irq(pci, 0) == irq ||
> -                           pci_get_legacy_ide_irq(pci, 1) == irq) {
> +                       if (ATA_PRIMARY_IRQ(pci) == irq ||
> +                           ATA_SECONDARY_IRQ(pci) == irq) {
>                                 pnp_dbg(&pnp->dev, "  legacy IDE device %s "
>                                         "using irq %d\n", pci_name(pci), irq);
>                                 return 1;
> diff --git a/include/asm-generic/pci.h b/include/asm-generic/pci.h
> deleted file mode 100644
> index 6bb3cd3d695a..000000000000
> --- a/include/asm-generic/pci.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * linux/include/asm-generic/pci.h
> - *
> - *  Copyright (C) 2003 Russell King
> - */
> -#ifndef _ASM_GENERIC_PCI_H
> -#define _ASM_GENERIC_PCI_H
> -
> -#ifndef HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
> -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> -{
> -       return channel ? 15 : 14;
> -}
> -#endif /* HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ */
> -
> -#endif /* _ASM_GENERIC_PCI_H */
> --
> 2.36.1
>
