Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0B670BB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 23:37:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxP0r4rFFz3fC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 09:37:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KfwF+Chq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KfwF+Chq;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxNzx4cNJz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 09:37:01 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id 20so16901198ybl.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 14:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lm5RcDiW+2rGYFCauDaSwKbjJDggVLN2u6xrwVauKK0=;
        b=KfwF+ChqQI+spUNrTrCSVtdcoF8j4D0OPeze22WkmAhXl1Ur+BZ1OCwKXZcEIx8hfQ
         a7ONLKPiTn/QuLt6KSIjYS4Y80WenNjPid00GPCbKS8iDZHStcl5tUCHc3R3GK/eDLoG
         QPWWrKo4rNJk86Jhb+yPUhpv6SQMlfPAFQ73OSt5M/CLajTFfWZXd3Wxwp12inxJu+y6
         lP1Od8JnRwb/hbZQYbCYZy5IrI1v2NmOpcMZCXJTOwyTANa2XaglPW8Il8Q+vMrbXtJ/
         niyJNGhwX1gcX6jFIAyiAosZn3ypXcghVF309a2hAgVCwZY7kHVhn903odOn3nwV/X6x
         YH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lm5RcDiW+2rGYFCauDaSwKbjJDggVLN2u6xrwVauKK0=;
        b=7SkeQ29JhtYFg5RJjeEX2ZuoGX5R6orL6BzFZyUtSvKnl2mEGMr8f5H1zsS0jsc8jO
         5h/40nWTy/LdAq3huqpn6qY1OVxNMzGDkgG0ECMReSielKJ45tuIZzVy9oZrpdQQjvdH
         HSdZ9jkSjLTvHQpoReu1PcdYzdscIpfg/I+8ZObEqiFclMfq6/Xr+Yu6RFnY9TouBeSC
         PKsS3pkRkiAIu1HLl2gdqgAbKD5dJj3vDDZVbQWANulYRCjx60GTxFaSWwyyI7oDRsoX
         emjSiCBky4OKVAAlgrsku5ooHY4uqzTmRc4wd5g86zW2ShpfzEKhm+zumIQD9vPUhbZR
         /OdA==
X-Gm-Message-State: AFqh2kp+Ifo/6bhiK6f96YSUWcmJcqFUPeJgDDatRZ+SfBurtKx9zjfL
	HbFdiiKflnEeIT7CXXGETPz+CouFrBtxvQcKwfsGHg==
X-Google-Smtp-Source: AMrXdXtGV2vg2X6848Sq5L1OnzZ5Haar7yCqj+6oRCCeUvwlEhxuO6ABcx4I+h0UVyNSvKE5u7BBhe5bspBtFhh/7Hs=
X-Received: by 2002:a05:6902:685:b0:7e9:646d:2da3 with SMTP id
 i5-20020a056902068500b007e9646d2da3mr702515ybt.340.1673995017981; Tue, 17 Jan
 2023 14:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
 <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com>
 <CAJuCfpHawn-hj3yK6MEMHsvnH9xgO87h7Sj3_g0FA7rgut_mVg@mail.gmail.com> <CAG48ez3sCwasFzKD5CsqMFA2W57-2fazd75g7r0NaA_BVNTLow@mail.gmail.com>
In-Reply-To: <CAG48ez3sCwasFzKD5CsqMFA2W57-2fazd75g7r0NaA_BVNTLow@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 14:36:47 -0800
Message-ID: <CAJuCfpFDyt2ZBGufhRz6oz2E=oyO47-d7BHwSeOiexD+UQ08jA@mail.gmail.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
To: Jann Horn <jannh@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Will Deacon <will@kernel.org>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-f
 oundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 1:46 PM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Jan 17, 2023 at 10:28 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > On Tue, Jan 17, 2023 at 10:03 AM Jann Horn <jannh@google.com> wrote:
> > >
> > > +locking maintainers
> >
> > Thanks! I'll CC the locking maintainers in the next posting.
> >
> > >
> > > On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > > to be exclusively locked during VMA tree modifications, instead of the
> > > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > > locked.
> > > [...]
> > > > +static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > > +{
> > > > +       up_read(&vma->lock);
> > > > +}
> > >
> > > One thing that might be gnarly here is that I think you might not be
> > > allowed to use up_read() to fully release ownership of an object -
> > > from what I remember, I think that up_read() (unlike something like
> > > spin_unlock()) can access the lock object after it's already been
> > > acquired by someone else. So if you want to protect against concurrent
> > > deletion, this might have to be something like:
> > >
> > > rcu_read_lock(); /* keeps vma alive */
> > > up_read(&vma->lock);
> > > rcu_read_unlock();
> >
> > But for deleting VMA one would need to write-lock the vma->lock first,
> > which I assume can't happen until this up_read() is complete. Is that
> > assumption wrong?
>
> __up_read() does:
>
> rwsem_clear_reader_owned(sem);
> tmp = atomic_long_add_return_release(-RWSEM_READER_BIAS, &sem->count);
> DEBUG_RWSEMS_WARN_ON(tmp < 0, sem);
> if (unlikely((tmp & (RWSEM_LOCK_MASK|RWSEM_FLAG_WAITERS)) ==
>       RWSEM_FLAG_WAITERS)) {
>   clear_nonspinnable(sem);
>   rwsem_wake(sem);
> }
>
> The atomic_long_add_return_release() is the point where we are doing
> the main lock-releasing.
>
> So if a reader dropped the read-lock while someone else was waiting on
> the lock (RWSEM_FLAG_WAITERS) and no other readers were holding the
> lock together with it, the reader also does clear_nonspinnable() and
> rwsem_wake() afterwards.
> But in rwsem_down_write_slowpath(), after we've set
> RWSEM_FLAG_WAITERS, we can return successfully immediately once
> rwsem_try_write_lock() sees that there are no active readers or
> writers anymore (if RWSEM_LOCK_MASK is unset and the cmpxchg
> succeeds). We're not necessarily waiting for the "nonspinnable" bit or
> the wake.
>
> So yeah, I think down_write() can return successfully before up_read()
> is done with its memory accesses.
>
> (Spinlocks are different - the kernel relies on being able to drop
> references via spin_unlock() in some places.)

Thanks for bringing this up. I can add rcu_read_{lock/unlock) as you
suggested and that would fix the issue because we free VMAs from
call_rcu(). However this feels to me as an issue of rw_semaphore
design that this locking pattern is unsafe and might lead to UAF.
