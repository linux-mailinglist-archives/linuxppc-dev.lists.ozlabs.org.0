Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60910E2C46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 10:35:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zLCW6RlyzDqSj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:35:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZmXABiZz"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zKLS3dMwzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 18:55:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571903756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2HcAVL2s+NZnk3LL+Y5gUG2TcYxdjN3fXPWT3YMgHw=;
 b=ZmXABiZzP2Awt1hXrQ+dJnuI/N5NVijdpgps+ZSE34PmPZItfaUKGznZdEo4zun32a9KXz
 oPWvuJ8qufzbURQJiXIbwqz3b7kaVUy9gZgq5fvC7YmX8w8Mxi5M2M+dKDAV7u4MurjHFD
 OQ75TLfC1YsI0c3QdWjeFhNuYEXOHDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-0PKzETIIO6qSN3X27vvlnQ-1; Thu, 24 Oct 2019 03:55:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2063100551D;
 Thu, 24 Oct 2019 07:55:48 +0000 (UTC)
Received: from [10.36.117.225] (ovpn-117-225.ams2.redhat.com [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEA6E60852;
 Thu, 24 Oct 2019 07:55:26 +0000 (UTC)
Subject: Re: [PATCH RFC v1 01/12] mm/memory_hotplug: Don't allow to
 online/offline memory blocks with holes
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-kernel@vger.kernel.org
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-2-david@redhat.com>
 <4aa3c72b-8991-9e43-80d7-a906ae79160b@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <93858175-0677-e5d6-6ecd-4035d71543b0@redhat.com>
Date: Thu, 24 Oct 2019 09:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4aa3c72b-8991-9e43-80d7-a906ae79160b@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0PKzETIIO6qSN3X27vvlnQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Oct 2019 19:33:05 +1100
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Vandana BN <bnvandana@gmail.com>, Jeremy Sowden <jeremy@azazel.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.10.19 05:53, Anshuman Khandual wrote:
>=20
> On 10/22/2019 10:42 PM, David Hildenbrand wrote:
>> Our onlining/offlining code is unnecessarily complicated. Only memory
>> blocks added during boot can have holes. Hotplugged memory never has
>> holes. That memory is already online.
>=20
> Why hot plugged memory at runtime cannot have holes (e.g a semi bad DIMM)=
.

Important: HWPoison !=3D memory hole

A memory hole is memory that is not "IORESOURCE_SYSRAM". These pages are=20
currently marked PG_reserved. Such holes are sometimes used for mapping=20
something into kernel space. Some archs use the PG_reserved to detect=20
the memory hole ("not ram") and ignore the memmap.

Poisoned pages are marked PG_hwpoison.

> Currently, do we just abort adding that memory block if there are holes ?

There is no interface to do that.

E.g., have a look at add_memory() add_memory_resource(). You can only=20
pass one memory resource (that is all IORESOURCE_SYSRAM | IORESOURCE_BUSY)

Hotplugging memory with holes is not supported (nor can I imagine a use=20
case for that).

>>
>> When we stop allowing to offline memory blocks with holes, we implicitly
>> stop to online memory blocks with holes.
>=20
> Reducing hotplug support for memory blocks with holes just to simplify
> the code. Is it worth ?

Me and Michal are not aware of a users, not even aware of a use case.=20
Keeping code around that nobody really needs that limits cleanups, no=20
thanks. Similar to us not supporting to offline memory blocks that span=20
multiple nodes/zones.

E.g., have a look at the isolation code. It is full of code that jumps=20
over memory holes (start_isolate_page_range() -> __first_valid_page()).=20
That made sense for our complicated memory offlining code, but it is=20
actually harmful when dealing with alloc_contig_range(). Allocation=20
never wants to jump over memory holes. After this patch, we can just=20
fail hard on any memory hole we detect, instead of ignoring it (or=20
special-casing it).

>=20
>>
>> This allows to simplify the code. For example, we no longer have to
>> worry about marking pages that fall into memory holes PG_reserved when
>> onlining memory. We can stop setting pages PG_reserved.
>=20
> Could not there be any other way of tracking these holes if not the page
> reserved bit. In the memory section itself and corresponding struct pages
> just remained poisoned ? Just wondering, might be all wrong here.

Of course there could be ways (e.g., using PG_offline eventually), but=20
it boils down to us having to deal with it in onlining/offlining code.=20
And that is some handling nobody really seems to need.

>=20
>>
>> Offlining memory blocks added during boot is usually not guranteed to wo=
rk
>> either way. So stopping to do that (if anybody really used and tested
>=20
> That guarantee does not exist right now because how boot memory could hav=
e
> been used after boot not from a limitation of the memory hot remove itsel=
f.

Yep. However, Michal and I are not even aware of a setup that would made=20
this work and guarantee that the existing code actually still is able to=20
deal with holes. Are you?

>=20
>> this over the years) should not really hurt. For the use case of
>> offlining memory to unplug DIMMs, we should see no change. (holes on
>> DIMMs would be weird)
>=20
> Holes on DIMM could be due to HW errors affecting only parts of it. By no=
t

Again, HW errors !=3D holes. We have PG_hwpoison for that.

> allowing such DIMM's hot add and remove, we are definitely reducing the
> scope of overall hotplug functionality. Is code simplification in itself
> is worth this reduction in functionality ?

What you describe is not affected.

Thanks!

--=20

Thanks,

David / dhildenb

