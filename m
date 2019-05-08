Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD92D172BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 09:40:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zT0h4wb0zDqJ3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 17:40:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zSzB5RQDzDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 17:39:18 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7235C5F73A;
 Wed,  8 May 2019 07:39:15 +0000 (UTC)
Received: from [10.36.117.63] (ovpn-117-63.ams2.redhat.com [10.36.117.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 930506149F;
 Wed,  8 May 2019 07:39:11 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] mm/memory_hotplug: Drop MHP_MEMBLOCK_API
To: Dan Williams <dan.j.williams@intel.com>
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-6-david@redhat.com>
 <CAPcyv4ge1pSOopfHof4USn=7Skc-UV4Xhd_s=h+M9VXSp_p1XQ@mail.gmail.com>
 <d83fec16-ceff-2f6f-72e1-48996187d5ba@redhat.com>
 <CAPcyv4iRQteuT9yESvbUyhp3KVVgTXDiGAo+TwPCM_4f0CzBgg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <edd762a1-c012-fe05-a72e-2505cd98188a@redhat.com>
Date: Wed, 8 May 2019 09:39:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iRQteuT9yESvbUyhp3KVVgTXDiGAo+TwPCM_4f0CzBgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 08 May 2019 07:39:16 +0000 (UTC)
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
Cc: Oscar Salvador <osalvador@suse.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux-sh <linux-sh@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>, Linux MM <linux-mm@kvack.org>,
 Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07.05.19 23:25, Dan Williams wrote:
> On Tue, May 7, 2019 at 2:24 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 07.05.19 23:19, Dan Williams wrote:
>>> On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> No longer needed, the callers of arch_add_memory() can handle this
>>>> manually.
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Michal Hocko <mhocko@suse.com>
>>>> Cc: Oscar Salvador <osalvador@suse.com>
>>>> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>>>> Cc: Wei Yang <richard.weiyang@gmail.com>
>>>> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>>>> Cc: Qian Cai <cai@lca.pw>
>>>> Cc: Arun KS <arunks@codeaurora.org>
>>>> Cc: Mathieu Malaterre <malat@debian.org>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>  include/linux/memory_hotplug.h | 8 --------
>>>>  mm/memory_hotplug.c            | 9 +++------
>>>>  2 files changed, 3 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>>>> index 2d4de313926d..2f1f87e13baa 100644
>>>> --- a/include/linux/memory_hotplug.h
>>>> +++ b/include/linux/memory_hotplug.h
>>>> @@ -128,14 +128,6 @@ extern void arch_remove_memory(int nid, u64 start, u64 size,
>>>>  extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
>>>>                            unsigned long nr_pages, struct vmem_altmap *altmap);
>>>>
>>>> -/*
>>>> - * Do we want sysfs memblock files created. This will allow userspace to online
>>>> - * and offline memory explicitly. Lack of this bit means that the caller has to
>>>> - * call move_pfn_range_to_zone to finish the initialization.
>>>> - */
>>>> -
>>>> -#define MHP_MEMBLOCK_API               (1<<0)
>>>> -
>>>>  /* reasonably generic interface to expand the physical pages */
>>>>  extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>>>>                        struct mhp_restrictions *restrictions);
>>>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>>>> index e1637c8a0723..107f72952347 100644
>>>> --- a/mm/memory_hotplug.c
>>>> +++ b/mm/memory_hotplug.c
>>>> @@ -250,7 +250,7 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
>>>>  #endif /* CONFIG_HAVE_BOOTMEM_INFO_NODE */
>>>>
>>>>  static int __meminit __add_section(int nid, unsigned long phys_start_pfn,
>>>> -               struct vmem_altmap *altmap, bool want_memblock)
>>>> +                                  struct vmem_altmap *altmap)
>>>>  {
>>>>         int ret;
>>>>
>>>> @@ -293,8 +293,7 @@ int __ref __add_pages(int nid, unsigned long phys_start_pfn,
>>>>         }
>>>>
>>>>         for (i = start_sec; i <= end_sec; i++) {
>>>> -               err = __add_section(nid, section_nr_to_pfn(i), altmap,
>>>> -                               restrictions->flags & MHP_MEMBLOCK_API);
>>>> +               err = __add_section(nid, section_nr_to_pfn(i), altmap);
>>>>
>>>>                 /*
>>>>                  * EEXIST is finally dealt with by ioresource collision
>>>> @@ -1066,9 +1065,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>>>>   */
>>>>  int __ref add_memory_resource(int nid, struct resource *res)
>>>>  {
>>>> -       struct mhp_restrictions restrictions = {
>>>> -               .flags = MHP_MEMBLOCK_API,
>>>> -       };
>>>> +       struct mhp_restrictions restrictions = {};
>>>
>>> With mhp_restrictions.flags no longer needed, can we drop
>>> mhp_restrictions and just go back to a plain @altmap argument?
>>>
>>
>> Oscar wants to use it to configure from where to allocate vmemmaps. That
>> was the original driver behind it.
>>
> 
> Ah, ok, makes sense.
> 

However I haven't really thought it through yet, smalles like that could
as well just be handled by the caller of
arch_add_memory()/arch_remove_memory() eventually, passing it via
something like the altmap parameter.

Let's leave it in place for now, we can talk about that once we have new
patches from Oscar.

-- 

Thanks,

David / dhildenb
