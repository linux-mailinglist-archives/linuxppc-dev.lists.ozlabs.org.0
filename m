Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F62306134
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 17:44:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQqFb4kbgzDqjY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 03:44:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qhZFI+sM; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQqCD5qQpzDqB0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 03:42:31 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id v200so2638894ybe.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 08:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DhlJDOHouhyzoZng9fJ2frIQEnLbOzAgsBucZ1xKE+Q=;
 b=qhZFI+sMK2QvOM0tX+sbe7tSSfEUacHXU7Wc/fiZiGImf44dQ3z3Uund/QxKZ/1h9Q
 s/GDEhs3T8IvEXbPJ6jxrzs+IEeoSm8SbL88rB75v9+7PODSL5SGoUGJT29bIRR3qL+O
 UFojdWN6LdFC74lUmRR7GHaahe7McQNBwzFUKs3KTsBg8QM3+Yryqa3n6oOmkYNqq0Wn
 SEwaPMwAE4YCyne6qX0eMoZ4ng3Xf66DEfIDE4UarGF1ToJkA5Vtdw69wEtbLSzyVZNr
 JF3QgHYa5DcdVJipQQ9JGZxtkoQU9Y9Y+fja30YayyMKL7/ZOUUmZM9jCZa+nktN0coR
 y9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DhlJDOHouhyzoZng9fJ2frIQEnLbOzAgsBucZ1xKE+Q=;
 b=PzHggoBbvssvv5hV7n/mwO+ReF+8+xJyAiaQN7YSM//3PJIMZOyUtKp9KeHNkdV7Hj
 diElExKJRavVlejT6Yogi5oYEF8IlYQyLcZCmjAlFWL+8j++lCIgNguvgEk4+ePkNF1v
 8C7fyUT6417U+SDq/J2mQbfsFPpeYwEQ0LkfeXbDhvyzd+5rvCkpvYliV6MeARafhAlX
 ar+xB0t3K7so1pYp0WJFdsSgm1lcVN9itdSM6CohH1dXThPJ2hyzE/H86c863KZPZ9tw
 K+LF+qiKGltTqZRQ3A1v2UCccsxibRYOrqilYJIm6DDE1TSEqmGBNgWlj5yjPY5x9s4x
 C9pA==
X-Gm-Message-State: AOAM533j/Sf9ETWEt1PWgbRFbMQtfCnPFvvzokF1HxOrPisJmHyo0IrE
 uqZOq46Mil85+IBiedT0dEjUrKeQZK6bLm588caOJw==
X-Google-Smtp-Source: ABdhPJyTvhJWCJ0GgEFEPNNK+Aj1wHbHsyL+lMhynRRzjgtQPwprNz5H2mOCSJ9e3/s4ARAtNSkp6kxlHCFtD6MzH3I=
X-Received: by 2002:a25:77d4:: with SMTP id s203mr19594855ybc.32.1611765747235; 
 Wed, 27 Jan 2021 08:42:27 -0800 (PST)
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
In-Reply-To: <CAMuHMdXMaAtrbQibJh+Z2v5qhe_Tg0hQU9YqxuU0ow_iNO1atg@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 27 Jan 2021 08:41:50 -0800
Message-ID: <CAGETcx8=woX_SVckG+gs68KMif-JGoy3a1PQGfonMNBH18Ak6A@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Jan 26, 2021 at 11:43 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Wed, Jan 27, 2021 at 1:44 AM Saravana Kannan <saravanak@google.com> wrote:
> > On Tue, Jan 26, 2021 at 12:50 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, Jan 25, 2021 at 11:42 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > On Mon, Jan 25, 2021 at 11:49 AM Michael Walle <michael@walle.cc> wrote:
> > > > > Am 2021-01-21 12:01, schrieb Geert Uytterhoeven:
> > > > > > On Thu, Jan 21, 2021 at 1:05 AM Saravana Kannan <saravanak@google.com>
> > > > > > wrote:
> > > > > >> On Wed, Jan 20, 2021 at 3:53 PM Michael Walle <michael@walle.cc>
> > > > > >> wrote:
> > > > > >> > Am 2021-01-20 20:47, schrieb Saravana Kannan:
> > > > > >> > > On Wed, Jan 20, 2021 at 11:28 AM Michael Walle <michael@walle.cc>
> > > > > >> > > wrote:
> > > > > >> > >>
> > > > > >> > >> [RESEND, fat-fingered the buttons of my mail client and converted
> > > > > >> > >> all CCs to BCCs :(]
> > > > > >> > >>
> > > > > >> > >> Am 2021-01-20 20:02, schrieb Saravana Kannan:
> > > > > >> > >> > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> > > > > >> > >> >>
> > > > > >> > >> >> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> > > > > >> > >> >> wrote:
> > > > > >> > >> >> >
> > > > > >> > >> >> > fw_devlink will defer the probe until all suppliers are ready. We can't
> > > > > >> > >> >> > use builtin_platform_driver_probe() because it doesn't retry after probe
> > > > > >> > >> >> > deferral. Convert it to builtin_platform_driver().
> > > > > >> > >> >>
> > > > > >> > >> >> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> > > > > >> > >> >> shouldn't it be fixed or removed?
> > > > > >> > >> >
> > > > > >> > >> > I was actually thinking about this too. The problem with fixing
> > > > > >> > >> > builtin_platform_driver_probe() to behave like
> > > > > >> > >> > builtin_platform_driver() is that these probe functions could be
> > > > > >> > >> > marked with __init. But there are also only 20 instances of
> > > > > >> > >> > builtin_platform_driver_probe() in the kernel:
> > > > > >> > >> > $ git grep ^builtin_platform_driver_probe | wc -l
> > > > > >> > >> > 20
> > > > > >> > >> >
> > > > > >> > >> > So it might be easier to just fix them to not use
> > > > > >> > >> > builtin_platform_driver_probe().
> > > > > >> > >> >
> > > > > >> > >> > Michael,
> > > > > >> > >> >
> > > > > >> > >> > Any chance you'd be willing to help me by converting all these to
> > > > > >> > >> > builtin_platform_driver() and delete builtin_platform_driver_probe()?
> > > > > >> > >>
> > > > > >> > >> If it just moving the probe function to the _driver struct and
> > > > > >> > >> remove the __init annotations. I could look into that.
> > > > > >> > >
> > > > > >> > > Yup. That's pretty much it AFAICT.
> > > > > >> > >
> > > > > >> > > builtin_platform_driver_probe() also makes sure the driver doesn't ask
> > > > > >> > > for async probe, etc. But I doubt anyone is actually setting async
> > > > > >> > > flags and still using builtin_platform_driver_probe().
> > > > > >> >
> > > > > >> > Hasn't module_platform_driver_probe() the same problem? And there
> > > > > >> > are ~80 drivers which uses that.
> > > > > >>
> > > > > >> Yeah. The biggest problem with all of these is the __init markers.
> > > > > >> Maybe some familiar with coccinelle can help?
> > > > > >
> > > > > > And dropping them will increase memory usage.
> > > > >
> > > > > Although I do have the changes for the builtin_platform_driver_probe()
> > > > > ready, I don't think it makes much sense to send these unless we agree
> > > > > on the increased memory footprint. While there are just a few
> > > > > builtin_platform_driver_probe() and memory increase _might_ be
> > > > > negligible, there are many more module_platform_driver_probe().
> > > >
> > > > While it's good to drop code that'll not be used past kernel init, the
> > > > module_platform_driver_probe() is going even more extreme. It doesn't
> > > > even allow deferred probe (well before kernel init is done). I don't
> > > > think that behavior is right and that's why we should delete it. Also,
> > >
> > > This construct is typically used for builtin hardware for which the
> > > dependencies are registered very early, and thus known to probe at
> > > first try (if present).
> > >
> > > > I doubt if any of these probe functions even take up 4KB of memory.
> > >
> > > How many 4 KiB pages do you have in a system with 10 MiB of SRAM?
> > > How many can you afford to waste?
> >
> > There are only a few instances of this macro in the kernel. How many
>
> $ git grep -lw builtin_platform_driver_probe | wc -l
> 21
> $ git grep -lw module_platform_driver_probe | wc -l
> 86
>
> + the ones that haven't been converted to the above yet:
>
> $ git grep -lw platform_driver_probe | wc -l
> 58
>

Yeah, this adds up in terms of the number of places we'd need to fix.
But thinking more about it, a couple of points:
1. Not all builtin_platform_driver_probe() are problems for
fw_devlink. So we can just fix them as we go if we need to.

2. The problem with builtin_platform_driver_probe() isn't really with
the use of __init. It's the fact that it doesn't allow deferred
probes. builtin_platform_driver_probe()/platform_driver_probe() could
still be fixed up to allow deferred probe until we get to the point
where we free the __init section (so at least till late_initcall).

> > of those actually fit the description above? We can probably just
> > check the DT?
>
> What do you mean by checking the DT?

I was talking about checking the DT to see if the board has very
little memory, but that's not always obvious from DT nor does it scale
with the number of instances we have. So, ignore this comment.

Anyway, time to get back to actually writing the code to deal with
this and other corner cases.

-Saravana
