Return-Path: <linuxppc-dev+bounces-12712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D08BC4846
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 13:13:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chVjt5Jd6z303F;
	Wed,  8 Oct 2025 22:13:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759922002;
	cv=none; b=bYsxUylAf9Eo7LiB4ayZp5GiHVZAx+5/tDpnYTRrwK9G5FwIk1d3Hw87WgEYM0eFVKCn6S6qzgeDNTHs6dEyVdC125WrwjigqLRHvhHcbsV+ouFsK7OYGmEvqfaD8ihzkiB+scT+I4KT0uEsMlzLJjiVpENJ3V+LIVbJSk4LV3og1aIf5LcOiEDqPu7WtYJlaOZYNFvz7cPQ3f79nN8t8MVA5PrBcpgRCKaX9Wwyko7NPo5UMhjTv8s9onk+JQqUItjDeJjB82WQka9Z14BdM6XRJr1wKoIJ8PIzuukMBFBHhTYVCNXb+pxheji/n1oOywWesIRan03Jfutsc02Jew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759922002; c=relaxed/relaxed;
	bh=tdDIVtOYGpm2++YgbsDVSjiZxnJfoMZtqbtSNzOB9kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dASMvbGPZMTxpniC6DsYXD84mPFC9S/5OLBjUeSONl+cM696/PXO+fDUsR7NL0zXEjgau7vWfLWLljWZmguU5ElHCz0rXCuj3TQHW6JmWdbyWdNIcwFa73UE6204Szg3lVtWAZJmHa61wyk0DLqqj3Rx5p1tsV65D38RqLML2I49e+T4+aYg+Aym9W81NFbY5qKbIhm0n1kTXzetdDQuLMSuFbXTSKKDNjXNP4v5VJdCqYQgmporydaayoVE5lXi68qNlwZgnHf4ERbPzd883qYOCBVbbesV//JdgW92NkqBFr1chXXlR37YTi36T9W/mICO95TAlbkS45VZqjCHnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NswvwVkB; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NswvwVkB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chVjq5V4pz2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 22:13:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tdDIVtOYGpm2++YgbsDVSjiZxnJfoMZtqbtSNzOB9kQ=; b=NswvwVkBptMaMcaLLNDJraO0Bh
	mQhVDp1UW00x1dp/H+LqT/PuWhQSihQwnbOF9akqqXSn6FS8Hy4zqB3XFeoZHhyesdQNjrKtv0ozS
	RCHU7guF9oZHXzSSkFfu1A1CDhtj4P/bEOGEpqjSF1/h6WlX38m/NfDhzPHh0qiqMOo4w9h2No42x
	i2kwadyqVdN7irBtCUVptwSyGiv9zhhwhi7cbhwbsiGaCrq7WtgM2QSYiZZbRcYq9fVvx+6vkLcD8
	Cufxj3v6VFXQrFaJrGaj499JktPsXWWkN/esrhZVMgmmRHRo7XhE8ovR+F13gYdiB3g0QG+LEtwkk
	PIEzWccQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6S6c-00000003eAk-3UjU;
	Wed, 08 Oct 2025 11:13:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EC92E300220; Wed, 08 Oct 2025 13:13:14 +0200 (CEST)
Date: Wed, 8 Oct 2025 13:13:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, jstultz@google.com,
	stultz@google.com
Subject: Re: [bisected][mainline]Kernel warnings at
 kernel/sched/cpudeadline.c:219
Message-ID: <20251008111314.GI3289052@noisy.programming.kicks-ass.net>
References: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
 <20251008095039.GG3245006@noisy.programming.kicks-ass.net>
 <5a248390-ddaa-4127-a58a-794d0d70461a@linux.ibm.com>
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
In-Reply-To: <5a248390-ddaa-4127-a58a-794d0d70461a@linux.ibm.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 08, 2025 at 03:47:16PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 10/8/25 3:20 PM, Peter Zijlstra wrote:
> > On Wed, Oct 08, 2025 at 07:41:10AM +0530, Venkat Rao Bagalkote wrote:
> > > Greetings!!!
> > > 
> > > 
> > > IBM CI has reported a kernel warnings while running CPU hot plug operation
> > > on IBM Power9 system.
> > > 
> > > 
> > > Command to reproduce the issue:
> > > 
> > > drmgr -c cpu -r -q 1
> > > 
> > > 
> > > Git Bisect is pointing to below commit as the first bad commit.
> > 
> > Does something like this help?
> > 
> > (also, for future reference, please don't line wrap logs, it makes them
> > very hard to read)
> > 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 198d2dd45f59..65f37bfcd661 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -8328,6 +8328,7 @@ static inline void sched_set_rq_offline(struct rq *rq, int cpu)
> >   		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> >   		set_rq_offline(rq);
> >   	}
> > +	dl_server_stop(&rq->fair_server);
> >   	rq_unlock_irqrestore(rq, &rf);
> >   }
> 
> 
> Hi Peter. Thanks for looking into it.
> 
> I was able to repro this issue on my system. This above diff didn't help. I still see the warning.
> 
> I have to understand this dl server stuff still.
> So not sure if my understanding is completely correct.
> 
> Looks like the hrtimer is firing after the cpu was removed. The warn on hit only with
> drmgr. Regular hotplug with chcpu doesn;t hit. That's because drmgr changes the cpu_present mask.
> and warning is hit with it.

I do not know what drmgr is. I am not familiar with PowerPC tools.
AFAICT x86 never modifies cpu_present_mask after boot.

> maybe during drmgr, the dl server gets started again? Maybe that's why above patch it didn't work.
> Will see and understand this bit more.

dl_server is per cpu and is started on enqueue of a fair task when:

  - the runqueue was empty; and
  - the dl_server wasn't already active

Once the dl_server is active it has this timer (you already found this),
this timer is set for the 0-laxity moment (the last possible moment in
time where it can still run its budget and not be late), during this
time any fair runtime is accounted against it budget (subtracted from).

Once the timer fires and it still has budget left; it will enqueue the
deadline entity. However the more common case is that its budget will be
depleted, in which case the timer is reset to its period end for
replenish (where it gets new runtime budget), after which its back to
the 0-laxity.

If the deadline entity gets scheduled, it will try and pick a fair task
and run that. In the case where there is no fair task, it will
deactivate itself.

The patch I sent earlier would force stop the deadline timer on CPU
offline.


> Also, i tried this below diff which fixes it. Just ignore the hrtimer if the cpu is offline.
> Does this makes sense?
> ---
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 615411a0a881..a342cf5e4624 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1160,6 +1160,9 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
>  	scoped_guard (rq_lock, rq) {
>  		struct rq_flags *rf = &scope.rf;
> +		if (!cpu_online(rq->cpu))
> +			return HRTIMER_NORESTART;
> +
>  		if (!dl_se->dl_throttled || !dl_se->dl_runtime)
>  			return HRTIMER_NORESTART;

This could leave the dl_server in inconsistent state. It would have to
call dl_server_stop() or something along those lines.

Also, this really should not happen; per my previous patch we should be
stopping the timer when we go offline.

Since you can readily reproduce this; perhaps you could stick something
like this in dl_server_start():

	WARN_ON_ONCE(!cpu_online(rq->cpu))

See if anybody is (re)starting the thing ?


