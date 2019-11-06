Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAAAF1020
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 08:18:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477HvQ1nWpzF3k3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 18:18:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="K8UBhX1J"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477HQX1RXvzF5K3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 17:57:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573023423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHhiVRGjTg2z5h3dRfpoqGRkrXa+G8taPvqq9+5Ox4o=;
 b=K8UBhX1JtFZMs594Ypt3noWNFA7EDgGOzgTZeoLrecZiYBc0z9aQ1ftUT60ADHOM/4fKea
 S4RheFJRLPHeZXXsdxGjj1lj/DBLQ6j6EczxwIps2sdVeLlU8ExvD/QiqqB572Rk55bS6J
 wibfYYo3txGWC+O//e5qvLzZuGhvknc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-W8IUVLyUMSC0rC0dumrlPQ-1; Wed, 06 Nov 2019 01:57:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7029E8017E0;
 Wed,  6 Nov 2019 06:56:55 +0000 (UTC)
Received: from [10.36.116.143] (ovpn-116-143.ams2.redhat.com [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB0E15D70E;
 Wed,  6 Nov 2019 06:56:35 +0000 (UTC)
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
To: Dan Williams <dan.j.williams@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
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
 <CAPcyv4hppbefem9pHiQV5-djriGrzcuo0hxVnJwqB=+2iuOh2w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <694202e7-d8e6-6ac8-6e47-3553b298bbcc@redhat.com>
Date: Wed, 6 Nov 2019 07:56:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hppbefem9pHiQV5-djriGrzcuo0hxVnJwqB=+2iuOh2w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: W8IUVLyUMSC0rC0dumrlPQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 06 Nov 2019 18:16:48 +1100
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
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
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

On 06.11.19 01:08, Dan Williams wrote:
> On Tue, Nov 5, 2019 at 4:03 PM Sean Christopherson
> <sean.j.christopherson@intel.com> wrote:
>>
>> On Tue, Nov 05, 2019 at 03:43:29PM -0800, Dan Williams wrote:
>>> On Tue, Nov 5, 2019 at 3:30 PM Dan Williams <dan.j.williams@intel.com> =
wrote:
>>>>
>>>> On Tue, Nov 5, 2019 at 3:13 PM Sean Christopherson
>>>> <sean.j.christopherson@intel.com> wrote:
>>>>>
>>>>> On Tue, Nov 05, 2019 at 03:02:40PM -0800, Dan Williams wrote:
>>>>>> On Tue, Nov 5, 2019 at 12:31 PM David Hildenbrand <david@redhat.com>=
 wrote:
>>>>>>>> The scarier code (for me) is transparent_hugepage_adjust() and
>>>>>>>> kvm_mmu_zap_collapsible_spte(), as I don't at all understand the
>>>>>>>> interaction between THP and _PAGE_DEVMAP.
>>>>>>>
>>>>>>> The x86 KVM MMU code is one of the ugliest code I know (sorry, but =
it
>>>>>>> had to be said :/ ). Luckily, this should be independent of the
>>>>>>> PG_reserved thingy AFAIKs.
>>>>>>
>>>>>> Both transparent_hugepage_adjust() and kvm_mmu_zap_collapsible_spte(=
)
>>>>>> are honoring kvm_is_reserved_pfn(), so again I'm missing where the
>>>>>> page count gets mismanaged and leads to the reported hang.
>>>>>
>>>>> When mapping pages into the guest, KVM gets the page via gup(), which
>>>>> increments the page count for ZONE_DEVICE pages.  But KVM puts the pa=
ge
>>>>> using kvm_release_pfn_clean(), which skips put_page() if PageReserved=
()
>>>>> and so never puts its reference to ZONE_DEVICE pages.
>>>>
>>>> Oh, yeah, that's busted.
>>>
>>> Ugh, it's extra busted because every other gup user in the kernel
>>> tracks the pages resulting from gup and puts them (put_page()) when
>>> they are done. KVM wants to forget about whether it did a gup to get
>>> the page and optionally trigger put_page() based purely on the pfn.
>>> Outside of VFIO device assignment that needs pages pinned for DMA, why
>>> does KVM itself need to pin pages? If pages are pinned over a return
>>> to userspace that needs to be a FOLL_LONGTERM gup.
>>
>> Short answer, KVM pins the page to ensure correctness with respect to th=
e
>> primary MMU invalidating the associated host virtual address, e.g. when
>> the page is being migrated or unmapped from host userspace.
>>
>> The main use of gup() is to handle guest page faults and map pages into
>> the guest, i.e. into KVM's secondary MMU.  KVM uses gup() to both get th=
e
>> PFN and to temporarily pin the page.  The pin is held just long enough t=
o
>> guaranteed that any invalidation via the mmu_notifier will be stalled
>> until after KVM finishes installing the page into the secondary MMU, i.e=
.
>> the pin is short-term and not held across a return to userspace or entry
>> into the guest.  When a subsequent mmu_notifier invalidation occurs, KVM
>> pulls the PFN from the secondary MMU and uses that to update accessed
>> and dirty bits in the host.
>>
>> There are a few other KVM flows that eventually call into gup(), but tho=
se
>> are "traditional" short-term pins and use put_page() directly.
>=20
> Ok, I was misinterpreting the effect of the bug with what KVM is using
> the reference to do.
>=20
> To your other point:
>=20
>> But David's proposed fix for the above refcount bug is to omit the patch
>> so that KVM no longer treats ZONE_DEVICE pages as reserved.  That seems
>> like the right thing to do, including for thp_adjust(), e.g. it would
>> naturally let KVM use 2mb pages for the guest when a ZONE_DEVICE page is
>> mapped with a huge page (2mb or above) in the host.  The only hiccup is
>> figuring out how to correctly transfer the reference.
>=20
> That might not be the only hiccup. There's currently no such thing as
> huge pages for ZONE_DEVICE, there are huge *mappings* (pmd and pud),
> but the result of pfn_to_page() on such a mapping does not yield a
> huge 'struct page'. It seems there are other paths in KVM that assume
> that more typical page machinery is active like SetPageDirty() based
> on kvm_is_reserved_pfn(). While I told David that I did not want to
> see more usage of is_zone_device_page(), this patch below (untested)
> seems a cleaner path with less surprises:
>=20
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4df0aa6b8e5c..fbea17c1810c 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1831,7 +1831,8 @@ EXPORT_SYMBOL_GPL(kvm_release_page_clean);
>=20
>   void kvm_release_pfn_clean(kvm_pfn_t pfn)
>   {
> -       if (!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn))
> +       if ((!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn)) ||
> +           (pfn_valid(pfn) && is_zone_device_page(pfn_to_page(pfn))))
>                  put_page(pfn_to_page(pfn));
>   }
>   EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);

I had the same thought, but I do wonder about the kvm_get_pfn() users,=20
e.g.,:

hva_to_pfn_remapped():
=09r =3D follow_pfn(vma, addr, &pfn);
=09...
=09kvm_get_pfn(pfn);
=09...

We would not take a reference for ZONE_DEVICE, but later drop one=20
reference via kvm_release_pfn_clean(). IOW, kvm_get_pfn() gets *really*=20
dangerous to use. I can't tell if this can happen right now.

We do have 3 users of kvm_get_pfn() that we have to audit before this=20
change. Also, we should add a comment to kvm_get_pfn() that it should=20
never be used with possible ZONE_DEVICE pages.

Also, we should add a comment to kvm_release_pfn_clean(), describing why=20
we treat ZONE_DEVICE in a special way here.


We can then progress like this

1. Get this fix upstream, it's somewhat unrelated to this series.
2. This patch here remains as is in this series (+/- documentation update)
3. Long term, rework KVM to not have to not treat ZONE_DEVICE like=20
reserved pages. E.g., get rid of kvm_get_pfn(). Then, this special zone=20
check can go.

--=20

Thanks,

David / dhildenb

