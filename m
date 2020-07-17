Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D4B2242A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 19:54:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7dzj34DrzDrQQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 03:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=BxSh5lyJ; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7dxv3ZgDzDrQ9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 03:52:50 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 817512C997D;
 Fri, 17 Jul 2020 13:52:47 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sy2IH5AMEi0S; Fri, 17 Jul 2020 13:52:47 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 098BD2C997C;
 Fri, 17 Jul 2020 13:52:47 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 098BD2C997C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1595008367;
 bh=4fWMpAwGTjIs1YHFuRjsIAcqCINrApuOxB7mCqdeBnc=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=BxSh5lyJZ96gwEnmA0pVCNFKaUSvh3mbFF5nYNrwNoD3YLC1PNim24YjG7i2REP1q
 PCIv3oRydbKYQts2sqpnwk4Md/9LVuQsFkUMKcaLBWP1CBte4ivSV/JuAzDhX0xktP
 u37Ozgu82qPbPy7fULxzzznmmt1yvBa4/EsBhnVtaNidxyQJ1iECc6CjCy4P1zDg2Z
 Z4U+9+jXodBMD3GqOJyoFrUOlxqcdqOaUyWc176SPKSLtx8D+Tcq9QBzcSacUlC2+3
 CnC3xdUvw8oLsg8aQWS+61kRPVqpHBcWdsIkt9C35AqDyGcnOIpe9BMFeH30ci6VBC
 xwD0mGQaCkTAw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hfAD4r_B6LZl; Fri, 17 Jul 2020 13:52:46 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id EB36D2C9D87;
 Fri, 17 Jul 2020 13:52:46 -0400 (EDT)
Date: Fri, 17 Jul 2020 13:52:46 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Alan Stern <stern@rowland.harvard.edu>
Message-ID: <2035777331.19291.1595008366858.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200717174400.GA1156312@rowland.harvard.edu>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200716212416.GA1126458@rowland.harvard.edu>
 <1770378591.18523.1594993165391.JavaMail.zimbra@efficios.com>
 <20200717145102.GC1147780@rowland.harvard.edu>
 <1697220787.18880.1595000348405.JavaMail.zimbra@efficios.com>
 <20200717161145.GA1150454@rowland.harvard.edu>
 <12700909.18968.1595002969773.JavaMail.zimbra@efficios.com>
 <20200717174400.GA1156312@rowland.harvard.edu>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Thread-Index: GWd8J1ng+COq8abrHOCrIFRVXkZ+eQ==
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

----- On Jul 17, 2020, at 1:44 PM, Alan Stern stern@rowland.harvard.edu wrote:

> On Fri, Jul 17, 2020 at 12:22:49PM -0400, Mathieu Desnoyers wrote:
>> ----- On Jul 17, 2020, at 12:11 PM, Alan Stern stern@rowland.harvard.edu wrote:
>> 
>> >> > I agree with Nick: A memory barrier is needed somewhere between the
>> >> > assignment at 6 and the return to user mode at 8.  Otherwise you end up
>> >> > with the Store Buffer pattern having a memory barrier on only one side,
>> >> > and it is well known that this arrangement does not guarantee any
>> >> > ordering.
>> >> 
>> >> Yes, I see this now. I'm still trying to wrap my head around why the memory
>> >> barrier at the end of membarrier() needs to be paired with a scheduler
>> >> barrier though.
>> > 
>> > The memory barrier at the end of membarrier() on CPU0 is necessary in
>> > order to enforce the guarantee that any writes occurring on CPU1 before
>> > the membarrier() is executed will be visible to any code executing on
>> > CPU0 after the membarrier().  Ignoring the kthread issue, we can have:
>> > 
>> >	CPU0			CPU1
>> >				x = 1
>> >				barrier()
>> >				y = 1
>> >	r2 = y
>> >	membarrier():
>> >	  a: smp_mb()
>> >	  b: send IPI		IPI-induced mb
>> >	  c: smp_mb()
>> >	r1 = x
>> > 
>> > The writes to x and y are unordered by the hardware, so it's possible to
>> > have r2 = 1 even though the write to x doesn't execute until b.  If the
>> > memory barrier at c is omitted then "r1 = x" can be reordered before b
>> > (although not before a), so we get r1 = 0.  This violates the guarantee
>> > that membarrier() is supposed to provide.
>> > 
>> > The timing of the memory barrier at c has to ensure that it executes
>> > after the IPI-induced memory barrier on CPU1.  If it happened before
>> > then we could still end up with r1 = 0.  That's why the pairing matters.
>> > 
>> > I hope this helps your head get properly wrapped.  :-)
>> 
>> It does help a bit! ;-)
>> 
>> This explains this part of the comment near the smp_mb at the end of membarrier:
>> 
>>          * Memory barrier on the caller thread _after_ we finished
>>          * waiting for the last IPI. [...]
>> 
>> However, it does not explain why it needs to be paired with a barrier in the
>> scheduler, clearly for the case where the IPI is skipped. I wonder whether this
>> part
>> of the comment is factually correct:
>> 
>>          * [...] Matches memory barriers around rq->curr modification in scheduler.
> 
> The reasoning is pretty much the same as above:
> 
>	CPU0			CPU1
>				x = 1
>				barrier()
>				y = 1
>	r2 = y
>	membarrier():
>	  a: smp_mb()
>				switch to kthread (includes mb)
>	  b: read rq->curr == kthread
>				switch to user (includes mb)
>	  c: smp_mb()
>	r1 = x
> 
> Once again, it is possible that x = 1 doesn't become visible to CPU0
> until shortly before b.  But if c is omitted then "r1 = x" can be
> reordered before b (to any time after a), so we can have r1 = 0.
> 
> Here the timing requirement is that c executes after the first memory
> barrier on CPU1 -- which is one of the ones around the rq->curr
> modification.  (In fact, in this scenario CPU1's switch back to the user
> process is irrelevant.)

That indeed covers the last scenario I was wondering about. Thanks Alan!

Mathieu

> 
> Alan Stern

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
