Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43402575998
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 04:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkZzC32Hvz3cdc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 12:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IEJMJOhz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=shorne@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IEJMJOhz;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkZyX1cWSz3bsD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 12:27:46 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id v7so3529275pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 19:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2PHQEHiPUK5/kMXd0Tiaa/2KkMXqEO7YBVcbpRdWkzU=;
        b=IEJMJOhzDLt+yfASXyPdeXR1oGGTsGDx3vl/pKDJYU0fM7xGoEYifRYmndgoDBn8V+
         8KaH2UOTKaWNm2bcmSVrDZgCQRS5bZdc/JErVv0oiKI4D779tqf8qqqo8Y4iLSedLKu6
         KJvBrd7MyyR0lBJJ++sR+EsLWE8c5/Kb5Z0fTJPJtZS1NwarGIQrRHk8mNKtsfmdVnsk
         DdHkjkVUI3Go5QJOuWJ7tFYeVZyOTWJ1DVFRKCXBlPEbNV+fVinpn4yVP5n1HJQodgh9
         gnwtaOMTLLw/5pbt9rN0/tXbYqausx/cGWYNWZ3PmgEiWfJZrxEj2bcNKssaqRx0mKTs
         9LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2PHQEHiPUK5/kMXd0Tiaa/2KkMXqEO7YBVcbpRdWkzU=;
        b=ju1iIypGX14Xaugy4TEYlJD3q+u3vf/Rw5tjgH6BTfcd3Jjhq0u0isg1Bjr0tB4Rew
         ub+9dYL559uav8gbzOE+ThUBsbRj/pw+cVwfz3OXyELLo8htiIapr2VaVrNoY+/k0Vuq
         O6STH9ltJ+PFINcq78tYX14ZkPun/X1ACNwubg1fMLcyLntk6oDKgT0/qo6+NoMX3SVw
         pYgoZq4ZOe1VR7VMgBffgA131IhZXkX7aiFtCXuNsTGJbuVs6t4L89CkNPEbq4C6VfT1
         mBkg0SbQw/TCo1Lm+D7pQ/C/8bGSBaLUSRhoZw3p0htBrr1WF08pZzkN1IUMhySbGQzu
         4kKg==
X-Gm-Message-State: AJIora+VyVmzKutZJjVT6Eb+08o00fnOiOb80B/ry4pfqVF9Un/H0dau
	cLAzApRxyr0JbdfdXGZQFew=
X-Google-Smtp-Source: AGRyM1tFpAPO14ibbARmvlyA7Dm2i3y8ihIra24Y5oG5D9v2V9oCrT80IZwFQQ8AdtfnaIGZOBL3gA==
X-Received: by 2002:a63:9547:0:b0:408:be53:b599 with SMTP id t7-20020a639547000000b00408be53b599mr10179125pgn.463.1657852063244;
        Thu, 14 Jul 2022 19:27:43 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id v22-20020a631516000000b0040caab35e5bsm1998257pgl.89.2022.07.14.19.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 19:27:42 -0700 (PDT)
Date: Fri, 15 Jul 2022 11:27:41 +0900
From: Stafford Horne <shorne@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [RFC PATCH 1/2] asm-generic: Remove pci.h copying code out to
 architectures
Message-ID: <YtDQnQOeDF6RID4g@antec>
References: <20220714214657.2402250-1-shorne@gmail.com>
 <20220714214657.2402250-2-shorne@gmail.com>
 <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
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
Cc: "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
  Heiko Carstens <hca@linux.ibm.com>, "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 06:45:27PM -0700, Max Filippov wrote:
> On Thu, Jul 14, 2022 at 2:47 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > The generic pci.h header provides a definition of pci_get_legacy_ide_irq
> > which is used by architectures that use PC-style interrupt numbers.
> >
> > This patch removes the old pci.h in order to make room for a new
> > pci.h to be used by arm64, riscv, openrisc, etc.
> >
> > The existing code in pci.h is moved out to architectures.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >  arch/alpha/include/asm/pci.h   |  1 -
> >  arch/ia64/include/asm/pci.h    |  1 -
> >  arch/m68k/include/asm/pci.h    |  7 +++++--
> >  arch/powerpc/include/asm/pci.h |  1 -
> >  arch/s390/include/asm/pci.h    |  6 +++++-
> >  arch/sparc/include/asm/pci.h   |  5 ++++-
> >  arch/x86/include/asm/pci.h     |  6 ++++--
> >  arch/xtensa/include/asm/pci.h  |  6 ++++--
> >  include/asm-generic/pci.h      | 17 -----------------
> >  9 files changed, 22 insertions(+), 28 deletions(-)
> >  delete mode 100644 include/asm-generic/pci.h
> 
> [...]
> 
> > diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
> > index 8e2b48a268db..f57ede61f5db 100644
> > --- a/arch/xtensa/include/asm/pci.h
> > +++ b/arch/xtensa/include/asm/pci.h
> > @@ -43,7 +43,9 @@
> >  #define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
> >  #define arch_can_pci_mmap_io()         1
> >
> > -/* Generic PCI */
> > -#include <asm-generic/pci.h>
> 
> Ok.
> 
> > +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > +{
> > +       return channel ? 15 : 14;
> > +}
> 
> This addition does not make sense for the xtensa as it isn't even possible
> to enable PNP support (the only user of this function) on xtensa.

Thanks for your feedback, this is the kind of feedback I was hoping to fish out
with this patch.  I will look into completely removing this then.

-Stafford
