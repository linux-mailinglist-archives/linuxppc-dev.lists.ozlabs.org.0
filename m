Return-Path: <linuxppc-dev+bounces-16018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43011D3BA50
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 23:00:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4CG3jnzz2xm5;
	Tue, 20 Jan 2026 09:00:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768860042;
	cv=none; b=Nn9OAaSCoOsm+BiIS+8MZwUBq2SdjPBHMZSlFVq4Dz7gCh9ROmdIKl3k5v3TcC52ENkqk+UfEzFg+yyD5VlfnsnpEAa2CnISecU+T+aFoXweT8gbpVTrodOsH91D8L5rb1QwNGB+k0GghCeUWDBCmhEOsKLMKIojYGtst8mE2O1Gzp1C9lGa/xTAlxupYRxZvPnH0BIO/RrvY3+WMwjKOLs2OwnDrGK6PJVI878qMKc6KrfXW8zejYcm6L2bsqtUAaJWzzXv2UJasg0ndOdxWRtq0e3/eRDfOpDy8eT/Gc9CBc9TBsOyG1k38KSRrxFlADo4CnW7oYK8ccSMTBekzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768860042; c=relaxed/relaxed;
	bh=rxmhZqrMSBLRV4qrcglg8rPki9/WiWVIQ+WnkJjx4kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDKKMKxNE1kPx9Hp5hX6Gfcr5dTa4gpifermf8VmLn6auChVzm8V9YjeIHWQq+P5rhW8we2p/3UB5KyjcHNbqPZjPHTKdns5W7yJDwPFSKMc1ZJoIQU5amjt+YJs/f//cpKXF2voFv9HmV3eyixwzn76KUNmVpyM3wsA5S7gr4ykmXaqJbpcZwhiUbFRo6BtN3eCuRWy8OGnTRawtxTsWRC7umiXIESyh0j/0x92pIy8AayaRfoT31RKwgSPiFkm6JL/0/U5kYm9BiTsMNu9svU4WT/3nuZZ7VMIttblzatoc/ty00Yor5k0o2V8UnhD/ELSqwGQ6Np35nm+Nz8PQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBzzATy6; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBzzATy6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw4CF0jL4z2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:00:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D819600CB;
	Mon, 19 Jan 2026 22:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633DEC116C6;
	Mon, 19 Jan 2026 22:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768860037;
	bh=i93O1wnS4zj4pX0251MiaGhsQUiCSCNVJWX9Zn2+X7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBzzATy65nCqBqK20u1xQ84huXMH+axu3TXK2L6DC5nd8yziq+TvpuslsmRRobeQT
	 VH7SNLOdLeNcBRj6UUrfbhXFwGgiKoYEVpjMnlb01pfhCGyz7OXEafYW++2K6D93/o
	 FYjzCNlDytNmD4UlzSxcoJdOsxCYn+Z/kz4RlVnQcK5VoZRLga2nmSopJTVQ/YQZ4k
	 dXpEOBgNjZJRJGZ8eFREAdqzrfDqVXrgs/zrjSZSTezsgrTa1GMy5eBjt31vzYB0GM
	 /hOWyVZ3Xz97w+bSw11NPtmhbdCmx3cxXFkj36kBjpJGxbQzNx0ugkqbn5P/9S2WfF
	 SWgWuYyaLSlRw==
Date: Mon, 19 Jan 2026 23:00:35 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <aW6pgzarQ-tnPjl6@pavilion.home>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-7-frederic@kernel.org>
 <20260119142607.GG830229@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20260119142607.GG830229@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Le Mon, Jan 19, 2026 at 03:26:07PM +0100, Peter Zijlstra a écrit :
> On Fri, Jan 16, 2026 at 03:51:59PM +0100, Frederic Weisbecker wrote:
> 
> > +#ifdef CONFIG_NO_HZ_COMMON
> > +void kcpustat_dyntick_start(void)
> > +{
> > +	if (!vtime_generic_enabled_this_cpu()) {
> > +		vtime_dyntick_start();
> > +		__this_cpu_write(kernel_cpustat.idle_dyntick, 1);
> > +	}
> > +}
> 
> Why don't we need to make sure steal time is up-to-date at this point?

Yes, there could be steal time since the last tick. It will be included
and accounted in kcpustat_dyntick_stop() and not substracted from system
or idle cputime (but it should!). This wrong behaviour is the same as the
current upstream behaviour. So no known regression.

But check the last patch of the series that tries to fix that:

    sched/cputime: Handle dyntick-idle steal time correctly

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

