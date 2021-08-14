Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82C3EC4C1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 21:35:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gn9cZ3MKXz3cVv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Aug 2021 05:35:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Cofh1lT8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Cofh1lT8; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gn9br3cYpz2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Aug 2021 05:34:30 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id c5so12105204ybn.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R54d46ZCTxUfXPnbh/qJAxq3cKd/Q236Yg57kUVGbCs=;
 b=Cofh1lT8f2sT10JRlByWFwtEPpdE32A62j96MckR7Jr62bOgToUJ0oV2e6yCd8dRER
 YO36I9VjRVJE14ZwIV45hSV6W4flJm/ESb/M2df9GkPzSB55WCNrCIF3MP6/D3PWTyU2
 i7TouIlqDnEgSTCpqq7lF3FH/Li8rILeok1NVAQV9RPNYrspFr9MDKmNisMJj87oEfJY
 9KHah0PN9GgjbiwGi7siaTyw7aeX5hP93VFZNMSoAmpcyC7prSqwFEj3c+TyVz+F72G1
 0dUyinRAZUFz9vQDVkviRP020gD2ocn5DxKcDEmDCMOaIZaxyA4oSh8WwM1xP5C5qhyj
 D+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R54d46ZCTxUfXPnbh/qJAxq3cKd/Q236Yg57kUVGbCs=;
 b=RuJ6Ovwv7/l94gTSw/KEThJxhD/J48o3DsiA41LxCkBmenBZtgOzCYhHya6qRityTB
 v3l2w3rziLan9xtOz0g9pf9zwP06n+bRQyDfdiQCvKLyvtez5u+H9mxE1t5WW7YSNgM+
 vWq6qUzOGe/xsK6dUTaMOT3hxB9llT1m+yfQy2ldWdVP7KzvZeWhX8SfhCzjuuicr+4U
 kid9yoY9RxUT7T9ngBMc14vX2VTJOU30ke/DWc9w6jgUzbqBW0zY7KoXoJw6uKrvIhr1
 BRQaa5cI1snyZK+6S+QvYDg3XWxebdLY1nZolRdOKH6PpJMvVM8rN5ZQolxURnrmWhRc
 TTkw==
X-Gm-Message-State: AOAM532ffm2Q8frrTObnx6qdxATGbpt/kfblFIez5fSsY7Mp1LSDf3On
 nwrqxueCJbEkGnE1My+zLG0wryharIkDHEjalckgYg==
X-Google-Smtp-Source: ABdhPJxz+c/j76Twwg7/NFFXZUWkpnVPXpGPArCSHwHjiSHkZ04rHl0pe/gHEShlRIjTKAsktUbAKrAMZe3ardmctl0=
X-Received: by 2002:a25:5d6:: with SMTP id 205mr9830990ybf.382.1628969666230; 
 Sat, 14 Aug 2021 12:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210812204951.1551782-1-morbo@google.com>
 <87sfzde8lk.fsf@linkitivity.dja.id.au>
 <20210813200508.7bqehxgd6ruerds5@google.com>
 <20210814125812.GC1583@gate.crashing.org>
In-Reply-To: <20210814125812.GC1583@gate.crashing.org>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Sat, 14 Aug 2021 12:34:15 -0700
Message-ID: <CAFP8O3LZ3ZtpkF=RdyDyyXn40oYeDkqgY6NX7YRsBWeVnmPv1A@mail.gmail.com>
Subject: Re: [PATCH] ppc: add "-z notext" flag to disable diagnostic
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Bill Wendling <morbo@google.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 14, 2021 at 5:59 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Fri, Aug 13, 2021 at 01:05:08PM -0700, Fangrui Song wrote:
> > Text relocations are considered very awful by linker developers.
>
> By very few linker developers.

https://groups.google.com/g/generic-abi/c/Ckq19PfLxyk/m/uW29sgkoAgAJ
Ali Bahrami: "My opinion is that no one wants text relocations, but
not labeling them if they do exist doesn't seem right. I find the
presence of DF_TEXTREL very interesting when diagnosing various
issues."

https://gcc.gnu.org/legacy-ml/gcc/2016-04/msg00138.html
( "So why not simply create 'dynamic text relocations' then?  Is that
possible with a pure linker change?" )
Cary Coutant: "Ugh. Besides being a bad idea from a performance point
of view, it's not even always possible to do. Depending on the
architecture, a direct reference from an executable to a variable in a
shared library may not have the necessary reach."

binutils-gdb commit "Add linker option: --warn-shared-textrel to
produce warnings when adding a DT_TEXTREL to a shared object."
Nick Clifton

https://www.openwall.com/lists/musl/2020/09/26/3
Szabolcs Nagy: "nice.  and gcc passes -z text for static pie code so
that case should not end up with text rels."

Someone wrote "Overall, the overhead of processing text relocations
can cause serious performance degradation." in Solaris' Linker and
Libraries Guide.

Me :)
(I wrote lld/ELF 9.0.0~13.0.0 release notes and filed dozen of GNU
ld/gold bugs/feature requests)

> > binutils 2.35 added --enable-textrel-check=3D{no,warn,error}
> > https://sourceware.org/bugzilla/show_bug.cgi?id=3D20824
>
> Yes, some people wanted the default to be configurable.  So now we have
> a default default that is sane, so most people get to reap the benefits
> of having defaults at all, but we also allow other people to shoot
> themselves (and people who have to deal with them) in the foot.
> "Progress".  Changing the defaults should be a one-time event, only done
> when the benefits strongly outweigh the costs.  Defaults should never be
> configurable (by the user).

ld.lld has such a non-configurable model and thus caught the issue
(which the patch intends to address).

Future --enable-textrel-check=3D{yes,error} configured GNU ld will be simil=
ar.

> > I can imagine that in the future some Linux distributions (especially t=
hose
> > focusing on security) will default their binutils to use
> > --enable-textrel-check=3D{no,warn,error}.
>
> How would this be a benefit to security?

https://flameeyes.blog/2016/01/16/textrels-text-relocations-and-their-impac=
t-on-hardening-techniques/

https://github.com/golang/go/issues/9210
Android: "libexample.so has text relocations. This is wasting memory
and prevents security hardening. Please fix."

FWIW I contributed a glibc patch allowing TEXTREL to co-exist with ifunc.
It requires temporary mapping the text segment W^X.

> > In -no-pie links, R_PPC64_ADDR64 relocations are link-time constants.
>
> Where "link" includes dynamic links as well.  There are no constants.

"Link-time" usually refers to the processing of the static linker.

Dynamic links can use load-time or run-time.

> > There are no text relocations, therefore no need for -z notext.
>
> This is a choice by the compiler, nothing more.  It saves some process
> startup time, and allows slightly more maps to be shared by processes
> that run the same images.  But it is a tradeoff, so it might change; and
> of course it is not an ABI requirement.
>
>
> Segher

Text relocations are generally awful.
GNU ld and gold's traditional "add DF_TEXTREL on-demand" behavior made
such user errors easy to make.
I understand that kernels are special applications where we apply
relocations once and many user-space objection can be less of a
concern/ignored.
However, the Linux kernel is already in a position where many linker
options are controlled and thus should specify -z notext to make
the intention explicit, or fix the problems (I think x86-64 is good;
that said, powerpc
has a higher cost using PC-relative instructions so pay the oneshot relocat=
ion
time cost probably isn't a bad choice)



--
=E5=AE=8B=E6=96=B9=E7=9D=BF
