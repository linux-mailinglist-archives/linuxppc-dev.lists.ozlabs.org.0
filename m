Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA0386E3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 02:17:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fkc5c2cHFz308l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 10:17:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=TbTUPK4k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TbTUPK4k; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fkc555Mxrz2yX1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 10:17:10 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id j6so8716312lfr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 17:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CEolhPmqveQdMHrQLZCdsiXhuzpxEikCHjkALj6N6s=;
 b=TbTUPK4keNe56luPmgX6uCwhrSdQZ+sh3+tKsNtLQZ5Ccvjic26ktns90GazmBY0Au
 lfjMKbGtNPTJCGovKTpXPhfF5vXDQRHiSN3jugeadftQxnhyO4CsHP1PZXqT6ppic5ZX
 FMw1MZHH/2FiqBHm+7HR7wap2ExLuwRljdy89af3sxtrP0/8AoD7h8+3GLGgZgrPkXIh
 ZLUVkkBFM4qNFqEDZRgavkH+wqy6Ex+/mEmSPqcDpRFiqVVSU5k4GviJMe0XgO84cJ8x
 9AitHiYtJaCiFkZblooua5Oa3R1GMBPQ6UQywcEQ+bAVQH6QHdTTRddpHQh0re2qVWAY
 Nz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CEolhPmqveQdMHrQLZCdsiXhuzpxEikCHjkALj6N6s=;
 b=S6SAsFgY6wbWND1dvfUa10cqnb4N1v/CL7e1stU44BXHwkTQFDQLqmS7x/+dgTkdY5
 emn52xfaaGHA8RKGiWJJEwaZv143gerYK2Lmc5E76aCNL9i4mc06LF9r5u/ussLU7GIG
 C0z7zxLetHONCNRU/ikbS+cSkfKVM5+XIB9pz1e8XL4gtjnHk4rp02M7Mujm06Wd59TH
 kpr1NA283EJdsRUFcB96ZLq32IUnHl5HgpYFx0eiRopkSezPAzluh+2uVLj4stu3fK39
 LlPuTyKUn+FLsQfd1wJAHUjNZ3FPDshjMyNivno0YxSuVnRweAYlFQXSAO0X15Okh7Gh
 bDRg==
X-Gm-Message-State: AOAM532X+aTPjWyZzVsfsD3+s00++KMik5bQTfy+EQQv6P7Z2dxLBbmt
 eOaGlxGM1rat8SvvO7CYh99aPJwekrCgoWEbEmyouw==
X-Google-Smtp-Source: ABdhPJyoWr87UCAbWx72DAglWwjbyV1piF0F7vlhsJEOX3Y/PT9jj+qa3mIycS6Kldf5epigLhL7eAP1BbERn+gbD5Y=
X-Received: by 2002:a05:6512:220c:: with SMTP id
 h12mr1945348lfu.374.1621297027203; 
 Mon, 17 May 2021 17:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210422195405.4053917-1-ndesaulniers@google.com>
 <87lf99zzl3.fsf@dja-thinkpad.axtens.net>
 <CAOSf1CGoN5R0LUrU=Y=UWho1Z_9SLgCX8s3SbFJXwJXc5BYz4A@mail.gmail.com>
In-Reply-To: <CAOSf1CGoN5R0LUrU=Y=UWho1Z_9SLgCX8s3SbFJXwJXc5BYz4A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 May 2021 17:16:55 -0700
Message-ID: <CAKwvOdmMugQkTRwC3HOEt2-em2zSfAoi7gpvJRkqfdzSDRMeEg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv/pci: remove dead code from !CONFIG_EEH
To: "Oliver O'Halloran" <oohall@gmail.com>, Daniel Axtens <dja@axtens.net>, 
 Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Joe Perches <joe@perches.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 6:13 PM Oliver O'Halloran <oohall@gmail.com> wrote:
>
> On Fri, Apr 23, 2021 at 9:09 AM Daniel Axtens <dja@axtens.net> wrote:
> >
> > Hi Nick,
> >
> > > While looking at -Wundef warnings, the #if CONFIG_EEH stood out as a
> > > possible candidate to convert to #ifdef CONFIG_EEH, but it seems that
> > > based on Kconfig dependencies it's not possible to build this file
> > > without CONFIG_EEH enabled.
> >
> > This seemed odd to me, but I think you're right:
> >
> > arch/powerpc/platforms/Kconfig contains:
> >
> > config EEH
> >         bool
> >         depends on (PPC_POWERNV || PPC_PSERIES) && PCI
> >         default y
> >
> > It's not configurable from e.g. make menuconfig because there's no prompt.
> > You can attempt to explicitly disable it with e.g. `scripts/config -d EEH`
> > but then something like `make oldconfig` will silently re-enable it for
> > you.
> >
> > It's been forced on since commit e49f7a9997c6 ("powerpc/pseries: Rivet
> > CONFIG_EEH for pSeries platform") in 2012 which fixed it for
> > pseries. That moved out from pseries to pseries + powernv later on.
> >
> > There are other cleanups in the same vein that could be made, from the
> > Makefile (which has files only built with CONFIG_EEH) through to other
> > source files. It looks like there's one `#ifdef CONFIG_EEH` in
> > arch/powerpc/platforms/powernv/pci-ioda.c that could be pulled out, for
> > example.
> >
> > I think it's probably worth trying to rip out all of those in one patch?
>
> The change in commit e49f7a9997c6 ("powerpc/pseries: Rivet CONFIG_EEH
> for pSeries platform") never should have been made.

I'll change my patch to keep the conditionals, but use #ifdef instead
of #if then?

>
> There's no inherent reason why EEH needs to be enabled and forcing it
> on is (IMO) a large part of why EEH support is the byzantine
> clusterfuck that it is. One of the things I was working towards was
> allowing pseries and powernv to be built with !CONFIG_EEH since that
> would help define a clearer boundary between what is "eeh support" and
> what is required to support PCI on the platform. Pseries is
> particularly bad for this since PAPR says the RTAS calls needed to do
> a PCI bus reset are part of the EEH extension, but there's non-EEH
> reasons why you might want to use those RTAS calls. The PHB reset that
> we do when entering a kdump kernel is a good example since that uses
> the same RTAS calls, but it has nothing to do with the EEH recovery
> machinery enabled by CONFIG_EEH.
>
> I was looking into that largely because people were considering using
> OPAL for microwatt platforms. Breaking the assumption that
> powernv==EEH support is one of the few bits of work required to enable
> that, but even if you don't go down that road I think everyone would
> be better off if you kept a degree of separation between the two.



-- 
Thanks,
~Nick Desaulniers
