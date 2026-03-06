Return-Path: <linuxppc-dev+bounces-17851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNB1ILVEq2nJbgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 22:18:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2652227E04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 22:18:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSK5Y6T7qz2yFl;
	Sat, 07 Mar 2026 08:18:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772800876;
	cv=none; b=AB6kiOQQuhtvFyO0UyTxn+Od9KSnPpO+GF+nEWgzKqIMMcDD76Hxew8/B0WeQXHJkAKdCn61tP4vGuoZ+oJGry9uQ1shPMYV35SRZ0BXKvHChZMMZRmEfaXtzCPLWuZHFLl2vA44mz9o8SJxNuuQyxNShpXUt+30ESf+IPgG5q4oEBF3O5gDNwlbNjSc3LK9IwRKk4cMnxKpZxw2CzfFOgUKfhFqe4yw3mUDzcKxBE0JU6WR77mNrmF1sboZyJfpwFwPf3BRzdE08uVQdDsgDk0jVV9SYqdtg3qbfe4ReWUTTyeoCbRJW+4HI9fEz8wI6HuLlIsFI3YZTRLUGwL93A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772800876; c=relaxed/relaxed;
	bh=UR8CfjV1tUrpLDvSF5b3+Dv//Kr4G++1kk561g+r+8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG/jVh1dSrsfKmFnfVjFnt/Tv9NK9orZhffnx2PYAIClys48P8udnk/AekUzhwKG+b5vZ20OjPjZmb9l7XkT2xPn6w4/vFXnvYNuOotemAjJlepOshUuEUUKh0ch9GOVNF/KvuQW8L7BJyw6aVY4mQ2J3v6PDXOLiG3P21/3BECSfb0HP4YsoQyJru8d4rKmNdqEEPHQJD/3zOZuj/8LwsxT7fP9qF2lyTqSi+csgRDX2OW2cj/mklYegPc6pub7TNeE3PAveRX/+q3YV/12CMqvluTWg6JoQf2rdTZxpybKT1Ut1P6z2NxTwmv0BCup4I6loMNTon8WBO8n+9C1fA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PpKc6rDA; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PpKc6rDA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS5cX0w7Bz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 23:41:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D83B44204;
	Fri,  6 Mar 2026 12:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964FFC4CEF7;
	Fri,  6 Mar 2026 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772800874;
	bh=lq+50juxWpZTD6H0V77Zyv6OGyq7pL6MoSFSgCZf0CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpKc6rDA59KGYIRFwtyM9Sadr3C/wX3fkFV3gIPSOjYDFuYBwWa3LLeEUMWZvdUF/
	 3G8BuvDsxyOn2WfkGJ83plefNiGw3aWzaX9FsviZQvjodMO4vhRQjPb/3a5QaHhww+
	 S2tDdIhK/WCnvNQyRu8Yz57kR9mVFrOxIG8qMWl67LGh9WILqiJV1HThKPDwhyxgZD
	 5N7vrK4zWbwHpmUbYWwGrY8KJ1KlCFzx5cMVqwe83rI13dEt/fd3J3VgWWNyc66R4Y
	 YdYvrCSktLxQzE/goRvNKT5ONqH1zXpLdBdwAe1BCtmd1nNFbiMMpRVKGpP+LFmrGQ
	 kQaNSV2mvY+qA==
Date: Fri, 6 Mar 2026 12:41:11 +0000
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
Subject: Re: [PATCH v1 15/16] mm: rename zap_vma_ptes() to
 zap_special_vma_range()
Message-ID: <c77c1bed-f04e-4f21-87d9-6c5da3f0ad69@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-16-david@kernel.org>
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
In-Reply-To: <20260227200848.114019-16-david@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: A2652227E04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,kernel.org,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-17851-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,lucifer.local:mid]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:08:46PM +0100, David Hildenbrand (Arm) wrote:
> zap_vma_ptes() is the only zapping function we export to modules.
>
> It's essentially a wrapper around zap_vma_range(), however, with some
> safety checks:
> * That the passed range fits fully into the VMA
> * That it's only used for VM_PFNMAP
>
> We might want to support VM_MIXEDMAP soon as well, so use the

I think you should say we _are_ going to since patch 16/16 does that :)

> more-generic term "special vma", although "special" is a bit overloaded.
> Maybe we'll later just support any VM_SPECIAL flag.

Yeah I hate the name, but I guess it's probably the best we can manage
because VM_SPECIAL and both VM_PFNMAP and VM_MIXEDMAP _are_ 'special' in
this sense so meh I guess it's the best we can do.

>
> While at it, improve the kerneldoc.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  arch/x86/kernel/cpu/sgx/encl.c        |  2 +-
>  drivers/comedi/comedi_fops.c          |  2 +-
>  drivers/gpu/drm/i915/i915_mm.c        |  4 ++--
>  drivers/infiniband/core/uverbs_main.c |  6 +++---
>  drivers/misc/sgi-gru/grumain.c        |  2 +-
>  include/linux/mm.h                    |  2 +-
>  mm/memory.c                           | 16 +++++++---------
>  7 files changed, 16 insertions(+), 18 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/sgx/encl.c b/arch/x86/kernel/cpu/sgx/encl.c
> index ac60ebde5d9b..3f0222d10f6e 100644
> --- a/arch/x86/kernel/cpu/sgx/encl.c
> +++ b/arch/x86/kernel/cpu/sgx/encl.c
> @@ -1220,7 +1220,7 @@ void sgx_zap_enclave_ptes(struct sgx_encl *encl, unsigned long addr)
>
>  			ret = sgx_encl_find(encl_mm->mm, addr, &vma);
>  			if (!ret && encl == vma->vm_private_data)
> -				zap_vma_ptes(vma, addr, PAGE_SIZE);
> +				zap_special_vma_range(vma, addr, PAGE_SIZE);
>
>  			mmap_read_unlock(encl_mm->mm);
>
> diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
> index 48a8a607a84c..b91e0b5ac394 100644
> --- a/drivers/comedi/comedi_fops.c
> +++ b/drivers/comedi/comedi_fops.c
> @@ -2588,7 +2588,7 @@ static int comedi_mmap(struct file *file, struct vm_area_struct *vma)
>  	 * remap_pfn_range() because we call remap_pfn_range() in a loop.
>  	 */
>  	if (retval)
> -		zap_vma_ptes(vma, vma->vm_start, size);
> +		zap_special_vma_range(vma, vma->vm_start, size);
>  #endif
>
>  	if (retval == 0) {
> diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
> index c33bd3d83069..fd89e7c7d8d6 100644
> --- a/drivers/gpu/drm/i915/i915_mm.c
> +++ b/drivers/gpu/drm/i915/i915_mm.c
> @@ -108,7 +108,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
>
>  	err = apply_to_page_range(r.mm, addr, size, remap_pfn, &r);
>  	if (unlikely(err)) {
> -		zap_vma_ptes(vma, addr, (r.pfn - pfn) << PAGE_SHIFT);
> +		zap_special_vma_range(vma, addr, (r.pfn - pfn) << PAGE_SHIFT);
>  		return err;
>  	}
>
> @@ -156,7 +156,7 @@ int remap_io_sg(struct vm_area_struct *vma,
>
>  	err = apply_to_page_range(r.mm, addr, size, remap_sg, &r);
>  	if (unlikely(err)) {
> -		zap_vma_ptes(vma, addr, r.pfn << PAGE_SHIFT);
> +		zap_special_vma_range(vma, addr, r.pfn << PAGE_SHIFT);
>  		return err;
>  	}
>
> diff --git a/drivers/infiniband/core/uverbs_main.c b/drivers/infiniband/core/uverbs_main.c
> index 7b68967a6301..f5837da47299 100644
> --- a/drivers/infiniband/core/uverbs_main.c
> +++ b/drivers/infiniband/core/uverbs_main.c
> @@ -756,7 +756,7 @@ static void rdma_umap_open(struct vm_area_struct *vma)
>  	 * point, so zap it.
>  	 */
>  	vma->vm_private_data = NULL;
> -	zap_vma_ptes(vma, vma->vm_start, vma->vm_end - vma->vm_start);
> +	zap_special_vma_range(vma, vma->vm_start, vma->vm_end - vma->vm_start);
>  }
>
>  static void rdma_umap_close(struct vm_area_struct *vma)
> @@ -782,7 +782,7 @@ static void rdma_umap_close(struct vm_area_struct *vma)
>  }
>
>  /*
> - * Once the zap_vma_ptes has been called touches to the VMA will come here and
> + * Once the zap_special_vma_range has been called touches to the VMA will come here and
>   * we return a dummy writable zero page for all the pfns.
>   */
>  static vm_fault_t rdma_umap_fault(struct vm_fault *vmf)
> @@ -878,7 +878,7 @@ void uverbs_user_mmap_disassociate(struct ib_uverbs_file *ufile)
>  				continue;
>  			list_del_init(&priv->list);
>
> -			zap_vma_ptes(vma, vma->vm_start,
> +			zap_special_vma_range(vma, vma->vm_start,
>  				     vma->vm_end - vma->vm_start);
>
>  			if (priv->entry) {
> diff --git a/drivers/misc/sgi-gru/grumain.c b/drivers/misc/sgi-gru/grumain.c
> index 8d749f345246..278b76cbd281 100644
> --- a/drivers/misc/sgi-gru/grumain.c
> +++ b/drivers/misc/sgi-gru/grumain.c
> @@ -542,7 +542,7 @@ void gru_unload_context(struct gru_thread_state *gts, int savestate)
>  	int ctxnum = gts->ts_ctxnum;
>
>  	if (!is_kernel_context(gts))
> -		zap_vma_ptes(gts->ts_vma, UGRUADDR(gts), GRU_GSEG_PAGESIZE);
> +		zap_special_vma_range(gts->ts_vma, UGRUADDR(gts), GRU_GSEG_PAGESIZE);
>  	cch = get_cch(gru->gs_gru_base_vaddr, ctxnum);
>
>  	gru_dbg(grudev, "gts %p, cbrmap 0x%lx, dsrmap 0x%lx\n",
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 833bedd3f739..07f6819db02d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2833,7 +2833,7 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>  struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
>  		pud_t pud);
>
> -void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
> +void zap_special_vma_range(struct vm_area_struct *vma, unsigned long address,
>  		  unsigned long size);
>  void zap_vma_range(struct vm_area_struct *vma, unsigned long address,
>  			   unsigned long size);
> diff --git a/mm/memory.c b/mm/memory.c
> index dd737b6d28c0..f3b7b7e16138 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2233,17 +2233,15 @@ void zap_vma_range(struct vm_area_struct *vma, unsigned long address,
>  }
>
>  /**
> - * zap_vma_ptes - remove ptes mapping the vma
> - * @vma: vm_area_struct holding ptes to be zapped
> - * @address: starting address of pages to zap
> + * zap_special_vma_range - zap all page table entries in a special vma range
> + * @vma: the vma covering the range to zap
> + * @address: starting address of the range to zap
>   * @size: number of bytes to zap
>   *
> - * This function only unmaps ptes assigned to VM_PFNMAP vmas.
> - *
> - * The entire address range must be fully contained within the vma.
> - *
> + * This function does nothing when the provided address range is not fully
> + * contained in @vma, or when the @vma is not VM_PFNMAP.
>   */
> -void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
> +void zap_special_vma_range(struct vm_area_struct *vma, unsigned long address,
>  		unsigned long size)
>  {
>  	if (!range_in_vma(vma, address, address + size) ||
> @@ -2252,7 +2250,7 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
>
>  	zap_vma_range(vma, address, size);
>  }
> -EXPORT_SYMBOL_GPL(zap_vma_ptes);
> +EXPORT_SYMBOL_GPL(zap_special_vma_range);
>
>  static pmd_t *walk_to_pmd(struct mm_struct *mm, unsigned long addr)
>  {
> --
> 2.43.0
>

