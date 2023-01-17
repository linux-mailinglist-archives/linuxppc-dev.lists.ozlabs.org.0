Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7266E8B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:46:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxMt90Xnxz3chL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:46:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oKiIXHz6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oKiIXHz6;
	dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxMsB0Z9hz3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:46:04 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id j1so7298902iob.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 13:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+bqBsZZ4RgN9jlgw+b1dC/NMypzjYzjrdfCfcedPWDQ=;
        b=oKiIXHz6hYZTnFSg8CyeAh1iOmXE+x2JTvTp7n/ELKxH9/S/8QqLxW5rxrlAIA0pY9
         FGTxfNB6FzBp2L1EQVFE0jq7nSlA/MyzEeFPLmHGwMM5qm7MDAy0PYZpOdEpveGC0Azy
         m7KF7D5TB3OeS6KxmOWgIJg3mNa70PP07eTN/QyWeX4JmtTKK0EXfC8wPXsA4aeOtGaA
         51aWJni3yr+WysiWx8JjxtUqnmzU+G4umBm6d27THEG3JhNZWzZ5rZtbU1Ya3nIlZuyR
         yYhzv1oAYEDalxwkXlfg1KcUXcWMaGXL1NwQ6aG+GfDIfRgoOXnIz83APIiCyu6bR5gq
         BH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bqBsZZ4RgN9jlgw+b1dC/NMypzjYzjrdfCfcedPWDQ=;
        b=5sspQWnqU41B961rXu+W3T4Zgvnw0zW+wzMnhbSDZN47yQjQ6+GCk3BBUlYLtgaBHC
         SeQapXqH8XPz4OWykdzOhjtCcax7jbq5MUpLX1rX6xFc5Jf0GmfIXjEtDd4rJyQ0Xf+e
         oafzQa47swJhGX67V3OqEdQ3/LBhjFCEaYbPf7mevTYYRCNW8DaPKKpU7Smggjw26tN+
         ZdKSx2qpMlsXEPnTLOxXl7M3D9+hXw9XTapqolPtMnANADrrxLlsQwQfcdiQ4WsTsgKP
         pomu66pQYN2h2jjyhQJKxz82+vrJw3aU4gyBWG9XhJRGYp1XzobeyBekyj/xigtmIVEe
         IEHA==
X-Gm-Message-State: AFqh2kocSzpokDR+mYDG+HVubFPfWEFJAOwOoyhQ7lXagDSpRn+QIueV
	juhxvN3LLkVk0ZSJgENI02C0LXjD3OKAIdaH6TmJCA==
X-Google-Smtp-Source: AMrXdXvjzRa+kyqV5cDYZnYOJiY7YjAiK71oj/DKwnEZqpEByYHd/G13EWU8vxfkIQDeuwmQ9WfEcwYbls/tg1JyPyE=
X-Received: by 2002:a02:c884:0:b0:39e:9d33:a47 with SMTP id
 m4-20020a02c884000000b0039e9d330a47mr328254jao.58.1673991962307; Tue, 17 Jan
 2023 13:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
 <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com> <CAJuCfpHawn-hj3yK6MEMHsvnH9xgO87h7Sj3_g0FA7rgut_mVg@mail.gmail.com>
In-Reply-To: <CAJuCfpHawn-hj3yK6MEMHsvnH9xgO87h7Sj3_g0FA7rgut_mVg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 22:45:25 +0100
Message-ID: <CAG48ez3sCwasFzKD5CsqMFA2W57-2fazd75g7r0NaA_BVNTLow@mail.gmail.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
To: Suren Baghdasaryan <surenb@google.com>
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

On Tue, Jan 17, 2023 at 10:28 PM Suren Baghdasaryan <surenb@google.com> wrote:
> On Tue, Jan 17, 2023 at 10:03 AM Jann Horn <jannh@google.com> wrote:
> >
> > +locking maintainers
>
> Thanks! I'll CC the locking maintainers in the next posting.
>
> >
> > On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > to be exclusively locked during VMA tree modifications, instead of the
> > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > locked.
> > [...]
> > > +static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > +{
> > > +       up_read(&vma->lock);
> > > +}
> >
> > One thing that might be gnarly here is that I think you might not be
> > allowed to use up_read() to fully release ownership of an object -
> > from what I remember, I think that up_read() (unlike something like
> > spin_unlock()) can access the lock object after it's already been
> > acquired by someone else. So if you want to protect against concurrent
> > deletion, this might have to be something like:
> >
> > rcu_read_lock(); /* keeps vma alive */
> > up_read(&vma->lock);
> > rcu_read_unlock();
>
> But for deleting VMA one would need to write-lock the vma->lock first,
> which I assume can't happen until this up_read() is complete. Is that
> assumption wrong?

__up_read() does:

rwsem_clear_reader_owned(sem);
tmp = atomic_long_add_return_release(-RWSEM_READER_BIAS, &sem->count);
DEBUG_RWSEMS_WARN_ON(tmp < 0, sem);
if (unlikely((tmp & (RWSEM_LOCK_MASK|RWSEM_FLAG_WAITERS)) ==
      RWSEM_FLAG_WAITERS)) {
  clear_nonspinnable(sem);
  rwsem_wake(sem);
}

The atomic_long_add_return_release() is the point where we are doing
the main lock-releasing.

So if a reader dropped the read-lock while someone else was waiting on
the lock (RWSEM_FLAG_WAITERS) and no other readers were holding the
lock together with it, the reader also does clear_nonspinnable() and
rwsem_wake() afterwards.
But in rwsem_down_write_slowpath(), after we've set
RWSEM_FLAG_WAITERS, we can return successfully immediately once
rwsem_try_write_lock() sees that there are no active readers or
writers anymore (if RWSEM_LOCK_MASK is unset and the cmpxchg
succeeds). We're not necessarily waiting for the "nonspinnable" bit or
the wake.

So yeah, I think down_write() can return successfully before up_read()
is done with its memory accesses.

(Spinlocks are different - the kernel relies on being able to drop
references via spin_unlock() in some places.)
