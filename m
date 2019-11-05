Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC3F0887
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 22:40:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47734H6g3GzF4Z9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 08:40:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="avVVbuWK"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4771Xb2FW3zF31c
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 07:31:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572985883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBpsVnOm2Iw9vk68TEBuezjUdaQ9ObuSYB51z2SdbAc=;
 b=avVVbuWKuWyvx+yal7SAP6oh+VGhL5N0goZq0Sf+fiZd9aX4ikQ87BpENVB7cXFXahUMKD
 0GYmGYsh9HkkBelHUznw1Njcq98f6em2pgTyWGWK1xvyo8I70rVMzvFQy8y0sGQatcQU9X
 ukeEZENDs3M3Df14i+BpncwZWKuxajw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-zTK-3plmNT2sFf3o-zKI6g-1; Tue, 05 Nov 2019 15:31:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A09A18064D1;
 Tue,  5 Nov 2019 20:31:12 +0000 (UTC)
Received: from [10.36.116.98] (ovpn-116-98.ams2.redhat.com [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 564CE3CC6;
 Tue,  5 Nov 2019 20:30:54 +0000 (UTC)
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
To: Sean Christopherson <sean.j.christopherson@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
Date: Tue, 5 Nov 2019 21:30:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105160000.GC8128@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: zTK-3plmNT2sFf3o-zKI6g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 06 Nov 2019 08:38:45 +1100
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

>>> I think I know what's going wrong:
>>>
>>> Pages that are pinned via gfn_to_pfn() and friends take a references,
>>> however are often released via
>>> kvm_release_pfn_clean()/kvm_release_pfn_dirty()/kvm_release_page_clean(=
)...
>>>
>>>
>>> E.g., in arch/x86/kvm/x86.c:reexecute_instruction()
>>>
>>> ...
>>> pfn =3D gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
>>> ...
>>> kvm_release_pfn_clean(pfn);
>>>
>>>
>>>
>>> void kvm_release_pfn_clean(kvm_pfn_t pfn)
>>> {
>>> =09if (!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn))
>>> =09=09put_page(pfn_to_page(pfn));
>>> }
>>>
>>> This function makes perfect sense as the counterpart for kvm_get_pfn():
>>>
>>> void kvm_get_pfn(kvm_pfn_t pfn)
>>> {
>>> =09if (!kvm_is_reserved_pfn(pfn))
>>> =09=09get_page(pfn_to_page(pfn));
>>> }
>>>
>>>
>>> As all ZONE_DEVICE pages are currently reserved, pages pinned via
>>> gfn_to_pfn() and friends will often not see a put_page() AFAIKS.
>=20
> Assuming gup() takes a reference for ZONE_DEVICE pages, yes, this is a
> KVM bug.

Yes, it does take a reference AFAIKs. E.g.,

mm/gup.c:gup_pte_range():
...
=09=09if (pte_devmap(pte)) {
=09=09=09if (unlikely(flags & FOLL_LONGTERM))
=09=09=09=09goto pte_unmap;

=09=09=09pgmap =3D get_dev_pagemap(pte_pfn(pte), pgmap);
=09=09=09if (unlikely(!pgmap)) {
=09=09=09=09undo_dev_pagemap(nr, nr_start, pages);
=09=09=09=09goto pte_unmap;
=09=09=09}
=09=09} else if (pte_special(pte))
=09=09=09goto pte_unmap;

=09=09VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
=09=09page =3D pte_page(pte);

=09=09head =3D try_get_compound_head(page, 1);

try_get_compound_head() will increment the reference count.

>=20
>>> Now, my patch does not change that, the result of
>>> kvm_is_reserved_pfn(pfn) will be unchanged. A proper fix for that would
>>> probably be
>>>
>>> a) To drop the reference to ZONE_DEVICE pages in gfn_to_pfn() and
>>> friends, after you successfully pinned the pages. (not sure if that's
>>> the right thing to do but you're the expert)
>>>
>>> b) To not use kvm_release_pfn_clean() and friends on pages that were
>>> definitely pinned.
>=20
> This is already KVM's intent, i.e. the purpose of the PageReserved() chec=
k
> is simply to avoid putting a non-existent reference.  The problem is that
> KVM assumes pages with PG_reserved set are never pinned, which AFAICT was
> true when the code was first added.
>=20
>> (talking to myself, sorry)
>>
>> Thinking again, dropping this patch from this series could effectively a=
lso
>> fix that issue. E.g., kvm_release_pfn_clean() and friends would always d=
o a
>> put_page() if "pfn_valid() and !PageReserved()", so after patch 9 also o=
n
>> ZONDE_DEVICE pages.
>=20
> Yeah, this appears to be the correct fix.
>=20
>> But it would have side effects that might not be desired. E.g.,:
>>
>> 1. kvm_pfn_to_page() would also return ZONE_DEVICE pages (might even be =
the
>> right thing to do).
>=20
> This should be ok, at least on x86.  There are only three users of
> kvm_pfn_to_page().  Two of those are on allocations that are controlled b=
y
> KVM and are guaranteed to be vanilla MAP_ANONYMOUS.  The third is on gues=
t
> memory when running a nested guest, and in that case supporting ZONE_DEVI=
CE
> memory is desirable, i.e. KVM should play nice with a guest that is backe=
d
> by ZONE_DEVICE memory.
>=20
>> 2. kvm_set_pfn_dirty() would also set ZONE_DEVICE pages dirty (might be
>> okay)
>=20
> This is ok from a KVM perspective.

What about

void kvm_get_pfn(kvm_pfn_t pfn)
{
=09if (!kvm_is_reserved_pfn(pfn))
=09=09get_page(pfn_to_page(pfn));
}

Is a pure get_page() sufficient in case of ZONE_DEVICE?
(asking because of the live references obtained via=20
get_dev_pagemap(pte_pfn(pte), pgmap) in mm/gup.c:gup_pte_range()=20
somewhat confuse me :) )


>=20
> The scarier code (for me) is transparent_hugepage_adjust() and
> kvm_mmu_zap_collapsible_spte(), as I don't at all understand the
> interaction between THP and _PAGE_DEVMAP.

The x86 KVM MMU code is one of the ugliest code I know (sorry, but it=20
had to be said :/ ). Luckily, this should be independent of the=20
PG_reserved thingy AFAIKs.

--=20

Thanks,

David / dhildenb

