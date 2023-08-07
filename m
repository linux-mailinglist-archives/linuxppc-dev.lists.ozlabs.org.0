Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A572277184B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 04:22:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MhFGNTSs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK0TM3QpZz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 12:22:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MhFGNTSs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK0SR3cdJz2xVW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 12:21:41 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b867f9198dso8430605ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Aug 2023 19:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691374899; x=1691979699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qb/leLE6aCOZIBr9r1JYx3TvNlqeON7iS6luW38r5Jc=;
        b=MhFGNTSsO4+QWxRK82qumq9rIgYUhYdEtWtmsu+iSWZuXBlQH+Jx6RKgdZZFO06ThW
         G37Ma8brGBJxWF7UkJspgflGUQaJiZaxjvDyaz18XUG2U/LCOEUXLV+VmlcLXZOvnMmj
         nyLtb+JMK+VKyjFzRaHEMnMfg4ALVrMpUaU+83cfjao+bENXCNlVA8puNic5zPPgRXMj
         uJ19xY0Zt3h4aHO3jHr8IVHButtjHyG9SS5gdQy8Dfh5p+amv6EvjCKVeeW5NrJTjjun
         r34wfS65FaM+UZvBU/e2i5dptVB1aCzmSDwymThGl45g7FJSqbN87dmAD07OZaTzgSR+
         b51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691374899; x=1691979699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qb/leLE6aCOZIBr9r1JYx3TvNlqeON7iS6luW38r5Jc=;
        b=S9L8lqaOITTqptFG72phnPf6bKmI9F5ddRwFkAZn53SIir8h6ml1C3qf+qM3TieVin
         hA+I5BGVYioNounYpaNo8ZNqtN1XZdfe8Gcyj2ldZRLE3jqzhOUrYHQ8Mh1keHuUGqaR
         WBCOzopoBb6NL7TyoaHE1RbKTBN2bolckSxSr14C0T1tNJVijhPU3bhWHx9CjPuzkIhj
         QHk4bDzwrP/pwY0q4iUwPciA6k3utAvdjq05n0/HoLtV41ST5deJWD2DMEiz/OWicWqY
         ZYSzHZfht8yTd05O1RABK0NRaz3cv1LIpYhi7RvcwDe1Gt9BoHb/LoM6B2SBa2vBQw2F
         y6xg==
X-Gm-Message-State: ABy/qLa+b8bNfNlkw0OLCcnmjMuo+gWAB2vRI9D8OaUbbXyRnUoBlXTk
	5dR4qQZgZA/67BzXi6BzV7uuog==
X-Google-Smtp-Source: APBJJlGpQC/bZc7PkKBaCqakVv3f0BQCW9VbmoYUUceaU6MBY9H2NMC4vSDtjENAGMgNRiun6LJ2JA==
X-Received: by 2002:a17:902:ce92:b0:1b8:1591:9f81 with SMTP id f18-20020a170902ce9200b001b815919f81mr31962617plg.4.1691374898719;
        Sun, 06 Aug 2023 19:21:38 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902cf4600b001ac5896e96esm5514361plg.207.2023.08.06.19.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 19:21:37 -0700 (PDT)
Message-ID: <3403e5d3-e840-cea7-1863-b6b9ab7ecae0@bytedance.com>
Date: Mon, 7 Aug 2023 10:21:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 10/13] mm/khugepaged: collapse_pte_mapped_thp() with
 mmap_read_lock()
Content-Language: en-US
To: Hugh Dickins <hughd@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
 <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com>
 <0df84f9f-e9b0-80b1-4c9e-95abc1a73a96@bytedance.com>
 <884f20fe-d642-3a5f-522a-d756c3443bb4@google.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <884f20fe-d642-3a5f-522a-d756c3443bb4@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
  Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/8/6 11:55, Hugh Dickins wrote:
> On Thu, 3 Aug 2023, Qi Zheng wrote:
>> On 2023/7/12 12:42, Hugh Dickins wrote:
>>> Bring collapse_and_free_pmd() back into collapse_pte_mapped_thp().
>>> It does need mmap_read_lock(), but it does not need mmap_write_lock(),
>>> nor vma_start_write() nor i_mmap lock nor anon_vma lock.  All racing
>>> paths are relying on pte_offset_map_lock() and pmd_lock(), so use those.
> ...
>>> @@ -1681,47 +1634,76 @@ int collapse_pte_mapped_thp(struct mm_struct *mm,
>>> unsigned long addr,
>>>    
>>>      if (pte_none(ptent))
>>>    			continue;
>>> -		page = vm_normal_page(vma, addr, ptent);
>>> -		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
>>> +		/*
>>> +		 * We dropped ptl after the first scan, to do the
>>> mmu_notifier:
>>> +		 * page lock stops more PTEs of the hpage being faulted in,
>>> but
>>> +		 * does not stop write faults COWing anon copies from existing
>>> +		 * PTEs; and does not stop those being swapped out or
>>> migrated.
>>> +		 */
>>> +		if (!pte_present(ptent)) {
>>> +			result = SCAN_PTE_NON_PRESENT;
>>>    			goto abort;
>>> +		}
>>> +		page = vm_normal_page(vma, addr, ptent);
>>> +		if (hpage + i != page)
>>> +			goto abort;
>>> +
>>> +		/*
>>> +		 * Must clear entry, or a racing truncate may re-remove it.
>>> +		 * TLB flush can be left until pmdp_collapse_flush() does it.
>>> +		 * PTE dirty? Shmem page is already dirty; file is read-only.
>>> +		 */
>>> +		pte_clear(mm, addr, pte);
>>
>> This is not non-present PTE entry, so we should call ptep_clear() to let
>> page_table_check track the PTE clearing operation, right? Otherwise it
>> may lead to false positives?
> 
> You are right: thanks a lot for catching that: fix patch follows.

With fix patch:

Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks.

> 
> Hugh
