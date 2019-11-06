Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B3F1F62
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 20:58:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477clc6XG8zDqBt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 06:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=sean.j.christopherson@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477Wgh6fkhzF3Ys
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 03:09:18 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 08:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="200752952"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by fmsmga008.fm.intel.com with ESMTP; 06 Nov 2019 08:09:13 -0800
Date: Wed, 6 Nov 2019 08:09:13 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
Message-ID: <20191106160913.GD16249@linux.intel.com>
References: <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
 <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
 <CAPcyv4i7tnjyghYhSjK8fxUu8Qkdc2RuD9kUwJcKEMDzOf51ng@mail.gmail.com>
 <20191106000315.GI23297@linux.intel.com>
 <CAPcyv4hppbefem9pHiQV5-djriGrzcuo0hxVnJwqB=+2iuOh2w@mail.gmail.com>
 <694202e7-d8e6-6ac8-6e47-3553b298bbcc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <694202e7-d8e6-6ac8-6e47-3553b298bbcc@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 07 Nov 2019 06:55:50 +1100
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

On Wed, Nov 06, 2019 at 07:56:34AM +0100, David Hildenbrand wrote:
> On 06.11.19 01:08, Dan Williams wrote:
> >On Tue, Nov 5, 2019 at 4:03 PM Sean Christopherson
> >>But David's proposed fix for the above refcount bug is to omit the patch
> >>so that KVM no longer treats ZONE_DEVICE pages as reserved.  That seems
> >>like the right thing to do, including for thp_adjust(), e.g. it would
> >>naturally let KVM use 2mb pages for the guest when a ZONE_DEVICE page is
> >>mapped with a huge page (2mb or above) in the host.  The only hiccup is
> >>figuring out how to correctly transfer the reference.
> >
> >That might not be the only hiccup. There's currently no such thing as
> >huge pages for ZONE_DEVICE, there are huge *mappings* (pmd and pud),
> >but the result of pfn_to_page() on such a mapping does not yield a
> >huge 'struct page'. It seems there are other paths in KVM that assume
> >that more typical page machinery is active like SetPageDirty() based
> >on kvm_is_reserved_pfn(). While I told David that I did not want to
> >see more usage of is_zone_device_page(), this patch below (untested)
> >seems a cleaner path with less surprises:
> >
> >diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> >index 4df0aa6b8e5c..fbea17c1810c 100644
> >--- a/virt/kvm/kvm_main.c
> >+++ b/virt/kvm/kvm_main.c
> >@@ -1831,7 +1831,8 @@ EXPORT_SYMBOL_GPL(kvm_release_page_clean);
> >
> >  void kvm_release_pfn_clean(kvm_pfn_t pfn)
> >  {
> >-       if (!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn))
> >+       if ((!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn)) ||

The is_error_noslot_pfn() check shouldn't be overriden by zone_device.

> >+           (pfn_valid(pfn) && is_zone_device_page(pfn_to_page(pfn))))

But rather than special case kvm_release_pfn_clean(), I'd rather KVM
explicitly handle ZONE_DEVICE pages, there are other flows where KVM
really should be aware of ZONE_DEVICE pages, e.g. for sanity checks and
whatnot.  There are surprisingly few callers of kvm_is_reserved_pfn(), so
it's actually not too big of a change. 

> >                 put_page(pfn_to_page(pfn));
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
> 
> I had the same thought, but I do wonder about the kvm_get_pfn() users,
> e.g.,:
> 
> hva_to_pfn_remapped():
> 	r = follow_pfn(vma, addr, &pfn);
> 	...
> 	kvm_get_pfn(pfn);
> 	...
> 
> We would not take a reference for ZONE_DEVICE, but later drop one reference
> via kvm_release_pfn_clean(). IOW, kvm_get_pfn() gets *really* dangerous to
> use. I can't tell if this can happen right now.
> 
> We do have 3 users of kvm_get_pfn() that we have to audit before this
> change. Also, we should add a comment to kvm_get_pfn() that it should never
> be used with possible ZONE_DEVICE pages.
> 
> Also, we should add a comment to kvm_release_pfn_clean(), describing why we
> treat ZONE_DEVICE in a special way here.
> 
> 
> We can then progress like this
> 
> 1. Get this fix upstream, it's somewhat unrelated to this series.
> 2. This patch here remains as is in this series (+/- documentation update)
> 3. Long term, rework KVM to not have to not treat ZONE_DEVICE like reserved
> pages. E.g., get rid of kvm_get_pfn(). Then, this special zone check can go.

Dropping kvm_get_pfn() is less than ideal, and at this point unnecessary.
I'm 99% sure the existing call sites for kvm_get_pfn() can never be
reached with ZONE_DEVICE pages.  I think we can do:

  1. Get a fix upstream to have KVM stop treating ZONE_DEVICE pages as
     reserved PFNs, i.e. exempt them in kvm_is_reserved_pfn() and change
     the callers of kvm_is_reserved_pfn() to handle ZONE_DEVICE pages.
  2. Drop this patch from the series, and instead remove the special
     treatment of ZONE_DEVICE pages from kvm_is_reserved_pfn().

Give me a few minutes to prep a patch.

> 
> -- 
> 
> Thanks,
> 
> David / dhildenb
> 
