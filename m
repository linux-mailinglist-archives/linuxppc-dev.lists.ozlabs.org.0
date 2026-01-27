Return-Path: <linuxppc-dev+bounces-16314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N9FH5fPeGmNtQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 15:45:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840CF95F0E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 15:45:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0p9W0Y11z309S;
	Wed, 28 Jan 2026 01:45:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769525134;
	cv=none; b=DuRXrB7CnEk1plD8aFM+INDOtRlEQDCAh0izfo46TGBm78qV+UQW6GvLt+IUuXOsxajR//KIZNyPfxMLcnd6VnielqosnSaD3EpfgJDaTkBaZ1MEJ/5WD+hg2tUTvpiYiNGdnXw8El+LLdNrJB/sli1j7VADlCOzKY5Hq/3900Q1nZJpy2Ax+R/MaQcdOZw09idII1gpdqQoEfmp/l7EsVl5wEWq9/a12gQuSnW+m7nV8q4iHgL8HH2H8fk4sCCNUdKUt3f8C3Ezxyus2GJSj00Qm3OdVAbpnGCX9KU6fUV8E5o/nhgzzwYqCnG5scOWwWBkHUefA+V3hn/FaLFvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769525134; c=relaxed/relaxed;
	bh=ZT2n0nSZugFte3TRA8IFPlQN20B/3iyqkX0gewzEVUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgLV7rubf8oz/kHtFrZBcdlufC2G4pcoctH7ZparNjGzmIpWKQJI6Y8aHNX5GpR9ch6acN9IOj4pXm0PYsM0GIzadR4wZoQdShMv2MZqMIMk9VuqLMQiV3j0RL99dvv8QatGz6N+UKjO2VdTe81Jf9Fvbw7utgM75E0LSSCgih309aCAodebM8t3DOkjUJfvUmxue7D/Djt4UZyyYHpS1hufDdH+6mVz46+asqhf3lllVw8OQ2rrGj0ZPnwU9I59pX7SAYFSym2pSin0F9APgVioFII3sybTzZaKDyCfttLgvdijtwZkWlAacyNJ6G647At16+HuDRiq+dkEkJB+2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k1FxynCb; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k1FxynCb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0p9T6gvpz2xXB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 01:45:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D11C043965;
	Tue, 27 Jan 2026 14:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C21C116C6;
	Tue, 27 Jan 2026 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769525131;
	bh=0YGeP0O62Pc53bwcfFkz6Pdb1KEkMMpDyI0yE++MS9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1FxynCbgFyhQaZBWbdQ3U3/gG7zvUiYTdT05s4SfRvueGwkwdMXfQ67RXYmWXNMt
	 nJcwbHtZ7igNbyW3UV297EDBMkUnggDFqkNCcRRA+vRpQtytrAnvyEHNrTU6qtdODo
	 1LbCma+SiMl2LT5ZuLyH7tZpYFN9UJ2XKhsK4xuHGPaRH8LD/O8BLUfTlNb0oHlPNi
	 O/otIJveig2kXrzcfYZMWTt5fvWceAjmmlhVGZjLExQFzzscRRARYyYJJl4ENA3zWK
	 zldlROZ0P7SlFX+FcV4aIGqzhLCTEzmtf2d26kCH+JflCjYXc+hEeq7F76jfRgZo4e
	 vcqAUDXHE61jQ==
Date: Tue, 27 Jan 2026 15:45:29 +0100
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
Message-ID: <aXjPiZCHZ77R4awi@localhost.localdomain>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-6-frederic@kernel.org>
 <20260121121748.9719Bab-hca@linux.ibm.com>
 <aXEVM-04lj0lntMr@localhost.localdomain>
 <20260122144045.38254A3e-hca@linux.ibm.com>
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
In-Reply-To: <20260122144045.38254A3e-hca@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16314-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hca@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 840CF95F0E
X-Rspamd-Action: no action

Le Thu, Jan 22, 2026 at 03:40:45PM +0100, Heiko Carstens a écrit :
> On Wed, Jan 21, 2026 at 07:04:35PM +0100, Frederic Weisbecker wrote:
> > BTW here is a question for you, does the timer (as in get_cpu_timer()) still
> > decrements while in idle? I would assume not, given how lc->system_timer
> > is updated in account_idle_time_irq().
> 
> It is not decremented while in idle (or when the hypervisor schedules
> the virtual cpu away). We use the fact that the cpu timer is not
> decremented when the virtual cpu is not running vs the real
> time-of-day clock to calculate steal time.

Ok, good then!

> 
> > And another question in this same function is this :
> > 
> >     lc->steal_timer += idle->clock_idle_enter - lc->last_update_clock;
> > 
> > clock_idle_enter is updated right before halting the CPU. But when was
> > last_update_clock updated last? Could be either task switch to idle, or
> > a previous idle tick interrupt or a previous idle IRQ entry. In any case
> > I'm not sure the difference is meaningful as steal time.
> > 
> > I must be missing something.
> 
> "It has been like that forever" :) However I do agree that this doesn't seem
> to make any sense. At least with the current implementation I cannot see how
> that makes sense, since the difference of two time stamps, which do not
> include any steal time are added.
> 
> Maybe it broke by some of all the changes over the years, or it was always
> wrong, or I am missing something too.
> 
> Will investigate and address it if required. Thank you for bringing this up!

Ok, I take some relief from the fact it's not only unclear to me :-)

> 
> > > Not sure what to do with this. I thought about removing those sysfs files
> > > already in the past, since they are of very limited use; and most likely
> > > nothing in user space would miss them.
> > 
> > Perhaps but this file is a good comparison point against /proc/stat because
> > s390 vtime is much closer to measuring the actual CPU halted time than what
> > the generic nohz accounting does (which includes more idle code execution).
> 
> Yes, while comparing those files I also see an unexpected difference of
> several seconds after two days of uptime; that is before your changes.
> 
> In theory the sum of idle and iowait in /proc/stat should be the same like the
> per-cpu idle_time_us sysfs file. But there is a difference, which shouldn't be
> there as far as I can tell. Yet another thing to look into.

Yes and that's expected both before and after my changes.

* /proc/stat is the time spent between tick_nohz_idle_enter() and
  tick_nohz_idle_exit() (to simplify, because there are some pause during
  idle IRQs).

* The s390 idle sysfs file depicts more closely the time spent while the
  CPU is really idle (and not executing idle code).

Different semantics and this is why you observe different results. I guess
/proc/stat has higher values (with idle + iowait) and that is expected.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

