Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D9A4C2670
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:42:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45y15Rs4z3cBQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:42:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YOGAN3Ou;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YOGAN3Ou; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45xP3CT1z2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:42:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5DBA61AA3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 08:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16377C340F1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645692118;
 bh=3OZhY8JjlWpvQtjxNVEtkpMscELhOM136ShyKCOjsEU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YOGAN3Ou80mEKNsykXj8ie52gpFsCVxajnKo+fVOUo8V4/sic/pOq4CdSoOd2GB1b
 /DFzNMCkE1qxllFipGwJHWAaCS4IaDKcD97FfPBp+mJhw9HxvWOn28n1Y8BUybDNsA
 +yPho3efgFc2VffevtUaiBij/DxDPREig5OOUTWqqUNtwBmL15ikcYWCmxYY8jlPFm
 umtLZNTU9Nw3aZTWVMt07+OWMTTmQoULwtDM0wXQUt9PlDK10b2hb7qQJs6aukLGz3
 3pqjSUm6hB3j1A/C4xUtqTAF5WSNWolmioSDFQdTyrtWyij78cvyj2zH3B6JtjimOs
 oRaJr1b38Q3sA==
Received: by mail-ej1-f54.google.com with SMTP id d10so2723694eje.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:41:58 -0800 (PST)
X-Gm-Message-State: AOAM532jt21ba6BRLocUK8YGEJ8cgS0amL8cNIyeyGOJsVBtnIl4GicY
 Kc4xybs7zUCfPtTluDpjuNWbc+jG+/Hm81VYeHM=
X-Google-Smtp-Source: ABdhPJzneL/9b5VqISjziF71opYqNdlSHnzAsafkxFgpoEqKa+f7LCyuasR/zxK7OReD5OXFM6yWvfz7KIyaMqF7hrc=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr1312686wrr.192.1645692105823; Thu, 24
 Feb 2022 00:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <YhdB7tNDvtsYLUzr@antec>
In-Reply-To: <YhdB7tNDvtsYLUzr@antec>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Feb 2022 09:41:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Q6=yzX5hKX45=U80SoUXLU59sFqz-tN6U=Fr5t1m96Q@mail.gmail.com>
Message-ID: <CAK8P3a3Q6=yzX5hKX45=U80SoUXLU59sFqz-tN6U=Fr5t1m96Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
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
 Michal Simek <monstr@monstr.eu>,
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

On Thu, Feb 24, 2022 at 9:29 AM Stafford Horne <shorne@gmail.com> wrote:

> > -
> > -#define access_ok(addr, size)                                                \
> > -({                                                                   \
> > -     __chk_user_ptr(addr);                                           \
> > -     __range_ok((unsigned long)(addr), (size));                      \
> > -})
> > +#include <asm-generic/access_ok.h>
>
> I was going to ask why we are missing __chk_user_ptr in the generic version.
> But this is basically now a no-op so I think its OK.

Correct, the type checking is implied by making __access_ok() an inline
function that takes a __user pointer.

> Acked-by: Stafford Horne <shorne@gmail.com> [openrisc, asm-generic]

Thanks!

       Arnd
