Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE023734B5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 07:22:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZlTr6MS5z3026
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 15:22:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cEuLYBD6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32;
 helo=mail-yb1-xb32.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cEuLYBD6; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZlTN6w3Nz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 15:22:31 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 82so1103822yby.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 22:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BR9c5nY5fJmdREpZe13rR06AMNplq21mXI1KGGRnlQM=;
 b=cEuLYBD6F9ImDKjQCyfvhUhb2ByLw+e5zL7hNMxHM8jaNW6VEwD8rKxsuRX1/3xuMY
 qrdS4JQayvsSc//XiNLMTa7XJq+B3yxWCYH420nOQTkyi2+1Aluoh2ny582Ai4PxwsiW
 p1rjpz4gagR1wrqrRyvHDevCWYxELDw5hM0zH+5ISyoESxV6qfRWsQSNtbguLUOyd9Ln
 e0KQdN0IjKu5Lr5QAka/CZ91kRyiqDu0YW9okAvfsGFmBGnqmLwA2VhBk5GEGBCLf42K
 vDAtNeVRrEg/1xvEh85yARUeJdf/AbiGOpMWy3+alSkIy7YHK88nHS+F4kqyOdZqxYto
 CkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BR9c5nY5fJmdREpZe13rR06AMNplq21mXI1KGGRnlQM=;
 b=lrMQ4kKXY9+fpcJVVGqw3KGpVPg8gNBnfjKsgqQNtWSO0XQCplzsBxDNWU5JSVUy7t
 ZcLMQXyxj8zGaq4gTpYLxOMdoDIygGaz92Od/oa8r9ZPr1tClS+Zif+hQgc9oTL3gEMC
 jgQoQ2cQaAODO7SnL4TKQtZwPpIqekzFXu40Y6BK5g4R9xZBlejmvpSzPnEY5drNkh2G
 H2UsEy8j+1/CDkpKDdCqNwZkjYzmii0QNDvj6oaqU2klR+A/pCFUtS/6DOID3soGQuZG
 eg0GVJXkZXUmku8c8R5bcHwyC2xB387tSm8raBmBk2WOXhCam5FLk4OKdgzj2pHNRzcR
 L4Cw==
X-Gm-Message-State: AOAM533QwM9u52KY/fFWYIxIZwtmSEAcSSR0q7vRcatVxtfopizpSMAU
 sidfytP3LWGK88ypJD6AlRSl13kL4POeyc6uueU=
X-Google-Smtp-Source: ABdhPJyoFPJQWojxR9vvZoAOkmvSCD4rj87G9eS/UrsFl+vzO7TCsbs1kGRvp6Df/D6Y4ClqEiaaAaUG9rpZelsUwCk=
X-Received: by 2002:a25:a87:: with SMTP id 129mr26135403ybk.377.1620192148637; 
 Tue, 04 May 2021 22:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210429031602.2606654-1-jniethe5@gmail.com>
 <20210429031602.2606654-3-jniethe5@gmail.com>
 <d7f28ca3-bf4b-01c4-9706-b4f2061314b1@csgroup.eu>
In-Reply-To: <d7f28ca3-bf4b-01c4-9706-b4f2061314b1@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 5 May 2021 15:22:17 +1000
Message-ID: <CACzsE9qSFNqYD7kf5G_6s8evDdjBJbsczBHHiZUvdTPWEvCz7g@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] powerpc/lib/code-patching: Set up Strict RWX
 patching earlier
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 29, 2021 at 2:53 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 29/04/2021 =C3=A0 05:15, Jordan Niethe a =C3=A9crit :
> > setup_text_poke_area() is a late init call so it runs before
> > mark_rodata_ro() and after the init calls. This lets all the init code
> > patching simply write to their locations. In the future, kprobes is
> > going to allocate its instruction pages RO which means they will need
> > setup_text__poke_area() to have been already called for their code
> > patching. However, init_kprobes() (which allocates and patches some
> > instruction pages) is an early init call so it happens before
> > setup_text__poke_area().
> >
> > start_kernel() calls poking_init() before any of the init calls. On
> > powerpc, poking_init() is currently a nop. setup_text_poke_area() relie=
s
> > on kernel virtual memory, cpu hotplug and per_cpu_areas being setup.
> > setup_per_cpu_areas(), boot_cpu_hotplug_init() and mm_init() are called
> > before poking_init().
> >
> > Turn setup_text_poke_area() into poking_init().
>
> I can't remember, maybe I already asked the question:
> Have you done some performance measurement or at least some performance a=
nalysis ?
No I don't think you have asked and it is a good question.

Here are some results on a Power9 (T2P9D01 REV 1.01) running powernv_defcon=
fig
Timestamp at "Run /init as init process"
Before: ~1.059326
After: ~1.273105

Turning on more testing the difference is greater:
For example, turning on CONFIG_FTRACE_STARTUP_TEST
Timestamp at "Run /init as init process"
Before: ~7.176759
After: ~15.967576

Running with initcall_debug:
Before: initcall init_trace_selftests+0x0/0x1b4 returned 0 after 2880859 us=
ecs
After: initcall init_trace_selftests+0x0/0x1b4 returned 0 after 10048828 us=
ecs

So it does slow it down.
But it also might be a good thing for testing that these tests using
code patching now will use the same code path for patching that would
be used on a fully booted system.

>
> Christophe
>
> >
> > Reviewed-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v9: New to series
> > ---
> >   arch/powerpc/lib/code-patching.c | 12 ++++--------
> >   1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 870b30d9be2f..15296207e1ba 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -70,14 +70,11 @@ static int text_area_cpu_down(unsigned int cpu)
> >   }
> >
> >   /*
> > - * Run as a late init call. This allows all the boot time patching to =
be done
> > - * simply by patching the code, and then we're called here prior to
> > - * mark_rodata_ro(), which happens after all init calls are run. Altho=
ugh
> > - * BUG_ON() is rude, in this case it should only happen if ENOMEM, and=
 we judge
> > - * it as being preferable to a kernel that will crash later when someo=
ne tries
> > - * to use patch_instruction().
> > + * Although BUG_ON() is rude, in this case it should only happen if EN=
OMEM, and
> > + * we judge it as being preferable to a kernel that will crash later w=
hen
> > + * someone tries to use patch_instruction().
> >    */
> > -static int __init setup_text_poke_area(void)
> > +int __init poking_init(void)
> >   {
> >       BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> >               "powerpc/text_poke:online", text_area_cpu_up,
> > @@ -85,7 +82,6 @@ static int __init setup_text_poke_area(void)
> >
> >       return 0;
> >   }
> > -late_initcall(setup_text_poke_area);
> >
> >   /*
> >    * This can be called for kernel text or a module.
> >
