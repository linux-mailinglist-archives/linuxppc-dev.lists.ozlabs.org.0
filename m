Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D8307284
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 10:27:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRFVs67LdzDrfP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 20:27:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.43; helo=mail-ot1-f43.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRFSf0tC4zDrdk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 20:25:36 +1100 (AEDT)
Received: by mail-ot1-f43.google.com with SMTP id f6so4538257ots.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 01:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NxnDl2GrRpSMyEh3P5ogDr/y/Z8is37UEIaUl8bFtVI=;
 b=lMj5LEmJa3dT0K+J5D80nUcisX6krHppmVGP8L74C/95gW0qrbCMkH0iiDyHB+9SOd
 MLo5zI1mwYgzZSBs6wAkwO50CB5Sz+5MekCKApgxNv7N/dz3cIWpzWGaFd8XxYxFH7dY
 5dY9UDUXNcGxoY8UV+lKYJhFVeDUHJ9wp/LnrX7Vvu/i6KLx7eDMuvSqZIjV00IAeZoV
 wTHJ68YE1RtjRMbImr0nhnAaMc9HL0Glq5hFtZGADZ+G6V85Gs3taYKOCSKps+FUaLKs
 1fbuGqymX5d5xnal35fnTQmojVaqs7grcBhJQsa/gm69CaYAP2Hrh0862iYwJrjbsRi7
 w8Qg==
X-Gm-Message-State: AOAM532Gf9N4nDOk5zBTlwEOYQVYTa/9OfrcuHlxwBxD9ipDUGKt/UjO
 ZmBZIkg7L2+sWHU6otOKhAbAt2LMqb8Qzy4VPyo=
X-Google-Smtp-Source: ABdhPJwIK/ebf1zOwoD5aMbXd7iqWR7pWcC/KS+N8M04xbTvxixhJs51oTBmGIastbl3pUtGaeoY22gVYXFn6StzkmQ=
X-Received: by 2002:a05:6830:1489:: with SMTP id
 s9mr10058455otq.250.1611825934080; 
 Thu, 28 Jan 2021 01:25:34 -0800 (PST)
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
 <CAMuHMdXMaAtrbQibJh+Z2v5qhe_Tg0hQU9YqxuU0ow_iNO1atg@mail.gmail.com>
 <CAGETcx8=woX_SVckG+gs68KMif-JGoy3a1PQGfonMNBH18Ak6A@mail.gmail.com>
 <CAMuHMdUpzaRutO+jKffXtGDoy5g2QoXkbO+-tzbEzibNYbhCuA@mail.gmail.com>
 <CAGETcx_81qOe2LvX-J_PBZWdouykPoPYdf5=yMVhnjgDxAkgaw@mail.gmail.com>
In-Reply-To: <CAGETcx_81qOe2LvX-J_PBZWdouykPoPYdf5=yMVhnjgDxAkgaw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Jan 2021 10:25:22 +0100
Message-ID: <CAMuHMdVHouzMFiGcUz=0M0_RFL-OBvkRvQiF5h56XKDMZuC7Kg@mail.gmail.com>
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

On Wed, Jan 27, 2021 at 6:11 PM Saravana Kannan <saravanak@google.com> wrote:
> On Wed, Jan 27, 2021 at 8:56 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Jan 27, 2021 at 5:42 PM Saravana Kannan <saravanak@google.com> wrote:
> > > On Tue, Jan 26, 2021 at 11:43 PM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > On Wed, Jan 27, 2021 at 1:44 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > > On Tue, Jan 26, 2021 at 12:50 AM Geert Uytterhoeven
> > > > > <geert@linux-m68k.org> wrote:
> > > > > > On Mon, Jan 25, 2021 at 11:42 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > > > > On Mon, Jan 25, 2021 at 11:49 AM Michael Walle <michael@walle.cc> wrote:
> > > > > > > > Am 2021-01-21 12:01, schrieb Geert Uytterhoeven:
> > > > > > > > > On Thu, Jan 21, 2021 at 1:05 AM Saravana Kannan <saravanak@google.com>
> > > > > > > > > wrote:
> > > > > > > > >> On Wed, Jan 20, 2021 at 3:53 PM Michael Walle <michael@walle.cc>
> > > > > > > > >> wrote:
> > > > > > > > >> > Am 2021-01-20 20:47, schrieb Saravana Kannan:
> > > > > > > > >> > > On Wed, Jan 20, 2021 at 11:28 AM Michael Walle <michael@walle.cc>
> > > > > > > > >> > > wrote:
> > > > > > > > >> > >>
> > > > > > > > >> > >> [RESEND, fat-fingered the buttons of my mail client and converted
> > > > > > > > >> > >> all CCs to BCCs :(]
> > > > > > > > >> > >>
> > > > > > > > >> > >> Am 2021-01-20 20:02, schrieb Saravana Kannan:
> > > > > > > > >> > >> > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> > > > > > > > >> > >> >>
> > > > > > > > >> > >> >> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> > > > > > > > >> > >> >> wrote:
> > > > > > > > >> > >> >> >
> > > > > > > > >> > >> >> > fw_devlink will defer the probe until all suppliers are ready. We can't
> > > > > > > > >> > >> >> > use builtin_platform_driver_probe() because it doesn't retry after probe
> > > > > > > > >> > >> >> > deferral. Convert it to builtin_platform_driver().
> > > > > > > > >> > >> >>
> > > > > > > > >> > >> >> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> > > > > > > > >> > >> >> shouldn't it be fixed or removed?
> > > > > > > > >> > >> >
> > > > > > > > >> > >> > I was actually thinking about this too. The problem with fixing
> > > > > > > > >> > >> > builtin_platform_driver_probe() to behave like
> > > > > > > > >> > >> > builtin_platform_driver() is that these probe functions could be
> > > > > > > > >> > >> > marked with __init. But there are also only 20 instances of
> > > > > > > > >> > >> > builtin_platform_driver_probe() in the kernel:
> > > > > > > > >> > >> > $ git grep ^builtin_platform_driver_probe | wc -l
> > > > > > > > >> > >> > 20
> > > > > > > > >> > >> >
> > > > > > > > >> > >> > So it might be easier to just fix them to not use
> > > > > > > > >> > >> > builtin_platform_driver_probe().
> > > > > > > > >> > >> >
> > > > > > > > >> > >> > Michael,
> > > > > > > > >> > >> >
> > > > > > > > >> > >> > Any chance you'd be willing to help me by converting all these to
> > > > > > > > >> > >> > builtin_platform_driver() and delete builtin_platform_driver_probe()?
> > > > > > > > >> > >>
> > > > > > > > >> > >> If it just moving the probe function to the _driver struct and
> > > > > > > > >> > >> remove the __init annotations. I could look into that.
> > > > > > > > >> > >
> > > > > > > > >> > > Yup. That's pretty much it AFAICT.
> > > > > > > > >> > >
> > > > > > > > >> > > builtin_platform_driver_probe() also makes sure the driver doesn't ask
> > > > > > > > >> > > for async probe, etc. But I doubt anyone is actually setting async
> > > > > > > > >> > > flags and still using builtin_platform_driver_probe().
> > > > > > > > >> >
> > > > > > > > >> > Hasn't module_platform_driver_probe() the same problem? And there
> > > > > > > > >> > are ~80 drivers which uses that.
> > > > > > > > >>
> > > > > > > > >> Yeah. The biggest problem with all of these is the __init markers.
> > > > > > > > >> Maybe some familiar with coccinelle can help?
> > > > > > > > >
> > > > > > > > > And dropping them will increase memory usage.
> > > > > > > >
> > > > > > > > Although I do have the changes for the builtin_platform_driver_probe()
> > > > > > > > ready, I don't think it makes much sense to send these unless we agree
> > > > > > > > on the increased memory footprint. While there are just a few
> > > > > > > > builtin_platform_driver_probe() and memory increase _might_ be
> > > > > > > > negligible, there are many more module_platform_driver_probe().
> > > > > > >
> > > > > > > While it's good to drop code that'll not be used past kernel init, the
> > > > > > > module_platform_driver_probe() is going even more extreme. It doesn't
> > > > > > > even allow deferred probe (well before kernel init is done). I don't
> > > > > > > think that behavior is right and that's why we should delete it. Also,
> > > > > >
> > > > > > This construct is typically used for builtin hardware for which the
> > > > > > dependencies are registered very early, and thus known to probe at
> > > > > > first try (if present).
> > > > > >
> > > > > > > I doubt if any of these probe functions even take up 4KB of memory.
> > > > > >
> > > > > > How many 4 KiB pages do you have in a system with 10 MiB of SRAM?
> > > > > > How many can you afford to waste?
> > > > >
> > > > > There are only a few instances of this macro in the kernel. How many
> > > >
> > > > $ git grep -lw builtin_platform_driver_probe | wc -l
> > > > 21
> > > > $ git grep -lw module_platform_driver_probe | wc -l
> > > > 86
> > > >
> > > > + the ones that haven't been converted to the above yet:
> > > >
> > > > $ git grep -lw platform_driver_probe | wc -l
> > > > 58
> > > >
> > >
> > > Yeah, this adds up in terms of the number of places we'd need to fix.
> > > But thinking more about it, a couple of points:
> > > 1. Not all builtin_platform_driver_probe() are problems for
> > > fw_devlink. So we can just fix them as we go if we need to.
> > >
> > > 2. The problem with builtin_platform_driver_probe() isn't really with
> > > the use of __init. It's the fact that it doesn't allow deferred
> > > probes. builtin_platform_driver_probe()/platform_driver_probe() could
> > > still be fixed up to allow deferred probe until we get to the point
> > > where we free the __init section (so at least till late_initcall).
> >
> > That's intentional: it is used for cases that will (must) never be deferred.
> > That's why it's safe to use __init.
>
> So was the usage of builtin_platform_driver_probe() wrong in the
> driver Michael fixed? Because, deferring and probing again clearly
> works?

It wasn't.  The regression is that the driver no longer probes at first
try, because its dependencies are now probed later.  The question is:
why are the dependencies now probed later?  How to fix that?

> Also, "must never be deferred" seems like a weird condition to
> enforce. I think the real "rule" is that if it defers, the platform is
> not expected to work. But disallowing a probe reattempt seems weird.
> What is it going to hurt if it's attempted again? At worst it fails
> one more time?

"must never be deferred" is not the real condition, but "must not be
probed after __init is freed" is (one of them, there may be other, cfr.
the last paragraph below).  The simplest way to guarantee that is to
probe the driver immediately, and only once.

> Also, I'd argue that all/most of the "can't defer, but I'm still a
> proper struct device" cases are all just patchwork to deal with the
> fact we were playing initcall chicken when there was no fw_devlink.
> I'm hoping we can move people away from that mindset. And the first

I agree, partially.  Still, how come the dependencies are no longer
probed before their consumers when fw_devlinks are enabled?
I thought fw_devlinks is supposed to avoid exactly that?

> step towards that would be to allow *platform_probe() to allow
> deferred probes until late_initcall().

At which increase of complexity, to keep track of which drivers can and
cannot be reprobed anymore after late_initcall?
Still, many of these drivers use platform_driver_probe() early for a
reason: because they need to initialize the hardware early. Probing them
later may introduce subtle bugs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
