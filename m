Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80F6D9BA0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 17:03:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PslBD2FdCz3fcZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 01:03:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g9HMgChB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g9HMgChB;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Psl9M60rJz2xD7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 01:02:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NvfDt1wEQmP4GbrgT80G40At21xJRS6EHasfhbcOMOE=; b=g9HMgChByDEcqwPRnMmPkqIWgT
	E9Jo8wK8pTfqUwNGF3RulzK1C+eAF5o0HLXxTCm1aNFPSyeLIz7NBcYvhiL3fWMksBf4GfvKV1nBp
	R1ktgGzkQffGLNq0EdKUX3JVOd/BZXRVD1HVj5FYNpwkWKn6UfKWr7lyfGZ57eHCE1Ap9OwCdXmRU
	QFECUvV14SnLI6zo7b+CEQjzYLN1FnZJGuTV5debvwUmU0/EFkTbbdBnK2iYw/w24I6u5ORsR1OjP
	NvQL1vw1dn0PsW8XZzYt7vrZuKd41B4X/0udSmxG7Wik20e3HITuLf+kHlTq/SOVx9kb+3BucjXbv
	rrreJmIQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pkR7v-00AYJQ-0d;
	Thu, 06 Apr 2023 15:02:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 184893000DC;
	Thu,  6 Apr 2023 17:02:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id F2B1E212E36AA; Thu,  6 Apr 2023 17:02:13 +0200 (CEST)
Date: Thu, 6 Apr 2023 17:02:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230406150213.GQ386572@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
 <ZC3P3Ds/BIcpRNGr@tpad>
 <20230405195226.GB365912@hirez.programming.kicks-ass.net>
 <ZC69Wmqjdwk+I8kn@tpad>
 <20230406132928.GM386572@hirez.programming.kicks-ass.net>
 <20230406140423.GA386634@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406140423.GA386634@hirez.programming.kicks-ass.net>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, jannh@google.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.oz
 labs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 06, 2023 at 04:04:23PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 06, 2023 at 03:29:28PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 06, 2023 at 09:38:50AM -0300, Marcelo Tosatti wrote:
> > 
> > > > To actually hit this path you're doing something really dodgy.
> > > 
> > > Apparently khugepaged is using the same infrastructure:
> > > 
> > > $ grep tlb_remove_table khugepaged.c 
> > > 	tlb_remove_table_sync_one();
> > > 	tlb_remove_table_sync_one();
> > > 
> > > So just enabling khugepaged will hit that path.
> > 
> > Urgh, WTF..
> > 
> > Let me go read that stuff :/
> 
> At the very least the one on collapse_and_free_pmd() could easily become
> a call_rcu() based free.
> 
> I'm not sure I'm following what collapse_huge_page() does just yet.

DavidH, what do you thikn about reviving Jann's patches here:

  https://bugs.chromium.org/p/project-zero/issues/detail?id=2365#c1

Those are far more invasive, but afaict they seem to do the right thing.
