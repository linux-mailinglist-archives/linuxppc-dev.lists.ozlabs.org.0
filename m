Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CBA937A2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 17:47:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XFSRKniQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XFSRKniQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQYwK12kWz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 01:47:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XFSRKniQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XFSRKniQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQYvd1Yy1z3bsR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 01:47:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721404025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qdg+XFgn2gowb/OLr2+FtH9LRvXkqxb4OmH6/xkelt8=;
	b=XFSRKniQq5RKbZ2RfTuWSIdi7hyg+y/HwAljSZUHsdegSCzUYFUWo4YbwIqAmH5hnjjSo/
	EVE5Ybxp32YVNKc8RwNAn6FH+JBCm8GmJEQwP//Nk+QlKyDUahX6dcjEuRkGT63PCsJd1G
	HSSkMGjFuCIbq3W5z/rlqHmJG4slX2E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721404025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qdg+XFgn2gowb/OLr2+FtH9LRvXkqxb4OmH6/xkelt8=;
	b=XFSRKniQq5RKbZ2RfTuWSIdi7hyg+y/HwAljSZUHsdegSCzUYFUWo4YbwIqAmH5hnjjSo/
	EVE5Ybxp32YVNKc8RwNAn6FH+JBCm8GmJEQwP//Nk+QlKyDUahX6dcjEuRkGT63PCsJd1G
	HSSkMGjFuCIbq3W5z/rlqHmJG4slX2E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-oJTAfZnCNfK1PrCOGJBtnA-1; Fri, 19 Jul 2024 11:47:03 -0400
X-MC-Unique: oJTAfZnCNfK1PrCOGJBtnA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4266945770eso12468955e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 08:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721404022; x=1722008822;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qdg+XFgn2gowb/OLr2+FtH9LRvXkqxb4OmH6/xkelt8=;
        b=fiROgAKdnG/L6rZNrJS/Pw/7U7kArM5w+Z83wmN7y6iYgHN5hCVDjzM0VT2dNOw0Fh
         CxL7gR2X2FsbjvzSI9xFXCBAsQTyM6k6oQ2S6vokyqOmNP9EAo+A5BWzIOe52okDwYD8
         tyuJ7pKS99XLbJNPEaogWEDQBv0Lmphg8IgFYWrHuzSEUVAEl7XNtmNgwg8DJ4hz4Lrt
         b4Z3ePtm8H3CmFdEVfufUG/qmWfH4Ez4GoHRzwH77Dwvd64qSZ+g37y9Ll8yWVWzs8Y5
         94UTrKPn/FxbcDcuLr/TpJJW1KZQv6n/0a8ea3TQ7QMpY3YYM33LyA0HQhmXg9znMgBR
         zOEw==
X-Forwarded-Encrypted: i=1; AJvYcCWU7pgLGmCnNtawMEuAI6fTQq5TqyDPLQW9IW33bZrR4iKNTrVzqiuDVsYg8f+gspK/XzOeg+Adqc12PLzjr02NdYl5IHqrlBw0iKbWww==
X-Gm-Message-State: AOJu0YwaGnjF0oZSQ28jFtmU2J+d4hLEFQsQQrf+YFg3whaihSkKv+VE
	ekIs+yAkBRwq4FptFGQHJM8YwiDM0k307HIA1gCmPXom24UaFNSeXkO6+hR4WBfHbHk7yn9Y9Gh
	2qAE082ptpcNjobeATK9kME9hpXf3evQqD8Fca7Ij5+N2bITl8aZqb42bQyHWi/o=
X-Received: by 2002:a05:600c:4f42:b0:425:649b:60e8 with SMTP id 5b1f17b1804b1-427c2ce4ec2mr59180945e9.18.1721404021836;
        Fri, 19 Jul 2024 08:47:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkk+7fVut5qcTcGBeestcx2OOs9WsAxgbfDNI+xjLXD9oXIYfigE2OZ+7D6CPvbkI1WcMoBQ==
X-Received: by 2002:a05:600c:4f42:b0:425:649b:60e8 with SMTP id 5b1f17b1804b1-427c2ce4ec2mr59180725e9.18.1721404021321;
        Fri, 19 Jul 2024 08:47:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:1000:c4af:a24f:b8ba:8bbc? (p200300cbc7051000c4afa24fb8ba8bbc.dip0.t-ipconnect.de. [2003:cb:c705:1000:c4af:a24f:b8ba:8bbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d692998csm28786805e9.32.2024.07.19.08.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 08:47:00 -0700 (PDT)
Message-ID: <c4180f8b-a41f-4dd7-9a2b-f4ec0efa0dcf@redhat.com>
Date: Fri, 19 Jul 2024 17:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
To: Mike Rapoport <rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-6-rppt@kernel.org>
 <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
 <Zpi-HAb7EBxrZBtK@kernel.org>
 <96850252-a49f-4d78-a94b-a9a25e3f2bd5@redhat.com>
 <ZpqHniqaMxj-iDfw@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZpqHniqaMxj-iDfw@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19.07.24 17:34, Mike Rapoport wrote:
> On Fri, Jul 19, 2024 at 05:07:35PM +0200, David Hildenbrand wrote:
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
> 
> The generic alloc_node_data() does not set the node online:
> 
> +/* Allocate NODE_DATA for a node on the local memory */
> +void __init alloc_node_data(int nid)
> +{
> +	const size_t nd_size = roundup(sizeof(pg_data_t), PAGE_SIZE);
> +	u64 nd_pa;
> +	void *nd;
> +	int tnid;
> +
> +	/* Allocate node data.  Try node-local memory and then any node. */
> +	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
> +	if (!nd_pa)
> +		panic("Cannot allocate %zu bytes for node %d data\n",
> +		      nd_size, nid);
> +	nd = __va(nd_pa);
> +
> +	/* report and initialize */
> +	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> +		nd_pa, nd_pa + nd_size - 1);
> +	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
> +	if (tnid != nid)
> +		pr_info("    NODE_DATA(%d) on node %d\n", nid, tnid);
> +
> +	node_data[nid] = nd;
> +	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
> +}
> 
> I might have missed some architecture except x86 that calls
> node_set_online() in its alloc_node_data(), but the intention was to leave
> that call outside the alloc and explicitly add it after the call to
> alloc_node_data() if needed like in x86.

I'm stupid, I didn't realize it is still only called from x86 :(

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

