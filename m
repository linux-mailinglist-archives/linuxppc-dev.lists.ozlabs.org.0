Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA312055DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 17:28:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rqtR0FvbzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 01:28:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=Q2asf/D+; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rqpb4RgXzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 01:25:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CdyXQj2K/WhL99i44E17m8NIjPfggDEZJpNq1YwlkZk=; b=Q2asf/D+1IaMFnf1i/OVF98de3
 7rs3gVfXshkpsFSSEaP3Y7T3/jTzoRPpqVcpPUtnk9TLPRm/yqsLW5rzqU45RZvshYlmMrH648Bp+
 +VOJgyFc0NC5Vs3bN8mgZAsW1mnElkGwPu5PAeUQupo9bWrU7jFZFfQc7FPoQxcaxz//lpCJDxhJD
 ZuHJZtkrYUFb3n/y9sZEBKLUqfwZkaGs+bglrCumueb5ZG54b/NxCLJJzXQmO9LxeKerFKX+t6AXz
 6X8YpY8hQffzfIE7GoVgFOKPODFGi4aJCr3+VXGUB9CZeB/MY6yUCEz72sg0jKQIZ694RVvWzj7SD
 Plpff4LA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnkn7-0003Pr-8v; Tue, 23 Jun 2020 15:24:53 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 180DE303DA0;
 Tue, 23 Jun 2020 17:24:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id F17AC234EBA53; Tue, 23 Jun 2020 17:24:50 +0200 (CEST)
Date: Tue, 23 Jun 2020 17:24:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Ahmed S. Darwish" <a.darwish@linutronix.de>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623152450.GM4817@hirez.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
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
 sparclinux@vger.kernel.org, linux@armlinux.org.uk, tglx@linutronix.de,
 will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 05:00:31PM +0200, Ahmed S. Darwish wrote:
> On Tue, Jun 23, 2020 at 10:36:52AM +0200, Peter Zijlstra wrote:
> ...
> > -#define lockdep_assert_irqs_disabled()	do {				\
> > -		WARN_ONCE(debug_locks && !current->lockdep_recursion &&	\
> > -			  current->hardirqs_enabled,			\
> > -			  "IRQs not disabled as expected\n");		\
> > -	} while (0)
> > +#define lockdep_assert_irqs_enabled()					\
> > +do {									\
> > +	WARN_ON_ONCE(debug_locks && !this_cpu_read(hardirqs_enabled));	\
> > +} while (0)
> >
> 
> Can we add a small comment on top of lockdep_off(), stating that lockdep
> IRQ tracking will still be kept after a lockdep_off call?

That would only legitimize lockdep_off(). The only comment I want to put
on that is: "if you use this, you're doing it wrong'.
