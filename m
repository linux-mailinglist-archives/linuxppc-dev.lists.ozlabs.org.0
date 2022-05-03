Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA968517BC0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 04:03:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ksjth5mj8z3bdC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 12:03:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=Bss1hGRl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.82;
 helo=conssluserg-03.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=Bss1hGRl; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksjt13V8mz2yNF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 12:03:21 +1000 (AEST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 243235um024150
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 May 2022 11:03:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 243235um024150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651543385;
 bh=xjOYr6omwY+Qzfpy1fAsMIIAC1MzOb2s83hA5zKDTrc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bss1hGRlBeW/D1ryasZhvq0Rb1Wcpqf+Ka2dsaw3lnInZjMUlf0uRw2sXaz1yJbec
 ptGkFVATZb1a4+vzLKqycumfOq7+w/r6iHaGoZ0AZ9YDCh5t6yvPJ2VMgMsdPgcLpy
 C3qbKMqqQHFl7f0DQZHjw7/3x67X+EveMeJS+5K81Ntq9+KQjpfQJQ/rTiLnEVPO8b
 uxHb/jBpqgoI62ONWVph64uaQy0uU19531Rsz4VvU/hwSrj9DoGavw9qj1QrbD1BnH
 l9IyB3GewfQD4Fga2GXvqHYbCjr7Tgrkf7lw3CeUBFIXKLTy6WHenV/E9oTnSNayY4
 Jv9K9GWeGCIPg==
X-Nifty-SrcIP: [209.85.215.171]
Received: by mail-pg1-f171.google.com with SMTP id j70so2078624pge.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 May 2022 19:03:05 -0700 (PDT)
X-Gm-Message-State: AOAM530g3WUyZjwCJCUFhnB7iQQGmDRbTKn5Roi0Osog52mtT3xkn1vK
 X9ouJorPxICiBVNNHOL/FfjwxUkK17EwITxvWR0=
X-Google-Smtp-Source: ABdhPJybuWEMOUVTbNe+mLw8tJxZLLEX8d0sEpIfFwiuGG78gUczd0ZkwWPhzhHA7Dj3mTHn6HCyJ+v54nTnxuIuLD8=
X-Received: by 2002:a63:6989:0:b0:3c2:3c19:d661 with SMTP id
 e131-20020a636989000000b003c23c19d661mr3878546pgc.352.1651543384634; Mon, 02
 May 2022 19:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220430110409.256858-1-masahiroy@kernel.org>
 <871qxda2jf.fsf@mpe.ellerman.id.au>
In-Reply-To: <871qxda2jf.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 May 2022 11:01:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARk=eNUfTuC7_nnUnCCbQCvdy7=PNkMSt6QYZvW_zKUyQ@mail.gmail.com>
Message-ID: <CAK7LNARk=eNUfTuC7_nnUnCCbQCvdy7=PNkMSt6QYZvW_zKUyQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop $(objtree)/ prefix support for clean-files
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 1, 2022 at 8:57 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > I think this hack is a bad idea. arch/powerpc/boot/Makefile is the
> > only user. Let's stop doing this.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/powerpc/boot/Makefile | 4 ++--
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers
>

Applied to linux-kbuild.



> >  scripts/Makefile.clean     | 8 +-------
> >  2 files changed, 3 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index 4b4827c475c6..008bf0bff186 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -453,8 +453,8 @@ clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
> >  clean-kernel-base := vmlinux.strip vmlinux.bin
> >  clean-kernel := $(addsuffix .gz,$(clean-kernel-base))
> >  clean-kernel += $(addsuffix .xz,$(clean-kernel-base))
> > -# If not absolute clean-files are relative to $(obj).
> > -clean-files += $(addprefix $(objtree)/, $(clean-kernel))
> > +# clean-files are relative to $(obj).
> > +clean-files += $(addprefix ../../../, $(clean-kernel))
> >
> >  WRAPPER_OBJDIR := /usr/lib/kernel-wrapper
> >  WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
> > diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
> > index 74cb1c5c3658..878cec648959 100644
> > --- a/scripts/Makefile.clean
> > +++ b/scripts/Makefile.clean
> > @@ -36,13 +36,7 @@ __clean-files      := \
> >
> >  __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
> >
> > -# clean-files is given relative to the current directory, unless it
> > -# starts with $(objtree)/ (which means "./", so do not add "./" unless
> > -# you want to delete a file from the toplevel object directory).
> > -
> > -__clean-files   := $(wildcard                                               \
> > -                $(addprefix $(obj)/, $(filter-out $(objtree)/%, $(__clean-files))) \
> > -                $(filter $(objtree)/%, $(__clean-files)))
> > +__clean-files   := $(wildcard $(addprefix $(obj)/, $(__clean-files)))
> >
> >  # ==========================================================================
> >
> > --
> > 2.32.0



-- 
Best Regards
Masahiro Yamada
