Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0373F058B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 16:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqV021JHtz3dR2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 00:00:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=gX3udCcH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91;
 helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=gX3udCcH; 
 dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTzJ6q5Hz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:59:24 +1000 (AEST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 17IDx8X4027812
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 22:59:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17IDx8X4027812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1629295148;
 bh=vO1geDOQNqjzTTQB/B8cwaJY7jsdspX3Z/5frXYRJRA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gX3udCcHF7eqfIBq2adIBH9n5nUN5MLsKnG1Z0tGpdjwJi6uLWZAT2nGxcamvBxOD
 qbCrpnHjdDHO5H0rGkHeZPP5dBv4AFmSFKHyYVv26suoL5h+ShLx8P31XpFR3XTsr7
 GHfcYCP/XuxppKtfNgnBCNm3lvXDfyI/sAK+aqOS1eQcraeUkFjc6XnkOM57SUrt1t
 Vm4sFm+w07CmDg4P8oRswyvMuPSPlS4IaqwaLRUQryJyxCGErLYHT3speGO3Ld+dwP
 dqa7Oo4WolYPfe3WbDxHfIJSUiX4T79uDL7hVQSlmT2hiY6O8Bi3TjyzUav+F0c1/w
 bYMMcoU1w2cIw==
X-Nifty-SrcIP: [209.85.216.46]
Received: by mail-pj1-f46.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso2355872pjy.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 06:59:08 -0700 (PDT)
X-Gm-Message-State: AOAM5330nAvE4vnjnPDw3HwZDNS73R00qThnOFfH0nUUgrsVsdkZl9Sj
 YrXwjfu5cEskxsmze1RNQkd5Gi7ik0d+4G4jnNU=
X-Google-Smtp-Source: ABdhPJzFlnyln23/Ad0OfAS01oQY49jow7EywmiZ4IYXi6uyi1fdomL1ZKBqsTsbuBhf0Yg/ff0GiTxHmPeutlsz5o8=
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr7527205plq.71.1629295147564; Wed, 18 Aug
 2021 06:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210729141937.445051-1-masahiroy@kernel.org>
 <20210729141937.445051-3-masahiroy@kernel.org>
 <CAKwvOdkRuxaUvAi4ik2SiDgEeNOX6D76aBtHDBPyDVTumWskLg@mail.gmail.com>
In-Reply-To: <CAKwvOdkRuxaUvAi4ik2SiDgEeNOX6D76aBtHDBPyDVTumWskLg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Aug 2021 22:58:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT4qPd2QdJ2=+yh2xH4ku97ykqOCgiCsHUHVo1QDR1qtQ@mail.gmail.com>
Message-ID: <CAK7LNAT4qPd2QdJ2=+yh2xH4ku97ykqOCgiCsHUHVo1QDR1qtQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] powerpc: move the install rule to
 arch/powerpc/Makefile
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jordan Niethe <jniethe5@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Bill Wendling <morbo@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 31, 2021 at 5:30 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jul 29, 2021 at 7:22 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Currently, the install target in arch/powerpc/Makefile descends into
> > arch/powerpc/boot/Makefile to invoke the shell script, but there is no
> > good reason to do so.
>
> Sure, but there are more arch/ subdirs that DO invoke install.sh from
> arch/<arch>/boot/Makefile than, not:
>
> arch/<arch>/boot/Makefile:
> - parisc
> - nios2
> - arm
> - nds32
> - sparc
> - riscv
> - 390
> - ppc (this patch)
> - x86
> - arm64

I sent patches for these architectures.

Check LKML.






> arch/<arch>/Makefile:
> - ia64
> - m68k
>
> Patch is fine, but right now the tree is a bit inconsistent.
>
> >
> > arch/powerpc/Makefile can run the shell script directly.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/powerpc/Makefile      | 3 ++-
> >  arch/powerpc/boot/Makefile | 6 ------
> >  2 files changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 6505d66f1193..9aaf1abbc641 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -407,7 +407,8 @@ endef
> >
> >  PHONY += install
> >  install:
> > -       $(Q)$(MAKE) $(build)=$(boot) install
> > +       sh -x $(srctree)/$(boot)/install.sh "$(KERNELRELEASE)" vmlinux \
> > +       System.map "$(INSTALL_PATH)"
> >
> >  archclean:
> >         $(Q)$(MAKE) $(clean)=$(boot)
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index 0d165bd98b61..10c0fb306f15 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -444,12 +444,6 @@ $(obj)/zImage:             $(addprefix $(obj)/, $(image-y))
> >  $(obj)/zImage.initrd:  $(addprefix $(obj)/, $(initrd-y))
> >         $(Q)rm -f $@; ln $< $@
> >
> > -# Only install the vmlinux
> > -install:
> > -       sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)"
> > -
> > -PHONY += install
> > -
> >  # anything not in $(targets)
> >  clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
> >         zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
> > --
> > 2.27.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
