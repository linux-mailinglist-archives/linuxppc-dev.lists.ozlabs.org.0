Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EFF520E39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 08:58:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky84v1rfsz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 16:58:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=0OrgT5pc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=0OrgT5pc; 
 dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky84F2QV4z3cHX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 16:57:32 +1000 (AEST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 24A6v5xa001981
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 15:57:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 24A6v5xa001981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652165825;
 bh=PV2VZBmSw1vDAIYTzEMhuv3Dcr29T/TFTi8FpUXKvKs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0OrgT5pc+mOhQr9yUrlNCuvWWOi8HgrzA9DegUSaGeG8I+7x6cjG8uaIrdXEDqnUG
 Iq/iV8rCdjxMlCF4xWoFLD66MNj2XdosLIRuHYYKY4pfjTXa0zfKxbUhu4cMiFKnJf
 vYl8KCP1evQaHqtyxI5EpBuP1nidP3NaWstFvYfTwTesBMpT5FPiflAydWdBAWdLlG
 Sbyrg7U4vqIiwGtQbdo1toPLRHveGontc2xTiEr09krezIK6a+bEEKBHldEaxvkzEa
 MRHgp7kzcZth7Zoj83Kr17Y1F+TchTThPcSq4URHk587hJltMPFZYyFJtFHbXq2oQW
 8Z6Nkzbbbp6Ow==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id x88so3551958pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 23:57:05 -0700 (PDT)
X-Gm-Message-State: AOAM531kb2nuYlRK0BjuIXDjNVBP1pM/nAHOC5YHvyIk1QLHwcCPxuv/
 yw14/4VbrARB6ElnEpryeB33zqjwRSvt2M3R22E=
X-Google-Smtp-Source: ABdhPJyUsO6qgOPcuwMWkhoVbg96fdtrT2KcjbMF4Q1DKsxKckAJcwFdS+O5hh4okyU+VxKrQY62LHgpgdtJmiFstPc=
X-Received: by 2002:a17:90a:e517:b0:1d7:5bbd:f9f0 with SMTP id
 t23-20020a17090ae51700b001d75bbdf9f0mr21441512pjy.77.1652165824961; Mon, 09
 May 2022 23:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org>
 <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
In-Reply-To: <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 May 2022 15:55:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
Message-ID: <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
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

On Tue, May 10, 2022 at 2:20 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > modpost.c is too big, and the half of the code is for section checks.
> > Split it.
> >
> > I fixed some style issues in the moved code.
>
> It would be helpful for review if the split and restyle were distinct
> patches.  Otherwise I can't tell what has changed.
>
> This does lose the ability to use git blame to get more context on
> some of the oddities in modpost (which I have found useful in the
> past).  I don't feel strongly though.


OK, I will just move the code in v5.





> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index a78b75f0eeb0..e7e2c70a98f5 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -31,7 +31,7 @@ static bool external_module;
> >  /* Only warn about unresolved symbols */
> >  static bool warn_unresolved;
> >
> > -static int sec_mismatch_count;
> > +int sec_mismatch_count;
>
> ^ this should go in modpost.h if it is to be used in two translation
> units, rather than forward declaring it in section-check.c.  You did
> this for the functions.


Sorry, I do not understand.


In modpost.h, I put the declaration:

  extern int sec_mismatch_count;

If I moved it to the header without 'extern'
I would get multiple definitions.







--
Best Regards
Masahiro Yamada
