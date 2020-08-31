Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B32573DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 08:41:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg0wH2XkWzDqSq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 16:41:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ZPg3a5ub; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg0st0VWFzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 16:39:13 +1000 (AEST)
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28B45206B5;
 Mon, 31 Aug 2020 06:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598855951;
 bh=U4io1zxnAO7T1rZA8Y3taxV0t0AWxjlAw/i8bJz3C0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZPg3a5ubsLYkjCjzZHic1V1OAPnSWHBrTe1uSB/3HF0EDYGqOxDOcq3yo22pE+TJy
 YedGVzZOPrZ06Fa2bPpVV6MYk/4cTA0prmsYmd5OsLNZogaD0xX/SXRZ3jwPmFIMwG
 rFMCFA0mKyRuZfo8FJ+hm+XDGuPrkg4+K/tPsIxM=
Date: Mon, 31 Aug 2020 12:09:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] fsldma: fsl_ioread64*() do not need lower_32_bits()
Message-ID: <20200831063906.GD2639@vkoul-mobl>
References: <20200829105116.GA246533@roeck-us.net>
 <20200829124538.7475-1-luc.vanoostenryck@gmail.com>
 <CAHk-=whH0ApHy0evN0q6AwQ+-a5RK56oMkYkkCJtTMnaq4FrNQ@mail.gmail.com>
 <59cc6c99-9894-08b3-1075-2156e39bfc8e@roeck-us.net>
 <CAHk-=wjDEiWF_DsCVFPFqNa+JCS5SkOygbqeq8_=ZNOrFt7-rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjDEiWF_DsCVFPFqNa+JCS5SkOygbqeq8_=ZNOrFt7-rg@mail.gmail.com>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, dma <dmaengine@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Linus,

On 29-08-20, 14:20, Linus Torvalds wrote:
> On Sat, Aug 29, 2020 at 1:40 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Except for
> >
> > CHECK: spaces preferred around that '+' (ctx:VxV)
> > #29: FILE: drivers/dma/fsldma.h:223:
> > +       u32 val_lo = in_be32((u32 __iomem *)addr+1);
> 
> Added spaces.
> 
> > I don't see anything wrong with it either, so
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Since I didn't see the real problem with the original code,
> > I'd take that with a grain of salt, though.
> 
> Well, honestly, the old code was so confused that just making it build
> is clearly already an improvement even if everything else were to be
> wrong.
> 
> So I committed my "fix". If it turns out there's more wrong in there
> and somebody tests it, we can fix it again. But now it hopefully
> compiles, at least.
> 
> My bet is that if that driver ever worked on ppc32, it will continue
> to work whatever we do to that function.
> 
> I _think_ the old code happened to - completely by mistake - get the
> value right for the case of "little endian access, with dma_addr_t
> being 32-bit". Because then it would still read the upper bits wrong,
> but the cast to dma_addr_t would then throw those bits away. And the
> lower bits would be right.
> 
> But for big-endian accesses or for ARCH_DMA_ADDR_T_64BIT it really
> looks like it always returned a completely incorrect value.
> 
> And again - the driver may have worked even with that completely
> incorrect value, since the use of it seems to be very incidental.

Thank you for the fix.

Acked-By: Vinod Koul <vkoul@kernel.org>

> 
> In either case ("it didn't work before" or "it worked because the
> value doesn't really matter"), I don't think I could possibly have
> made things worse.
> 
> Famous last words.

I guess no one tested this on 32bits seems to have caused this.

-- 
~Vinod
