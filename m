Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA4454995
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 16:08:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvRCT6XJsz2yXv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 02:08:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=jeZ139xN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.66;
 helo=condef-01.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=jeZ139xN; 
 dkim-atps=neutral
Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HvRBm0GdYz2xXC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 02:08:15 +1100 (AEDT)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-01.nifty.com
 with ESMTP id 1AHExuxf001448
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 23:59:56 +0900
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 1AHExUeO015037
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 23:59:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1AHExUeO015037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1637161171;
 bh=J8i3NpRpaKfGQtvzORCBEFDJAvllsZKJSM1zjCIXB5w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jeZ139xNuuPKkkBUiVdLxtv34imOmLcJaG4ph4URV81TzdJFj4X76/RpweJmZBAmM
 CIBUPGW9d1Gau1m2axIHjJtZD2dY1F/D8KbPO4ggLJXnGQ2MdJCI04gGlZEKkvqfbp
 PaRRl6nZUErOvK1LGpQFPdt5f9hCYQuGeRF2Yb1aZ/h91UegiD1s+4y4qIUgLoYkm/
 6LrMXtoMjNEu6mA5DjpSb/1+6q5a8d9wAxGFC6p2jLvw9StrCqM19/luxjUFCEEra3
 wficM9zShtFj7o5oXsGh9ZNGLpkx/cAbBPBOczaHHKXEr3+fcNPV/2S96atJ79qGkL
 VoewliR8+igsg==
X-Nifty-SrcIP: [209.85.210.172]
Received: by mail-pf1-f172.google.com with SMTP id x5so2972658pfr.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 06:59:30 -0800 (PST)
X-Gm-Message-State: AOAM531/Lu9qsTSp4XI6bIJ4GJim/fXeSRx47EE7FC8nK8HycyPjnSIP
 CXapnsyDQTC1ebdLVL6errZ9AWCxzZFr3tjuYsg=
X-Google-Smtp-Source: ABdhPJxhF60oVNSvNyG0OLv0f0qLGXdDOSidaYAxE6cIOA4VDzi+zys+8JZrgsEmaWa77j9NdikoixTwUYB+0s2ZSbg=
X-Received: by 2002:a65:530d:: with SMTP id m13mr5678027pgq.128.1637161170000; 
 Wed, 17 Nov 2021 06:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20211109185015.615517-1-masahiroy@kernel.org>
 <0cdd39b2-73f8-e0c1-bfa2-7940d4b788f0@csgroup.eu>
In-Reply-To: <0cdd39b2-73f8-e0c1-bfa2-7940d4b788f0@csgroup.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 17 Nov 2021 23:58:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4KD4zG2Me7RhsJNOXrMqDOHpd2YNoSPH4CZ63HXtqpQ@mail.gmail.com>
Message-ID: <CAK7LNAQ4KD4zG2Me7RhsJNOXrMqDOHpd2YNoSPH4CZ63HXtqpQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: clean vdso32 and vdso64 directories
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 17, 2021 at 12:38 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi Masahiro,
>
> Le 09/11/2021 =C3=A0 19:50, Masahiro Yamada a =C3=A9crit :
> > Since commit bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of
> > vgettimeofday.o"), "make ARCH=3Dpowerpc clean" does not clean up the
> > arch/powerpc/kernel/{vdso32,vdso64} directories.
> >
> > Use the subdir- trick to let "make clean" descend into them.
> >
> > Fixes: bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of vgettim=
eofday.o")
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >   arch/powerpc/kernel/Makefile | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefil=
e
> > index 0e3640e14eb1..5fa68c2ef1f8 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -196,3 +196,6 @@ clean-files :=3D vmlinux.lds
> >   # Force dependency (incbin is bad)
> >   $(obj)/vdso32_wrapper.o : $(obj)/vdso32/vdso32.so.dbg
> >   $(obj)/vdso64_wrapper.o : $(obj)/vdso64/vdso64.so.dbg
> > +
> > +# for cleaning
> > +subdir- +=3D vdso32 vdso64
> >
>
> This patch make me think about one thing I would have liked to do, but I
> don't know Makefiles well enough to be able to do it. You could probably
> help me with it.
>
> vdso32 and vdso64 contain a lot of redundant sources. I would like to
> merge them into a new single directory, let say 'vdso', and use the
> files in that directory to build both vdso32.so and vdso64.so. I have a
> feeling that x86 is doing it that way, but I've not been able to figure
> out how to build two objects using the same C/S files.
>
> Thanks
> Christophe

Changing the code as follows might work.

$(obj-vdso32): %-32.o: %.S FORCE
          $(call if_changed_dep,vdso32as)




--=20
Best Regards
Masahiro Yamada
