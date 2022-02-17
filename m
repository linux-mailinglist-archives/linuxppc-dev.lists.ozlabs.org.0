Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8A4BA5EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 17:30:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K00gG0QDHz3cSg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 03:30:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=jySjE2Tz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.74;
 helo=condef-09.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=jySjE2Tz; 
 dkim-atps=neutral
X-Greylist: delayed 369 seconds by postgrey-1.36 at boromir;
 Fri, 18 Feb 2022 03:29:59 AEDT
Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K00fb0xTVz3bT6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 03:29:58 +1100 (AEDT)
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-09.nifty.com
 with ESMTP id 21HGIYfV006940
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 01:18:34 +0900
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 21HGI81B000578
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 01:18:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 21HGI81B000578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1645114688;
 bh=Evn3QxAJ3AK623czP1KMQcw+4ELyfCxTkHQ5Lw0/E5s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jySjE2TzRv0gSlv7h6ZRl9dlkxrzl7OH8OqFVMQ4aN60wdW1UG3P99QU/SIDcnPYj
 /ICUgKlYytLyV0isp2pXf90jmA3ySgld25u06yDQQS+Yk5/3okj8fm9mmSmxvY1J6u
 bj0I2BA32pRAiVLkeAZm7lb1gSoZYX5KxiTQTbW8Hip72bUJ3GkChhf2zPUrg6hNID
 2/KGdWCSlXJqiJQOIzRRnzdJJlJV+E3vVnCNhhyEFS78EbmPx8fBKVM+Lwl6xnWemu
 fYS4UB2JYIQ/Xillu+F2HkX7Mqn6ih8gWlrlzV3dvosCGinGQbvF7+1Tn9ww00rsa6
 uwJz8gADf32CA==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id s16so5419741pgs.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 08:18:08 -0800 (PST)
X-Gm-Message-State: AOAM531VvZR2jkh3KftT0F+DHXYioydOyXUIAMbBVTiCkgsrOEH9wCi5
 qAeAYKylROmd9RAgnJdd6sLxI+KeHmx6JQ4vX4A=
X-Google-Smtp-Source: ABdhPJxG74jrNQGUDFWqFZtiqdH5h/m+m6m6q6zil5UZDbpeBqPqUekmytPGczpLxC7Oa4jn7eJzRi7FeZ65GrbyJEc=
X-Received: by 2002:a65:5341:0:b0:363:da77:99df with SMTP id
 w1-20020a655341000000b00363da7799dfmr2959567pgr.126.1645114687528; Thu, 17
 Feb 2022 08:18:07 -0800 (PST)
MIME-Version: 1.0
References: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
 <35bcd5df0fb546008ff4043dbea68836@AcuMS.aculab.com>
 <d38e5e1c-29b6-8cc6-7409-d0bdd5772f23@csgroup.eu>
 <9b8ef186-c7fe-822c-35df-342c9e86cc88@csgroup.eu>
 <3c2b682a7d804b5e8749428b50342c82@AcuMS.aculab.com>
In-Reply-To: <3c2b682a7d804b5e8749428b50342c82@AcuMS.aculab.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 18 Feb 2022 01:17:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWTJ-ax9u5yOwHV9vHCBAcQTazV-oXtqVFVFedOA0Eqw@mail.gmail.com>
Message-ID: <CAK7LNASWTJ-ax9u5yOwHV9vHCBAcQTazV-oXtqVFVFedOA0Eqw@mail.gmail.com>
Subject: Re: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
To: David Laight <David.Laight@aculab.com>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 12:15 AM David Laight <David.Laight@aculab.com> wro=
te:
>
> From: Christophe Leroy
> > Sent: 17 February 2022 14:55
> >
> > Le 17/02/2022 =C3=A0 15:50, Christophe Leroy a =C3=A9crit :
> > > Adding Ingo, Andrew and Nick as they were involved in the subjet,
> > >
> > > Le 17/02/2022 =C3=A0 14:36, David Laight a =C3=A9crit :
> > >> From: Christophe Leroy
> > >>> Sent: 17 February 2022 12:19
> > >>>
> > >>> All functions defined as static inline in net/checksum.h are
> > >>> meant to be inlined for performance reason.
> > >>>
> > >>> But since commit ac7c3e4ff401 ("compiler: enable
> > >>> CONFIG_OPTIMIZE_INLINING forcibly") the compiler is allowed to
> > >>> uninline functions when it wants.
> > >>>
> > >>> Fair enough in the general case, but for tiny performance critical
> > >>> checksum helpers that's counter-productive.
> > >>
> > >> There isn't a real justification for allowing the compiler
> > >> to 'not inline' functions in that commit.
> > >
> > > Do you mean that the two following commits should be reverted:
> > >
> > > - 889b3c1245de ("compiler: remove CONFIG_OPTIMIZE_INLINING entirely")
> > > - 4c4e276f6491 ("net: Force inlining of checksum functions in
> > > net/checksum.h")
> >
> > Of course not the above one (copy/paste error), but:
> > - ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING forcibly")
>
> That's the one I looked at.



No.  Not that one.

The commit you presumably want to revert is:

a771f2b82aa2 ("[PATCH] Add a section about inlining to
Documentation/CodingStyle")

This is now referred to as "__always_inline disease", though.




CONFIG_OPTIMIZE_INLINING has 14 years of history for x86.
See commit 60a3cdd06394 ("x86: add optimized inlining").
We always give gcc freedom to not inline functions marked as inline.




--=20
Best Regards
Masahiro Yamada
