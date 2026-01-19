Return-Path: <linuxppc-dev+bounces-15997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50987D3ABCA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 15:26:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvt730lVpz3bhG;
	Tue, 20 Jan 2026 01:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768832783;
	cv=none; b=Qg5Mz8Hc6q90Q76P8ZfSoLmebWq1jNyc6EAvQMbTOu8hpqiMOlM8T6yB6uOqDAV63my8LT3xLLB2ssx+sC6KtJYBruuxzK9RbvnNWemCBIztxI51I4+OWp4RpcrKM4701zquhBCmvSRts3bHvMSRnH2VwiMNjdMhTzzHgKM7bUi5E5zLJlZjIsRKI0I+azGMQIF1tLDfr20AzICSqvkQnmSx9Rs0jRPp2XKdHZpBp6QQH6OS7ZoCFvPmWPHIHi8uCsa5m/7iLiAOUoLU4vIdXcY0xQ8XdnifYIqGaUkh3wodLnQTjiJbYdPZszCef4t55RFQtYPgksFDanOXC6TGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768832783; c=relaxed/relaxed;
	bh=J7YR6Ss4GR1p+SXEIbKvrV+9SeOL7XVCLDPQxRbp/9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIG3Pwgw/RKv7UlE8teRu3OIbH/jVv5dSgOUqDQ2dXXZOhzPWRJIN8P4DbZPQd+pt5IBs4QAPEbJKT0loC+iDMrKrDQYne+XaDblNSbKyUYPChuD2aMhOzRmD5T2VUNh5qFwxrdXcrE3QElPhx89kYBpaI2o4thboAv2bBo0BSVSJxEQEmSnbr1RdmKLmBLPbIaB91rCKaZUM2JVr3dWNmMrdfGixuS8+t3Vn+gd//G38oJDt6wBSA1331PcUP4/x1wHUR7XqsaM+yn0juVVTSmCd4fAakR7f2ahvGZ2YTHuJImWvOJpjscbxExFqiQo7unzczMAcWO0dXnNWnOulQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=phVpzmPF; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=phVpzmPF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvt7058Cfz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 01:26:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J7YR6Ss4GR1p+SXEIbKvrV+9SeOL7XVCLDPQxRbp/9Q=; b=phVpzmPFu1Lg5Wwsu+BOkmfOW+
	7MEiiANgQ2k/WAjssImTBsBtsTReEql3LfWeR3eFCTJMcXjNSQuIO7LbmizlIxbjd7SrLLSKCcBSp
	aDO/nN6wrUdvONoFpb1boJnDyyb9lER3VTnG9922Knms3+B9j6HFUVGinLdmiEyvhWAyM1emPfId0
	3ejQrUhO0sHyp8rUFpwu26JS3ZZq0CPSKVHkIzEgF64hdM1+c+1BQTsyQUJrF/KtLBbP6GFbLLb2j
	Jm6wiXTO8fSdUEnK92SIQIyQQDwiIUBCAg2WEYqWULtN4+kC03qtQtM6yeOYdsHHp/DqXmbnbADUG
	Oa7LNwWA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqCm-0000000CGLf-3TCN;
	Mon, 19 Jan 2026 14:26:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DA8703006CD; Mon, 19 Jan 2026 15:26:07 +0100 (CET)
Date: Mon, 19 Jan 2026 15:26:07 +0100
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
Subject: Re: [PATCH 06/15] tick/sched: Unify idle cputime accounting
Message-ID: <20260119142607.GG830229@noisy.programming.kicks-ass.net>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-7-frederic@kernel.org>
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
In-Reply-To: <20260116145208.87445-7-frederic@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 03:51:59PM +0100, Frederic Weisbecker wrote:

> +#ifdef CONFIG_NO_HZ_COMMON
> +void kcpustat_dyntick_start(void)
> +{
> +	if (!vtime_generic_enabled_this_cpu()) {
> +		vtime_dyntick_start();
> +		__this_cpu_write(kernel_cpustat.idle_dyntick, 1);
> +	}
> +}

Why don't we need to make sure steal time is up-to-date at this point?

> +void kcpustat_dyntick_stop(void)
> +{
> +	if (!vtime_generic_enabled_this_cpu()) {
> +		__this_cpu_write(kernel_cpustat.idle_dyntick, 0);
> +		vtime_dyntick_stop();
> +		steal_account_process_time(ULONG_MAX);
> +	}
> +}
> +#endif /* CONFIG_NO_HZ_COMMON */

