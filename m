Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673B22210F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 13:02:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6rv23RZDzDqwp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 21:02:38 +1000 (AEST)
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
 header.s=casper.20170209 header.b=ZvEqGy1x; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6rs11FxvzDqw1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 21:00:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=BbY/K+4UnilsTl+oqlgwJ2dMlxhYTc/XcqHLxskaZPw=; b=ZvEqGy1xxIdI/hTY3W1GJkx2r3
 VQKUuvAJV7HnJFkTj/Q7oPoFev3oBJaDDrZ3zK2bGM1I/iFccHDp8V45HP5t75csnPkTg5o4OT5Rk
 vE0yH67bgqMdf+dZPGqAu+qjC9jOMOyzEabEdwsmqFL7QtCJydnTulLiLHef+efYKszfTdaBQZL85
 sh+T16UFrZzJ0Eb5e4571Q6s5ZQ/bOAKXHrmQ68MBOF+QUsoF1ALM06aZ+cQ/ze0i/oImxaeHQOxS
 +M4dzjF9p1gqLUH1rptVvmvfThoMBrjxAs6JAczcwRpBAfUl+n8wLTOPXo+4Zcl2UfLZzjqWveZCA
 zdXIjYuw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw1d1-0000Uf-SH; Thu, 16 Jul 2020 11:00:40 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 21E19300130;
 Thu, 16 Jul 2020 13:00:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0D3EC234E2C20; Thu, 16 Jul 2020 13:00:38 +0200 (CEST)
Date: Thu, 16 Jul 2020 13:00:38 +0200
From: peterz@infradead.org
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Message-ID: <20200716110038.GA119549@hirez.programming.kicks-ass.net>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <EFAD6E2F-EC08-4EB3-9ECC-2A963C023FC5@amacapital.net>
 <20200716085032.GO10769@hirez.programming.kicks-ass.net>
 <1594892300.mxnq3b9a77.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594892300.mxnq3b9a77.astroid@bobo.none>
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
 Andy Lutomirski <luto@amacapital.net>, linux-mm <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 16, 2020 at 08:03:36PM +1000, Nicholas Piggin wrote:
> Excerpts from Peter Zijlstra's message of July 16, 2020 6:50 pm:
> > On Wed, Jul 15, 2020 at 10:18:20PM -0700, Andy Lutomirski wrote:
> >> > On Jul 15, 2020, at 9:15 PM, Nicholas Piggin <npiggin@gmail.com> wrote:

> >> But I’m wondering if all this deferred sync stuff is wrong. In the
> >> brave new world of io_uring and such, perhaps kernel access matter
> >> too.  Heck, even:
> > 
> > IIRC the membarrier SYNC_CORE use-case is about user-space
> > self-modifying code.
> > 
> > Userspace re-uses a text address and needs to SYNC_CORE before it can be
> > sure the old text is forgotten. Nothing the kernel does matters there.
> > 
> > I suppose the manpage could be more clear there.
> 
> True, but memory ordering of kernel stores from kernel threads for
> regular mem barrier is the concern here.
> 
> Does io_uring update completion queue from kernel thread or interrupt,
> for example? If it does, then membarrier will not order such stores
> with user memory accesses.

So we're talking about regular membarrier() then? Not the SYNC_CORE
variant per-se.

Even there, I'll argue we don't care, but perhaps Mathieu has a
different opinion. All we care about is that all other threads (or CPUs
for GLOBAL) observe an smp_mb() before it returns.

Any serialization against whatever those other threads/CPUs are running
at the instant of the syscall is external to the syscall, we make no
gauarantees about that. That is, we can fundamentally not say what
another CPU is executing concurrently. Nor should we want to.

So if you feel that your membarrier() ought to serialize against remote
execution, you need to arrange a quiecent state on the remote side
yourself.

Now, normally membarrier() is used to implement userspace RCU like
things, and there all that matters is that the remote CPUs observe the
beginngin of the new grace-period, ie counter flip, and we observe their
read-side critical sections, or smething like that, it's been a while
since I looked at all that.

It's always been the case that concurrent syscalls could change user
memory, io_uring doesn't change that, it just makes it even less well
defined when that would happen. If you want to serialize against that,
you need to arrange that externally.
