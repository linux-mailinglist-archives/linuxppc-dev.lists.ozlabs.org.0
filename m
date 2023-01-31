Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322D2683A3F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 00:13:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P617606krz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 10:13:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Ve2cEcLb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Ve2cEcLb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P61685K2Lz3cDF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 10:12:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CB486173D;
	Tue, 31 Jan 2023 23:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268AFC433D2;
	Tue, 31 Jan 2023 23:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1675206731;
	bh=UD5aYgT6pPerwqmRX863s/i9h3g4RLRQIlQIVcQeK9k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ve2cEcLbfkgODWpke5wSo2CRG70LKa3nC9kSoeM1J6Qf6HyPThzORd9pAHW+/ObyJ
	 vCHmRnUh+D8kgZIyNeYV8qZeoc3ilj+qhFfDGjLQUQZHVm2EV2x3+XEgXDtOKDRtmS
	 RAr+qeOOsyKdPonLaBLNkJ9fISBaTBrXqLFvmr5M=
Date: Tue, 31 Jan 2023 15:12:09 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 4/7] mm: replace vma->vm_flags direct modifications
 with modifier calls
Message-Id: <20230131151209.d53ba65c3c065979808d9912@linux-foundation.org>
In-Reply-To: <CAJuCfpHmtkzrKx45SQQ0gXLoybtgHxHmTP5J4L74ChTqSfFA-g@mail.gmail.com>
References: <20230126193752.297968-1-surenb@google.com>
	<20230126193752.297968-5-surenb@google.com>
	<Y9jSFFeHYZE1/yFg@hyeyoo>
	<CAJuCfpEzaVkgQt=C-33jAh1vLVJAjoyM8X5AD9CzyDUJnPDCkw@mail.gmail.com>
	<20230131125355.f07f42af56b23bfa28b2a58c@linux-foundation.org>
	<CAJuCfpHmtkzrKx45SQQ0gXLoybtgHxHmTP5J4L74ChTqSfFA-g@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Sebastian Reichel <sebastian.reichel@collabora.com>, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, h
 annes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 Jan 2023 13:08:19 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> On Tue, Jan 31, 2023 at 12:54 PM Andrew Morton
> <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 31 Jan 2023 10:54:22 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > > > > -             vma->vm_flags &= ~VM_MAYWRITE;
> > > > > +             vm_flags_clear(vma, VM_MAYSHARE);
> > > > >       }
> > > >
> > > > I think it should be:
> > > >         s/VM_MAYSHARE/VM_MAYWRITE/
> > >
> >
> > I added the fixup.  Much better than resending a seven patch series for a
> > single line change.  Unless you have substantial other changes pending.
> 
> Thanks! That sounds reasonable.
> 
> I'll also need to introduce vm_flags_reset_once() to use in
> replacement of WRITE_ONCE(vma->vm_flags, newflags) case. Should I send
> a separate short patch for that?

That depends on what the patch looks like.  How about you send it
and we'll see?
