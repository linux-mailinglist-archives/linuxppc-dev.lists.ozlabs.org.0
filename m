Return-Path: <linuxppc-dev+bounces-16112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CkjB0QVcWkEdgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 19:04:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E55AFE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 19:04:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxBt22Q9Lz2xrC;
	Thu, 22 Jan 2026 05:04:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769018682;
	cv=none; b=L5u/wH1tqW9C8fBMjGMJhdr3lH7Fro+Gn3kvGUJd6YP4949bIijFwH/T74HzcgoXAdDftUHp+ImRfBMq+u/kJQ5/O2OeR3rlidNf8f8/VBayFmboW9vd9AY/YThFbii2N3cApQgPhdJJkvNQGKAuuWTnmVjeSmr3HIwoXVq18LH7oChr9uKUrhYnKyXDN9RMScgMR+QfniALQmw9sZhqv1CTp25YlzCq3zH2YcZY1gCTk8RxmKNzl2aoTkc5NSKDKKMbRRsf9GN8FSkZXcDtaTkdTQXI4oNEffLn24U/acJi3IAgc/3zKsE3ZrpwV8RlvzdgcwJdCCpQLBGyXlKjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769018682; c=relaxed/relaxed;
	bh=iS20oLjIAG96OV7Uo+tl9ULe0JH4XLICkgZliwSH/Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5736N2Q5U7aZ+txAb1tnGmxvWDZJVucpB+3ZWrZ0gmVzURZqukUKrdQ6VmCIKQUwl9EIhmr+IHvR2wl5tELdWRHE26K3Lyd/cy20AnqPhNPImcLZdfI40nyyzzCXdNsOWN0RAjpcnz1toeg3FtZVS/NYxR3YIFeOGjOPfJcJCfi30IoUaERMtibiBDLzN4FB/h77HcYzxed+T0PFWMh2xR3hc/S3KkYpKIxZpeuE9oZ/CwW0zxNHM8WouDa6tUmPSj/L0mDtBWGnNFT/EWG2+kNwQJhWUa6+kB0ei3zCn8ekYma6KFbjT0M7XMRkKsKp7wUZN00QrV7wJuLQjsMAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R8mnX7pQ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R8mnX7pQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxBt132Hcz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 05:04:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F50F4332A;
	Wed, 21 Jan 2026 18:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4622CC19422;
	Wed, 21 Jan 2026 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769018679;
	bh=zgHajdVw61MqSQX6CzNOyKpHHjKBbIr1ZOLWeN8umBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8mnX7pQClLyRszYv6lZRWRdiGNnqFJVNvE+Z4pRPauE/B5J84fJI11PNQMH1FpdF
	 lvVk+nNc1pR35MlRZX2TJZxasZFeYFgtsAIiupoZ1+Mu2nqwtnFa4Pq0xkLuK84QU1
	 5nLpIwResJGOP9yVZm6DcV52yoEGIuz9HzqLJdqkPu2VTyKJd58tOMT3jVv+MKz1Zo
	 Rthm5BKmMGOGaLeGW8ezfj1xH4FCNBHHoJ1p+9eeTG3r+qMbTRIpDI9OJcMVtucqs2
	 jrblMtbHN8h5QqjYpsjlc92BkyVYkW8RD59XEMglysdk1t164EM4kbuay4PvII/fuy
	 emULbyvfdS+qQ==
Date: Wed, 21 Jan 2026 19:04:35 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xin Zhao <jackzxcui1989@163.com>, linux-pm@vger.kernel.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 05/15] s390/time: Prepare to stop elapsing in
 dynticks-idle
Message-ID: <aXEVM-04lj0lntMr@localhost.localdomain>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-6-frederic@kernel.org>
 <20260121121748.9719Bab-hca@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121121748.9719Bab-hca@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16112-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_RECIPIENTS(0.00)[m:hca@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid]
X-Rspamd-Queue-Id: 191E55AFE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le Wed, Jan 21, 2026 at 01:17:48PM +0100, Heiko Carstens a écrit :
> On Fri, Jan 16, 2026 at 03:51:58PM +0100, Frederic Weisbecker wrote:
> > diff --git a/arch/s390/kernel/idle.c b/arch/s390/kernel/idle.c
> > index 39cb8d0ae348..54bb932184dd 100644
> > --- a/arch/s390/kernel/idle.c
> > +++ b/arch/s390/kernel/idle.c
> > @@ -35,6 +35,12 @@ void account_idle_time_irq(void)
> >  			this_cpu_add(mt_cycles[i], cycles_new[i] - idle->mt_cycles_enter[i]);
> >  	}
> >  
> > +	WRITE_ONCE(idle->idle_count, READ_ONCE(idle->idle_count) + 1);
> > +
> > +	/* Dyntick idle time accounted by nohz/scheduler */
> > +	if (idle->idle_dyntick)
> > +		return;
> > +
> >  	idle_time = lc->int_clock - idle->clock_idle_enter;
> >  
> >  	lc->steal_timer += idle->clock_idle_enter - lc->last_update_clock;
> > @@ -45,7 +51,6 @@ void account_idle_time_irq(void)
> >  
> >  	/* Account time spent with enabled wait psw loaded as idle time. */
> >  	WRITE_ONCE(idle->idle_time, READ_ONCE(idle->idle_time) + idle_time);
> > -	WRITE_ONCE(idle->idle_count, READ_ONCE(idle->idle_count) + 1);
> >  	account_idle_time(cputime_to_nsecs(idle_time));
> >  }
> 
> This breaks idle time reporting (aka enabled wait psw time) via the per-cpu
> sysfs files (see show_idle_time()). That is: the second WRITE_ONCE() should
> also go above the early return statement; but of course this leads to other
> dependencies...

Oh right! Will fix that.

BTW here is a question for you, does the timer (as in get_cpu_timer()) still
decrements while in idle? I would assume not, given how lc->system_timer
is updated in account_idle_time_irq().

And another question in this same function is this :

    lc->steal_timer += idle->clock_idle_enter - lc->last_update_clock;

clock_idle_enter is updated right before halting the CPU. But when was
last_update_clock updated last? Could be either task switch to idle, or
a previous idle tick interrupt or a previous idle IRQ entry. In any case
I'm not sure the difference is meaningful as steal time.

I must be missing something.

> Not sure what to do with this. I thought about removing those sysfs files
> already in the past, since they are of very limited use; and most likely
> nothing in user space would miss them.

Perhaps but this file is a good comparison point against /proc/stat because
s390 vtime is much closer to measuring the actual CPU halted time than what
the generic nohz accounting does (which includes more idle code execution).

> 
> Anyway, you need to integrate the trivial patch below, so everything compiles
> for s390. It also _seems_ to work.

Thanks, I'll include that.

> 
> Guess I need to spend some more time on accounting and see what it would take
> to convert to VIRT_CPU_ACCOUNTING_GEN, while keeping the current precision and
> functionality.

I would expect more overhead with VIRT_CPU_ACCOUNTING_GEN, though that has yet
to be measured. In any case you'll lose some idle cputime precision (but
you need to read that through s390 sysfs files) if what we want to measure
here is the actual halted time.

Perhaps we could enhance VIRT_CPU_ACCOUNTING_GEN and nohz idle cputime
accounting to match s390 precision. Though I expect some cost
accessing the clock inevitably more often on some machines.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

