Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003736EE00B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 12:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5HtJ62PVz3cfd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 20:14:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=R2GEs91S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5HsK5Bkkz2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 20:13:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Xao8VXHXtYxC11f7dTDeUqso5VLtQcIrTD4ahlklA8=; b=R2GEs91SzfaV305Pp+soejzYsE
	+eKEXbYoCK3TuI1jyR7yff98zE+cCgKNLqJZ+8ipEETxbVNwqBTzUnkMnPQ9YS4TDBm3FK7fYc+ip
	EdoaPNB43SYxk0LXdYuo/iKpeX8mb6/EXdDHp02+DvX16pmtanJkHbUEY0CLbyJ8UV1/1tVROkv2L
	6oy2yzYErfx6iOBJWaVbHVd3Ldaj8d8vDQt3Vn2qRNlSrwfen1waN63un8Pwk+FONpa2mjFlsHcVu
	nlJZXuF4wC15/UtMrZRh2H/2FKJSqWr+P/+HOqXdeXD8m/ivluScDKGCC1AadIgckMT3VPeE0+0dW
	7H7xkPyQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1prFfu-001Kl7-FN; Tue, 25 Apr 2023 10:13:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F26A33000D5;
	Tue, 25 Apr 2023 12:13:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1C291241955DA; Tue, 25 Apr 2023 12:13:25 +0200 (CEST)
Date: Tue, 25 Apr 2023 12:13:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Message-ID: <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux>
 <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org>
 <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 24, 2023 at 02:55:11PM -0400, Joel Fernandes wrote:
> This is amazing debugging Boqun, like a boss! One comment below:
> 
> > > > Or something simple I haven't thought of? :)
> > >
> > > At what points can r13 change?  Only when some particular functions are
> > > called?
> > >
> >
> > r13 is the local paca:
> >
> >         register struct paca_struct *local_paca asm("r13");
> >
> > , which is a pointer to percpu data.
> >
> > So if a task schedule from one CPU to anotehr CPU, the value gets
> > changed.
> 
> It appears the whole issue, per your analysis, is that the stack
> checking code in gcc should not cache or alias r13, and must read its
> most up-to-date value during stack checking, as its value may have
> changed during a migration to a new CPU.
> 
> Did I get that right?
> 
> IMO, even without a reproducer, gcc on PPC should just not do that,
> that feels terribly broken for the kernel. I wonder what clang does,
> I'll go poke around with compilerexplorer after lunch.
> 
> Adding +Peter Zijlstra as well to join the party as I have a feeling
> he'll be interested. ;-)

I'm a little confused; the way I understand the whole stack protector
thing to work is that we push a canary on the stack at call and on
return check it is still valid. Since in general tasks randomly migrate,
the per-cpu validation canary should be the same on all CPUs.

Additionally, the 'new' __srcu_read_{,un}lock_nmisafe() functions use
raw_cpu_ptr() to get 'a' percpu sdp, preferably that of the local cpu,
but no guarantees.

Both cases use r13 (paca) in a racy manner, and in both cases it should
be safe.
