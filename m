Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB066BD03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 12:40:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwVSV08XRz3cgv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 22:40:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IKaS1mls;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IKaS1mls;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwTvT55D4z3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 22:15:00 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id jn22so29972720plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 03:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/j+1WOB2+poIU0zjjNXAinFoRjK1wRjx3d+XHMefVA=;
        b=IKaS1mlsXdKP2qLzqb0Dyj556UOX3zeMPhPIirCQcTt3qQS2nyTrw1H+PTDeBL8zuV
         HM5hqzwdA1j2S+Owv380uXh4elme5UhoOwMxL5rwB6SEfOxqFisy3kf5PXKswLa2DQwZ
         ZbSg85c+dciT9fX+W0S917eX6PiPq8JsRiD7hiEgNGE0uDyd/QyqjwINAVDHmul8StHU
         g7sLEfykA1+gfNGZH3mWj1DPNJa/IpRkv5amvYAt97kyPizVZeEvRvSNKrRlkvJJAMDV
         n1yK9QwW5Xy/Z8sceRkhjoRr36n6xdiEOnqDkWDzss1yFAf2tXJokS2p8uBJx8DvUK4b
         8mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/j+1WOB2+poIU0zjjNXAinFoRjK1wRjx3d+XHMefVA=;
        b=IbJ+54OQIWf0AOH1FRxhd5nPXPvcB/SIi6BhKfoPGwzismlqhMaY4nlFWkNARu0UN5
         7uLqdwG7C0gcyxne3Ysu4fVbZZgns9RX77uBCfxzkaXy8D/ile9y0mK6PzRxrpwN5IFP
         7zO0DhTzRU3QONEZBtjJF1MWq2lv48ABxFew3/2QdeB/hF3A0KX832KUZTdQgLqt8my9
         CMu66CxMgn4jKjisA8MM16C911efx6niyp7rioju05KlmH1OVL4R1AeXN6tohAxUokVX
         AOLR0RXLWEtREd6aX04U+yuB3oKVXkaN6Otmd6dI2GsgLWxnc/Khc4VuI4tHuNSI/hJ2
         7FvQ==
X-Gm-Message-State: AFqh2kreToupTsNInmypKDf900Ik9xIdEmfYDhoVjgm1WGFhW9+9QOgH
	MK0QLckWfbiWnUk7nb48yIY=
X-Google-Smtp-Source: AMrXdXuQRd6wOjQtljWK07qYLraoNulCoayDZNQpKT3xAcTulISKZqIOzMvtWPVA3/M2jPRTkeVMbA==
X-Received: by 2002:a05:6a20:5489:b0:b0:b870:54e1 with SMTP id i9-20020a056a20548900b000b0b87054e1mr140691094pzk.12.1673867695716;
        Mon, 16 Jan 2023 03:14:55 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id 3-20020a621503000000b00581c741f95csm16176892pfv.46.2023.01.16.03.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:14:54 -0800 (PST)
Date: Mon, 16 Jan 2023 11:14:38 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
Message-ID: <Y8UxnqPCTLbbD+2F@localhost>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-42-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109205336.3665937-42-surenb@google.com>
X-Mailman-Approved-At: Mon, 16 Jan 2023 22:39:24 +1100
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@t
 echsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 09, 2023 at 12:53:36PM -0800, Suren Baghdasaryan wrote:
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d40bf8a5e19e..294dd44b2198 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -627,12 +627,16 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
>  	 * mm->mm_lock_seq can't be concurrently modified.
>  	 */
>  	mm_lock_seq = READ_ONCE(vma->vm_mm->mm_lock_seq);
> -	if (vma->vm_lock_seq == mm_lock_seq)
> +	if (vma->vm_lock->lock_seq == mm_lock_seq)
>  		return;
>  
> -	down_write(&vma->vm_lock->lock);
> -	vma->vm_lock_seq = mm_lock_seq;
> -	up_write(&vma->vm_lock->lock);
> +	if (atomic_cmpxchg(&vma->vm_lock->count, 0, -1))
> +		wait_event(vma->vm_mm->vma_writer_wait,
> +			   atomic_cmpxchg(&vma->vm_lock->count, 0, -1) == 0);
> +	vma->vm_lock->lock_seq = mm_lock_seq;
> +	/* Write barrier to ensure lock_seq change is visible before count */
> +	smp_wmb();
> +	atomic_set(&vma->vm_lock->count, 0);
>  }
>  
>  /*
> @@ -643,20 +647,28 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
>  static inline bool vma_read_trylock(struct vm_area_struct *vma)
>  {
>  	/* Check before locking. A race might cause false locked result. */
> -	if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> +	if (vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
>  		return false;
>  
> -	if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> +	if (unlikely(!atomic_inc_unless_negative(&vma->vm_lock->count)))
>  		return false;
>  
> +	/* If atomic_t overflows, restore and fail to lock. */
> +	if (unlikely(atomic_read(&vma->vm_lock->count) < 0)) {
> +		if (atomic_dec_and_test(&vma->vm_lock->count))
> +			wake_up(&vma->vm_mm->vma_writer_wait);
> +		return false;
> +	}
> +
>  	/*
>  	 * Overflow might produce false locked result.
>  	 * False unlocked result is impossible because we modify and check
>  	 * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
>  	 * modification invalidates all existing locks.
>  	 */
> -	if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> -		up_read(&vma->vm_lock->lock);
> +	if (unlikely(vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> +		if (atomic_dec_and_test(&vma->vm_lock->count))
> +			wake_up(&vma->vm_mm->vma_writer_wait);
>  		return false;
>  	}

With this change readers can cause writers to starve.
What about checking waitqueue_active() before or after increasing
vma->vm_lock->count?

--
Thanks,
Hyeonggon
