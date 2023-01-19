Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6CF6738FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 13:53:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyMxK0fXyz3fGC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 23:53:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=uHFXZnGw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=uHFXZnGw;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyMwM3ZNfz3bXP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 23:52:18 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 144CD5CDCC;
	Thu, 19 Jan 2023 12:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674132735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WjnBtS+tWF2y+b/Ndk23xVEsnNoyBzklntYtG4WzfME=;
	b=uHFXZnGwRsIQkOAXvNc5r12Q8Zjx2e1IZnmxixDECtV/in4b7NwxXomeAGlDi6OtCDRXDa
	dtvKDLvhExTrXALBacIHpSO15pgEQvgikygHOliJ8ytuR2BXMAU/cs4QzXNA9SPokcCXHP
	iYzdodWW/Wcksac0HQ4vT5akJUfYwkQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD37F139ED;
	Thu, 19 Jan 2023 12:52:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id v22dNf48yWPMbAAAMHmgww
	(envelope-from <mhocko@suse.com>); Thu, 19 Jan 2023 12:52:14 +0000
Date: Thu, 19 Jan 2023 13:52:14 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <Y8k8/vPGXBvyHLJE@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-40-surenb@google.com>
 <Y8bFdB47JT/luMld@dhcp22.suse.cz>
 <CAJuCfpHVYW5aBVmT0vwn+j=m=Jo2KhSTzgVtxSEusUZJdzetUA@mail.gmail.com>
 <Y8fApgKJaTs9nrPO@dhcp22.suse.cz>
 <CAJuCfpERMyQc96Z5Qn9RFK0UD7fNugZE4DujFs4xqFWM8T6EqA@mail.gmail.com>
 <20230118183447.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <CAJuCfpHZuKq45FL1gs+=rx5s2AOaZ9TPC1bdAWjYzfkrOABTOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHZuKq45FL1gs+=rx5s2AOaZ9TPC1bdAWjYzfkrOABTOw@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 18-01-23 11:01:08, Suren Baghdasaryan wrote:
> On Wed, Jan 18, 2023 at 10:34 AM Paul E. McKenney <paulmck@kernel.org> wrote:
[...]
> > There are a couple of possibilities here.
> >
> > First, if I am remembering correctly, the time between the call_rcu()
> > and invocation of the corresponding callback was taking multiple seconds,
> > but that was because the kernel was built with CONFIG_LAZY_RCU=y in
> > order to save power by batching RCU work over multiple call_rcu()
> > invocations.  If this is causing a problem for a given call site, the
> > shiny new call_rcu_hurry() can be used instead.  Doing this gets back
> > to the old-school non-laziness, but can of course consume more power.
> 
> That would not be the case because CONFIG_LAZY_RCU was not an option
> at the time I was profiling this issue.
> Laxy RCU would be a great option to replace this patch but
> unfortunately it's not the default behavior, so I would still have to
> implement this batching in case lazy RCU is not enabled.
> 
> >
> > Second, there is a much shorter one-jiffy delay between the call_rcu()
> > and the invocation of the corresponding callback in kernels built with
> > either CONFIG_NO_HZ_FULL=y (but only on CPUs mentioned in the nohz_full
> > or rcu_nocbs kernel boot parameters) or CONFIG_RCU_NOCB_CPU=y (but only
> > on CPUs mentioned in the rcu_nocbs kernel boot parameters).  The purpose
> > of this delay is to avoid lock contention, and so this delay is incurred
> > only on CPUs that are queuing callbacks at a rate exceeding 16K/second.
> > This is reduced to a per-jiffy limit, so on a HZ=1000 system, a CPU
> > invoking call_rcu() at least 16 times within a given jiffy will incur
> > the added delay.  The reason for this delay is the use of a separate
> > ->nocb_bypass list.  As Suren says, this bypass list is used to reduce
> > lock contention on the main ->cblist.  This is not needed in old-school
> > kernels built without either CONFIG_NO_HZ_FULL=y or CONFIG_RCU_NOCB_CPU=y
> > (including most datacenter kernels) because in that case the callbacks
> > enqueued by call_rcu() are touched only by the corresponding CPU, so
> > that there is no need for locks.
> 
> I believe this is the reason in my profiled case.
> 
> >
> > Third, if you are instead seeing multiple milliseconds of CPU consumed by
> > call_rcu() in the common case (for example, without the aid of interrupts,
> > NMIs, or SMIs), please do let me know.  That sounds to me like a bug.
> 
> I don't think I've seen such a case.
> Thanks for clarifications, Paul!

Thanks for the explanation Paul. I have to say this has caught me as a
surprise. There are just not enough details about the benchmark to
understand what is going on but I find it rather surprising that
call_rcu can induce a higher overhead than the actual kmem_cache_free
which is the callback. My naive understanding has been that call_rcu is
really fast way to defer the execution to the RCU safe context to do the
final cleanup.
-- 
Michal Hocko
SUSE Labs
