Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A82FE846
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 12:03:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLzz73s41zDrR4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 22:03:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.44; helo=mail-ot1-f44.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLzx85RK1zDr7l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 22:02:04 +1100 (AEDT)
Received: by mail-ot1-f44.google.com with SMTP id i20so1197163otl.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 03:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B0t6IbQwZ6aPHm7zibBMR6oc08hDXRFl0UUCk6sC9bM=;
 b=WpQv9y/H0yKzc6P2XIiBBVRThS3pnr5ycpGrLvpItOOgpjiGAia1hVx698wwJJsIjn
 VWuk1ShP1oLCUMEVm/7LB+dos+BjBFgCcvYlUiMQYAzvImJ+YzjF5znreCF95GpDU4E1
 7L21eyGUN7FvgrMWY9TNYctOozpJfowXksV2iuvXyx3nuazyjBFR6Ex09LxpOhpP2mKL
 tum4khZP01r7n/VMDISQyrSHPLPYB+u1OKqB55oDASbC4NEn+JmpidQj/i/yAA+WMMMs
 p10AWhxE9YYS61dN80tDubcYYwWNOkZ8V8Mdk5AD4hreAjGKe/BEQLC+WUce4Wb4sRpB
 D8Hw==
X-Gm-Message-State: AOAM531ZFzPzPEQJ0W6Xm0W8tCC0jEcaPXTBe0z2Gd38k5Yeklqa9Puc
 5nHKwg1qIPkDsGydBqjFSqaTGuKmFjsdXdZOzk0=
X-Google-Smtp-Source: ABdhPJzSbFq2Zg/MF32GZEaX+aMqzCGFlyozhpNYPxHvt5ug1jBRwJ1lgTOfRSPtDNp9bqyOAhcuPvtUBSO1aAA+gxU=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr9868576otr.107.1611226921014;
 Thu, 21 Jan 2021 03:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
 <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
 <c3e35b90e173b15870a859fd7001a712@walle.cc>
 <CAGETcx8eZRd1fJ3yuO_t2UXBFHObeNdv-c8oFH3mXw6zi=zOkQ@mail.gmail.com>
 <f706c0e4b684e07635396fcf02f4c9a6@walle.cc>
 <CAGETcx8_6Hp+MWFOhRohXwdWFSfCc7A=zpb5QYNHZE5zv0bDig@mail.gmail.com>
In-Reply-To: <CAGETcx8_6Hp+MWFOhRohXwdWFSfCc7A=zpb5QYNHZE5zv0bDig@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Jan 2021 12:01:50 +0100
Message-ID: <CAMuHMdWvFej-6vkaLM44t7eX2LpkDSXu4_7VH-X-3XRueXTO=A@mail.gmail.com>
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

On Thu, Jan 21, 2021 at 1:05 AM Saravana Kannan <saravanak@google.com> wrote:
> On Wed, Jan 20, 2021 at 3:53 PM Michael Walle <michael@walle.cc> wrote:
> > Am 2021-01-20 20:47, schrieb Saravana Kannan:
> > > On Wed, Jan 20, 2021 at 11:28 AM Michael Walle <michael@walle.cc>
> > > wrote:
> > >>
> > >> [RESEND, fat-fingered the buttons of my mail client and converted
> > >> all CCs to BCCs :(]
> > >>
> > >> Am 2021-01-20 20:02, schrieb Saravana Kannan:
> > >> > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> > >> >>
> > >> >> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> > >> >> wrote:
> > >> >> >
> > >> >> > fw_devlink will defer the probe until all suppliers are ready. We can't
> > >> >> > use builtin_platform_driver_probe() because it doesn't retry after probe
> > >> >> > deferral. Convert it to builtin_platform_driver().
> > >> >>
> > >> >> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> > >> >> shouldn't it be fixed or removed?
> > >> >
> > >> > I was actually thinking about this too. The problem with fixing
> > >> > builtin_platform_driver_probe() to behave like
> > >> > builtin_platform_driver() is that these probe functions could be
> > >> > marked with __init. But there are also only 20 instances of
> > >> > builtin_platform_driver_probe() in the kernel:
> > >> > $ git grep ^builtin_platform_driver_probe | wc -l
> > >> > 20
> > >> >
> > >> > So it might be easier to just fix them to not use
> > >> > builtin_platform_driver_probe().
> > >> >
> > >> > Michael,
> > >> >
> > >> > Any chance you'd be willing to help me by converting all these to
> > >> > builtin_platform_driver() and delete builtin_platform_driver_probe()?
> > >>
> > >> If it just moving the probe function to the _driver struct and
> > >> remove the __init annotations. I could look into that.
> > >
> > > Yup. That's pretty much it AFAICT.
> > >
> > > builtin_platform_driver_probe() also makes sure the driver doesn't ask
> > > for async probe, etc. But I doubt anyone is actually setting async
> > > flags and still using builtin_platform_driver_probe().
> >
> > Hasn't module_platform_driver_probe() the same problem? And there
> > are ~80 drivers which uses that.
>
> Yeah. The biggest problem with all of these is the __init markers.
> Maybe some familiar with coccinelle can help?

And dropping them will increase memory usage.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
