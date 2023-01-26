Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F167C274
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:35:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NZV0Ql1z3fLt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:35:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Tr9UkL55;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Tr9UkL55;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2NYZ5X6dz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:34:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2694EB819AD;
	Thu, 26 Jan 2023 01:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496BCC433D2;
	Thu, 26 Jan 2023 01:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1674696891;
	bh=LpGTjcYf1DlUk7PNdNctpyCzducpqUJJbAKNiV2Q0RE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tr9UkL55WPFPewbf2dotzPIKAx3TUEKfjFLxWUGCD+S5BxsFHlxSuYjj7eTneEzDy
	 hjItC983VD+8pWeiiEPpB/3tf8qK72AtPNlJOEAoyJ4PFNQKgIFIHrCqjg9SCXe9/M
	 V9Pk+Y+an8xv+9CG3ZO/wLQU0kLqEOBYfboAzw4o=
Date: Wed, 25 Jan 2023 17:34:49 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 1/7] kernel/fork: convert vma assignment to a memcpy
Message-Id: <20230125173449.5472cffc989dfab4b83c491d@linux-foundation.org>
In-Reply-To: <CAJuCfpG5HyMP3RM1jTJxCnN4WUz4APAcxbkOT48ZtJDXcb3z3w@mail.gmail.com>
References: <20230125233554.153109-1-surenb@google.com>
	<20230125233554.153109-2-surenb@google.com>
	<20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
	<CAJuCfpG5HyMP3RM1jTJxCnN4WUz4APAcxbkOT48ZtJDXcb3z3w@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, "Paul E. McKenney" <paulmck@kernel.org>, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman
 @techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Jan 2023 16:50:01 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> On Wed, Jan 25, 2023 at 4:22 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Wed, 25 Jan 2023 15:35:48 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > > Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
> > > errors when we add a const modifier to vma->vm_flags.
> > >
> > > ...
> > >
> > > --- a/kernel/fork.c
> > > +++ b/kernel/fork.c
> > > @@ -482,7 +482,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> > >                * orig->shared.rb may be modified concurrently, but the clone
> > >                * will be reinitialized.
> > >                */
> > > -             *new = data_race(*orig);
> > > +             memcpy(new, orig, sizeof(*new));
> >
> > The data_race() removal is unchangelogged?
> 
> True. I'll add a note in the changelog about that. Ideally I would
> like to preserve it but I could not find a way to do that.
> 

Perhaps Paul can comment?

I wonder if KCSAN knows how to detect this race, given that it's now in
a memcpy.  I assume so.
