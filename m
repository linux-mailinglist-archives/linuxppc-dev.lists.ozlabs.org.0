Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC316D876C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 21:54:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsFhX58W1z3fK3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 05:54:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=RQLyy2B2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=RQLyy2B2;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsFgd0FH1z3chj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 05:53:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xfugB8gwxIrdC2R107Iwf3RGbPJjSDOcowvFi/5tZ98=; b=RQLyy2B2a56aLhk92w1zockLYu
	GyxtlcJv3uVkzVuUAbS+vCfQAByO61u7M3A1OPrBog1K7cUo2unN2+IR18kVFW97eBVtrxu6XXJX/
	wafQIo6qPTFiithrwoY3bfzt/wxMPxkLE+Mo9B/tHJ/QuLXN9WsqxXQU94wawQvs2+OmKXFu0eSg8
	tdTc+xbXAue/v07k/Ctw5B3ctOuWZ7G+pkHjz/FpgoMyVKuL/951PBtsipQ+36I0uMAUwH0IYKihE
	PBio4xNYHmMDQPU7AiJUKS1W/VYoSP2mqzTOp+RckMuOuXKpd+tSf9MLnaF6hFLQ8Vhb2wwZu77pq
	+ZM5SYhg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pk9BM-00Ghqu-7z; Wed, 05 Apr 2023 19:52:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A2292300194;
	Wed,  5 Apr 2023 21:52:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 886E2200B42A8; Wed,  5 Apr 2023 21:52:26 +0200 (CEST)
Date: Wed, 5 Apr 2023 21:52:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230405195226.GB365912@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
 <ZC3P3Ds/BIcpRNGr@tpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC3P3Ds/BIcpRNGr@tpad>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@da
 vemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 04:45:32PM -0300, Marcelo Tosatti wrote:
> On Wed, Apr 05, 2023 at 01:10:07PM +0200, Frederic Weisbecker wrote:
> > On Wed, Apr 05, 2023 at 12:44:04PM +0200, Frederic Weisbecker wrote:
> > > On Tue, Apr 04, 2023 at 04:42:24PM +0300, Yair Podemsky wrote:
> > > > +	int state = atomic_read(&ct->state);
> > > > +	/* will return true only for cpus in kernel space */
> > > > +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
> > > > +}
> > > 
> > > Also note that this doesn't stricly prevent userspace from being interrupted.
> > > You may well observe the CPU in kernel but it may receive the IPI later after
> > > switching to userspace.
> > > 
> > > We could arrange for avoiding that with marking ct->state with a pending work bit
> > > to flush upon user entry/exit but that's a bit more overhead so I first need to
> > > know about your expectations here, ie: can you tolerate such an occasional
> > > interruption or not?
> > 
> > Bah, actually what can we do to prevent from that racy IPI? Not much I fear...
> 
> Use a different mechanism other than an IPI to ensure in progress
> __get_free_pages_fast() has finished execution.
> 
> Isnt this codepath slow path enough that it can use
> synchronize_rcu_expedited?

To actually hit this path you're doing something really dodgy.
