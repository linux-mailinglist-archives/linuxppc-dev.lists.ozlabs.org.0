Return-Path: <linuxppc-dev+bounces-16021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16CCD3BA83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 23:13:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4TW2cqMz2xm5;
	Tue, 20 Jan 2026 09:13:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768860783;
	cv=none; b=b17ghuesEHS4I8v48oIKDiyYAQXi/z1gX+kREeyxyUeVFfi/Mh0p6tWg9pe/XNUc3Gn3pp5EoAlyf6lH59uRo1GapwffrhizeMvUxX4NRg0Hv+ZommHqOYDQXR0NMkb45xQtTLUSRjU5g9TPQGuE+GjqbPlwQicxNVxqphxqQHW2ulitcsFhfV80UqhqvqXnDzBPNqqiRE6cM8ahGKkCCygaSOayiyGNEpcdacYLP+2xmsiRTSZm1eYRvFTnejNe16Ajx6l8PO2f6VTKqqvkyvRzyZkR6GjmwDPUzsESr4rE4TWUcDpjsr2hjPHNosNK/oRPcBT5ZpxvqJmTXqqXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768860783; c=relaxed/relaxed;
	bh=1pRlVGAcOW2M3LktV6klkiDEvpGIzWnyw8jZaFzgjwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPk2H1H8MOLnvf5PXqmYJraiCF2grXPQjpkAR3xasdNK4Lhr8G/Eo65a9JvkETC141KeyopTu8Sr8sCwTHUNiZbqw84LyhY9T23o6aS0B+hCKLvDgZkL06VB3DLww3oXxAreS4U8DfIjFpU75oLhRVd1TZB7172PUvDCaBVYstMa79waStZhv8dgwwxYWoA/UvdzfG4HCMjp/bmMqvHz+HvxYzikGS7g39+mY9/gaw0r5aw8tyhIbcEmNoALxa1zNVjlDtcu8jUNQdwCHtKVyj05QkDcFUZQubUcgkWvFhQ759qeHezI8WPmvv4D3awF8WgY7Y5WZvYryYQ45TWmdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eSOiMAjs; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eSOiMAjs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 358 seconds by postgrey-1.37 at boromir; Tue, 20 Jan 2026 09:13:02 AEDT
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw4TV5Nqfz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:13:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0E9440346;
	Mon, 19 Jan 2026 22:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8B8C116C6;
	Mon, 19 Jan 2026 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768860780;
	bh=k70hQr63RUXGOh3ycwl6W+fn7/85Vw2c7ppPZ0urjfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSOiMAjsZs3jW1KvXp0g4mphAlSBZoZJIIxWDLwthIXy6fvkkLpXd8J2xHfChol+u
	 9lWtJ2L8NGA9nTrBp9IfiGkd8QEwLqu3CuE5ODDorYXu8dCC/dF9tuKxHIIEgkGpuR
	 1mt+syAX3esvNM0UqpS5Rthz+3u8U1SyXtdxdpqujAbw58o2YwjKwyAVaVfDvBw7Bn
	 2tmphoYbo6gSQ3V38Fkd/AHmSIIMk3SAuHfwKNThZPpEZd3Cku/s7U3oG65hiyItMJ
	 5mXALRbvdFiPXzDovY43E/e/q+LCWj9Ms4PwlT2h03DaF6J+YaxgYWYrcuS2Wh2wtp
	 KtM2AXkO85prQ==
Date: Mon, 19 Jan 2026 23:12:57 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Kieran Bingham <kbingham@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, linuxppc-dev@lists.ozlabs.org,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>, linux-pm@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Nicholas Piggin <npiggin@gmail.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH 00/15] tick/sched: Refactor idle cputime accounting
Message-ID: <aW6saYApHwG_cgn_@pavilion.home>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260119145330.GI830229@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20260119145330.GI830229@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Le Mon, Jan 19, 2026 at 03:53:30PM +0100, Peter Zijlstra a écrit :
> On Fri, Jan 16, 2026 at 03:51:53PM +0100, Frederic Weisbecker wrote:
> >  kernel/sched/cputime.c             | 302 +++++++++++++++++++++++++++++++------
> 
> My editor feels strongly about the below; with that it still has one
> complaint about paravirt_steal_clock() which does not have a proper
> declaration.

I guess it happens to be somehow included in the <linux/sched*.h> wave

> 
> 
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 7ff8dbec7ee3..248232fa6e27 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -2,6 +2,7 @@
>  /*
>   * Simple CPU accounting cgroup controller
>   */
> +#include <linux/sched/clock.h>
>  #include <linux/sched/cputime.h>
>  #include <linux/tsacct_kern.h>
>  #include "sched.h"

Ok I'll include that.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

