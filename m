Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A5205A5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 20:15:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rvZT4C3ZzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 04:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rvXn4kwQzDqLW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 04:13:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Esyq+AEdoh1XonloiuoRagpt95xyDAj6PU4H+a2A370=; b=XtqJqEuJ6fk19CHHDiS/uWu7m0
 RAcYnkqt4nYjb3KNc+oUduIZ4BmQP6z7+ubMqv/JvBbC0/xybPxcpQOpQ/lg78gd2x3ZCJn9O6mkt
 Jd5I2z7aiGrouE6zK9gfUYo9bIvJl5dPbeWIYGWpiwKHEq2yefSrMbieDo8PwFR4ey3HjXZsEOZo+
 kpeu2fan50uIPlXjGdc5H6SPIPfo5+/vVs7+Y3TBJ/eY4XYLK7YLqWy42vBSITC110wTLB/gjxvnQ
 cqjN7VtvtR9/alVFGB6linsRbGqpzYe0uAFkxKU8EndRnmKY04OLN74stY8WRWXUSKeBa9tcMtxn0
 Pl+jThxQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnnPO-0006JO-In; Tue, 23 Jun 2020 18:12:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9BF5E303DA0;
 Tue, 23 Jun 2020 20:12:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8DE8F20267E51; Tue, 23 Jun 2020 20:12:32 +0200 (CEST)
Date: Tue, 23 Jun 2020 20:12:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623181232.GB4800@hirez.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623175957.GA106514@elver.google.com>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bigeasy@linutronix.de, x86@kernel.org, heiko.carstens@de.ibm.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, davem@davemloft.net,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>, sparclinux@vger.kernel.org,
 linux@armlinux.org.uk, tglx@linutronix.de, will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 07:59:57PM +0200, Marco Elver wrote:
> On Tue, Jun 23, 2020 at 06:37PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 23, 2020 at 06:13:21PM +0200, Ahmed S. Darwish wrote:
> > > Well, freshly merged code is using it. For example, KCSAN:
> > > 
> > >     => f1bc96210c6a ("kcsan: Make KCSAN compatible with lockdep")
> > >     => kernel/kcsan/report.c:
> > > 
> > >     void kcsan_report(...)
> > >     {
> > > 	...
> > >         /*
> > >          * With TRACE_IRQFLAGS, lockdep's IRQ trace state becomes corrupted if
> > >          * we do not turn off lockdep here; this could happen due to recursion
> > >          * into lockdep via KCSAN if we detect a race in utilities used by
> > >          * lockdep.
> > >          */
> > >         lockdep_off();
> > > 	...
> > >     }
> > 
> > Marco, do you remember what exactly happened there? Because I'm about to
> > wreck that. That is, I'm going to make TRACE_IRQFLAGS ignore
> > lockdep_off().
> 
> Yeah, I was trying to squash any kind of recursion:
> 
> 	lockdep -> other libs ->
> 		-> KCSAN
> 		-> print report
> 		-> dump stack, printk and friends
> 		-> lockdep -> other libs
> 			-> KCSAN ...
> 
> Some history:
> 
> * Initial patch to fix:
> 	https://lore.kernel.org/lkml/20200115162512.70807-1-elver@google.com/

That patch is weird; just :=n on lockdep.c should've cured that, the
rest is massive overkill.

> * KCSAN+lockdep+ftrace:
> 	https://lore.kernel.org/lkml/20200214211035.209972-1-elver@google.com/

That doesn't really have anything useful..

> lockdep now has KCSAN_SANITIZE := n, but we still need to ensure that
> there are no paths out of lockdep, or the IRQ flags tracing code, that
> might lead through other libs, through KCSAN, libs used to generate a
> report, and back to lockdep.
> 
> I never quite figured out the exact trace that led to corruption, but
> avoiding any kind of potential for recursion was the only thing that
> would avoid the check_flags() warnings.

Fair enough; I'll rip it all up and boot a KCSAN kernel, see what if
anything happens.
