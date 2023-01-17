Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C973C66E2B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 16:48:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxCw74xdDz3ch5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 02:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Qv1lqyxp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Qv1lqyxp;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxCvB2D0vz2xT9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 02:47:17 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94DC01FFC8;
	Tue, 17 Jan 2023 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673970434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NUiY3CvLapMFEuYfFsjZYssRcX9vLmzM+egf4tjCh/M=;
	b=Qv1lqyxpDwXRzDUPml0XrcqNLd00O/evBot2GOJJTEbg8kJoL+1NNpW8AGe8s85Qy7rKgT
	IKfZPE0bOq46JT9nRsm3QoIayz6ls5r1TSRklkTtUb/jqlrjKXHMK7sp5RYeoUrbe61ayn
	wIIQLGaFJngLhJyENWqGvAEUPsP0UFI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D8AA1390C;
	Tue, 17 Jan 2023 15:47:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iP1IGgLDxmOAVwAAMHmgww
	(envelope-from <mhocko@suse.com>); Tue, 17 Jan 2023 15:47:14 +0000
Date: Tue, 17 Jan 2023 16:47:13 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 28/41] mm: introduce lock_vma_under_rcu to be used from
 arch-specific code
Message-ID: <Y8bDAVC/aiL9tCyz@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-29-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109205336.3665937-29-surenb@google.com>
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

On Mon 09-01-23 12:53:23, Suren Baghdasaryan wrote:
> Introduce lock_vma_under_rcu function to lookup and lock a VMA during
> page fault handling. When VMA is not found, can't be locked or changes
> after being locked, the function returns NULL. The lookup is performed
> under RCU protection to prevent the found VMA from being destroyed before
> the VMA lock is acquired. VMA lock statistics are updated according to
> the results.
> For now only anonymous VMAs can be searched this way. In other cases the
> function returns NULL.

Could you describe why only anonymous vmas are handled at this stage and
what (roughly) has to be done to support other vmas? lock_vma_under_rcu
doesn't seem to have any anonymous vma specific requirements AFAICS.

Also isn't lock_vma_under_rcu effectively find_read_lock_vma? Not that
the naming is really the most important part but the rcu locking is
internal to the function so why should we spread this implementation
detail to the world...

> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h |  3 +++
>  mm/memory.c        | 51 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c464fc8a514c..d0fddf6a1de9 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -687,6 +687,9 @@ static inline void vma_assert_no_reader(struct vm_area_struct *vma)
>  		      vma);
>  }
>  
> +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> +					  unsigned long address);
> +
>  #else /* CONFIG_PER_VMA_LOCK */
>  
>  static inline void vma_init_lock(struct vm_area_struct *vma) {}
> diff --git a/mm/memory.c b/mm/memory.c
> index 9ece18548db1..a658e26d965d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5242,6 +5242,57 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
>  }
>  EXPORT_SYMBOL_GPL(handle_mm_fault);
>  
> +#ifdef CONFIG_PER_VMA_LOCK
> +/*
> + * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
> + * stable and not isolated. If the VMA is not found or is being modified the
> + * function returns NULL.
> + */
> +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> +					  unsigned long address)
> +{
> +	MA_STATE(mas, &mm->mm_mt, address, address);
> +	struct vm_area_struct *vma, *validate;
> +
> +	rcu_read_lock();
> +	vma = mas_walk(&mas);
> +retry:
> +	if (!vma)
> +		goto inval;
> +
> +	/* Only anonymous vmas are supported for now */
> +	if (!vma_is_anonymous(vma))
> +		goto inval;
> +
> +	if (!vma_read_trylock(vma))
> +		goto inval;
> +
> +	/* Check since vm_start/vm_end might change before we lock the VMA */
> +	if (unlikely(address < vma->vm_start || address >= vma->vm_end)) {
> +		vma_read_unlock(vma);
> +		goto inval;
> +	}
> +
> +	/* Check if the VMA got isolated after we found it */
> +	mas.index = address;
> +	validate = mas_walk(&mas);
> +	if (validate != vma) {
> +		vma_read_unlock(vma);
> +		count_vm_vma_lock_event(VMA_LOCK_MISS);
> +		/* The area was replaced with another one. */
> +		vma = validate;
> +		goto retry;
> +	}
> +
> +	rcu_read_unlock();
> +	return vma;
> +inval:
> +	rcu_read_unlock();
> +	count_vm_vma_lock_event(VMA_LOCK_ABORT);
> +	return NULL;
> +}
> +#endif /* CONFIG_PER_VMA_LOCK */
> +
>  #ifndef __PAGETABLE_P4D_FOLDED
>  /*
>   * Allocate p4d page table.
> -- 
> 2.39.0

-- 
Michal Hocko
SUSE Labs
