Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586A77C845
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:12:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KUY83w3G;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KUY83w3G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ2Wx1TJCz3cSP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 17:12:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KUY83w3G;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KUY83w3G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ2W11XrVz2yVC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 17:11:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692083481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUx5LEJZOPKDsMypuqMlxZ2NyXniu36dIsENemGDz2U=;
	b=KUY83w3GGF5VIXo0q6oJrjBfhfoLpmP9OKILtHR7DI6mlxF+bBQvu4iROtMZOYODmoG7FB
	vpeLGgzI4szYKuZLJOnixh1sTjgyHov5APqW5ADAvqbic/V9QwGVUzu7TmX6jXsPPBcbkY
	V2MQoBRDfnyH9wmMxpEYXYfGacaGo5I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692083481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUx5LEJZOPKDsMypuqMlxZ2NyXniu36dIsENemGDz2U=;
	b=KUY83w3GGF5VIXo0q6oJrjBfhfoLpmP9OKILtHR7DI6mlxF+bBQvu4iROtMZOYODmoG7FB
	vpeLGgzI4szYKuZLJOnixh1sTjgyHov5APqW5ADAvqbic/V9QwGVUzu7TmX6jXsPPBcbkY
	V2MQoBRDfnyH9wmMxpEYXYfGacaGo5I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-iUt5ErnRPUqk9ssj9YEIBw-1; Tue, 15 Aug 2023 03:11:20 -0400
X-MC-Unique: iUt5ErnRPUqk9ssj9YEIBw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fe19cf2796so34353565e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 00:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692083479; x=1692688279;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUx5LEJZOPKDsMypuqMlxZ2NyXniu36dIsENemGDz2U=;
        b=ZRSsbA5O5eSHzyRUih8csypx1lh7GMm4pSmuNKRx3Kr/2hcItCywKWaDBwsaUpOZyr
         g6SUEqyCyP5Z6JzOAQ0gOm1/RSDvNft+tg6ASltJi5U/LuNS06yLvuTtEIrZHBDuoMnO
         MPOefcLn1AVH0HDKcH/55eCTvVeclpm5r/W3MoH8CPjnJOUWywVqyCIiP00jayp2vWqT
         oLMbkBb0xymvce5CpQJE2ar++n1JClFRCkWOtlhh603/ak6r7ayV2nNvOY2re8LUfHiy
         9RxgvgAMw7dZvKCyTWUU2MGR88ainMYN5Y/8h4kDyMfUnKgAt1UVg711tnTYViFHzDNE
         vAdA==
X-Gm-Message-State: AOJu0YzzxLxyYNphC0XvvYNP4QaneJ04J9m6DJMXJxqdMcy6m97jh8/y
	90w1kegM5MF631AcJEBlkf0sxtOfxGzjc3ts2ya9WmDDSuI1F1VzAqzSZ4NuJtWWQjX/sAGL17S
	gUrKbbqCM8rTDsip6DheLzQtJtw==
X-Received: by 2002:a05:600c:2990:b0:3fe:485f:ed13 with SMTP id r16-20020a05600c299000b003fe485fed13mr9404418wmd.29.1692083479003;
        Tue, 15 Aug 2023 00:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiQ+EYuKIjtdDIXSbwm8P8GjevS6zUtMu7iUNLTT7TYUjZWJk7Cfz7u1UU0MPiq0T6R+AMng==
X-Received: by 2002:a05:600c:2990:b0:3fe:485f:ed13 with SMTP id r16-20020a05600c299000b003fe485fed13mr9404349wmd.29.1692083478509;
        Tue, 15 Aug 2023 00:11:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:3100:c642:ba83:8c37:b0e? (p200300cbc7013100c642ba838c370b0e.dip0.t-ipconnect.de. [2003:cb:c701:3100:c642:ba83:8c37:b0e])
        by smtp.gmail.com with ESMTPSA id m8-20020a7bca48000000b003fa96fe2bd9sm19977946wml.22.2023.08.15.00.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:11:17 -0700 (PDT)
Message-ID: <76e6b2ad-4e1e-2ad3-95df-00b4d33ec9d2@redhat.com>
Date: Tue, 15 Aug 2023 09:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [BUG] Re: [PATCH v3 10/13] mm/khugepaged:
 collapse_pte_mapped_thp() with mmap_read_lock()
To: Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
 <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com>
 <CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com>
 <cacd4a19-386d-8bea-400-e99778dbc3b@google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <cacd4a19-386d-8bea-400-e99778dbc3b@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Camp
 bell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15.08.23 08:34, Hugh Dickins wrote:
> On Mon, 14 Aug 2023, Jann Horn wrote:
>> On Wed, Jul 12, 2023 at 6:42 AM Hugh Dickins <hughd@google.com> wrote:
>>> Bring collapse_and_free_pmd() back into collapse_pte_mapped_thp().
>>> It does need mmap_read_lock(), but it does not need mmap_write_lock(),
>>> nor vma_start_write() nor i_mmap lock nor anon_vma lock.  All racing
>>> paths are relying on pte_offset_map_lock() and pmd_lock(), so use those.
>>
>> We can still have a racing userfaultfd operation at the "/* step 4:
>> remove page table */" point that installs a new PTE before the page
>> table is removed.
>>
>> To reproduce, patch a delay into the kernel like this:
>>
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 9a6e0d507759..27cc8dfbf3a7 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/swapops.h>
>>   #include <linux/shmem_fs.h>
>>   #include <linux/ksm.h>
>> +#include <linux/delay.h>
>>
>>   #include <asm/tlb.h>
>>   #include <asm/pgalloc.h>
>> @@ -1617,6 +1618,11 @@ int collapse_pte_mapped_thp(struct mm_struct
>> *mm, unsigned long addr,
>>          }
>>
>>          /* step 4: remove page table */
>> +       if (strcmp(current->comm, "DELAYME") == 0) {
>> +               pr_warn("%s: BEGIN DELAY INJECTION\n", __func__);
>> +               mdelay(5000);
>> +               pr_warn("%s: END DELAY INJECTION\n", __func__);
>> +       }
>>
>>          /* Huge page lock is still held, so page table must remain empty */
>>          pml = pmd_lock(mm, pmd);
>>
>>
>> And then run the attached reproducer against mm/mm-everything. You
>> should get this in dmesg:
>>
>> [  206.578096] BUG: Bad rss-counter state mm:000000000942ebea
>> type:MM_ANONPAGES val:1
> 
> Thanks a lot, Jann. I haven't thought about it at all yet; and just
> tried to reproduce, but haven't yet got the "BUG: Bad rss-counter":
> just see "Invalid argument" on the UFFDIO_COPY ioctl.
> Will investigate tomorrow.

Maybe you're missing a fixup:

https://lkml.kernel.org/r/20230810192128.1855570-1-axelrasmussen@google.com

When the src address is not page aligned, UFFDIO_COPY in mm-unstable 
would erroneously fail.

-- 
Cheers,

David / dhildenb

