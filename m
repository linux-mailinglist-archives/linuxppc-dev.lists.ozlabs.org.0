Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49F22B718
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 22:01:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCNWW2vbpzDrVL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 06:01:27 +1000 (AEST)
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
 header.s=casper.20170209 header.b=F8/Idme1; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCNSs6hjDzDrLb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 05:59:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MRwVqr0N2b8WDaLImhLP0DB/IrZrREwuBWJI9q4jFik=; b=F8/Idme1+fZ+UyqfWxqOjQiiOv
 kWGRCzma/YyUhpR5nC5pQLnZ3KCnnK8P1BDAcvnLhea+4+0pM46KYYrL0VKeeVBQ4fR1RHSRbiVIZ
 SKgxxIqNgARKSoRnP6fdQiWkfmT80xSTcswSEb8FqfbbUFoR2KHKPY6f7HtQemc267mP6Kk/onlSj
 jZjLDvXaVO2nmOD6dwGyEwS+4+TQyR5UndHu1oP4FD68DfiLjzFMjmdA6cxlvjZ3vEn27my0iQPq8
 t9vHlgWZ3ZcPcZY3aFq07InXlvZAAVknTFxaLbh9h7DDtBIqh7rO+TuX/H32s7lN3Np9/l9suq4YS
 0TaiwXFg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyhMo-0008Nu-4V; Thu, 23 Jul 2020 19:58:59 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F0287304E03;
 Thu, 23 Jul 2020 21:58:55 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7C49425942EEE; Thu, 23 Jul 2020 21:58:55 +0200 (CEST)
Date: Thu, 23 Jul 2020 21:58:55 +0200
From: peterz@infradead.org
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks
 for SPLPAR
Message-ID: <20200723195855.GU119549@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
 <20200723184759.GS119549@hirez.programming.kicks-ass.net>
 <6d6279ad-7432-63c1-14c3-18c4cff30bf8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d6279ad-7432-63c1-14c3-18c4cff30bf8@redhat.com>
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
Cc: linux-arch@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 03:04:13PM -0400, Waiman Long wrote:
> On 7/23/20 2:47 PM, peterz@infradead.org wrote:
> > On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
> > > BTW, do you have any comment on my v2 lock holder cpu info qspinlock patch?
> > > I will have to update the patch to fix the reported 0-day test problem, but
> > > I want to collect other feedback before sending out v3.
> > I want to say I hate it all, it adds instructions to a path we spend an
> > aweful lot of time optimizing without really getting anything back for
> > it.
> 
> It does add some extra instruction that may slow it down slightly, but I
> don't agree that it gives nothing back. The cpu lock holder information can
> be useful in analyzing crash dumps and in some debugging situation. I think
> it can be useful in RHEL for this readon. How about an x86 config option to
> allow distros to decide if they want to have it enabled? I will make sure
> that it will have no performance degradation if the option is not enabled.

Config knobs suck too; they create a maintenance burden (we get to make
sure all the permutations works/build/etc..) and effectively nobody uses
them, since world+dog uses what distros pick.

Anyway, instead of adding a second per-cpu variable, can you see how
horrible something like this is:

unsigned char adds(unsigned char var, unsigned char val)
{
	unsigned short sat = 0xff, tmp = var;

	asm ("addb	%[val], %b[var];"
	     "cmovc	%[sat], %[var];"
	     : [var] "+r" (tmp)
	     : [val] "ir" (val), [sat] "r" (sat)
	     );

	return tmp;
}

Another thing to try is, instead of threading that lockval throughout
the thing, simply:

#define _Q_LOCKED_VAL	this_cpu_read_stable(cpu_sat)

or combined with the above

#define _Q_LOCKED_VAL	adds(this_cpu_read_stable(cpu_number), 2)

and see if the compiler really makes a mess of things.
