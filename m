Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE8F3C05
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 00:16:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478K5j2QnkzF6h4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 10:16:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="O4bk1MDE"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478HZh10JmzF6b0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 09:07:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573164456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIBG5GMIReYQpS3U1ws59fK/jF+FBXDJRRxLPPFv3ms=;
 b=O4bk1MDEpgKHWlHhe7JtX7kLWXPSF7WJ62tEpK9Wmak16YY4VNiBnj/42oP2uo45STNMTf
 eRy+IaYO+4ryMlyhgi981EravFdzs+aBUytmiwZ8G5btz/h0he5U3Nhqpcg16w+bGfCxxF
 w04N5yDrZYQU0ctK5CDjwaBQHZ7gc4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-U5XuV8_tOUWYRd6dFnpBtA-1; Thu, 07 Nov 2019 17:07:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4A64477;
 Thu,  7 Nov 2019 22:07:28 +0000 (UTC)
Received: from [10.36.116.80] (ovpn-116-80.ams2.redhat.com [10.36.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1309E600D3;
 Thu,  7 Nov 2019 22:07:10 +0000 (UTC)
Subject: Re: [PATCH v1 04/10] vfio/type1: Prepare is_invalid_reserved_pfn()
 for PG_reserved changes
To: David Hildenbrand <dhildenb@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>
References: <CAPcyv4hxs+KqY5gU8Ds1a73eub1imvm9Qo8KdKGiDD1e-p0cww@mail.gmail.com>
 <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <0eb001e0-bb26-59bb-c514-d2f8a86a7eab@redhat.com>
Date: Thu, 7 Nov 2019 23:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <DF536BED-6F4F-4351-AC7E-3C9FC8545332@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: U5XuV8_tOUWYRd6dFnpBtA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Nov 2019 10:14:21 +1100
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
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07.11.19 19:22, David Hildenbrand wrote:
>=20
>=20
>> Am 07.11.2019 um 16:40 schrieb Dan Williams <dan.j.williams@intel.com>:
>>
>> =EF=BB=BFOn Thu, Oct 24, 2019 at 5:12 AM David Hildenbrand <david@redhat=
.com> wrote:
>>>
>>> Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
>>> change that.
>>>
>>> KVM has this weird use case that you can map anything from /dev/mem
>>> into the guest. pfn_valid() is not a reliable check whether the memmap
>>> was initialized and can be touched. pfn_to_online_page() makes sure
>>> that we have an initialized memmap (and don't have ZONE_DEVICE memory).
>>>
>>> Rewrite is_invalid_reserved_pfn() similar to kvm_is_reserved_pfn() to m=
ake
>>> sure the function produces the same result once we stop setting ZONE_DE=
VICE
>>> pages PG_reserved.
>>>
>>> Cc: Alex Williamson <alex.williamson@redhat.com>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>> drivers/vfio/vfio_iommu_type1.c | 10 ++++++++--
>>> 1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_=
type1.c
>>> index 2ada8e6cdb88..f8ce8c408ba8 100644
>>> --- a/drivers/vfio/vfio_iommu_type1.c
>>> +++ b/drivers/vfio/vfio_iommu_type1.c
>>> @@ -299,9 +299,15 @@ static int vfio_lock_acct(struct vfio_dma *dma, lo=
ng npage, bool async)
>>>   */
>>> static bool is_invalid_reserved_pfn(unsigned long pfn)
>>> {
>>> -       if (pfn_valid(pfn))
>>> -               return PageReserved(pfn_to_page(pfn));
>>> +       struct page *page =3D pfn_to_online_page(pfn);
>>
>> Ugh, I just realized this is not a safe conversion until
>> pfn_to_online_page() is moved over to subsection granularity. As it
>> stands it will return true for any ZONE_DEVICE pages that share a
>> section with boot memory.
>=20
> That should not happen right now and I commented back when you introduced=
 subsection support that I don=E2=80=99t want to have ZONE_DEVICE mixed wit=
h online pages in a section. Having memory block devices that partially spa=
n ZONE_DEVICE would be ... really weird. With something like pfn_active() -=
 as discussed - we could at least make this check work - but I am not sure =
if we really want to go down that path. In the worst case, some MB of RAM a=
re lost ... I guess this needs more thought.
>=20

I just realized the "boot memory" part. Is that a real thing? IOW, can=20
we have ZONE_DEVICE falling into a memory block (with holes)? I somewhat=20
have doubts that this would work ...

--=20

Thanks,

David / dhildenb

