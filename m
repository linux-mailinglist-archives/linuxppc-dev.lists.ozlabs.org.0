Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61E32D523
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 15:20:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrtLR0LBqz3d6W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 01:20:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=quhqijAS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=quhqijAS; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrtKx6gPrz3cKm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 01:19:47 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id d20so30229894oiw.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 06:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B6t/iRhxaz6mIiZvKsR4Ph8NTlJXLnsmBsm+Fu3vxVg=;
 b=quhqijAStrtqg5ulDL8MGpWooN+jj/XfkXFrXOHChG+J0Oemh8uM8ai2LV5B+F6Eut
 r8V4BpaHEpFUfLTqPIN+90zfn75GVB3k0S/oQAv2I+Aw36bQ9iYBhAe+h2AZUck6BymN
 VwzSaRmrFMQbf62lgTkidT+fkQ1A0ZZNFOMoopUMlCyOegUrN64rTDSKe1hk7NmpGZ/+
 LsIH6tMgoMpp443DS38ej45RsxzE4oDVXFJnKxX3RW1Qz28u3eivry7XYwcQnsA9kcII
 /H4U+uebWqVm2SL79rMMbIUHw8/AZI8KS4A2yT6RZxp1RcCvIkpGXXXZtMYISNt42k17
 AAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B6t/iRhxaz6mIiZvKsR4Ph8NTlJXLnsmBsm+Fu3vxVg=;
 b=hbupQdhxm6kOxFrUToVqmbRBAYEip/i/peTOSpxiy9U8NF8M+RReYJazl7UaNzfmOJ
 4uCYLTzO8JNeIrD6tmrPJrqjmpN/hDMAOWr9NV4TPo6TIGokheD5VYYbJOpzJaOBszMy
 OUEPM753+P534OdMKXvGb6mDCPOx2DwIc4YHGkhu1jpOnQYSFaIbuMkPd1mzLtOwWep5
 lWLNltaOIKyu2i7DRRJ/7ErwcICDFvECDVaec84H4WqfvmqpKXJzrtXM7/6oQqsg5e9z
 gAeV3hpIFtIwLhaM7uN3v8Or9MOUSI4Z3Vimiv2rxZpO1Cs/Dd5BrwoqJBPIUQti44oU
 +fnQ==
X-Gm-Message-State: AOAM533fbKMEiSRIlaZsA0QQGHW40uKDcuM1dMKF4oi5M0To+Ct38mKE
 Oai/xDIH4ecQk/eBhsj1AOglUXX/mspuIUS3shT05A==
X-Google-Smtp-Source: ABdhPJzJI7yCwzMLMX1b761deV6PDEKQd9CTsXE0xJshW05ZxAu+oLRYKuaZk9HZRGXQh5jybV4MkzuL1G4A0DLbxoM=
X-Received: by 2002:aca:d515:: with SMTP id m21mr3162609oig.172.1614867583032; 
 Thu, 04 Mar 2021 06:19:43 -0800 (PST)
MIME-Version: 1.0
References: <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
 <YEDXJ5JNkgvDFehc@elver.google.com>
 <4b46ecc9-ae47-eee1-843e-e0638a356b51@csgroup.eu>
In-Reply-To: <4b46ecc9-ae47-eee1-843e-e0638a356b51@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Thu, 4 Mar 2021 15:19:31 +0100
Message-ID: <CANpmjNMMMyvsF23U_5HCUe=k7eGaF-WwKV6=YZ81OJedAd2DBQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Mar 2021 at 15:08, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 04/03/2021 =C3=A0 13:48, Marco Elver a =C3=A9crit :
> >  From d118080eb9552073f5dcf1f86198f3d86d5ea850 Mon Sep 17 00:00:00 2001
> > From: Marco Elver <elver@google.com>
> > Date: Thu, 4 Mar 2021 13:15:51 +0100
> > Subject: [PATCH] kfence: fix reports if constant function prefixes exis=
t
> >
> > Some architectures prefix all functions with a constant string ('.' on
> > ppc64). Add ARCH_FUNC_PREFIX, which may optionally be defined in
> > <asm/kfence.h>, so that get_stack_skipnr() can work properly.
>
>
> It works, thanks.
>
> >
> > Link: https://lkml.kernel.org/r/f036c53d-7e81-763c-47f4-6024c6c5f058@cs=
group.eu
> > Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks, I'll send this to Andrew for inclusion in -mm, since this is
not a strict dependency (it'll work without the patch, just the stack
traces aren't that pretty but still useful). If the ppc patches and
this make it into the next merge window, everything should be good for
5.13.

> > ---
> >   mm/kfence/report.c | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/mm/kfence/report.c b/mm/kfence/report.c
> > index 519f037720f5..e3f71451ad9e 100644
> > --- a/mm/kfence/report.c
> > +++ b/mm/kfence/report.c
> > @@ -20,6 +20,11 @@
> >
> >   #include "kfence.h"
> >
> > +/* May be overridden by <asm/kfence.h>. */
> > +#ifndef ARCH_FUNC_PREFIX
> > +#define ARCH_FUNC_PREFIX ""
> > +#endif
> > +
> >   extern bool no_hash_pointers;
> >
> >   /* Helper function to either print to a seq_file or to console. */
> > @@ -67,8 +72,9 @@ static int get_stack_skipnr(const unsigned long stack=
_entries[], int num_entries
> >       for (skipnr =3D 0; skipnr < num_entries; skipnr++) {
> >               int len =3D scnprintf(buf, sizeof(buf), "%ps", (void *)st=
ack_entries[skipnr]);
> >
> > -             if (str_has_prefix(buf, "kfence_") || str_has_prefix(buf,=
 "__kfence_") ||
> > -                 !strncmp(buf, "__slab_free", len)) {
> > +             if (str_has_prefix(buf, ARCH_FUNC_PREFIX "kfence_") ||
> > +                 str_has_prefix(buf, ARCH_FUNC_PREFIX "__kfence_") ||
> > +                 !strncmp(buf, ARCH_FUNC_PREFIX "__slab_free", len)) {
> >                       /*
> >                        * In case of tail calls from any of the below
> >                        * to any of the above.
> > @@ -77,10 +83,10 @@ static int get_stack_skipnr(const unsigned long sta=
ck_entries[], int num_entries
> >               }
> >
> >               /* Also the *_bulk() variants by only checking prefixes. =
*/
> > -             if (str_has_prefix(buf, "kfree") ||
> > -                 str_has_prefix(buf, "kmem_cache_free") ||
> > -                 str_has_prefix(buf, "__kmalloc") ||
> > -                 str_has_prefix(buf, "kmem_cache_alloc"))
> > +             if (str_has_prefix(buf, ARCH_FUNC_PREFIX "kfree") ||
> > +                 str_has_prefix(buf, ARCH_FUNC_PREFIX "kmem_cache_free=
") ||
> > +                 str_has_prefix(buf, ARCH_FUNC_PREFIX "__kmalloc") ||
> > +                 str_has_prefix(buf, ARCH_FUNC_PREFIX "kmem_cache_allo=
c"))
> >                       goto found;
> >       }
> >       if (fallback < num_entries)
> >
