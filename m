Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75915670D0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 00:16:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxPsl1r5tz3cdL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 10:16:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=L/0tR0eK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=L/0tR0eK;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxPrn59zDz3c6S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 10:15:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=10ybaKGDEMNrZJwsXfzl1FfnbRmTCPN7YpUINfERZ28=; b=L/0tR0eKtGHYZtRFgbb4J/TazM
	jwcMUPJtwquGQc7O2qRObrMoc3DbrRyrPw6llbDvvKc5YR+S8oxReiTZyiHgud38bANV1BvJGVmPw
	ZBreiPK44g//2XbqFyhvcLxFA1G4radxeNrEsltk3gFb/MO2+7BwuQfND0zlYFjiNrTO0iqmTMIHY
	6uf/lY6WYjCAp8nD1X/48axQ/8Csodfz/VbklYybkBH7olSZLVzmpCcW0/EEe0ND1WhiDbhXowLYY
	zk0RSsGT5eOn/3NHhN6A1QjXlTe2kTSyOLUzIG/lzVj7BI/KNG2VFr2sJfBSsh9nGSt7w8KZzyYH5
	BUnxXFnw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHvAp-00A86K-5N; Tue, 17 Jan 2023 23:15:23 +0000
Date: Tue, 17 Jan 2023 23:15:23 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
Message-ID: <Y8csC2Jgzx4Gt7n0@casper.infradead.org>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-13-surenb@google.com>
 <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com>
 <CAJuCfpHawn-hj3yK6MEMHsvnH9xgO87h7Sj3_g0FA7rgut_mVg@mail.gmail.com>
 <CAG48ez3sCwasFzKD5CsqMFA2W57-2fazd75g7r0NaA_BVNTLow@mail.gmail.com>
 <CAJuCfpFDyt2ZBGufhRz6oz2E=oyO47-d7BHwSeOiexD+UQ08jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpFDyt2ZBGufhRz6oz2E=oyO47-d7BHwSeOiexD+UQ08jA@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Will Deacon <will@kernel.org>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, Jann Horn <jannh@google.com>, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akp
 m@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 02:36:47PM -0800, Suren Baghdasaryan wrote:
> On Tue, Jan 17, 2023 at 1:46 PM Jann Horn <jannh@google.com> wrote:
> > On Tue, Jan 17, 2023 at 10:28 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > On Tue, Jan 17, 2023 at 10:03 AM Jann Horn <jannh@google.com> wrote:
> > > > One thing that might be gnarly here is that I think you might not be
> > > > allowed to use up_read() to fully release ownership of an object -
> > > > from what I remember, I think that up_read() (unlike something like
> > > > spin_unlock()) can access the lock object after it's already been
> > > > acquired by someone else. So if you want to protect against concurrent
> > > > deletion, this might have to be something like:
> > > >
> > > > rcu_read_lock(); /* keeps vma alive */
> > > > up_read(&vma->lock);
> > > > rcu_read_unlock();
> > >
> > > But for deleting VMA one would need to write-lock the vma->lock first,
> > > which I assume can't happen until this up_read() is complete. Is that
> > > assumption wrong?
> >
> > __up_read() does:
> >
> > rwsem_clear_reader_owned(sem);
> > tmp = atomic_long_add_return_release(-RWSEM_READER_BIAS, &sem->count);
> > DEBUG_RWSEMS_WARN_ON(tmp < 0, sem);
> > if (unlikely((tmp & (RWSEM_LOCK_MASK|RWSEM_FLAG_WAITERS)) ==
> >       RWSEM_FLAG_WAITERS)) {
> >   clear_nonspinnable(sem);
> >   rwsem_wake(sem);
> > }
> >
> > The atomic_long_add_return_release() is the point where we are doing
> > the main lock-releasing.
> >
> > So if a reader dropped the read-lock while someone else was waiting on
> > the lock (RWSEM_FLAG_WAITERS) and no other readers were holding the
> > lock together with it, the reader also does clear_nonspinnable() and
> > rwsem_wake() afterwards.
> > But in rwsem_down_write_slowpath(), after we've set
> > RWSEM_FLAG_WAITERS, we can return successfully immediately once
> > rwsem_try_write_lock() sees that there are no active readers or
> > writers anymore (if RWSEM_LOCK_MASK is unset and the cmpxchg
> > succeeds). We're not necessarily waiting for the "nonspinnable" bit or
> > the wake.
> >
> > So yeah, I think down_write() can return successfully before up_read()
> > is done with its memory accesses.
> >
> > (Spinlocks are different - the kernel relies on being able to drop
> > references via spin_unlock() in some places.)
> 
> Thanks for bringing this up. I can add rcu_read_{lock/unlock) as you
> suggested and that would fix the issue because we free VMAs from
> call_rcu(). However this feels to me as an issue of rw_semaphore
> design that this locking pattern is unsafe and might lead to UAF.

We have/had this problem with normal mutexes too.  It was the impetus
for adding the struct completion which is very careful to not touch
anything after the completion is, well, completed.
