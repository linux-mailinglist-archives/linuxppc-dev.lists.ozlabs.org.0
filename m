Return-Path: <linuxppc-dev+bounces-17918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG2sMlz5rmliLAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 17:46:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689823CF87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 17:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV2vr545qz3cB0;
	Tue, 10 Mar 2026 03:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773074776;
	cv=none; b=UpvHEra7pUXBP46F/Zx1AYIRr+Sz4P25n+APjLWrzZk3oKCMk9mMc91jfReLlwoi6sIX9MeHnLJNM+W2cdKshY70KUWD9FFRB3/s8DCaGvCm1GC3V2StJTmYLAvarwpaKN4caRPrxvy4GmYMIObCnAceBXD1yTL+5EXhE4bUAcGBD3F4p1osIobwZrW/bI2MrX7EUeFuX6olA83fbTYa3RnungUnOGyBKNv1HsPEJVMEnGAmAPcpZNS/qHNhiPgk6bynQFUvp1OmuwZLFjuMFq6YOLKiCK26AoPi+1ygTJgK6Yht1DqpOh69k5eORZt45Hy9T6fQvuBgkZpTKnSoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773074776; c=relaxed/relaxed;
	bh=HHpTgBH/1pdlBt7gfG4W877BfmosGBp7vW+6BcH8ozk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e9PSIwiuT2tTc9E8TKZL3TFJfqeC0QToyFVJhXqYVZct/hqFS8lfkcs4H8eGiDlgQeBNAHZoqVCLCUVjap434I1cQdoN2G54UHzIide/9YA9kZHdOU81scUhgsykRHFgm/xXusK77Ivw9pzbDowuln0GJcZ/tBjIkEMtnGuu5QVU/kTgGyvZNz/OaBqhCATmbM2U2VAMyJWhYN30QBevzwKzG4MLM3KHq0AeYZHAA1YXoX1qMEi8Ab7nOP9NeT5ZlTROFq5ukMB0YFV9RiAmr4aZfIsG8FycXcOxPnIi+182LI1PITHF0TSBjmyB68yV1XBPA9Q1KR/dxb9WjyTvxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LzK0cQVs; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LzK0cQVs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV2vq5xgsz3c9l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 03:46:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09D5440E3A;
	Mon,  9 Mar 2026 16:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49200C2BC86;
	Mon,  9 Mar 2026 16:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074773;
	bh=Tqx7dK7zOG7rDfy0y5qpLKhV/OEzGrhs5r7m6DAJi38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LzK0cQVs8ML2i3sxYVbeGEnQp3w8SiK+QCVVNiljg5JvL/h1NF64fnF/LeKgIGdiK
	 FOGHzG/pM6V0WQ0+b8SQ0t/UMvJOUMcusbuLVmT/L9OqD1faOj86rMgMiOHjdxvqGI
	 yIQ/9OIKCWBpkH4MHWrgENng96n48RfZlIt9izmWjO4cti60m/ZwnFqRYcL5mCDTwP
	 DfuORlXZKGVaEPeUO4naijPeyrfCDna/PZ7pWLYmdFjFehFa05pbi7AVJIw8tnnEyc
	 ZTPJPpl/MNPND8YXYuNEC+NesxXKrtqgA8aH5SvyaoIRcGYq2BHQTMuqf6hml1zBOr
	 7JQtnjx5KlFCw==
From: Puranjay Mohan <puranjay@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org
Cc: "linux-mm @ kvack . org" <linux-mm@kvack.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
 <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alice Ryhl <aliceryhl@google.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=
 <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Carlos Llamas
 <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten
 <hsweeten@visionengravers.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Dimitri
 Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Eric Dumazet
 <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, "David S.
 Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miguel Ojeda
 <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 14/16] mm: rename zap_page_range_single() to
 zap_vma_range()
In-Reply-To: <20260227200848.114019-15-david@kernel.org>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-15-david@kernel.org>
Date: Mon, 09 Mar 2026 16:46:09 +0000
Message-ID: <m2y0k1vtm6.fsf@kernel.org>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3689823CF87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17918-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:aliceryhl@google.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.
 ca,m:leon@kernel.org,m:dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[puranjay@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[puranjay@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> Let's rename it to make it better match our new naming scheme.
>
> While at it, polish the kerneldoc.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  arch/s390/mm/gmap_helpers.c          |  2 +-
>  drivers/android/binder/page_range.rs |  4 ++--
>  drivers/android/binder_alloc.c       |  2 +-
>  include/linux/mm.h                   |  4 ++--
>  kernel/bpf/arena.c                   |  2 +-
>  kernel/events/core.c                 |  2 +-
>  mm/madvise.c                         |  4 ++--
>  mm/memory.c                          | 14 +++++++-------
>  net/ipv4/tcp.c                       |  6 +++---
>  rust/kernel/mm/virt.rs               |  4 ++--
>  10 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/arch/s390/mm/gmap_helpers.c b/arch/s390/mm/gmap_helpers.c
> index ae2d59a19313..f8789ffcc05c 100644
> --- a/arch/s390/mm/gmap_helpers.c
> +++ b/arch/s390/mm/gmap_helpers.c
> @@ -89,7 +89,7 @@ void gmap_helper_discard(struct mm_struct *mm, unsigned long vmaddr, unsigned lo
>  		if (!vma)
>  			return;
>  		if (!is_vm_hugetlb_page(vma))
> -			zap_page_range_single(vma, vmaddr, min(end, vma->vm_end) - vmaddr);
> +			zap_vma_range(vma, vmaddr, min(end, vma->vm_end) - vmaddr);
>  		vmaddr = vma->vm_end;
>  	}
>  }
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> index fdd97112ef5c..2fddd4ed8d4c 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -130,7 +130,7 @@ pub(crate) struct ShrinkablePageRange {
>      pid: Pid,
>      /// The mm for the relevant process.
>      mm: ARef<Mm>,
> -    /// Used to synchronize calls to `vm_insert_page` and `zap_page_range_single`.
> +    /// Used to synchronize calls to `vm_insert_page` and `zap_vma_range`.
>      #[pin]
>      mm_lock: Mutex<()>,
>      /// Spinlock protecting changes to pages.
> @@ -719,7 +719,7 @@ fn drop(self: Pin<&mut Self>) {
>  
>      if let Some(vma) = mmap_read.vma_lookup(vma_addr) {
>          let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> -        vma.zap_page_range_single(user_page_addr, PAGE_SIZE);
> +        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
>      }
>  
>      drop(mmap_read);
> diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
> index dd2046bd5cde..e4488ad86a65 100644
> --- a/drivers/android/binder_alloc.c
> +++ b/drivers/android/binder_alloc.c
> @@ -1185,7 +1185,7 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
>  	if (vma) {
>  		trace_binder_unmap_user_start(alloc, index);
>  
> -		zap_page_range_single(vma, page_addr, PAGE_SIZE);
> +		zap_vma_range(vma, page_addr, PAGE_SIZE);
>  
>  		trace_binder_unmap_user_end(alloc, index);
>  	}
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 4bd1500b9630..833bedd3f739 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2835,7 +2835,7 @@ struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
>  
>  void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
>  		  unsigned long size);
> -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +void zap_vma_range(struct vm_area_struct *vma, unsigned long address,
>  			   unsigned long size);
>  /**
>   * zap_vma - zap all page table entries in a vma
> @@ -2843,7 +2843,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
>   */
>  static inline void zap_vma(struct vm_area_struct *vma)
>  {
> -	zap_page_range_single(vma, vma->vm_start, vma->vm_end - vma->vm_start);
> +	zap_vma_range(vma, vma->vm_start, vma->vm_end - vma->vm_start);
>  }
>  struct mmu_notifier_range;
>  
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index c34510d83b1f..37843c6a4764 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -656,7 +656,7 @@ static void zap_pages(struct bpf_arena *arena, long uaddr, long page_cnt)
>  	guard(mutex)(&arena->lock);
>  	/* iterate link list under lock */
>  	list_for_each_entry(vml, &arena->vma_list, head)
> -		zap_page_range_single(vml->vma, uaddr, PAGE_SIZE * page_cnt);
> +		zap_vma_range(vml->vma, uaddr, PAGE_SIZE * page_cnt);
>  }

Acked-by: Puranjay Mohan <puranjay@kernel.org>

