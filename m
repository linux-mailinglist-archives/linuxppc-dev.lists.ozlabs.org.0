Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB18F4155
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 08:25:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478Wyf3ZR8zF6nR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 18:25:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="WyKjvmaQ"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478Wkp4g7mzF25y
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 18:15:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573197327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PenExAfVRFXeBme8mP2F3ZJCJQhOeL0zIxQnZAXCsUI=;
 b=WyKjvmaQi0DWrmJoptM/3/AQBbRc2jRhq+jm93Pkzy6H7WLGUmztSEVd3NS7cvqCl6olVK
 VI019Z4UVpBZ7MS/j7ssStWFTEMAsSAfiyovg+zPQBfLCi0iTdvmNWrPagXaVxvAatU5UJ
 VTcsDdgNhUpEXnt1YToYf1oZk243qyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-RVLOufnuOY2lPex8TZ9HIg-1; Fri, 08 Nov 2019 02:15:25 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 864E1800C72;
 Fri,  8 Nov 2019 07:15:18 +0000 (UTC)
Received: from [10.36.116.108] (ovpn-116-108.ams2.redhat.com [10.36.116.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDC1A5DA70;
 Fri,  8 Nov 2019 07:14:57 +0000 (UTC)
Subject: Re: [PATCH v1 04/10] vfio/type1: Prepare is_invalid_reserved_pfn()
 for PG_reserved changes
To: Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
 <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
 <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
 <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a514e23c-616a-b093-ede5-b2c2c558a1a0@redhat.com>
Date: Fri, 8 Nov 2019 08:14:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4h0yX4g6ETymQEpp52FFLaOmps_hO7w_yuYGk7BqQQcMQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: RVLOufnuOY2lPex8TZ9HIg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Nov 2019 18:23:55 +1100
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
 Alexander Duyck <alexander.duyck@gmail.com>, Linux MM <linux-mm@kvack.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Mackerras <paulus@samba.org>,
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
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 David Hildenbrand <dhildenb@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08.11.19 06:09, Dan Williams wrote:
> On Thu, Nov 7, 2019 at 2:07 PM David Hildenbrand <david@redhat.com> wrote=
:
>>
>> On 07.11.19 19:22, David Hildenbrand wrote:
>>>
>>>
>>>> Am 07.11.2019 um 16:40 schrieb Dan Williams <dan.j.williams@intel.com>=
:
>>>>
>>>> =EF=BB=BFOn Thu, Oct 24, 2019 at 5:12 AM David Hildenbrand <david@redh=
at.com> wrote:
>>>>>
>>>>> Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
>>>>> change that.
>>>>>
>>>>> KVM has this weird use case that you can map anything from /dev/mem
>>>>> into the guest. pfn_valid() is not a reliable check whether the memma=
p
>>>>> was initialized and can be touched. pfn_to_online_page() makes sure
>>>>> that we have an initialized memmap (and don't have ZONE_DEVICE memory=
).
>>>>>
>>>>> Rewrite is_invalid_reserved_pfn() similar to kvm_is_reserved_pfn() to=
 make
>>>>> sure the function produces the same result once we stop setting ZONE_=
DEVICE
>>>>> pages PG_reserved.
>>>>>
>>>>> Cc: Alex Williamson <alex.williamson@redhat.com>
>>>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>> drivers/vfio/vfio_iommu_type1.c | 10 ++++++++--
>>>>> 1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iomm=
u_type1.c
>>>>> index 2ada8e6cdb88..f8ce8c408ba8 100644
>>>>> --- a/drivers/vfio/vfio_iommu_type1.c
>>>>> +++ b/drivers/vfio/vfio_iommu_type1.c
>>>>> @@ -299,9 +299,15 @@ static int vfio_lock_acct(struct vfio_dma *dma, =
long npage, bool async)
>>>>>    */
>>>>> static bool is_invalid_reserved_pfn(unsigned long pfn)
>>>>> {
>>>>> -       if (pfn_valid(pfn))
>>>>> -               return PageReserved(pfn_to_page(pfn));
>>>>> +       struct page *page =3D pfn_to_online_page(pfn);
>>>>
>>>> Ugh, I just realized this is not a safe conversion until
>>>> pfn_to_online_page() is moved over to subsection granularity. As it
>>>> stands it will return true for any ZONE_DEVICE pages that share a
>>>> section with boot memory.
>>>
>>> That should not happen right now and I commented back when you introduc=
ed subsection support that I don=E2=80=99t want to have ZONE_DEVICE mixed w=
ith online pages in a section. Having memory block devices that partially s=
pan ZONE_DEVICE would be ... really weird. With something like pfn_active()=
 - as discussed - we could at least make this check work - but I am not sur=
e if we really want to go down that path. In the worst case, some MB of RAM=
 are lost ... I guess this needs more thought.
>>>
>>
>> I just realized the "boot memory" part. Is that a real thing? IOW, can
>> we have ZONE_DEVICE falling into a memory block (with holes)? I somewhat
>> have doubts that this would work ...
>=20
> One of the real world failure cases that started the subsection effect
> is that Persistent Memory collides with System RAM on a 64MB boundary
> on shipping platforms. System RAM ends on a 64MB boundary and due to a
> lack of memory controller resources PMEM is mapped contiguously at the
> end of that boundary. Some more details in the subsection cover letter
> / changelogs [1] [2]. It's not sufficient to just lose some memory,
> that's the broken implementation that lead to the subsection work
> because the lost memory may change from one boot to the next and
> software can't reliably inject a padding that conforms to the x86
> 128MB section constraint.

Thanks, I thought it was mostly for weird alignment where other parts of=20
the section are basically "holes" and not memory.

Yes, it is a real bug that ZONE_DEVICE pages fall into sections that are=20
marked SECTION_IS_ONLINE.

>=20
> Suffice to say I think we need your pfn_active() to get subsection
> granularity pfn_to_online_page() before PageReserved() can be removed.

I agree that we have to fix this. I don't like ZONE_DEVICE pages falling=20
into memory device blocks (e.g., cannot get offlined), but I guess that=20
train is gone :) As long as it's not for memory hotplug, I can most=20
probably live with this.

Also, I'd like to get Michals opinion on this and the pfn_active()=20
approach, but I can understand he's busy.

This patch set can wait, I won't be working next week besides=20
reading/writing mails either way.

Is anybody looking into the pfn_active() thingy?

>=20
> [1]: https://lore.kernel.org/linux-mm/156092349300.979959.176037107119577=
35135.stgit@dwillia2-desk3.amr.corp.intel.com/
> [2]: https://lore.kernel.org/linux-mm/156092354368.979959.623244392344095=
2359.stgit@dwillia2-desk3.amr.corp.intel.com/
>=20


--=20

Thanks,

David / dhildenb

