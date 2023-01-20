Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA96A675B16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:22:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz5sf5wnjz3fKJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:22:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kfdej4Nj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=lvek=5r=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kfdej4Nj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz5rl6MdDz2yw6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:21:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D486D62024;
	Fri, 20 Jan 2023 17:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F22C433A1;
	Fri, 20 Jan 2023 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674235301;
	bh=I1qTWw2OMTpCQGNS0oCnz+DeLugW7m0MkCxFsFb/Dak=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Kfdej4NjVMobPhJ3rE/PMAzza8oADmNlkGqiZYGqRvTSIUQdTHKRd6NHGGwNKg8g4
	 Wv67aWSm+XPbi1RBoo3IcSzQxQNxls+vkqagf4zovgJuG5e5YtyX6zoONtyfcnsHr/
	 MmszMAR/PoZVZaQ2ZUmMiK+VbMH8Nxupenpd4yEa4t3V07RSClxZbnlZ9l7Bxy/Eha
	 7l4dxYe+UKqgg6a7G6pQcoxZWuDHr9mOJgi4qoCp2cwXyt1YcH92lwoAsO8udPKTIu
	 N9GMcWwfBWm9lgbgj4KzGHOF1wWRo+bYyHu/V0BAlDo1pzAH3QCCu2hHfcUhjy3Azr
	 AmgM+CiHvme9Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8BB745C17DC; Fri, 20 Jan 2023 09:21:40 -0800 (PST)
Date: Fri, 20 Jan 2023 09:21:40 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <20230120172140.GL2948950@paulmck-ThinkPad-P17-Gen-1>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz>
 <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz>
 <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
 <CAJuCfpF20nuP6Meib9h7NVrJv+wybYS==vZFQXxUW6n-ir9bvQ@mail.gmail.com>
 <Y8rGJq8LvX2C+Cr7@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8rGJq8LvX2C+Cr7@casper.infradead.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.
 com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 04:49:42PM +0000, Matthew Wilcox wrote:
> On Fri, Jan 20, 2023 at 08:45:21AM -0800, Suren Baghdasaryan wrote:
> > On Fri, Jan 20, 2023 at 8:20 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > On Fri, Jan 20, 2023 at 12:52 AM Michal Hocko <mhocko@suse.com> wrote:
> > > >
> > > > On Thu 19-01-23 10:52:03, Suren Baghdasaryan wrote:
> > > > > On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > > >
> > > > > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > > > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > > > > > a list and free them in groups using one call_rcu() call per group.
> > > > > >
> > > > > > After some more clarification I can understand how call_rcu might not be
> > > > > > super happy about thousands of callbacks to be invoked and I do agree
> > > > > > that this is not really optimal.
> > > > > >
> > > > > > On the other hand I do not like this solution much either.
> > > > > > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > > > > > much with processes with a huge number of vmas either. It would still be
> > > > > > in housands of callbacks to be scheduled without a good reason.
> > > > > >
> > > > > > Instead, are there any other cases than remove_vma that need this
> > > > > > batching? We could easily just link all the vmas into linked list and
> > > > > > use a single call_rcu instead, no? This would both simplify the
> > > > > > implementation, remove the scaling issue as well and we do not have to
> > > > > > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> > > > >
> > > > > Yes, I agree the solution is not stellar. I wanted something simple
> > > > > but this is probably too simple. OTOH keeping all dead vm_area_structs
> > > > > on the list without hooking up a shrinker (additional complexity) does
> > > > > not sound too appealing either.
> > > >
> > > > I suspect you have missed my idea. I do not really want to keep the list
> > > > around or any shrinker. It is dead simple. Collect all vmas in
> > > > remove_vma and then call_rcu the whole list at once after the whole list
> > > > (be it from exit_mmap or remove_mt). See?
> > >
> > > Yes, I understood your idea but keeping dead objects until the process
> > > exits even when the system is low on memory (no shrinkers attached)
> > > seems too wasteful. If we do this I would advocate for attaching a
> > > shrinker.
> > 
> > Maybe even simpler, since we are hit with this VMA freeing flood
> > during exit_mmap (when all VMAs are destroyed), we pass a hint to
> > vm_area_free to batch the destruction and all other cases call
> > call_rcu()? I don't think there will be other cases of VMA destruction
> > floods.
> 
> ... or have two different call_rcu functions; one for munmap() and
> one for exit.  It'd be nice to use kmem_cache_free_bulk().

Good point, kfree_rcu(p, r) where "r" is the name of the rcu_head
structure's field, is much more cache-efficient.

The penalty is that there is no callback function to do any cleanup.
There is just a kfree()/kvfree (bulk version where applicable),
nothing else.

							Thanx, Paul
