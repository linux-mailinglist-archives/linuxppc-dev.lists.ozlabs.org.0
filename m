Return-Path: <linuxppc-dev+bounces-17903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBU6C0zPrmnEIwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:46:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FD239F4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:46:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTywm2sxsz3bnm;
	Tue, 10 Mar 2026 00:46:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773064008;
	cv=none; b=DZdo1gDSUGbobcHe08OhyE23umjdClaeUDXMUEkvJptQfC4Ua2X4qL7pKq7KaLMGEbvmfoQaGzzA92ZDchS66HfL5uOlLTcE8Ex3pBAeI2/5oJOmo0+eeiVNdx+PLr/4mmgklZiYBYyNnfQQrHi4xCQXVTGkjpnKSQlSnXDXtbXS6TuFXshwZNTwpP03i8UeVf8x2AEgXkJoPswgBiSqlmCrRBOZrEQzMiOiPMF+VwysRCaqFhgo4tZXvTlTwpoo4Rjqbb2xd+hFHZQVQtksebUckvhedMLN0me0+sgTqKLl85qQ94DeQ6wjqsM0hck0kXyLUlGxLOj0e01Mi36JlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773064008; c=relaxed/relaxed;
	bh=zso1UHrl7gDNYxkrQKsLxt0cUGSVikyYTIXnkhMmBCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMoYvcW5TDy+zsk6re0EQMv+GYb20DvmM5RaTRoqh7fRXiGdCdEPByH/YZU7dQ+sjdHlwIFT4DM9iX6la3JBceOesNfXzPHSJWFZXrVf1mIZ2jCqRCO/ERZwYZfGeJvZLwBsD5+qfPbA6HsBGt9C5XdDM+5FySDKoK6r5CcBRKVd4xWIkD/peuf/KSQYTGe//kSqH3JXIthqthtURKE44FSNdm6VPX3I1xaBNQCTlJ9VUBx1qfVZJE0H2LHJgb7QIVc4gGJve5fzOiSDH7/jF0iehb9LEPYmoUv6MoI8xP92GRjSmeVteaFmxoLqsDSg6cxUOtxHXpcXz4LwU1wnrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BVr69GD8; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BVr69GD8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTywl2zn6z2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 00:46:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77C214423B;
	Mon,  9 Mar 2026 13:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF8FC4CEF7;
	Mon,  9 Mar 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773064005;
	bh=w0QUYZum+m+R/ZMJD9ICvWbnwxxvrz4NQJRGvdgYc+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVr69GD85TMcTAfG+a8utDGbnLRZpnfsgk6oAEieKIf3SbpafBvF3+irOxH5364Mf
	 5pQjiP3OB9FC6sxDF6sRahqD3JxDLeM/LKZhytQKKexcd9nKBgdJPKEyw8sk8hmBqZ
	 6Umeng6LJPjNhP9ijAtZ1GLP3fQirKriMZIBcjz1MV/Ly4Ym8+L+fbakf0sGYzf2HZ
	 3zIBqoZorFxzO8i8L6kszr5AnLvTpWYNSPn5PmXLkOowtVs0WINaH4TFDGQhbj2jWW
	 Xu+fRiMPtxXfm3CsyrGqKEUJHR4HPp+HrebcbqvJ0J7zXXW7tbIaDGtBQ28EmTK0dV
	 febooG99fQKig==
Date: Mon, 9 Mar 2026 13:46:27 +0000
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
Subject: Re: [PATCH v1 11/16] mm/memory: inline unmap_page_range() into
 __zap_vma_range()
Message-ID: <737a88b8-8221-44e6-aa90-3be326bc8612@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-12-david@kernel.org>
 <a5765cac-69d6-4314-82d5-80ee363906de@lucifer.local>
 <bc5cfcc4-5e51-4da1-9ce9-ea0831bec400@kernel.org>
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
In-Reply-To: <bc5cfcc4-5e51-4da1-9ce9-ea0831bec400@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 371FD239F4D
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
	TAGGED_FROM(0.00)[bounces-17903-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:16:26PM +0100, David Hildenbrand (Arm) wrote:
> On 3/6/26 13:29, Lorenzo Stoakes (Oracle) wrote:
> > On Fri, Feb 27, 2026 at 09:08:42PM +0100, David Hildenbrand (Arm) wrote:
> >> Let's inline it into the single caller to reduce the number of confusing
> >> unmap/zap helpers.
> >>
> >> Get rid of the unnecessary BUG_ON().
> >>
> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> > Small nits below, but overall LGTM so:
> >
> > Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> >
> >> ---
> >>  mm/memory.c | 32 ++++++++++++--------------------
> >>  1 file changed, 12 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/mm/memory.c b/mm/memory.c
> >> index 394b2e931974..1c0bcdfc73b7 100644
> >> --- a/mm/memory.c
> >> +++ b/mm/memory.c
> >> @@ -2056,25 +2056,6 @@ static inline unsigned long zap_p4d_range(struct mmu_gather *tlb,
> >>  	return addr;
> >>  }
> >>
> >> -static void unmap_page_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >> -		unsigned long addr, unsigned long end,
> >> -		struct zap_details *details)
> >> -{
> >> -	pgd_t *pgd;
> >> -	unsigned long next;
> >> -
> >> -	BUG_ON(addr >= end);
> >> -	tlb_start_vma(tlb, vma);
> >> -	pgd = pgd_offset(vma->vm_mm, addr);
> >> -	do {
> >> -		next = pgd_addr_end(addr, end);
> >> -		if (pgd_none_or_clear_bad(pgd))
> >> -			continue;
> >> -		next = zap_p4d_range(tlb, vma, pgd, addr, next, details);
> >> -	} while (pgd++, addr = next, addr != end);
> >> -	tlb_end_vma(tlb, vma);
> >> -}
> >> -
> >>  static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >>  		unsigned long start, unsigned long end,
> >>  		struct zap_details *details)
> >> @@ -2100,7 +2081,18 @@ static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >>  			return;
> >>  		__unmap_hugepage_range(tlb, vma, start, end, NULL, zap_flags);
> >>  	} else {
> >> -		unmap_page_range(tlb, vma, start, end, details);
> >> +		unsigned long next, cur = start;
> >
> > VERY nitty, but generally current is abbreviated to curr not cur.
> >
>
> The following might not be fully expressive (but simple to grep):
>
> $ git grep "cur_" | wc -l
> 24261
> $ git grep "curr_" | wc -l
> 9288

Lol hmm...

>
> Tells me that "cur" is rather common.
>
> > It's not a big deal, but why not addr?
>
> Good question, I can just do that. :)

Thanks!

>
> --
> Cheers,
>
> David

Cheers, Lorenzo

