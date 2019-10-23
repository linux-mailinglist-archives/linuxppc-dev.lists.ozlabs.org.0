Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5A3E2669
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 00:33:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z4sg2zsBzDqDs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 09:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="QiMcdmr/"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z3KV3T5DzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 08:24:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571865851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vzd2ocPNksWw3U66mjSSBhc4b11MB7MzKL2ivISGmQA=;
 b=QiMcdmr/pewoIj40b4JgmtTKXDacICulSJggQ+A5Mbc8L6knhfTxwv2f2JvbqNXIDIARNM
 sPcGnpIYnsIP20FSHoRFCz4ZIqaTZCtqSB88qRZpWwBBDDrnvBjZzXcLuHF0/daO6JW+T0
 vZlanzh3breSgxd4HaxWsfn2WHev0rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-C2Ek62ONPfGRjsaXZc-0RA-1; Wed, 23 Oct 2019 17:24:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3312B1800D6B;
 Wed, 23 Oct 2019 21:22:45 +0000 (UTC)
Received: from [10.36.116.38] (ovpn-116-38.ams2.redhat.com [10.36.116.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF05A600CC;
 Wed, 23 Oct 2019 21:22:24 +0000 (UTC)
Subject: Re: [PATCH RFC v1 00/12] mm: Don't mark hotplugged pages PG_reserved
 (including ZONE_DEVICE)
To: Dan Williams <dan.j.williams@intel.com>
References: <20191022171239.21487-1-david@redhat.com>
 <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
 <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
 <CAPcyv4hHTqWWWREX2AtpEpfLHdDHvT-Kp_2YBW1As0y2Mx+6Dg@mail.gmail.com>
 <55640861-bbcb-95f0-766a-95bc961f1b0e@redhat.com>
 <CAPcyv4g1zBpD2i936wWB9Pn0OStUoksXXLCCdXeYjbHuri-j4Q@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <a1f53724-2a7b-048d-0790-a17c8b79c65a@redhat.com>
Date: Wed, 23 Oct 2019 23:22:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4g1zBpD2i936wWB9Pn0OStUoksXXLCCdXeYjbHuri-j4Q@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: C2Ek62ONPfGRjsaXZc-0RA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Oct 2019 09:32:05 +1100
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>,
 Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Vandana BN <bnvandana@gmail.com>, Jeremy Sowden <jeremy@azazel.net>,
 Mel Gorman <mgorman@techsingularity.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23.10.19 21:39, Dan Williams wrote:
> On Wed, Oct 23, 2019 at 10:28 AM David Hildenbrand <david@redhat.com> wro=
te:
>>
>>>> I dislike this for three reasons
>>>>
>>>> a) It does not protect against any races, really, it does not improve =
things.
>>>> b) We do have the exact same problem with pfn_to_online_page(). As lon=
g as we
>>>>    don't hold the memory hotplug lock, memory can get offlined and rem=
ove any time. Racy.
>>>
>>> True, we need to solve that problem too. That seems to want something
>>> lighter weight than the hotplug lock that can be held over pfn lookups
>>> +  use rather than requiring a page lookup in paths where it's not
>>> clear that a page reference would prevent unplug.
>>>
>>>> c) We mix in ZONE specific stuff into the core. It should be "just ano=
ther zone"
>>>
>>> Not sure I grok this when the RFC is sprinkling zone-specific
>>> is_zone_device_page() throughout the core?
>>
>> Most users should not care about the zone. pfn_active() would be enough
>> in most situations, especially most PFN walkers - "this memmap is valid
>> and e.g., contains a valid zone ...".
>=20
> Oh, I see, you're saying convert most users to pfn_active() (and some
> TBD rcu locking), but only pfn_to_online_page() users would need the
> zone lookup? I can get on board with that.

I guess my answer to that is simple: If we only care about "is this
memmap safe to touch", use pfn_active()

(well, with pfn_valid_within() similar as done in pfn_to_online_page()
due to memory holes, but these are details - e.g., pfn_active() can
check against pfn_valid_within() right away internally). (+locking TBD
to make sure it remains active)

However, if we want to special case in addition on zones (!ZONE_DEVICE
(a.k.a., onlined via memory blocks, managed by the buddy), ZONE_DEVICE,
whatever might come in the future, ...), also access the zone stored in
the memmap. E.g., by using pfn_to_online_page().

>=20
>>
>>>
>>>>
>>>> What I propose instead (already discussed in https://lkml.org/lkml/201=
9/10/10/87)
>>>
>>> Sorry I missed this earlier...
>>>
>>>>
>>>> 1. Convert SECTION_IS_ONLINE to SECTION_IS_ACTIVE
>>>> 2. Convert SECTION_IS_ACTIVE to a subsection bitmap
>>>> 3. Introduce pfn_active() that checks against the subsection bitmap
>>>> 4. Once the memmap was initialized / prepared, set the subsection acti=
ve
>>>>    (similar to SECTION_IS_ONLINE in the buddy right now)
>>>> 5. Before the memmap gets invalidated, set the subsection inactive
>>>>    (similar to SECTION_IS_ONLINE in the buddy right now)
>>>> 5. pfn_to_online_page() =3D pfn_active() && zone !=3D ZONE_DEVICE
>>>> 6. pfn_to_device_page() =3D pfn_active() && zone =3D=3D ZONE_DEVICE
>>>
>>> This does not seem to reduce any complexity because it still requires
>>> a pfn to zone lookup at the end of the process.
>>>
>>> I.e. converting pfn_to_online_page() to use a new pfn_active()
>>> subsection map plus looking up the zone from pfn_to_page() is more
>>> steps than just doing a direct pfn to zone lookup. What am I missing?
>>
>> That a real "pfn to zone" lookup without going via the struct page will
>> require to have more than just a single bitmap. IMHO, keeping the
>> information at a single place (memmap) is the clean thing to do (not
>> replicating it somewhere else). Going via the memmap might not be as
>> fast as a direct lookup, but do we actually care? We are already looking
>> at "random PFNs we are not sure if there is a valid memmap".
>=20
> True, we only care about the validity of the check, and as you pointed
> out moving the check to the pfn level does not solve the validity
> race. It needs a lock.

Let's call pfn_active() "a pfn that is active in the system and has an
initialized memmap, which contains sane values" (valid memmap sounds
like pfn_valid(), which is actually "there is a memmap which might
contain garbage"). Yes we need some sort of lightweight locking as
discussed.

[...]

>>>> However, I think we also have to clarify if we need the change in 3 at=
 all.
>>>> It comes from
>>>>
>>>> commit f5509cc18daa7f82bcc553be70df2117c8eedc16
>>>> Author: Kees Cook <keescook@chromium.org>
>>>> Date:   Tue Jun 7 11:05:33 2016 -0700
>>>>
>>>>     mm: Hardened usercopy
>>>>
>>>>     This is the start of porting PAX_USERCOPY into the mainline kernel=
. This
>>>>     is the first set of features, controlled by CONFIG_HARDENED_USERCO=
PY. The
>>>>     work is based on code by PaX Team and Brad Spengler, and an earlie=
r port
>>>>     from Casey Schaufler. Additional non-slab page tests are from Rik =
van Riel.
>>>> [...]
>>>>     - otherwise, object must not span page allocations (excepting Rese=
rved
>>>>       and CMA ranges)
>>>>
>>>> Not sure if we really have to care about ZONE_DEVICE at this point.
>>>
>>> That check needs to be careful to ignore ZONE_DEVICE pages. There's
>>> nothing wrong with a copy spanning ZONE_DEVICE and typical pages.
>>
>> Please note that the current check would *forbid* this (AFAIKs for a
>> single heap object). As discussed in the relevant patch, we might be
>> able to just stop doing that and limit it to real PG_reserved pages
>> (without ZONE_DEVICE). I'd be happy to not introduce new
>> is_zone_device_page() users.
>=20
> At least for non-HMM ZONE_DEVICE usage, i.e. the dax + pmem stuff, is
> excluded from this path by:
>=20
> 52f476a323f9 libnvdimm/pmem: Bypass CONFIG_HARDENED_USERCOPY overhead

Interesting, and very valuable information. So this sounds like patch #2
can go (or convert it to a documentation update).

>=20
> So this case is one more to add to the pile of HMM auditing.

Sounds like HMM is some dangerous piece of software we have. This needs
auditing, fixing, and documentation.

BTW, do you have a good source of details about HMM? Especially about
these oddities you mentioned?

Also, can you have a look at patch #2 7/8 and confirm that doing a
SetPageDirty() on a ZONE_DEVICE page is okay (although not useful)? Thanks!

--=20

Thanks,

David / dhildenb

