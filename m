Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98D67D327
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:28:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2njm5J6mz3fGQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 04:28:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mlhONz+Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=tns5=5x=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mlhONz+Y;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2nhh08yzz3fJG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 04:27:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6C466B81EC1;
	Thu, 26 Jan 2023 17:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1273EC433D2;
	Thu, 26 Jan 2023 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674754047;
	bh=C9DPduSJN49w2aJL07oo9HEwA59sZ5h+51ZoAP6pWmk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=mlhONz+YVANknW+/iMcnirDtC6dO3xyzjm3nJYRzU0F6DqW7fAAdspeFnq5ApVpqU
	 Yq2FkJiO4Rua69tMlM7obKQe1TS/ks3E1MaxZDd3l887LTVFRbJ8rvRK50yA8rX+G5
	 2Zny67+NCrk54BZJVc9bzvkN1FLByAarCaE7ApKq663ecrkaK1jtFWgydyrP/dPKX4
	 WTnrYtu9O1KzwNfR52+J6AB18LXI7tjZLwpmcaKY9uLDYoSF8mrhXSFOSjs2Qux2us
	 Oz6TWX6/34uOAePk5LKHlLRPBoNFLhLl7wq+bmJrY1iACaf2t9Tjc26kiTWvRO6NB5
	 xlmU8DNaGJQyQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B2AE15C0510; Thu, 26 Jan 2023 09:27:26 -0800 (PST)
Date: Thu, 26 Jan 2023 09:27:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/7] kernel/fork: convert vma assignment to a memcpy
Message-ID: <20230126172726.GA682281@paulmck-ThinkPad-P17-Gen-1>
References: <20230125233554.153109-1-surenb@google.com>
 <20230125233554.153109-2-surenb@google.com>
 <20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
 <CAJuCfpG5HyMP3RM1jTJxCnN4WUz4APAcxbkOT48ZtJDXcb3z3w@mail.gmail.com>
 <20230125173449.5472cffc989dfab4b83c491d@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125173449.5472cffc989dfab4b83c491d@linux-foundation.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, elver@go, dave@stgolabs.net, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com
 , mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 05:34:49PM -0800, Andrew Morton wrote:
> On Wed, 25 Jan 2023 16:50:01 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> 
> > On Wed, Jan 25, 2023 at 4:22 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Wed, 25 Jan 2023 15:35:48 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > > Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
> > > > errors when we add a const modifier to vma->vm_flags.
> > > >
> > > > ...
> > > >
> > > > --- a/kernel/fork.c
> > > > +++ b/kernel/fork.c
> > > > @@ -482,7 +482,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> > > >                * orig->shared.rb may be modified concurrently, but the clone
> > > >                * will be reinitialized.
> > > >                */
> > > > -             *new = data_race(*orig);
> > > > +             memcpy(new, orig, sizeof(*new));
> > >
> > > The data_race() removal is unchangelogged?
> > 
> > True. I'll add a note in the changelog about that. Ideally I would
> > like to preserve it but I could not find a way to do that.
> 
> Perhaps Paul can comment?
> 
> I wonder if KCSAN knows how to detect this race, given that it's now in
> a memcpy.  I assume so.

I ran an experiment memcpy()ing between a static array and an onstack
array, and KCSAN did not complain.  But maybe I was setting it up wrong.

This is what I did:

	long myid = (long)arg; /* different value for each task */
	static unsigned long z1[10] = { 0 };
	unsigned long z2[10];

	...

	memcpy(z1, z2, ARRAY_SIZE(z1) * sizeof(z1[0]));
	for (zi = 0; zi < ARRAY_SIZE(z1); zi++)
		z2[zi] += myid;
	memcpy(z2, z1, ARRAY_SIZE(z1) * sizeof(z1[0]));

Adding Marco on CC for his thoughts.

						Thanx, Paul
