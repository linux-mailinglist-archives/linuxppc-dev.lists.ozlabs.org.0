Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD9623E8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 10:26:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Gg514D4z3cKG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 20:26:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RYGBnUkG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RYGBnUkG;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7GfB74bBz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 20:25:38 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id y203so1445551pfb.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 01:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGS4hY/eomoN9izW6zHcbUScmK2r6P5qcyAi3NQjkwQ=;
        b=RYGBnUkGNd8Re4j0OCuc8mPTfIXpmUeWeJMJLR81Qk5U7pwJvxoBdOlv8/DjDGzkOA
         R7B5QWCVtJLzZZHiBZ7T43X2Q8Bf3+JZXSDhkcUTA2QEF75QGaKGhvSArFKDJGsRWjuE
         466vug9Klr0CeOTTYY7lyhQ7yE4T1RtLzzAk/MVtlX07Q06tpQDxWnl6wOhBNGIyHF1P
         9eZG88EWnhZL+XA3ILjqjVSQn2h4wrgfTERUoaVDAibVYvZiJycUNGAQrY5M0MO+NNFE
         bg7UBsnNVsXRNNGDtkNWC9d0TIAAuTOqGA3HPotNUo3MzbJeDORLmC08GsiN8GJEK1jU
         rNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dGS4hY/eomoN9izW6zHcbUScmK2r6P5qcyAi3NQjkwQ=;
        b=YjrxpFDv43VTINPnmN95hPml/0ktivI4s+AOLhvXWdTqXeflh+0rAC+p70rUylPHhK
         UgOgG2wHTsFg9loP+LofxRAQXpzRVgoWX3t7oE0IaAAl5SS5+BVaCwZdWT7g5l0QYfEe
         co4DP2ZW+9Z+/95xtqx+Khhtww29o5svR6i9Gpgn+tQSfkvu20Xgoz5ohKcTAvKWLxV8
         JfPMlCW4GVESLgiA9+E3wOE5Kk3/066Bo/yaW+Pz8iGoGWyzsielP0EvxS666124116l
         0EXT8sBCM+v4aaZyZqzSzuziKN6MCmI3I2fUZq5L7vQyjWWGglP6f6soPXdCDyYW7Rtl
         6/ZQ==
X-Gm-Message-State: ACrzQf3iT5JmKdJ9ZGPdRp1IYbToVQzY4X12ztxNIE9eXKDV5zzOGxuN
	WYOQbM7hbvrA7R6Ye23r6ME=
X-Google-Smtp-Source: AMsMyM4HZUDVxKKDIpnR5tEyGl3IhZEIak+7rVdejwbZzXTRsDMOVUV2xBq8DZKAxx1t7ZX4CB8vmA==
X-Received: by 2002:a63:fc4b:0:b0:46f:ed8d:7087 with SMTP id r11-20020a63fc4b000000b0046fed8d7087mr40985605pgk.135.1668072336666;
        Thu, 10 Nov 2022 01:25:36 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id z12-20020a170903018c00b00180daa59314sm10729746plg.125.2022.11.10.01.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 01:25:35 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 19:25:32 +1000
Message-Id: <CO8IAIL7JYTP.MZHCM3R67MRK@bobo>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 03/17] powerpc/qspinlock: use a half-word store to
 unlock to avoid larx/stcx.
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-5-npiggin@gmail.com>
 <1d25e8402e812eb4bb619359e94140d5c03fa9b1.camel@gmail.com>
In-Reply-To: <1d25e8402e812eb4bb619359e94140d5c03fa9b1.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:39 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > The first 16 bits of the lock are only modified by the owner, and other
> > modifications always use atomic operations on the entire 32 bits, so
> > unlocks can use plain stores on the 16 bits. This is the same kind of
> > optimisation done by core qspinlock code.
> > ---
> >  arch/powerpc/include/asm/qspinlock.h       |  6 +-----
> >  arch/powerpc/include/asm/qspinlock_types.h | 19 +++++++++++++++++--
> >  2 files changed, 18 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/includ=
e/asm/qspinlock.h
> > index f06117aa60e1..79a1936fb68d 100644
> > --- a/arch/powerpc/include/asm/qspinlock.h
> > +++ b/arch/powerpc/include/asm/qspinlock.h
> > @@ -38,11 +38,7 @@ static __always_inline void queued_spin_lock(struct =
qspinlock *lock)
> > =20
> >  static inline void queued_spin_unlock(struct qspinlock *lock)
> >  {
> > -	for (;;) {
> > -		int val =3D atomic_read(&lock->val);
> > -		if (atomic_cmpxchg_release(&lock->val, val, val & ~_Q_LOCKED_VAL) =
=3D=3D val)
> > -			return;
> > -	}
> > +	smp_store_release(&lock->locked, 0);
>
> Is it also possible for lock_set_locked() to use a non-atomic acquire
> operation?

It has to be atomic as mentioned earlier.

Thanks,
Nick
