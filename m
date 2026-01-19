Return-Path: <linuxppc-dev+bounces-16015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC8D3B90A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 22:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw2yw0WRsz2xHW;
	Tue, 20 Jan 2026 08:04:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768856695;
	cv=none; b=GcIa/l1fmA+2lWGbYJw+G1dGrxfaq87p+K3aX+7Q5XmA+XkJU2pHbvPUBTpiQ/aOkZtqZYdYbm0bOpVwpHiW3JpRCj0Ins44YCZyRrrvHJyHFF7MgvEzC6+cpe6Ml9e4tMjuPVMgMY2WWMgF/+PCGIkOR2TcE31wneDt/Pl83angAKSe32t6tJhJX2kB/NADOyOKatxNG3/r5KYhPRcLDCh6r+t97TzRmONBIgefz5bYEFqM4AtnI8v/ajcwxAz+2UefBs2TnWLvUNB18fls/zjlXDP4O2+zoTtu1WBxyPpY1l1/tHxJrJbr0JHfnj2DOUk3KRl8uuLuIG4B7g1Jfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768856695; c=relaxed/relaxed;
	bh=9JUJuTZ3h84poyhsWYUX7A1RnWWard3k0N9S8sVhk5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bey2GNPnDu1KT7g6c9xfJmo7vnk1jDa3UIPO/18hEY23/EHKh2t5bKb1mbtDTmgjeRRpxN77Zr2WndYAc9jcDttDNRZHtNg25Glv9W6OlUL6ojWRZX2iuoShs1l+G4Kgjh1Hj8fKr3i8dzU/ChERKyiVkH5ExquFGmfWYu1JHNSaDKGrT4gNvZe66M4BaPYKGY9zr/r0YLZaYq7plAeKelncaXSm/4mydTuyT6bvmHGEmFxeE4asYWQimsWeo8MGeo961Y0XOilA68Vjm8c68Cz9RQgr7AdNpD8PsmS5eWrOkfWegd4GHuLNewB3NuyaVwwZPOjP5556mJ2Ze9QzBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iXD2y8uy; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iXD2y8uy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw2yv0Wc2z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 08:04:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D55F44129;
	Mon, 19 Jan 2026 21:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7ABEC116C6;
	Mon, 19 Jan 2026 21:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768856692;
	bh=6o+770Yuc3JjhJgvTCTVGSnWnwzkyqp25xUHsXx/C6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iXD2y8uyJXn1wpB61gKSaO/rK1kVC3HviBmxyTELifn8la3q38wzR/8/FAe+5fNYl
	 ik+9L6OTEhlmGu1UQdY4aD1a5aW7HYIXswoYSgJh7xMmBDk3dBcl2jDRPQ3Gekd589
	 SW9zUCR9XPe6pZCj0TKHTnObA3HPP0+tHT8d3okl57iIQ4vOrOe60WdPZmfCCXT5Sc
	 6Z8dPnAGg1Dv34Rm1pypG+/y+3MHgCNUROe90BwGxYzcjF9MSHa3jR/Mg0xsSEaBI0
	 mYwEoCld9S81GOQ2xQZh3gPzMLIX2nazcrTF/Va1DfE4XpjmaE6W4b3KxEe9XYL5Ud
	 PiMpAlO96fSFA==
Date: Mon, 19 Jan 2026 22:04:49 +0100
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
Subject: Re: [PATCH 01/15] sched/idle: Handle offlining first in idle loop
Message-ID: <aW6ccexiQaPLQcS1@pavilion.home>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-2-frederic@kernel.org>
 <20260119125347.GT830755@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20260119125347.GT830755@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Le Mon, Jan 19, 2026 at 01:53:47PM +0100, Peter Zijlstra a écrit :
> On Fri, Jan 16, 2026 at 03:51:54PM +0100, Frederic Weisbecker wrote:
> 
> >  kernel/sched/idle.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> > index c174afe1dd17..35d79af3286d 100644
> > --- a/kernel/sched/idle.c
> > +++ b/kernel/sched/idle.c
> > @@ -260,6 +260,12 @@ static void do_idle(void)
> >  {
> >  	int cpu = smp_processor_id();
> >  
> > +	if (cpu_is_offline(cpu)) {
> 
> Does it make sense to make that: if (unlikely(cpu_is_offline(cpu))) ?

Yes indeed!

> 
> > +		local_irq_disable();
> 
> Also, do we want something like:
> 
> 		WARN_ON_ONCE(need_resched());
> 
> ?

Definetly.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

