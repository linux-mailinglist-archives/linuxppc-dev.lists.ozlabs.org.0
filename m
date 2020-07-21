Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E90228375
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 17:19:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB2MZ0tZfzDqRX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=C5UnhXc8; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB2GG5v0lzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 01:15:16 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 90A402CC1FF;
 Tue, 21 Jul 2020 11:15:13 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id i_ILqhqx3baP; Tue, 21 Jul 2020 11:15:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 234FA2CC1FE;
 Tue, 21 Jul 2020 11:15:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 234FA2CC1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1595344513;
 bh=LACFvmTqTi5J1fcQsZ51OGzHhe1dZPA2GtTC8a9i8dU=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=C5UnhXc8yTLZu4S4FDtBnaTG3AvJBSI7VMsTi+7tLMDDUEm0AN07tHs+kBS0avSfk
 Zb6Oi6A6I2fwtEk9k9dkoeOesUQ+z0SVGZwvaGnAojmOFHH/B7Druewi4HsVIme3lj
 3QpxDKGdjCLILXfxbuboznKEAcvuDjiplSq3FO03y4Cct+A7vNBD0QEUhOXBQZNNvZ
 prF/HhMA+bUitQU+S/lNG+b+P8UvYpT/8ZN0cMCUEpMt1jzXBp63tWFCn1MAwV6HVE
 j7hoq1brP1vaLgba4o2rpgB3dKogqWCDx3ejLA77EpM3TRQowNZbOazis6UMoYMY32
 b8clEMapNaZDQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WCqJak2w2fcK; Tue, 21 Jul 2020 11:15:13 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 123C62CC793;
 Tue, 21 Jul 2020 11:15:13 -0400 (EDT)
Date: Tue, 21 Jul 2020 11:15:13 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <616209816.22376.1595344513051.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200721150656.GN119549@hirez.programming.kicks-ass.net>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <20200716110038.GA119549@hirez.programming.kicks-ass.net>
 <1594906688.ikv6r4gznx.astroid@bobo.none>
 <1314561373.18530.1594993363050.JavaMail.zimbra@efficios.com>
 <1595213677.kxru89dqy2.astroid@bobo.none>
 <2055788870.20749.1595263590675.JavaMail.zimbra@efficios.com>
 <1595324577.x3bf55tpgu.astroid@bobo.none>
 <20200721150656.GN119549@hirez.programming.kicks-ass.net>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Thread-Index: GYKX/33s7dI4jh+8dYDzcgY5i+BP6Q==
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
 Arnd Bergmann <arnd@arndb.de>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@amacapital.net>,
 linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 21, 2020, at 11:06 AM, Peter Zijlstra peterz@infradead.org wrote:

> On Tue, Jul 21, 2020 at 08:04:27PM +1000, Nicholas Piggin wrote:
> 
>> That being said, the x86 sync core gap that I imagined could be fixed
>> by changing to rq->curr == rq->idle test does not actually exist because
>> the global membarrier does not have a sync core option. So fixing the
>> exit_lazy_tlb points that this series does *should* fix that. So
>> PF_KTHREAD may be less problematic than I thought from implementation
>> point of view, only semantics.
> 
> So I've been trying to figure out where that PF_KTHREAD comes from,
> commit 227a4aadc75b ("sched/membarrier: Fix p->mm->membarrier_state racy
> load") changed 'p->mm' to '!(p->flags & PF_KTHREAD)'.
> 
> So the first version:
> 
>  https://lkml.kernel.org/r/20190906031300.1647-5-mathieu.desnoyers@efficios.com
> 
> appears to unconditionally send the IPI and checks p->mm in the IPI
> context, but then v2:
> 
>  https://lkml.kernel.org/r/20190908134909.12389-1-mathieu.desnoyers@efficios.com
> 
> has the current code. But I've been unable to find the reason the
> 'p->mm' test changed into '!(p->flags & PF_KTHREAD)'.

Looking back at my inbox, it seems like you are the one who proposed to
skip all kthreads: 

https://lkml.kernel.org/r/20190904124333.GQ2332@hirez.programming.kicks-ass.net

> 
> The comment doesn't really help either; sure we have the whole lazy mm
> thing, but that's ->active_mm, not ->mm.
> 
> Possibly it is because {,un}use_mm() do not have sufficient barriers to
> make the remote p->mm test work? Or were we over-eager with the !p->mm
> doesn't imply kthread 'cleanups' at the time?

The nice thing about adding back kthreads to the threads considered for membarrier
IPI is that it has no observable effect on the user-space ABI. No pre-existing kthread
rely on this, and we just provide an additional guarantee for future kthread
implementations.

> Also, I just realized, I still have a fix for use_mm() now
> kthread_use_mm() that seems to have been lost.

I suspect we need to at least document the memory barriers in kthread_use_mm and
kthread_unuse_mm to state that they are required by membarrier if we want to
ipi kthreads as well.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
