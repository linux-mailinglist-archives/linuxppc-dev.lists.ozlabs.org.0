Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645DF09E5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 23:54:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4774jc21h7zF4FF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 09:54:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=sean.j.christopherson@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47740Q3Kr8zF576
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 09:22:10 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 14:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="376846147"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by orsmga005.jf.intel.com with ESMTP; 05 Nov 2019 14:22:05 -0800
Date: Tue, 5 Nov 2019 14:22:05 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
Message-ID: <20191105222205.GA23297@linux.intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 06 Nov 2019 09:53:06 +1100
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Adam Borowski <kilobyte@angband.pl>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 05, 2019 at 09:30:53PM +0100, David Hildenbrand wrote:
> >>>I think I know what's going wrong:
> >>>
> >>>Pages that are pinned via gfn_to_pfn() and friends take a references,
> >>>however are often released via
> >>>kvm_release_pfn_clean()/kvm_release_pfn_dirty()/kvm_release_page_clean()...
> >>>
> >>>
> >>>E.g., in arch/x86/kvm/x86.c:reexecute_instruction()
> >>>
> >>>...
> >>>pfn = gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
> >>>...
> >>>kvm_release_pfn_clean(pfn);
> >>>
> >>>
> >>>
> >>>void kvm_release_pfn_clean(kvm_pfn_t pfn)
> >>>{
> >>>	if (!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn))
> >>>		put_page(pfn_to_page(pfn));
> >>>}
> >>>
> >>>This function makes perfect sense as the counterpart for kvm_get_pfn():
> >>>
> >>>void kvm_get_pfn(kvm_pfn_t pfn)
> >>>{
> >>>	if (!kvm_is_reserved_pfn(pfn))
> >>>		get_page(pfn_to_page(pfn));
> >>>}
> >>>
> >>>
> >>>As all ZONE_DEVICE pages are currently reserved, pages pinned via
> >>>gfn_to_pfn() and friends will often not see a put_page() AFAIKS.
> >
> >Assuming gup() takes a reference for ZONE_DEVICE pages, yes, this is a
> >KVM bug.
> 
> Yes, it does take a reference AFAIKs. E.g.,
> 
> mm/gup.c:gup_pte_range():
> ...
> 		if (pte_devmap(pte)) {
> 			if (unlikely(flags & FOLL_LONGTERM))
> 				goto pte_unmap;
> 
> 			pgmap = get_dev_pagemap(pte_pfn(pte), pgmap);
> 			if (unlikely(!pgmap)) {
> 				undo_dev_pagemap(nr, nr_start, pages);
> 				goto pte_unmap;
> 			}
> 		} else if (pte_special(pte))
> 			goto pte_unmap;
> 
> 		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> 		page = pte_page(pte);
> 
> 		head = try_get_compound_head(page, 1);
> 
> try_get_compound_head() will increment the reference count.

Doh, I looked right at that code and somehow didn't connect the dots.
Thanks!

> >>>Now, my patch does not change that, the result of
> >>>kvm_is_reserved_pfn(pfn) will be unchanged. A proper fix for that would
> >>>probably be
> >>>
> >>>a) To drop the reference to ZONE_DEVICE pages in gfn_to_pfn() and
> >>>friends, after you successfully pinned the pages. (not sure if that's
> >>>the right thing to do but you're the expert)
> >>>
> >>>b) To not use kvm_release_pfn_clean() and friends on pages that were
> >>>definitely pinned.
> >
> >This is already KVM's intent, i.e. the purpose of the PageReserved() check
> >is simply to avoid putting a non-existent reference.  The problem is that
> >KVM assumes pages with PG_reserved set are never pinned, which AFAICT was
> >true when the code was first added.
> >
> >>(talking to myself, sorry)
> >>
> >>Thinking again, dropping this patch from this series could effectively also
> >>fix that issue. E.g., kvm_release_pfn_clean() and friends would always do a
> >>put_page() if "pfn_valid() and !PageReserved()", so after patch 9 also on
> >>ZONDE_DEVICE pages.
> >
> >Yeah, this appears to be the correct fix.
> >
> >>But it would have side effects that might not be desired. E.g.,:
> >>
> >>1. kvm_pfn_to_page() would also return ZONE_DEVICE pages (might even be the
> >>right thing to do).
> >
> >This should be ok, at least on x86.  There are only three users of
> >kvm_pfn_to_page().  Two of those are on allocations that are controlled by
> >KVM and are guaranteed to be vanilla MAP_ANONYMOUS.  The third is on guest
> >memory when running a nested guest, and in that case supporting ZONE_DEVICE
> >memory is desirable, i.e. KVM should play nice with a guest that is backed
> >by ZONE_DEVICE memory.
> >
> >>2. kvm_set_pfn_dirty() would also set ZONE_DEVICE pages dirty (might be
> >>okay)
> >
> >This is ok from a KVM perspective.
> 
> What about
> 
> void kvm_get_pfn(kvm_pfn_t pfn)
> {
> 	if (!kvm_is_reserved_pfn(pfn))
> 		get_page(pfn_to_page(pfn));
> }
> 
> Is a pure get_page() sufficient in case of ZONE_DEVICE?
> (asking because of the live references obtained via
> get_dev_pagemap(pte_pfn(pte), pgmap) in mm/gup.c:gup_pte_range() somewhat
> confuse me :) )

This ties into my concern with thp_adjust().  On x86, kvm_get_pfn() is
only used in two flows, to manually get a ref for VM_IO/VM_PFNMAP pages
and to switch the ref when mapping a non-hugetlbfs compound page, i.e. a
THP.

I assume VM_IO and PFNMAP can't apply to ZONE_DEVICE pages.

In the thp_adjust() case, when a THP is encountered and the original PFN
is for a non-PG_head page, KVM transfers the reference to the associated
PG_head page[*] and maps the associated 2mb chunk/page.  This is where KVM
uses kvm_get_pfn() and could run afoul of the get_dev_pagemap() refcounts.


[*] Technically I don't think it's guaranteed to be a PG_head, e.g. if the
    THP is a 1gb page, as KVM currently only maps THP as 2mb pages.  But
    the idea is the same, transfer the refcount the PFN that's actually
    going into KVM's page tables.

> >
> >The scarier code (for me) is transparent_hugepage_adjust() and
> >kvm_mmu_zap_collapsible_spte(), as I don't at all understand the
> >interaction between THP and _PAGE_DEVMAP.
> 
> The x86 KVM MMU code is one of the ugliest code I know (sorry, but it had to
> be said :/ ). Luckily, this should be independent of the PG_reserved thingy
> AFAIKs.

