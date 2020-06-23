Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C31206712
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 00:16:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s0x90P6jzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 08:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=a.darwish@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rrtV1NnQzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 02:13:37 +1000 (AEST)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <a.darwish@linutronix.de>)
 id 1jnlY2-0005Ko-Kg; Tue, 23 Jun 2020 18:13:22 +0200
Date: Tue, 23 Jun 2020 18:13:21 +0200
From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623152450.GM4817@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Wed, 24 Jun 2020 08:12:44 +1000
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

On Tue, Jun 23, 2020 at 05:24:50PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 05:00:31PM +0200, Ahmed S. Darwish wrote:
> > On Tue, Jun 23, 2020 at 10:36:52AM +0200, Peter Zijlstra wrote:
> > ...
> > > -#define lockdep_assert_irqs_disabled()	do {				\
> > > -		WARN_ONCE(debug_locks && !current->lockdep_recursion &&	\
> > > -			  current->hardirqs_enabled,			\
> > > -			  "IRQs not disabled as expected\n");		\
> > > -	} while (0)
> > > +#define lockdep_assert_irqs_enabled()					\
> > > +do {									\
> > > +	WARN_ON_ONCE(debug_locks && !this_cpu_read(hardirqs_enabled));	\
> > > +} while (0)
> > >
> >
> > Can we add a small comment on top of lockdep_off(), stating that lockdep
> > IRQ tracking will still be kept after a lockdep_off call?
>
> That would only legitimize lockdep_off(). The only comment I want to put
> on that is: "if you use this, you're doing it wrong'.
>

Well, freshly merged code is using it. For example, KCSAN:

    => f1bc96210c6a ("kcsan: Make KCSAN compatible with lockdep")
    => kernel/kcsan/report.c:

    void kcsan_report(...)
    {
	...
        /*
         * With TRACE_IRQFLAGS, lockdep's IRQ trace state becomes corrupted if
         * we do not turn off lockdep here; this could happen due to recursion
         * into lockdep via KCSAN if we detect a race in utilities used by
         * lockdep.
         */
        lockdep_off();
	...
    }

thanks,

--
Ahmed S. Darwish
Linutronix GmbH
