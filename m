Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D15724F56B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 09:08:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYFx35Yxxz2ypn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 17:08:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ik8jQGN5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ik8jQGN5; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYFwP2gmhz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 17:08:20 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id 10so2873325qtz.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Apr 2022 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q5cbQQe49bEF5HFrjbUeCKsVieZAGKpIPnvEABi81V0=;
 b=Ik8jQGN5kwSKzWlAOPqdcr5EfMXB3cCaAXs4iEJnN+tzSBnhdKP9oV9blRgJIKTMhP
 iUQ2BwalG/flvlLinSQcgr0ej50lrif+oOGgYEFzUpRH2ZnHJNEVYRhAMYk2mI9xlFIu
 XPxbzqV9w8kiesP6714sUKgemZojrHdhb/rW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q5cbQQe49bEF5HFrjbUeCKsVieZAGKpIPnvEABi81V0=;
 b=cSIvfi9FjbqiUK1QBz8Hkns7ciG9D/D6OvqnitNYK3Sby7s4GnPt7Dy7SFhP7G+7aG
 ndx7FURa7VaQllTrRsRtgU2Nc+gyPXaABgh3+79toXimj3jCqa0n8BvXIY8n8viikFBO
 +3tr1bt9S1pPFmV+Eym4bB2zODowaM+q5mRuuV3romPef9uYQz4SFR+F9oM4vhufJEUf
 4SOmM+Amtqf+zu/1YbPPJsQ0YUYgqOSiLXUCDlqIpMsOGfQNMFdGHOXKevdPwDt0Sw5j
 KV8MU5qDYp4tktRbH9PeKPJxEjqoapYaydsYqAx152AiYcBm2jx+gfuXIRmKhKYgoGxZ
 i5uQ==
X-Gm-Message-State: AOAM530c31IHokL7deBa/oUjaU2IXIjjxDUKaJTKVY6yerLdLGFsPfN4
 pNHqZWlkcUJEC2yJBTSYnYVnPTvvjJsjVIwildk=
X-Google-Smtp-Source: ABdhPJw4/fHu75vAEqWIpnDMwI0wQGm1IMPKqKOcHhE2nB6rsWLu/Wi8RQEx8Toy+6dQqqkzUHS7U0U7MFsCx6m1YZo=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr4502240qkj.666.1649228898092; Wed, 06
 Apr 2022 00:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220330112437.540214-1-joel@jms.id.au>
 <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
 <CACPK8XdremqtJBKycbFZauky9C9yCb2S7+aZDxRtZ8fU41L=Ew@mail.gmail.com>
 <167db0bd-4f10-7751-36a2-fb9ec5b136a7@gmail.com>
 <20220331234433.GB614@gate.crashing.org>
In-Reply-To: <20220331234433.GB614@gate.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Apr 2022 07:08:06 +0000
Message-ID: <CACPK8XcWuFuR0zTj=tqUNZ9aQNVWEeyoDeDUOmUE3_RS_4Whxg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
To: Segher Boessenkool <segher@kernel.crashing.org>, 
 =?UTF-8?Q?Murilo_Opsfelder_Ara=C3=BAjo?= <mopsfelder@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 31 Mar 2022 at 23:46, Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Mar 31, 2022 at 12:19:52PM -0300, Murilo Opsfelder Ara=C3=BAjo wr=
ote:
> > My understanding is that the default cpu type for -mcpu=3Dpowerpc64 can
> > change.
>
> Different subtargets (Linux, AIX, Darwin, the various BSDs, bare ELF,
> etc.) have different default CPUs.  It also can be set at configure time
> for most subtargets.
>
> Linux can be built with compilers not targetting *-linux*, so it would
> be best to specify a specific CPU always.
>
> > >I did a little test using my buildroot compiler which has
> > >with-cpu=3Dpower10. I used the presence of PCREL relocations as eviden=
ce
> > >that it was build for power10.
> > >
> > >$ powerpc64le-buildroot-linux-gnu-gcc -mcpu=3Dpower10 -c test.c
> > >$ readelf -r test.o |grep -c PCREL
> > >24
> >
> > It respected the -mcpu=3Dpower10 you provided.
>
> Of course.
>
> > And that's my concern.  We're relying on the compiler default cpu type.
>
> That is not the compiler default.  It is the default from who built the
> compiler.  It can vary wildly and unpredictably.
>
> The actual compiler default will not change so easily at all, basically
> only when its subtarget drops support for an older CPU.
>
> > If gcc defaults -mcpu=3Dpowerpc64le to power10, you're going to have
> > the same problem again.
>
> That will not happen before power10 is the minimum supported CPU.
> Anything else is madness.

Murilo, does Segher's explanation address your concerns?

I believe the patch I sent fixes the problem that you're worried
about. It should be compatible into the future too.

Cheers,

Joel

>
> > It happens that the power8 default cpu type
> > is compatible to your system by coincidence.
>
> No, power8 is (and always was) the minimum supported CPU type for
> powerpc64le-linux.
>
> > In gcc/config/rs6000/rs6000-cpus.def, they are set to different process=
ors:
> >
> >     254 RS6000_CPU ("powerpc64", PROCESSOR_POWERPC64, MASK_PPC_GFXOPT |
> >     MASK_POWERPC64)
> >     255 RS6000_CPU ("powerpc64le", PROCESSOR_POWER8, MASK_POWERPC64 |
> >     ISA_2_7_MASKS_SERVER
>
> Those can and will change though, over time.  But -mcpu=3Dpowerpc64 (etc.=
)
> always will mean what the current documentation says it does:
>      '-mcpu=3Dpowerpc', '-mcpu=3Dpowerpc64', and '-mcpu=3Dpowerpc64le' sp=
ecify
>      pure 32-bit PowerPC (either endian), 64-bit big endian PowerPC and
>      64-bit little endian PowerPC architecture machine types, with an
>      appropriate, generic processor model assumed for scheduling
>      purposes.
>
> > My suggestion was to explicitly set -mcpu=3Dpower8 instead of
> > -mcpu=3Dpowerpc64le.
>
> That is implied anyway, it is the minimum supported for
> powerpc64le-linux.  Using -mcpu=3Dpowerpc64le might schedule better for
> newer CPUs, in the future (but the code will always work on all still
> supported CPUs).
>
>
> Segher
