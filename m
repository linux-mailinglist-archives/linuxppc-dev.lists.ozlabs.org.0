Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BA5E73E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 08:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYhtn33jxz3cdk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 16:24:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lX2Xggsf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lX2Xggsf;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYht929b0z3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 16:23:28 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 78so11320081pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 23:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=xdByZ0nHaks3lJ2SKdAF0IoQsYTp3e5DYUbsyIasoBg=;
        b=lX2XggsfWupLL4t73ahQYHRwTopFcT2U2Zfke56LlFLGOj3BGxMRYvrthPJ88BahHS
         6tbjokazKyoktxK3ahF3+31IbX3aEJgzZ5190KytmBFBe3jm41obx6xRJKBAhG7acY19
         TDmheGl0PR9wWokxs2+cV/DZAzmr1FGlj2PZsw6Ov4Ra1IcleBMG5tyHxK6BUk+X48cb
         hSknNT4wCGWAxaM/5PaVEZrUtsoeKg36+wJJTYEalMDIqDWYf59oJWsRRR3Py6vIgEyI
         BE9bHJVqyz2x50iZVVy2+8TyjR646cTr8lhYUW4S9o85TXwfYCUw7XGmM4E1hDFg4hVq
         e14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=xdByZ0nHaks3lJ2SKdAF0IoQsYTp3e5DYUbsyIasoBg=;
        b=plxfjj3p/MoJ6lnP2aZbD2XDayib2Hl6FTz4zCJVeg6GR91jnKEw5ivY+lkq9ylH2b
         ktMjKInjozGawuZDV43FETQjfDutmhqxSIkoenG20YKbTkpkBpT85Z8pE4Ba/CHY3YHd
         x1SXtmUdnuSdTc6yt5IfZ9AC9cxKDqhTpEWDJ+IUra8SObYjYsUqUvel5jq+6/eXD7k4
         CsV1gEzSi2pMqLiOlmIDxkE15iG9p3IMrJ7l7pp/foL+7Ix5dp2tOz4RCW6X0ejKCoyL
         R3LX4OHQN7I1WhKoh38gdAhzOkQtCn2Ibo7OfgHXRMSFdqbqMoJZvt4IslraSmdx5P85
         z/Jg==
X-Gm-Message-State: ACrzQf12LYBJkn8gEoyOH7mVGRPyZxo/GFm8jPZQ/6EK+/soZtnQ//zg
	9DLYE7XCLumxKU4a96v84gs=
X-Google-Smtp-Source: AMsMyM7wqtdFqF29uEFnE3zSv81ZLkv7BLMqAkyI3FsUA6qooQmEtzF7pI3qoZd935xxKUcurkTlEw==
X-Received: by 2002:a63:ff4f:0:b0:439:61d6:197 with SMTP id s15-20020a63ff4f000000b0043961d60197mr6179168pgk.67.1663914203417;
        Thu, 22 Sep 2022 23:23:23 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709026f1700b001783a917b9asm3066783plk.127.2022.09.22.23.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 23:23:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 16:23:18 +1000
Message-Id: <CN3KCU5GOMF4.3T533MQ4U2SF0@bobo>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220923033004.536127-1-npiggin@gmail.com>
 <4141d141-54a8-0771-ea67-1e457e38f329@csgroup.eu>
In-Reply-To: <4141d141-54a8-0771-ea67-1e457e38f329@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 23, 2022 at 3:46 PM AEST, Christophe Leroy wrote:
>
>
> Le 23/09/2022 =C3=A0 05:30, Nicholas Piggin a =C3=A9crit=C2=A0:
> > This adds basic POWER10_CPU option, which builds with -mcpu=3Dpower10.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> > There's quite a lot of asm and linker changes slated for the next merge
> > window already so I may leave the pcrel patch for next time. I think we
> > can add the basic POWER10 build option though.
> >=20
> > Thanks,
> > Nick
> >=20
> >   arch/powerpc/Makefile                  | 7 ++++++-
> >   arch/powerpc/platforms/Kconfig.cputype | 8 +++++++-
> >   2 files changed, 13 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 8a3d69b02672..ea88af26f8c6 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -192,9 +192,14 @@ ifdef CONFIG_476FPE_ERR46
> >   		-T $(srctree)/arch/powerpc/platforms/44x/ppc476_modules.lds
> >   endif
> >  =20
> > -# No AltiVec or VSX instructions when building kernel
> > +# No prefix or pcrel
> > +KBUILD_CFLAGS +=3D $(call cc-option,-mno-prefixed)
>
> We have lots of code to handle prefixed instructions in code_patching,=20
> and that code complexifies stuff and has a performance impact.
> And it is only partially taken into account, areas like ftrace don't=20
> properly take care of prefixed instructions.
>
> Should we get rid of prefixed instruction support completely in the=20
> kernel, and come back to more simple code ?

I would rather complete prefixed support in the kernel and use pcrel
addressing. Actually even if we don't compile with pcrel or prefixed,
there are some instructions and we will probably get more that require
prefixed, possible we might want to use them in kernel. Some of it is
required to handle user mode instructions too. So I think removing
it is premature, but I guess it's up for debate.

Thanks,
Nick
