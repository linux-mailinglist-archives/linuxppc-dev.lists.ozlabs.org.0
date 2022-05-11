Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC17523CD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 20:48:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz3pQ66Mdz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 04:48:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cA8UQtFo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=cA8UQtFo; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz3nq2jZSz3brf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 04:48:14 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id p26so5095687lfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 11:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LjOBAquXwgrrgXm8VNOmvziGW6n+WunCBS4qV3JJbEM=;
 b=cA8UQtFoVUliUtfWSv912J6B0ub0HcxW8gmIXite+joZhlMbpeCS+bUAZWYfMzZ8Xa
 G/fJOfLTcngtIL8G90CQr+73lLbCL1AHxsh2R+qmJrgmJRTCuyNKXj7cliEo28pPuXQj
 6w3VaEUFPmnSDKtF91NPiV/sgjc8ZRv71y4uYb9hxeHwZUr5je/pDiqFgm2aSZ7bIISf
 /1UJjBBsIPYSlsXi1kwAQ99jbSUPR+9P2r7SaKBX1wGFQEJXaWfpYonbpRKCQDD6CxUK
 Dp+b87CVNCLP2zVCceaShTI1HSRNKEIjVASMSKh/ElRg8CR6aP+J3pZQ1S3J5UZUSIaH
 1EZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjOBAquXwgrrgXm8VNOmvziGW6n+WunCBS4qV3JJbEM=;
 b=iZ8OuGYJRYwCiSci7UmKjZfbc5LpI409aOoF9jK/Zk6LbD5P1eJxIFaR36SmIZ9iHR
 oxq7rOwOjnop3AsWiuy0E61T8a40QGe5NMi0DMGB1pBzHjIRfZBLA1PF7hzAVFzzoRsT
 n7Nv1NMvDbTHMbld9Yqc7qD4Lua4ag8bU4Esybh6/qA7kd30OvT79XQTxZ5uNE4mEsfP
 Z0B8+ZZxVqlvkPri5OHmnvz3KZXAlltMibaS8RuwjT2zSCnrfBkVwMDBlmfkIcOECH+t
 LB2gWyNd5WS3GEDnnVejdNPgWpEr5UcBL43837jGNzcB1x+Tw9NhiJCDiY0gw1GT5KkW
 7xKA==
X-Gm-Message-State: AOAM530/WrZXcebGCHtSuXLoL3fHxU+Kn4JENnXwcmSo2nukIoPjEz7K
 O6zlUAk3SXcEopxSSsv9TwqDO/7GHss8IaQGTy6ujQ==
X-Google-Smtp-Source: ABdhPJwORYNYs+f4SpR17x+QtOIu9Uo6dxlRowGZd30bvV7AXP2VnNh+RNLxsgttKR9yFrJ+aoveRa6JaxEnp5h+sgs=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr20624164lfp.392.1652294887500; Wed, 11
 May 2022 11:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org>
 <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
 <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
In-Reply-To: <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 11:47:56 -0700
Message-ID: <CAKwvOdmK4oH0t8Q6F19sWKX1fT=AgS=kfvn05FT01HffLJwgMQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into
 section-check.c
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 9, 2022 at 11:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index a78b75f0eeb0..e7e2c70a98f5 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -31,7 +31,7 @@ static bool external_module;
> > >  /* Only warn about unresolved symbols */
> > >  static bool warn_unresolved;
> > >
> > > -static int sec_mismatch_count;
> > > +int sec_mismatch_count;
> >
> > ^ this should go in modpost.h if it is to be used in two translation
> > units, rather than forward declaring it in section-check.c.  You did
> > this for the functions.
>
>
> Sorry, I do not understand.
>
>
> In modpost.h, I put the declaration:
>
>   extern int sec_mismatch_count;
>
> If I moved it to the header without 'extern'
> I would get multiple definitions.

Yeah, you need to _declare_ it w/ extern in the header, then _define_
it in one source file.

That way, if the type ever changes, the sources will agree on type in
all source files. You will get a redefinition error if the definition
changes the type of the variable since the last declaration.

What you're doing is forward declaring, which works, and is a common
pattern for (bloated) C++, but is less type safe than sharing a single
common declaration between multiple source files via a single common
shared header. (Sorry I didn't respond before you sent v5)
-- 
Thanks,
~Nick Desaulniers
