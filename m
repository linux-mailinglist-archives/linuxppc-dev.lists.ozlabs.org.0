Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76991624091
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:00:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Jm02cMVz3dxG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:00:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lQywXpH0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lQywXpH0;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Jl51CC3z2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 21:59:58 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id k22so1686197pfd.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 02:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NKCP6f4PUShdRQ1j0HI8bgv+NgnQVTKi7vNOD8EBk0=;
        b=lQywXpH0HfCjoKwATs9cKmKMKsasnintgTFSES8XTDSE7MfzLK6a2Sm7rkoavi5qBC
         SW7HCxMMO9WTi1k802ZL0vaj2tcOWPnv/qe1Qwlcfv+FJjYlATMyIWTArpQEUJ/EJavX
         WwCanfZWi/YtXRO9AYpaaxQMzrTIgIJG9pUWnMLhjVel7eGfi/cA2maUGy2qY32Zv34y
         zvrHcIhadHRq5YSkkAWcVHCkZWAPH38wT/6kHqtgrNGOXEAyAgieBIu8KuqqAm6ewtCT
         7N5ZT5yVHZshRqIZGMgPKcmPrjmHrjbpqQ6cpK4eF1CaUA2RbVIFYw4Lmkl9Vxjo7BA8
         Y/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NKCP6f4PUShdRQ1j0HI8bgv+NgnQVTKi7vNOD8EBk0=;
        b=xGtshC/SQ9M6AFIeHoiII/xYbz48rantve1yAcfVBPzvi0rOkmtgowqEkoNRqDgI9D
         uBp4jRHWag2xRZ0bhcj/g4KEZlk7j652GbapwyZidU5nfsO4HwFzSKISxSrN6XHEikMD
         NoiVbEzZZTIl2j7/XHEqsu7/ODG76OC/3zNzPK24sHqP1ijo/a1KNDuebfsf/FrL5cdc
         zDd+yKqYO8EsqIIjWDUL7ruyaEAJKmX+jQ2lTTIFGEahahX/bQXK9tnWZXcItTdx3x3b
         NuLCnpCu9/sTaQBJXuF4dnrC/lEVbkVYhpmWn5ylDUMsxRGWtREILrqsA6vVGpYB2WjL
         //PA==
X-Gm-Message-State: ACrzQf30bEK9E8wHzOplGZZKRePXEg9mQL2zevdjZcT5NbMrQn6bijKT
	+Lrim/GROa1K31uScu3acXPeKRMlrFE=
X-Google-Smtp-Source: AMsMyM6h1Tbb1+Awf0DJ1DPHeH7LZKpoYu02TnFai2tLCOWpZETp5cbT6+66ZeCHTmBpxDQFaCahOA==
X-Received: by 2002:a63:234c:0:b0:46f:1b7:438b with SMTP id u12-20020a63234c000000b0046f01b7438bmr54415786pgm.516.1668077997010;
        Thu, 10 Nov 2022 02:59:57 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id x11-20020aa7956b000000b0056bbba4302dsm9926758pfq.119.2022.11.10.02.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 02:59:56 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 20:59:52 +1000
Message-Id: <CO8KAQUNCZLC.1YWEIO7ZTGENX@bobo>
Subject: Re: [PATCH 07/17] powerpc/qspinlock: store owner CPU in lock word
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-9-npiggin@gmail.com>
 <81beccebe8089c9a8762875332beb7ddb395de06.camel@gmail.com>
In-Reply-To: <81beccebe8089c9a8762875332beb7ddb395de06.camel@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Nov 10, 2022 at 10:40 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > Store the owner CPU number in the lock word so it may be yielded to,
> > as powerpc's paravirtualised simple spinlocks do.
> > ---
> >  arch/powerpc/include/asm/qspinlock.h       |  8 +++++++-
> >  arch/powerpc/include/asm/qspinlock_types.h | 10 ++++++++++
> >  arch/powerpc/lib/qspinlock.c               |  6 +++---
> >  3 files changed, 20 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/includ=
e/asm/qspinlock.h
> > index 3ab354159e5e..44601b261e08 100644
> > --- a/arch/powerpc/include/asm/qspinlock.h
> > +++ b/arch/powerpc/include/asm/qspinlock.h
> > @@ -20,9 +20,15 @@ static __always_inline int queued_spin_is_contended(=
struct qspinlock *lock)
> >  	return !!(READ_ONCE(lock->val) & _Q_TAIL_CPU_MASK);
> >  }
> > =20
> > +static __always_inline u32 queued_spin_get_locked_val(void)
>
> Maybe this function should have "encode" in the name to match with
> encode_tail_cpu().

Yep.

> > +{
> > +	/* XXX: make this use lock value in paca like simple spinlocks? */
>
> Is that the paca's lock_token which is 0x8000?

Yes, which AFAIKS is actually unused now with queued spinlocks.

> > +	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
> > +}
> > +
> >  static __always_inline int queued_spin_trylock(struct qspinlock *lock)
> >  {
> > -	u32 new =3D _Q_LOCKED_VAL;
> > +	u32 new =3D queued_spin_get_locked_val();
> >  	u32 prev;
> > =20
> >  	asm volatile(
> > diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/=
include/asm/qspinlock_types.h
> > index 8b20f5e22bba..35f9525381e6 100644
> > --- a/arch/powerpc/include/asm/qspinlock_types.h
> > +++ b/arch/powerpc/include/asm/qspinlock_types.h
> > @@ -29,6 +29,8 @@ typedef struct qspinlock {
> >   * Bitfields in the lock word:
> >   *
> >   *     0: locked bit
> > + *  1-14: lock holder cpu
> > + *    15: unused bit
> >   *    16: must queue bit
> >   * 17-31: tail cpu (+1)
>
> So there is one more bit to store the tail cpu vs the lock holder cpu?

Yeah but the tail has to encode it as CPU+1.

Thanks,
Nick
