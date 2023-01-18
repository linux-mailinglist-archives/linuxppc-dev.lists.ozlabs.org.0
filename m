Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B567114D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 03:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxVWY0dGkz3c8t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 13:46:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=LgtkpNzs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=LgtkpNzs;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxVVZ6M1Gz3bfK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 13:45:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MGpdnLSCsy4iJTcYeMqTf0hkShjXgJaZl556rybxYcc=; b=LgtkpNzsFyaJdmFoM4zFTvjFAt
	Ao0YdH63TZt9RuzJ6Jp2atj9NKcViphPYwdS+B9R56VTZ6LdgTBITlFfMh6TzB/XcRGNXjsOOtgu6
	aIPuxzOdZSS0yVjg747/T0PwNU+0/508fiqbDMy2yO/t7mf0IfznrHag7q8RjS5XJVA4VMfqYuwl0
	ulHk6RyXVZHBP8284w9PmU5Ys9jP5MaL1tYqADfmpXKvKQXHiR+iAXVdGRcYnzrfwH8PupJzp9apk
	+hGZy6biK6xGQhULog6BkfaGpEdf2xnt5Y/7Oy5OU1xCO7Ns1R6g+Y5KfUc2AdfpOCbogT6bTwOeC
	bnYjNyHg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyRY-00AHX7-0B; Wed, 18 Jan 2023 02:44:52 +0000
Date: Wed, 18 Jan 2023 02:44:51 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 28/41] mm: introduce lock_vma_under_rcu to be used from
 arch-specific code
Message-ID: <Y8ddI7vcKw8oecsr@casper.infradead.org>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-29-surenb@google.com>
 <Y8bDAVC/aiL9tCyz@dhcp22.suse.cz>
 <CAJuCfpHRRsUMNHp2H3UiB4EZbe9CXTVcAC+oOR1dscENjp1Jbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHRRsUMNHp2H3UiB4EZbe9CXTVcAC+oOR1dscENjp1Jbw@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsin
 gularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 05:06:57PM -0800, Suren Baghdasaryan wrote:
> On Tue, Jan 17, 2023 at 7:47 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 09-01-23 12:53:23, Suren Baghdasaryan wrote:
> > > Introduce lock_vma_under_rcu function to lookup and lock a VMA during
> > > page fault handling. When VMA is not found, can't be locked or changes
> > > after being locked, the function returns NULL. The lookup is performed
> > > under RCU protection to prevent the found VMA from being destroyed before
> > > the VMA lock is acquired. VMA lock statistics are updated according to
> > > the results.
> > > For now only anonymous VMAs can be searched this way. In other cases the
> > > function returns NULL.
> >
> > Could you describe why only anonymous vmas are handled at this stage and
> > what (roughly) has to be done to support other vmas? lock_vma_under_rcu
> > doesn't seem to have any anonymous vma specific requirements AFAICS.
> 
> TBH I haven't spent too much time looking into file-backed page faults
> yet but a couple of tasks I can think of are:
> - Ensure that all vma->vm_ops->fault() handlers do not rely on
> mmap_lock being read-locked;

I think this way lies madness.  There are just too many device drivers
that implement ->fault.  My plan is to call the ->map_pages() method
under RCU without even read-locking the VMA.  If that doesn't satisfy
the fault, then drop all the way back to taking the mmap_sem for read
before calling into ->fault.

