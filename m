Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDCD6D6836
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 18:04:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrXd33y5Yz3f5M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 02:04:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TIsAixbu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TIsAixbu;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrXc73114z3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 02:03:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XM/YkwYDYZGFI0IIp06DYqUacNJSQj373t93IN8a29o=; b=TIsAixbuLFpyKt07sPwhVOn1aU
	cGv4c07N1emcfPmogLhgtjgpYR5LP6Nol8J6+PExO760jDlXjp+iCnrnWKK5UDZCU5FyEMUHrK0C1
	SzrfvIUBbupni78V14bc2bjHewYPLY7HCVNoH9SqFSqG/2cWP412xfsne3M0o6n8fQU1Z2r+E2QHx
	+fmjMHwxYiumGqYm7KWWTj1cAFUYaVEKYoqK3JR4anEGIOdaaPQwrDyMDfUbtnoOrucjM9WZUX3vA
	cX9hzeBUJB03YvO04ppUKlwYspcwruBk8VDTYKJ3joh88cne62yn4oUyr/Od+3XIdZ24B2xIuVJdx
	WXoLpPZg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pjj5O-00FV9O-TT; Tue, 04 Apr 2023 16:00:43 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 07BC4300202;
	Tue,  4 Apr 2023 18:00:39 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id D69342CB6F7B0; Tue,  4 Apr 2023 18:00:38 +0200 (CEST)
Date: Tue, 4 Apr 2023 18:00:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230404160038.GB38236@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <20230404151217.GB297936@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404151217.GB297936@hirez.programming.kicks-ass.net>
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
Cc: geert+renesas@glider.be, tony@atomide.com, Frederic Weisbecker <fweisbec@gmail.com>, linus.walleij@linaro.org, dave.hansen@linux.intel.com, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, gor@linux.ibm.com, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, keescook@chromium.org, paulmck@kernel.org, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, arnd@arndb.de, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, dave
 m@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 04, 2023 at 05:12:17PM +0200, Peter Zijlstra wrote:
> > case 2:
> > CPU-A                                             CPU-B
> > 
> > modify pagetables
> > tlb_flush (memory barrier)
> >                                                   state == CONTEXT_USER
> > int state = atomic_read(&ct->state);
> >                                                   Kernel-enter:
> >                                                   state == CONTEXT_KERNEL
> >                                                   READ(pagetable values)
> > if (state & CT_STATE_MASK == CONTEXT_USER)
> > 


Hmm, hold up; what about memory ordering, we need a store-load ordering
between the page-table write and the context trackng load, and a
store-load order on the context tracking update and software page-table
walker loads.

Now, iirc page-table modification is done under pte_lock (or
page_table_lock) and that only provides a RELEASE barrier on this end,
which is insufficient to order against a later load.

Is there anything else?

On the state tracking side, we have ct_state_inc() which is
atomic_add_return() which should provide full barrier and is sufficient.
