Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12C937A5C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 18:08:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M7thOqBV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M7thOqBV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQZN26kYKz3d24
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 02:08:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M7thOqBV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M7thOqBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQZMM3ND3z3c8D
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 02:07:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721405260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pZli1ZWS65IADc0MuGEmad+VYY75q1/RVf/I8f/0nkc=;
	b=M7thOqBV4ehCCoDYfgXkEfT30su0AIYDjFemxKjbDrpfHPm3l2jx0LlhGF81w+CKZOjri3
	lpri9OJYFRlWl87ERan3MIUdvFog9iMpsMx/nLmFYV9ZMRh65P4Axp05+ZwwTXs2gf0c/L
	Qwsd4oDdqPnlAkvt2flMHFiOwYyCl3I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721405260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pZli1ZWS65IADc0MuGEmad+VYY75q1/RVf/I8f/0nkc=;
	b=M7thOqBV4ehCCoDYfgXkEfT30su0AIYDjFemxKjbDrpfHPm3l2jx0LlhGF81w+CKZOjri3
	lpri9OJYFRlWl87ERan3MIUdvFog9iMpsMx/nLmFYV9ZMRh65P4Axp05+ZwwTXs2gf0c/L
	Qwsd4oDdqPnlAkvt2flMHFiOwYyCl3I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-kpbgtQRFPGqqQ7PtrsuY4w-1; Fri, 19 Jul 2024 12:07:37 -0400
X-MC-Unique: kpbgtQRFPGqqQ7PtrsuY4w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3687a1a6846so607862f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 09:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405256; x=1722010056;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pZli1ZWS65IADc0MuGEmad+VYY75q1/RVf/I8f/0nkc=;
        b=gfqdeUdABAtiuC2PEY+HIMdtnV8rG1Fc2k1jCHOVitlWCNRxAazkVDbn8QO7SpAafv
         DqAm7fkkjtXargS/4smrSTaboUYg9J+Gczq4wiQlyhp4s5Y1U+BPAhJ3zmbiPI1vWWnW
         mxWUsEwNnBJKB+uEXihVd8y63JIhuT3XEbJOPfURr8DMXCLwT0/yq4r/3YGHlc3XD9dL
         2GuHEPiGnZm4ZeJ7pwVFzCWkFlJBdT8XReybkSbPTxuR24WClessYyyr/XG0W/B3nvte
         ddX1yiJgc6gzB0SQC2FHujVh7t1GZibnaTMezdUWFjeRBWia9PZHt0iTgjaNM51rkAAW
         gM0A==
X-Forwarded-Encrypted: i=1; AJvYcCWWDfoowk7viP35KVBN4tH8Rirdj/Po315oOf7DsGkC3JQcpCd5zVaP4rzcddCvIMJVnxsWHc/ATg5FcAV2V/Jea062VXp5G7xVF03akg==
X-Gm-Message-State: AOJu0Yz9td2nBMC+D3PTEk9OhRwokKJ8ULAutYAQkK8z/CSb0QYFQpzg
	GdFjyLGXRJ95flqc8y3Ci6lCmYWEZWUKNSk3HggeFlEUJYrWJkSiN1l2+9DLS/IPZe2IGoPKqrK
	BMk5+h8DPXIJ7BzKxNvbWnV5CxCuUN+HJ1PeodfJUHHaeYAEpZD2aM2rNikOqgJE=
X-Received: by 2002:a05:6000:1f8a:b0:368:3f6a:1de8 with SMTP id ffacd0b85a97d-3683f6a1fd3mr6197200f8f.11.1721405256410;
        Fri, 19 Jul 2024 09:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7LRUztVUaQBN7s/nxE6MGqv+dWgvzusQE14jyzDq7GxIcTp7Je/ha3vehB6s5hU+vze0vHQ==
X-Received: by 2002:a05:6000:1f8a:b0:368:3f6a:1de8 with SMTP id ffacd0b85a97d-3683f6a1fd3mr6197181f8f.11.1721405255968;
        Fri, 19 Jul 2024 09:07:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:1000:c4af:a24f:b8ba:8bbc? (p200300cbc7051000c4afa24fb8ba8bbc.dip0.t-ipconnect.de. [2003:cb:c705:1000:c4af:a24f:b8ba:8bbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868bc2csm1983265f8f.47.2024.07.19.09.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 09:07:35 -0700 (PDT)
Message-ID: <892d0dab-f9db-481c-a3f6-ac3e2bda9b6e@redhat.com>
Date: Fri, 19 Jul 2024 18:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-6-rppt@kernel.org>
 <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
 <Zpi-HAb7EBxrZBtK@kernel.org>
 <96850252-a49f-4d78-a94b-a9a25e3f2bd5@redhat.com>
 <20240719165143.0000002e@Huawei.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240719165143.0000002e@Huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19.07.24 17:51, Jonathan Cameron wrote:
> On Fri, 19 Jul 2024 17:07:35 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
>>>>> -	 * Allocate node data.  Try node-local memory and then any node.
>>>>> -	 * Never allocate in DMA zone.
>>>>> -	 */
>>>>> -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
>>>>> -	if (!nd_pa) {
>>>>> -		pr_err("Cannot find %zu bytes in any node (initial node: %d)\n",
>>>>> -		       nd_size, nid);
>>>>> -		return;
>>>>> -	}
>>>>> -	nd = __va(nd_pa);
>>>>> -
>>>>> -	/* report and initialize */
>>>>> -	printk(KERN_INFO "NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
>>>>> -	       nd_pa, nd_pa + nd_size - 1);
>>>>> -	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
>>>>> -	if (tnid != nid)
>>>>> -		printk(KERN_INFO "    NODE_DATA(%d) on node %d\n", nid, tnid);
>>>>> -
>>>>> -	node_data[nid] = nd;
>>>>> -	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
>>>>> -
>>>>> -	node_set_online(nid);
>>>>> -}
>>>>> -
>>>>>     /**
>>>>>      * numa_cleanup_meminfo - Cleanup a numa_meminfo
>>>>>      * @mi: numa_meminfo to clean up
>>>>> @@ -571,6 +538,7 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
>>>>>     			continue;
>>>>>     		alloc_node_data(nid);
>>>>> +		node_set_online(nid);
>>>>>     	}
>>>>
>>>> I can spot that we only remove a single node_set_online() call from x86.
>>>>
>>>> What about all the other architectures? Will there be any change in behavior
>>>> for them? Or do we simply set the nodes online later once more?
>>>
>>> On x86 node_set_online() was a part of alloc_node_data() and I moved it
>>> outside so it's called right after alloc_node_data(). On other
>>> architectures the allocation didn't include that call, so there should be
>>> no difference there.
>>
>> But won't their arch code try setting the nodes online at a later stage?
>>
>> And I think, some architectures only set nodes online conditionally
>> (see most other node_set_online() calls).
>>
>> Sorry if I'm confused here, but with now unconditional node_set_online(), won't
>> we change the behavior of other architectures?
> This is moving x86 code to x86 code, not a generic location
> so how would that affect anyone else? Their onlining should be same as
> before.

Yes, see my reply to Mike.

> 
> The node onlining difference are a pain (I recall that fun from adding
> generic initiators) as different ordering on x86 and arm64 at least.

That's part of the reason I was confused, because I remember some nasty 
inconsistency.

-- 
Cheers,

David / dhildenb

