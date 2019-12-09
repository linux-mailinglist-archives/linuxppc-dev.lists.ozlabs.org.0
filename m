Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0831177D3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 21:54:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WwRh4scpzDqP8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 07:54:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="DDJ5mn2n"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WwPq4djBzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 07:53:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575924778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJBASH3qoTGdWSdB+LrXLR7p2EO5j8Zhq+6mo6vrhH0=;
 b=DDJ5mn2nvKxk9svUPJnjqygA78j4uGUaJruRrP4K+6vgSDlzORL45QTwePTXG3EpCmkLfX
 dFD2f91LOJaflw+DO8E/0d2KqgEb86bjZNLyh0iXLB/mnB1dkyC+OGh359FKzEOyH3pjxu
 9bLnot6PfqQt6yvgNpYRD01Q1dDtFgc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-C2UUL6G2OgS5YJIno_CaDw-1; Mon, 09 Dec 2019 15:52:57 -0500
Received: by mail-wm1-f72.google.com with SMTP id o135so147704wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 12:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=NGEL1NSYmJ/OoSlxzf6M70RXjEhwqgGKnWSMvOS+jtM=;
 b=aAQ9Kporyy1pLonpTon775oVhQhoHsyok3eT/LcFeZHJ5xGpd4OZRmeWd6oRfjTuhH
 m/mRIu9EmqhA0uOr/ybcAPaxsH3jy211ssESB8PU72I+5p/jzVemLmCFPaAYs+EgSNyK
 U1nrkDyOZ4DDJQFc4BBAjMGpJHktLeBVhxxJYjB/hWcsTyCLElokUYyk4C89yJjU20xF
 xcXZHNs3rU8VSetwWASQcqPj5nO2aJ8oYIU9QAyk2/FQm8eUWC7BCBR6FKxTlt3/uJWC
 UQvSHoPnG8HjfyND+YNb1nubaDL3CGwOc+/ozG6PHQ52dS0e6hdnmcORsSNou+7X3m75
 XdCQ==
X-Gm-Message-State: APjAAAUe65vl33AXvBn8PYKLKv4JgE7AAH/WIcTErZnFNiKs53CtBQbR
 unEyt9Q2c9+SVzSx6aYhdtSj3uFi2KFr9JlF1lJmI7QCaMq7iH57wKpyWtVrW4TIn1/407BwP8n
 5fFmxH7ZVWKkaaavTVVjXfLSGMw==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr1076746wmf.136.1575924775716; 
 Mon, 09 Dec 2019 12:52:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZrY86SAs9HX0pRhK9obPbaChosiTAnQWyc7+/5zfbpOwHVpMjKo7v99fnszsIjFo82bF44w==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr1076719wmf.136.1575924775493; 
 Mon, 09 Dec 2019 12:52:55 -0800 (PST)
Received: from [192.168.3.122] (p5B0C63FA.dip0.t-ipconnect.de. [91.12.99.250])
 by smtp.gmail.com with ESMTPSA id
 d8sm726691wre.13.2019.12.09.12.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 12:52:54 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 5/6] mm,
 memory_hotplug: Provide argument for the pgprot_t in arch_add_memory()
Date: Mon, 9 Dec 2019 21:52:53 +0100
Message-Id: <F98E5D42-BD24-4A01-95EF-44329DDF8190@redhat.com>
References: <CAPcyv4hpXCZxV5p7WaeGgE7ceujBBa5NOz9Z8fepDHOt6zHO2A@mail.gmail.com>
In-Reply-To: <CAPcyv4hpXCZxV5p7WaeGgE7ceujBBa5NOz9Z8fepDHOt6zHO2A@mail.gmail.com>
To: Dan Williams <dan.j.williams@intel.com>
X-Mailer: iPhone Mail (17A878)
X-MC-Unique: C2UUL6G2OgS5YJIno_CaDw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh <linux-sh@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> Am 09.12.2019 um 21:43 schrieb Dan Williams <dan.j.williams@intel.com>:
>=20
> =EF=BB=BFOn Mon, Dec 9, 2019 at 12:24 PM Logan Gunthorpe <logang@deltatee=
.com> wrote:
>>=20
>>=20
>>=20
>>> On 2019-12-09 12:23 p.m., David Hildenbrand wrote:
>>> On 09.12.19 20:13, Logan Gunthorpe wrote:
>>>> devm_memremap_pages() is currently used by the PCI P2PDMA code to crea=
te
>>>> struct page mappings for IO memory. At present, these mappings are cre=
ated
>>>> with PAGE_KERNEL which implies setting the PAT bits to be WB. However,=
 on
>>>> x86, an mtrr register will typically override this and force the cache
>>>> type to be UC-. In the case firmware doesn't set this register it is
>>>> effectively WB and will typically result in a machine check exception
>>>> when it's accessed.
>>>>=20
>>>> Other arches are not currently likely to function correctly seeing the=
y
>>>> don't have any MTRR registers to fall back on.
>>>>=20
>>>> To solve this, add an argument to arch_add_memory() to explicitly
>>>> set the pgprot value to a specific value.
>>>>=20
>>>> Of the arches that support MEMORY_HOTPLUG: x86_64, s390 and arm64 is a
>>>> simple change to pass the pgprot_t down to their respective functions
>>>> which set up the page tables. For x86_32, set the page tables explicit=
ly
>>>> using _set_memory_prot() (seeing they are already mapped). For sh, rej=
ect
>>>> anything but PAGE_KERNEL settings -- this should be fine, for now, see=
ing
>>>> sh doesn't support ZONE_DEVICE anyway.
>>>>=20
>>>> Cc: Dan Williams <dan.j.williams@intel.com>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Michal Hocko <mhocko@suse.com>
>>>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>>>> ---
>>>> arch/arm64/mm/mmu.c            | 4 ++--
>>>> arch/ia64/mm/init.c            | 5 ++++-
>>>> arch/powerpc/mm/mem.c          | 4 ++--
>>>> arch/s390/mm/init.c            | 4 ++--
>>>> arch/sh/mm/init.c              | 5 ++++-
>>>> arch/x86/mm/init_32.c          | 7 ++++++-
>>>> arch/x86/mm/init_64.c          | 4 ++--
>>>> include/linux/memory_hotplug.h | 2 +-
>>>> mm/memory_hotplug.c            | 2 +-
>>>> mm/memremap.c                  | 2 +-
>>>> 10 files changed, 25 insertions(+), 14 deletions(-)
>>>>=20
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index 60c929f3683b..48b65272df15 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -1050,7 +1050,7 @@ int p4d_free_pud_page(p4d_t *p4d, unsigned long =
addr)
>>>> }
>>>>=20
>>>> #ifdef CONFIG_MEMORY_HOTPLUG
>>>> -int arch_add_memory(int nid, u64 start, u64 size,
>>>> +int arch_add_memory(int nid, u64 start, u64 size, pgprot_t prot,
>>>>                     struct mhp_restrictions *restrictions)
>>>=20
>>> Can we fiddle that into "struct mhp_restrictions" instead?
>>=20
>> Yes, if that's what people want, it's pretty trivial to do. I chose not
>> to do it that way because it doesn't get passed down to add_pages() and
>> it's not really a "restriction". If I don't hear any objections, I will
>> do that for v2.
>=20
> +1 to storing this information alongside the altmap in that structure.
> However, I agree struct mhp_restrictions, with the MHP_MEMBLOCK_API
> flag now gone, has lost all of its "restrictions". How about dropping
> the 'flags' property and renaming the struct to 'struct
> mhp_modifiers'?
>=20

I=E2=80=98d prefer that over an arch_add_memory_protected() as suggested by=
 Michal. But if we can change it after adding the memory (as also suggested=
 by Michal), that would also be nice.

Cheers!

