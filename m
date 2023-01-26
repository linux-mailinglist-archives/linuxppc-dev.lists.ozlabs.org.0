Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF74767D5A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:47:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rnq4bD9z3fYB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:47:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOR8SpJG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOR8SpJG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rhT29GRz3fHc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:42:33 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FEA6618D3;
	Thu, 26 Jan 2023 19:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD75DC433EF;
	Thu, 26 Jan 2023 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674762149;
	bh=E0Awn8IrDI0cjsY1zBcnDnJ8/kHskzlyS2ZRlhbVGpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOR8SpJGBLgLCTbpFfWyABzoglOwWkVC4qJRpXwMyy8edq2U+IEetogeCxqMJORUL
	 ITlr15BU3l4JyJpIzyGlxgIWpIxtCBzYYG/isBf5BBRviAFqo5RV2ZXv3hzbt8Jy8A
	 fi8bCQ9hiE0NpulsRBz/XpA+dgRYmn+gvnB+zONjs+eJJs0AHxg6vEMaLbfkYU2ETm
	 vbXycJ2kHYRY8NeQNaxsRJBqkCG0WGIdpk833PNIjQ/xBFcQ4NkNN0S3fRfUNO3HYg
	 MIU2+pOOlnxz7zr9qwC1zq871fB0XOWKtA84xyaxjyohcEs5R3BSlVDTrd9nvE/dzb
	 k33gM0+Rg4mMA==
Date: Thu, 26 Jan 2023 21:42:05 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 2/7] mm: introduce vma->vm_flags wrapper functions
Message-ID: <Y9LXjSKIb27YUk0d@kernel.org>
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
 .net
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

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

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
> -- 
> 2.39.1
> 

-- 
Sincerely yours,
Mike.
