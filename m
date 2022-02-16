Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1C64B9389
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:03:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzX6H2hR9z3cY9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 09:03:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SKBiXg1q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SKBiXg1q; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzX5d3h85z2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 09:03:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24D6961B44
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 22:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B121C004E1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 22:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645048993;
 bh=ay/5589FenTcDxawo4c9r5D5w/FgYtE3zMvoHKiKBw4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SKBiXg1qMAxSOG7O/+fAEZVno6RY18W0gjWd48YvWVehxkUtMksFHxAKOXPaf1Nim
 qHK3jdeXyT7izApYt/dKY/APNToDbzS30oZ/3+FsRDGwHCYVq4RDe7vcie8TG09GCB
 VJT0268zX83XvVza5Mt2NT9M5MRvq5jsvfN9DDwEAft1MUWYI2uGvfXze8xcMLyYPl
 W5bKKzwddcuQftrn4B+eRiSOdBTv8tp7msayxnS9iimb1X7zN2rzIA/p/RbCumDYFK
 ozI4OSbpqbFd1JHV5fS/CeCxidkU8UzvVlyBvKvVSqnpavPgI6V4RqMDH4eF/+tdlu
 AnRmCFW169S3A==
Received: by mail-ej1-f43.google.com with SMTP id lw4so2312287ejb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 14:03:13 -0800 (PST)
X-Gm-Message-State: AOAM532WSSknp/48vonPfYOSS2AzGbq2K11w9cqV6r/RLhSQoSL0ZvLi
 GU62QGwhtXF0buOatY030zViQm0WrK+rEyqEbYU=
X-Google-Smtp-Source: ABdhPJyk0zQXj5EZ1uP9z1YUTizioO4kJ6rvneTTyuZji8J8rGr64s8uMSDVOcQeT3f3UOdAxVtCGFpnKRwe/RHh9ys=
X-Received: by 2002:adf:cf0c:0:b0:1e6:22fe:4580 with SMTP id
 o12-20020adfcf0c000000b001e622fe4580mr53483wrj.12.1645048981311; Wed, 16 Feb
 2022 14:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
 <Yg1F/VT4vRX4aHEt@ravnborg.org>
In-Reply-To: <Yg1F/VT4vRX4aHEt@ravnborg.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 16 Feb 2022 23:02:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2gx2w=RDECNbrO4Zu3ZUTfz2UrLbNSz+ieCgMEFiK3TA@mail.gmail.com>
Message-ID: <CAK8P3a2gx2w=RDECNbrO4Zu3ZUTfz2UrLbNSz+ieCgMEFiK3TA@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 7:44 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Arnd,
>
> Fix spelling in $subject...

done

> sparc/Kconfig b/arch/sparc/Kconfig
> > index 9f6f9bce5292..9276f321b3e3 100644
> > --- a/arch/sparc/Kconfig
> > +++ b/arch/sparc/Kconfig
> > @@ -46,7 +46,6 @@ config SPARC
> >       select LOCKDEP_SMALL if LOCKDEP
> >       select NEED_DMA_MAP_STATE
> >       select NEED_SG_DMA_LENGTH
> > -     select SET_FS
> >       select TRACE_IRQFLAGS_SUPPORT
> >
> >  config SPARC32
> > @@ -101,6 +100,7 @@ config SPARC64
> >       select HAVE_SETUP_PER_CPU_AREA
> >       select NEED_PER_CPU_EMBED_FIRST_CHUNK
> >       select NEED_PER_CPU_PAGE_FIRST_CHUNK
> > +     select SET_FS
> This looks wrong - looks like some merge went wrong here.

Fixed now.

>
> Other than the above the sparc32 changes looks fine, and with the Kconf
> stuff fixed:
> Acked-by: Sam Ravnborg <sam@ravnborg.org> # for sparc32 changes

Thanks!

      Arnd
