Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D511222FB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 02:07:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7BJd4y1nzDrFP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:07:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MukQto0j; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7B8f3qBszDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 10:00:33 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k27so5764406pgm.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ImNiZtmXUEslFcxDwYTJ2V9XDT5Gl9sBS0NfevXsnnY=;
 b=MukQto0jRHUB4yiJDf8IKC4tB6sGzWl/LcJo9HLPE/bkd1kmrX9hGCtCDR5//wUoy2
 vRcf0HCTe9AuTFsgW3Sks6FN5aGElPRZIOw8zuUk+KdKriPEH/mIEVvLQzDLTI15AG0q
 mFYQfgsopKFs+/ZFPZnfJNgkxGHYsM+PLZvwWWABKgpflzLAFiu2MRs5Z8uU8NxMzvh2
 3UB2zjBnZojmtCHtXYsU3Tz2RzCim3B2KUS4X3yT+ydnT2ua6/w1qF1NkQDE9qUJC1QM
 7nbOar1/6Xd4h/Y75r1K8DiEV6G+5kRKWaJxAvD7p+l3JrRTFqnNib5GoeWwmv6z0wCZ
 G0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ImNiZtmXUEslFcxDwYTJ2V9XDT5Gl9sBS0NfevXsnnY=;
 b=ZMsOfX9tYRmPf9UvnRH25FZSKf58/pvqYMpIGwCsIrzg9DbiApyeKIGOh8sXvjBMv1
 QbkcUqKFtMw9iWsJHFfX8kPV1+wCSAJRoubVSd6KCw/vl1xxtSQpAHKm0FL0XkBxqKF7
 REj5Q26zJrlbKEwJl9s6GfwAStV/Uob7FbC3wZAPKcAwc5wgKvlXekNg/awpdRXPhYF6
 gpVT/3IQoRLRV3HIkWm+x0EM0KcUp/axtyb4Gw+u2F8MP28TQApbKy+78KW2h54klGrg
 Xz3kvtXixkaylGR5u8XsNNutQcNA1Ke7YNinKMqYhx5RBJ5qLQv4QGkXNwJTxcwyJwek
 UaGg==
X-Gm-Message-State: AOAM530ZHJo076IJLmqtYl721xXb/DgaB77PhC/RyCLiX0d8kCcOLobk
 Cd7PowwY6iARG8a+WB5CHKA=
X-Google-Smtp-Source: ABdhPJyxJEjlVUAM1TRDOicDFoR9jUfM3MI04m9Y+hFjm51bezMj4uAtGtwPvuODOW9Kom5yT1vlRw==
X-Received: by 2002:a65:6710:: with SMTP id u16mr6358665pgf.45.1594944030371; 
 Thu, 16 Jul 2020 17:00:30 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id cl17sm953913pjb.50.2020.07.16.17.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 17:00:29 -0700 (PDT)
Date: Fri, 17 Jul 2020 10:00:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, paulmck
 <paulmck@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <1594613902.1wzayj0p15.astroid@bobo.none>
 <1594647408.wmrazhwjzb.astroid@bobo.none>
 <284592761.9860.1594649601492.JavaMail.zimbra@efficios.com>
 <1594868476.6k5kvx8684.astroid@bobo.none>
 <1594873644.viept6os6j.astroid@bobo.none>
 <1494299304.15894.1594914382695.JavaMail.zimbra@efficios.com>
 <1370747990.15974.1594915396143.JavaMail.zimbra@efficios.com>
 <595582123.17106.1594925921537.JavaMail.zimbra@efficios.com>
In-Reply-To: <595582123.17106.1594925921537.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Message-Id: <1594942495.8qcz211iwc.astroid@bobo.none>
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
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Mathieu Desnoyers's message of July 17, 2020 4:58 am:
> ----- On Jul 16, 2020, at 12:03 PM, Mathieu Desnoyers mathieu.desnoyers@e=
fficios.com wrote:
>=20
>> ----- On Jul 16, 2020, at 11:46 AM, Mathieu Desnoyers
>> mathieu.desnoyers@efficios.com wrote:
>>=20
>>> ----- On Jul 16, 2020, at 12:42 AM, Nicholas Piggin npiggin@gmail.com w=
rote:
>>>> I should be more complete here, especially since I was complaining
>>>> about unclear barrier comment :)
>>>>=20
>>>>=20
>>>> CPU0                     CPU1
>>>> a. user stuff            1. user stuff
>>>> b. membarrier()          2. enter kernel
>>>> c. smp_mb()              3. smp_mb__after_spinlock(); // in __schedule
>>>> d. read rq->curr         4. rq->curr switched to kthread
>>>> e. is kthread, skip IPI  5. switch_to kthread
>>>> f. return to user        6. rq->curr switched to user thread
>>>> g. user stuff            7. switch_to user thread
>>>>                         8. exit kernel
>>>>                         9. more user stuff
>>>>=20
>>>> What you're really ordering is a, g vs 1, 9 right?
>>>>=20
>>>> In other words, 9 must see a if it sees g, g must see 1 if it saw 9,
>>>> etc.
>>>>=20
>>>> Userspace does not care where the barriers are exactly or what kernel
>>>> memory accesses might be being ordered by them, so long as there is a
>>>> mb somewhere between a and g, and 1 and 9. Right?
>>>=20
>>> This is correct.
>>=20
>> Actually, sorry, the above is not quite right. It's been a while
>> since I looked into the details of membarrier.
>>=20
>> The smp_mb() at the beginning of membarrier() needs to be paired with a
>> smp_mb() _after_ rq->curr is switched back to the user thread, so the
>> memory barrier is between store to rq->curr and following user-space
>> accesses.
>>=20
>> The smp_mb() at the end of membarrier() needs to be paired with the
>> smp_mb__after_spinlock() at the beginning of schedule, which is
>> between accesses to userspace memory and switching rq->curr to kthread.
>>=20
>> As to *why* this ordering is needed, I'd have to dig through additional
>> scenarios from https://lwn.net/Articles/573436/. Or maybe Paul remembers=
 ?
>=20
> Thinking further about this, I'm beginning to consider that maybe we have=
 been
> overly cautious by requiring memory barriers before and after store to rq=
->curr.
>=20
> If CPU0 observes a CPU1's rq->curr->mm which differs from its own process=
 (current)
> while running the membarrier system call, it necessarily means that CPU1 =
had
> to issue smp_mb__after_spinlock when entering the scheduler, between any =
user-space
> loads/stores and update of rq->curr.
>=20
> Requiring a memory barrier between update of rq->curr (back to current pr=
ocess's
> thread) and following user-space memory accesses does not seem to guarant=
ee
> anything more than what the initial barrier at the beginning of __schedul=
e already
> provides, because the guarantees are only about accesses to user-space me=
mory.
>=20
> Therefore, with the memory barrier at the beginning of __schedule, just o=
bserving that
> CPU1's rq->curr differs from current should guarantee that a memory barri=
er was issued
> between any sequentially consistent instructions belonging to the current=
 process on
> CPU1.
>=20
> Or am I missing/misremembering an important point here ?

I might have mislead you.

 CPU0            CPU1
 r1=3Dy            x=3D1
 membarrier()    y=3D1
 r2=3Dx

membarrier provides if r1=3D=3D1 then r2=3D=3D1 (right?)

 CPU0
 r1=3Dy
 membarrier()
   smp_mb();
   t =3D cpu_rq(1)->curr;
   if (t->mm =3D=3D mm)
     IPI(CPU1);
   smp_mb()
 r2=3Dx

 vs

 CPU1
   ...
   __schedule()
     smp_mb__after_spinlock()
     rq->curr =3D kthread
   ...
   __schedule()
     smp_mb__after_spinlock()
     rq->curr =3D user thread
 exit kernel
 x=3D1
 y=3D1

Now these last 3 stores are not ordered, so CPU0 might see y=3D=3D1 but
rq->curr =3D=3D kthread, right? Then it will skip the IPI and stores to x=20
and y will not be ordered.

So we do need a mb after rq->curr store when mm is switching.

I believe for the global membarrier PF_KTHREAD optimisation, we also=20
need a barrier when switching from a kernel thread to user, for the
same reason.

So I think I was wrong to say the barrier is not necessary.

I haven't quite worked out why two mb()s are required in membarrier(),
but at least that's less of a performance concern.

Thanks,
Nick
