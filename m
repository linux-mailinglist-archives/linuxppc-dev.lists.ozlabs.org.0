Return-Path: <linuxppc-dev+bounces-17811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H/NGZPHqmnVWwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:24:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0EC22088F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:24:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS5FW6yf3z3cBx;
	Fri, 06 Mar 2026 23:24:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772798821;
	cv=none; b=Gih2jWtRMbGVcxc0+cdCpU+xpUnMac0BFf5WbjYmn+unSY4pGmI8aIY0t8d56TZWf1AkgcV31OhDWT9377VNe3pt8mzRdOMkhiwZfU97NqUvG4IznzD9f23Y09t4Q3w9rZ6We6NAw13ihcsVWeajLiBaw/uij1cITwiF+dHDKeuGDBPBGy46c2zY/NT99jBWvRA8fTenJ2lBqyqXUck1LsHuUMpWYfWLKVdsndjdbMshkLcyzKLR6ytmpU3g4/zphtr12mmNkvLgSjFaBa1NoqriIuGnUbJpEJGxuP7wlqfoaTs1InOkusrWbotTiJN3Pw4120p8uKE/I5PGUiwk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772798821; c=relaxed/relaxed;
	bh=zziktpr8HktYa7qEDALXh8cUdjlrPh7LBKj9C+z5yBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTRrLoSsNUG8y4B55AXHrDSeUlQYI5JvKVUqGP/I09VoQ19PA2AC0GtNQyJ3u/CzRtpiT87Vy08AXyGeIH496tbN7P+Wdw8JX4JOJDo+rpr15uJh4tA5ANgD+k7fHri+IA+V0ptmU8ebn8E7EUFKKSh4lbTIdK0ruKqzPiKB1TxbXlksjE4Q4QdIDPSZuJxncT1aR7o4xTmAjHw/splChapUJjwXKMQTZ/ZMgHJcfAAWfrJIzsInTOzF5vP4zTuEoq2CHxFLXkfWDHm5ZXfcgRrPudyHWhZ0qGQwVGfohBeT7EESyz3eTDR9xhYXKlythgcJ6PAjMNKJ418KOzqKXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AkmrBFKC; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AkmrBFKC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS4s01DqVz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 23:07:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E508260127;
	Fri,  6 Mar 2026 12:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC1EC4CEF7;
	Fri,  6 Mar 2026 12:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798817;
	bh=vBj3woozlRPQJAsoS5/IW+klSPAITAbOF218ghzCguY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkmrBFKCRbCHZUTyW9ICY4wBEh7Pe2S+YM/wqEXDcxFbGGnByiHHlbb3EYKuqNZO0
	 q2Usn/TeECRhZl/rRCEONLCagepvAgIirItP2eC3qQ8ChVybtdQP4cnbuxMspCqW2l
	 NuRTEQcZ4fNf0tnEm2Vt9rwza2i3hBvcHJoaSIUIev91gK+ZQxbmGNyuTbfBNfDzL8
	 uczsg8/HVlnzzRmWjuPHT7rnXFdsVjPMqku8Ani2QkPzrZQ1tx0APw0DKJ47bqWkCl
	 F3GWu9zvI/f7ShUPFDiLOLuo7Nr5RGLGYycyCEDy+H2U/X6/mJjX+zGqmWubbpWaHm
	 6cB2ohevQ1byA==
Date: Fri, 6 Mar 2026 12:06:54 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	"linux-mm @ kvack . org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Alice Ryhl <aliceryhl@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
	bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 02/16] mm/memory: remove "zap_details" parameter from
 zap_page_range_single()
Message-ID: <6ad209ea-4be2-42f0-94ef-a2da69292dc2@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-3-david@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227200848.114019-3-david@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: AC0EC22088F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,kernel.org,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-17811-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:aliceryhl@google.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.
 ca,m:leon@kernel.org,m:dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[74];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,lucifer.local:mid]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:08:33PM +0100, David Hildenbrand (Arm) wrote:
> Nobody except memory.c should really set that parameter to non-NULL. So
> let's just drop it and make unmap_mapping_range_vma() use
> zap_page_range_single_batched() instead.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

This is nice, good cleanup.

Assuming rust side is all sorted (seems it from thread)... LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  arch/s390/mm/gmap_helpers.c    |  2 +-
>  drivers/android/binder_alloc.c |  2 +-
>  include/linux/mm.h             |  5 ++---
>  kernel/bpf/arena.c             |  3 +--
>  kernel/events/core.c           |  2 +-
>  mm/madvise.c                   |  3 +--
>  mm/memory.c                    | 16 ++++++++++------
>  net/ipv4/tcp.c                 |  5 ++---
>  rust/kernel/mm/virt.rs         |  2 +-
>  9 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/arch/s390/mm/gmap_helpers.c b/arch/s390/mm/gmap_helpers.c
> index dea83e3103e5..ae2d59a19313 100644
> --- a/arch/s390/mm/gmap_helpers.c
> +++ b/arch/s390/mm/gmap_helpers.c
> @@ -89,7 +89,7 @@ void gmap_helper_discard(struct mm_struct *mm, unsigned long vmaddr, unsigned lo
>  		if (!vma)
>  			return;
>  		if (!is_vm_hugetlb_page(vma))
> -			zap_page_range_single(vma, vmaddr, min(end, vma->vm_end) - vmaddr, NULL);
> +			zap_page_range_single(vma, vmaddr, min(end, vma->vm_end) - vmaddr);
>  		vmaddr = vma->vm_end;
>  	}
>  }
> diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
> index 241f16a9b63d..dd2046bd5cde 100644
> --- a/drivers/android/binder_alloc.c
> +++ b/drivers/android/binder_alloc.c
> @@ -1185,7 +1185,7 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
>  	if (vma) {
>  		trace_binder_unmap_user_start(alloc, index);
>
> -		zap_page_range_single(vma, page_addr, PAGE_SIZE, NULL);
> +		zap_page_range_single(vma, page_addr, PAGE_SIZE);
>
>  		trace_binder_unmap_user_end(alloc, index);
>  	}
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ecff8268089b..a8138ff7d1fa 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2835,11 +2835,10 @@ struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
>  void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
>  		  unsigned long size);
>  void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> -			   unsigned long size, struct zap_details *details);
> +			   unsigned long size);
>  static inline void zap_vma_pages(struct vm_area_struct *vma)
>  {
> -	zap_page_range_single(vma, vma->vm_start,
> -			      vma->vm_end - vma->vm_start, NULL);
> +	zap_page_range_single(vma, vma->vm_start, vma->vm_end - vma->vm_start);
>  }
>  struct mmu_notifier_range;
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 144f30e740e8..c34510d83b1f 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -656,8 +656,7 @@ static void zap_pages(struct bpf_arena *arena, long uaddr, long page_cnt)
>  	guard(mutex)(&arena->lock);
>  	/* iterate link list under lock */
>  	list_for_each_entry(vml, &arena->vma_list, head)
> -		zap_page_range_single(vml->vma, uaddr,
> -				      PAGE_SIZE * page_cnt, NULL);
> +		zap_page_range_single(vml->vma, uaddr, PAGE_SIZE * page_cnt);
>  }
>
>  static void arena_free_pages(struct bpf_arena *arena, long uaddr, long page_cnt, bool sleepable)
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index ac70d68217b6..c94c56c94104 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7215,7 +7215,7 @@ static int map_range(struct perf_buffer *rb, struct vm_area_struct *vma)
>  #ifdef CONFIG_MMU
>  	/* Clear any partial mappings on error. */
>  	if (err)
> -		zap_page_range_single(vma, vma->vm_start, nr_pages * PAGE_SIZE, NULL);
> +		zap_page_range_single(vma, vma->vm_start, nr_pages * PAGE_SIZE);
>  #endif
>
>  	return err;
> diff --git a/mm/madvise.c b/mm/madvise.c
> index efc04334a000..557a360f7919 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1193,8 +1193,7 @@ static long madvise_guard_install(struct madvise_behavior *madv_behavior)
>  		 * OK some of the range have non-guard pages mapped, zap
>  		 * them. This leaves existing guard pages in place.
>  		 */
> -		zap_page_range_single(vma, range->start,
> -				range->end - range->start, NULL);
> +		zap_page_range_single(vma, range->start, range->end - range->start);
>  	}
>
>  	/*
> diff --git a/mm/memory.c b/mm/memory.c
> index 9385842c3503..19f5f9a60995 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2203,17 +2203,16 @@ void zap_page_range_single_batched(struct mmu_gather *tlb,
>   * @vma: vm_area_struct holding the applicable pages
>   * @address: starting address of pages to zap
>   * @size: number of bytes to zap
> - * @details: details of shared cache invalidation
>   *
>   * The range must fit into one VMA.
>   */
>  void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> -		unsigned long size, struct zap_details *details)
> +		unsigned long size)
>  {
>  	struct mmu_gather tlb;
>
>  	tlb_gather_mmu(&tlb, vma->vm_mm);
> -	zap_page_range_single_batched(&tlb, vma, address, size, details);
> +	zap_page_range_single_batched(&tlb, vma, address, size, NULL);
>  	tlb_finish_mmu(&tlb);
>  }
>
> @@ -2235,7 +2234,7 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
>  	    		!(vma->vm_flags & VM_PFNMAP))
>  		return;
>
> -	zap_page_range_single(vma, address, size, NULL);
> +	zap_page_range_single(vma, address, size);
>  }
>  EXPORT_SYMBOL_GPL(zap_vma_ptes);
>
> @@ -3003,7 +3002,7 @@ static int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long add
>  	 * maintain page reference counts, and callers may free
>  	 * pages due to the error. So zap it early.
>  	 */
> -	zap_page_range_single(vma, addr, size, NULL);
> +	zap_page_range_single(vma, addr, size);
>  	return error;
>  }
>
> @@ -4226,7 +4225,12 @@ static void unmap_mapping_range_vma(struct vm_area_struct *vma,
>  		unsigned long start_addr, unsigned long end_addr,
>  		struct zap_details *details)
>  {
> -	zap_page_range_single(vma, start_addr, end_addr - start_addr, details);
> +	struct mmu_gather tlb;
> +
> +	tlb_gather_mmu(&tlb, vma->vm_mm);
> +	zap_page_range_single_batched(&tlb, vma, start_addr,
> +				      end_addr - start_addr, details);
> +	tlb_finish_mmu(&tlb);
>  }
>
>  static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index f84d9a45cc9d..befcde27dee7 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -2104,7 +2104,7 @@ static int tcp_zerocopy_vm_insert_batch_error(struct vm_area_struct *vma,
>  		maybe_zap_len = total_bytes_to_map -  /* All bytes to map */
>  				*length + /* Mapped or pending */
>  				(pages_remaining * PAGE_SIZE); /* Failed map. */
> -		zap_page_range_single(vma, *address, maybe_zap_len, NULL);
> +		zap_page_range_single(vma, *address, maybe_zap_len);
>  		err = 0;
>  	}
>
> @@ -2269,8 +2269,7 @@ static int tcp_zerocopy_receive(struct sock *sk,
>  	total_bytes_to_map = avail_len & ~(PAGE_SIZE - 1);
>  	if (total_bytes_to_map) {
>  		if (!(zc->flags & TCP_RECEIVE_ZEROCOPY_FLAG_TLB_CLEAN_HINT))
> -			zap_page_range_single(vma, address, total_bytes_to_map,
> -					      NULL);
> +			zap_page_range_single(vma, address, total_bytes_to_map);
>  		zc->length = total_bytes_to_map;
>  		zc->recv_skip_hint = 0;
>  	} else {
> diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> index da21d65ccd20..b8e59e4420f3 100644
> --- a/rust/kernel/mm/virt.rs
> +++ b/rust/kernel/mm/virt.rs
> @@ -124,7 +124,7 @@ pub fn zap_page_range_single(&self, address: usize, size: usize) {
>          // sufficient for this method call. This method has no requirements on the vma flags. The
>          // address range is checked to be within the vma.
>          unsafe {
> -            bindings::zap_page_range_single(self.as_ptr(), address, size, core::ptr::null_mut())
> +            bindings::zap_page_range_single(self.as_ptr(), address, size)
>          };
>      }
>
> --
> 2.43.0
>

