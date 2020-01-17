Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F0140EB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 17:13:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zmLs5WxmzDqjY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 03:13:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZtnEDWbV; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zmJT3w0zzDqvy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 03:11:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579277461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bkYx3IXLBjWMcH8xaqQwnXdXj9gNFT4cX9S4gKxUK+s=;
 b=ZtnEDWbVmT3QTLktgbu+oFlvefjkdAyXnYnANZ/xUFLyMNh4vSWwRBfv7SEVZUZA4o7eqC
 X4JIae8FBbrxsnFzm+Dfdf/pZ9WQdCl2RlnOsp6Ygzv48614lwjnVIw9FiKHpPjnXONgSX
 Z5lmCV0sksffO7JbQdL7x9L80G83DME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-HijssW8sNBeEkfLcdl1RIQ-1; Fri, 17 Jan 2020 11:10:57 -0500
X-MC-Unique: HijssW8sNBeEkfLcdl1RIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC5CA800D41;
 Fri, 17 Jan 2020 16:10:54 +0000 (UTC)
Received: from [10.36.117.199] (ovpn-117-199.ams2.redhat.com [10.36.117.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 236C25D9CD;
 Fri, 17 Jan 2020 16:10:49 +0000 (UTC)
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
To: Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>
References: <20200117105759.27905-1-david@redhat.com>
 <20200117113353.GT19428@dhcp22.suse.cz>
 <c82a0dd7-a99b-6def-83d4-a19fbdd405d9@redhat.com>
 <20200117145233.GB19428@dhcp22.suse.cz>
 <65606e2e-1cf7-de3b-10b1-33653cb41a52@redhat.com>
 <20200117152947.GK19428@dhcp22.suse.cz>
 <CAPcyv4hHHzdPp4SQ0sePzx7XEvD7U_B+vZDT00O6VbFY8kJqjw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <25a94f61-46a1-59a6-6b54-8cc6b35790d2@redhat.com>
Date: Fri, 17 Jan 2020 17:10:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hHHzdPp4SQ0sePzx7XEvD7U_B+vZDT00O6VbFY8kJqjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17.01.20 16:54, Dan Williams wrote:
> On Fri, Jan 17, 2020 at 7:30 AM Michal Hocko <mhocko@kernel.org> wrote:
>>
>> On Fri 17-01-20 15:58:26, David Hildenbrand wrote:
>>> On 17.01.20 15:52, Michal Hocko wrote:
>>>> On Fri 17-01-20 14:08:06, David Hildenbrand wrote:
>>>>> On 17.01.20 12:33, Michal Hocko wrote:
>>>>>> On Fri 17-01-20 11:57:59, David Hildenbrand wrote:
>>>>>>> Let's refactor that code. We want to check if we can offline memo=
ry
>>>>>>> blocks. Add a new function is_mem_section_offlineable() for that =
and
>>>>>>> make it call is_mem_section_offlineable() for each contained sect=
ion.
>>>>>>> Within is_mem_section_offlineable(), add some more sanity checks =
and
>>>>>>> directly bail out if the section contains holes or if it spans mu=
ltiple
>>>>>>> zones.
>>>>>>
>>>>>> I didn't read the patch (yet) but I am wondering. If we want to to=
uch
>>>>>> this code, can we simply always return true there? I mean whoever
>>>>>> depends on this check is racy and the failure can happen even afte=
r
>>>>>> the sysfs says good to go, right? The check is essentially as expe=
nsive
>>>>>> as calling the offlining code itself. So the only usecase I can th=
ink of
>>>>>> is a dumb driver to crawl over blocks and check which is removable=
 and
>>>>>> try to hotremove it. But just trying to offline one block after an=
other
>>>>>> is essentially going to achieve the same.
>>>>>
>>>>> Some thoughts:
>>>>>
>>>>> 1. It allows you to check if memory is likely to be offlineable wit=
hout
>>>>> doing expensive locking and trying to isolate pages (meaning:
>>>>> zone->lock, mem_hotplug_lock. but also, calling drain_all_pages()
>>>>> when isolating)
>>>>>
>>>>> 2. There are use cases that want to identify a memory block/DIMM to
>>>>> unplug. One example is PPC DLPAR code (see this patch). Going over =
all
>>>>> memory block trying to offline them is an expensive operation.
>>>>>
>>>>> 3. powerpc-utils (https://github.com/ibm-power-utilities/powerpc-ut=
ils)
>>>>> makes use of /sys/.../removable to speed up the search AFAIK.
>>>>
>>>> Well, while I do see those points I am not really sure they are wort=
h
>>>> having a broken (by-definition) interface.
>>>
>>> It's a pure speedup. And for that, the interface has been working
>>> perfectly fine for years?
>>>
>>>>
>>>>> 4. lsmem displays/groups by "removable".
>>>>
>>>> Is anybody really using that?
>>>
>>> Well at least I am using that when testing to identify which
>>> (ZONE_NORMAL!) block I can easily offline/re-online (e.g., to validat=
e
>>> all the zone shrinking stuff I have been fixing)
>>>
>>> So there is at least one user ;)
>>
>> Fair enough. But I would argue that there are better ways to do the sa=
me
>> solely for testing purposes. Rather than having a subtly broken code t=
o
>> maintain.
>>
>>>>
>>>>>> Or does anybody see any reasonable usecase that would break if we =
did
>>>>>> that unconditional behavior?
>>>>>
>>>>> If we would return always "true", then the whole reason the
>>>>> interface originally was introduced would be "broken" (meaning, les=
s
>>>>> performant as you would try to offline any memory block).
>>>>
>>>> I would argue that the whole interface is broken ;). Not the first t=
ime
>>>> in the kernel development history and not the last time either. What=
 I
>>>> am trying to say here is that unless there are _real_ usecases depen=
ding
>>>> on knowing that something surely is _not_ offlineable then I would j=
ust
>>>> try to drop the functionality while preserving the interface and see
>>>> what happens.
>>>
>>> I can see that, but I can perfectly well understand why - especially
>>> powerpc - wants a fast way to sense which blocks actually sense to tr=
y
>>> to online.
>>>
>>> The original patch correctly states
>>>    "which sections of
>>>     memory are likely to be removable before attempting the potential=
ly
>>>     expensive operation."
>>>
>>> It works as designed I would say.
>>
>> Then I would just keep it crippled the same way it has been for years
>> without anybody noticing.
>=20
> I tend to agree. At least the kmem driver that wants to unplug memory
> could not use an interface that does not give stable answers. It just
> relies on remove_memory() to return a definitive error.
>=20

Just because kmem cannot reuse such an interface doesn't mean we should
not touch it (or I am not getting your point). Especially, this
interface is about "can it be likely be offlined and then eventually be
removed (if there is a HW interface for that)" (as documented), not
about "will remove_memory()" work.

We do have users and if we agree to keep it (what I think we should as I
expressed) then I think we should un-cripple and fix it. After all we
have to maintain it. The current interface provides what was documented
- "likely to be offlineable". (the chosen name was just horribly bad -
as I expressed a while ago already :) )

--=20
Thanks,

David / dhildenb

