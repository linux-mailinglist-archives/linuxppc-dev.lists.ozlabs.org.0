Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80306742A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 20:20:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyXXh5W3Fz3fHS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 06:20:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZFSCrOD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=mfk3=5q=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZFSCrOD;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyXWp6SFpz308w
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 06:20:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A9CEB80763;
	Thu, 19 Jan 2023 19:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32D4C433F0;
	Thu, 19 Jan 2023 19:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674156002;
	bh=sNtFF/n9MnZh/97jwulEfUXTbaxJQPrJ55JS7ZpWQ8A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=GZFSCrODvWxbeYJIxgxvUyLH5Bhha6cEF9ov6eaWW972FVwxQeMbcwRyDHwfbqatd
	 P+lNv8xWOCofVqyXl8boy2P+eIVwPkIxaXJx5Mnmck6tlpuHh3bCM08xuLF3UssXLw
	 nyEJeHwbrLPEdL41bo1JPvo+KlSP+mGoRoqvqvXTnUuzNGWwFcHIUkEszYMJTrLIX8
	 m9v6OwccgV9ALZdgTrAmRxHhoaUxoeNrZ/jjI3dMs8rcbqYmMHmxZNqetFqn81O0HS
	 lAGAVg0qzxG943YwiktwaXoRb8EQm5WIN9BqRqpuUPxzTkfw8PedrY4/ToF2MJHls3
	 o+f0eY20owrdQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5E4BB5C1A49; Thu, 19 Jan 2023 11:20:02 -0800 (PST)
Date: Thu, 19 Jan 2023 11:20:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <20230119192002.GX2948950@paulmck-ThinkPad-P17-Gen-1>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz>
 <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsi
 ngularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023 at 10:52:03AM -0800, Suren Baghdasaryan wrote:
> On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > call_rcu() can take a long time when callback offloading is enabled.
> > > Its use in the vm_area_free can cause regressions in the exit path when
> > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > a list and free them in groups using one call_rcu() call per group.
> >
> > After some more clarification I can understand how call_rcu might not be
> > super happy about thousands of callbacks to be invoked and I do agree
> > that this is not really optimal.
> >
> > On the other hand I do not like this solution much either.
> > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > much with processes with a huge number of vmas either. It would still be
> > in housands of callbacks to be scheduled without a good reason.
> >
> > Instead, are there any other cases than remove_vma that need this
> > batching? We could easily just link all the vmas into linked list and
> > use a single call_rcu instead, no? This would both simplify the
> > implementation, remove the scaling issue as well and we do not have to
> > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> 
> Yes, I agree the solution is not stellar. I wanted something simple
> but this is probably too simple. OTOH keeping all dead vm_area_structs
> on the list without hooking up a shrinker (additional complexity) does
> not sound too appealing either. WDYT about time domain throttling to
> limit draining the list to say once per second like this:
> 
> void vm_area_free(struct vm_area_struct *vma)
> {
>        struct mm_struct *mm = vma->vm_mm;
>        bool drain;
> 
>        free_anon_vma_name(vma);
> 
>        spin_lock(&mm->vma_free_list.lock);
>        list_add(&vma->vm_free_list, &mm->vma_free_list.head);
>        mm->vma_free_list.size++;
> -       drain = mm->vma_free_list.size > VM_AREA_FREE_LIST_MAX;
> +       drain = jiffies > mm->last_drain_tm + HZ;
> 
>        spin_unlock(&mm->vma_free_list.lock);
> 
> -       if (drain)
> +       if (drain) {
>               drain_free_vmas(mm);
> +             mm->last_drain_tm = jiffies;
> +       }
> }
> 
> Ultimately we want to prevent very frequent call_rcu() calls, so
> throttling in the time domain seems appropriate. That's the simplest
> way I can think of to address your concern about a quick spike in VMA
> freeing. It does not place any restriction on the list size and we
> might have excessive dead vm_area_structs if after a large spike there
> are no vm_area_free() calls but I don't know if that's a real problem,
> so not sure we should be addressing it at this time. WDYT?

Just to double-check, we really did try the very frequent call_rcu()
invocations and we really did see a problem, correct?

Although it is not perfect, call_rcu() is designed to take a fair amount
of abuse.  So if we didn't see a real problem, the frequent call_rcu()
invocations might be a bit simpler.

							Thanx, Paul
