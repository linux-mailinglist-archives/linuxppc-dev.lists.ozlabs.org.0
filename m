Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FF223FCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 17:42:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7b3W6j3TzDrQy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 01:42:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=gD8pz+Gv; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Zzk46GYzDqv3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 01:39:12 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id F35F82C8A1F;
 Fri, 17 Jul 2020 11:39:08 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 61XC0oH3775c; Fri, 17 Jul 2020 11:39:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 8E5782C88A5;
 Fri, 17 Jul 2020 11:39:08 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 8E5782C88A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1595000348;
 bh=KcymKk7xqqEPTpGeFV6WmpL2INb7TpCCRlY0uv4IIl4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=gD8pz+GvRrmmamH69LfCRwyu3TOcDwjt7ajYq/DR8gSrVpZSqFY17J1vy3Bh0F/8o
 sS+G2QDxdzLVS4FjsBBvzriLqSB9ObKBgBBTiZZWeXVi3Sa/o+As9jaFmI/GVdYDUY
 jsph8cMcJzSZJN43LfMCqyyC+vIW7szdYu4WHYYdi+qhStvM4wOCChUxo23TbDMAwq
 /dfs5RVE/EMR05TtOaZFpJJ2ooWlzmv/eH6xsIHsMssnxIA6Gs9BKU0/TuaZO6Cpbb
 ddCLfgNCHwhu4ikCvGtM27lhk7soeCBycFCh62abkSHoULSYmrO0MEjkEYaC3YOu/6
 vKl66KONA+byg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VWAgzG4ZGvtm; Fri, 17 Jul 2020 11:39:08 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 7B3A92C88A4;
 Fri, 17 Jul 2020 11:39:08 -0400 (EDT)
Date: Fri, 17 Jul 2020 11:39:08 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Alan Stern <stern@rowland.harvard.edu>
Message-ID: <1697220787.18880.1595000348405.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200717145102.GC1147780@rowland.harvard.edu>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <1594873644.viept6os6j.astroid@bobo.none>
 <1494299304.15894.1594914382695.JavaMail.zimbra@efficios.com>
 <1370747990.15974.1594915396143.JavaMail.zimbra@efficios.com>
 <595582123.17106.1594925921537.JavaMail.zimbra@efficios.com>
 <20200716212416.GA1126458@rowland.harvard.edu>
 <1770378591.18523.1594993165391.JavaMail.zimbra@efficios.com>
 <20200717145102.GC1147780@rowland.harvard.edu>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Thread-Index: mVSzzDyP2RjmLYTpgzYa2Ixemz2qhA==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, paulmck <paulmck@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm <linux-mm@kvack.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 17, 2020, at 10:51 AM, Alan Stern stern@rowland.harvard.edu wrote:

> On Fri, Jul 17, 2020 at 09:39:25AM -0400, Mathieu Desnoyers wrote:
>> ----- On Jul 16, 2020, at 5:24 PM, Alan Stern stern@rowland.harvard.edu wrote:
>> 
>> > On Thu, Jul 16, 2020 at 02:58:41PM -0400, Mathieu Desnoyers wrote:
>> >> ----- On Jul 16, 2020, at 12:03 PM, Mathieu Desnoyers
>> >> mathieu.desnoyers@efficios.com wrote:
>> >> 
>> >> > ----- On Jul 16, 2020, at 11:46 AM, Mathieu Desnoyers
>> >> > mathieu.desnoyers@efficios.com wrote:
>> >> > 
>> >> >> ----- On Jul 16, 2020, at 12:42 AM, Nicholas Piggin npiggin@gmail.com wrote:
>> >> >>> I should be more complete here, especially since I was complaining
>> >> >>> about unclear barrier comment :)
>> >> >>> 
>> >> >>> 
>> >> >>> CPU0                     CPU1
>> >> >>> a. user stuff            1. user stuff
>> >> >>> b. membarrier()          2. enter kernel
>> >> >>> c. smp_mb()              3. smp_mb__after_spinlock(); // in __schedule
>> >> >>> d. read rq->curr         4. rq->curr switched to kthread
>> >> >>> e. is kthread, skip IPI  5. switch_to kthread
>> >> >>> f. return to user        6. rq->curr switched to user thread
>> >> >>> g. user stuff            7. switch_to user thread
>> >> >>>                         8. exit kernel
>> >> >>>                         9. more user stuff
> 
> ...
> 
>> >> Requiring a memory barrier between update of rq->curr (back to current process's
>> >> thread) and following user-space memory accesses does not seem to guarantee
>> >> anything more than what the initial barrier at the beginning of __schedule
>> >> already
>> >> provides, because the guarantees are only about accesses to user-space memory.
> 
> ...
> 
>> > Is it correct to say that the switch_to operations in 5 and 7 include
>> > memory barriers?  If they do, then skipping the IPI should be okay.
>> > 
>> > The reason is as follows: The guarantee you need to enforce is that
>> > anything written by CPU0 before the membarrier() will be visible to CPU1
>> > after it returns to user mode.  Let's say that a writes to X and 9
>> > reads from X.
>> > 
>> > Then we have an instance of the Store Buffer pattern:
>> > 
>> >	CPU0			CPU1
>> >	a. Write X		6. Write rq->curr for user thread
>> >	c. smp_mb()		7. switch_to memory barrier
>> >	d. Read rq->curr	9. Read X
>> > 
>> > In this pattern, the memory barriers make it impossible for both reads
>> > to miss their corresponding writes.  Since d does fail to read 6 (it
>> > sees the earlier value stored by 4), 9 must read a.
>> > 
>> > The other guarantee you need is that g on CPU0 will observe anything
>> > written by CPU1 in 1.  This is easier to see, using the fact that 3 is a
>> > memory barrier and d reads from 4.
>> 
>> Right, and Nick's reply involving pairs of loads/stores on each side
>> clarifies the situation even further.
> 
> The key part of my reply was the question: "Is it correct to say that
> the switch_to operations in 5 and 7 include memory barriers?"  From the
> text quoted above and from Nick's reply, it seems clear that they do
> not.

I remember that switch_mm implies it, but not switch_to.

The scenario that triggered this discussion is when the scheduler does a
lazy tlb entry/exit, which is basically switch from a user task to
a kernel thread without changing the mm, and usually switching back afterwards.
This optimization means the rq->curr mm temporarily differs, which prevent
IPIs from being sent by membarrier, but without involving a switch_mm.
This requires explicit memory barriers either on entry/exit of lazy tlb
mode, or explicit barriers in the scheduler for those special-cases.

> I agree with Nick: A memory barrier is needed somewhere between the
> assignment at 6 and the return to user mode at 8.  Otherwise you end up
> with the Store Buffer pattern having a memory barrier on only one side,
> and it is well known that this arrangement does not guarantee any
> ordering.

Yes, I see this now. I'm still trying to wrap my head around why the memory
barrier at the end of membarrier() needs to be paired with a scheduler
barrier though.

> One thing I don't understand about all this: Any context switch has to
> include a memory barrier somewhere, but both you and Nick seem to be
> saying that steps 6 and 7 don't include (or don't need) any memory
> barriers.  What am I missing?

All context switch have the smp_mb__before_spinlock at the beginning of
__schedule(), which I suspect is what you refer to. However this barrier
is before the store to rq->curr, not after.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
