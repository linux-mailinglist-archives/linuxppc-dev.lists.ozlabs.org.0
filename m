Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D68AF0AFA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 01:21:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4776fC6G2zzF5Ht
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 11:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="e+Di3mlc"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4776ML46rCzF3wl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 11:08:46 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id f10so597017oto.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 16:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBnxU3butVFZM7AnAXfHT8dkMjtUFYfyCvUDW61SXV0=;
 b=e+Di3mlc5nguC0AjBP91KU4QLtXyLv60VHL8bcA2yTFqSx8GzUT3JPnO2SUvw9dJ3e
 x892tG+naCnJ7xx1/XyJqFBd5BAvIkbzvc8Hm+iANPYt1TTQlO54TnNTT2/Vr/wnnHwU
 cWH/uHsxgeOfe757EoaxLRwaf5ARnH5aT0zdOmRUm2qEb9I99F92KkPxOUH4REMi83wk
 kEyAkGq3/W1xKyxTMdH0KRUk/WXIRl4YbdL49pTFBgS4yeLctZvOTpoL9B1muQPVqJmY
 p3ipEL1tac4Bnfpc8lK1KzxSavaLkdb1VqqzcOJA3HvnvhhzQSrRj7AaXeANHjyy47rG
 tLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBnxU3butVFZM7AnAXfHT8dkMjtUFYfyCvUDW61SXV0=;
 b=beS5ijNNYV/wJaFQD1C13wdJjYPdEzIi3qdREICCajoiW9wrC5lWAO0ZEqaBdxTnKy
 tEGr+PTzexxxpfVTdciPHYAiPsYNucYvM3OAz4HmwiR0G6z8UZXwPYggXcy0u7jdJga6
 2vo+yG+lP4EJdV5dW7nCc/8iDEiIlb5+Dtty8v50KZRmOZGkfmRlx0DKaiKX6t7szOO0
 W8Bb26sF5fyhsj14Ssbt2qFLZ2mpqI14/7ZRJISPvsXkvOY547dxPGlwtc6HLnkZYaCW
 LS05nTmfSbx9oyGzS7dJfSwUxD7cAcdN4poFPPpSzXIQUPfQ1BjAdNDJdPmwCSqE5mWf
 umiw==
X-Gm-Message-State: APjAAAW35EdiY3kCHxKAC7+cNKa11uQKc43J1gGJ0j1LRrlLG0OK6bJM
 VwXyG+ZdY3EAiJ230AjYdnyt19nLXsFyhSU5nD6Dag==
X-Google-Smtp-Source: APXvYqy6XKydDtiqLti7hhnEPqaloEXe8khYaaQC8o7B44In3kaSUL1URuHERGnTYAOJPrixGMDMzxSCyGGCNLsXEME=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr24252119oti.207.1572998924064; 
 Tue, 05 Nov 2019 16:08:44 -0800 (PST)
MIME-Version: 1.0
References: <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
 <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
 <CAPcyv4i7tnjyghYhSjK8fxUu8Qkdc2RuD9kUwJcKEMDzOf51ng@mail.gmail.com>
 <20191106000315.GI23297@linux.intel.com>
In-Reply-To: <20191106000315.GI23297@linux.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 5 Nov 2019 16:08:32 -0800
Message-ID: <CAPcyv4hppbefem9pHiQV5-djriGrzcuo0hxVnJwqB=+2iuOh2w@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
To: Sean Christopherson <sean.j.christopherson@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 06 Nov 2019 11:13:27 +1100
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
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Adam Borowski <kilobyte@angband.pl>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 5, 2019 at 4:03 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> On Tue, Nov 05, 2019 at 03:43:29PM -0800, Dan Williams wrote:
> > On Tue, Nov 5, 2019 at 3:30 PM Dan Williams <dan.j.williams@intel.com> wrote:
> > >
> > > On Tue, Nov 5, 2019 at 3:13 PM Sean Christopherson
> > > <sean.j.christopherson@intel.com> wrote:
> > > >
> > > > On Tue, Nov 05, 2019 at 03:02:40PM -0800, Dan Williams wrote:
> > > > > On Tue, Nov 5, 2019 at 12:31 PM David Hildenbrand <david@redhat.com> wrote:
> > > > > > > The scarier code (for me) is transparent_hugepage_adjust() and
> > > > > > > kvm_mmu_zap_collapsible_spte(), as I don't at all understand the
> > > > > > > interaction between THP and _PAGE_DEVMAP.
> > > > > >
> > > > > > The x86 KVM MMU code is one of the ugliest code I know (sorry, but it
> > > > > > had to be said :/ ). Luckily, this should be independent of the
> > > > > > PG_reserved thingy AFAIKs.
> > > > >
> > > > > Both transparent_hugepage_adjust() and kvm_mmu_zap_collapsible_spte()
> > > > > are honoring kvm_is_reserved_pfn(), so again I'm missing where the
> > > > > page count gets mismanaged and leads to the reported hang.
> > > >
> > > > When mapping pages into the guest, KVM gets the page via gup(), which
> > > > increments the page count for ZONE_DEVICE pages.  But KVM puts the page
> > > > using kvm_release_pfn_clean(), which skips put_page() if PageReserved()
> > > > and so never puts its reference to ZONE_DEVICE pages.
> > >
> > > Oh, yeah, that's busted.
> >
> > Ugh, it's extra busted because every other gup user in the kernel
> > tracks the pages resulting from gup and puts them (put_page()) when
> > they are done. KVM wants to forget about whether it did a gup to get
> > the page and optionally trigger put_page() based purely on the pfn.
> > Outside of VFIO device assignment that needs pages pinned for DMA, why
> > does KVM itself need to pin pages? If pages are pinned over a return
> > to userspace that needs to be a FOLL_LONGTERM gup.
>
> Short answer, KVM pins the page to ensure correctness with respect to the
> primary MMU invalidating the associated host virtual address, e.g. when
> the page is being migrated or unmapped from host userspace.
>
> The main use of gup() is to handle guest page faults and map pages into
> the guest, i.e. into KVM's secondary MMU.  KVM uses gup() to both get the
> PFN and to temporarily pin the page.  The pin is held just long enough to
> guaranteed that any invalidation via the mmu_notifier will be stalled
> until after KVM finishes installing the page into the secondary MMU, i.e.
> the pin is short-term and not held across a return to userspace or entry
> into the guest.  When a subsequent mmu_notifier invalidation occurs, KVM
> pulls the PFN from the secondary MMU and uses that to update accessed
> and dirty bits in the host.
>
> There are a few other KVM flows that eventually call into gup(), but those
> are "traditional" short-term pins and use put_page() directly.

Ok, I was misinterpreting the effect of the bug with what KVM is using
the reference to do.

To your other point:

> But David's proposed fix for the above refcount bug is to omit the patch
> so that KVM no longer treats ZONE_DEVICE pages as reserved.  That seems
> like the right thing to do, including for thp_adjust(), e.g. it would
> naturally let KVM use 2mb pages for the guest when a ZONE_DEVICE page is
> mapped with a huge page (2mb or above) in the host.  The only hiccup is
> figuring out how to correctly transfer the reference.

That might not be the only hiccup. There's currently no such thing as
huge pages for ZONE_DEVICE, there are huge *mappings* (pmd and pud),
but the result of pfn_to_page() on such a mapping does not yield a
huge 'struct page'. It seems there are other paths in KVM that assume
that more typical page machinery is active like SetPageDirty() based
on kvm_is_reserved_pfn(). While I told David that I did not want to
see more usage of is_zone_device_page(), this patch below (untested)
seems a cleaner path with less surprises:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4df0aa6b8e5c..fbea17c1810c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1831,7 +1831,8 @@ EXPORT_SYMBOL_GPL(kvm_release_page_clean);

 void kvm_release_pfn_clean(kvm_pfn_t pfn)
 {
-       if (!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn))
+       if ((!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn)) ||
+           (pfn_valid(pfn) && is_zone_device_page(pfn_to_page(pfn))))
                put_page(pfn_to_page(pfn));
 }
 EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);

This is safe because the reference that KVM took earlier protects the
is_zone_device_page() lookup from racing device teardown. Otherwise,
if KVM does not have a reference it's unsafe, but that's already even
more broken because KVM would be releasing a page that it never
referenced. Every other KVM operation that assumes page allocator
pages would continue to honor kvm_is_reserved_pfn().
