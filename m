Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 312DB66940F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 11:25:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ntcx902nPz3fDZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 21:25:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oHlQZGuI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oHlQZGuI;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntcw95fPqz3cFD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 21:24:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=43nvZBmwF6Qr7XsH1Yo0nO4bX86Vu4LJvgWe0kE/8zg=; b=oHlQZGuI+g1+745A8mnKSGv0Ip
	ArshDCSE9wETafPSA1owBRlBpYnq7N63PUC2bOIlNWCfzOcvg0baIddP9aWaqirXFy++TQxH6O55d
	6Ht7LAqrr9nfXLFRKCENIm2kB+U2INdOVCnod3dPJE1kgx7YCVu9BA1fpFAowI2d7nJU8WslTyIMn
	M5iGi3KUooTTakfSADotxIBNQ4JuVmDVdcohxLmYwXtuVupgup5E1Q0jfVADtwBZSwhOC6aHhMFij
	iVxfEAWRRf4m/fxKAAwH6mQegB+PpPs3VziQCzLcYwGhtn3/vplyg93tOLR7qP8wxF8frSpjDtM4c
	i9tMbXiA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHEA-006068-0t; Fri, 13 Jan 2023 10:24:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 75F8E300094;
	Fri, 13 Jan 2023 11:23:45 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5006D20B16472; Fri, 13 Jan 2023 11:23:45 +0100 (CET)
Date: Fri, 13 Jan 2023 11:23:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: lockref scalability on x86-64 vs cpu_relax
Message-ID: <Y8ExMQaevecjWjg5@hirez.programming.kicks-ass.net>
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tony.luck@intel.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 06:13:16PM -0600, Linus Torvalds wrote:
> On Thu, Jan 12, 2023 at 5:36 PM Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > To my understanding on said architecture failed cmpxchg still grants you
> > exclusive access to the cacheline, making immediate retry preferable
> > when trying to inc/dec unless a certain value is found.
> 
> I actually suspect that is _always_ the case - this is not like a
> contended spinlock where we want to pause because we're waiting for
> the value to change and become unlocked, this cmpxchg loop is likely
> always better off just retrying with the new value.
> 
> That said, the "likely always better off" is purely about performance.
> 
> So I have this suspicion that the reason Tony added the cpu_relax()
> was simply not about performance, but about other issues, like
> fairness in SMT situations.
> 
> That said, evern from a fairness perspective the cpu_relax() sounds a
> bit odd and unlikely - we're literally yielding when we lost a race,
> so it hurts the _loser_, not the winner, and thus might make fairness
> worse too.

I've been writing cmpxchg loops that have strict termination conditions
without cpu_relax() in them for a while now.

For example, the x86 atomic_fetch_and() implementation looks like so:

static __always_inline int arch_atomic_fetch_and(int i, atomic_t *v)
{
	int val = arch_atomic_read(v);

	do { } while (!arch_atomic_try_cmpxchg(v, &val, val & i));

	return val;
}

And I did that because of the exact same argument you had above, it
needs to do the op anyway, waiting between failed attempts will only
increase the chance it will fail again.
