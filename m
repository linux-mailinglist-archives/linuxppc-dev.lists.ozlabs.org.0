Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 915436F8FEE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 09:27:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCzdn3d9jz3fKH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 17:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TPV99snz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TPV99snz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCzcs0sssz3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 17:26:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B41B76184D
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 07:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DCCC433A4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683357976;
	bh=/pqLqv84J2jWuKl1Lk7AhETw9xQvFqEdpB7kxyH6fI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TPV99snzYwZOD9BmNnoZD01Nn03KCqhFBWtRqXqUvxhP1vwzj78AMiF66AxfHHSWC
	 PEJpwFvgeEwz/jEVlYGuNobX6M8M495siU/w9IJvSIBBY/9k2lPGaDjlLwEj2pyNwK
	 4SmO6CtjcwdgzMVRGNu9bJGTQ05BmZGrhLbUjCgn+VCAUz4UHVofiECX0tpCZ4FpsF
	 lGo+c80MfAwBoc6F5CdXjN0agty/CCIHMxNkw2HT8qYd12+ljEnTf8JgwQ/7KOncLf
	 FuPxuCK7vGvvsh/bAwmruJoYPCpiZn4LAgT9W1iLdVWXgVjVwyajWXuVI8Z3KBf7Rg
	 D6NqgzcNFZoEg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f14468ef54so3037914e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 May 2023 00:26:15 -0700 (PDT)
X-Gm-Message-State: AC+VfDxZfAZD4ObELtWCsU8Y54SXGGUn9V3CyDq2Scv+s7DdugZxEMOe
	22rsHHA+c+FeljEaASkLRngShDfPKEctNg7IZK4=
X-Google-Smtp-Source: ACHHUZ4qS4i5Im7J3Ox7v0tb1ueCK3xmeH5uM44ArLR4roviIMhnWXngkOBBuBeiDbJ5qp2UGTwR6EkhF28IpBmVniU=
X-Received: by 2002:a17:907:3d9f:b0:959:5454:1db7 with SMTP id
 he31-20020a1709073d9f00b0095954541db7mr3511012ejc.3.1683357953246; Sat, 06
 May 2023 00:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-10-arnd@kernel.org>
 <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com> <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
In-Reply-To: <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 6 May 2023 15:25:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
Message-ID: <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before
 bidirectional DMA
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Neil Armstrong <neil.armstrong@linaro.org>, "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Arnd Be
 rgmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 5, 2023 at 9:19=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 5, 2023, at 07:47, Guo Ren wrote:
> > On Mon, Mar 27, 2023 at 8:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>
> >>
> >> riscv also invalidates the caches before the transfer, which does
> >> not appear to serve any purpose.
> > Yes, we can't guarantee the CPU pre-load cache lines randomly during
> > dma working.
> >
> > But I've two purposes to keep invalidates before dma transfer:
> >  - We clearly tell the CPU these cache lines are invalid. The caching
> > algorithm would use these invalid slots first instead of replacing
> > valid ones.
> >  - Invalidating is very cheap. Actually, flush and clean have the same
> > performance in our machine.
>
> The main purpose of the series was to get consistent behavior on
> all machines, so I really don't want a custom optimization on
> one architecture. You make a good point about cacheline reuse
> after invalidation, but if we do that, I'd suggest doing this
> across all architectures.
Yes, invalidation of DMA_FROM_DEVICE-for_device is a proposal for all
architectures.

>
> > So, how about:
> >
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoh=
erent.c
> > index d919efab6eba..2c52fbc15064 100644
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -22,8 +22,6 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size=
_t size,
> >                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> >                 break;
> >         case DMA_FROM_DEVICE:
> > -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> > -               break;
> >         case DMA_BIDIRECTIONAL:
> >                 ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> >                 break;
>
> This is something we can consider. Unfortunately, this is something
> that no architecture (except pa-risc, which has other problems)
> does at the moment, so we'd probably need to have a proper debate
> about this.
>
> We already have two conflicting ways to handle DMA_FROM_DEVICE,
> either invalidate/invalidate, or clean/invalidate. I can see
I vote to invalidate/invalidate.

My key point is to let DMA_FROM_DEVICE-for_device invalidate, and
DMA_BIDIRECTIONAL contains DMA_FROM_DEVICE.
So I also agree:
@@ -22,8 +22,6 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t s=
ize,
                 ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
                 break;
         case DMA_FROM_DEVICE:
 -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
 +              ALT_CMO_OP(invalidate, vaddr, size, riscv_cbom_block_size);
                 break;
         case DMA_BIDIRECTIONAL:
                 ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
                 break;

> that flush/invalidate may be a sensible option as well, but I'd
> want to have that discussion after the series is complete, so
> we can come to a generic solution that has the same documented
> behavior across all architectures.
Yes, I agree to unify them into a generic solution first. My proposal
could be another topic in the future.
For that purpose, I give
Acked-by: Guo Ren <guoren@kernel.org>

>
> In particular, if we end up moving arm64 and riscv back to the
> traditional invalidate/invalidate for DMA_FROM_DEVICE and
> document that driver must not rely on buffers getting cleaned
After invalidation, the cache lines are also cleaned, right? So why do
we need to document it additionally?

> before a partial DMA_FROM_DEVICE, the question between clean
> or flush becomes moot as well.
>
> > @@ -42,7 +40,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t =
size,
> >                 break;
> >         case DMA_FROM_DEVICE:
> >         case DMA_BIDIRECTIONAL:
> >                 /* I'm not sure all drivers have guaranteed cacheline
> > alignment. If not, this inval would cause problems */
> > -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> > +               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> >                 break;
>
> This is my original patch, and I would not mix it with the other
> change. The problem with non-aligned DMA_BIDIRECTIONAL buffers in
> is that both flush and inval would be wrong if you get simultaneous
> writes from device and cpu to the same cache line, so there is
> no way to win this. Using inval instead of flush would at least
> work if the CPU data in the cacheline is read-only from the CPU,
> so that seems better than something that is always wrong.
If CPU data in the cacheline is read-only, the cacheline would never
be dirty. Yes, It's always safe.
Okay, I agree we must keep cache-line-aligned. I comment it here, just
worry some dirty drivers couldn't work with the "invalid mechanism"
because of the CPU data corruption, and device data in the cacheline
is useless.

>
> The documented API is that sharing the cache line is not allowed
> at all, so anything that would observe a difference between the
> two is also a bug. One idea that we have considered already is
> that we could overwrite the unused bits of the cacheline with
> poison values and/or mark them as invalid using KASAN for debugging
> purposes, to find drivers that already violate this.
>
>       Arnd



--=20
Best Regards
 Guo Ren
