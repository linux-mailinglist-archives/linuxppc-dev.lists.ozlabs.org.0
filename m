Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ACCEFC8F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 12:39:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476nlK28w8zF3TD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 22:39:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="WttzqtvS"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476n4r2JRNzF4c4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 22:10:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572952200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FREnvreZ0DXlMswNBUBVaTmUA3OlcxYKpKYODf+ZHzI=;
 b=WttzqtvScM34sSHJCeqzftEiuUfyBlP8Bts8+PBSOJBJTCBgEDenhqtojWzPd82lKoKtsK
 uPg3XN+uFHn9Vn6AExd/XuXYrZnGkT4oAl32O9/gY0i97l4g/NRa8cRAiI6PRRFWqJqybQ
 EvLMV+k7qH9a/pVp9Zj7/vGwzvRh4ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-JwYfLl3JMpuPum529BzIzg-1; Tue, 05 Nov 2019 06:09:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C6EC801FCB;
 Tue,  5 Nov 2019 11:09:52 +0000 (UTC)
Received: from [10.36.117.253] (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15277608B5;
 Tue,  5 Nov 2019 11:09:33 +0000 (UTC)
Subject: Re: [PATCH v1 02/10] KVM: x86/mmu: Prepare kvm_is_mmio_pfn() for
 PG_reserved changes
To: Dan Williams <dan.j.williams@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-3-david@redhat.com>
 <CAPcyv4iFJgtcx56g+Le2DccgvoncvVZuaEBRSOyv-=52YNqJug@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <91df87ad-bbc5-aa9e-653f-d68c3c322978@redhat.com>
Date: Tue, 5 Nov 2019 12:09:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iFJgtcx56g+Le2DccgvoncvVZuaEBRSOyv-=52YNqJug@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: JwYfLl3JMpuPum529BzIzg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 05 Nov 2019 22:38:01 +1100
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

On 05.11.19 02:37, Dan Williams wrote:
> On Thu, Oct 24, 2019 at 5:10 AM David Hildenbrand <david@redhat.com> wrot=
e:
>>
>> Right now, ZONE_DEVICE memory is always set PG_reserved. We want to
>> change that.
>>
>> KVM has this weird use case that you can map anything from /dev/mem
>> into the guest. pfn_valid() is not a reliable check whether the memmap
>> was initialized and can be touched. pfn_to_online_page() makes sure
>> that we have an initialized memmap (and don't have ZONE_DEVICE memory).
>>
>> Rewrite kvm_is_mmio_pfn() to make sure the function produces the
>> same result once we stop setting ZONE_DEVICE pages PG_reserved.
>>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Radim Kr=C4=8Dm=C3=A1=C5=99" <rkrcmar@redhat.com>
>> Cc: Sean Christopherson <sean.j.christopherson@intel.com>
>> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
>> Cc: Wanpeng Li <wanpengli@tencent.com>
>> Cc: Jim Mattson <jmattson@google.com>
>> Cc: Joerg Roedel <joro@8bytes.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: KarimAllah Ahmed <karahmed@amazon.de>
>> Cc: Michal Hocko <mhocko@kernel.org>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/x86/kvm/mmu.c | 29 +++++++++++++++++------------
>>   1 file changed, 17 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
>> index 24c23c66b226..f03089a336de 100644
>> --- a/arch/x86/kvm/mmu.c
>> +++ b/arch/x86/kvm/mmu.c
>> @@ -2962,20 +2962,25 @@ static bool mmu_need_write_protect(struct kvm_vc=
pu *vcpu, gfn_t gfn,
>>
>>   static bool kvm_is_mmio_pfn(kvm_pfn_t pfn)
>>   {
>> +       struct page *page =3D pfn_to_online_page(pfn);
>> +
>> +       /*
>> +        * ZONE_DEVICE pages are never online. Online pages that are res=
erved
>> +        * either indicate the zero page or MMIO pages.
>> +        */
>> +       if (page)
>> +               return !is_zero_pfn(pfn) && PageReserved(pfn_to_page(pfn=
));
>> +
>> +       /*
>> +        * Anything with a valid (but not online) memmap could be ZONE_D=
EVICE.
>> +        * Treat only UC/UC-/WC pages as MMIO.
>=20
> You might clarify that ZONE_DEVICE pages that belong to WB cacheable
> pmem have the correct memtype established by devm_memremap_pages().

/*
  * Anything with a valid (but not online) memmap could be ZONE_DEVICE.
  * Treat only UC/UC-/WC pages as MMIO. devm_memremap_pages() established
  * the correct memtype for WB cacheable ZONE_DEVICE pages.
  */

Thanks!

>=20
> Other than that, feel free to add:
>=20
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
>=20


--=20

Thanks,

David / dhildenb

