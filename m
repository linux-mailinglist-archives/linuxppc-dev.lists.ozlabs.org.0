Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E121E84C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:37:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5W5c2FdlzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:37:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nVpM8O7y; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Vz91DxwzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:31:32 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id q5so19922416wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 23:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=IW5MsAw16WncT7hiN49Rl3HYAzAQeKbFqwcVhNGKS+0=;
 b=nVpM8O7ybmoMTE2akKTxb4v6KVMISCvIgqJqJwoSHz7qagb7clcsDC+oQbghkHElPc
 bjm8Hayl9wJtAbIZeB/zSnP71SuAi3ZZ9gwGNQUbLx+zLfKT/mL98S0vnSloOp8FEKm+
 llTVPmLwkGgpk0HU9VepNa3BRC4XZTAOOYqEGL5xzDZ+7uEJW5gcwoQ4Fj4KvV5z51q1
 JYdIEQF1uD+mz1mq86749Bjgs5ZqP5DaAH6LawN8dS6YhviPE0IiwuVRW2V3LxQ+wY2D
 zsIYrVjcm7MPuqhZSyITlHvpp6ktGzPjvSTFNN57jN4HmJQQfkicQ+1HDNrT042NANOi
 TA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=IW5MsAw16WncT7hiN49Rl3HYAzAQeKbFqwcVhNGKS+0=;
 b=dPCyRLlimXpePwN9BPKwZUfd1dp1IPqb0k2ts6frCrbGemZUaLTUQt2MC9c+Z1zyYN
 gSYXtPMZLI8+1GTsXFkyLRsABJJlXh0KbTHrJaPkYbhqmGYB3CgIRTvAlIWfF5JsSnoi
 hlc2z4xa5B0yzIofosLa3PcKJeQ1PzWpOEbonKBFaiWiyq1WZbffWG8qvTtN29rSpNvc
 68wlW2+LXCwNF7qBPIT3LfKI14nu2hH83pGuavLWyD6dKEROm1B+vk+VPR+/jdXIPACI
 9Qw9bjkwyLU8xQR+irW33mX1YPQGiHvrXcuJBX+dvQIZ/ZT4jcqMXlaWGmfZR/agoBEx
 OUnw==
X-Gm-Message-State: AOAM530BoZgyos/hpmMR0Y4tJ7IB2PLv5HoTK5pSfRonJHy4J1KVwUoa
 vUIKgtjteNtY2znI6IRQIIo=
X-Google-Smtp-Source: ABdhPJwfFy6dmo1Vm5gws7qxqL6AU1u3wZpvQnq5Cd3DfkTvP2ksYNqKbknLtrONUpUfmGGPoNjFgA==
X-Received: by 2002:adf:e482:: with SMTP id i2mr3266445wrm.75.1594708288840;
 Mon, 13 Jul 2020 23:31:28 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id z6sm2772208wmf.33.2020.07.13.23.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 23:31:28 -0700 (PDT)
Date: Tue, 14 Jul 2020 16:31:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 7/7] lazy tlb: shoot lazies, a non-refcounting lazy
 tlb option
To: Andy Lutomirski <luto@amacapital.net>
References: <1594658283.qabzoxga67.astroid@bobo.none>
 <010054C3-7FFF-4FB5-BDA8-D2B80F7B1A5D@amacapital.net>
 <1594701900.gcgdq8p13l.astroid@bobo.none>
In-Reply-To: <1594701900.gcgdq8p13l.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1594708054.04iuyxuyb5.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of July 14, 2020 3:04 pm:
> Excerpts from Andy Lutomirski's message of July 14, 2020 4:18 am:
>>=20
>>> On Jul 13, 2020, at 9:48 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>>=20
>>> =EF=BB=BFExcerpts from Andy Lutomirski's message of July 14, 2020 1:59 =
am:
>>>>> On Thu, Jul 9, 2020 at 6:57 PM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>>>>>=20
>>>>> On big systems, the mm refcount can become highly contented when doin=
g
>>>>> a lot of context switching with threaded applications (particularly
>>>>> switching between the idle thread and an application thread).
>>>>>=20
>>>>> Abandoning lazy tlb slows switching down quite a bit in the important
>>>>> user->idle->user cases, so so instead implement a non-refcounted sche=
me
>>>>> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot do=
wn
>>>>> any remaining lazy ones.
>>>>>=20
>>>>> On a 16-socket 192-core POWER8 system, a context switching benchmark
>>>>> with as many software threads as CPUs (so each switch will go in and
>>>>> out of idle), upstream can achieve a rate of about 1 million context
>>>>> switches per second. After this patch it goes up to 118 million.
>>>>>=20
>>>>=20
>>>> I read the patch a couple of times, and I have a suggestion that could
>>>> be nonsense.  You are, effectively, using mm_cpumask() as a sort of
>>>> refcount.  You're saying "hey, this mm has no more references, but it
>>>> still has nonempty mm_cpumask(), so let's send an IPI and shoot down
>>>> those references too."  I'm wondering whether you actually need the
>>>> IPI.  What if, instead, you actually treated mm_cpumask as a refcount
>>>> for real?  Roughly, in __mmdrop(), you would only free the page tables
>>>> if mm_cpumask() is empty.  And, in the code that removes a CPU from
>>>> mm_cpumask(), you would check if mm_users =3D=3D 0 and, if so, check i=
f
>>>> you just removed the last bit from mm_cpumask and potentially free the
>>>> mm.
>>>>=20
>>>> Getting the locking right here could be a bit tricky -- you need to
>>>> avoid two CPUs simultaneously exiting lazy TLB and thinking they
>>>> should free the mm, and you also need to avoid an mm with mm_users
>>>> hitting zero concurrently with the last remote CPU using it lazily
>>>> exiting lazy TLB.  Perhaps this could be resolved by having mm_count
>>>> =3D=3D 1 mean "mm_cpumask() is might contain bits and, if so, it owns =
the
>>>> mm" and mm_count =3D=3D 0 meaning "now it's dead" and using some caref=
ul
>>>> cmpxchg or dec_return to make sure that only one CPU frees it.
>>>>=20
>>>> Or maybe you'd need a lock or RCU for this, but the idea would be to
>>>> only ever take the lock after mm_users goes to zero.
>>>=20
>>> I don't think it's nonsense, it could be a good way to avoid IPIs.
>>>=20
>>> I haven't seen much problem here that made me too concerned about IPIs=20
>>> yet, so I think the simple patch may be good enough to start with
>>> for powerpc. I'm looking at avoiding/reducing the IPIs by combining the
>>> unlazying with the exit TLB flush without doing anything fancy with
>>> ref counting, but we'll see.
>>=20
>> I would be cautious with benchmarking here. I would expect that the
>> nasty cases may affect power consumption more than performance =E2=80=94=
 the=20
>> specific issue is IPIs hitting idle cores, and the main effects are to=20
>> slow down exit() a bit but also to kick the idle core out of idle.=20
>> Although, if the idle core is in a deep sleep, that IPI could be=20
>> *very* slow.
>=20
> It will tend to be self-limiting to some degree (deeper idle cores
> would tend to have less chance of IPI) but we have bigger issues on
> powerpc with that, like broadcast IPIs to the mm cpumask for THP
> management. Power hasn't really shown up as an issue but powerpc
> CPUs may have their own requirements and issues there, shall we say.
>=20
>> So I think it=E2=80=99s worth at least giving this a try.
>=20
> To be clear it's not a complete solution itself. The problem is of=20
> course that mm cpumask gives you false negatives, so the bits
> won't always clean up after themselves as CPUs switch away from their
> lazy tlb mms.

^^

False positives: CPU is in the mm_cpumask, but is not using the mm
as a lazy tlb. So there can be bits left and never freed.

If you closed the false positives, you're back to a shared mm cache
line on lazy mm context switches.

Thanks,
Nick
