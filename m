Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C7302F41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 23:44:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPlKh5cyvzDqvV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 09:44:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=v0CUYdsf; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPlHS6MWYzDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 09:42:26 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id p185so14891039ybg.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 14:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uUoNf9BBFKkgh2ppnaejSB621RRoaZzYwArQ/+nGs5I=;
 b=v0CUYdsfdi78E2T5lQL29cB54rzB1CtEtGaQywaH8ndp/fK0k15CDrNwlYXhEyXGnP
 6Y0DHhTk81aGdBor3d8zkKCVoBmT7D/aXbgN9n3yrbsMPRuS2Rkmo8oNkhOz/3Ki0RfW
 SmbaFODL6ySPYtok39wzAJVIjIvR/s2vbkntxDz+Ej1rnJsMqqury3SsKXGmeviI1BDH
 SoD+MDozlVTb89r7Zm2Gf6P18wk2T4ZUw7OavjOg7m/kq5cQNSvN+NKHXZvv9HhVNZlq
 tEI6rOU7qvZuDYFGdHCnakyn8Y0+1yJrwo3rRs/OdJZ0ScW7WullbDpbVzq35Aa+PxTR
 lj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uUoNf9BBFKkgh2ppnaejSB621RRoaZzYwArQ/+nGs5I=;
 b=bJeBPEKoiH525XZmUVB5Hzn/Xj/wH3nJtqE2h6CUz2j9S4fhge0IFVegWHVl4O8Mxn
 KxWPV3Zv5g9Twk6HNlO4sWnPJrWeVcS1VYkDPr/q8L9+Vn3JQhnqhLmoa6Vk2c0gQJ5G
 /tSIwNLAH5i7RsBpVsBZscZtPvt7MfJ4wIjDc7wXOAi66OV04KF6f6gb0x4XMLFZnE23
 hh5pCqbdgieyWULRFyVEPNkcMRHAZdd2Kskx8NHdLPyWDYlBj0pyAdCSXxExnHKb0up0
 89OWDVGHA2ItPxdiULJACa+LfwVZiT9hW1pr9Fa1zxFPe+G2C3GB1OKe5bkrWQUwlCCI
 8K7Q==
X-Gm-Message-State: AOAM532UiCpctSrcrKIYFWBZ9Cpd03rXbRVxthrSYRlWVU+34dyR/ibj
 jLUu/KpULc2aNDIsfiFSTb5vlTmxQeXmFj76sN0AWw==
X-Google-Smtp-Source: ABdhPJzstPk4hc3oMjRFyfDYbQKEtMFjvVapEAWEK8W/jH+3yeTl2JV0+Uap2GESBQLTIzc5VXYaLlyzC7kWrcxtQPQ=
X-Received: by 2002:a25:3345:: with SMTP id z66mr4179764ybz.466.1611614542807; 
 Mon, 25 Jan 2021 14:42:22 -0800 (PST)
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
In-Reply-To: <a24391e62b107040435766fff52bdd31@walle.cc>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 25 Jan 2021 14:41:46 -0800
Message-ID: <CAGETcx8FO+YSM0jwCnDdnvE3NCdjZ=1FSmAZpyaOEOvCgd4SXw@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Michael Walle <michael@walle.cc>
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
 Minghuan Lian <minghuan.Lian@nxp.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 25, 2021 at 11:49 AM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-01-21 12:01, schrieb Geert Uytterhoeven:
> > Hi Saravana,
> >
> > On Thu, Jan 21, 2021 at 1:05 AM Saravana Kannan <saravanak@google.com>
> > wrote:
> >> On Wed, Jan 20, 2021 at 3:53 PM Michael Walle <michael@walle.cc>
> >> wrote:
> >> > Am 2021-01-20 20:47, schrieb Saravana Kannan:
> >> > > On Wed, Jan 20, 2021 at 11:28 AM Michael Walle <michael@walle.cc>
> >> > > wrote:
> >> > >>
> >> > >> [RESEND, fat-fingered the buttons of my mail client and converted
> >> > >> all CCs to BCCs :(]
> >> > >>
> >> > >> Am 2021-01-20 20:02, schrieb Saravana Kannan:
> >> > >> > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> >> > >> >>
> >> > >> >> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> >> > >> >> wrote:
> >> > >> >> >
> >> > >> >> > fw_devlink will defer the probe until all suppliers are ready. We can't
> >> > >> >> > use builtin_platform_driver_probe() because it doesn't retry after probe
> >> > >> >> > deferral. Convert it to builtin_platform_driver().
> >> > >> >>
> >> > >> >> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> >> > >> >> shouldn't it be fixed or removed?
> >> > >> >
> >> > >> > I was actually thinking about this too. The problem with fixing
> >> > >> > builtin_platform_driver_probe() to behave like
> >> > >> > builtin_platform_driver() is that these probe functions could be
> >> > >> > marked with __init. But there are also only 20 instances of
> >> > >> > builtin_platform_driver_probe() in the kernel:
> >> > >> > $ git grep ^builtin_platform_driver_probe | wc -l
> >> > >> > 20
> >> > >> >
> >> > >> > So it might be easier to just fix them to not use
> >> > >> > builtin_platform_driver_probe().
> >> > >> >
> >> > >> > Michael,
> >> > >> >
> >> > >> > Any chance you'd be willing to help me by converting all these to
> >> > >> > builtin_platform_driver() and delete builtin_platform_driver_probe()?
> >> > >>
> >> > >> If it just moving the probe function to the _driver struct and
> >> > >> remove the __init annotations. I could look into that.
> >> > >
> >> > > Yup. That's pretty much it AFAICT.
> >> > >
> >> > > builtin_platform_driver_probe() also makes sure the driver doesn't ask
> >> > > for async probe, etc. But I doubt anyone is actually setting async
> >> > > flags and still using builtin_platform_driver_probe().
> >> >
> >> > Hasn't module_platform_driver_probe() the same problem? And there
> >> > are ~80 drivers which uses that.
> >>
> >> Yeah. The biggest problem with all of these is the __init markers.
> >> Maybe some familiar with coccinelle can help?
> >
> > And dropping them will increase memory usage.
>
> Although I do have the changes for the builtin_platform_driver_probe()
> ready, I don't think it makes much sense to send these unless we agree
> on the increased memory footprint. While there are just a few
> builtin_platform_driver_probe() and memory increase _might_ be
> negligible, there are many more module_platform_driver_probe().

While it's good to drop code that'll not be used past kernel init, the
module_platform_driver_probe() is going even more extreme. It doesn't
even allow deferred probe (well before kernel init is done). I don't
think that behavior is right and that's why we should delete it. Also,
I doubt if any of these probe functions even take up 4KB of memory.

-Saravana
