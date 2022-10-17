Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7222A6012F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 17:49:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrhJY28Kmz3dw7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 02:49:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.180; helo=mail-qk1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrhHx4r9tz3000
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 02:49:16 +1100 (AEDT)
Received: by mail-qk1-f180.google.com with SMTP id m6so6876131qkm.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 08:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1hr660YTne5HWG47TPibAhxpQ0b+WJkg6fuMvgqI+4=;
        b=RrRp5vfDi5WqFvuGhe+NhSTaM4iTIjxugpqwUuBF+liJnK5MfU4omSanLGWgpKD36G
         WgIYWBA8D2eY+EiSoeAImPOoXeUyxTXeOVdB1Y2U8UmLYWUnwNG1pwfsIB7AAj16J3ys
         1nebyKdnzAox2IePbx0p8+K4Onenp7QKBaMDWMp/4qeWPmnaROc9VyZ8KzV1xmLcMDLA
         O1OfxM2FbP5OrheqX4Hxfd3B3MWig5SBfDPIoodfL2pK8dcNM6QSkDSUri6CBqF75AYc
         /hrqJuJfNbmA7xmBKJcNGI8L6AsjcAl3O3H/F53l2KqDZo+3fr7f0aBu4FcLiOxmRri9
         pzjw==
X-Gm-Message-State: ACrzQf1rkw26cfZaZVMCJoarxpv3FUysfD2yLV960zWjiSLy/gTDi0JV
	BF8Iwr1kkODS53eHbbC0dUiOIobw/FzINA==
X-Google-Smtp-Source: AMsMyM5xhGyfImcm4uJmAc3Hsfd+yhhGV87EuMr1+zR5qK5v2Kzs8EtYPXHgSj4vsqnXmO2+dh5zBw==
X-Received: by 2002:a05:620a:28d3:b0:6ee:cffb:21ef with SMTP id l19-20020a05620a28d300b006eecffb21efmr8023712qkp.123.1666021754151;
        Mon, 17 Oct 2022 08:49:14 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id h14-20020ac8568e000000b0039913d588fbsm80002qta.48.2022.10.17.08.49.13
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 08:49:13 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id y205so13728585yby.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 08:49:13 -0700 (PDT)
X-Received: by 2002:a25:687:0:b0:6c2:2b0c:26e with SMTP id 129-20020a250687000000b006c22b0c026emr9748099ybg.202.1666021753122;
 Mon, 17 Oct 2022 08:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220902215737.981341-1-sean.anderson@seco.com>
 <20220902215737.981341-6-sean.anderson@seco.com> <CAMuHMdWqTtjuOvDo9qxgDVpm+RBGm7BEgpdqVRH1n_dLGoYLTA@mail.gmail.com>
 <086a6f02-4495-510e-9fc5-64f95e7d55f6@seco.com>
In-Reply-To: <086a6f02-4495-510e-9fc5-64f95e7d55f6@seco.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Oct 2022 17:49:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-E4ykVdCugCyJt7_uKZZHyc=jStiL7DOiq2RZr6GTvQ@mail.gmail.com>
Message-ID: <CAMuHMdW-E4ykVdCugCyJt7_uKZZHyc=jStiL7DOiq2RZr6GTvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 05/14] net: fman: Map the base address once
To: Sean Anderson <sean.anderson@seco.com>
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
Cc: Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Camelia Groza <camelia.groza@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

On Mon, Oct 17, 2022 at 5:34 PM Sean Anderson <sean.anderson@seco.com> wrote:
> On 10/17/22 11:15 AM, Geert Uytterhoeven wrote:
> > On Sat, Sep 3, 2022 at 12:00 AM Sean Anderson <sean.anderson@seco.com> wrote:
> >> We don't need to remap the base address from the resource twice (once in
> >> mac_probe() and again in set_fman_mac_params()). We still need the
> >> resource to get the end address, but we can use a single function call
> >> to get both at once.
> >>
> >> While we're at it, use platform_get_mem_or_io and devm_request_resource
> >> to map the resource. I think this is the more "correct" way to do things
> >> here, since we use the pdev resource, instead of creating a new one.
> >> It's still a bit tricky, since we need to ensure that the resource is a
> >> child of the fman region when it gets requested.
> >>
> >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> >> Acked-by: Camelia Groza <camelia.groza@nxp.com>
> >
> > Thanks for your patch, which is now commit 262f2b782e255b79
> > ("net: fman: Map the base address once") in v6.1-rc1.
> >
> >> --- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth_sysfs.c
> >> +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth_sysfs.c
> >> @@ -18,7 +18,7 @@ static ssize_t dpaa_eth_show_addr(struct device *dev,
> >>
> >>         if (mac_dev)
> >>                 return sprintf(buf, "%llx",
> >> -                               (unsigned long long)mac_dev->res->start);
> >> +                               (unsigned long long)mac_dev->vaddr);
> >
> > On 32-bit:
> >
> >     warning: cast from pointer to integer of different size
> > [-Wpointer-to-int-cast]
> >
> > Obviously you should cast to "uintptr_t" or "unsigned long" instead,
> > and change the "%llx" to "%p" or "%lx"...
>
> Isn't there a %px for this purpose?

Yes there is.  But if it makes sense to use that depends on the
still to be answered questions at the bottom...

> > However, taking a closer look:
> >   1. The old code exposed a physical address to user space, the new
> >      code exposes the mapped virtual address.
> >      Is that change intentional?
>
> No, this is not intentional. So to make this backwards-compatible, I
> suppose I need a virt_to_phys?

I think virt_to_phys() will work only on real memory, not on MMIO,
so you may need to reintroduce the resource again.

> >   2. Virtual addresses are useless in user space.
> >      Moreover, addresses printed by "%p" are obfuscated, as this is
> >      considered a security issue. Likewise for working around this by
> >      casting to an integer.
>
> Yes, you're right that this probably shouldn't be exposed to userspace.
>
> > What's the real purpose of dpaa_eth_show_addr()?
>
> I have no idea. This is a question for Madalin.
>
> > Perhaps it should be removed?
>
> That would be reasonable IMO.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
