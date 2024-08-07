Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFE094ACC6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 17:24:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rlhb40in;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rlhb40in;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfDVq3SMlz3dHR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 01:24:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rlhb40in;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rlhb40in;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfDV72R83z2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 01:23:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723044234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aAgxFInvvWwKV0z4+0KCeJqRg0kMvcuUocrtSkGNRkQ=;
	b=Rlhb40inEG7c570BG4Fa18tUgMoU5ygC9njcVaUKYEQVK2cCHDQj5I6IjAQFJgoM+7liPP
	WekqC9X1j1aUEDuogL+oUvGPyHlAUK49XcAEagSH7H/L+buVneBaDmMWjTDRi9iWHVA9JC
	R5lxovBMaQ7OZSf6GDddhXXiitSWlng=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723044234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aAgxFInvvWwKV0z4+0KCeJqRg0kMvcuUocrtSkGNRkQ=;
	b=Rlhb40inEG7c570BG4Fa18tUgMoU5ygC9njcVaUKYEQVK2cCHDQj5I6IjAQFJgoM+7liPP
	WekqC9X1j1aUEDuogL+oUvGPyHlAUK49XcAEagSH7H/L+buVneBaDmMWjTDRi9iWHVA9JC
	R5lxovBMaQ7OZSf6GDddhXXiitSWlng=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-njt5YcVEMM26qeUxLVrimw-1; Wed, 07 Aug 2024 11:23:53 -0400
X-MC-Unique: njt5YcVEMM26qeUxLVrimw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-428ea5b1479so34785e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 08:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723044232; x=1723649032;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aAgxFInvvWwKV0z4+0KCeJqRg0kMvcuUocrtSkGNRkQ=;
        b=V49gSj6Cu8RxI0o7iIEuWDKqjxwWdMgwfekoWix61orbcQF69GDptviUmnEeGeEXHG
         YVnJFhOKoL+d0GmPbVC9ukKufC5IKw4F17XEQyNWctm+mxm2Mtexb1Y+zLIa/xFscLdd
         xSq3cMgq8me9AzPFq1XjEyYpwCIpJcbsDLSxL9uSK+HOjVw2x5yAEC8LxidC2yAP4Fbx
         YI0sxisQTkvUNMkHMa3uzYB9z96+HsAvR6iHgUCDlrfJviaPPSt1nYcN7hiVFjyd7xRO
         Kdld87xI1E0zb6z566+H0ngQiQ8j6HrUKKZyRSfIoSjro1Xta0/oFUEVwaZLfNrlKhYm
         trbg==
X-Forwarded-Encrypted: i=1; AJvYcCXxoWkq+sUFfiEIATXBQJxOP0QzbFYwwLlXPWPjsu16eRXRH8ta4wlLyAcGMcDvvNuZwv7np3F37xuZOpSbdlT8zgpOQevJFKQTpCfUbw==
X-Gm-Message-State: AOJu0YxfrfOtZGUJF0eMNSGF2vXeu/EG94+ZSUpC5eBig2VFQVWWg9IO
	+UXKs5ltg6XeX5YiIPx1gQpmNL8O/giicN4nXjBFKblPQX3aY7cC5gwFYWyHwtq5V+k+vbGlxnT
	L7CD4LA20J/2chfhBjgsHXQtyuW7N0QFpfrJU+VkUZq3gxwqN3ZwFLaQ+zaKDB0I=
X-Received: by 2002:a05:600c:4fc9:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-428e6b08fc5mr123411095e9.13.1723044231721;
        Wed, 07 Aug 2024 08:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa1u7xsFpjJO/UW4dKCxZ81wLwqoTylnMlnIcAzev3Z83n1ZIinArOgcYN+yAGW9Rj8jfltw==
X-Received: by 2002:a05:600c:4fc9:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-428e6b08fc5mr123410535e9.13.1723044231149;
        Wed, 07 Aug 2024 08:23:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1a00:df86:93fe:6505:d096? (p200300cbc7081a00df8693fe6505d096.dip0.t-ipconnect.de. [2003:cb:c708:1a00:df86:93fe:6505:d096])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905971ad7sm35137405e9.17.2024.08.07.08.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 08:23:50 -0700 (PDT)
Message-ID: <936f8adf-a8a5-45eb-b5a3-297773918f7c@redhat.com>
Date: Wed, 7 Aug 2024 17:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: keep nid around during hot-remove
To: Pasha Tatashin <pasha.tatashin@soleen.com>
References: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
 <20240806221454.1971755-2-pasha.tatashin@soleen.com>
 <345ba221-e094-47e8-9481-562faf4acd85@redhat.com>
 <e780e9af-e23d-44ff-ae0f-a8f4ee098a1c@redhat.com>
 <CA+CK2bBuDu-3XeeAsy4zggOrxTrp84bcZp9p6mQipzc3NqpcSg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+CK2bBuDu-3XeeAsy4zggOrxTrp84bcZp9p6mQipzc3NqpcSg@mail.gmail.com>
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
Cc: mark.rutland@arm.com, muchun.song@linux.dev, luto@kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, bjorn@rivosinc.com, linux-mm@kvack.org, souravpanda@google.com, rdunlap@infradead.org, hpa@zytor.com, kernel@xen0n.name, will@kernel.org, agordeev@linux.ibm.com, namcao@linutronix.de, linux-s390@vger.kernel.org, arnd@arndb.de, bhe@redhat.com, chenhuacai@kernel.org, christophe.leroy@csgroup.eu, ardb@kernel.org, mingo@redhat.com, rientjes@google.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com, alexghiti@rivosinc.com, gor@linux.ibm.com, hca@linux.ibm.com, dawei.li@shingroup.cn, naveen@kernel.org, maobibo@loongson.cn, chenjiahao16@huawei.com, bp@alien8.de, npiggin@gmail.com, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, osalvador@suse.de, x86@kernel.org, philmd@linaro.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, mcgrof@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, svens@linux.ibm.com, tzimmermann@suse.de, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07.08.24 16:40, Pasha Tatashin wrote:
> On Wed, Aug 7, 2024 at 7:50 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 07.08.24 13:32, David Hildenbrand wrote:
>>> On 07.08.24 00:14, Pasha Tatashin wrote:
>>>> nid is needed during memory hot-remove in order to account the
>>>> information about the memmap overhead that is being removed.
>>>>
>>>> In addition, we cannot use page_pgdat(pfn_to_page(pfn)) during
>>>> hotremove after remove_pfn_range_from_zone().
>>>>
>>>> We also cannot determine nid from walking through memblocks after
>>>> remove_memory_block_devices() is called.
>>>>
>>>> Therefore, pass nid down from the beginning of hotremove to where
>>>> it is used for the accounting purposes.
>>>
>>> I was happy to finally remove that nid parameter for good in:
>>>
>>> commit 65a2aa5f482ed0c1b5afb9e6b0b9e0b16bb8b616
>>> Author: David Hildenbrand <david@redhat.com>
>>> Date:   Tue Sep 7 19:55:04 2021 -0700
>>>
>>>        mm/memory_hotplug: remove nid parameter from arch_remove_memory()
>>>
>>> To ask the real question: Do we really need this counter per-nid at all?
>>>
>>> Seems to over-complicate things.
>>
>> Case in point: I think the handling is wrong?
>>
>> Just because some memory belongs to a nid doesn't mean that the vmemmap
>> was allocated from that nid?
> 
> I believe when we hot-add we use nid for the memory that is being
> added to account vmemmap, and when we do hot-remove we also use nid of
> the memory that is being removed. But, you are correct, this does not
> guarantee that the actual vmemmap memory is being allocated or removed
> from the given nid.

Right. For boot memory that we might want to unplug later it might be 
different. I recall that with "movable_node", we might end up allocating 
the vmemmap from remote nodes, such that all memory of a node stays 
movable. That's why __earlyonly_bootmem_alloc() ends up calling 
memblock_alloc_try_nid_raw(), to fallback to other nodes if required.

> 
>> Wouldn't we want to look at the actual nid the vmemmap page belongs to
>> that we are removing?
> 
> I am now looking into converting this counter to be system wide, i.e.
> vm_event, it is all done under hotplug lock, so there is no
> contention.

That would be easiest, assuming per-node information is not strictly 
required for now.

-- 
Cheers,

David / dhildenb

