Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB4523D6A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 21:29:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz4jq5zqYz3byl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 05:29:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=S17erul5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.90;
 helo=conssluserg-05.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=S17erul5; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz4j96YSSz30FR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 05:29:17 +1000 (AEST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 24BJSoue002248
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 04:28:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 24BJSoue002248
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652297330;
 bh=EaTId7H8QGxZ4wR/UutapdHBioVSBlwASrI8kZas40s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S17erul53RNIeBjJYir+J8mpHUWqK7sXKHJMWRa/l2xSCxZgrdV1dU3+5hX9DFRPB
 CxgugLFeqTZ4qkrOp/w8aAs9LC1q5WTQ18lo39qoonMr7iIjV8mWFGdEhV4ZCcs80q
 2791ONW4kWbmvpu0bg8Ie6WMg2pBrWyRDmAD0TVba9wY0wF1xKvLuuao/XsCXNDByB
 38FzgA8r7So3M8VePGduejUpewfBieSKGIXseq+GW7ZP4YbOEsCZ9Y+Cm76syaoNJ6
 t7jCNxWrBvLyml46hUxkvSFtyWpcS1C/UwFi4wohFk8Ysn7VrS2i2PxIpRBTLc+/r3
 YjPePFoJdPHHA==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so2951632pjm.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 12:28:50 -0700 (PDT)
X-Gm-Message-State: AOAM531U6LSvT8UWylPDht/awE5Irfi0yhBeBagJeXcdl8fjdfez4VPa
 K2sXAZcySROsrj+9yfIlKN6tGTq6FrL/tKBYRWg=
X-Google-Smtp-Source: ABdhPJxpFvdEXgne/7yspfTVFpO5mJeb/64Ugd7xcTnf7hLoDN02lbCll4CkYvhtMmE1NpBHpwbzLRyJwjcVkvMYkaw=
X-Received: by 2002:a17:903:1205:b0:15e:8cbc:fd2b with SMTP id
 l5-20020a170903120500b0015e8cbcfd2bmr26952485plh.99.1652297329721; Wed, 11
 May 2022 12:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org>
 <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
 <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
 <CAKwvOdmK4oH0t8Q6F19sWKX1fT=AgS=kfvn05FT01HffLJwgMQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmK4oH0t8Q6F19sWKX1fT=AgS=kfvn05FT01HffLJwgMQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 May 2022 04:27:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5preB59HJH1-F_ZfEmoF3N8b9z4eRhYzsEVwu_XUH4Q@mail.gmail.com>
Message-ID: <CAK7LNAR5preB59HJH1-F_ZfEmoF3N8b9z4eRhYzsEVwu_XUH4Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into
 section-check.c
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

On Thu, May 12, 2022 at 3:48 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, May 9, 2022 at 11:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > > index a78b75f0eeb0..e7e2c70a98f5 100644
> > > > --- a/scripts/mod/modpost.c
> > > > +++ b/scripts/mod/modpost.c
> > > > @@ -31,7 +31,7 @@ static bool external_module;
> > > >  /* Only warn about unresolved symbols */
> > > >  static bool warn_unresolved;
> > > >
> > > > -static int sec_mismatch_count;
> > > > +int sec_mismatch_count;
> > >
> > > ^ this should go in modpost.h if it is to be used in two translation
> > > units, rather than forward declaring it in section-check.c.  You did
> > > this for the functions.
> >
> >
> > Sorry, I do not understand.
> >
> >
> > In modpost.h, I put the declaration:
> >
> >   extern int sec_mismatch_count;
> >
> > If I moved it to the header without 'extern'
> > I would get multiple definitions.
>
> Yeah, you need to _declare_ it w/ extern in the header, then _define_
> it in one source file.
>
> That way, if the type ever changes, the sources will agree on type in
> all source files. You will get a redefinition error if the definition
> changes the type of the variable since the last declaration.
>
> What you're doing is forward declaring, which works, and is a common
> pattern for (bloated) C++, but is less type safe than sharing a single
> common declaration between multiple source files via a single common
> shared header. (Sorry I didn't respond before you sent v5)

Sorry, I still do not understand your suggestion.


Could you provide me with a code diff
showing how to do this better?



-- 
Best Regards
Masahiro Yamada
