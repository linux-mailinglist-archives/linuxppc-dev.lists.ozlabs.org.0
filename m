Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20682E121
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 21:03:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mpTBHKAA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDNNf5xvvz3ccQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 07:02:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mpTBHKAA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=nphamcs@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDNMq1gpcz3bXw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 07:02:14 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7bee87b2f5eso168101639f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 12:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705348930; x=1705953730; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbP8f68FneqS35iMSb6Ai2Krkdv9R7DQjS6AqJROA3o=;
        b=mpTBHKAA/QGFoDriLUKBOqXgczr2SDHsfJZdK0Pz+qdnsQbsEa5Dw1jpaPOq/Hkrg5
         xFXlwEJIQBKYlLpePLOJZFNTvjcelVskbv2YcndEzSTIwzbARyPMIm9ZP/k3w2vGfrry
         SJKZX7tZ4TNuB8GpP9BgIdVToMtyQiBiXjAe/IYH6Nqgrew4cH5GVw1cnArrvaOPKozJ
         aEoQpr28PFGU3TL9YSjZn6fUfHSQcI/QVmp5/oEVWA/gIm4xlpQ6DvWJD5DFPaLTTO5E
         0y7TwR5m34ugDqk0E/HPagJ52sVE1gTeMEMotAZCejAbfyypZZJdAXkMzkqZtZ18T0Ue
         Hcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705348930; x=1705953730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbP8f68FneqS35iMSb6Ai2Krkdv9R7DQjS6AqJROA3o=;
        b=PFLHFuCtD9zzEPtfXeOyuIDjc2eTXra5K0NJADu0xg7NHYHs3deIpF3olO5QsM7V2Q
         jji48N+EysGl1Sx57TUkuJdNvgsGovc5R3DQ4ZkQyOTxYUfznuhO6dyNoZ0FuxB0TNjN
         aTikIkTQtqKk0MOo2dglmbEnuJ9aO9FQb19irKCAET8mKGdPLtVOKraib5i3ekcy/Uhl
         J285pUsy6wyW63GKsOfS6vHsRjfyMiHDtOFVPcXh2ff7Q/LP+b9V2t/SBH5BkKXOtO74
         Q6CrsSlxvqhPWWYtYYgA+lwrcgM7PRam8NQlKD2jgGSr5KPW8d8ljHo4Q7vvICnqkL8E
         PADw==
X-Gm-Message-State: AOJu0YxqpNf6hjdAuOqm3zhVYsNxXK5Tz4A5Mz+0iYkkvtTInsrDs8IW
	pyVcFuj6kBbJ5aeUeiWCFt9xNsQ8QqSEFWInOK0=
X-Google-Smtp-Source: AGHT+IGoOdW+aeoc91UwOnpg9hVQGt8tI8/aToJQfADXkg0FmKNY58cZw1wiDMwjHJuDhjzyx1g4Ij03JmdRrdylacs=
X-Received: by 2002:a6b:f017:0:b0:7bf:3b15:a4b8 with SMTP id
 w23-20020a6bf017000000b007bf3b15a4b8mr2795535ioc.37.1705348930027; Mon, 15
 Jan 2024 12:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com> <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
In-Reply-To: <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 15 Jan 2024 12:01:58 -0800
Message-ID: <CAKEwX=Pskq2Rvi1bUaPHPoAfVv9h9_u40ytJa+hkYpxmKogbfw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Vitaly Wool <vitaly.wool@konsulko.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 15, 2024 at 4:27=E2=80=AFAM Vitaly Wool <vitaly.wool@konsulko.c=
om> wrote:
>
> On Fri, Jan 12, 2024 at 8:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > The z3fold compressed pages allocator is not widely used, most users us=
e
> > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > dependency on MMU, and zbud is a more common option for !MMU as it was
> > the default zswap allocator for a long time.
> >
> > In hopes of having a single compressed pages allocator at some point,
> > and following in the footsteps of SLAB, deprecate z3fold. Rename the
> > user-visible option so that users with CONFIG_Z3FOLD=3Dy get a new prom=
pt
> > with explanation during make oldconfig. Remove CONFIG_Z3FOLD=3Dy from
> > defconfigs.
>
> I believe that having a single compressed pages allocator is a false goal=
.

I think it should be, where possible. Having fewer code will lower the
maintenance burden. Of course, this is not always possible, as one
option might be the best in one aspect/use case, but not so in others.
In the case of zswap (which is the only user for zbud and z3fold), it
seems (to me anyway) zbud and z3fold aren't really serious competitors
for zsmalloc anymore (outside of that aforementioned !MMU case). I'd
love to hear some use cases if I'm mistaken though :)

>
> > Existing users, if any, should voice their objections. Otherwise, we ca=
n
> > remove z3fold in a few releases.
>
> At this point I NACK this patch. We're about to submit an allocator
> which is clearly better that z3fold and is faster that zsmalloc in
> most cases and that submission will mark z3fold as deprecated. But for
> now this move is premature.

Ah, this sounds promising. I'd love to hear more about this new
allocator, and once it's available, experiment with it internally too
:)

That said, even at this point, does anyone actually use z3fold and/or
zbud, and cannot use zsmalloc? If yes, then yeah this is quite
premature. If not, then we can mark them as deprecate, no? Introducing
the other allocator and fixing zsmalloc for !MMU can be done in
parallel - we're not removing z3fold and zbud anytime soon even with
this deprecation notice.


>
> Best,
> Vitaly
>
> > Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> > ---
> > I have limited understanding of Kconfigs. I modelled this after commit
> > eb07c4f39c3e ("mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED"),
> > but one difference is that CONFIG_Z3FOLD is a tristate. I made
> > CONFIG_Z3FOLD_DEPRECATED a boolean config, and CONFIG_Z3FOLD default y
> > so that it is on by default if CONFIG_Z3FOLD_DEPRECATED is selected. I
> > am not sure if that's the correct way to do this.
> >
> > ---
> >  arch/loongarch/configs/loongson3_defconfig |  1 -
> >  arch/powerpc/configs/ppc64_defconfig       |  1 -
> >  mm/Kconfig                                 | 13 +++++++++++--
> >  3 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarc=
h/configs/loongson3_defconfig
> > index 33795e4a5bd63..89b66b6c6a1d5 100644
> > --- a/arch/loongarch/configs/loongson3_defconfig
> > +++ b/arch/loongarch/configs/loongson3_defconfig
> > @@ -85,7 +85,6 @@ CONFIG_ZPOOL=3Dy
> >  CONFIG_ZSWAP=3Dy
> >  CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=3Dy
> >  CONFIG_ZBUD=3Dy
> > -CONFIG_Z3FOLD=3Dy
> >  CONFIG_ZSMALLOC=3Dm
> >  # CONFIG_COMPAT_BRK is not set
> >  CONFIG_MEMORY_HOTPLUG=3Dy
> > diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/config=
s/ppc64_defconfig
> > index 544a65fda77bc..d39284489aa26 100644
> > --- a/arch/powerpc/configs/ppc64_defconfig
> > +++ b/arch/powerpc/configs/ppc64_defconfig
> > @@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=3Dy
> >  CONFIG_PARTITION_ADVANCED=3Dy
> >  CONFIG_BINFMT_MISC=3Dm
> >  CONFIG_ZSWAP=3Dy
> > -CONFIG_Z3FOLD=3Dy
> >  CONFIG_ZSMALLOC=3Dy
> >  # CONFIG_SLAB_MERGE_DEFAULT is not set
> >  CONFIG_SLAB_FREELIST_RANDOM=3Dy
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 1902cfe4cc4f5..bc6cc97c08349 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -193,15 +193,24 @@ config ZBUD
> >           deterministic reclaim properties that make it preferable to a=
 higher
> >           density approach when reclaim will be used.
> >
> > -config Z3FOLD
> > -       tristate "3:1 compression allocator (z3fold)"
> > +config Z3FOLD_DEPRECATED
> > +       bool "3:1 compression allocator (z3fold) (DEPRECATED)"
> >         depends on ZSWAP
> >         help
> > +         Deprecated and scheduled for removal in a few cycles. If you =
have
> > +         a good reason for using Z3FOLD rather than ZSMALLOC or ZBUD, =
please
> > +         contact linux-mm@kvack.org and the zswap maintainers.
> > +
> >           A special purpose allocator for storing compressed pages.
> >           It is designed to store up to three compressed pages per phys=
ical
> >           page. It is a ZBUD derivative so the simplicity and determini=
sm are
> >           still there.
> >
> > +config Z3FOLD
> > +       tristate
> > +       default y
> > +       depends on Z3FOLD_DEPRECATED
> > +
> >  config ZSMALLOC
> >         tristate
> >         prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
> > --
> > 2.43.0.275.g3460e3d667-goog
> >
