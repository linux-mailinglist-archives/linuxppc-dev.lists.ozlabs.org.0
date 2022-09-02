Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D25AA80A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 08:30:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJp1T37nVz3bk0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 16:30:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OMPrOq4c;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=HZtJcpa5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OMPrOq4c;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=HZtJcpa5;
	dkim-atps=neutral
X-Greylist: delayed 326 seconds by postgrey-1.36 at boromir; Fri, 02 Sep 2022 16:29:30 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJp0p2sgdz2xJB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 16:29:30 +1000 (AEST)
Date: Fri, 2 Sep 2022 08:23:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1662099829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNXlO5JIHjp6Q9jkavDrFQejyN8sLjCcSCk1NEtTtuM=;
	b=OMPrOq4cuXJfi3PPbr2inQsDbGefNlbzrD4jouWOIgow8vmRqFSG1Qde/Jtd+tU5Zi9HbP
	y5Rl4zWgJJWrLwvNM1o2KoEgrxKoOs4dnhnEyqQ6BwseLzpDdvtslBatTN8FexHTwF1paE
	s3nuKNJYza/SG+GQHTwUGmT2gqRA700qnp+5GNGzUOMLwjA/KOuhe0RxdqvV3pXmqtG0SH
	isTrll9jCcqe5YX72qG/+E+TY/QgT3TR264Lu2tiUvdxSk+tKPGrrOi+meq1I5WOHhk713
	/813tDIEMC5vjBbVcN7W5qzEmI2KTZlSl4uvg3MO+EPzyT9SuNFGYVRrO8VI4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1662099829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNXlO5JIHjp6Q9jkavDrFQejyN8sLjCcSCk1NEtTtuM=;
	b=HZtJcpa5vxYATLgUzjtVGzhwNVCLOeNDJ+ONSgS5kxaY8UkTVlSUh1wXMjdIyoPHKWkhdp
	d1pb5xRDehd/PUDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: [RFC PATCH RESEND 04/28] mm: move mmap_lock assert function
 definitions
Message-ID: <YxGhcnKyV7KCiWCJ@linutronix.de>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-5-surenb@google.com>
 <20220901202409.e2fqegqghlijkzey@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220901202409.e2fqegqghlijkzey@moria.home.lan>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-09-01 16:24:09 [-0400], Kent Overstreet wrote:
> > --- a/include/linux/mmap_lock.h
> > +++ b/include/linux/mmap_lock.h
> > @@ -60,6 +60,18 @@ static inline void __mmap_lock_trace_released(struct mm_struct *mm, bool write)
> >  
> >  #endif /* CONFIG_TRACING */
> >  
> > +static inline void mmap_assert_locked(struct mm_struct *mm)
> > +{
> > +	lockdep_assert_held(&mm->mmap_lock);
> > +	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
> 
> These look redundant to me - maybe there's a reason the VM developers want both,
> but I would drop the VM_BUG_ON() and just keep the lockdep_assert_held(), since
> that's the standard way to write that assertion.

Exactly. rwsem_is_locked() returns true only if the lock is "locked" not
necessary by the caller. lockdep_assert_held() checks that the lock is
locked by the caller - this is the important part.

Sebastian
