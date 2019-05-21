Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E3248F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 09:30:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457S8X2T8zzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 17:30:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.80; helo=conssluserg-01.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="QHRkxn0F"; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457S7G0RlzzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 17:28:56 +1000 (AEST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x4L7SZJO029855
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 16:28:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4L7SZJO029855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1558423716;
 bh=0IneFBogau5aTVTnVikpfnfxhfGGg+m93gGHEDBBT2M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QHRkxn0FpgpJZytlIwzPKDd3Ewp7E96EMiaXKx04L5m20+rs2i+/xzPh9P4Bn3AGP
 dSAH2Tp/Y0B5hFIftuFoSYre1GsGB+N02T2RlttHQjOfgVts9R3tRy7I9CnIebiN6r
 d2Y7jufk26xmCn9rAW1di/3tO5jVXS61BrO8xrCpXS0txhn4+g6PNHUFEwi4oGaBTW
 6a5mO8qI7MlnjDOhC1XaXJEn22JFnIZprf4eGjbDI3iWMTAf4E4fQS5D/x4AxhkfP1
 nsveLUyoPyTqHlgLtgb+LOx+dRwKwVtCmewTYD/yfeUtRAmK/AH7TpfrEMk02KS7jS
 50hvs4K3ITXaA==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id 94so6271198uam.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:28:35 -0700 (PDT)
X-Gm-Message-State: APjAAAWx9qsk6izZkxWCBM8ecAzeOZrHQ+52VgkD016HAsY4KkgVV14t
 xei9stN2O206A2tXrt9j1U7dqp9+xYAlhV6fGhs=
X-Google-Smtp-Source: APXvYqznP8e8GHshxPJUqQetjFmjBhvHA7Y6dMmw1D+/xm5qDgis9mpan+zseql9QUlQ9+O+cjn+NxLo59SYDBiSIYI=
X-Received: by 2002:a9f:24a3:: with SMTP id 32mr15884042uar.109.1558423714533; 
 Tue, 21 May 2019 00:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190521061659.6073-1-yamada.masahiro@socionext.com>
 <16d967dd-9f8f-4e9e-97fd-3f9761e5d97c@c-s.fr>
In-Reply-To: <16d967dd-9f8f-4e9e-97fd-3f9761e5d97c@c-s.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 May 2019 16:27:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNp+wsvNK84oYcGwR24=Kf=_N8WJdyZ2aUL9T3qDsVsA@mail.gmail.com>
Message-ID: <CAK7LNAQNp+wsvNK84oYcGwR24=Kf=_N8WJdyZ2aUL9T3qDsVsA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mm: mark more tlb functions as __always_inline
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 3:54 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 21/05/2019 =C3=A0 08:16, Masahiro Yamada a =C3=A9crit :
> > With CONFIG_OPTIMIZE_INLINING enabled, Laura Abbott reported error
> > with gcc 9.1.1:
> >
> >    arch/powerpc/mm/book3s64/radix_tlb.c: In function '_tlbiel_pid':
> >    arch/powerpc/mm/book3s64/radix_tlb.c:104:2: warning: asm operand 3 p=
robably doesn't match constraints
> >      104 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
> >          |  ^~~
> >    arch/powerpc/mm/book3s64/radix_tlb.c:104:2: error: impossible constr=
aint in 'asm'
> >
> > Fixing _tlbiel_pid() is enough to address the warning above, but I
> > inlined more functions to fix all potential issues.
> >
> > To meet the 'i' (immediate) constraint for the asm operands, functions
> > propagating propagated 'ric' must be always inlined.
> >
> > Fixes: 9012d011660e ("compiler: allow all arches to enable CONFIG_OPTIM=
IZE_INLINING")
> > Reported-by: Laura Abbott <labbott@redhat.com>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >   arch/powerpc/mm/book3s64/hash_native.c |  8 +++--
> >   arch/powerpc/mm/book3s64/radix_tlb.c   | 44 +++++++++++++++----------=
-
> >   2 files changed, 30 insertions(+), 22 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/b=
ook3s64/hash_native.c
> > index aaa28fd918fe..bc2c35c0d2b1 100644
> > --- a/arch/powerpc/mm/book3s64/hash_native.c
> > +++ b/arch/powerpc/mm/book3s64/hash_native.c
> > @@ -60,9 +60,11 @@ static inline void tlbiel_hash_set_isa206(unsigned i=
nt set, unsigned int is)
> >    * tlbiel instruction for hash, set invalidation
> >    * i.e., r=3D1 and is=3D01 or is=3D10 or is=3D11
> >    */
> > -static inline void tlbiel_hash_set_isa300(unsigned int set, unsigned i=
nt is,
> > -                                     unsigned int pid,
> > -                                     unsigned int ric, unsigned int pr=
s)
> > +static __always_inline void tlbiel_hash_set_isa300(unsigned int set,
> > +                                                unsigned int is,
> > +                                                unsigned int pid,
> > +                                                unsigned int ric,
> > +                                                unsigned int prs)
>
> Please don't split the line more than it is.
>
> powerpc accepts lines up to 90 chars, see arch/powerpc/tools/checkpatch.p=
l

Ugh, I did not know this. Horrible.

The Linux coding style should be global in the kernel tree.
No subsystem should adopts its own coding style.


--=20
Best Regards
Masahiro Yamada
