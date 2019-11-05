Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10DEFBD3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 11:52:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476mh52F4nzF4ww
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 21:52:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q4aEcDNT"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476kw65j8RzF4Pc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 20:32:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572946339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCW2yumpyeD0QRpINarfqjy396nJ9BgD2PKUzKr6dO4=;
 b=Q4aEcDNThWdMMNSscxNe+0NZWFKfAu8kRipbQGrRNGOe2jhhPyN5XKjXuDvaWuy5q2ssF4
 KuVuBHlxp+Sm6WlryFmRC5dnZYo5smb2hscej5EKMZ7871zwxYqU8hdx6A9y3vv4PzUDIY
 kfsk6e06QKCpZDfMYuxgtxEE4ySvu7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-p8eCh0xjOsiLVOoP95CF-Q-1; Tue, 05 Nov 2019 04:32:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D653107ACC2;
 Tue,  5 Nov 2019 09:32:08 +0000 (UTC)
Received: from [10.36.117.253] (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E80C60FC2;
 Tue,  5 Nov 2019 09:31:37 +0000 (UTC)
Subject: Re: [PATCH v1 01/10] mm/memory_hotplug: Don't allow to online/offline
 memory blocks with holes
To: Dan Williams <dan.j.williams@intel.com>
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-2-david@redhat.com>
 <CAPcyv4hT58=SDWYO2vrktdFOnDfWveVwN4ZBxNQ8=500_Zu7tQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <c52849c0-1185-c0c4-f9f6-2e7d12ed8e8e@redhat.com>
Date: Tue, 5 Nov 2019 10:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hT58=SDWYO2vrktdFOnDfWveVwN4ZBxNQ8=500_Zu7tQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: p8eCh0xjOsiLVOoP95CF-Q-1
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
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.11.19 02:30, Dan Williams wrote:
> On Thu, Oct 24, 2019 at 5:10 AM David Hildenbrand <david@redhat.com> wrot=
e:
>>
>> Our onlining/offlining code is unnecessarily complicated. Only memory
>> blocks added during boot can have holes (a range that is not
>> IORESOURCE_SYSTEM_RAM). Hotplugged memory never has holes (e.g., see
>> add_memory_resource()). All boot memory is alread online.
>=20
> s/alread/already/
>=20

Thanks.

> ...also perhaps clarify "already online" by what point in time and why
> that is relevant. For example a description of the difference between
> the SetPageReserved() in the bootmem path and the one in the hotplug
> path.

Will add.

>=20
>> Therefore, when we stop allowing to offline memory blocks with holes, we
>> implicitly no longer have to deal with onlining memory blocks with holes=
.
>=20
> Maybe an explicit reference of the code areas that deal with holes
> would help to back up that assertion. Certainly it would have saved me
> some time for the review.

I can add a reference to the onlining code that will only online pages=20
that don't fall into memory holes.

>=20
>> This allows to simplify the code. For example, we no longer have to
>> worry about marking pages that fall into memory holes PG_reserved when
>> onlining memory. We can stop setting pages PG_reserved.
>=20
> ...but not for bootmem, right?

Yes, bootmem is not changed. (especially, early allocations and memory=20
holes are marked PG_reserved - basically everything not given to the=20
buddy after boot)

>=20
>>
>> Offlining memory blocks added during boot is usually not guranteed to wo=
rk
>=20
> s/guranteed/guaranteed/

Thanks.

>=20
>> either way (unmovable data might have easily ended up on that memory dur=
ing
>> boot). So stopping to do that should not really hurt (+ people are not
>> even aware of a setup where that used to work
>=20
> Maybe put a "Link: https://lkml.kernel.org/r/$msg_id" to that discussion?
>=20
>> and that the existing code
>> still works correctly with memory holes). For the use case of offlining
>> memory to unplug DIMMs, we should see no change. (holes on DIMMs would b=
e
>> weird).
>=20
> However, less memory can be offlined than was theoretically allowed
> previously, so I don't understand the "we should see no change"
> comment. I still agree that's a price worth paying to get the code
> cleanups and if someone screams we can look at adding it back, but the
> fact that it was already fragile seems decent enough protection.

Hotplugged DIMMs (add_memory()) have no holes and will therefore see no=20
change.

>>
>> Please note that hardware errors (PG_hwpoison) are not memory holes and
>> not affected by this change when offlining.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/memory_hotplug.c | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index 561371ead39a..8d81730cf036 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1447,10 +1447,19 @@ static void node_states_clear_node(int node, str=
uct memory_notify *arg)
>>                  node_clear_state(node, N_MEMORY);
>>   }
>>
>> +static int count_system_ram_pages_cb(unsigned long start_pfn,
>> +                                    unsigned long nr_pages, void *data)
>> +{
>> +       unsigned long *nr_system_ram_pages =3D data;
>> +
>> +       *nr_system_ram_pages +=3D nr_pages;
>> +       return 0;
>> +}
>> +
>>   static int __ref __offline_pages(unsigned long start_pfn,
>>                    unsigned long end_pfn)
>>   {
>> -       unsigned long pfn, nr_pages;
>> +       unsigned long pfn, nr_pages =3D 0;
>>          unsigned long offlined_pages =3D 0;
>>          int ret, node, nr_isolate_pageblock;
>>          unsigned long flags;
>> @@ -1461,6 +1470,20 @@ static int __ref __offline_pages(unsigned long st=
art_pfn,
>>
>>          mem_hotplug_begin();
>>
>> +       /*
>> +        * Don't allow to offline memory blocks that contain holes.
>> +        * Consecuently, memory blocks with holes can never get onlined
>=20
> s/Consecuently/Consequently/

Thanks.

>=20
>> +        * (hotplugged memory has no holes and all boot memory is online=
).
>> +        * This allows to simplify the onlining/offlining code quite a l=
ot.
>> +        */
>=20
> The last sentence of this comment makes sense in the context of this
> patch, but I don't think it stands by itself in the code base after
> the fact. The person reading the comment can't see the simplifications
> because the code is already gone. I'd clarify it to talk about why it
> is safe to not mess around with PG_Reserved in the hotplug path
> because of this check.

I'll think of something. It's not just the PG_reserved handling but the=20
whole pfn_valid()/walk_system_ram_range() handling that can be simplified.

>=20
> After those clarifications you can add:
>=20
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
>=20

Thanks!

--=20

Thanks,

David / dhildenb

