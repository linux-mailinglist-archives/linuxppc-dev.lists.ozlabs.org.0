Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AB9256A58
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 23:24:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bf8cR1WDfzDqgl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 07:24:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=AbmLqUhk; 
 dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bf8Wv3Bx4zDqcq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 07:20:40 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id q8so1509461lfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZQqP/9kQfBYLXOwwY2/9XmqjIYfArF6oBpsrKgPoWk=;
 b=AbmLqUhkivcRKLvSZehoY6HsfcHP75SHwBbGTVYqRQmORnoNriFSmxObwU2VmHmy63
 E4Vz99EJMsmm7F9WygW1iy4/YZzTwxsfG/d5H+d6vMGaF7dADK4foWIt+zXy2W9YpTq+
 RCbxEzNzwxpfl9Mn69NXw7mfFaxWWWF27/u6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZQqP/9kQfBYLXOwwY2/9XmqjIYfArF6oBpsrKgPoWk=;
 b=uSOTjzgqQpy3DDwEHp8+ZgZRO71B/85OuDfbF2Yh7SPGvXtRQ3Am4MkN+zvdN4FWU0
 vE9bfimnmf51WchSWfpjrN0KUtiVEUhJv8z+LSn6JO8EojV1NdGU5UX08NThDOOoLMnT
 ij+b51QkLs/n2kboGS3QUy1AeBjISm6OkaZooCliJmC/jtUDU36PAzIKS0E2vbM+sBPI
 tCGC/8NtidjGcwa1qRQjen1WXK2JdNuMtw1flsWopL4p4nzmoOElFgvktSt5IzlkjBwM
 Sc+5v7HS4u6iKN1aZwp8TR96nDGWEWhu+njNTCRoQ34+SJuEKEEyG6woANw21qbvPb6Z
 qzZg==
X-Gm-Message-State: AOAM533TWhpeo6BBNbhkr87qjO7BMJFLKDLmEFrw7XOIhQ8Wn9ddfT0a
 r3XYjEFqIRcRgTaJIlcmMGS6BubT1FhQug==
X-Google-Smtp-Source: ABdhPJz0KC6qI3Dk78efcoPavmgfKw8qylvcUGZ+5G529RdaFcULHONGBciF2/FXuZO/BSXa8bN0hA==
X-Received: by 2002:a19:ef13:: with SMTP id n19mr2261589lfh.1.1598736032623;
 Sat, 29 Aug 2020 14:20:32 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id a23sm675681ljp.121.2020.08.29.14.20.30
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 14:20:31 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id t6so2598336ljk.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 14:20:30 -0700 (PDT)
X-Received: by 2002:a2e:b5a3:: with SMTP id f3mr1027329ljn.70.1598736030159;
 Sat, 29 Aug 2020 14:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200829105116.GA246533@roeck-us.net>
 <20200829124538.7475-1-luc.vanoostenryck@gmail.com>
 <CAHk-=whH0ApHy0evN0q6AwQ+-a5RK56oMkYkkCJtTMnaq4FrNQ@mail.gmail.com>
 <59cc6c99-9894-08b3-1075-2156e39bfc8e@roeck-us.net>
In-Reply-To: <59cc6c99-9894-08b3-1075-2156e39bfc8e@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 29 Aug 2020 14:20:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDEiWF_DsCVFPFqNa+JCS5SkOygbqeq8_=ZNOrFt7-rg@mail.gmail.com>
Message-ID: <CAHk-=wjDEiWF_DsCVFPFqNa+JCS5SkOygbqeq8_=ZNOrFt7-rg@mail.gmail.com>
Subject: Re: [PATCH] fsldma: fsl_ioread64*() do not need lower_32_bits()
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 29, 2020 at 1:40 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Except for
>
> CHECK: spaces preferred around that '+' (ctx:VxV)
> #29: FILE: drivers/dma/fsldma.h:223:
> +       u32 val_lo = in_be32((u32 __iomem *)addr+1);

Added spaces.

> I don't see anything wrong with it either, so
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Since I didn't see the real problem with the original code,
> I'd take that with a grain of salt, though.

Well, honestly, the old code was so confused that just making it build
is clearly already an improvement even if everything else were to be
wrong.

So I committed my "fix". If it turns out there's more wrong in there
and somebody tests it, we can fix it again. But now it hopefully
compiles, at least.

My bet is that if that driver ever worked on ppc32, it will continue
to work whatever we do to that function.

I _think_ the old code happened to - completely by mistake - get the
value right for the case of "little endian access, with dma_addr_t
being 32-bit". Because then it would still read the upper bits wrong,
but the cast to dma_addr_t would then throw those bits away. And the
lower bits would be right.

But for big-endian accesses or for ARCH_DMA_ADDR_T_64BIT it really
looks like it always returned a completely incorrect value.

And again - the driver may have worked even with that completely
incorrect value, since the use of it seems to be very incidental.

In either case ("it didn't work before" or "it worked because the
value doesn't really matter"), I don't think I could possibly have
made things worse.

Famous last words.

                Linus
