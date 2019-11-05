Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D42ACF06DC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 21:28:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4771Sl0lCZzDr9Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 07:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=sean.j.christopherson@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476vWb3R1zzF4yH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 03:00:04 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 08:00:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="205019568"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by orsmga003.jf.intel.com with ESMTP; 05 Nov 2019 08:00:00 -0800
Date: Tue, 5 Nov 2019 08:00:00 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
Message-ID: <20191105160000.GC8128@linux.intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 06 Nov 2019 07:24:41 +1100
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

On Tue, Nov 05, 2019 at 11:02:46AM +0100, David Hildenbrand wrote:
> On 05.11.19 10:49, David Hildenbrand wrote:
> >On 05.11.19 10:17, David Hildenbrand wrote:
> >>On 05.11.19 05:38, Dan Williams wrote:
> >>>On Thu, Oct 24, 2019 at 5:11 AM David Hildenbrand <david@redhat.com> wrote:
> >>>>
> >>>>Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
> >>>>change that.
> >>>>
> >>>>KVM has this weird use case that you can map anything from /dev/mem
> >>>>into the guest. pfn_valid() is not a reliable check whether the memmap
> >>>>was initialized and can be touched. pfn_to_online_page() makes sure
> >>>>that we have an initialized memmap (and don't have ZONE_DEVICE memory).
> >>>>
> >>>>Rewrite kvm_is_reserved_pfn() to make sure the function produces the
> >>>>same result once we stop setting ZONE_DEVICE pages PG_reserved.
> >>>>
> >>>>Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>>>Cc: "Radim Krčmář" <rkrcmar@redhat.com>
> >>>>Cc: Michal Hocko <mhocko@kernel.org>
> >>>>Cc: Dan Williams <dan.j.williams@intel.com>
> >>>>Cc: KarimAllah Ahmed <karahmed@amazon.de>
> >>>>Signed-off-by: David Hildenbrand <david@redhat.com>
> >>>>---
> >>>>    virt/kvm/kvm_main.c | 10 ++++++++--
> >>>>    1 file changed, 8 insertions(+), 2 deletions(-)
> >>>>
> >>>>diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> >>>>index e9eb666eb6e8..9d18cc67d124 100644
> >>>>--- a/virt/kvm/kvm_main.c
> >>>>+++ b/virt/kvm/kvm_main.c
> >>>>@@ -151,9 +151,15 @@ __weak int kvm_arch_mmu_notifier_invalidate_range(struct kvm *kvm,
> >>>>
> >>>>    bool kvm_is_reserved_pfn(kvm_pfn_t pfn)
> >>>>    {
> >>>>-       if (pfn_valid(pfn))
> >>>>-               return PageReserved(pfn_to_page(pfn));
> >>>>+       struct page *page = pfn_to_online_page(pfn);
> >>>>
> >>>>+       /*
> >>>>+        * We treat any pages that are not online (not managed by the buddy)
> >>>>+        * as reserved - this includes ZONE_DEVICE pages and pages without
> >>>>+        * a memmap (e.g., mapped via /dev/mem).
> >>>>+        */
> >>>>+       if (page)
> >>>>+               return PageReserved(page);
> >>>>           return true;
> >>>>    }
> >>>
> >>>So after this all the pfn_valid() usage in kvm_main.c is replaced with
> >>>pfn_to_online_page()? Looks correct to me.
> >>>
> >>>However, I'm worried that kvm is taking reference on ZONE_DEVICE pages
> >>>through some other path resulting in this:
> >>>
> >>>       https://lore.kernel.org/linux-nvdimm/20190919154708.GA24650@angband.pl/
> >>>
> >>>I'll see if this patch set modulates or maintains that failure mode.
> >>>
> >>
> >>I'd assume that the behavior is unchanged. Ithink we get a reference to
> >>these ZONE_DEVICE pages via __get_user_pages_fast() and friends in
> >>hva_to_pfn_fast() and friends in virt/kvm/kvm_main.c
> >>
> >
> >I think I know what's going wrong:
> >
> >Pages that are pinned via gfn_to_pfn() and friends take a references,
> >however are often released via
> >kvm_release_pfn_clean()/kvm_release_pfn_dirty()/kvm_release_page_clean()...
> >
> >
> >E.g., in arch/x86/kvm/x86.c:reexecute_instruction()
> >
> >...
> >pfn = gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
> >...
> >kvm_release_pfn_clean(pfn);
> >
> >
> >
> >void kvm_release_pfn_clean(kvm_pfn_t pfn)
> >{
> >	if (!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn))
> >		put_page(pfn_to_page(pfn));
> >}
> >
> >This function makes perfect sense as the counterpart for kvm_get_pfn():
> >
> >void kvm_get_pfn(kvm_pfn_t pfn)
> >{
> >	if (!kvm_is_reserved_pfn(pfn))
> >		get_page(pfn_to_page(pfn));
> >}
> >
> >
> >As all ZONE_DEVICE pages are currently reserved, pages pinned via
> >gfn_to_pfn() and friends will often not see a put_page() AFAIKS.

Assuming gup() takes a reference for ZONE_DEVICE pages, yes, this is a
KVM bug.

> >Now, my patch does not change that, the result of
> >kvm_is_reserved_pfn(pfn) will be unchanged. A proper fix for that would
> >probably be
> >
> >a) To drop the reference to ZONE_DEVICE pages in gfn_to_pfn() and
> >friends, after you successfully pinned the pages. (not sure if that's
> >the right thing to do but you're the expert)
> >
> >b) To not use kvm_release_pfn_clean() and friends on pages that were
> >definitely pinned.

This is already KVM's intent, i.e. the purpose of the PageReserved() check
is simply to avoid putting a non-existent reference.  The problem is that
KVM assumes pages with PG_reserved set are never pinned, which AFAICT was
true when the code was first added.

> (talking to myself, sorry)
> 
> Thinking again, dropping this patch from this series could effectively also
> fix that issue. E.g., kvm_release_pfn_clean() and friends would always do a
> put_page() if "pfn_valid() and !PageReserved()", so after patch 9 also on
> ZONDE_DEVICE pages.

Yeah, this appears to be the correct fix.

> But it would have side effects that might not be desired. E.g.,:
> 
> 1. kvm_pfn_to_page() would also return ZONE_DEVICE pages (might even be the
> right thing to do).

This should be ok, at least on x86.  There are only three users of
kvm_pfn_to_page().  Two of those are on allocations that are controlled by
KVM and are guaranteed to be vanilla MAP_ANONYMOUS.  The third is on guest
memory when running a nested guest, and in that case supporting ZONE_DEVICE
memory is desirable, i.e. KVM should play nice with a guest that is backed
by ZONE_DEVICE memory.

> 2. kvm_set_pfn_dirty() would also set ZONE_DEVICE pages dirty (might be
> okay)

This is ok from a KVM perspective.

The scarier code (for me) is transparent_hugepage_adjust() and
kvm_mmu_zap_collapsible_spte(), as I don't at all understand the
interaction between THP and _PAGE_DEVMAP.

