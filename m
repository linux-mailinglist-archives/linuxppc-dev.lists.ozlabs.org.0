Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7B6D9B11
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:48:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Psks45ZcCz3g5Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:48:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rEIkwQ/w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rEIkwQ/w;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pskg9113pz3fVq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:40:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xC9liSByLfpmJoqxob1Tfe5QJtboRITHVK7L2yzhpb4=; b=rEIkwQ/wxL0jbUwKNMG+Rh2X7J
	fhszdLIzSoytlVtA4gcIUYPYI8IA1Jwh6TeTtXAh3APvzGn9QtZ/HqTywulvk4Df4PtnnO40IDaBd
	4ZvtlOBF7yGAQPzpfFAmhO5IxmOLDaNwkkrydZ3Gcgl1WF0OUojR7tF3RXOQTtWC4wGL+7WVFfYZn
	ObQcLHeCK4J039oW17+VXorH+Ez+FqxveiV0q7ZKCMtFodu4+1u0q2K1HssdvPWS4UaLP12oUmZEZ
	MU7rPLjGwsEoA0GXCU3E/wk0EU3HtN/HGsZIZbNNtQKaCbLvxGCp5vLBqHYTa8Z/UolfGFRVEzFo1
	yL+DHjGA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQlu-00AY5v-2L;
	Thu, 06 Apr 2023 14:39:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9BA2F300338;
	Thu,  6 Apr 2023 16:39:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7FDF3212E36AE; Thu,  6 Apr 2023 16:39:26 +0200 (CEST)
Date: Thu, 6 Apr 2023 16:39:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230406143926.GP386572@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
 <20230405114148.GA351571@hirez.programming.kicks-ass.net>
 <ZC1j8ivE/kK7+Gd5@lothringen>
 <xhsmhpm8ia46p.mognet@vschneid.remote.csb>
 <20230406133805.GO386572@hirez.programming.kicks-ass.net>
 <xhsmh8rf59k2f.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmh8rf59k2f.mognet@vschneid.remote.csb>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@da
 vemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 06, 2023 at 03:11:52PM +0100, Valentin Schneider wrote:
> On 06/04/23 15:38, Peter Zijlstra wrote:
> > On Wed, Apr 05, 2023 at 01:45:02PM +0100, Valentin Schneider wrote:
> >>
> >> I've been hacking on something like this (CSD deferral for NOHZ-full),
> >> and unfortunately this uses the CPU-local cfd_data storage thing, which
> >> means any further smp_call_function() from the same CPU to the same
> >> destination will spin on csd_lock_wait(), waiting for the target CPU to
> >> come out of userspace and flush the queue - and we've just spent extra
> >> effort into *not* disturbing it, so that'll take a while :(
> >
> > I'm not sure I buy into deferring stuff.. a NOHZ_FULL cpu might 'never'
> > come back. Queueing data just in case it does seems wasteful.
> 
> Putting those callbacks straight into the bin would make my life much
> easier!

Well, it's either they get inhibited at the source like the parent patch
does, or they go through. I really don't see a sane middle way here.

> Unfortunately, even if they really should, I don't believe all of the
> things being crammed onto NOHZ_FULL CPUs have the same definition of
> 'never' as we do :/

That's not entirely the point, the point is that there are proper
NOHZ_FULL users that won't return to the kernel until the machine shuts
down. Buffering stuff for them is more or less a direct memory leak.

