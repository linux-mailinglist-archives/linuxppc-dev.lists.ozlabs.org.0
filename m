Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6E66E19F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 16:05:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxByj6HQMz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 02:05:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=U1h4kFu/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=U1h4kFu/;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxBxp554Hz3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 02:04:29 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47AFC33D8F;
	Tue, 17 Jan 2023 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673967866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Df5NQTjJQCiRBGEpyl9cGWjQX8DB0qIAlHtRMH2qV9k=;
	b=U1h4kFu/QGMT7jVH4gL5A9ak+iHM3tKQ+qvBWljMIVg6aF0bPgBMxA7WCk5cHbEVvlFtI/
	1shiLAhNfJI0bRNytT86McNF3WNli+p9sU19877lNFKU1yl+GIjD1Lq+WgZf4v4sfsiDdR
	RI3hBB1GBEVLRElyJYjyjATKnjMDqa8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D6381390C;
	Tue, 17 Jan 2023 15:04:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TrakBvq4xmMhPwAAMHmgww
	(envelope-from <mhocko@suse.com>); Tue, 17 Jan 2023 15:04:26 +0000
Date: Tue, 17 Jan 2023 16:04:25 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
Message-ID: <Y8a4+bV1dYNAiUkD@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-13-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109205336.3665937-13-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 09-01-23 12:53:07, Suren Baghdasaryan wrote:
> Introduce a per-VMA rw_semaphore to be used during page fault handling
> instead of mmap_lock. Because there are cases when multiple VMAs need
> to be exclusively locked during VMA tree modifications, instead of the
> usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> mmap_write_lock holder is done with all modifications and drops mmap_lock,
> it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> locked.

I have to say I was struggling a bit with the above and only understood
what you mean by reading the patch several times. I would phrase it like
this (feel free to use if you consider this to be an improvement).

Introduce a per-VMA rw_semaphore. The lock implementation relies on a
per-vma and per-mm sequence counters to note exclusive locking:
        - read lock - (implemented by vma_read_trylock) requires the the
          vma (vm_lock_seq) and mm (mm_lock_seq) sequence counters to
          differ. If they match then there must be a vma exclusive lock
          held somewhere.
        - read unlock - (implemented by vma_read_unlock) is a trivial
          vma->lock unlock.
        - write lock - (vma_write_lock) requires the mmap_lock to be
          held exclusively and the current mm counter is noted to the vma
          side. This will allow multiple vmas to be locked under a single
          mmap_lock write lock (e.g. during vma merging). The vma counter
          is modified under exclusive vma lock.
        - write unlock - (vma_write_unlock_mm) is a batch release of all
          vma locks held. It doesn't pair with a specific
          vma_write_lock! It is done before exclusive mmap_lock is
          released by incrementing mm sequence counter (mm_lock_seq).
	- write downgrade - if the mmap_lock is downgraded to the read
	  lock all vma write locks are released as well (effectivelly
	  same as write unlock).

> VMA lock is placed on the cache line boundary so that its 'count' field
> falls into the first cache line while the rest of the fields fall into
> the second cache line. This lets the 'count' field to be cached with
> other frequently accessed fields and used quickly in uncontended case
> while 'owner' and other fields used in the contended case will not
> invalidate the first cache line while waiting on the lock.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h        | 80 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mm_types.h  |  8 ++++
>  include/linux/mmap_lock.h | 13 +++++++
>  kernel/fork.c             |  4 ++
>  mm/init-mm.c              |  3 ++
>  5 files changed, 108 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f3f196e4d66d..ec2c4c227d51 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -612,6 +612,85 @@ struct vm_operations_struct {
>  					  unsigned long addr);
>  };
>  
> +#ifdef CONFIG_PER_VMA_LOCK
> +static inline void vma_init_lock(struct vm_area_struct *vma)
> +{
> +	init_rwsem(&vma->lock);
> +	vma->vm_lock_seq = -1;
> +}
> +
> +static inline void vma_write_lock(struct vm_area_struct *vma)
> +{
> +	int mm_lock_seq;
> +
> +	mmap_assert_write_locked(vma->vm_mm);
> +
> +	/*
> +	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
> +	 * mm->mm_lock_seq can't be concurrently modified.
> +	 */
> +	mm_lock_seq = READ_ONCE(vma->vm_mm->mm_lock_seq);
> +	if (vma->vm_lock_seq == mm_lock_seq)
> +		return;
> +
> +	down_write(&vma->lock);
> +	vma->vm_lock_seq = mm_lock_seq;
> +	up_write(&vma->lock);
> +}
> +
> +/*
> + * Try to read-lock a vma. The function is allowed to occasionally yield false
> + * locked result to avoid performance overhead, in which case we fall back to
> + * using mmap_lock. The function should never yield false unlocked result.
> + */
> +static inline bool vma_read_trylock(struct vm_area_struct *vma)
> +{
> +	/* Check before locking. A race might cause false locked result. */
> +	if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> +		return false;
> +
> +	if (unlikely(down_read_trylock(&vma->lock) == 0))
> +		return false;
> +
> +	/*
> +	 * Overflow might produce false locked result.
> +	 * False unlocked result is impossible because we modify and check
> +	 * vma->vm_lock_seq under vma->lock protection and mm->mm_lock_seq
> +	 * modification invalidates all existing locks.
> +	 */
> +	if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> +		up_read(&vma->lock);
> +		return false;
> +	}
> +	return true;
> +}
> +
> +static inline void vma_read_unlock(struct vm_area_struct *vma)
> +{
> +	up_read(&vma->lock);
> +}
> +
> +static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	/*
> +	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
> +	 * mm->mm_lock_seq can't be concurrently modified.
> +	 */
> +	VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
> +}
> +
> +#else /* CONFIG_PER_VMA_LOCK */
> +
> +static inline void vma_init_lock(struct vm_area_struct *vma) {}
> +static inline void vma_write_lock(struct vm_area_struct *vma) {}
> +static inline bool vma_read_trylock(struct vm_area_struct *vma)
> +		{ return false; }
> +static inline void vma_read_unlock(struct vm_area_struct *vma) {}
> +static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
> +
> +#endif /* CONFIG_PER_VMA_LOCK */
> +
>  static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  {
>  	static const struct vm_operations_struct dummy_vm_ops = {};
> @@ -620,6 +699,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma->vm_mm = mm;
>  	vma->vm_ops = &dummy_vm_ops;
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> +	vma_init_lock(vma);
>  }
>  
>  static inline void vma_set_anonymous(struct vm_area_struct *vma)
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index d5cdec1314fe..5f7c5ca89931 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -555,6 +555,11 @@ struct vm_area_struct {
>  	pgprot_t vm_page_prot;
>  	unsigned long vm_flags;		/* Flags, see mm.h. */
>  
> +#ifdef CONFIG_PER_VMA_LOCK
> +	int vm_lock_seq;
> +	struct rw_semaphore lock;
> +#endif
> +
>  	/*
>  	 * For areas with an address space and backing store,
>  	 * linkage into the address_space->i_mmap interval tree.
> @@ -680,6 +685,9 @@ struct mm_struct {
>  					  * init_mm.mmlist, and are protected
>  					  * by mmlist_lock
>  					  */
> +#ifdef CONFIG_PER_VMA_LOCK
> +		int mm_lock_seq;
> +#endif
>  
>  
>  		unsigned long hiwater_rss; /* High-watermark of RSS usage */
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index e49ba91bb1f0..40facd4c398b 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -72,6 +72,17 @@ static inline void mmap_assert_write_locked(struct mm_struct *mm)
>  	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
>  }
>  
> +#ifdef CONFIG_PER_VMA_LOCK
> +static inline void vma_write_unlock_mm(struct mm_struct *mm)
> +{
> +	mmap_assert_write_locked(mm);
> +	/* No races during update due to exclusive mmap_lock being held */
> +	WRITE_ONCE(mm->mm_lock_seq, mm->mm_lock_seq + 1);
> +}
> +#else
> +static inline void vma_write_unlock_mm(struct mm_struct *mm) {}
> +#endif
> +
>  static inline void mmap_init_lock(struct mm_struct *mm)
>  {
>  	init_rwsem(&mm->mmap_lock);
> @@ -114,12 +125,14 @@ static inline bool mmap_write_trylock(struct mm_struct *mm)
>  static inline void mmap_write_unlock(struct mm_struct *mm)
>  {
>  	__mmap_lock_trace_released(mm, true);
> +	vma_write_unlock_mm(mm);
>  	up_write(&mm->mmap_lock);
>  }
>  
>  static inline void mmap_write_downgrade(struct mm_struct *mm)
>  {
>  	__mmap_lock_trace_acquire_returned(mm, false, true);
> +	vma_write_unlock_mm(mm);
>  	downgrade_write(&mm->mmap_lock);
>  }
>  
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 5986817f393c..c026d75108b3 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -474,6 +474,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  		 */
>  		*new = data_race(*orig);
>  		INIT_LIST_HEAD(&new->anon_vma_chain);
> +		vma_init_lock(new);
>  		dup_anon_vma_name(orig, new);
>  	}
>  	return new;
> @@ -1145,6 +1146,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>  	seqcount_init(&mm->write_protect_seq);
>  	mmap_init_lock(mm);
>  	INIT_LIST_HEAD(&mm->mmlist);
> +#ifdef CONFIG_PER_VMA_LOCK
> +	WRITE_ONCE(mm->mm_lock_seq, 0);
> +#endif
>  	mm_pgtables_bytes_init(mm);
>  	mm->map_count = 0;
>  	mm->locked_vm = 0;
> diff --git a/mm/init-mm.c b/mm/init-mm.c
> index c9327abb771c..33269314e060 100644
> --- a/mm/init-mm.c
> +++ b/mm/init-mm.c
> @@ -37,6 +37,9 @@ struct mm_struct init_mm = {
>  	.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
>  	.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
>  	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
> +#ifdef CONFIG_PER_VMA_LOCK
> +	.mm_lock_seq	= 0,
> +#endif
>  	.user_ns	= &init_user_ns,
>  	.cpu_bitmap	= CPU_BITS_NONE,
>  #ifdef CONFIG_IOMMU_SVA
> -- 
> 2.39.0

-- 
Michal Hocko
SUSE Labs
