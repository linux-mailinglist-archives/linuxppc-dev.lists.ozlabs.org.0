Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD532D34D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 03:27:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DCkQ5ZxvzDqP0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 11:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DCj13gP3zDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 11:26:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="Gmf80RTw"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45DCj11pmBz8t60
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 11:26:13 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45DCj10kBgz9sB8; Wed, 29 May 2019 11:26:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=202.248.20.70; helo=condef-05.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="Gmf80RTw"; 
 dkim-atps=neutral
X-Greylist: delayed 721 seconds by postgrey-1.36 at bilbo;
 Wed, 29 May 2019 11:26:12 AEST
Received: from condef-05.nifty.com (condef-05.nifty.com [202.248.20.70])
 by ozlabs.org (Postfix) with ESMTP id 45DCj02J8Vz9s4V
 for <linuxppc-dev@ozlabs.org>; Wed, 29 May 2019 11:26:11 +1000 (AEST)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-05.nifty.com
 with ESMTP id x4T13fVh006676
 for <linuxppc-dev@ozlabs.org>; Wed, 29 May 2019 10:03:41 +0900
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x4T13FMd015648
 for <linuxppc-dev@ozlabs.org>; Wed, 29 May 2019 10:03:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4T13FMd015648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559091796;
 bh=jCFvB+YrbV9fJHJdugjROEKPLOpLpTgL08/q9nI4KGc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gmf80RTwYa2qi09vsE5IVUP87MPwHvnCogJbT2CwHXFGTwzMr4gE99YVDAp+UoKY3
 wy3IWgeceGQKc2Wk3D75nIW54n59a1Ay1IGDDJea7YBbYxq3lW8EoBw9qpgHHvwUkT
 7ceVcSJJyAKYmtWgANPz11LRfRTMuLEq9YkShajbQuYn6xqwTVFYaBS9VNCXO2SJYj
 G8uRF1MVcqEjEk5uuBQSut6mDxCO/ocg/66wN8cnvOPccLtGBLef8E5imnS4aPrtED
 OmQy2XWT4BNpBoAizqNph/HxbgCHrQTzqqowqpoj5BRQlJnL8OMEwGrpOaT8+sxciE
 +jISQWBJhcl9w==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id l20so608357vsp.3
 for <linuxppc-dev@ozlabs.org>; Tue, 28 May 2019 18:03:16 -0700 (PDT)
X-Gm-Message-State: APjAAAXHrD/N86Qjg14gqA+au/7fSq5f9VuDlgprTRNHoCJyef49nJg3
 MawfC3r0j/b3jHSi/pwqNYb/39a4gbiOb6AlEA4=
X-Google-Smtp-Source: APXvYqxplV/jP2LrS5T89OsCaERGxlf1sVP8AefRu/blvrYdWLLb/iDr3Nm2u2xxA3ooBfhoclfxaf7LFeEhiZunFdA=
X-Received: by 2002:a67:de99:: with SMTP id r25mr44708672vsk.215.1559091795309; 
 Tue, 28 May 2019 18:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190528081614.26096-1-mpe@ellerman.id.au>
 <20190528121009.GA11901@infradead.org>
In-Reply-To: <20190528121009.GA11901@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 29 May 2019 10:02:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS3iTOeX5b2F7E9PeWqma1_hx7Tbrt2V=3fvrqhSk5Zug@mail.gmail.com>
Message-ID: <CAK7LNAS3iTOeX5b2F7E9PeWqma1_hx7Tbrt2V=3fvrqhSk5Zug@mail.gmail.com>
Subject: Re: [PATCH] powerpc/configs: Rename foo_basic_defconfig to
 foo_base.config
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 9:10 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, May 28, 2019 at 06:16:14PM +1000, Michael Ellerman wrote:
> > We have several "defconfigs" that are not actually full defconfigs
> > they are just a base set of options which are then merged with other
> > fragments to produce a working defconfig.

The default values from Kconfig files are used
where CONFIG options are not specified by the defconfig.

So, I think corenet_basic_defconfig is a full defconfig
even if it contains a single CONFIG option.

Since the difference between "*_defconfig" and "*.config"
is ambiguous in some cases, it depends on the intended usage.


> > The most obvious example is corenet_basic_defconfig which only
> > contains one symbol CONFIG_CORENET_GENERIC=y. But there is also
> > mpc85xx_base_defconfig which doesn't actually enable CONFIG_PPC_85xx.
> >
> > To avoid confusion, rename these config fragments to "foo_base.config"
> > to make it clearer that they are not full defconfigs.
>
> Adding linux-kbuild, maybe we can make the handling of these fragments
> generic and actually document it..

I do not know how it should be documented.



> >
> > Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >  arch/powerpc/Makefile                                | 12 ++++++------
> >  .../{corenet_basic_defconfig => corenet_base.config} |  0
> >  .../{mpc85xx_basic_defconfig => mpc85xx_base.config} |  0
> >  .../{mpc86xx_basic_defconfig => mpc86xx_base.config} |  0
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> >  rename arch/powerpc/configs/{corenet_basic_defconfig => corenet_base.config} (100%)
> >  rename arch/powerpc/configs/{mpc85xx_basic_defconfig => mpc85xx_base.config} (100%)
> >  rename arch/powerpc/configs/{mpc86xx_basic_defconfig => mpc86xx_base.config} (100%)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index c345b79414a9..94f735db2229 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -333,32 +333,32 @@ PHONY += powernv_be_defconfig
> >
> >  PHONY += mpc85xx_defconfig
> >  mpc85xx_defconfig:
> > -     $(call merge_into_defconfig,mpc85xx_basic_defconfig,\
> > +     $(call merge_into_defconfig,mpc85xx_base.config,\
> >               85xx-32bit 85xx-hw fsl-emb-nonhw)
> >
> >  PHONY += mpc85xx_smp_defconfig
> >  mpc85xx_smp_defconfig:
> > -     $(call merge_into_defconfig,mpc85xx_basic_defconfig,\
> > +     $(call merge_into_defconfig,mpc85xx_base.config,\
> >               85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)
> >
> >  PHONY += corenet32_smp_defconfig
> >  corenet32_smp_defconfig:
> > -     $(call merge_into_defconfig,corenet_basic_defconfig,\
> > +     $(call merge_into_defconfig,corenet_base.config,\
> >               85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw dpaa)
> >
> >  PHONY += corenet64_smp_defconfig
> >  corenet64_smp_defconfig:
> > -     $(call merge_into_defconfig,corenet_basic_defconfig,\
> > +     $(call merge_into_defconfig,corenet_base.config,\
> >               85xx-64bit 85xx-smp altivec 85xx-hw fsl-emb-nonhw dpaa)
> >
> >  PHONY += mpc86xx_defconfig
> >  mpc86xx_defconfig:
> > -     $(call merge_into_defconfig,mpc86xx_basic_defconfig,\
> > +     $(call merge_into_defconfig,mpc86xx_base.config,\
> >               86xx-hw fsl-emb-nonhw)
> >
> >  PHONY += mpc86xx_smp_defconfig
> >  mpc86xx_smp_defconfig:
> > -     $(call merge_into_defconfig,mpc86xx_basic_defconfig,\
> > +     $(call merge_into_defconfig,mpc86xx_base.config,\
> >               86xx-smp 86xx-hw fsl-emb-nonhw)
> >
> >  PHONY += ppc32_allmodconfig
> > diff --git a/arch/powerpc/configs/corenet_basic_defconfig b/arch/powerpc/configs/corenet_base.config
> > similarity index 100%
> > rename from arch/powerpc/configs/corenet_basic_defconfig
> > rename to arch/powerpc/configs/corenet_base.config
> > diff --git a/arch/powerpc/configs/mpc85xx_basic_defconfig b/arch/powerpc/configs/mpc85xx_base.config
> > similarity index 100%
> > rename from arch/powerpc/configs/mpc85xx_basic_defconfig
> > rename to arch/powerpc/configs/mpc85xx_base.config
> > diff --git a/arch/powerpc/configs/mpc86xx_basic_defconfig b/arch/powerpc/configs/mpc86xx_base.config
> > similarity index 100%
> > rename from arch/powerpc/configs/mpc86xx_basic_defconfig
> > rename to arch/powerpc/configs/mpc86xx_base.config
> > --
> > 2.20.1
> >
> ---end quoted text---



--
Best Regards
Masahiro Yamada
