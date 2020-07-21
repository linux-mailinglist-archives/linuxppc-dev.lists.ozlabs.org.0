Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C29228245
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 16:33:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB1L046BBzDqhm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 00:33:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BuKjOr11; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB1GF5fn9zDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 00:30:12 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id f18so3094298wml.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NtR3vJ1N4iGqoNW7LE2c1cXPrbxowMXHvYixqbulC4A=;
 b=BuKjOr11JAgWbiAF4Sj32zPuFLiD9iRV+uWXQboiosDmEW5UZ0xy9LEwHdcmln3L/w
 Z4yi4/arnJ6RZmqym+O1wipOeuqgSE/gQ7NyaQhtWKSDNESyouAirTmB7XBlAZtP7cNK
 ho/3x9QXKzM/HXaUFbrpHKEpUepG36+GVXUo1FGKXksY4ivDE6wzLClaydvaDAnvBNBa
 0rolFj5vLpGYFwcf7tSPNgYnMfQyP74LejqxV5QPQEQ2RvpgrT0wv1m5zzFIrzoGBEc9
 ADgk+yYBe4UqtY2SfkETXxoEfUgH1mo4et8iwb1JyQO1sj85KsMTahA3LqaBH2PWR3Mx
 Mw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NtR3vJ1N4iGqoNW7LE2c1cXPrbxowMXHvYixqbulC4A=;
 b=BV9j3Fad1Xdaq/aIAc1vzoe8qcGQR9cVolpqkikc3eHZsdhb3D6wZMI6Ny6i4BUdvJ
 bvp7Z8/k4FDhtM7ptLNy3CygAYTSMRdIublNyYcf4tUpdsiBzP8b33z+8Gd6jL4YVXnx
 wFh3VtSwaqDff3UYm9KJyCpANCvb+K1Ip41ORx7lKt+XfFZBtMFF1NKr5RUoV791cZ+/
 HurJ8tMi+yLdpP3VJwViaTLjv1opDo2FbiSBZyIi0HcGrZyiPIES1MMJ7OGl+c/kDmyJ
 9exBpTci0T/bctT/C/PJiI9EreCSfbTThVus95e6e/cP0PmUl9rkse6KpWiXFmYC+sJz
 SxPw==
X-Gm-Message-State: AOAM532u3Xn3E7S2fvUk3w+HlND/FXUjYhFvEkr7u9cCYYOX0NzWGGDj
 tKFb92wKJdM+oDJIOv7/ipU=
X-Google-Smtp-Source: ABdhPJwB9fyGj6S2BjQwyEItOwht6pp2/UOFe0UgTMjlm93I+Hjufyw5bWfBW9fmR+lDu40fsypZXA==
X-Received: by 2002:a1c:6809:: with SMTP id d9mr4291206wmc.34.1595341809069;
 Tue, 21 Jul 2020 07:30:09 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id a22sm3655822wmj.9.2020.07.21.07.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 07:30:08 -0700 (PDT)
Date: Wed, 22 Jul 2020 00:30:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <1594892300.mxnq3b9a77.astroid@bobo.none>
 <20200716110038.GA119549@hirez.programming.kicks-ass.net>
 <1594906688.ikv6r4gznx.astroid@bobo.none>
 <1314561373.18530.1594993363050.JavaMail.zimbra@efficios.com>
 <1595213677.kxru89dqy2.astroid@bobo.none>
 <2055788870.20749.1595263590675.JavaMail.zimbra@efficios.com>
 <1595324577.x3bf55tpgu.astroid@bobo.none>
 <470490605.22057.1595337118562.JavaMail.zimbra@efficios.com>
In-Reply-To: <470490605.22057.1595337118562.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Message-Id: <1595341248.r2i8fnhz28.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch <linux-arch@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, linux-mm <linux-mm@kvack.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Mathieu Desnoyers's message of July 21, 2020 11:11 pm:
> ----- On Jul 21, 2020, at 6:04 AM, Nicholas Piggin npiggin@gmail.com wrot=
e:
>=20
>> Excerpts from Mathieu Desnoyers's message of July 21, 2020 2:46 am:
> [...]
>>=20
>> Yeah you're probably right in this case I think. Quite likely most kerne=
l
>> tasks that asynchronously write to user memory would at least have some
>> kind of producer-consumer barriers.
>>=20
>> But is that restriction of all async modifications documented and enforc=
ed
>> anywhere?
>>=20
>>>> How about other memory accesses via kthread_use_mm? Presumably there i=
s
>>>> still ordering requirement there for membarrier,
>>>=20
>>> Please provide an example case with memory accesses via kthread_use_mm =
where
>>> ordering matters to support your concern.
>>=20
>> I think the concern Andy raised with io_uring was less a specific
>> problem he saw and more a general concern that we have these memory
>> accesses which are not synchronized with membarrier.
>>=20
>>>> so I really think
>>>> it's a fragile interface with no real way for the user to know how
>>>> kernel threads may use its mm for any particular reason, so membarrier
>>>> should synchronize all possible kernel users as well.
>>>=20
>>> I strongly doubt so, but perhaps something should be clarified in the
>>> documentation
>>> if you have that feeling.
>>=20
>> I'd rather go the other way and say if you have reasoning or numbers for
>> why PF_KTHREAD is an important optimisation above rq->curr =3D=3D rq->id=
le
>> then we could think about keeping this subtlety with appropriate
>> documentation added, otherwise we can just kill it and remove all doubt.
>>=20
>> That being said, the x86 sync core gap that I imagined could be fixed
>> by changing to rq->curr =3D=3D rq->idle test does not actually exist bec=
ause
>> the global membarrier does not have a sync core option. So fixing the
>> exit_lazy_tlb points that this series does *should* fix that. So
>> PF_KTHREAD may be less problematic than I thought from implementation
>> point of view, only semantics.
>=20
> Today, the membarrier global expedited command explicitly skips kernel th=
reads,
> but it happens that membarrier private expedited considers those with the
> same mm as target for the IPI.
>=20
> So we already implement a semantic which differs between private and glob=
al
> expedited membarriers.

Which is not a good thing.

> This can be explained in part by the fact that
> kthread_use_mm was introduced after 4.16, where the most recent membarrie=
r
> commands where introduced. It seems that the effect on membarrier was not
> considered when kthread_use_mm was introduced.

No it was just renamed, it used to be called use_mm and has been in the=20
kernel for ~ever.

That you hadn't considered this is actually weight for my point, which=20
is that there's so much subtle behaviour that's easy to miss we're=20
better off with simpler and fewer special cases until it's proven=20
they're needed. Not the other way around.

>=20
> Looking at membarrier(2) documentation, it states that IPIs are only sent=
 to
> threads belonging to the same process as the calling thread. If my unders=
tanding
> of the notion of process is correct, this should rule out sending the IPI=
 to
> kernel threads, given they are not "part" of the same process, only borro=
wing
> the mm. But I agree that the distinction is moot, and should be clarified=
.

It does if you read it in a user-hostile legalistic way. The reality is=20
userspace shouldn't and can't know about how the kernel might implement=20
functionality.

> Without a clear use-case to justify adding a constraint on membarrier, I =
am
> tempted to simply clarify documentation of current membarrier commands,
> stating clearly that they are not guaranteed to affect kernel threads. Th=
en,
> if we have a compelling use-case to implement a different behavior which =
covers
> kthreads, this could be added consistently across membarrier commands wit=
h a
> flag (or by adding new commands).
>=20
> Does this approach make sense ?

The other position is without a clear use case for PF_KTHREAD, seeing as=20
async kernel accesses had not been considered before now, we limit the=20
optimision to only skipping the idle thread. I think that makes more=20
sense (unless you have a reason for PF_KTHREAD but it doesn't seem like=20
there is much of one).

Thanks,
Nick
