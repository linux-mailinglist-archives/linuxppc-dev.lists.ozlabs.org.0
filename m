Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C12296FFA34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 21:35:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHMYk52Tlz3fXK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 05:35:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=D8VOr21F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=nphamcs@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=D8VOr21F;
	dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHMXs6Wqpz3fD8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 05:34:37 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-61b60d0c5b8so42227196d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683833674; x=1686425674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkRg4aBIGd+Ujeyjhqn0VJEzJVlq0iY77Z11k0mAFFM=;
        b=D8VOr21Fczrl0K1COf0x4Ck7WHMsRogiYEEbrY2VpNny+n3MR+tJuDH09I9YAsS652
         swT6GvFknXTnMBZPWlOxHk2u05+SeKUhRFMH/ZtDMNfuFTmqhV28jtrPoFuIwQ/bqAzu
         JEHJCZ22+ejNPu9sQ5B4mFAObz8laeWoYTSRIa0MiOnPq0OszLg5zmMrWPnpqMS2qlwN
         5gjqnyxgdjPUMVEd0f/03my+5DYNfTma/sJ3vnrs+cTqKEwezFl9LOtEmPAD5vfhXfNX
         JrpZrTJ+uj1uIfEyrp6lAwR5J8sidiziH5Wld/lDfUFxzbjgvyiL15VatExShfnoJdEm
         /ImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683833674; x=1686425674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkRg4aBIGd+Ujeyjhqn0VJEzJVlq0iY77Z11k0mAFFM=;
        b=R/wmqCW0JZvHumtT6/BHlDeUFuMrSon/GjGPhGOG9kcK0D3ROZwdBQhPpYd7wfntPx
         tflD2dd4XmtZsYD5grqgr1NezPw41DKip3QgXqKbnXbEY8GEELKaZyltSm/2lYZGHBQU
         /z2LoPOiYEjLFfbb5uL5zfmjPw2ZvttqQOE/5l2dxRBDvXl8riOBT4DLs7eCmcqrZuf8
         6qgqG91cqtHI4wZXOw3aztYLKGF+G9lQTd3L3widaqw8EAvHmCjPTXKYOYWbTHbopTz6
         4DSfCR45FYNa+6NuOKYLyFDygKrA0ZynvndMXtz5ek8y4r2qiT0H4v6CQWqJx1XyRkRH
         I2SQ==
X-Gm-Message-State: AC+VfDyApq/RRbY4PzO6vS4C6L3Bi27ITFBgA4s/7gcmFnv6RXQkBrJ6
	YJTT341Ykf+7U+T95BxiAuujHbe8Tr4IZWO9fiw=
X-Google-Smtp-Source: ACHHUZ6FKXu0op+KxzAVHeFuNCXe2D1xFAp09jFVR7D1aeGdyycJWyp3G5ZLoEExaajX1pb4elh/5/+JF1DIDbKGBFc=
X-Received: by 2002:ad4:5dec:0:b0:5a1:6212:93be with SMTP id
 jn12-20020ad45dec000000b005a1621293bemr33993641qvb.29.1683833673901; Thu, 11
 May 2023 12:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230510195806.2902878-1-nphamcs@gmail.com> <874joja6vz.fsf@mail.lhotse>
In-Reply-To: <874joja6vz.fsf@mail.lhotse>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 11 May 2023 12:34:23 -0700
Message-ID: <CAKEwX=OHMaUzEG9hoMz20m9DnyFD4xC78KiNV1Qu0bUhkrYhAA@mail.gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, linux-mm@kvack.org, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, linux@armlinux.org.uk, geert@linux-m68k.org, mattst88@gmail.com, borntraeger@linux.ibm.com, linux-alpha@vger.kernel.org, gor@linux.ibm.com, hca@linux.ibm.com, kernel-team@meta.com, richard.henderson@linaro.org, npiggin@gmail.com, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, glaubitz@physik.fu-berlin.de, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 10, 2023 at 8:23=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Nhat Pham <nphamcs@gmail.com> writes:
> > cachestat is previously only wired in for x86 (and architectures using
> > the generic unistd.h table):
> >
> > https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com=
/
> >
> > This patch wires cachestat in for all the other architectures.
> >
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > ---
> >  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
> >  arch/arm/tools/syscall.tbl                  | 1 +
> >  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
> >  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
> >  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
> >  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
> >  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>
> With the change to the selftest (see my other mail), I tested this on
> powerpc and all tests pass.

Saw the change you proposed, Michael! It looks good to me.
Thanks for helping me make the selftest suite more robust :)

>
> Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
>
> cheers
