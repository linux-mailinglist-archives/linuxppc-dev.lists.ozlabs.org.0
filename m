Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166957F298
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 03:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lr5fK72tnz3dxK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 11:47:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n4J0qrH4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=shorne@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n4J0qrH4;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LqR6l3ht2z305M
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 09:51:41 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id q43-20020a17090a17ae00b001f1f67e053cso5428571pja.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 16:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w+8PO2Q3IFsYNNP0kUU0KaNtZ78h823PNgqQFLlVexg=;
        b=n4J0qrH4csDPtgxB6KHkyBAsV2Viqr79XgcEFR/ThRmSpmX2H/eS2pap5DY8i+y49+
         Mm9S80gy3KYzubhcTJ8SXzjrXBQfeytRG5fJnMHJT8o+PtwsYJyeaqNq5pKAP1sOkZ/l
         61VO83vT3jnxYqG8oif66avgBFTQgRfcaGMYuJksw0f8sKr5Td+e9aRKhwdXuInji2Gr
         /iFAeP2YC+RWP1HmTZJxV1eKf7KpjUQqJfNKqP1+dAuZn7lDg2LjOVZVaUq+HQMIKp2M
         nnAuNqSLafCbA9912Z9e145XY3xYNLJeiPfbf6ZPB3OGjWdZYtqPhtAiCvrpuU0wu6sB
         j2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w+8PO2Q3IFsYNNP0kUU0KaNtZ78h823PNgqQFLlVexg=;
        b=0TsYeoiw+aO3QLIZta3GpdcSSM6sFRrNXjtqfl4J++yY/dwzi8rr2Qjz7irh4SXLGX
         mwxTTP+chcJ4/AB8AqPYA2PkMPpRYlqrNmod+rhnLnZkBPLeQcnfp3BMHKUqtEqPvJ06
         +IDT2V0OiqI2pivQ0No54qgmRubVpbUojLCp7PlqAWCbvShkESv8q3X8RQArmE+iIMkY
         +miEgPBjrAPo/7Fz4aeM0dc/Klt8LjDK/N/OLByNbd3JvZWANLUQx/Daa+cKFHIqx3cw
         8UshAhnknqWpqM0pFJGmLq9QMr7Zd39CNBBrGiO/sxreJfZFY29HAw2o5j7/ZsSZUM4V
         nYZQ==
X-Gm-Message-State: AJIora8B0JAddYYBi1hg5Pb2jpubPaQJDat/ezz2rrNuSUPQUv4gTp2+
	3rgsJ/SR0jaB0l5t/Pqt2Cs=
X-Google-Smtp-Source: AGRyM1sVVkF52pkHqNnIRTlyIosnhllpk0gk+MnsC17B0O3z7zttbwtNXjFjW1WE3h8ZD6t5f61fQQ==
X-Received: by 2002:a17:902:d508:b0:16d:4f47:9d65 with SMTP id b8-20020a170902d50800b0016d4f479d65mr669240plg.149.1658533896476;
        Fri, 22 Jul 2022 16:51:36 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id cp17-20020a170902e79100b0016c0c82e85csm4274749plb.75.2022.07.22.16.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 16:51:36 -0700 (PDT)
Date: Sat, 23 Jul 2022 08:51:34 +0900
From: Stafford Horne <shorne@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 1/4] PCI: Remove pci_get_legacy_ide_irq and
 asm-generic/pci.h
Message-ID: <Yts4BjEk6VQvOOdg@antec>
References: <20220722214944.831438-2-shorne@gmail.com>
 <20220722233821.GA1979844@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722233821.GA1979844@bhelgaas>
X-Mailman-Approved-At: Sun, 24 Jul 2022 11:45:40 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, linux-sh@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org, x86@kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-acpi@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.co
 m>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, linux-um@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Tiezhu Yang <yangtiezhu@loongson.cn>, Chris Zankel <chris@zankel.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, Greg Kroah-Hartman <gr
 egkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 22, 2022 at 06:38:21PM -0500, Bjorn Helgaas wrote:
> On Sat, Jul 23, 2022 at 06:49:41AM +0900, Stafford Horne wrote:
> > The definition of the pci header function pci_get_legacy_ide_irq is only
> > used in platforms that support PNP.  So many of the architecutres where
> > it is defined do not use it.  This also means we can remove
> > asm-generic/pci.h as all it provides is a definition of
> > pci_get_legacy_ide_irq.
> > 
> > Where referenced, replace the usage of pci_get_legacy_ide_irq with the
> > libata.h macros ATA_PRIMARY_IRQ and ATA_SECONDARY_IRQ which provide the
> > same functionality.  This allows removing pci_get_legacy_ide_irq from
> > headers where it is no longer used.
> > 
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Acked-by: Pierre Morel <pmorel@linux.ibm.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Co-developed-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> 
> I applied all 4 patches in this series to pci/header-cleanup-immutable
> for v5.20.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=pci/header-cleanup-immutable

Thank you,

Sorry, the 0/4 cover letter is here.

  https://lore.kernel.org/lkml/20220722214944.831438-1-shorne@gmail.com/

I hadn't had you CC'd as I was using ./script/get_maintainer.pl to maintain the
CCs.  Maybe patch MAINTAINERS like the following could help keep you CC'd on all
things PCI?  But maybe that would be too much, never-the-less I'll make sure you
are CC'd on pci related patches including cover-letters in the future.

    diff --git a/MAINTAINERS b/MAINTAINERS
    index f313862b2929..b64cd6bbb34f 100644
    --- a/MAINTAINERS
    +++ b/MAINTAINERS
    @@ -15552,6 +15552,8 @@ F:      include/linux/of_pci.h
     F:     include/linux/pci*
     F:     include/uapi/linux/pci*
     F:     lib/pci*
    +K:     pci
    +N:     pci

Palmer, we now have a branch you can use for your RISC-V for-next.  Does, that
work?

-Stafford

> > ---
> >  arch/alpha/include/asm/pci.h   |  6 ------
> >  arch/arm/include/asm/pci.h     |  5 -----
> >  arch/arm64/include/asm/pci.h   |  6 ------
> >  arch/csky/include/asm/pci.h    |  6 ------
> >  arch/ia64/include/asm/pci.h    |  6 ------
> >  arch/m68k/include/asm/pci.h    |  2 --
> >  arch/mips/include/asm/pci.h    |  6 ------
> >  arch/parisc/include/asm/pci.h  |  5 -----
> >  arch/powerpc/include/asm/pci.h |  1 -
> >  arch/riscv/include/asm/pci.h   |  6 ------
> >  arch/s390/include/asm/pci.h    |  1 -
> >  arch/sh/include/asm/pci.h      |  6 ------
> >  arch/sparc/include/asm/pci.h   |  9 ---------
> >  arch/um/include/asm/pci.h      |  8 --------
> >  arch/x86/include/asm/pci.h     |  3 ---
> >  arch/xtensa/include/asm/pci.h  |  3 ---
> >  drivers/pnp/resource.c         |  5 +++--
> >  include/asm-generic/pci.h      | 17 -----------------
> >  18 files changed, 3 insertions(+), 98 deletions(-)
> >  delete mode 100644 include/asm-generic/pci.h
> > 
> > diff --git a/arch/alpha/include/asm/pci.h b/arch/alpha/include/asm/pci.h
> > index cf6bc1e64d66..6312656279d7 100644
> > --- a/arch/alpha/include/asm/pci.h
> > +++ b/arch/alpha/include/asm/pci.h
> > @@ -56,12 +56,6 @@ struct pci_controller {
> >  
> >  /* IOMMU controls.  */
> >  
> > -/* TODO: integrate with include/asm-generic/pci.h ? */
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	return channel ? 15 : 14;
> > -}
> > -
> >  #define pci_domain_nr(bus) ((struct pci_controller *)(bus)->sysdata)->index
> >  
> >  static inline int pci_proc_domain(struct pci_bus *bus)
> > diff --git a/arch/arm/include/asm/pci.h b/arch/arm/include/asm/pci.h
> > index 68e6f25784a4..5916b88d4c94 100644
> > --- a/arch/arm/include/asm/pci.h
> > +++ b/arch/arm/include/asm/pci.h
> > @@ -22,11 +22,6 @@ static inline int pci_proc_domain(struct pci_bus *bus)
> >  #define HAVE_PCI_MMAP
> >  #define ARCH_GENERIC_PCI_MMAP_RESOURCE
> >  
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	return channel ? 15 : 14;
> > -}
> > -
> >  extern void pcibios_report_status(unsigned int status_mask, int warn);
> >  
> >  #endif /* __KERNEL__ */
> > diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h
> > index b33ca260e3c9..0aebc3488c32 100644
> > --- a/arch/arm64/include/asm/pci.h
> > +++ b/arch/arm64/include/asm/pci.h
> > @@ -23,12 +23,6 @@
> >  extern int isa_dma_bridge_buggy;
> >  
> >  #ifdef CONFIG_PCI
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	/* no legacy IRQ on arm64 */
> > -	return -ENODEV;
> > -}
> > -
> >  static inline int pci_proc_domain(struct pci_bus *bus)
> >  {
> >  	return 1;
> > diff --git a/arch/csky/include/asm/pci.h b/arch/csky/include/asm/pci.h
> > index ebc765b1f78b..0535f1aaae38 100644
> > --- a/arch/csky/include/asm/pci.h
> > +++ b/arch/csky/include/asm/pci.h
> > @@ -18,12 +18,6 @@
> >  extern int isa_dma_bridge_buggy;
> >  
> >  #ifdef CONFIG_PCI
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	/* no legacy IRQ on csky */
> > -	return -ENODEV;
> > -}
> > -
> >  static inline int pci_proc_domain(struct pci_bus *bus)
> >  {
> >  	/* always show the domain in /proc */
> > diff --git a/arch/ia64/include/asm/pci.h b/arch/ia64/include/asm/pci.h
> > index 8c163d1d0189..fa8f545c24c9 100644
> > --- a/arch/ia64/include/asm/pci.h
> > +++ b/arch/ia64/include/asm/pci.h
> > @@ -63,10 +63,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
> >  	return (pci_domain_nr(bus) != 0);
> >  }
> >  
> > -#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	return channel ? isa_irq_to_vector(15) : isa_irq_to_vector(14);
> > -}
> > -
> >  #endif /* _ASM_IA64_PCI_H */
> > diff --git a/arch/m68k/include/asm/pci.h b/arch/m68k/include/asm/pci.h
> > index 5a4bc223743b..ccdfa0dc8413 100644
> > --- a/arch/m68k/include/asm/pci.h
> > +++ b/arch/m68k/include/asm/pci.h
> > @@ -2,8 +2,6 @@
> >  #ifndef _ASM_M68K_PCI_H
> >  #define _ASM_M68K_PCI_H
> >  
> > -#include <asm-generic/pci.h>
> > -
> >  #define	pcibios_assign_all_busses()	1
> >  
> >  #define	PCIBIOS_MIN_IO		0x00000100
> > diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
> > index 9ffc8192adae..3fd6e22c108b 100644
> > --- a/arch/mips/include/asm/pci.h
> > +++ b/arch/mips/include/asm/pci.h
> > @@ -139,10 +139,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
> >  /* Do platform specific device initialization at pci_enable_device() time */
> >  extern int pcibios_plat_dev_init(struct pci_dev *dev);
> >  
> > -/* Chances are this interrupt is wired PC-style ...  */
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	return channel ? 15 : 14;
> > -}
> > -
> >  #endif /* _ASM_PCI_H */
> > diff --git a/arch/parisc/include/asm/pci.h b/arch/parisc/include/asm/pci.h
> > index f14465b84de4..127ed5021ae3 100644
> > --- a/arch/parisc/include/asm/pci.h
> > +++ b/arch/parisc/include/asm/pci.h
> > @@ -162,11 +162,6 @@ extern void pcibios_init_bridge(struct pci_dev *);
> >  #define PCIBIOS_MIN_IO          0x10
> >  #define PCIBIOS_MIN_MEM         0x1000 /* NBPG - but pci/setup-res.c dies */
> >  
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	return channel ? 15 : 14;
> > -}
> > -
> >  #define HAVE_PCI_MMAP
> >  #define ARCH_GENERIC_PCI_MMAP_RESOURCE
> >  
> > diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
> > index 915d6ee4b40a..f9da506751bb 100644
> > --- a/arch/powerpc/include/asm/pci.h
> > +++ b/arch/powerpc/include/asm/pci.h
> > @@ -39,7 +39,6 @@
> >  #define pcibios_assign_all_busses() \
> >  	(pci_has_flag(PCI_REASSIGN_ALL_BUS))
> >  
> > -#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
> >  static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> >  {
> >  	if (ppc_md.pci_get_legacy_ide_irq)
> > diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
> > index 7fd52a30e605..a7b8f0d0df7f 100644
> > --- a/arch/riscv/include/asm/pci.h
> > +++ b/arch/riscv/include/asm/pci.h
> > @@ -23,12 +23,6 @@
> >  extern int isa_dma_bridge_buggy;
> >  
> >  #ifdef CONFIG_PCI
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	/* no legacy IRQ on risc-v */
> > -	return -ENODEV;
> > -}
> > -
> >  static inline int pci_proc_domain(struct pci_bus *bus)
> >  {
> >  	/* always show the domain in /proc */
> > diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
> > index fdb9745ee998..5889ddcbc374 100644
> > --- a/arch/s390/include/asm/pci.h
> > +++ b/arch/s390/include/asm/pci.h
> > @@ -6,7 +6,6 @@
> >  #include <linux/mutex.h>
> >  #include <linux/iommu.h>
> >  #include <linux/pci_hotplug.h>
> > -#include <asm-generic/pci.h>
> >  #include <asm/pci_clp.h>
> >  #include <asm/pci_debug.h>
> >  #include <asm/sclp.h>
> > diff --git a/arch/sh/include/asm/pci.h b/arch/sh/include/asm/pci.h
> > index ad22e88c6657..54c30126ea17 100644
> > --- a/arch/sh/include/asm/pci.h
> > +++ b/arch/sh/include/asm/pci.h
> > @@ -88,10 +88,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
> >  	return hose->need_domain_info;
> >  }
> >  
> > -/* Chances are this interrupt is wired PC-style ...  */
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	return channel ? 15 : 14;
> > -}
> > -
> >  #endif /* __ASM_SH_PCI_H */
> > diff --git a/arch/sparc/include/asm/pci.h b/arch/sparc/include/asm/pci.h
> > index 4deddf430e5d..0c58f65bd172 100644
> > --- a/arch/sparc/include/asm/pci.h
> > +++ b/arch/sparc/include/asm/pci.h
> > @@ -40,13 +40,4 @@ static inline int pci_proc_domain(struct pci_bus *bus)
> >  #define get_pci_unmapped_area get_fb_unmapped_area
> >  #endif /* CONFIG_SPARC64 */
> >  
> > -#if defined(CONFIG_SPARC64) || defined(CONFIG_LEON_PCI)
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	return PCI_IRQ_NONE;
> > -}
> > -#else
> > -#include <asm-generic/pci.h>
> > -#endif
> > -
> >  #endif /* ___ASM_SPARC_PCI_H */
> > diff --git a/arch/um/include/asm/pci.h b/arch/um/include/asm/pci.h
> > index da13fd5519ef..26b96c02ef61 100644
> > --- a/arch/um/include/asm/pci.h
> > +++ b/arch/um/include/asm/pci.h
> > @@ -11,14 +11,6 @@
> >  
> >  extern int isa_dma_bridge_buggy;
> >  
> > -#ifdef CONFIG_PCI
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	/* no legacy IRQs */
> > -	return -ENODEV;
> > -}
> > -#endif
> > -
> >  #ifdef CONFIG_PCI_DOMAINS
> >  static inline int pci_proc_domain(struct pci_bus *bus)
> >  {
> > diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
> > index f3fd5928bcbb..736793d65bcb 100644
> > --- a/arch/x86/include/asm/pci.h
> > +++ b/arch/x86/include/asm/pci.h
> > @@ -105,9 +105,6 @@ static inline void early_quirks(void) { }
> >  
> >  extern void pci_iommu_alloc(void);
> >  
> > -/* generic pci stuff */
> > -#include <asm-generic/pci.h>
> > -
> >  #ifdef CONFIG_NUMA
> >  /* Returns the node based on pci bus */
> >  static inline int __pcibus_to_node(const struct pci_bus *bus)
> > diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
> > index 8e2b48a268db..b56de9635b6c 100644
> > --- a/arch/xtensa/include/asm/pci.h
> > +++ b/arch/xtensa/include/asm/pci.h
> > @@ -43,7 +43,4 @@
> >  #define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
> >  #define arch_can_pci_mmap_io()		1
> >  
> > -/* Generic PCI */
> > -#include <asm-generic/pci.h>
> > -
> >  #endif	/* _XTENSA_PCI_H */
> > diff --git a/drivers/pnp/resource.c b/drivers/pnp/resource.c
> > index 2fa0f7d55259..8f7695624c8c 100644
> > --- a/drivers/pnp/resource.c
> > +++ b/drivers/pnp/resource.c
> > @@ -17,6 +17,7 @@
> >  #include <asm/dma.h>
> >  #include <asm/irq.h>
> >  #include <linux/pci.h>
> > +#include <linux/libata.h>
> >  #include <linux/ioport.h>
> >  #include <linux/init.h>
> >  
> > @@ -322,8 +323,8 @@ static int pci_dev_uses_irq(struct pnp_dev *pnp, struct pci_dev *pci,
> >  		 * treat the compatibility IRQs as busy.
> >  		 */
> >  		if ((progif & 0x5) != 0x5)
> > -			if (pci_get_legacy_ide_irq(pci, 0) == irq ||
> > -			    pci_get_legacy_ide_irq(pci, 1) == irq) {
> > +			if (ATA_PRIMARY_IRQ(pci) == irq ||
> > +			    ATA_SECONDARY_IRQ(pci) == irq) {
> >  				pnp_dbg(&pnp->dev, "  legacy IDE device %s "
> >  					"using irq %d\n", pci_name(pci), irq);
> >  				return 1;
> > diff --git a/include/asm-generic/pci.h b/include/asm-generic/pci.h
> > deleted file mode 100644
> > index 6bb3cd3d695a..000000000000
> > --- a/include/asm-generic/pci.h
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -/*
> > - * linux/include/asm-generic/pci.h
> > - *
> > - *  Copyright (C) 2003 Russell King
> > - */
> > -#ifndef _ASM_GENERIC_PCI_H
> > -#define _ASM_GENERIC_PCI_H
> > -
> > -#ifndef HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
> > -static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > -{
> > -	return channel ? 15 : 14;
> > -}
> > -#endif /* HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ */
> > -
> > -#endif /* _ASM_GENERIC_PCI_H */
> > -- 
> > 2.36.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
