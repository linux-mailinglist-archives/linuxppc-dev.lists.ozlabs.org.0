Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8037A8657
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 16:17:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=mmU68D+o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrLFv3wNmz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 00:17:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=mmU68D+o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrLF01Mryz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 00:16:34 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 645631FF2C;
	Wed, 20 Sep 2023 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1695219391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r92pwsodrWk5oBqS0cdXZqSV+7pX7kIETuIqrWvBLxw=;
	b=mmU68D+oiMP6qLaksJbVOllJtvqq3pC6gnjPZrXOrfE1pwxFiR5I04VDxOur1T2CQDwUge
	qALZqqcIWoAGIFzbq2D/px5SX0jXeHt7kGfZHgIn3e7nleqc04SrXlC2xr3KWvRcqTB2BF
	oJbg+r9VMCXwSy1GVHr/ioG3gI2kCJU=
Received: from suse.cz (pmladek.tcp.ovpn2.prg.suse.de [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id A3EF32C142;
	Wed, 20 Sep 2023 14:16:30 +0000 (UTC)
Date: Wed, 20 Sep 2023 16:16:30 +0200
From: Petr Mladek <pmladek@suse.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: Recent Power changes and stack_trace_save_tsk_reliable?
Message-ID: <ZQr-vmBBQ66TRobQ@alley>
References: <ZO4K6hflM/arMjse@redhat.com>
 <87o7ipxtdc.fsf@mail.lhotse>
 <87il8xxcg7.fsf@mail.lhotse>
 <cca0770c-1510-3a02-d0ba-82ee5a0ae4f2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cca0770c-1510-3a02-d0ba-82ee5a0ae4f2@redhat.com>
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
Cc: Ryan Sullivan <rysulliv@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, live-patching@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2023-08-30 17:47:35, Joe Lawrence wrote:
> On 8/30/23 02:37, Michael Ellerman wrote:
> > Michael Ellerman <mpe@ellerman.id.au> writes:
> >> Joe Lawrence <joe.lawrence@redhat.com> writes:
> >>> Hi ppc-dev list,
> >>>
> >>> We noticed that our kpatch integration tests started failing on ppc64le
> >>> when targeting the upstream v6.4 kernel, and then confirmed that the
> >>> in-tree livepatching kselftests similarly fail, too.  From the kselftest
> >>> results, it appears that livepatch transitions are no longer completing.
> >>
> >> Hi Joe,
> >>
> >> Thanks for the report.
> >>
> >> I thought I was running the livepatch tests, but looks like somewhere
> >> along the line my kernel .config lost CONFIG_TEST_LIVEPATCH=m, so I have
> >> been running the test but it just skips. :/
> >>
> 
> That config option is easy to drop if you use `make localmodconfig` to
> try and expedite the builds :D  Been there, done that too many times.
> 
> >> I can reproduce the failure, and will see if I can bisect it more
> >> successfully.
> > 
> > It's caused by:
> > 
> >   eed7c420aac7 ("powerpc: copy_thread differentiate kthreads and user mode threads")
> > 
> > Which is obvious in hindsight :)
> > 
> > The diff below fixes it for me, can you test that on your setup?
> > 
> 
> Thanks for the fast triage of this one.  The proposed fix works well on
> our setup.  I have yet to try the kpatch integration tests with this,
> but I can verify that all of the kernel livepatching kselftests now
> happily run.

Have this been somehow handled, please? I do not see the proposed
change in linux-next as of now.

> > A proper fix will need to be a bit bigger because the comments in there
> > are all slightly wrong now since the above commit.
> > 
> > Possibly we can also rework that code more substantially now that
> > copy_thread() is more careful about setting things up, but that would be
> > a follow-up.
> > 
> > diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> > index 5de8597eaab8..d0b3509f13ee 100644
> > --- a/arch/powerpc/kernel/stacktrace.c
> > +++ b/arch/powerpc/kernel/stacktrace.c
> > @@ -73,7 +73,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
> >  	bool firstframe;
> >  
> >  	stack_end = stack_page + THREAD_SIZE;
> > -	if (!is_idle_task(task)) {
> > +	if (!(task->flags & PF_KTHREAD)) {
> >  		/*
> >  		 * For user tasks, this is the SP value loaded on
> >  		 * kernel entry, see "PACAKSAVE(r13)" in _switch() and

If I read the change in the commit eed7c420aac7fde ("powerpc: copy_thread
differentiate kthreads and user mode threads") correctly then the
above fix is correct.

It is probably just enough to update the comment about that
STACK_FRAME_MIN_SIZE is used by all kthreads.

Best Regards,
Petr
