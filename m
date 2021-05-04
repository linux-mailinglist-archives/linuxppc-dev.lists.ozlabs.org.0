Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C8372464
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 04:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ3Lw1rfLz30D9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:14:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=RcPTKSEZ;
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
 header.s=dec2015msa header.b=RcPTKSEZ; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ3LN4sM3z2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 12:14:04 +1000 (AEST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 1442DdEk009725
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 May 2021 11:13:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1442DdEk009725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1620094420;
 bh=Flpk8WY3fI6JRVmVx74VCPIcuW76pW3yvcKLrKEQfcI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RcPTKSEZuzsHuullksFe1HmFYdJqmuQDvmRuMVscMUnbTGD1IAHfFUx7dg5iV8m8S
 JVq+4OeY8GmRwgM90uoiXxUQ8GBU6DS/UE7YNkMpCRhQjemtdM4gmVoWnXnKkMsZ6P
 wNzX+lqAga+GQCDJEkaLa0RsqmlOeV3Hv1gGqW3xwLbgXdat/s+21f6w35/UYErAzg
 eYPRP+7AosJUwZ/dFtrG0VhYQzao1oonlLYcj98QF0Z/lCQfak8N8Dj6/pM0Hyk1Rm
 0dH6xOgeIDzXhHXf/pxV1d72yKjZLx4ffhCHSdxGwxklgz893YkuvQdstcmBJwRsxN
 0RDuMm6MsEa/Q==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id c21so1114743pgg.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 19:13:39 -0700 (PDT)
X-Gm-Message-State: AOAM531BTs8joQn4G3yRbXdQpbx+6F34TC3bH4Ebm4EUfhmXZbmcqZBE
 TnVO4sMOkAw7cfHE5eRejYbE+okdAQYAreVUJGE=
X-Google-Smtp-Source: ABdhPJzeIVApSQix0BuMNREdE8BGMBMEs/IGqBZW9NLCxeXtWVZOIBXs6zvGuxchr2x095EnqC+MdArD+HY3m1+ob/s=
X-Received: by 2002:a63:e044:: with SMTP id n4mr21297348pgj.47.1620094419287; 
 Mon, 03 May 2021 19:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
In-Reply-To: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 4 May 2021 11:13:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNASv=ev=MbA+iXsjQvKGe69+AmL7Ri7WQc9caoZpfyzEgw@mail.gmail.com>
Message-ID: <CAK7LNASv=ev=MbA+iXsjQvKGe69+AmL7Ri7WQc9caoZpfyzEgw@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 3, 2021 at 3:17 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 01/05/2021 =C3=A0 17:15, Masahiro Yamada a =C3=A9crit :
> > The current minimum GCC version is 4.9 except ARCH=3Darm64 requiring
> > GCC 5.1.
> >
> > When we discussed last time, we agreed to raise the minimum GCC version
> > to 5.1 globally. [1]
> >
> > I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.
>
> One point I missed when I saw your patch first time, but I realised durin=
g the discussion:
>
> Up to 4.9, GCC was numbered with 3 digits, we had 4.8.0, 4.8.1, ... 4.8.5=
, 4.9.0, 4.9.1, .... 4.9.4
>
> Then starting at 5, GCC switched to a 2 digits scheme, with 5.0, 5.1, 5.2=
, ... 5.5
>
> So, that is not GCC 5.1 or 5.2 that you should target, but only GCC 5.
> Then it is up to the user to use the latest available version of GCC 5, w=
hich is 5.5 at the time
> begin, just like the user would have selected 4.9.4 when 4.9 was the mini=
mum GCC version.
>
> Christophe



One line below in Documentation/process/changes.rst,
I see

     Clang/LLVM (optional)  10.0.1           clang --version



Clang 10.0.1 is a bug fix release of Clang 10


I do not think GCC 5.2 is strange when we
want to exclude the initial release of GCC 5.





--=20
Best Regards
Masahiro Yamada
