Return-Path: <linuxppc-dev+bounces-17850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOIKEalEq2nJbgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 22:18:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 524FB227DE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 22:18:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSK5K3hfVz3cCM;
	Sat, 07 Mar 2026 08:18:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772800813;
	cv=none; b=UsLhbEc26tsSW+BZm9alcjZ8+WCFv6KYnopug7RhIVpqFK7homH13Fdn6BUuFV5HrNL2NWbaVD9V/rTkL27+SZh1o2xHrEQXjS3I2fuJjaajjwfrWGisY6OBX9rajFa8l+S5L+12idlCEIK2lJCrat71p7gC9ffXPKYpc3kiG6nOjldqc3KJbjt7q/Dq7G+lvHnTuPSbv7moSXa3FheZeC8hh2++iGdrRqdmDPRFmgpamZzJUyVzOMkJSPf2Be5mXc3/Z+jj7yyMVMUbFWHJKdwFE2soY3mQIoTP67+6N+tQnLFveQzcxl1gKMEJpu+KN9K0xtkYtI/TRk0qD7nkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772800813; c=relaxed/relaxed;
	bh=TpDZjWzos6QZl9FjPk//2imOO7vtv9Ovb5TykMgmnq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2TCnb8z129vTnSx0fhMUR7Z6P+niPR42V8Aw3FpPJhjm0YkT/oL5RwDrHoi/MrF+JHc6ZN4LW2lD6bq1wWTyHrwpPdyKW3VsxIJh7N8HeCDTGe67R7Ce9Qk9cEcLhoRNmzrQh6A3h7mSulSrMyrNqypGy9nPUcM1vYPdGqSXrdwbncA18NK7YKestzc8Ytgfx8xUBNALi1/ExQakC8olm4C/Gquu5+A6fwpjrsCrPqN0c8a+dsHDEWGCpuB291AYC4FdHgUB3lprlnIbx3ePwB/mLh/yCmGzOMnLYB78GoMV/c1jq+SZrQRHdSMaHkiXa7ISW8xhB6HSdVSK3wJFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=teU+WZvc; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=teU+WZvc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS5bJ74Rnz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 23:40:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 466E2444A2;
	Fri,  6 Mar 2026 12:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E997C4CEF7;
	Fri,  6 Mar 2026 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772800810;
	bh=momqQiCPeBiESmsNjbCQuXjIElnPD5t8ixlqkLdaUNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teU+WZvcr3Vfjfj4PS79KVLwqpyqTY1ONa1PtwIvjXtMon6hdWoFyi7tYSgQVQlA7
	 7WqNZXjH072FsKlQxHwMb1xYD4ogJ/HhRqFMhvz7mUpomd6qDRF1LsEb2Nx0xCA20F
	 Q306mWNpenrHSDponyi32Ye/+ALDPg+T87ZCaJf9rHbmPLs7TEcXwfiNFZJ08Qk58i
	 YudRyMnPxWInwwAAt3CqHvwKRQrMAo7VQbC5DvtngGuMvZuxZUii1u78G4eRDQ1D/r
	 cgHhuLioq6MaNE+pd+1wCN6iTybUQcrEBmRwhDJWiYLDD7kyNQioEEvs3ECG9KmNxt
	 q/+pMMPgggcHw==
Date: Fri, 6 Mar 2026 12:40:07 +0000
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
Subject: Re: [PATCH v1 08/16] mm/memory: move adjusting of address range to
 unmap_vmas()
Message-ID: <6858ccdd-5065-4396-81c9-489bf2d43c9e@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-9-david@kernel.org>
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
In-Reply-To: <20260227200848.114019-9-david@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 524FB227DE5
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
	TAGGED_FROM(0.00)[bounces-17850-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,lucifer.local:mid]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:08:39PM +0100, David Hildenbrand (Arm) wrote:
> __zap_vma_range() has two callers, whereby
> zap_page_range_single_batched() documents that the range must fit into
> the VMA range.
>
> So move adjusting the range to unmap_vmas() where it is actually
> required and add a safety check in __zap_vma_range() instead. In
> unmap_vmas(), we'd never expect to have empty ranges (otherwise, why
> have the vma in there in the first place).
>
> __zap_vma_range() will no longer be called with start == end, so
> cleanup the function a bit. While at it, simplify the overly long
> comment to its core message.
>
> We will no longer call uprobe_munmap() for start == end, which actually
> seems to be the right thing to do.
>
> Note that hugetlb_zap_begin()->...->adjust_range_if_pmd_sharing_possible()
> cannot result in the range exceeding the vma range.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, So:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  mm/memory.c | 58 +++++++++++++++++++++--------------------------------
>  1 file changed, 23 insertions(+), 35 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index f0aaec57a66b..fdcd2abf29c2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2073,44 +2073,28 @@ static void unmap_page_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  	tlb_end_vma(tlb, vma);
>  }
>
> -
> -static void __zap_vma_range(struct mmu_gather *tlb,
> -		struct vm_area_struct *vma, unsigned long start_addr,
> -		unsigned long end_addr, struct zap_details *details)
> +static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> +		unsigned long start, unsigned long end,
> +		struct zap_details *details)
>  {
> -	unsigned long start = max(vma->vm_start, start_addr);
> -	unsigned long end;
> -
> -	if (start >= vma->vm_end)
> -		return;
> -	end = min(vma->vm_end, end_addr);
> -	if (end <= vma->vm_start)
> -		return;
> +	VM_WARN_ON_ONCE(start >= end || !range_in_vma(vma, start, end));
>
>  	if (vma->vm_file)
>  		uprobe_munmap(vma, start, end);
>
> -	if (start != end) {
> -		if (unlikely(is_vm_hugetlb_page(vma))) {
> -			/*
> -			 * It is undesirable to test vma->vm_file as it
> -			 * should be non-null for valid hugetlb area.
> -			 * However, vm_file will be NULL in the error
> -			 * cleanup path of mmap_region. When
> -			 * hugetlbfs ->mmap method fails,
> -			 * mmap_region() nullifies vma->vm_file
> -			 * before calling this function to clean up.
> -			 * Since no pte has actually been setup, it is
> -			 * safe to do nothing in this case.
> -			 */
> -			if (vma->vm_file) {
> -				zap_flags_t zap_flags = details ?
> -				    details->zap_flags : 0;
> -				__unmap_hugepage_range(tlb, vma, start, end,
> -							     NULL, zap_flags);
> -			}
> -		} else
> -			unmap_page_range(tlb, vma, start, end, details);
> +	if (unlikely(is_vm_hugetlb_page(vma))) {
> +		zap_flags_t zap_flags = details ? details->zap_flags : 0;
> +
> +		/*
> +		 * vm_file will be NULL when we fail early while instantiating
> +		 * a new mapping. In this case, no pages were mapped yet and
> +		 * there is nothing to do.
> +		 */
> +		if (!vma->vm_file)
> +			return;
> +		__unmap_hugepage_range(tlb, vma, start, end, NULL, zap_flags);
> +	} else {
> +		unmap_page_range(tlb, vma, start, end, details);
>  	}
>  }
>
> @@ -2174,8 +2158,9 @@ void unmap_vmas(struct mmu_gather *tlb, struct unmap_desc *unmap)
>  				unmap->vma_start, unmap->vma_end);
>  	mmu_notifier_invalidate_range_start(&range);
>  	do {
> -		unsigned long start = unmap->vma_start;
> -		unsigned long end = unmap->vma_end;
> +		unsigned long start = max(vma->vm_start, unmap->vma_start);
> +		unsigned long end = min(vma->vm_end, unmap->vma_end);
> +
>  		hugetlb_zap_begin(vma, &start, &end);
>  		__zap_vma_range(tlb, vma, start, end, &details);
>  		hugetlb_zap_end(vma, &details);
> @@ -2204,6 +2189,9 @@ void zap_page_range_single_batched(struct mmu_gather *tlb,
>
>  	VM_WARN_ON_ONCE(!tlb || tlb->mm != vma->vm_mm);
>
> +	if (unlikely(!size))
> +		return;
> +
>  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
>  				address, end);
>  	hugetlb_zap_begin(vma, &range.start, &range.end);
> --
> 2.43.0
>

