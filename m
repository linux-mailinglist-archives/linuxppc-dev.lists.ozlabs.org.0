Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A783145B77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 19:21:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482tz24CslzDqV4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 05:21:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=b1VSse4F; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482trR2SsFzDqRB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 05:16:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579716962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aYDoYCqh0OtZe0lF7uX7a/4uwn5JcyIry0p1fbUQD68=;
 b=b1VSse4FGC9qD/9UbaF/AcGRPeJTkSpPpDw5t7vX4A6qI/GKfiDfzxzABzf8mN6Yj6rbhp
 sNO703okvnYxoLuxGP9f2M6eVZ3xSieCxvWeIMSk6IMLVorAlZL4V8xxdz8odwm6nEfyGR
 ZbSZDJAPEzb9NUL/kZ5oXB/eS+nr5NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-BInrnXY6OL2cKxIQT_2XaQ-1; Wed, 22 Jan 2020 13:15:58 -0500
X-MC-Unique: BInrnXY6OL2cKxIQT_2XaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57384DB60;
 Wed, 22 Jan 2020 18:15:53 +0000 (UTC)
Received: from [10.36.117.21] (ovpn-117-21.ams2.redhat.com [10.36.117.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6FA75C1BB;
 Wed, 22 Jan 2020 18:15:48 +0000 (UTC)
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
To: Michal Hocko <mhocko@kernel.org>
References: <CAPcyv4hHHzdPp4SQ0sePzx7XEvD7U_B+vZDT00O6VbFY8kJqjw@mail.gmail.com>
 <25a94f61-46a1-59a6-6b54-8cc6b35790d2@redhat.com>
 <CAPcyv4jvmYRbX9i+1_LvHoTDGABadHbYH3NVkqczKsQ4fsf74g@mail.gmail.com>
 <20200120074816.GG18451@dhcp22.suse.cz>
 <a5f0bd8d-de5e-9f27-5c94-7746a3d20a95@redhat.com>
 <20200121120714.GJ29276@dhcp22.suse.cz>
 <a29b49b9-28ad-44fa-6c0b-90cd43902f29@redhat.com>
 <20200122104230.GU29276@dhcp22.suse.cz>
 <98b6c208-b4dd-9052-43f6-543068c649cc@redhat.com>
 <816ddd66-c90b-76f1-f4a0-72fe41263edd@redhat.com>
 <20200122164618.GY29276@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <626d344e-8243-c161-cd07-ed1276eba73d@redhat.com>
Date: Wed, 22 Jan 2020 19:15:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200122164618.GY29276@dhcp22.suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22.01.20 17:46, Michal Hocko wrote:
> On Wed 22-01-20 12:58:16, David Hildenbrand wrote:
>> On 22.01.20 11:54, David Hildenbrand wrote:
>>> On 22.01.20 11:42, Michal Hocko wrote:
>>>> On Wed 22-01-20 11:39:08, David Hildenbrand wrote:
>>>>>>>> Really, the interface is flawed and should have never been merge=
d in the
>>>>>>>> first place. We cannot simply remove it altogether I am afraid s=
o let's
>>>>>>>> at least remove the bogus code and pretend that the world is a b=
etter
>>>>>>>> place where everything is removable except the reality sucks...
>>>>>>>
>>>>>>> As I expressed already, the interface works as designed/documente=
d and
>>>>>>> has been used like that for years.
>>>>>>
>>>>>> It seems we do differ in the usefulness though. Using a crappy int=
erface
>>>>>> for years doesn't make it less crappy. I do realize we cannot remo=
ve the
>>>>>> interface but we can remove issues with the implementation and I d=
are to
>>>>>> say that most existing users wouldn't really notice.
>>>>>
>>>>> Well, at least powerpc-utils (why this interface was introduced) wi=
ll
>>>>> notice a) performance wise and b) because more logging output will =
be
>>>>> generated (obviously non-offlineable blocks will be tried to offlin=
e).
>>>>
>>>> I would really appreciate some specific example for a real usecase. =
I am
>>>> not familiar with powerpc-utils worklflows myself.
>>>>
>>>
>>> Not an expert myself:
>>>
>>> https://github.com/ibm-power-utilities/powerpc-utils
>>>
>>> -> src/drmgr/drslot_chrp_mem.c
>>>
>>> On request to remove some memory it will
>>>
>>> a) Read "->removable" of all memory blocks ("lmb")
>>> b) Check if the request can be fulfilled using the removable blocks
>>> c) Try to offline the memory blocks by trying to offline it. If that
>>> succeeded, trigger removeal of it using some hypervisor hooks.
>>>
>>> Interestingly, with "AMS ballooning", it will already consider the
>>> "removable" information useless (most probably, because of
>>> non-migratable balloon pages that can be offlined - I assume the powe=
rpc
>>> code that I converted to proper balloon compaction just recently). a)
>>> and b) is skipped.
>>>
>>> Returning "yes" on all blocks will make them handle it just like if "=
AMS
>>> ballooning" is active. So any memory block will be tried. Should work
>>> but will be slower if no ballooning is active.
>>>
>>
>> On lsmem:
>>
>> https://www.ibm.com/support/knowledgecenter/linuxonibm/com.ibm.linux.z=
.lgdd/lgdd_r_lsmem_cmd.html
>>
>> "
>> Removable
>>     yes if the memory range can be set offline, no if it cannot be set
>> offline. A dash (-) means that the range is already offline. The kerne=
l
>> method that identifies removable memory ranges is heuristic and not
>> exact. Occasionally, memory ranges are falsely reported as removable o=
r
>> falsely reported as not removable.
>> "
>>
>> Usage of lsmem paird with chmem:
>>
>> https://access.redhat.com/solutions/3937181
>>
>>
>> Especially interesting for IBM z Systems, whereby memory
>> onlining/offlining will trigger the actual population of memory in the
>> hypervisor. So if an admin wants to offline some memory (to give it ba=
ck
>> to the hypervisor), it would use lsmem to identify such blocks first,
>> instead of trying random blocks until one offlining request succeeds.
>=20
> I am sorry for being dense here but I still do not understand why s390

It's good that we talk about it :) It's hard to reconstruct actual use
cases from tools and some documentation only ...

Side note (just FYI): One difference on s390x compared to other
architectures (AFAIKS) is that once memory is offline, you might not be
allowed (by the hypervisor) to online it again - because it was
effectively unplugged. Such memory is not removed via remove_memory(),
it's simply kept offline.


> and the way how it does the hotremove matters here. Afterall there are
> no arch specific operations done until the memory is offlined. Also
> randomly checking memory blocks and then hoping that the offline will
> succeed is not way much different from just trying the offline the
> block. Both have to crawl through the pfn range and bail out on the
> unmovable memory.

I think in general we have to approaches to memory unplugging.

1. Know explicitly what you want to unplug (e.g., a DIMM spanning
multiple memory blocks).

2. Find random memory blocks you can offline/unplug.


For 1, I think we both agree that we don't need this. Just try to
offline and you know if it worked.

Now of course, for 2 you can try random blocks until you succeeded. From
a sysadmin point of view that's very inefficient. From a powerpc-utils
point of view, that's inefficient.

I learned just now, "chmem"[1] has a mode where you can specify a "size"
and not only a range. So a sysadmin can still control onlining/offlining
for this use case with a few commands. In other tools (e.g.,
powerpc-utils), well, you have to try to offline random memory blocks
(just like chmem does).


AFAIK, once we turn /sys/.../removable useless, I can see the following
changes:

1. Trying to offline a certain amount of memory blocks gets slower/takes
longer/is less efficient. Might be tolerable. The tools seem to keep
working.

2. You can no longer make a rough estimate how much memory you could
offline - before you actually try to offline it. I can only imagine that
something like this makes sense in a virtual environment (e.g., IBM z)
to balance memory between virtual machines, but I am not aware of a real
user of something like that.


So what I can do is

a) Come up with a patch that rips that stuff out (well I have that
already lying around)

b) Describe the existing users + changes we will see

c) CC relevant people I identify (lsmem/chmem/powerpc-utils/etc.) on the
patch to see if we are missing other use cases/users/implications.

Sounds like a plan?


[1]
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/tree/sys-u=
tils/chmem.c

--=20
Thanks,

David / dhildenb

