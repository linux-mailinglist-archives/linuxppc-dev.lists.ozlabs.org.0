Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B96EE163
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 13:54:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5L505D9Dz3f4n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 21:54:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YLzLX23g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YLzLX23g;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5L464W5Gz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 21:53:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RuyX3d7D1azwsn4TOGYEeBa8zDHbPol4DtyJcZjYy1w=; b=YLzLX23gAqE/afcAhQhX/CCgMI
	c94ZoDFe8oTJK2JSS/FuFGg8KUS5MYESVL9zKBUuFX7pze6a+rQ5PaTvvIeSr87dHaWiZmxJTRf4k
	ZnYkaXPe9I8mpJ6ZFo6m4WPVvHZUc9bpUolM4kAQW5pfuUzoAT4BSZcvoCfBYgEp055GC/jb8VTv8
	yBrlzwI/q0hZhcGAjBwsIg3GQ6498b4k6et/MqH9pyecJ+1MLldg1AIA1Viioh+zJ+jpg94WqSC4Y
	zTgteBn+91FFU6o2Y2N8N4q4l0FvCaHhNqzrDnQH+jP5wtpEGUOET5GiAols0niV9kFXp6T89bCa6
	n7YxfyQQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1prHER-001PFv-P0; Tue, 25 Apr 2023 11:53:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 968D5300380;
	Tue, 25 Apr 2023 13:53:13 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7990C241943F2; Tue, 25 Apr 2023 13:53:13 +0200 (CEST)
Date: Tue, 25 Apr 2023 13:53:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Message-ID: <20230425115313.GD1335080@hirez.programming.kicks-ass.net>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux>
 <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org>
 <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAEXW_YRFZ3zDc0gJRHjJPRuNaBtnmUc+9RxSAHH48jkFw_b34g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXW_YRFZ3zDc0gJRHjJPRuNaBtnmUc+9RxSAHH48jkFw_b34g@mail.gmail.com>
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

On Tue, Apr 25, 2023 at 06:59:29AM -0400, Joel Fernandes wrote:
> > I'm a little confused; the way I understand the whole stack protector
> > thing to work is that we push a canary on the stack at call and on
> > return check it is still valid. Since in general tasks randomly migrate,
> > the per-cpu validation canary should be the same on all CPUs.

> AFAICS, the canary is randomly chosen both in the kernel [1]. This

Yes, at boot, once. But thereafter it should be the same for all CPUs.

> also appears to be the case in glibc. That makes sense because you
> don't want the canary to be something that the attacker can easily
> predict and store on the stack to bypass buffer overflow attacks:
> 
> [1] kernel :
> /*
>  * Initialize the stackprotector canary value.
>  *
>  * NOTE: this must only be called from functions that never return,
>  * and it must always be inlined.
>  */
> static __always_inline void boot_init_stack_canary(void)
> {
>         unsigned long canary = get_random_canary();
> 
>         current->stack_canary = canary;
> #ifdef CONFIG_PPC64
>         get_paca()->canary = canary;
> #endif
> }
> 
> thanks,
> 
>  - Joel
