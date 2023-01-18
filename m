Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC8672ACC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 22:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxzpv0mgVz3fDj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 08:46:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=As8aSH9Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=As8aSH9Y;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxznt6lRXz2ywn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 08:45:21 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4c24993965eso481356237b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 13:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JgpeoTHHmirFYtBvQprCwslvQV+NLdgiQIToXq3uwZE=;
        b=As8aSH9YqOQwxb84HSdDayQFHtJeebFHp/bWatci23d+ZcUuRI1zqiFa7kqzfJdPY4
         6b+IdUTvG5GtLImu60sSAzg3fuOI/z1KJ8K8PVSMB/ikC7CUG0PWmYb+OljUgYExq3/D
         YkXRlsoGCfYsZpFuwKn+fMlTo5yCmPbsZqMh/A2xQgbLJB4/S/GB4LtAVK7gdVS0eGMZ
         M/1G7ZIN4/fcoqMPjkHJdj4qRBT320uoqpVjhp1SrGjLO4E+i/3+I0ScgEnlaLK1xZtE
         sy1uA14H5BPKjCtl0W8puTAMiRspqLXz5hxqqL1vTZCNdJw44Ch+/9/QTYVHWDStgrkJ
         nVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgpeoTHHmirFYtBvQprCwslvQV+NLdgiQIToXq3uwZE=;
        b=4tjwgHvC946dRPyuJybElU+oKpz19bhFg4mdvBWDdNUmaktQve3k910WQ6HdyFhtmE
         IeWbzfhrvpVycsYCYUUW5PaNCyn5UKcaOlBig21mdlcUfV+hJOKyNKlbjW645JdlXBJG
         zbP6XtmYFYAGhbMOiselPQt22NjOyv1Ve9dWq0ieTKnHejSft1QTbxBRH7pABnHh9INR
         J4h3xdtL9hmU+tbWSEJoM3HHModR+F/xkJFDuSmlMpmFkGJNuc5eL+jgfT7GeiFVngxH
         cxa5zywxZroMDb+iuS4DWmorL/SH4nxljwSfNFbzMYB1S6WCxVWz59HpDJ+xpo/cYRvE
         34hQ==
X-Gm-Message-State: AFqh2ko6H1CJ3I6QdxKB77Lrw8owfNRDDxnrYdgudQ/rIg4ptVC2tASl
	zj3gr1h36PwhXcfL3YzoRnatI3gvuD0trhFwqk7iKw==
X-Google-Smtp-Source: AMrXdXtj/06io+C4o9XfWOcEkR8Ed8RhDt6Cs9tZ2bwiTynxrB/hq/5++WXBZDrP1jGLs/kZFy2FrmKnxDB9qMDztus=
X-Received: by 2002:a0d:fc05:0:b0:3ea:454d:d1ef with SMTP id
 m5-20020a0dfc05000000b003ea454dd1efmr1108320ywf.409.1674078317049; Wed, 18
 Jan 2023 13:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
 <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com>
 <Y8fl8lqS4QHZO1gV@dhcp22.suse.cz> <CAG48ez0dCo6KHPJrjAra=2Hm9aTm_3ERwCN3j64p3T82xNWScg@mail.gmail.com>
 <Y8gMISwBLVNLhsAq@dhcp22.suse.cz> <CAJuCfpGGU9TpL62EzwUCjsUy0frmR33Nyk5BQiN=AiQUkiq7yg@mail.gmail.com>
 <Y8hkdBYTXHf23huE@dhcp22.suse.cz>
In-Reply-To: <Y8hkdBYTXHf23huE@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 13:45:05 -0800
Message-ID: <CAJuCfpG2bJrvVm7ioZVv+h_Aj6Eoh93Yjia8T-SsUpnT+26SSA@mail.gmail.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
To: Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Will Deacon <will@kernel.org>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, Jann Horn <jannh@google.com>, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org,
  akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 1:28 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 18-01-23 09:36:44, Suren Baghdasaryan wrote:
> > On Wed, Jan 18, 2023 at 7:11 AM 'Michal Hocko' via kernel-team
> > <kernel-team@android.com> wrote:
> > >
> > > On Wed 18-01-23 14:23:32, Jann Horn wrote:
> > > > On Wed, Jan 18, 2023 at 1:28 PM Michal Hocko <mhocko@suse.com> wrote:
> > > > > On Tue 17-01-23 19:02:55, Jann Horn wrote:
> > > > > > +locking maintainers
> > > > > >
> > > > > > On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > > > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > > > > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > > > > > to be exclusively locked during VMA tree modifications, instead of the
> > > > > > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > > > > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > > > > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > > > > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > > > > > locked.
> > > > > > [...]
> > > > > > > +static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > > > > > +{
> > > > > > > +       up_read(&vma->lock);
> > > > > > > +}
> > > > > >
> > > > > > One thing that might be gnarly here is that I think you might not be
> > > > > > allowed to use up_read() to fully release ownership of an object -
> > > > > > from what I remember, I think that up_read() (unlike something like
> > > > > > spin_unlock()) can access the lock object after it's already been
> > > > > > acquired by someone else.
> > > > >
> > > > > Yes, I think you are right. From a look into the code it seems that
> > > > > the UAF is quite unlikely as there is a ton of work to be done between
> > > > > vma_write_lock used to prepare vma for removal and actual removal.
> > > > > That doesn't make it less of a problem though.
> > > > >
> > > > > > So if you want to protect against concurrent
> > > > > > deletion, this might have to be something like:
> > > > > >
> > > > > > rcu_read_lock(); /* keeps vma alive */
> > > > > > up_read(&vma->lock);
> > > > > > rcu_read_unlock();
> > > > > >
> > > > > > But I'm not entirely sure about that, the locking folks might know better.
> > > > >
> > > > > I am not a locking expert but to me it looks like this should work
> > > > > because the final cleanup would have to happen rcu_read_unlock.
> > > > >
> > > > > Thanks, I have completely missed this aspect of the locking when looking
> > > > > into the code.
> > > > >
> > > > > Btw. looking at this again I have fully realized how hard it is actually
> > > > > to see that vm_area_free is guaranteed to sync up with ongoing readers.
> > > > > vma manipulation functions like __adjust_vma make my head spin. Would it
> > > > > make more sense to have a rcu style synchronization point in
> > > > > vm_area_free directly before call_rcu? This would add an overhead of
> > > > > uncontended down_write of course.
> > > >
> > > > Something along those lines might be a good idea, but I think that
> > > > rather than synchronizing the removal, it should maybe be something
> > > > that splats (and bails out?) if it detects pending readers. If we get
> > > > to vm_area_free() on a VMA that has pending readers, we might already
> > > > be in a lot of trouble because the concurrent readers might have been
> > > > traversing page tables while we were tearing them down or fun stuff
> > > > like that.
> > > >
> > > > I think maybe Suren was already talking about something like that in
> > > > another part of this patch series but I don't remember...
> > >
> > > This http://lkml.kernel.org/r/20230109205336.3665937-27-surenb@google.com?
> >
> > Yes, I spent a lot of time ensuring that __adjust_vma locks the right
> > VMAs and that VMAs are freed or isolated under VMA write lock
> > protection to exclude any readers. If the VM_BUG_ON_VMA in the patch
> > Michal mentioned gets hit then it's a bug in my design and I'll have
> > to fix it. But please, let's not add synchronize_rcu() in the
> > vm_area_free().
>
> Just to clarify. I didn't suggest to add synchronize_rcu into
> vm_area_free. What I really meant was synchronize_rcu like primitive to
> effectivelly synchronize with any potential pending read locker (so
> something like vma_write_lock (or whatever it is called). The point is
> that vma freeing is an event all readers should be notified about.

I don't think readers need to be notified if we are ensuring that the
VMA is not used by anyone else and is not reachable by the readers.
This is currently done by write-locking the VMA either before removing
it from the tree or before freeing it.

> This can be done explicitly for each and every vma before vm_area_free
> is called but this is just hard to review and easy to break over time.
> See my point?

I understand your point now and if we really need that, one way would
be to have a VMA refcount (like Laurent had in his version of SPF
implementation). I don't think current implementation needs that level
of VMA lifetime control unless I missed some location that should take
the lock and does not.

>
> --
> Michal Hocko
> SUSE Labs
