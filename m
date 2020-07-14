Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6021F1F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 14:57:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5gXK21cszDqQj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 22:57:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=D1NGAPg9; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5gHV3TBkzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 22:46:14 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id ls15so1532317pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=/SewYUnqs72nnjMOfIaT/P3hnIetrZLumBpPg+JegX0=;
 b=D1NGAPg9DguAGriffg1ZKDQlJlC1+rzx1RCn9Z1SjvMh8mVyP85iJVTOk27SO4a08k
 1V5qK1FMv2kRDf61ZAwWSToubCahJWjZawbE9dK/JQl/n6KGaGigwT8v4+/JvSOH3c9g
 Mz5Lgz2PjW6tfU5YGXzfAQPF4Wg/hMeniIXfs+bXaz6nZPur23tEIN3EVe4/csCszP7T
 aa4VAfNXB2ufQhsSmU5YlKzEACcAVaHvnN4wfizMbk4JbzAHCQuXlr1YyqS155MassiF
 mgNzS52TqPR5Z4Go7wsaOTe0Q3qKQGveLcrduWSquAZ69BfUR0H0nvbYv0E4QcG7eqYv
 Zv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=/SewYUnqs72nnjMOfIaT/P3hnIetrZLumBpPg+JegX0=;
 b=XtQ2luIR+gUEpOZXMBs3RxudRRJMLnmPiaxrP9Xvr+IQMzXIdSFpTMkEkZoHHDILOl
 Ax9vIS9dRGMNwUCUNFlf8cbibyf4rNpPv2MYgxJLLHwv2p02nel7wn84kVeGYWvMXPEc
 +mRPMVP5mu2sz14toiMz9XDoCXD9ldBMz5+ZNmPYkblkQY36XRLhNnypjizzLjkIwCBz
 76GX7PYCfaSeBnCon2JElaA6PwYnnkV7GkdNfA4jXG1rcrzEXMKgNXsSB/UPpkgOEX7e
 solZ+S87JE+voMf2sl741sqL794NtE1gVzj7VjqRYNhal1uA4U+g4UR5roNmNJZ7xWlT
 B1Pg==
X-Gm-Message-State: AOAM531fUeEjXLzVy+iLeJhK82H97UTFiIYu2avjS5f6HxNoKX2mAkUw
 4tzZA17cO1m3Ffb5RSc9gBsGCQ==
X-Google-Smtp-Source: ABdhPJxJbeD76js5UkUJHGRXxQF8mvRABkEpz0TioNSqyjRD+fSmGpaHXMGBmfPRvfGBot/P0MR7fg==
X-Received: by 2002:a17:90a:3a81:: with SMTP id
 b1mr4539573pjc.217.1594730768819; 
 Tue, 14 Jul 2020 05:46:08 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:1ef2:d111:b7a3:a3d3:c7aa?
 ([2601:646:c200:1ef2:d111:b7a3:a3d3:c7aa])
 by smtp.gmail.com with ESMTPSA id g28sm17494542pfr.70.2020.07.14.05.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 05:46:07 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 7/7] lazy tlb: shoot lazies,
 a non-refcounting lazy tlb option
Date: Tue, 14 Jul 2020 05:46:05 -0700
Message-Id: <6D3D1346-DB1E-43EB-812A-184918CCC16A@amacapital.net>
References: <1594708054.04iuyxuyb5.astroid@bobo.none>
In-Reply-To: <1594708054.04iuyxuyb5.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: iPhone Mail (17F80)
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jul 13, 2020, at 11:31 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> =EF=BB=BFExcerpts from Nicholas Piggin's message of July 14, 2020 3:04 pm:=

>> Excerpts from Andy Lutomirski's message of July 14, 2020 4:18 am:
>>>=20
>>>> On Jul 13, 2020, at 9:48 AM, Nicholas Piggin <npiggin@gmail.com> wrote:=

>>>>=20
>>>> =EF=BB=BFExcerpts from Andy Lutomirski's message of July 14, 2020 1:59 a=
m:
>>>>>> On Thu, Jul 9, 2020 at 6:57 PM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>>>>>>=20
>>>>>> On big systems, the mm refcount can become highly contented when doin=
g
>>>>>> a lot of context switching with threaded applications (particularly
>>>>>> switching between the idle thread and an application thread).
>>>>>>=20
>>>>>> Abandoning lazy tlb slows switching down quite a bit in the important=

>>>>>> user->idle->user cases, so so instead implement a non-refcounted sche=
me
>>>>>> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot do=
wn
>>>>>> any remaining lazy ones.
>>>>>>=20
>>>>>> On a 16-socket 192-core POWER8 system, a context switching benchmark
>>>>>> with as many software threads as CPUs (so each switch will go in and
>>>>>> out of idle), upstream can achieve a rate of about 1 million context
>>>>>> switches per second. After this patch it goes up to 118 million.
>>>>>>=20
>>>>>=20
>>>>> I read the patch a couple of times, and I have a suggestion that could=

>>>>> be nonsense.  You are, effectively, using mm_cpumask() as a sort of
>>>>> refcount.  You're saying "hey, this mm has no more references, but it
>>>>> still has nonempty mm_cpumask(), so let's send an IPI and shoot down
>>>>> those references too."  I'm wondering whether you actually need the
>>>>> IPI.  What if, instead, you actually treated mm_cpumask as a refcount
>>>>> for real?  Roughly, in __mmdrop(), you would only free the page tables=

>>>>> if mm_cpumask() is empty.  And, in the code that removes a CPU from
>>>>> mm_cpumask(), you would check if mm_users =3D=3D 0 and, if so, check i=
f
>>>>> you just removed the last bit from mm_cpumask and potentially free the=

>>>>> mm.
>>>>>=20
>>>>> Getting the locking right here could be a bit tricky -- you need to
>>>>> avoid two CPUs simultaneously exiting lazy TLB and thinking they
>>>>> should free the mm, and you also need to avoid an mm with mm_users
>>>>> hitting zero concurrently with the last remote CPU using it lazily
>>>>> exiting lazy TLB.  Perhaps this could be resolved by having mm_count
>>>>> =3D=3D 1 mean "mm_cpumask() is might contain bits and, if so, it owns t=
he
>>>>> mm" and mm_count =3D=3D 0 meaning "now it's dead" and using some caref=
ul
>>>>> cmpxchg or dec_return to make sure that only one CPU frees it.
>>>>>=20
>>>>> Or maybe you'd need a lock or RCU for this, but the idea would be to
>>>>> only ever take the lock after mm_users goes to zero.
>>>>=20
>>>> I don't think it's nonsense, it could be a good way to avoid IPIs.
>>>>=20
>>>> I haven't seen much problem here that made me too concerned about IPIs=20=

>>>> yet, so I think the simple patch may be good enough to start with
>>>> for powerpc. I'm looking at avoiding/reducing the IPIs by combining the=

>>>> unlazying with the exit TLB flush without doing anything fancy with
>>>> ref counting, but we'll see.
>>>=20
>>> I would be cautious with benchmarking here. I would expect that the
>>> nasty cases may affect power consumption more than performance =E2=80=94=
 the=20
>>> specific issue is IPIs hitting idle cores, and the main effects are to=20=

>>> slow down exit() a bit but also to kick the idle core out of idle.=20
>>> Although, if the idle core is in a deep sleep, that IPI could be=20
>>> *very* slow.
>>=20
>> It will tend to be self-limiting to some degree (deeper idle cores
>> would tend to have less chance of IPI) but we have bigger issues on
>> powerpc with that, like broadcast IPIs to the mm cpumask for THP
>> management. Power hasn't really shown up as an issue but powerpc
>> CPUs may have their own requirements and issues there, shall we say.
>>=20
>>> So I think it=E2=80=99s worth at least giving this a try.
>>=20
>> To be clear it's not a complete solution itself. The problem is of=20
>> course that mm cpumask gives you false negatives, so the bits
>> won't always clean up after themselves as CPUs switch away from their
>> lazy tlb mms.
>=20
> ^^
>=20
> False positives: CPU is in the mm_cpumask, but is not using the mm
> as a lazy tlb. So there can be bits left and never freed.
>=20
> If you closed the false positives, you're back to a shared mm cache
> line on lazy mm context switches.

x86 has this exact problem. At least no more than 64*8 CPUs share the cache l=
ine :)

Can your share your benchmark?

>=20
> Thanks,
> Nick
