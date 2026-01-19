Return-Path: <linuxppc-dev+bounces-15998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB119D3AC25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 15:36:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvtLD41n3z3bhG;
	Tue, 20 Jan 2026 01:36:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768833364;
	cv=none; b=KVHk1EUbif9sfr0dwXnGVcb9u09ZQaUSIoFpf4bo5AWuyCKTeryS2cIiAhhpnBAlUHnxK5p1kEhoXhMd3gw/fCs4V4gGjv00RlOqzlck3t2OcLz8k9FSwx2zmgJa8g1dvlK7h4wN0lpw+nCWQx15qj6aNYsx0UO9mcI1VqTggSfTP75E2sxF+JfFN3RGOwY0xLq3VWvtfFi9MKmkVKJ7T3nhdXRyMA9zNA4g4B1dAsrElyn0VC1i4n+Vh7bw5fMki0mpJwivnD2jB5hzwJM3U/9vLNcy9+TMRro+iDVgHsJXYU8gb2y+z40z7pucN4Ha7VZ8e1HM08141TgjsdpSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768833364; c=relaxed/relaxed;
	bh=TX9AK0WImvqy6dbeoXuKKxGGurru6lbB0iFY3euRVeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n69k8sFmStQU6sn0qD3RzSyty/GHEY3Ev4Nk9o7aMU4MwuhheoxOtZAvGM0B8pbx/Eo9M2TnET/pX/w2v5TOa8kiSXL6jNJy+IVP9b7iMZHUUO7o7GDcR8A9UhuORzkL9kEu1/ZnJVix355JwVh9T1syhYDn5eCyaPy0P8Ox4MoXHcCDEVIHlGKtNXYYLJEB90Xc6LWNSoHAGsEfp5yUywSCrUqIBWMG1Za9sNZbZu/J7K2wmeUM0QRbMymcchkPc2W7vx+qwK/YeBOlPhLmmslC4n0AMOWveYdsl8cflo2yfIbo3isFiO4g63RIDu96uM2wTbddj+IRHmAY8Uy18A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=S2HzY/XR; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=S2HzY/XR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvtLC4v1mz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 01:36:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TX9AK0WImvqy6dbeoXuKKxGGurru6lbB0iFY3euRVeA=; b=S2HzY/XR2q1WCyKLHrFfbS4AxR
	et3K2ZgiAkkP63sYcmvG204nTiWLK0kC3G2PJf6V1KiEUkEeoUezCOh2cnhMiN2s9yjXIHfQoDoHw
	Z90M+Sy8CpezVCfXRh90k543tDcFttQuVEdYT+e/CZKRmgHRPfry/p67XsGwUAQKyrw3tjBPeyjfu
	Xgn1MvzIeMr63yFZdT4arLMfequ48RPuquozifiDFof8bLDa3iemT3EX5mvDbq3wDHJlnpYi064W1
	JHHGkuZ9k7ZQyU5s+uf8z0TG70YZ2y9Q+Z+D8NJClTlgadNZMLaImy6JIizLm9bibrVJ6gAhATKxJ
	RI0mrhLQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqMD-0000000CHyO-1Lbz;
	Mon, 19 Jan 2026 14:35:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D83BB3006CD; Mon, 19 Jan 2026 15:35:52 +0100 (CET)
Date: Mon, 19 Jan 2026 15:35:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
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
Subject: Re: [PATCH 09/15] tick/sched: Move dyntick-idle cputime accounting
 to cputime code
Message-ID: <20260119143552.GH830229@noisy.programming.kicks-ass.net>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-10-frederic@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116145208.87445-10-frederic@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 03:52:02PM +0100, Frederic Weisbecker wrote:

> +static void kcpustat_idle_stop(struct kernel_cpustat *kc, ktime_t now)
>  {
> +	u64 *cpustat = kc->cpustat;
> +	ktime_t delta;
> +
> +	if (!kc->idle_elapse)
> +		return;
> +
> +	delta = ktime_sub(now, kc->idle_entrytime);
> +
> +	write_seqcount_begin(&kc->idle_sleeptime_seq);
> +	if (nr_iowait_cpu(smp_processor_id()) > 0)
> +		cpustat[CPUTIME_IOWAIT] = ktime_add(cpustat[CPUTIME_IOWAIT], delta);
> +	else
> +		cpustat[CPUTIME_IDLE] = ktime_add(cpustat[CPUTIME_IDLE], delta);
> +
> +	kc->idle_entrytime = now;
> +	kc->idle_elapse = false;
> +	write_seqcount_end(&kc->idle_sleeptime_seq);
>  }

I realize this is mostly code movement; but do we really want to
preserve ktime_{sub,add}() and all that?

I mean, we killed that 32bit ktime nonsense ages ago.

> -static void tick_nohz_stop_idle(struct tick_sched *ts, ktime_t now)
> -{
> -	u64 *cpustat = kcpustat_this_cpu->cpustat;
> -	ktime_t delta;
> -
> -	if (vtime_generic_enabled_this_cpu())
> -		return;
> -
> -	if (WARN_ON_ONCE(!tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE)))
> -		return;
> -
> -	delta = ktime_sub(now, ts->idle_entrytime);
> -
> -	write_seqcount_begin(&ts->idle_sleeptime_seq);
> -	if (nr_iowait_cpu(smp_processor_id()) > 0)
> -		cpustat[CPUTIME_IOWAIT] = ktime_add(cpustat[CPUTIME_IOWAIT], delta);
> -	else
> -		cpustat[CPUTIME_IDLE] = ktime_add(cpustat[CPUTIME_IDLE], delta);
> -
> -	ts->idle_entrytime = now;
> -	tick_sched_flag_clear(ts, TS_FLAG_IDLE_ACTIVE);
> -	write_seqcount_end(&ts->idle_sleeptime_seq);
> -
> -	sched_clock_idle_wakeup_event();
> -}

