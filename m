Return-Path: <linuxppc-dev+bounces-10566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB7AB1A006
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 12:54:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwYNB59ywz30Yb;
	Mon,  4 Aug 2025 20:54:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754304874;
	cv=none; b=TcLr4SooCxDgm4iiaOgn0kNJrG3Qr3vDeVLxT9jdZ/Iq9hB5Id/5YjgYlDjd9pt9Lu+QqgmtmRfs+OOC/l32GRi3P2HYT/i3rStnpWPEmyp2tvO39jJmoKe3YjNViN7nWRYYkJDIv2lN0s3rJvVk+3w27KLT3S/KM90QfqW6FbKHcOrH7ghInN2BqJ2X0D8gpgXki1uuXHUh+Ixb/2UIrEVBslOCrba/nmO+FOabMjR8K4bQoi7OIdSsMi9L6K3Z/a8cwszNGkwRsjISaDJjZrfzTy/59e31H6EVDGTWArpOfv7Bg3Ir8USJAQgYhVGES2AnFrP8GU1tnZVTSxIEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754304874; c=relaxed/relaxed;
	bh=X4RxvHMamXD48DKrjLVxOGxx8Xo0bomZZqlvqy6+mMo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERAYAHe5sCNzqWMzAWZFTIh/V0E+/HGGesW/31EHwxoREeeLrq5TvXvFck3qqgmS51Suy97cRKmuoaN+oVS1W2tQRAS6nATevDquTfQ1Ex9ISX/6LR7ZxE8e4UZvwJQsqHc0Fs6cUHChyiQE0NNIXybCvQ4KJyMVzI84EjQCEuzFKdlnqackG3BCfb/ibAiIIYsYHOmICIhpeom6CyMgzSrj+IZdAxViE3EhkSbyx6bJGM8OjNGetn1CoRdgnqyeRxSKCVCCudltqHcKu4qaepVs08DJBD+1ZF0KaBxRoOkBpB7bwadm1iKnlC+K78EH9A8xDreGu2spWERuDoqCWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U5psyo0S; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U5psyo0S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwYN84gjbz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 20:54:31 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-33245e653bbso20770531fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 03:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754304868; x=1754909668; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4RxvHMamXD48DKrjLVxOGxx8Xo0bomZZqlvqy6+mMo=;
        b=U5psyo0Si2oGcjEJv/IdnbW6zWNG/JyqZEWkwFQsbMepHTq25+8MDbs930OOCUhn9D
         TjBU/JXCK0TJiXm1VPOSwF5Q8oIdNiO9zJkoKm2IXOhkYbDNMeIPl6ZfVtaoYJtdmpEJ
         dbU6P/fS27BXELCPcxGAdi8tB4i9Rg7xiS1+7JlInxaHqYCdQk57fNZwFIIbghNgKnnk
         KLHQl7JVju69D/BcJwI1axvKq6UjOY1Gu1Uap8Sj3oKqkLyhQt8J6rBrJwrgWUVRT9MV
         BEJQnUym4NyXfLGc/CAkVdZ2O5OLFd+Yhocac4CgRFZoxOL1brEWu7UzhjWaXICbWZN6
         dEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754304868; x=1754909668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4RxvHMamXD48DKrjLVxOGxx8Xo0bomZZqlvqy6+mMo=;
        b=fI43L/697FI0XgUr0uClgmHwvrhCL22DYU9Via8MmWXRIF0T0iu9hl8Mmd0p/StT/i
         nBso/V5g+Sd7RhaoiXJRjbtb4/5VRLrqArV8qZ4NW7PeKv3G4f6iL/RDwuWGvCAmJver
         ffxHKCbXeGejs8iQJFGuZGyvpbDVZn/zxOx/vwmpezDF6wFu6TqpiId3esTJGV13clY1
         2J19n8vB4rDWCnfZxqmP32Ydt+E0gr2PsbT95ymWsoPUaa2ZJB6Z5YZMrpjQwOlMBSDw
         sZaqLjee/daQsVgAj1ICWWi8bZgJyEToUv2/Wpj8PEUaKoz3utO7v1bayEsTfKvAUcSM
         MogA==
X-Forwarded-Encrypted: i=1; AJvYcCVOqki8ZRxALZaXJgtbaT/CEMiwXezDtoHwEitzZD70RmwSyoWGE4N1bkdPXbAf8Kz+fHuveygr92caOUY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhnPg8jcaaIcTS4xKbRgWOjAcr/y5BMBUdx/xUWz1MUWSPD2rr
	w7wsTZ+WDKxwP0Yg12RtEJ8qV/F0F78BnLkqcx1gwnlaIWnIV14o3pg9
X-Gm-Gg: ASbGncumW8wbm/in9e6n4l0kcE2i1I5seOwSj8zd9kjUKsNu7BNwHGYW9W9shwPo/7R
	HJmBtBhh/orhAPJ/ps3xsL1iqlISlWh3qbuLU/lzB7c/y4BgTvMahU28cSZR9y9ndQV+NQxWNwc
	My1NrxGsY39QVz9pExV0ziXqihT2dIOnUV+VRseX12BoNOBVV9QMxl6IpFhyh5qorWUJxjEtW7g
	WrW56FBnqZS+zKNGmv1uWsxNeXRn8/R4XHGru3Sq7tmos/B5zsxA1ytmxhm/KHLQ/D5SAweh8DV
	KOE4z2dTbWcIBsTkPfujoSEvRfkrW7klw4GtPn+FsyyvlP3pPsuL7grSRSAPHxtm1c8WuLe28z3
	oTaaRMesVm1WGL3nzvO7eLzwn4lmAELFKEImIl6W5BLQFh/NQlv2+CVFs0rU8
X-Google-Smtp-Source: AGHT+IGJZZFcFy8qBb/9BVJvSpxogtzfM17wxVB5B1bfSxKSrolhCiqzChAu468YcmIMkpSbHFvpbA==
X-Received: by 2002:a05:651c:20ce:20b0:332:4a77:ad9f with SMTP id 38308e7fff4ca-3325677af91mr12521651fa.24.1754304867614;
        Mon, 04 Aug 2025 03:54:27 -0700 (PDT)
Received: from pc636 (host-95-203-22-207.mobileonline.telia.com. [95.203.22.207])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238271bdfsm16396311fa.6.2025.08.04.03.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 03:54:26 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 4 Aug 2025 12:54:21 +0200
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Harry Yoo <harry.yoo@oracle.com>,
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
	Mike Rapoport <rppt@kernel.org>,
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
Message-ID: <aJCRXVP-ZFEPtl1Y@pc636>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
 <aIgSpAnU8EaIcqd9@hyeyoo>
 <73764aaa-2186-4c8e-8523-55705018d842@lucifer.local>
 <aIkVRTouPqhcxOes@pc636>
 <69860c97-8a76-4ce5-b1d6-9d7c8370d9cd@lucifer.local>
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
In-Reply-To: <69860c97-8a76-4ce5-b1d6-9d7c8370d9cd@lucifer.local>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello, Lorenzo!

> So sorry Ulad, I meant to get back to you on this sooner!
> 
> On Tue, Jul 29, 2025 at 08:39:01PM +0200, Uladzislau Rezki wrote:
> > On Tue, Jul 29, 2025 at 06:25:39AM +0100, Lorenzo Stoakes wrote:
> > > Andrew - FYI there's nothing to worry about here, the type remains
> > > precisely the same, and I'll send a patch to fix this trivial issue so when
> > > later this type changes vmalloc will be uaffected.
> > >
> > > On Tue, Jul 29, 2025 at 09:15:51AM +0900, Harry Yoo wrote:
> > > > [Adding Uladzislau to Cc]
> > >
> > > Ulad - could we PLEASE get rid of 'vm_flags' in vmalloc? It's the precise
> > > same name and (currently) type as vma->vm_flags and is already the source
> > > of confusion.
> > >
> > You mean all "vm_flags" variable names? "vm_struct" has flags as a
> > member. So you want:
> >
> > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/execmem.c
> > 29:                          pgprot_t pgprot, unsigned long vm_flags)
> > 39:             vm_flags |= VM_DEFER_KMEMLEAK;
> > 41:     if (vm_flags & VM_ALLOW_HUGE_VMAP)
> > 45:                              pgprot, vm_flags, NUMA_NO_NODE,
> > 51:                                      pgprot, vm_flags, NUMA_NO_NODE,
> > 85:                          pgprot_t pgprot, unsigned long vm_flags)
> > 259:    unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> > 266:    p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
> > 376:    unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
> > 385:            p = execmem_vmalloc(range, size, pgprot, vm_flags);
> > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/vmalloc.c
> > 3853: * @vm_flags:                additional vm area flags (e.g. %VM_NO_GUARD)
> > 3875:                   pgprot_t prot, unsigned long vm_flags, int node,
> > 3894:   if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
> > 3912:                             VM_UNINITIALIZED | vm_flags, start, end, node,
> > 3977:   if (!(vm_flags & VM_DEFER_KMEMLEAK))
> > 4621:   vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
> > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/execmem.c
> > 29:                          pgprot_t pgprot, unsigned long vm_flags)
> > 39:             vm_flags |= VM_DEFER_KMEMLEAK;
> > 41:     if (vm_flags & VM_ALLOW_HUGE_VMAP)
> > 45:                              pgprot, vm_flags, NUMA_NO_NODE,
> > 51:                                      pgprot, vm_flags, NUMA_NO_NODE,
> > 85:                          pgprot_t pgprot, unsigned long vm_flags)
> > 259:    unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> > 266:    p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
> > 376:    unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
> > 385:            p = execmem_vmalloc(range, size, pgprot, vm_flags);
> > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags ./include/linux/vmalloc.h
> > 172:                    pgprot_t prot, unsigned long vm_flags, int node,
> > urezki@pc638:~/data/backup/coding/linux-not-broken.git$
> >
> > to rename all those "vm_flags" to something, for example, like "flags"?
> 
> Yeah, sorry I know it's a churny pain, but I think it's such a silly source
> of confusion _in general_, not only this series where I made a mistake (of
> course entirely my fault but certainly more understandable given the
> naming), but in the past I've certainly sat there thinking 'hmmm wait' :)
> 
> Really I think we should rename 'vm_struct' too, but if that causes _too
> much_ churn fair enough.
> 
> I think even though it's long-winded, 'vmalloc_flags' would be good, both
> in fields and local params as it makes things very very clear.
>
> 
> Equally 'vm_struct' -> 'vmalloc_struct' would be a good change.
> 
Uh.. This could be a pain :) I will have a look and see what we can do.

Thanks!

--
Uladzislau Rezki

