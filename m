Return-Path: <linuxppc-dev+bounces-15994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA4D3A9CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 14:02:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvrGS4FMSz3cBN;
	Tue, 20 Jan 2026 00:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768827760;
	cv=none; b=JAhTct4oGmorgC2URykklkY31X7NDujy7jqgA6f7uPfM8ijrocxLx8n39oaX6RfilAyV5mP8osEY2UgPly84lkhA0MIOK3dPvsnH101nownvOYRG4E7X/5Yen1Te7Dwu2HXPuAJ+dYEgCLaBw0l+fZ6xr6qeJMEgwc54mVKs7mdtrZGCSmHRb7D7o9/WRtpiZIBU28S7xZ9FTBBB7FXmL8Z+KZSFfgQUfNpWDz56NJulv5vPDFdPz6us8Kalc7tDLZlVKS9bu+DAZ40bf2K+CxgRJBoyjrg6mI1IJ/jVSkofvNUeZqEIayUxcnHEPw4B7/RTlSgWCgv4jZqeJULWng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768827760; c=relaxed/relaxed;
	bh=K6GIJX4FXlvpq7uMxNyYRLbfDKf0u3wG72kJM/83578=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LO0hkxm9lFiNXN75rGDJ2Dcf0vpU0ueIBntZJjn8CyjDcY/vP90bRXJ2ETP4/Qsb2gUQ93Xr5P4KWLJ17nEokhElwG1kEeyZl5f1W1/RW59sLkD0YM++hsZ3DTjqLeEAP2CGEM7v9dLPdMwY8LnpXn1z9arhu9H+InLM44xLi9isKd5RddrxSNlIsYk9K24EGveNi31M+r9oSU7tdPyCF/9IR2u3+oGdnKsGlU9hjmrIBVNY2NibDBb9VgDiQ0gl4SmFZVH+vtlgKKCGPjn8GYSpu/7HTpCjBEi3saUyPGJWuRNd1VPTLG8h7oLOxllzG6KkqbFwlkGE9Z9OmIE0ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AfC2LjX+; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AfC2LjX+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvrGM52T3z3c8W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 00:02:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K6GIJX4FXlvpq7uMxNyYRLbfDKf0u3wG72kJM/83578=; b=AfC2LjX+NrAKtI09VCS2VApu5r
	TB5u50TAe6rKe0UqNLR+zN084CjDkMuVhwbSmzDwY5UuDDh6EQUGlMMqMbKkNK7ql4UfANuiloz35
	A4S7ItXfX/XkXB8KxXFSF6PKoALuvUcmNK6a6vPKYzeV3HdIgx0VPPlO0XrA1ja/ADs3vlqkDI9tA
	dMQrtDJtzWjg9N7sK+OSoDxPGnKgR4E0BZ2GMH6mKDynRvgFkXi3/bvnbZEcl2081N3hZQ03APAMD
	u+naESOWRL7j5M8hE9v/EdwcoDUWPevfhimo1rR7/PMnk3vRVMEib6SULgy/fk8ZkN5PBmOV9H9KT
	9Cqb9VNw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoti-0000000C870-3hn0;
	Mon, 19 Jan 2026 13:02:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 58E263006CD; Mon, 19 Jan 2026 14:02:22 +0100 (CET)
Date: Mon, 19 Jan 2026 14:02:22 +0100
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
Subject: Re: [PATCH 03/15] sched/cputime: Correctly support generic vtime
 idle time
Message-ID: <20260119130222.GU830755@noisy.programming.kicks-ass.net>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-4-frederic@kernel.org>
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
In-Reply-To: <20260116145208.87445-4-frederic@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 03:51:56PM +0100, Frederic Weisbecker wrote:

> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 8ddf74e705d3..f1d07a0276a5 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -780,7 +780,7 @@ static u64 get_cpu_sleep_time_us(struct tick_sched *ts, ktime_t *sleeptime,
>  	ktime_t now, idle;
>  	unsigned int seq;
>  
> -	if (!tick_nohz_active)
> +	if (!tick_nohz_active || vtime_generic_enabled_cpu(cpu))
>  		return -1;
>  
>  	now = ktime_get();

Is this not broken? IIUC this means that you can no longer use
get_cpu_{idle,iowait}_time_us() the moment you have context tracking
enabled.

