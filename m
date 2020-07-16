Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B891C221F04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 10:54:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6p356wvYzDqLS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 18:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=FgLsRGtO; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6nz90B8yzDqxs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 18:51:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=z1twT3lJBd5IZc2w7iBnl5n86j3pbxlaFsHT2cAY39E=; b=FgLsRGtOEAwDu+7SJ8Zs8QpPt/
 fdY7AqF+mSRLDjWRN/qas1RvwO/wkXn0a0/xvS2I2FUUwFLsVGdGen6BCtgn+AlbyJGKjfETxSk4H
 dYoDWOK5KuZbwq2WqL6y6LJLii3T7D0F4KsgOw7OGmRI6K+rWMsHwkkFNbEpcrifG/Gtuc0pMwwfe
 OK5rWaVxhCmA/ydjktAe0iVbDOeACB8ocHSoTXQyoyteZ5h6jA/Rv9AlYbVZwxeefMcayX3tKQXs0
 thw1o4CG3/tAi4C1Os+lDnbFzkYr91dDhGwuJSq9Tf6DI8CYx8KKIbuc47NFuDyipXo4oGJFtp09p
 Wfi7/fag==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvzb9-0001Lr-5V; Thu, 16 Jul 2020 08:50:38 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6A21A304B90;
 Thu, 16 Jul 2020 10:50:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4F411207A6644; Thu, 16 Jul 2020 10:50:32 +0200 (CEST)
Date: Thu, 16 Jul 2020 10:50:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Message-ID: <20200716085032.GO10769@hirez.programming.kicks-ass.net>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <EFAD6E2F-EC08-4EB3-9ECC-2A963C023FC5@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EFAD6E2F-EC08-4EB3-9ECC-2A963C023FC5@amacapital.net>
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
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 10:18:20PM -0700, Andy Lutomirski wrote:
> > On Jul 15, 2020, at 9:15 PM, Nicholas Piggin <npiggin@gmail.com> wrote:

> > CPU0                     CPU1
> >                         1. user stuff
> > a. membarrier()          2. enter kernel
> > b. read rq->curr         3. rq->curr switched to kthread
> > c. is kthread, skip IPI  4. switch_to kthread
> > d. return to user        5. rq->curr switched to user thread
> >                 6. switch_to user thread
> >                 7. exit kernel
> >                         8. more user stuff

> I find it hard to believe that this is x86 only. Why would thread
> switch imply core sync on any architecture?  Is x86 unique in having a
> stupid expensive core sync that is heavier than smp_mb()?

smp_mb() is nowhere near the most expensive barrier we have in Linux,
mb() might qualify, since that has some completion requirements since it
needs to serialize against external actors.

On x86_64 things are rather murky, we have:

	LOCK prefix -- which implies smp_mb() before and after RmW
	LFENCE -- which used to be rmb like, until Spectre, and now it
		  is ISYNC like. Since ISYNC ensures an empty pipeline,
		  it also implies all loads are retired (and therefore
		  complete) it implies rmb.
	MFENCE -- which is a memop completion barrier like, it makes
		  sure all previously issued memops are complete.

if you read that carefully, you'll note you'll have to use LFENCE +
MFENCE to order against non-memops instructions.

But none of them imply dumping the instruction decoder caches, that only
happens on core serializing instructions like CR3 writes, IRET, CPUID
and a few others, I think we recently got a SERIALIZE instruction to add
to this list.


On ARM64 there's something a whole different set of barriers, and again
smp_mb() isn't nowhere near the top of the list. They have roughly 3
classes:

	ISB -- instruction sync barrier
	DMB(x) -- memory ordering in domain x
	DSB(x) -- memory completion in domain x

And they have at least 3 domains (IIRC), system, outer, inner.

The ARM64 __switch_to() includes a dsb(sy), just like PowerPC used to
have a SYNC, but since PowerPC is rare for only having one rediculously
heavy serializing instruction, we got to re-use the smp_mb() early in
__schedule() instead, but ARM64 can't do that.


So rather than say that x86 is special here, I'd say that PowerPC is
special here.

> But I’m wondering if all this deferred sync stuff is wrong. In the
> brave new world of io_uring and such, perhaps kernel access matter
> too.  Heck, even:

IIRC the membarrier SYNC_CORE use-case is about user-space
self-modifying code.

Userspace re-uses a text address and needs to SYNC_CORE before it can be
sure the old text is forgotten. Nothing the kernel does matters there.

I suppose the manpage could be more clear there.

