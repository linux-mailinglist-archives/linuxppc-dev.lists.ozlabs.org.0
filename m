Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD003EFBB8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 11:49:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476md86X7kzF4NJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 21:49:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="b6DH0v8G"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476kc43r2ZzF1LP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 20:18:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572945505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsUg4V2hCRqokDEt6EDiLa/nWjJkgCxKTlTyYOik09s=;
 b=b6DH0v8GS26OpMHXc7M+R6iK1WWnEegVfyYJG/4L8sm+b14ZLK0wnTWOjm237KU+DYsZ/m
 VelgWfhEb9mNBeq1mrYyd1KsrBLpp/y4ZPWReg2b6RWcC+QMOhrwC3n17Dv+AYAWHtpIuE
 AW3FH4I9u5ySBfXd5kxzmj6CkUp7ayM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-wRX3ELHkOxy3Ag2rKnjLCA-1; Tue, 05 Nov 2019 04:18:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90226477;
 Tue,  5 Nov 2019 09:18:16 +0000 (UTC)
Received: from [10.36.117.253] (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1D465D70D;
 Tue,  5 Nov 2019 09:17:55 +0000 (UTC)
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
To: Dan Williams <dan.j.williams@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
Date: Tue, 5 Nov 2019 10:17:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: wRX3ELHkOxy3Ag2rKnjLCA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 05 Nov 2019 21:46:21 +1100
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
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.11.19 05:38, Dan Williams wrote:
> On Thu, Oct 24, 2019 at 5:11 AM David Hildenbrand <david@redhat.com> wrot=
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
>> Rewrite kvm_is_reserved_pfn() to make sure the function produces the
>> same result once we stop setting ZONE_DEVICE pages PG_reserved.
>>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Radim Kr=C4=8Dm=C3=A1=C5=99" <rkrcmar@redhat.com>
>> Cc: Michal Hocko <mhocko@kernel.org>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: KarimAllah Ahmed <karahmed@amazon.de>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   virt/kvm/kvm_main.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index e9eb666eb6e8..9d18cc67d124 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -151,9 +151,15 @@ __weak int kvm_arch_mmu_notifier_invalidate_range(s=
truct kvm *kvm,
>>
>>   bool kvm_is_reserved_pfn(kvm_pfn_t pfn)
>>   {
>> -       if (pfn_valid(pfn))
>> -               return PageReserved(pfn_to_page(pfn));
>> +       struct page *page =3D pfn_to_online_page(pfn);
>>
>> +       /*
>> +        * We treat any pages that are not online (not managed by the bu=
ddy)
>> +        * as reserved - this includes ZONE_DEVICE pages and pages witho=
ut
>> +        * a memmap (e.g., mapped via /dev/mem).
>> +        */
>> +       if (page)
>> +               return PageReserved(page);
>>          return true;
>>   }
>=20
> So after this all the pfn_valid() usage in kvm_main.c is replaced with
> pfn_to_online_page()? Looks correct to me.
>=20
> However, I'm worried that kvm is taking reference on ZONE_DEVICE pages
> through some other path resulting in this:
>=20
>      https://lore.kernel.org/linux-nvdimm/20190919154708.GA24650@angband.=
pl/
>=20
> I'll see if this patch set modulates or maintains that failure mode.
>=20

I'd assume that the behavior is unchanged. Ithink we get a reference to=20
these ZONE_DEVICE pages via __get_user_pages_fast() and friends in=20
hva_to_pfn_fast() and friends in virt/kvm/kvm_main.c

--=20

Thanks,

David / dhildenb

