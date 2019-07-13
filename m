Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAD67C48
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 00:47:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45mQ0x5TfNzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 08:47:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.90; helo=conssluserg-05.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="iJV8Nlbg"; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45mPz66wR3zDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 08:46:08 +1000 (AEST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x6DMjqko027470
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 07:45:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6DMjqko027470
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1563057953;
 bh=2B0eoRLN/QxxtkdUxZQChDJli/p9qNNDk0Cj2e0NbjQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iJV8NlbgLLyjOdQzd0WU/ngkle30sPGidPI+v/cHpJb+a98gMYjzra14tFnIARINi
 4R8oltWuz2SAJwU9zVVT831M6h1Fa7cGzpYgqBBM458I8Jos/WtK4rZZE5S0KmRA4N
 OZQlW9Eo8UFtw32EWHaKX8PXE+XVVMY137aXIzn3DbPtZe180SKtW86Rzddr3bxacJ
 bvq0UzNDU4UkbCRdhZx78YfB4s2bNUfOCmhuBmBt30A2MKbJaGDL3YTo6pJUo9729U
 Q+kaBM0j39W3ggCydF8NsqqT5OFHGH97TvylV+1JKMAduzZc15getcP/aCfZn3Fgw7
 SPZCgnz8dXRYQ==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id h28so8992305vsl.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 15:45:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWFO5U7LXi/qEEDZ8WwyKXOhxp7q36+OKcWUMBXmiYNeaXFaTvE
 27/rqZiowYjeOPTei7mi7P25WjmK/uTKk/j5vA8=
X-Google-Smtp-Source: APXvYqwaJCYaD7FyOraVN43rm+oRFuRY8JwMqKhwH/pNANSe5RZmLraqehxV3P7wNjBNcpGqo917kKMd4l4gROBoMf4=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr12236102vsl.155.1563057951561; 
 Sat, 13 Jul 2019 15:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190713032106.8509-1-yamada.masahiro@socionext.com>
 <20190713124744.GS14074@gate.crashing.org>
 <20190713131642.GU14074@gate.crashing.org>
In-Reply-To: <20190713131642.GU14074@gate.crashing.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 14 Jul 2019 07:45:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASBmZxX+U=LS+dgvet96cA3T6Tf_tiAa2vduUV81DEnBw@mail.gmail.com>
Message-ID: <CAK7LNASBmZxX+U=LS+dgvet96cA3T6Tf_tiAa2vduUV81DEnBw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: remove meaningless KBUILD_ARFLAGS addition
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 13, 2019 at 10:17 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Sat, Jul 13, 2019 at 07:47:44AM -0500, Segher Boessenkool wrote:
> > On Sat, Jul 13, 2019 at 12:21:06PM +0900, Masahiro Yamada wrote:
> > > The KBUILD_ARFLAGS addition in arch/powerpc/Makefile has never worked
> > > in a useful way because it is always overridden by the following code
> > > in the top Makefile:
> > >
> > >   # use the deterministic mode of AR if available
> > >   KBUILD_ARFLAGS := $(call ar-option,D)
> > >
> > > The code in the top Makefile was added in 2011, by commit 40df759e2b9e
> > > ("kbuild: Fix build with binutils <= 2.19").
> > >
> > > The KBUILD_ARFLAGS addition for ppc has always been dead code from the
> > > beginning.
> >
> > That was added in 43c9127d94d6 to replace my 8995ac870273 from 2007.
> >
> > Is it no longer supported to build a 64-bit kernel with a toolchain
> > that defaults to 32-bit, or the other way around?  And with non-native
> > toolchains (this one didn't run on Linux, even).
>
> It was an --enable-targets=all toolchain, somewhat common for crosses,
> if that matters.


I always use the same toolchain
for compile-testing PPC32/64.

I have never been hit by the issue you mention.
Somebody would have reported it if it were still a problem.

Moreover, commit 43c9127d94d6
translated the environment variable "GNUTARGET"
into the command option "--target="

My powerpc-linux-ar does not know it:

powerpc-linux-ar: -t: No such file or directory




-- 
Best Regards
Masahiro Yamada
