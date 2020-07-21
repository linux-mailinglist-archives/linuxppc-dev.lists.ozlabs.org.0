Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7957E2280B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 15:14:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9zZX0Dh2zDqkq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 23:14:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=TbeYjfKf; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9zX34NRyzDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:12:02 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 38C8F2CB608;
 Tue, 21 Jul 2020 09:11:59 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PPeQyMfgGubd; Tue, 21 Jul 2020 09:11:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id C150F2CB9E3;
 Tue, 21 Jul 2020 09:11:58 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com C150F2CB9E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1595337118;
 bh=0FzZwzLd/Z/vpUIiWCr7Q1hJk/9TD3I9q2HN7VpjQsk=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=TbeYjfKfvZxAGqtB11GVb5XqOHAKg2eKsbOGMlSNpgsYi78GStsexknzpopA5gYjd
 iHW5pJeBlD9K41JNcKHEhCXFtl6TXTOiuks37rMUgNNyxEtV1JiwhdJOZpmN5BwmOJ
 C1qw7Nz+Z+aXC6F72ruRruWZUTMFaWY8gOg+CohD5g+7k6LkOV5AfuY4EuJgQphMvA
 qyBDRD77CQ3RGF4P9bdqDFNR240kwOmkxFpNqfXOqyByvwnVDzBnBzJ4/JbyMVAlvx
 tv+xyVSuXGIKtSIrbcsom5VY1p1AP5DiuSLr1KmKilBpD6G2v84tT/dYzF0TE8mX4p
 XzC6ra9yQ52zQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ivaCxDrJH8Q5; Tue, 21 Jul 2020 09:11:58 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id A6DDB2CB7D9;
 Tue, 21 Jul 2020 09:11:58 -0400 (EDT)
Date: Tue, 21 Jul 2020 09:11:58 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <470490605.22057.1595337118562.JavaMail.zimbra@efficios.com>
In-Reply-To: <1595324577.x3bf55tpgu.astroid@bobo.none>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <1594892300.mxnq3b9a77.astroid@bobo.none>
 <20200716110038.GA119549@hirez.programming.kicks-ass.net>
 <1594906688.ikv6r4gznx.astroid@bobo.none>
 <1314561373.18530.1594993363050.JavaMail.zimbra@efficios.com>
 <1595213677.kxru89dqy2.astroid@bobo.none>
 <2055788870.20749.1595263590675.JavaMail.zimbra@efficios.com>
 <1595324577.x3bf55tpgu.astroid@bobo.none>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Thread-Index: vi7IW503i62QJHH8I6RRgM2HetIWrA==
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

----- On Jul 21, 2020, at 6:04 AM, Nicholas Piggin npiggin@gmail.com wrote:

> Excerpts from Mathieu Desnoyers's message of July 21, 2020 2:46 am:
[...]
> 
> Yeah you're probably right in this case I think. Quite likely most kernel
> tasks that asynchronously write to user memory would at least have some
> kind of producer-consumer barriers.
> 
> But is that restriction of all async modifications documented and enforced
> anywhere?
> 
>>> How about other memory accesses via kthread_use_mm? Presumably there is
>>> still ordering requirement there for membarrier,
>> 
>> Please provide an example case with memory accesses via kthread_use_mm where
>> ordering matters to support your concern.
> 
> I think the concern Andy raised with io_uring was less a specific
> problem he saw and more a general concern that we have these memory
> accesses which are not synchronized with membarrier.
> 
>>> so I really think
>>> it's a fragile interface with no real way for the user to know how
>>> kernel threads may use its mm for any particular reason, so membarrier
>>> should synchronize all possible kernel users as well.
>> 
>> I strongly doubt so, but perhaps something should be clarified in the
>> documentation
>> if you have that feeling.
> 
> I'd rather go the other way and say if you have reasoning or numbers for
> why PF_KTHREAD is an important optimisation above rq->curr == rq->idle
> then we could think about keeping this subtlety with appropriate
> documentation added, otherwise we can just kill it and remove all doubt.
> 
> That being said, the x86 sync core gap that I imagined could be fixed
> by changing to rq->curr == rq->idle test does not actually exist because
> the global membarrier does not have a sync core option. So fixing the
> exit_lazy_tlb points that this series does *should* fix that. So
> PF_KTHREAD may be less problematic than I thought from implementation
> point of view, only semantics.

Today, the membarrier global expedited command explicitly skips kernel threads,
but it happens that membarrier private expedited considers those with the
same mm as target for the IPI.

So we already implement a semantic which differs between private and global
expedited membarriers. This can be explained in part by the fact that
kthread_use_mm was introduced after 4.16, where the most recent membarrier
commands where introduced. It seems that the effect on membarrier was not
considered when kthread_use_mm was introduced.

Looking at membarrier(2) documentation, it states that IPIs are only sent to
threads belonging to the same process as the calling thread. If my understanding
of the notion of process is correct, this should rule out sending the IPI to
kernel threads, given they are not "part" of the same process, only borrowing
the mm. But I agree that the distinction is moot, and should be clarified.

Without a clear use-case to justify adding a constraint on membarrier, I am
tempted to simply clarify documentation of current membarrier commands,
stating clearly that they are not guaranteed to affect kernel threads. Then,
if we have a compelling use-case to implement a different behavior which covers
kthreads, this could be added consistently across membarrier commands with a
flag (or by adding new commands).

Does this approach make sense ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
