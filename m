Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA0975FB08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 17:42:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YzpBA/sr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OGVLc8+x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8ktW5VD4z30QJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 01:42:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YzpBA/sr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OGVLc8+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8ksb6b6rz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 01:41:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690213279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LavDxiiQvJQ9tdstFAk8l+qf/sEnxlhRWrdlKUhoAGA=;
	b=YzpBA/srV1LL4R/vtPqYjxu9AoX/2qMuq5VlC+Atu3sa2NSwD9S+sEfHZk614Cuf9NCNWx
	gHEdtGh2goS+FfWd4NtK8LTFIzIwZUsG15GWuTJ2eqe52jKgW44wgPORJFxYzW7tcbVzlO
	BIT0AGWLHjR89LtfhG0KBv53XgNQ/Hk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690213280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LavDxiiQvJQ9tdstFAk8l+qf/sEnxlhRWrdlKUhoAGA=;
	b=OGVLc8+xw9DBgXzUo986IOVeXlL+PxuGYGd8qj7+5+P7uu+ImxO+lxo3yKCdoiY+9oD6+Q
	2tfiAhX5+SpLS+AYrv4Y0zrlmNh/Qqfg2If64dbh7Ssv2yKATpa4I9su0ZSvSQ1BRSMuHe
	seish4JX0K4HeLQ//pAeo5v6d+yTZbY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-rVoE8F5yMVKbiSfrL8jQwQ-1; Mon, 24 Jul 2023 11:41:18 -0400
X-MC-Unique: rVoE8F5yMVKbiSfrL8jQwQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-315a03cae87so2659919f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 08:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690213276; x=1690818076;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LavDxiiQvJQ9tdstFAk8l+qf/sEnxlhRWrdlKUhoAGA=;
        b=TMJuhvSzZSGpjHCTzjvIKHs5d3xisDrhXFMo9/5JHDZR2xbe0QgVmFr+D+k7NmZfDC
         yv8DndqOnEc0GIWlYawU8a23SJS6+TSfaeTvczOlmLvrGnF3wPlKmp8rwi0nDA68w1G2
         m8ka7E9jtYhaxw8lTg/sNkevydQ9x8l5PTrGneYwDETvZW3KZHeaM2nqeJ66E+5xX8Xe
         ankgzMApbRSnJinm4TvaiINyxW6Al3K/V1W0GTTY6w5bT80h7Pk8v7U9C2lZL/Fp7LqV
         bfBUgcauPFe5N2uvbs7zB0JZErqQzR/7PuJE+YKsYuAimByndJlAWCx5E91LCNERxMSv
         hvyg==
X-Gm-Message-State: ABy/qLY40L6CDB91b+gQCzw7ByKe10G9O06LBfTqUbTbk+UZ5dppmI1s
	JyiVefUWtkvLna+D8CAxhmKO7pZom40SDGxAIqWJYYC4TQAYnxZbMnphaMa8g0ibDxjKOjHV1pY
	IdBaIyrdphv+1yCFHybqo13eFnQ==
X-Received: by 2002:a5d:424a:0:b0:317:5c36:4539 with SMTP id s10-20020a5d424a000000b003175c364539mr3129810wrr.25.1690213276741;
        Mon, 24 Jul 2023 08:41:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHk+qyFcEVWJ5hfaknxo7d3c0qjdJTrzuYVUjRP+uNCc3JwYeT7v6d8IgFJVisFkqwng2ydOQ==
X-Received: by 2002:a5d:424a:0:b0:317:5c36:4539 with SMTP id s10-20020a5d424a000000b003175c364539mr3129786wrr.25.1690213276288;
        Mon, 24 Jul 2023 08:41:16 -0700 (PDT)
Received: from [192.168.3.108] (p4ff23474.dip0.t-ipconnect.de. [79.242.52.116])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm13354006wrn.83.2023.07.24.08.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 08:41:15 -0700 (PDT)
Message-ID: <29eb32f0-fb0b-c8f9-ba23-8295147808ea@redhat.com>
Date: Mon, 24 Jul 2023 17:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-5-aneesh.kumar@linux.ibm.com>
 <f9597236-866d-17cd-d549-938ea80eacbe@redhat.com>
 <bbd774bb-10b9-30b1-c82b-27d01d304f8d@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 4/6] mm/hotplug: Allow pageblock alignment via altmap
 reservation
In-Reply-To: <bbd774bb-10b9-30b1-c82b-27d01d304f8d@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.07.23 17:16, Aneesh Kumar K V wrote:

>>
>> /*
>>   * In "forced" memmap_on_memory mode, we always align the vmemmap size up to cover
>>   * full pageblocks. That way, we can add memory even if the vmemmap size is not properly
>>   * aligned, however, we might waste memory.
>>   */
> 
> I am finding that confusing. We do want things to be pageblock_nr_pages aligned both ways.
> With MEMMAP_ON_MEMORY_FORCE, we do that by allocating more space for memmap and
> in the default case we do that by making sure only memory blocks of specific size supporting
> that alignment can use MEMMAP_ON_MEMORY feature.

See the usage inm hp_supports_memmap_on_memory(), I guess that makes 
sense then.

But if you have any ideas on how to clarify that (terminology), I'm all 
ears!

[...]

>>> +    return arch_supports_memmap_on_memory(size);
>>>    }
>>>      /*
>>> @@ -1311,7 +1391,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>>    {
>>>        struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>>>        enum memblock_flags memblock_flags = MEMBLOCK_NONE;
>>> -    struct vmem_altmap mhp_altmap = {};
>>> +    struct vmem_altmap mhp_altmap = {
>>> +        .base_pfn =  PHYS_PFN(res->start),
>>> +        .end_pfn  =  PHYS_PFN(res->end),
>>> +        .reserve  = memory_block_align_base(resource_size(res)),
>>
>> Can you remind me why we have to set reserve here at all?
>>
>> IOW, can't we simply set
>>
>> .free = memory_block_memmap_on_memory_size();
>>
>> end then pass
>>
>> mhp_altmap.alloc + mhp_altmap.free
>>
>> to create_memory_block_devices() instead?
>>
> 
> But with the dax usage of altmap, altmap->reserve is what we use to reserve things to get
> the required alignment. One difference is where we allocate the struct page at. For this specific
> case it should not matter.
> 
> static unsigned long __meminit vmem_altmap_next_pfn(struct vmem_altmap *altmap)
> {
> 	return altmap->base_pfn + altmap->reserve + altmap->alloc
> 		+ altmap->align;
> }
> 
> And other is where we online a memory block
> 
> We find the start pfn using mem->altmap->alloc + mem->altmap->reserve;
> 
> Considering altmap->reserve is what dax pfn_dev use, is there a reason you want to use altmap->free for this?

"Reserve" is all about "reserving that much memory for driver usage".

We don't care about that. We simply want vmemmap allocations coming from 
the pageblock(s) we set aside. Where exactly, we don't care.

> I find it confusing to update free when we haven't allocated any altmap blocks yet.

"
@reserve: pages mapped, but reserved for driver use (relative to @base)"
@free: free pages set aside in the mapping for memmap storage
@alloc: track pages consumed, private to vmemmap_populate()
"

To me, that implies that we can ignore "reserve". We set @free to the 
aligned value and let the vmemmap get allocated from anything in there.

free + alloc should always sum up to our set-aside pageblock(s), no?


-- 
Cheers,

David / dhildenb

