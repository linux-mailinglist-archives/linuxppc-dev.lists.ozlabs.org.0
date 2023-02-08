Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E93268E593
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 02:49:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBNGd6bdBz3bW6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:49:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pR81DF44;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pR81DF44;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBNFk3DvBz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 12:48:57 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id pj3so16906259pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 17:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T2dajks7+pLSuhCk0mnl5yufn01/RNR3ouO2WMM0QZw=;
        b=pR81DF44OfWquLPnGm6SkA1FB6N+pwQAdnY8mkVyK+SimNhi9y2ULovzSn1jp1qhqc
         mwLwe4WyIPB58XgoAt87CNAIhERfXOvmMCVSUJbO05YoWnMWIxAN+l+Zu0X+nNogvcgK
         9VOZPjnGugfGTxtJvJvy4yTI2QTDa0mk7EiJWvkTx1slVJJupGcuePODKdMVH+Utl9YN
         8wDq+5FQHemIrSq/AKc3i4nb0qTZmJnz6SZ5KWE4+vgOc8+8aWsxDeTTQNIRA6AMysse
         8Tv3p/dMtikONAl03d0CsQmmxg2GAWCwfZOUVMpE07f96bEwQnGspwatTyOu0ibhzWkV
         UoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2dajks7+pLSuhCk0mnl5yufn01/RNR3ouO2WMM0QZw=;
        b=uRA5dcmUpJ08KISa/9yxGLjDhzrkrmnVteCms5D+/OI88hUa2SjXGGSfS0q9HS+uC+
         N5eMzCSqZCDOVK/3Ziga/dj2LVH3vdVpUa3osgaa/LiXuPr6JzwCV8KI53ftvNwWnIIz
         kdmtUNRQg9haafvBef7IR2meyXW0iUlS9G2ifQ4IN/VGxS427jo4DCx8ZJV2u0P7mNGL
         Hv32sZc3439XOmxlGx0TM/G8xYySbe6t1tU/3AuugtNWZBkJknWPSGMhPKh+mEm49jDd
         P0aWWpsCkFJ4HhcegKydHSJl6f9d7xEV0TO+VHveWVg8/c3N0Ns+GQ/iXSkGwfDMPqy9
         a7GA==
X-Gm-Message-State: AO0yUKVS6bhIwLWYJqpHDNenaLiz4WeNLwqxXNyirJIt0XPFPcYEdAd/
	N/AcZcD9efqiJXLAunZtSvQ=
X-Google-Smtp-Source: AK7set+naAmhvq2efFvTFqN3g41QFEpkFxiyEFRHmMtUw8p7kOQvCHxftMqwTIX2qsh3cugyi2g6LA==
X-Received: by 2002:a17:90b:4a8e:b0:22b:f780:d346 with SMTP id lp14-20020a17090b4a8e00b0022bf780d346mr6363137pjb.1.1675820934449;
        Tue, 07 Feb 2023 17:48:54 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090a4b4a00b002308f09460fsm195288pjl.26.2023.02.07.17.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 17:48:52 -0800 (PST)
Date: Wed, 8 Feb 2023 01:48:39 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 2/7] mm: introduce vma->vm_flags wrapper functions
Message-ID: <Y+L/dzMaraz5oC3N@localhost>
References: <20230126193752.297968-1-surenb@google.com>
 <20230126193752.297968-3-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126193752.297968-3-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity
 .net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 11:37:47AM -0800, Suren Baghdasaryan wrote:
> vm_flags are among VMA attributes which affect decisions like VMA merging
> and splitting. Therefore all vm_flags modifications are performed after
> taking exclusive mmap_lock to prevent vm_flags updates racing with such
> operations. Introduce modifier functions for vm_flags to be used whenever
> flags are updated. This way we can better check and control correct
> locking behavior during these updates.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>
> ---
>  include/linux/mm.h       | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/mm_types.h | 10 +++++++++-
>  2 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 8d636e895ee9..abb31103d060 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -627,6 +627,46 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
>  }
>  
> +/* Use when VMA is not part of the VMA tree and needs no locking */
> +static inline void vm_flags_init(struct vm_area_struct *vma,
> +				 vm_flags_t flags)
> +{
> +	ACCESS_PRIVATE(vma, __vm_flags) = flags;
> +}
> +
> +/* Use when VMA is part of the VMA tree and modifications need coordination */
> +static inline void vm_flags_reset(struct vm_area_struct *vma,
> +				  vm_flags_t flags)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	vm_flags_init(vma, flags);
> +}
> +
> +static inline void vm_flags_set(struct vm_area_struct *vma,
> +				vm_flags_t flags)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	ACCESS_PRIVATE(vma, __vm_flags) |= flags;
> +}
> +
> +static inline void vm_flags_clear(struct vm_area_struct *vma,
> +				  vm_flags_t flags)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	ACCESS_PRIVATE(vma, __vm_flags) &= ~flags;
> +}
> +
> +/*
> + * Use only when the order of set/clear operations is unimportant, otherwise
> + * use vm_flags_{set|clear} explicitly.
> + */
> +static inline void vm_flags_mod(struct vm_area_struct *vma,
> +				vm_flags_t set, vm_flags_t clear)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	vm_flags_init(vma, (vma->vm_flags | set) & ~clear);
> +}
> +
>  static inline void vma_set_anonymous(struct vm_area_struct *vma)
>  {
>  	vma->vm_ops = NULL;
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 2d6d790d9bed..da983aedb741 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -491,7 +491,15 @@ struct vm_area_struct {
>  	 * See vmf_insert_mixed_prot() for discussion.
>  	 */
>  	pgprot_t vm_page_prot;
> -	unsigned long vm_flags;		/* Flags, see mm.h. */
> +
> +	/*
> +	 * Flags, see mm.h.
> +	 * To modify use vm_flags_{init|reset|set|clear|mod} functions.
> +	 */
> +	union {
> +		const vm_flags_t vm_flags;
> +		vm_flags_t __private __vm_flags;
> +	};
>  
>  	/*
>  	 * For areas with an address space and backing store,

Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

> -- 
> 2.39.1
> 
> 
