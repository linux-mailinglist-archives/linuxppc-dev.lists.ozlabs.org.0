Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37135328797
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:26:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq6dD1JYHz3cl3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 04:26:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZXXlcPoA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZXXlcPoA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq6cn0H5pz30Lg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 04:26:32 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8945364FA0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614619589;
 bh=ZPzL+CqYu44aXu40y8ZCOMiRfRIMG8/oPBvPaObIr3s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZXXlcPoAzee9hkRwb8dd+vDv9LEthumaWH3wjzv47EU4QTyqwAJnT+xxXyXqb0VUC
 JZfX3jksdqusEWsQIFn4wMtIDBISHUOil3xtzQ5JBIjsGPxpejwTJuMfVqYqnM4Qav
 5Qk+UbCyEV9MtQWtzQu/sYN/g0+nAas3AZ7nz8hUb8XPsIK53YDZglAlrtvNrA7be/
 1Yc2cBnmcR35JfKavlApyqLd88JB9wj5jeKYUL9+cmJuod7MAV9pzW59OhQLgYq1l6
 AuVKw+Mn4MriwpuATRDzz+MkEcmHOKuhgZgbIHJ0uE5y/2sLBvWGwMK6D6P0dDRZRV
 Ll6D7wFqHFhOw==
Received: by mail-ej1-f51.google.com with SMTP id ci14so10702799ejc.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Mar 2021 09:26:29 -0800 (PST)
X-Gm-Message-State: AOAM531Go+MlxlfzxMgR0VrST4MLQxJJo0b0H+nFrfv/pxm6BZt1Q7QF
 SaJWvAbOFPyF6ye2tDeASPU5G2e3DNxaepm5iQ==
X-Google-Smtp-Source: ABdhPJyOAD53zp421XfNIf1VPhW454ubyJ8fUI5lsvwLhC4QNwKq1857Zj2X+boTjz10NPAFKYikcEssPBRwWcFgppU=
X-Received: by 2002:a17:906:2312:: with SMTP id
 l18mr17383256eja.468.1614619588116; 
 Mon, 01 Mar 2021 09:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20210225125921.13147-1-will@kernel.org>
 <CAL_JsqJX=TCCs7=gg486r9TN4NYscMTCLNfqJF9crskKPq-bTg@mail.gmail.com>
 <20210301144153.GA16716@willie-the-truck>
In-Reply-To: <20210301144153.GA16716@willie-the-truck>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Mar 2021 11:26:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ11D-7a3pwLTVd+rHjqDGBb=b8OU_a6h3Co-at+2qMtQ@mail.gmail.com>
Message-ID: <CAL_JsqJ11D-7a3pwLTVd+rHjqDGBb=b8OU_a6h3Co-at+2qMtQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix CMDLINE_EXTEND handling for FDT "bootargs"
To: Will Deacon <will@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Daniel Walker <danielwa@cisco.com>
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
Cc: devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Doug Anderson <dianders@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tyler Hicks <tyhicks@linux.microsoft.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Max Uvarov <muvarov@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+PPC folks and Daniel W

On Mon, Mar 1, 2021 at 8:42 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Mar 01, 2021 at 08:19:32AM -0600, Rob Herring wrote:
> > On Thu, Feb 25, 2021 at 6:59 AM Will Deacon <will@kernel.org> wrote:
> > > We recently [1] enabled support for CMDLINE_EXTEND on arm64, however
> > > when I started looking at replacing Android's out-of-tree implementation [2]
> >
> > Did anyone go read the common, reworked version of all this I
> > referenced that supports prepend and append. Here it is again[1].
> > Maybe I should have been more assertive there and said 'extend' is
> > ambiguous.
>
> I tried reading that, but (a) most of the series is not in the mailing list
> archives and (b) the patch that _is_ doesn't touch CMDLINE_EXTEND at all.
> Right now the code in mainline does the opposite of what it's documented to
> do.

Actually, there is a newer version I found:

https://lore.kernel.org/linuxppc-dev/1551469472-53043-1-git-send-email-danielwa@cisco.com/
https://lore.kernel.org/linuxppc-dev/1551469472-53043-2-git-send-email-danielwa@cisco.com/
https://lore.kernel.org/linuxppc-dev/1551469472-53043-3-git-send-email-danielwa@cisco.com/

(Once again, there's some weird threading going on)

> > > with the upstream version, I noticed that the two behave significantly
> > > differently: Android follows the Kconfig help text of appending the
> > > bootloader arguments to the kernel command line, whereas upstream appends
> > > the kernel command line to the bootloader arguments. That is, except for
> > > the EFI stub, which follows the documented behaviour.
> > >
> > > I think the documented behaviour is more useful, so this patch series
> > > reworks the FDT code to follow that and updates the very recently merged
> > > arm64 idreg early command-line parsing as well.
> >
> > I can just as easily argue that the kernel having the last say makes
> > sense.
>
> Dunno, I'd say that's what CMDLINE_FORCE is for. Plus you'd be arguing
> against both the documentation and the EFI stub implementation.

CMDLINE_FORCE is a complete override, not a merging of command lines.

> > Regardless, I'm pretty sure there's someone out there relying on current
> > behavior. What is the impact of this change to other arches?
>
> On arm64, I doubt it, as Android is the main user of this (where it's been
> supported for 9 years with the documented behaviour).
>
> The other option, then, is reverting CMDLINE_EXTEND from arm64 until this is
> figured out. I think that's preferable to having divergent behaviour.
>
> As for other architectures, I think the ATAGs-based solution on arch/arm/
> gets it right:
>
>   static int __init parse_tag_cmdline(const struct tag *tag)
>   {
>   #if defined(CONFIG_CMDLINE_EXTEND)
>           strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
>           strlcat(default_command_line, tag->u.cmdline.cmdline,
>                   COMMAND_LINE_SIZE);

The question is really whether any arm32 DT based platform depends on
the current behavior. RiscV could also be relying on current behavior.
Powerpc also uses the current behavior (and the documentation is also
wrong there). Changing the behavior in the FDT code means the powerpc
early PROM code and the FDT code do the opposite.

Arm32 has had current behaviour for 5 years. Powerpc for 1.5 years and
Risc-V for 2 years. Then there's MIPS which has its own Kconfig
symbols for this and is its own kind of mess. Either we assume
existing users didn't really care about the order or we have to
support both prepend and append.

> For now I think we have two options for arm64: either fix the fdt code,
> or revert CMDLINE_EXTEND until the PREPEND/APPEND series is merged. Which
> do you prefer?

Like anything copied across arches, I want someone to look at this
across all architectures and make this common instead of just copying
to new arches. The prepend/append series is the closest we've come.

Rob
