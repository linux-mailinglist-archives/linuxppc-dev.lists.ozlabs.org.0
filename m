Return-Path: <linuxppc-dev+bounces-10667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C652BB1B82D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 18:14:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxJQT1gh5z3blg;
	Wed,  6 Aug 2025 02:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754410449;
	cv=none; b=ZW/nqgKcbqXeLiVioMOa3UNlsKMGQNUKbig10num0+t9eo7CJwx7GuGwDenL6BxFPl/xCsZaASADZaRdcSUMllgbxQOC8DSBCNYFMhdul4cwlVLnoHsre+cyqUl31FRY65afcNphrzCUFD23VcjreE7fBbNSedgBFrQUjVJ1zYm2dG3DZoeoFCtsiK81gOc7xUudKUqn3CrllexdKfcGFwa+76z61JByk9LoaQacorGBv/iyajlI5KD7ptZR/53BA2f2IZQxW77yxvgRYlmaT7uVboo9I0s9z3qWAAHtksT57yPjeSO4fAA4EmS3L105kq2a3+LGgV/icCVBBD1cng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754410449; c=relaxed/relaxed;
	bh=ut5lsjSSswYnbLzk6rrdmu5+CeAKFhijQRi1rB1wfMg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgX5XCQmKmLFPf5MLPUdvFWW2HmL1BAkAqO/UYqaXt9Qrt66onVzhthOA7KeaWCFF21ZsxhdtQSI1lZ5W1pwM6mx+ofDhuAeTXc3qOgc9O2mzzv+dEbR2W/vlL8biajMyhkgiehsbgXdJ1csDwES9OC50wUir/H6cSPTJYfvTLS3zH8a1bF3QAIktKHB9B8G9XbGtvCFT9x3Vrjs090o7E+dEmuPPEJqy+65bSQQ4cHfIyKMBrEry7SKip23Ked/b+yUCjloo80MaE2sJnfREfEMfSTNC+1puM7t6KUFRWAiKivSrgCeOZd0e1KhXJO4Z4TiX2Mtmk79zUrIG1WbCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TlWMt2rT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TlWMt2rT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxJQR5qh0z3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 02:14:06 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-332631e47afso714451fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754410442; x=1755015242; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ut5lsjSSswYnbLzk6rrdmu5+CeAKFhijQRi1rB1wfMg=;
        b=TlWMt2rTOdEpcnjGMviU9kDPGioTQVsfEQc9ES4GPMcNVuhOS4XHv6aPFzz9EZblYI
         sQ22YgH8mb5RxHcJI1glDxd9yc+8pkNqeh4Cm9iLhpXobPzutYcqp3lesKuXFJDj8zTb
         WwpKiGuJ6xK5WaSvzsbuoFidtGg1QY0sMOlU27WCCMT7PPpdO3iBGnvWJr+my6geDP0q
         +zFf0kFirDNtO+Bl3WOYEZAWDHwYHDpwgMR2GgTQ2BuuNzTNPkwVWBZtuYddtpQoYifG
         z3Ge6jhcPx/1lgvZeHvqAM5B2TDhweGs4/xDgm3QsreW7Av7E3Pw84wXR6PEuc2nRGcr
         i3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754410442; x=1755015242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut5lsjSSswYnbLzk6rrdmu5+CeAKFhijQRi1rB1wfMg=;
        b=katqIBppxhQ9ZsRt/pa52SMtrjtwR4OsT95jvnDtJC1NXpeXMVE4pkpbr7T70G3iyj
         WqjJ4qcny8b89hWEhpQsUMI8BTyGFkb+hGAGVp6RMe1lhrm301K4+aI0t72En77l419x
         hcKdlskfGkLb/GzUUasEFSBFZNtiULX2tZT9bRVL7PNV3i4n9TeD9Wi4TNctffJjhFay
         FfbdyTT3gYzvu0ubplBM3mtEu7NXHopLgisN+834JIQOp8N17H5lxvMTnE3sMgPIH4Ta
         0F64ubvnPbwwjzutHSDTpf6z3zwPR+MfM1FaNJuN3PGedRcOuyOvlSZ66M0cBJGWMVow
         Ejhw==
X-Forwarded-Encrypted: i=1; AJvYcCUmZPbyOYD3r5k9oPQBgEhS9ulBhK95b/w1qA/gegTPdOrnk8RHxRN6XPTN1UGnmDEh+ldhQZPpExhebhw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhC/31ygaZyKO/ZkPx36jXoDyeIEh/qlRgy0QEdmiZoto8UeRs
	tZqUbXnwhUniRAWRxQu9cCHBH4KXJ8lEm6BE9ywSX4XWUWNLWcMT+Jz9
X-Gm-Gg: ASbGncvynf79VV3GfOgdH8qsqTpfBIKuG61n6B3+TXTGWLaUqNiUZ2+lDjXLGb2ceaA
	080VPv29+WyzF9mie2irgq5iuUcyyYp9OsNqTXOJEE2kDDnRE6sdd72aqPIj9neabRgWEfc/fEI
	N+YNQr8s0dvuXR16EzD2+psBMm4O+p42EycWYpAngzUe6L4YtpaqpRCQjuM93J2UzgbHcfQItsI
	I7q/k9lYJVrFFyrzrK/U3tT3xa/s/rwLaXZzzbQUrGu6JR/UJqXSFKm9Y4jBzMPncxEWlgLjixn
	7/rFL6sMnH9ovHLDvKNn8JuwHEL+Ge4i20h16xuv/FrmDhZg2uS/1ziNGFvOw9/2X/AptRriokT
	7oIeILt2bB5viC4mtsmmdAtgI/dVSpUPwZLW6cpElDbwd3KPhXQ==
X-Google-Smtp-Source: AGHT+IH0xPAx9h/e+86wx2UChAIDs8RS46jNjVMEpxxiiDlgZAALsSVVnEbgPp+pN/RR7dfa5MNCmA==
X-Received: by 2002:a05:651c:b0f:b0:332:341d:9531 with SMTP id 38308e7fff4ca-3327b9157d5mr10915411fa.12.1754410441379;
        Tue, 05 Aug 2025 09:14:01 -0700 (PDT)
Received: from pc636 (host-95-203-18-142.mobileonline.telia.com. [95.203.18.142])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238272ff7sm20616811fa.7.2025.08.05.09.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:14:00 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 5 Aug 2025 18:13:56 +0200
To: Mike Rapoport <rppt@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
Message-ID: <aJItxJNfn8B2JBbn@pc636>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
 <aIgSpAnU8EaIcqd9@hyeyoo>
 <73764aaa-2186-4c8e-8523-55705018d842@lucifer.local>
 <aIkVRTouPqhcxOes@pc636>
 <69860c97-8a76-4ce5-b1d6-9d7c8370d9cd@lucifer.local>
 <aJCRXVP-ZFEPtl1Y@pc636>
 <aJHQ9XCLtibFjt93@kernel.org>
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
In-Reply-To: <aJHQ9XCLtibFjt93@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 12:37:57PM +0300, Mike Rapoport wrote:
> On Mon, Aug 04, 2025 at 12:54:21PM +0200, Uladzislau Rezki wrote:
> > Hello, Lorenzo!
> > 
> > > So sorry Ulad, I meant to get back to you on this sooner!
> > > 
> > > On Tue, Jul 29, 2025 at 08:39:01PM +0200, Uladzislau Rezki wrote:
> > > > On Tue, Jul 29, 2025 at 06:25:39AM +0100, Lorenzo Stoakes wrote:
> > > > > Andrew - FYI there's nothing to worry about here, the type remains
> > > > > precisely the same, and I'll send a patch to fix this trivial issue so when
> > > > > later this type changes vmalloc will be uaffected.
> > > > >
> > > > > On Tue, Jul 29, 2025 at 09:15:51AM +0900, Harry Yoo wrote:
> > > > > > [Adding Uladzislau to Cc]
> > > > >
> > > > > Ulad - could we PLEASE get rid of 'vm_flags' in vmalloc? It's the precise
> > > > > same name and (currently) type as vma->vm_flags and is already the source
> > > > > of confusion.
> > > > >
> > > > You mean all "vm_flags" variable names? "vm_struct" has flags as a
> > > > member. So you want:
> > > >
> > > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/execmem.c
> > > > 29:                          pgprot_t pgprot, unsigned long vm_flags)
> > > > 39:             vm_flags |= VM_DEFER_KMEMLEAK;
> > > > 41:     if (vm_flags & VM_ALLOW_HUGE_VMAP)
> > > > 45:                              pgprot, vm_flags, NUMA_NO_NODE,
> > > > 51:                                      pgprot, vm_flags, NUMA_NO_NODE,
> > > > 85:                          pgprot_t pgprot, unsigned long vm_flags)
> > > > 259:    unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> > > > 266:    p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
> > > > 376:    unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
> > > > 385:            p = execmem_vmalloc(range, size, pgprot, vm_flags);
> > > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/vmalloc.c
> > > > 3853: * @vm_flags:                additional vm area flags (e.g. %VM_NO_GUARD)
> > > > 3875:                   pgprot_t prot, unsigned long vm_flags, int node,
> > > > 3894:   if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
> > > > 3912:                             VM_UNINITIALIZED | vm_flags, start, end, node,
> > > > 3977:   if (!(vm_flags & VM_DEFER_KMEMLEAK))
> > > > 4621:   vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
> > > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/execmem.c
> > > > 29:                          pgprot_t pgprot, unsigned long vm_flags)
> > > > 39:             vm_flags |= VM_DEFER_KMEMLEAK;
> > > > 41:     if (vm_flags & VM_ALLOW_HUGE_VMAP)
> > > > 45:                              pgprot, vm_flags, NUMA_NO_NODE,
> > > > 51:                                      pgprot, vm_flags, NUMA_NO_NODE,
> > > > 85:                          pgprot_t pgprot, unsigned long vm_flags)
> > > > 259:    unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> > > > 266:    p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
> > > > 376:    unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
> > > > 385:            p = execmem_vmalloc(range, size, pgprot, vm_flags);
> > > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags ./include/linux/vmalloc.h
> > > > 172:                    pgprot_t prot, unsigned long vm_flags, int node,
> > > > urezki@pc638:~/data/backup/coding/linux-not-broken.git$
> > > >
> > > > to rename all those "vm_flags" to something, for example, like "flags"?
> > > 
> > > Yeah, sorry I know it's a churny pain, but I think it's such a silly source
> > > of confusion _in general_, not only this series where I made a mistake (of
> > > course entirely my fault but certainly more understandable given the
> > > naming), but in the past I've certainly sat there thinking 'hmmm wait' :)
> > > 
> > > Really I think we should rename 'vm_struct' too, but if that causes _too
> > > much_ churn fair enough.
> 
> Well, it's not that terrible :)
> 
> ~/git/linux$ git grep -w vm_struct | wc -l
> 173
> 
Indeed :)


> > > I think even though it's long-winded, 'vmalloc_flags' would be good, both
> > > in fields and local params as it makes things very very clear.
> > > 
> > > Equally 'vm_struct' -> 'vmalloc_struct' would be a good change.
> 
> Do we really need the _struct suffix?
> How about vmalloc_area?
> 
I think, we should not use vmalloc_ prefix here, because vmalloc
operates within its own range: VMALLOC_START:VMALLOC_END, therefore
it might be confusing also.

others can use another regions. vmap_mapping?

>
> It also seems that struct vmap_area can be made private to mm/.
> 
I agree. Also it can be even moved under vmalloc.c. There is only one
user which needs it globally, it is usercopy.c. It uses find_vmap_area()
which is wrong. See:

<snip>
	if (is_vmalloc_addr(ptr) && !pagefault_disabled()) {
		struct vmap_area *area = find_vmap_area(addr);

		if (!area)
			usercopy_abort("vmalloc", "no area", to_user, 0, n);

		if (n > area->va_end - addr) {
			offset = addr - area->va_start;
			usercopy_abort("vmalloc", NULL, to_user, offset, n);
		}
		return;
	}
<snip>

we can add a function which just assign va_start, va_end as input
parameters and use them in the usercopy.c. 

Thanks!

--
Uladzislau Rezki

