Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17C5797F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 12:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnFyy3cszz3bl6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 20:52:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BOnJQHOr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=shorne@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BOnJQHOr;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnFyH0z3bz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 20:51:50 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id o18so206855pjs.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9r5Q68sSonSuFNnUgS5s5Aq4lQPVRc3ftjUkjt5E+/U=;
        b=BOnJQHOrKNukFMXMC1nU6y4ArvL3vrbcOB435U/Vzx1k1fn6r436k543OFDgaWokoN
         tDErjZCkEJHwVO1H9RQMX6lk34fHev+Aj5/gKGFjtSnH8f4W9B86s0nsqJfg9JeN8ml2
         JpIehp+Baf/hC0iEenp4Vlpui6EBPFyHuw5pyeahpcXpOlX6hXba88BFS6CklcADGLsD
         uF4jiHQM1YmdN8VkpQPyWmk/8xJ0QlGm1a4CTd/3gGsmLRaK9WiL+TrM3sZCWwiys/37
         kJ3jZOnmNy/5GCMbwcqkClcv2x5+kayzRqwLIi+9L4ewDsXPITUTBKitxHlTC+mUPCTq
         HiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9r5Q68sSonSuFNnUgS5s5Aq4lQPVRc3ftjUkjt5E+/U=;
        b=W5+3F2q+/JeSgRx7+/EBRXd9ArhdDe4lvT76ZWtX72p+ZQn/QGNSIdoTn9xU3VSI8c
         Ya4aiqfi+3ZK6kvlMDbpDnKmXLNINlUGtn/EebkmGB9U0PAR5+M8vleBiabOKoED1CJb
         y0zgNssU1n3M2oIuzdpVaO3Zp2TVrvp4s0WKG7nrfwTv0Hi9UwTqMqK/WHsx4eQ1r0Xy
         2YJM5V/KwocnG8H4Nj54GayXcn/A/b/+icPSIDbiqt1Z366GzYzfefrxlmdlTVtZCclv
         R0lIkSTLZJRV5qauB5QU7JEUuuO9V2p5JcIrpBmeeqVdIXWGJkSQJBQvVQliYnao80ia
         Y4TA==
X-Gm-Message-State: AJIora+zcjRmFBtjwrUVgGIaCuJx9+CfmHgfUIu4imyhiBubYf+rflEP
	120T5Du2rqwhR7QCn8CZAPw=
X-Google-Smtp-Source: AGRyM1vZ9IAj9wB2om7mrxhh/fUk9aNQMH63dmua/3Emg6xcerZ0EDmPY1xKNwyujRSIvj70HenApQ==
X-Received: by 2002:a17:90b:3e89:b0:1f0:4233:b20e with SMTP id rj9-20020a17090b3e8900b001f04233b20emr37808145pjb.0.1658227905897;
        Tue, 19 Jul 2022 03:51:45 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id x23-20020a1709027c1700b001696751796asm11299184pll.139.2022.07.19.03.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 03:51:45 -0700 (PDT)
Date: Tue, 19 Jul 2022 19:51:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
Message-ID: <YtaMv2kfdxFyDsis@antec>
References: <20220717033453.2896843-1-shorne@gmail.com>
 <20220717033453.2896843-2-shorne@gmail.com>
 <YtTif+vNq+gkfqsc@infradead.org>
 <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
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
Cc: "open list:IA64 \(Itanium\) PLATFORM" <linux-ia64@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnel
 le <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 10:40:34AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 18, 2022 at 6:33 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Sun, Jul 17, 2022 at 12:34:52PM +0900, Stafford Horne wrote:
> > > The generic pci.h header now only provides a definition of
> > > pci_get_legacy_ide_irq which is used by architectures that support PNP.
> > > Of the architectures that use asm-generic/pci.h this is only x86.
> >
> > Please move this into a separate header, ike legacy-ide.h.  It doens't
> > have anyting to do with actual PCI support.
> 
> It looks like asm/libata-portmap.h is meant to have this information already,
> and this is what libata uses, while drivers/ide used the
> pci_get_legacy_ide_irq()
> function for the same purpose.
> 
> Only ia64 and powerpc have interesting definitions of both, and they
> return the same thing, so I think this is sufficient to remove the last caller:
> 
> diff --git a/drivers/pnp/resource.c b/drivers/pnp/resource.c
> index 2fa0f7d55259..d7a6250589d6 100644
> --- a/drivers/pnp/resource.c
> +++ b/drivers/pnp/resource.c
> @@ -16,7 +16,7 @@
>  #include <asm/io.h>
>  #include <asm/dma.h>
>  #include <asm/irq.h>
> -#include <linux/pci.h>
> +#include <linux/libata.h>
>  #include <linux/ioport.h>
>  #include <linux/init.h>
> 
> @@ -322,8 +322,8 @@ static int pci_dev_uses_irq(struct pnp_dev *pnp,
> struct pci_dev *pci,
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
> 
> This is fine on the architectures that currently return an error from
> pci_get_legacy_ide_irq() but will change to returning 15/14 instead,
> because they do not support ISA devices, so pci_dev_uses_irq()
> will never be called either.

I like this, I didn't know about the ATA_PRIMARY_IRQ/ATA_SECONDARY_IRQ macro.
Let me add this to the series before 1/2.  I will keep you as the author via
Signed-off-by annotation.

-Stafford
