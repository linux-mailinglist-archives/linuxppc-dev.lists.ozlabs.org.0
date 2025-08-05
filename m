Return-Path: <linuxppc-dev+bounces-10645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D57BB1B14A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 11:38:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx7dr57wRz3069;
	Tue,  5 Aug 2025 19:38:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754386704;
	cv=none; b=W8KPW+0oeoEOEmwfwz/QTTwl2FvD0vspVxtGpcfeUz/8ce7md8eOoyYSnPmwvsVfQznJEUrc0AUDSZUOmFPFKQGvQUfOSnA5rD26BZnRysRGJSdi76YKBu3kHDz9O7JKV1gzYFUqf5VXGiWa4k+7DBgaWyorE3GVclbjkBXwKi+GTxeHAp3ko1on7lYX3NQhSnFlN3Ur6vhNuZctqYx9dMyFyx/UDg5Zn0uVfQ6w+/7GLN0Me2WpPtGuX7ZDQAvARRJHIsUqituMHg6l6Rn+dmJqHDiqglSMEpnBWlSe5BvvUcCFTdU/PrQ9TE8iCgS6QfwRTCKuqO3kyNMJniH/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754386704; c=relaxed/relaxed;
	bh=qq75wLn4Jr35PxKHT8Ir8YDRfOwxEOJ3fDUl+YJWOlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8VabYWR46wcRp2P5FGdwvmjpskmd6L3eCEYxdNm7bJUzPPkl6oyaOL+klm77J7+syxpGmsn+tP7trfV3jddSlwv9UPjihXACgU8EgobSil7wAydS6L+7mUpJ/e7jMGzp65DhEpmcEp4kl4xU9BSZoHC6fhYj2+/JYLFNi5GNMGoLG87lXU9jmmXsESTXmJmJdjGW+1RUKQSXVmCNccKzA2JkRx+B6TTm4WPkRozbSwjFrQiTH/AQMAtL+WJ4++eWibFXF0Xzcr10mwbxCSYhOw0lQ06XK14f4MlJbGBcWBnk21oPvFnQ4rvpYV66sIvSSfKJqTFX6YZLUTShvMklg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WaqdWXeH; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WaqdWXeH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bx7dq4s4bz3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 19:38:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 230995C3FEF;
	Tue,  5 Aug 2025 09:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73A3C4CEF7;
	Tue,  5 Aug 2025 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754386699;
	bh=PtcIziWKmeZojE8NbukEIlxT+NCLvvfcRfGscENjViM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WaqdWXeHFq4oltQn9PTlA505X/oL+/hHqNtgIoY7zKJ2rAIIyFMHaM+0OG/yh2pw4
	 a4OPg6vNpHqwYzZOYWH9z2eFj0o9qdjphfKwQATxpDET/tUKgH15v5CCmaccGtiziI
	 K47HqBXpuuIazHWs7f7nOBdJzkPcC6o7Uz2XE0NjVLokbL/vEdh4tvhC3lSlpz6wIJ
	 cRJvBI/3D77VRI3Nw6Ov+py/jFgFc5Ni8OH6Dnx4eGST8kP5vZjYp9Nb+FQNxwUhWq
	 2m2r86L7YkwtCZGME114r4pdSCFeteEHhrAOdiqvbKwV054IIClCJwCyv020K+cNSI
	 X5cmccT7jkP9Q==
Date: Tue, 5 Aug 2025 12:37:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	nvdimm@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm: update core kernel code to use vm_flags_t
 consistently
Message-ID: <aJHQ9XCLtibFjt93@kernel.org>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
 <aIgSpAnU8EaIcqd9@hyeyoo>
 <73764aaa-2186-4c8e-8523-55705018d842@lucifer.local>
 <aIkVRTouPqhcxOes@pc636>
 <69860c97-8a76-4ce5-b1d6-9d7c8370d9cd@lucifer.local>
 <aJCRXVP-ZFEPtl1Y@pc636>
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
In-Reply-To: <aJCRXVP-ZFEPtl1Y@pc636>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 12:54:21PM +0200, Uladzislau Rezki wrote:
> Hello, Lorenzo!
> 
> > So sorry Ulad, I meant to get back to you on this sooner!
> > 
> > On Tue, Jul 29, 2025 at 08:39:01PM +0200, Uladzislau Rezki wrote:
> > > On Tue, Jul 29, 2025 at 06:25:39AM +0100, Lorenzo Stoakes wrote:
> > > > Andrew - FYI there's nothing to worry about here, the type remains
> > > > precisely the same, and I'll send a patch to fix this trivial issue so when
> > > > later this type changes vmalloc will be uaffected.
> > > >
> > > > On Tue, Jul 29, 2025 at 09:15:51AM +0900, Harry Yoo wrote:
> > > > > [Adding Uladzislau to Cc]
> > > >
> > > > Ulad - could we PLEASE get rid of 'vm_flags' in vmalloc? It's the precise
> > > > same name and (currently) type as vma->vm_flags and is already the source
> > > > of confusion.
> > > >
> > > You mean all "vm_flags" variable names? "vm_struct" has flags as a
> > > member. So you want:
> > >
> > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/execmem.c
> > > 29:                          pgprot_t pgprot, unsigned long vm_flags)
> > > 39:             vm_flags |= VM_DEFER_KMEMLEAK;
> > > 41:     if (vm_flags & VM_ALLOW_HUGE_VMAP)
> > > 45:                              pgprot, vm_flags, NUMA_NO_NODE,
> > > 51:                                      pgprot, vm_flags, NUMA_NO_NODE,
> > > 85:                          pgprot_t pgprot, unsigned long vm_flags)
> > > 259:    unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> > > 266:    p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
> > > 376:    unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
> > > 385:            p = execmem_vmalloc(range, size, pgprot, vm_flags);
> > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/vmalloc.c
> > > 3853: * @vm_flags:                additional vm area flags (e.g. %VM_NO_GUARD)
> > > 3875:                   pgprot_t prot, unsigned long vm_flags, int node,
> > > 3894:   if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
> > > 3912:                             VM_UNINITIALIZED | vm_flags, start, end, node,
> > > 3977:   if (!(vm_flags & VM_DEFER_KMEMLEAK))
> > > 4621:   vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
> > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/execmem.c
> > > 29:                          pgprot_t pgprot, unsigned long vm_flags)
> > > 39:             vm_flags |= VM_DEFER_KMEMLEAK;
> > > 41:     if (vm_flags & VM_ALLOW_HUGE_VMAP)
> > > 45:                              pgprot, vm_flags, NUMA_NO_NODE,
> > > 51:                                      pgprot, vm_flags, NUMA_NO_NODE,
> > > 85:                          pgprot_t pgprot, unsigned long vm_flags)
> > > 259:    unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> > > 266:    p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
> > > 376:    unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
> > > 385:            p = execmem_vmalloc(range, size, pgprot, vm_flags);
> > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags ./include/linux/vmalloc.h
> > > 172:                    pgprot_t prot, unsigned long vm_flags, int node,
> > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$
> > >
> > > to rename all those "vm_flags" to something, for example, like "flags"?
> > 
> > Yeah, sorry I know it's a churny pain, but I think it's such a silly source
> > of confusion _in general_, not only this series where I made a mistake (of
> > course entirely my fault but certainly more understandable given the
> > naming), but in the past I've certainly sat there thinking 'hmmm wait' :)
> > 
> > Really I think we should rename 'vm_struct' too, but if that causes _too
> > much_ churn fair enough.

Well, it's not that terrible :)

~/git/linux$ git grep -w vm_struct | wc -l
173

> > I think even though it's long-winded, 'vmalloc_flags' would be good, both
> > in fields and local params as it makes things very very clear.
> > 
> > Equally 'vm_struct' -> 'vmalloc_struct' would be a good change.

Do we really need the _struct suffix?
How about vmalloc_area?

It also seems that struct vmap_area can be made private to mm/.

> Uh.. This could be a pain :) I will have a look and see what we can do.
> 
> Thanks!
> 
> --
> Uladzislau Rezki

-- 
Sincerely yours,
Mike.

