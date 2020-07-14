Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AABEB21E74E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 07:06:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5T4W4mj8zDqTp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 15:06:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=slRrMlV0; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5T2g6s3CzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 15:04:27 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a24so1448699pfc.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 22:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=VIK/YY3yTw6u4hITwUK0EgJq6PIjyhDYiaWYv31wto8=;
 b=slRrMlV0lZMUt2zoP1edcjG+ngUwdQ/+Uu9TSo4PH+TWndDmw8XMv8OCEFR+1mwGOG
 g6SsD9uTmDCBMcinafpQpm7o/PCRr+s4nfTKf1yLJPxfbuqu3Wk8PfSf1rS8ys4GBklg
 FvAWOtjECrcR8SFvbs6fNz/1jSS7zq7zlNigFNS0F5SoCFM01nSvkhXUSfSOnU2cvswC
 RtmaDngwF3zbLU9+CSI/tNWL3Ke7dHaAz9hCqlTKEnYaD0XWvrifayJB9J8WEvKsbqgi
 9GCxkywubm8UmQGKYuNAJ+xD/Zib45iY0ZtrgH2WAb8gF4zD54dpCQlg+5XJxbfVWhWy
 i9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VIK/YY3yTw6u4hITwUK0EgJq6PIjyhDYiaWYv31wto8=;
 b=MV1Fm/LW2R0AvYph34w5yYk61fWLaX7fW9KwRWAQLZ/KY7muJpMdmPne1SrWKShTTR
 JeT8BjZqYLqsl/ecNbgkbRO184YXm52xqPzvLhRmao3rmQEAkwHcpE4m6AYaYkT1m4p9
 ZZmmFxpO8LP5Imr43HqiYdKKsv8Kcn8UpzIDoQuNRcb0mrUd3SPDEuNPscFYsmpXzFfE
 z8qRD/gq3AxV0UN/3cUtqeZQZxT3ZIatoIEXsNC0F3OjyEA6i9xSP6+omRW1CyE5eezd
 nvK1skN7HmcVmEyLSXKcsp2WiaUev3eLnZT3SkNXQKSkE8nN/TlqPiN6FraKzhwv1fg4
 kXBA==
X-Gm-Message-State: AOAM531Wy2hXf1eBdwFy+50Wjn8pomesL1rqgBv1Dhq90mRREdUwjFXw
 m/7YRO2ACocAIRD2sRiFifc=
X-Google-Smtp-Source: ABdhPJzjkdOVPLyQQhEB39lRCIFS24w3GNHvCYgABOFNsQYU+BBY6WgR9Vc6I81S8+XI+UZB46zUbw==
X-Received: by 2002:aa7:9708:: with SMTP id a8mr2817058pfg.234.1594703063836; 
 Mon, 13 Jul 2020 22:04:23 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id y17sm15754645pfe.30.2020.07.13.22.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 22:04:23 -0700 (PDT)
Date: Tue, 14 Jul 2020 15:04:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 7/7] lazy tlb: shoot lazies, a non-refcounting lazy
 tlb option
To: Andy Lutomirski <luto@amacapital.net>
References: <1594658283.qabzoxga67.astroid@bobo.none>
 <010054C3-7FFF-4FB5-BDA8-D2B80F7B1A5D@amacapital.net>
In-Reply-To: <010054C3-7FFF-4FB5-BDA8-D2B80F7B1A5D@amacapital.net>
MIME-Version: 1.0
Message-Id: <1594701900.gcgdq8p13l.astroid@bobo.none>
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

Excerpts from Andy Lutomirski's message of July 14, 2020 4:18 am:
>=20
>> On Jul 13, 2020, at 9:48 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> =EF=BB=BFExcerpts from Andy Lutomirski's message of July 14, 2020 1:59 a=
m:
>>>> On Thu, Jul 9, 2020 at 6:57 PM Nicholas Piggin <npiggin@gmail.com> wro=
te:
>>>>=20
>>>> On big systems, the mm refcount can become highly contented when doing
>>>> a lot of context switching with threaded applications (particularly
>>>> switching between the idle thread and an application thread).
>>>>=20
>>>> Abandoning lazy tlb slows switching down quite a bit in the important
>>>> user->idle->user cases, so so instead implement a non-refcounted schem=
e
>>>> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot dow=
n
>>>> any remaining lazy ones.
>>>>=20
>>>> On a 16-socket 192-core POWER8 system, a context switching benchmark
>>>> with as many software threads as CPUs (so each switch will go in and
>>>> out of idle), upstream can achieve a rate of about 1 million context
>>>> switches per second. After this patch it goes up to 118 million.
>>>>=20
>>>=20
>>> I read the patch a couple of times, and I have a suggestion that could
>>> be nonsense.  You are, effectively, using mm_cpumask() as a sort of
>>> refcount.  You're saying "hey, this mm has no more references, but it
>>> still has nonempty mm_cpumask(), so let's send an IPI and shoot down
>>> those references too."  I'm wondering whether you actually need the
>>> IPI.  What if, instead, you actually treated mm_cpumask as a refcount
>>> for real?  Roughly, in __mmdrop(), you would only free the page tables
>>> if mm_cpumask() is empty.  And, in the code that removes a CPU from
>>> mm_cpumask(), you would check if mm_users =3D=3D 0 and, if so, check if
>>> you just removed the last bit from mm_cpumask and potentially free the
>>> mm.
>>>=20
>>> Getting the locking right here could be a bit tricky -- you need to
>>> avoid two CPUs simultaneously exiting lazy TLB and thinking they
>>> should free the mm, and you also need to avoid an mm with mm_users
>>> hitting zero concurrently with the last remote CPU using it lazily
>>> exiting lazy TLB.  Perhaps this could be resolved by having mm_count
>>> =3D=3D 1 mean "mm_cpumask() is might contain bits and, if so, it owns t=
he
>>> mm" and mm_count =3D=3D 0 meaning "now it's dead" and using some carefu=
l
>>> cmpxchg or dec_return to make sure that only one CPU frees it.
>>>=20
>>> Or maybe you'd need a lock or RCU for this, but the idea would be to
>>> only ever take the lock after mm_users goes to zero.
>>=20
>> I don't think it's nonsense, it could be a good way to avoid IPIs.
>>=20
>> I haven't seen much problem here that made me too concerned about IPIs=20
>> yet, so I think the simple patch may be good enough to start with
>> for powerpc. I'm looking at avoiding/reducing the IPIs by combining the
>> unlazying with the exit TLB flush without doing anything fancy with
>> ref counting, but we'll see.
>=20
> I would be cautious with benchmarking here. I would expect that the
> nasty cases may affect power consumption more than performance =E2=80=94 =
the=20
> specific issue is IPIs hitting idle cores, and the main effects are to=20
> slow down exit() a bit but also to kick the idle core out of idle.=20
> Although, if the idle core is in a deep sleep, that IPI could be=20
> *very* slow.

It will tend to be self-limiting to some degree (deeper idle cores
would tend to have less chance of IPI) but we have bigger issues on
powerpc with that, like broadcast IPIs to the mm cpumask for THP
management. Power hasn't really shown up as an issue but powerpc
CPUs may have their own requirements and issues there, shall we say.

> So I think it=E2=80=99s worth at least giving this a try.

To be clear it's not a complete solution itself. The problem is of=20
course that mm cpumask gives you false negatives, so the bits
won't always clean up after themselves as CPUs switch away from their
lazy tlb mms.

I would suspect it _may_ help with garbage collecting some remainders
nicely after exit, but only with somewhat of a different accounting
system than powerpc uses -- we tie mm_cpumask to TLB valids, so it can
become spread over CPUs that don't (and even have never) used that mm
as a lazy mm I don't know that the self-culling trick would help
a great deal within that scheme.

So powerpc needs a bit more work on that side of things too, hence
looking at doing more of this in the final TLB shootdown.

There's actually a lot of other things we can do as well to reduce
IPIs, batching being a simple hammer, some kind of quiescing, testing
the remote CPU to check what active mm it is using, doing the un-lazy
at certain defined points etc, so I'm actually not worried about IPIs
suddenly popping up and rendering the whole concept unworkable. At
some point (unless we go something pretty complex like a SRCU type=20
thing, or adding extra locking .e.g, to use_mm()), then at least=20
sometimes an IPI will be required so I think it's reasonable to
start here and introduce complexity more slowly if it's justified.

Thanks,
Nick

