Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A181B94C716
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 00:46:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fC9ThsyC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg2GG2NGCz2ydQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 08:46:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fC9ThsyC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3nkq1zgykdeuzlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg2FZ58Pcz2yGd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 08:45:53 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7a2d4261a48so1282551a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 15:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723157151; x=1723761951; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zNoZqlzt9ZBl78Ypw3YUgXOuKREj1jjRu4BYW9vQ8bI=;
        b=fC9ThsyCpJSCgLIALLzg6B21npxmVjFqvRUKcDgBddr2JD2vcTNUzwFqM0HYyhYBzn
         18GWqdVX+ZUGSg6c1M40Pw4jLb5ospcSMWaC1PfeVFL7ZHIteqYBwofLYYqNoZzxtU+f
         rv+PJHwfMQrqiPcD2Vdr5ycrto2RZzBA1L+DMQTX//TW93Aewq2Ydq9OjHSeQJ1C9TkI
         p+qcoSbIs8qpe8228Qu8Pbabah7IpQbmsqwIz0jVQl/qSEBecVEpqr5AMRgh5zsLO83j
         lemdTksgIdoD7qOw50jHjo5sHIWuZMAkMbfEdKZfqQkZVrY8jrRLMCwQUdSk7M85l5L0
         w4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723157151; x=1723761951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNoZqlzt9ZBl78Ypw3YUgXOuKREj1jjRu4BYW9vQ8bI=;
        b=BK9vi94pTIXEHEMGkrIOu4HbSe6IGezXMXGM/zdNEN2peWYvJhip38qDl3hzJh4JzN
         g5ejZP40e47fStYz/Jo/86gUxzfz/wyVvtYTPg2c11rOmEGmqtT03SjPfbzCpB0aXdCw
         iv2R+1TKKy1+qphrNxIAU+fFeApcnd4EGlUSnYBhcHa+Lokdj86srEhjD+UHMTOHmSiD
         06vb3GwMHNT5GU6J6ocFQHpTLEo3QtBLiO9vZk1TuopeIUDGDMZNbpOBtG8a4bFlSLhl
         6d0/9BEKu0YTpMHWTI66K8kzDVzhXWmi0dDNDgcWSw8MFAL7oopKeiuDc490UZzKvKgp
         Kqvw==
X-Forwarded-Encrypted: i=1; AJvYcCXxhe/k6jLXReNdYDe3fbhvOYFSk3S2qjGe6C16EJ+gfoWGua+HNATWQPMRX0HUl7keEG6h1voPLAqQglKTBXek4xKxi9I1d47alJdJOg==
X-Gm-Message-State: AOJu0YwYtzUXyc/22wACM7e856oO9u9t7ARmuA2ncs4MDiClnv+3ydPq
	8yT9PDOuFceEea1FV1Xk1kw76lXdP8GGg/rFTda2iULSKHi7bfXD7qTKLZYk+DxSxB39V6Enz0c
	QXg==
X-Google-Smtp-Source: AGHT+IEPJ08ELA+TzWWFCZw07FCvVi/TuALPCbLFSyKyDr+wDhcDE59d0hzyaFMhbl9jQNfxVlpU+d7vYMQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:b242:0:b0:6e7:95d3:b35c with SMTP id
 41be03b00d2f7-7c2684072femr6690a12.5.1723157150809; Thu, 08 Aug 2024 15:45:50
 -0700 (PDT)
Date: Thu, 8 Aug 2024 15:45:49 -0700
In-Reply-To: <ZrU9AJi7-pHT_UWS@x1n>
Mime-Version: 1.0
References: <20240807194812.819412-1-peterx@redhat.com> <20240807194812.819412-3-peterx@redhat.com>
 <ZrTlZ4vZ74sK8Ydd@google.com> <ZrU20AqADICwwmCy@x1n> <ZrU5JyjIa1CwZ_KD@google.com>
 <ZrU9AJi7-pHT_UWS@x1n>
Message-ID: <ZrVKndceu5gZT-j5@google.com>
Subject: Re: [PATCH v4 2/7] mm/mprotect: Push mmu notifier to PUDs
From: Sean Christopherson <seanjc@google.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, David Rientjes <rientjes@google.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08, 2024, Peter Xu wrote:
> On Thu, Aug 08, 2024 at 02:31:19PM -0700, Sean Christopherson wrote:
> > On Thu, Aug 08, 2024, Peter Xu wrote:
> > > Hi, Sean,
> > > 
> > > On Thu, Aug 08, 2024 at 08:33:59AM -0700, Sean Christopherson wrote:
> > > > On Wed, Aug 07, 2024, Peter Xu wrote:
> > > > > mprotect() does mmu notifiers in PMD levels.  It's there since 2014 of
> > > > > commit a5338093bfb4 ("mm: move mmu notifier call from change_protection to
> > > > > change_pmd_range").
> > > > > 
> > > > > At that time, the issue was that NUMA balancing can be applied on a huge
> > > > > range of VM memory, even if nothing was populated.  The notification can be
> > > > > avoided in this case if no valid pmd detected, which includes either THP or
> > > > > a PTE pgtable page.
> > > > > 
> > > > > Now to pave way for PUD handling, this isn't enough.  We need to generate
> > > > > mmu notifications even on PUD entries properly.  mprotect() is currently
> > > > > broken on PUD (e.g., one can easily trigger kernel error with dax 1G
> > > > > mappings already), this is the start to fix it.
> > > > > 
> > > > > To fix that, this patch proposes to push such notifications to the PUD
> > > > > layers.
> > > > > 
> > > > > There is risk on regressing the problem Rik wanted to resolve before, but I
> > > > > think it shouldn't really happen, and I still chose this solution because
> > > > > of a few reasons:
> > > > > 
> > > > >   1) Consider a large VM that should definitely contain more than GBs of
> > > > >   memory, it's highly likely that PUDs are also none.  In this case there
> > > > 
> > > > I don't follow this.  Did you mean to say it's highly likely that PUDs are *NOT*
> > > > none?
> > > 
> > > I did mean the original wordings.
> > > 
> > > Note that in the previous case Rik worked on, it's about a mostly empty VM
> > > got NUMA hint applied.  So I did mean "PUDs are also none" here, with the
> > > hope that when the numa hint applies on any part of the unpopulated guest
> > > memory, it'll find nothing in PUDs. Here it's mostly not about a huge PUD
> > > mapping as long as the guest memory is not backed by DAX (since only DAX
> > > supports 1G huge pud so far, while hugetlb has its own path here in
> > > mprotect, so it must be things like anon or shmem), but a PUD entry that
> > > contains pmd pgtables.  For that part, I was trying to justify "no pmd
> > > pgtable installed" with the fact that "a large VM that should definitely
> > > contain more than GBs of memory", it means the PUD range should hopefully
> > > never been accessed, so even the pmd pgtable entry should be missing.
> > 
> > Ah, now I get what you were saying.
> > 
> > Problem is, walking the rmaps for the shadow MMU doesn't benefit (much) from
> > empty PUDs, because KVM needs to blindly walk the rmaps for every gfn covered by
> > the PUD to see if there are any SPTEs in any shadow MMUs mapping that gfn.  And
> > that walk is done without ever yielding, which I suspect is the source of the
> > soft lockups of yore.
> > 
> > And there's no way around that conundrum (walking rmaps), at least not without a
> > major rewrite in KVM.  In a nested TDP scenario, KVM's stage-2 page tables (for
> > L2) key off of L2 gfns, not L1 gfns, and so the only way to find mappings is
> > through the rmaps.
> 
> I think the hope here is when the whole PUDs being hinted are empty without
> pgtable installed, there'll be no mmu notifier to be kicked off at all.
> 
> To be explicit, I meant after this patch applied, the pud loop for numa
> hints look like this:
> 
>         FOR_EACH_PUD() {
>                 ...
>                 if (pud_none(pud))
>                         continue;
> 
>                 if (!range.start) {
>                         mmu_notifier_range_init(&range,
>                                                 MMU_NOTIFY_PROTECTION_VMA, 0,
>                                                 vma->vm_mm, addr, end);
>                         mmu_notifier_invalidate_range_start(&range);
>                 }
>                 ...
>         }
> 
> So the hope is that pud_none() is always true for the hinted area (just
> like it used to be when pmd_none() can be hopefully true always), then we
> skip the mmu notifier as a whole (including KVM's)!

Gotcha, that makes sense.  Too many page tables flying around :-)
