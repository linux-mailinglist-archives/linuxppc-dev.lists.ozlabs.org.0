Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 676693054E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 08:45:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQbHt2HlFzDqnr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 18:45:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.46; helo=mail-ot1-f46.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQbFv1qB8zDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 18:44:00 +1100 (AEDT)
Received: by mail-ot1-f46.google.com with SMTP id s2so834320otp.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 23:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0dGkBBCOjjdRO5NeNomyXurGTss4C1Z8jAZPD1nTr0=;
 b=R4Qb4ZebzrP/B/2KlvJI2/rX23Jr6CHMt4sEP1ucnDYae6tLYruJxAXE5QKkYL5TWO
 MgnkTQPiO7OcvakqIbTO1hKpe6wovZXZfezXi6uGC/FuzqOa/YYU7yaeGFig9y3ZdAPl
 ETYfBKoYkiWfcVdG3TQ7Lj28uJDZMRXZKMMdH7FGPmAzMrT9JTk23dyJB8ENfAe/WjmU
 sPhIieASNG+6qqxg8r3qggJL3oDaDwD7A+8A3uBMd/XM7o5FzLDKWEBCq5cB5bvn33/J
 +8BrSDIbBQxqTN/JWv6+kMC43A/yOXtkzafu2VfmBfuPZOZC9ceFCWeIJSGGOfuWokoC
 7nWw==
X-Gm-Message-State: AOAM532EcacNHTHCM7zocxBwqhtZVdIknJboghkUAIGN56NGr6BtULU0
 0hTOgZcXSAse0/nXFnAQ2EKkPU1rN4gFtwcqmvE=
X-Google-Smtp-Source: ABdhPJytEiLX+kMjV4Ea2i2rFfKnTCKJB2DxU0jLTV+BpUesrQ9gHru0x+sIRyJPwSKOmvFMZ1Gze3L0qvmdO0bLsr0=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr6698124otr.107.1611733436883;
 Tue, 26 Jan 2021 23:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
 <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
 <c3e35b90e173b15870a859fd7001a712@walle.cc>
 <CAGETcx8eZRd1fJ3yuO_t2UXBFHObeNdv-c8oFH3mXw6zi=zOkQ@mail.gmail.com>
 <f706c0e4b684e07635396fcf02f4c9a6@walle.cc>
 <CAGETcx8_6Hp+MWFOhRohXwdWFSfCc7A=zpb5QYNHZE5zv0bDig@mail.gmail.com>
 <CAMuHMdWvFej-6vkaLM44t7eX2LpkDSXu4_7VH-X-3XRueXTO=A@mail.gmail.com>
 <a24391e62b107040435766fff52bdd31@walle.cc>
 <CAGETcx8FO+YSM0jwCnDdnvE3NCdjZ=1FSmAZpyaOEOvCgd4SXw@mail.gmail.com>
 <CAMuHMdX8__juNc-Lx8Tu9abMKq-pT=yA4s6D1w4ZeStKOasGpg@mail.gmail.com>
 <CAGETcx-0G-Y8wT_+BfP5vbi0gW6KonwgoJ6DdqjaGbFkutTGag@mail.gmail.com>
In-Reply-To: <CAGETcx-0G-Y8wT_+BfP5vbi0gW6KonwgoJ6DdqjaGbFkutTGag@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Jan 2021 08:43:45 +0100
Message-ID: <CAMuHMdXMaAtrbQibJh+Z2v5qhe_Tg0hQU9YqxuU0ow_iNO1atg@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Saravana Kannan <saravanak@google.com>
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
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Michael Walle <michael@walle.cc>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Saravana,

On Wed, Jan 27, 2021 at 1:44 AM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Jan 26, 2021 at 12:50 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Jan 25, 2021 at 11:42 PM Saravana Kannan <saravanak@google.com> wrote:
> > > On Mon, Jan 25, 2021 at 11:49 AM Michael Walle <michael@walle.cc> wrote:
> > > > Am 2021-01-21 12:01, schrieb Geert Uytterhoeven:
> > > > > On Thu, Jan 21, 2021 at 1:05 AM Saravana Kannan <saravanak@google.com>
> > > > > wrote:
> > > > >> On Wed, Jan 20, 2021 at 3:53 PM Michael Walle <michael@walle.cc>
> > > > >> wrote:
> > > > >> > Am 2021-01-20 20:47, schrieb Saravana Kannan:
> > > > >> > > On Wed, Jan 20, 2021 at 11:28 AM Michael Walle <michael@walle.cc>
> > > > >> > > wrote:
> > > > >> > >>
> > > > >> > >> [RESEND, fat-fingered the buttons of my mail client and converted
> > > > >> > >> all CCs to BCCs :(]
> > > > >> > >>
> > > > >> > >> Am 2021-01-20 20:02, schrieb Saravana Kannan:
> > > > >> > >> > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> > > > >> > >> >>
> > > > >> > >> >> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> > > > >> > >> >> wrote:
> > > > >> > >> >> >
> > > > >> > >> >> > fw_devlink will defer the probe until all suppliers are ready. We can't
> > > > >> > >> >> > use builtin_platform_driver_probe() because it doesn't retry after probe
> > > > >> > >> >> > deferral. Convert it to builtin_platform_driver().
> > > > >> > >> >>
> > > > >> > >> >> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> > > > >> > >> >> shouldn't it be fixed or removed?
> > > > >> > >> >
> > > > >> > >> > I was actually thinking about this too. The problem with fixing
> > > > >> > >> > builtin_platform_driver_probe() to behave like
> > > > >> > >> > builtin_platform_driver() is that these probe functions could be
> > > > >> > >> > marked with __init. But there are also only 20 instances of
> > > > >> > >> > builtin_platform_driver_probe() in the kernel:
> > > > >> > >> > $ git grep ^builtin_platform_driver_probe | wc -l
> > > > >> > >> > 20
> > > > >> > >> >
> > > > >> > >> > So it might be easier to just fix them to not use
> > > > >> > >> > builtin_platform_driver_probe().
> > > > >> > >> >
> > > > >> > >> > Michael,
> > > > >> > >> >
> > > > >> > >> > Any chance you'd be willing to help me by converting all these to
> > > > >> > >> > builtin_platform_driver() and delete builtin_platform_driver_probe()?
> > > > >> > >>
> > > > >> > >> If it just moving the probe function to the _driver struct and
> > > > >> > >> remove the __init annotations. I could look into that.
> > > > >> > >
> > > > >> > > Yup. That's pretty much it AFAICT.
> > > > >> > >
> > > > >> > > builtin_platform_driver_probe() also makes sure the driver doesn't ask
> > > > >> > > for async probe, etc. But I doubt anyone is actually setting async
> > > > >> > > flags and still using builtin_platform_driver_probe().
> > > > >> >
> > > > >> > Hasn't module_platform_driver_probe() the same problem? And there
> > > > >> > are ~80 drivers which uses that.
> > > > >>
> > > > >> Yeah. The biggest problem with all of these is the __init markers.
> > > > >> Maybe some familiar with coccinelle can help?
> > > > >
> > > > > And dropping them will increase memory usage.
> > > >
> > > > Although I do have the changes for the builtin_platform_driver_probe()
> > > > ready, I don't think it makes much sense to send these unless we agree
> > > > on the increased memory footprint. While there are just a few
> > > > builtin_platform_driver_probe() and memory increase _might_ be
> > > > negligible, there are many more module_platform_driver_probe().
> > >
> > > While it's good to drop code that'll not be used past kernel init, the
> > > module_platform_driver_probe() is going even more extreme. It doesn't
> > > even allow deferred probe (well before kernel init is done). I don't
> > > think that behavior is right and that's why we should delete it. Also,
> >
> > This construct is typically used for builtin hardware for which the
> > dependencies are registered very early, and thus known to probe at
> > first try (if present).
> >
> > > I doubt if any of these probe functions even take up 4KB of memory.
> >
> > How many 4 KiB pages do you have in a system with 10 MiB of SRAM?
> > How many can you afford to waste?
>
> There are only a few instances of this macro in the kernel. How many

$ git grep -lw builtin_platform_driver_probe | wc -l
21
$ git grep -lw module_platform_driver_probe | wc -l
86

+ the ones that haven't been converted to the above yet:

$ git grep -lw platform_driver_probe | wc -l
58

> of those actually fit the description above? We can probably just
> check the DT?

What do you mean by checking the DT?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
