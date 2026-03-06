Return-Path: <linuxppc-dev+bounces-17810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IbkHYvHqmnVWwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:24:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF522087F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:24:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS5FM5xpyz3c5f;
	Fri, 06 Mar 2026 23:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772798610;
	cv=none; b=W6UJnOSbL8xMtY64PTkYtO6Eo38DH9EliHq+IBUZMZa7cwpTObna40ZQp5i0jUc4Zu/MmW2bfoNdGC3jCGQ7rsTBc/am2ghp6lIAnXLvSuz5eAnhJ+GlwzSTpyBxUxMkvPg9qkZxfbz6vMJwKPfFAoG+qb0nw42OD9D50rpVT7tRag0eKu0AwSwPdLxZS8PYayOcSW+EJGJwLIy7dz14FpkTxIBl60/Ie6eKfMMlEww9oPKAxFuVe6EEMq9hrUBgtgr8A5UZDeLyquCgOR3GUgzGTCU6K6yTmHdgrTnVHPpFN+KqyKYZV2bBi920YFf5lFIQwpkRsBJ/O3/bzDWuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772798610; c=relaxed/relaxed;
	bh=MaeKwxlFADDb0SCG7LFbZRQ+3aRrnHNNxNfktnf9Iog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiLJ/6xCajCSpNzEkxddsSz3b/lguKwaV66IWvI84JtcOD62RwEZEybGymhehz6uMIgiYUx43FkE5soZNhbt0y94oWmqtnw/uIOm9+GMJ0GI/4v6/CTO2pnjPtiodD3tAKREqgSR1LWbUNarsi89kALlQMmxDM3CD1V6Lnoz20v0ixav5cd61BQa886JafVM9yCGR6iDUUwpUm9Y5erOCweknq3lA6XXaMkQgYLlW1ADmOzHFMTy6tauPoW7UgkTqkiWajJvgJsAEMETBakbMspI29+wz+t4VSB5Wns1JbMiWxy9eoEss4FErQgRu1Da7ny2Q4IxzocVfmbXLz9qTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h1hNNt/g; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h1hNNt/g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS4mx62hzz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 23:03:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C88E6013E;
	Fri,  6 Mar 2026 12:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6488CC4CEF7;
	Fri,  6 Mar 2026 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798607;
	bh=8tIEjkmwTnv14wqiBx5utAVT1y4BywX848doWLEUMyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1hNNt/ggkmOIg6nOIs6YVKXxpvjxXfuNC1/E243FERUMlrdAP/1JGuS8WftUsd7f
	 sEmFfcrfCzizYh1WflGJxM+Mh8s8/NGzCybtmxDbPIa+RYlLhAC8M2mVomjBVzk4GJ
	 ovvi/YoGsX9AnKFqWBjW+IpIUt/t0ThtH++DKgi9JosbOXhePSuaAgqwo9ysipyiZZ
	 tJR6V8PVm0Q3rJsUQBZpi2/tPfiYYA+aTsakBMmVszHI4rXW/zZE1/jrzMC/3s/CgY
	 3bcJ8hm+9ce3MEINimXRaNGIqZXC4Xd93/yIA5/AX590NC8dE2fbRiLTj205GiFNUz
	 8UXcS4I1Opdeg==
Date: Fri, 6 Mar 2026 12:03:24 +0000
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
Subject: Re: [PATCH v1 01/16] mm/madvise: drop range checks in
 madvise_free_single_vma()
Message-ID: <c5a89c14-0c6b-4c1e-a68c-0680c7d64f4c@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-2-david@kernel.org>
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
In-Reply-To: <20260227200848.114019-2-david@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 83BF522087F
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
	TAGGED_FROM(0.00)[bounces-17810-lists,linuxppc-dev=lfdr.de];
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

On Fri, Feb 27, 2026 at 09:08:32PM +0100, David Hildenbrand (Arm) wrote:
> madvise_vma_behavior()-> madvise_dontneed_free()->madvise_free_single_vma()
> is only called from madvise_walk_vmas()
>
> (a) After try_vma_read_lock() confirmed that the whole range falls into
>     a single VMA (see is_vma_lock_sufficient()).
>
> (b) After adjusting the range to the VMA in the loop afterwards.
>
> madvise_dontneed_free() might drop the MM lock when handling
> userfaultfd, but it properly looks up the VMA again to adjust the range.
>
> So in madvise_free_single_vma(), the given range should always fall into
> a single VMA and should also span at least one page.
>
> Let's drop the error checks.
>
> The code now matches what we do in madvise_dontneed_single_vma(), where
> we call zap_vma_range_batched() that documents: "The range must fit into
> one VMA.". Although that function still adjusts that range, we'll change
> that soon.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Yeah I did wonder about some of these checks, thanks for going through and
confirming these are useless.

Checked the madvise_dontneed_free() case to be sure and LGTM so overall:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  mm/madvise.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index c0370d9b4e23..efc04334a000 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -799,9 +799,10 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior)
>  {
>  	struct mm_struct *mm = madv_behavior->mm;
>  	struct vm_area_struct *vma = madv_behavior->vma;
> -	unsigned long start_addr = madv_behavior->range.start;
> -	unsigned long end_addr = madv_behavior->range.end;
> -	struct mmu_notifier_range range;
> +	struct mmu_notifier_range range = {
> +		.start = madv_behavior->range.start,
> +		.end = madv_behavior->range.end,
> +	};
>  	struct mmu_gather *tlb = madv_behavior->tlb;
>  	struct mm_walk_ops walk_ops = {
>  		.pmd_entry		= madvise_free_pte_range,
> @@ -811,12 +812,6 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior)
>  	if (!vma_is_anonymous(vma))
>  		return -EINVAL;
>
> -	range.start = max(vma->vm_start, start_addr);
> -	if (range.start >= vma->vm_end)
> -		return -EINVAL;
> -	range.end = min(vma->vm_end, end_addr);
> -	if (range.end <= vma->vm_start)
> -		return -EINVAL;
>  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm,
>  				range.start, range.end);
>
> --
> 2.43.0
>

