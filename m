Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400B67598E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 17:09:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz4FM0sKBz3fJP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 03:09:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hjm+fR7l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=lvek=5r=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hjm+fR7l;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz4DN1dVcz3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 03:08:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12B4161FE5;
	Fri, 20 Jan 2023 16:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D17CC433D2;
	Fri, 20 Jan 2023 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674230912;
	bh=l+Ax8n5nsemwAAmfAXhYYe/dbUQh2EPit95uZHw42Mg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hjm+fR7lK+KW1tSyt9SI4OCbh/B22uL761f7Rdogw9S21bTCKacSNGlrC5t1rx3RP
	 D8/Om6iWcNgRjJEMTRMM5ZpU/Td2mWlAy/UZdfn6/LuGuKqnAbkpLsSehhLW4yHvk3
	 h1BMr23yJiqKbI99fg6yZIhrbWL2xZKsoCk0gasd1J5urIsRsi6zgm+AA6t+FNr4E3
	 3spHrjCEmcPLRy6yCMUrdRhCiXicFDAoBo/qpKeiGmRh8/SDXkGSiIiBAUEeC1kwqN
	 i2zkRryRjeLO5m2NP2YARZcZ0rHoJw1ZeEdEvcfyTDEz4i67fFWWtD5qC3xEhKeUGo
	 VDR//jFwVWPJw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0599F5C0DFC; Fri, 20 Jan 2023 08:08:32 -0800 (PST)
Date: Fri, 20 Jan 2023 08:08:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <20230120160831.GK2948950@paulmck-ThinkPad-P17-Gen-1>
References: <20230109205336.3665937-40-surenb@google.com>
 <Y8bFdB47JT/luMld@dhcp22.suse.cz>
 <CAJuCfpHVYW5aBVmT0vwn+j=m=Jo2KhSTzgVtxSEusUZJdzetUA@mail.gmail.com>
 <Y8fApgKJaTs9nrPO@dhcp22.suse.cz>
 <CAJuCfpERMyQc96Z5Qn9RFK0UD7fNugZE4DujFs4xqFWM8T6EqA@mail.gmail.com>
 <20230118183447.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <CAJuCfpHZuKq45FL1gs+=rx5s2AOaZ9TPC1bdAWjYzfkrOABTOw@mail.gmail.com>
 <Y8k8/vPGXBvyHLJE@dhcp22.suse.cz>
 <20230119191707.GW2948950@paulmck-ThinkPad-P17-Gen-1>
 <Y8pXYebD300t2uqU@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8pXYebD300t2uqU@dhcp22.suse.cz>
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
Reply-To: paulmck@kernel.org
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorma
 n@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 09:57:05AM +0100, Michal Hocko wrote:
> On Thu 19-01-23 11:17:07, Paul E. McKenney wrote:
> > On Thu, Jan 19, 2023 at 01:52:14PM +0100, Michal Hocko wrote:
> > > On Wed 18-01-23 11:01:08, Suren Baghdasaryan wrote:
> > > > On Wed, Jan 18, 2023 at 10:34 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > [...]
> > > > > There are a couple of possibilities here.
> > > > >
> > > > > First, if I am remembering correctly, the time between the call_rcu()
> > > > > and invocation of the corresponding callback was taking multiple seconds,
> > > > > but that was because the kernel was built with CONFIG_LAZY_RCU=y in
> > > > > order to save power by batching RCU work over multiple call_rcu()
> > > > > invocations.  If this is causing a problem for a given call site, the
> > > > > shiny new call_rcu_hurry() can be used instead.  Doing this gets back
> > > > > to the old-school non-laziness, but can of course consume more power.
> > > > 
> > > > That would not be the case because CONFIG_LAZY_RCU was not an option
> > > > at the time I was profiling this issue.
> > > > Laxy RCU would be a great option to replace this patch but
> > > > unfortunately it's not the default behavior, so I would still have to
> > > > implement this batching in case lazy RCU is not enabled.
> > > > 
> > > > >
> > > > > Second, there is a much shorter one-jiffy delay between the call_rcu()
> > > > > and the invocation of the corresponding callback in kernels built with
> > > > > either CONFIG_NO_HZ_FULL=y (but only on CPUs mentioned in the nohz_full
> > > > > or rcu_nocbs kernel boot parameters) or CONFIG_RCU_NOCB_CPU=y (but only
> > > > > on CPUs mentioned in the rcu_nocbs kernel boot parameters).  The purpose
> > > > > of this delay is to avoid lock contention, and so this delay is incurred
> > > > > only on CPUs that are queuing callbacks at a rate exceeding 16K/second.
> > > > > This is reduced to a per-jiffy limit, so on a HZ=1000 system, a CPU
> > > > > invoking call_rcu() at least 16 times within a given jiffy will incur
> > > > > the added delay.  The reason for this delay is the use of a separate
> > > > > ->nocb_bypass list.  As Suren says, this bypass list is used to reduce
> > > > > lock contention on the main ->cblist.  This is not needed in old-school
> > > > > kernels built without either CONFIG_NO_HZ_FULL=y or CONFIG_RCU_NOCB_CPU=y
> > > > > (including most datacenter kernels) because in that case the callbacks
> > > > > enqueued by call_rcu() are touched only by the corresponding CPU, so
> > > > > that there is no need for locks.
> > > > 
> > > > I believe this is the reason in my profiled case.
> > > > 
> > > > >
> > > > > Third, if you are instead seeing multiple milliseconds of CPU consumed by
> > > > > call_rcu() in the common case (for example, without the aid of interrupts,
> > > > > NMIs, or SMIs), please do let me know.  That sounds to me like a bug.
> > > > 
> > > > I don't think I've seen such a case.
> > > > Thanks for clarifications, Paul!
> > > 
> > > Thanks for the explanation Paul. I have to say this has caught me as a
> > > surprise. There are just not enough details about the benchmark to
> > > understand what is going on but I find it rather surprising that
> > > call_rcu can induce a higher overhead than the actual kmem_cache_free
> > > which is the callback. My naive understanding has been that call_rcu is
> > > really fast way to defer the execution to the RCU safe context to do the
> > > final cleanup.
> > 
> > If I am following along correctly (ha!), then your "induce a higher
> > overhead" should be something like "induce a higher to-kfree() latency".
> 
> Yes, this is expected.
> 
> > Of course, there already is a higher latency-to-kfree via call_rcu()
> > than via a direct call to kfree(), and callback-offload CPUs that are
> > being flooded with callbacks raise that latency a jiffy or so more in
> > order to avoid lock contention.
> > 
> > If this becomes a problem, the callback-offloading code can be a bit
> > smarter about avoiding lock contention, but need to see a real problem
> > before I make that change.  But if there is a real problem I will of
> > course fix it.
> 
> I believe that Suren claims that the call_rcu is really visible in the
> exit_mmap case. Time-to-free actual vmas shouldn't really be material
> for that path. If that happens much more later on there could be some
> side effects by an increased memory consumption but that should be
> marginal. How fast exit_mmap really is should only depend on direct
> calls from that path.
> 
> But I guess we need some specific numbers from Suren to be sure what is
> going on here.

Actually, Suren did discuss these (perhaps offlist) back in August.
I was just being forgetful.  :-/

							Thanx, Paul
