Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD657758F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 11:24:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lm06815THz3c5m
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 19:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.54; helo=mail-qv1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lm05j1wFgz3bc1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 19:23:51 +1000 (AEST)
Received: by mail-qv1-f54.google.com with SMTP id l2so6844199qvt.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 02:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wc3nIaC4TGrabTRR6ZU1E+ucBztRvo43HV92KBQYbRU=;
        b=tgdfCD6pF5VS9d0Y2EJZSJl4TCPg3dDDtHZsaUbWYQtcNVI4IrqjKtHL01I8PCmn5M
         Oj0w9p0jtG0ESMY1vV6S4S2TGfhoen8x6Q2s4/m1XQcpFBolbkdYpzIHaxOhUII86KEJ
         l6TjfqLqyhbKTeZlb3/8Z+McVYv5G7TMhuZz21qnPAal54UEE3ZswqgrbgJn5ymSvjc8
         hxcLqZFJUNZUmaNGgeX7AvIcSp8673n4v9IK2ZyUsLo+7xQFp+F1BWAsRMnE4rxEw5Jt
         wckR7ogKmr9RaPK2cCMUS1hArke6wffv/+5vkC1WJbWnmEr+8SHUyt4dqdov2AAi6AJY
         SOQw==
X-Gm-Message-State: AJIora8nnn7U7CQopw/46v/JrNAOANGWitqjSL/a/LTeH/3pzOHwVR/p
	qpMJqGaEZ8mgO/nLzPTBJ1G6bFAmqFUJmw==
X-Google-Smtp-Source: AGRyM1txXdbCXRbgDtwwcyo0M4Ng/TwD3iRhYvz2Wmq6O4MyIrWEQokdQ7V+sgoeIsoGNfu/xpGV2A==
X-Received: by 2002:a05:6214:766:b0:473:1b4:3fe0 with SMTP id f6-20020a056214076600b0047301b43fe0mr17420439qvz.102.1658049826861;
        Sun, 17 Jul 2022 02:23:46 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id n123-20020a37bd81000000b006a3325fd985sm8091657qkf.13.2022.07.17.02.23.46
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 02:23:46 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id h62so15886940ybb.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 02:23:46 -0700 (PDT)
X-Received: by 2002:a81:af27:0:b0:31c:833f:eda5 with SMTP id
 n39-20020a81af27000000b0031c833feda5mr24448251ywh.358.1658049815479; Sun, 17
 Jul 2022 02:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-2-shorne@gmail.com>
In-Reply-To: <20220717033453.2896843-2-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 Jul 2022 11:23:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUT6nEft8v30sq0WP49RW2qUn+1sunk+ow2_EEyVEieEQ@mail.gmail.com>
Message-ID: <CAMuHMdUT6nEft8v30sq0WP49RW2qUn+1sunk+ow2_EEyVEieEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.c
 om>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stafford,

On Sun, Jul 17, 2022 at 5:35 AM Stafford Horne <shorne@gmail.com> wrote:
> The generic pci.h header now only provides a definition of
> pci_get_legacy_ide_irq which is used by architectures that support PNP.
> Of the architectures that use asm-generic/pci.h this is only x86.
>
> This patch removes the old pci.h in order to make room for a new
> pci.h to be used by arm64, riscv, openrisc, etc.
>
> The existing code in pci.h is moved out to x86.  On other architectures
> we clean up any outstanding references.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/pci.h
> +++ b/arch/m68k/include/asm/pci.h
> @@ -2,11 +2,14 @@
>  #ifndef _ASM_M68K_PCI_H
>  #define _ASM_M68K_PCI_H
>
> -#include <asm-generic/pci.h>
> -
>  #define        pcibios_assign_all_busses()     1
>
>  #define        PCIBIOS_MIN_IO          0x00000100
>  #define        PCIBIOS_MIN_MEM         0x02000000
>
> +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> +{
> +       return channel ? 15 : 14;
> +}
> +

I thought you were not going to add this?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
