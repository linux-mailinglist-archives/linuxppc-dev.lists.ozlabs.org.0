Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 327DB781731
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 05:35:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IqtJwsF0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSPWn6yVPz3cW9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 13:35:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IqtJwsF0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=mr.bossman075@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSPVv5hp7z304b
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 13:34:29 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-268bc714ce0so1905697a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 20:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692416065; x=1693020865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOjVxX/Eg0iGmCqhVv5cIZBql9TtO2CXYAj6O50hbSE=;
        b=IqtJwsF0pUQX7izyHeTreyTJTJhKy5hiG0L5LG7pklRm5ruz2z314lR30cJBIft8IF
         lHOgWqUBHxsrHRZ/n+H1wKK9DAmo6l6M6vOqnptgdlcjmAJVnPdA6vRI0gXUbNjLjw2O
         HaCa2GQWI2H3P/PJF/kO6bmYeR/Nyn9f2ZprmcA/D0k+kc6aE9gt4/58CgSA7F801jjd
         XX+T7G5Lv1/7anA6wENrFajkkBfdYnNLgzsdEjOaJ3u6npvNqyydM0GqNQ4HtJ58/8Bk
         W4eV1DvzXq38mo16H9W9Oyvm8s/Iciep4KukBQTEpuiauG6fJdSHO4J2dBeLWJsNSNRu
         GvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692416065; x=1693020865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOjVxX/Eg0iGmCqhVv5cIZBql9TtO2CXYAj6O50hbSE=;
        b=SJrmOuA0HXeMl2wHGwhF81xo8jXkLFlsiCtPZAA5wrKrC8wgy8MMUVuKX7gvCkG/vl
         Udds9Du+WrW0t8cvqyD1F/mU5CMN/H36e/mdBE6rqrXHID955XWnkqyN8NhSAp/8S9CA
         oCwFnMUR+7f6ZpbiBrXjTNC9E29hpptyQkMBJAhfsd+2Z0oWhNkQCU7+ThQPgmL4B6c3
         rTbaORCL8rczC7cwSNgMeryOzFG+0Z6Dsns5ieHHv1izb9lRru9ZCef2YSJhH8WDfdUK
         7Mw60d29FWA2orTrsVoEv1+uYjA6VfSvh4Mjr8hiMetg5WfqTxYMbSTV9XrVcHSWg69e
         tsVw==
X-Gm-Message-State: AOJu0YxExiRbB5KSFlvYquIAcpZ2sFOi5Bz73VDCfjjhWaBgHTRpB4Ty
	OUkSTIE5o97E1jkySq1N+CpMboKFS2yfiWkJCmw=
X-Google-Smtp-Source: AGHT+IFpp0VHvCZv9YQH2C6BH14eA1+BcCpaZ1w5QpKfP5/3cQ/4jDAUwPVhdHrKttxLAuvWHcInuMfoJccdrJLxiGs=
X-Received: by 2002:a17:90a:64ca:b0:25d:d224:9fb9 with SMTP id
 i10-20020a17090a64ca00b0025dd2249fb9mr1389535pjm.24.1692416065235; Fri, 18
 Aug 2023 20:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
 <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org> <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
In-Reply-To: <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
From: Jesse T <mr.bossman075@gmail.com>
Date: Fri, 18 Aug 2023 23:33:49 -0400
Message-ID: <CAJFTR8T-Fdu_aKapP+Lb6pLYo_ykXwXw6rFZNGR5=WKU1QwUPQ@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Boge
 ndoerfer <tsbogend@alpha.franken.de>, Max Filippov <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 18, 2023 at 7:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi Jesse,
>
> I replied to your comment a few days ago, but for some reason
> your email to me contains:
> Reply-To: 20230816055010.31534-1-rdunlap@infradead.org
> so it wasn't sent directly to you.

Sorry about that I messed up the email headers...
>
> My former reply is below.
>
> On 8/16/23 20:15, Randy Dunlap wrote:
> > Hi Jesse,
> >
> > On 8/16/23 15:45, Jesse Taube wrote:
> >> Hi, Randy
> >>
> >>> diff -- a/init/Kconfig b/init/Kconfig
> >>> --- a/init/Kconfig
> >>> +++ b/init/Kconfig
> >>> @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
> >>>
> >>>         If unsure, say N.
> >>>
> >>> -config EMBEDDED
> >>> -    bool "Embedded system"
> >>> -    select EXPERT
> >>> -    help
> >>> -      This option should be enabled if compiling the kernel for
> >>> -      an embedded system so certain expert options are available
> >>> -      for configuration.
> >>
> >> Wouldn't removing this break many out of tree configs?
> >
> > I'm not familiar with out-of-tree configs.
> > Do you have some examples of some that use CONFIG_EMBEDDED?
> > (not distros)

Buildroot has a few.
It won't immediately break Buildroot and Yocto as they have a set version,
but it could be confusing for anyone updating the kernel.

> >
> >> Should there be a warning here to update change it instead of removal?
> >
> > kconfig doesn't have a warning mechanism AFAIK.
> > Do you have an idea of how this would work?

No, unfortunately. As you said without a warning it would be overlooked so
a change would not be necessary.

A possible solution is to check in a header file with:

#ifdef CONFIG_EMBEDDED
#warning "CONFIG_EMBEDDED has changed to CONFIG_EXPERT"
#endif

Does anyone else have an opinion on this?
Since kconfig doesn't have a warning mechanism the patch seems fine as is.

Thanks,
Jesse Taube
> >
> > We could make a smaller change to init/Kconfig, like so:
> >
> >  config EMBEDDED
> > -     bool "Embedded system"
> > +     bool "Embedded system (DEPRECATED)"
> >       select EXPERT
> >       help
> > -       This option should be enabled if compiling the kernel for
> > -       an embedded system so certain expert options are available
> > -       for configuration.
> > +       This option is being removed after Linux 6.6.
> > +       Use EXPERT instead of EMBEDDED.
> >
> > but there is no way to produce a warning message. I.e., even with this
> > change, the message will probably be overlooked.
> >
> > ---
> > ~Randy
>
> --
> ~Randy
