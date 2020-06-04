Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFE61EE903
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 18:59:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dBp81HBgzDqsR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 02:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=aGaT6JoG; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dBlc5FyRzDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 02:57:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WNuoe0aJej6Twt/hptn1Tc9VMEiTloei55h4/xsUoEc=; b=aGaT6JoG6JwGGaQaEogYAqTBJ9
 xuLUj1OC3CAgpdlWoVQvRYe3kK7pD1+Y7UiKVCazCpq104knW9A+PRMr5JSOj9xSYbfLIqp7uHpJZ
 bKeuIqvGnBXvoDTgDE6rn0ulpPv1XB0E+4Ds/kcenR5J+DohAB/M/KEV83k/F+fYlMFvbrwWJo6c8
 g7oiJEQ4cp8VH3cGFRxCl5Eit0VdyK09s4QIghJc/fNrS+UIQJZJbx/wraFeJ4Gnr/hsFzztcyLGR
 TpS9SjQZBkL77Esd/S8Swvsw4QJaziyO8Q91L1SramyEnqQGTBQu1rLGuVV5x9dHXABr4mnhUL7We
 Ut1HXWLw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgtAx-0001Kw-1v; Thu, 04 Jun 2020 16:57:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 04D45301ABC;
 Thu,  4 Jun 2020 18:57:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B172E20E061B2; Thu,  4 Jun 2020 18:57:03 +0200 (CEST)
Date: Thu, 4 Jun 2020 18:57:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Miller <davem@davemloft.net>
Subject: Re: [RFC][PATCH v3 1/5] sparc64: Fix asm/percpu.h build error
Message-ID: <20200604165703.GG3976@hirez.programming.kicks-ass.net>
References: <20200529213550.683440625@infradead.org>
 <20200529214203.673108357@infradead.org>
 <20200529.162917.1970892823680223252.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529.162917.1970892823680223252.davem@davemloft.net>
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
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, a.darwish@linutronix.de,
 sparclinux@vger.kernel.org, tglx@linutronix.de, will@kernel.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 29, 2020 at 04:29:17PM -0700, David Miller wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Fri, 29 May 2020 23:35:51 +0200
> 
> > ../arch/sparc/include/asm/percpu_64.h:7:24: warning: call-clobbered register used for global register variable
> > register unsigned long __local_per_cpu_offset asm("g5");
> 
> The "-ffixed-g5" option on the command line tells gcc that we are
> using 'g5' as a fixed register, so some part of your build isn't using
> the:
> 
> KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
> 
> from arch/sparc/Makefile for some reason.

Thanks, that was the clue I needed.

I think I see, what happens is that these headers end up in the VDSO
build, and that doesn't have these CFLAGS, because userspace.

Let me see what to do about that.
