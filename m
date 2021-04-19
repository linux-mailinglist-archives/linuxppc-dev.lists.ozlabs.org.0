Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3205B36458A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 16:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP7kd692cz2yZM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 00:00:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FP7kH3gHfz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 00:00:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FCD231B;
 Mon, 19 Apr 2021 07:00:18 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FBAA3F7D7;
 Mon, 19 Apr 2021 07:00:16 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 akpm@linux-foundation.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
 <41819925-3ee5-4771-e98b-0073e8f095cf@arm.com>
 <da53d2f2-b472-0c38-bdd5-99c5a098675d@csgroup.eu>
 <1102cda1-b00f-b6ef-6bf3-22068cc11510@arm.com>
 <627ee414-2f78-94e3-b77b-1013f52e77e3@csgroup.eu>
From: Steven Price <steven.price@arm.com>
Message-ID: <4a76fbda-aa9d-867b-e2eb-a1951780aeec@arm.com>
Date: Mon, 19 Apr 2021 15:00:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <627ee414-2f78-94e3-b77b-1013f52e77e3@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19/04/2021 14:14, Christophe Leroy wrote:
> 
> 
> Le 16/04/2021 à 12:51, Steven Price a écrit :
>> On 16/04/2021 11:38, Christophe Leroy wrote:
>>>
>>>
>>> Le 16/04/2021 à 11:28, Steven Price a écrit :
>>>> On 15/04/2021 18:18, Christophe Leroy wrote:
>>>>
>>>> To be honest I don't fully understand why powerpc requires the 
>>>> page_size - it appears to be using it purely to find "holes" in the 
>>>> calls to note_page(), but I haven't worked out why such holes would 
>>>> occur.
>>>
>>> I was indeed introduced for KASAN. We have a first commit 
>>> https://github.com/torvalds/linux/commit/cabe8138 which uses page 
>>> size to detect whether it is a KASAN like stuff.
>>>
>>> Then came https://github.com/torvalds/linux/commit/b00ff6d8c as a 
>>> fix. I can't remember what the problem was exactly, something around 
>>> the use of hugepages for kernel memory, came as part of the series 
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1589866984.git.christophe.leroy@csgroup.eu/ 
>>
>>
>>
>> Ah, that's useful context. So it looks like powerpc took a different 
>> route to reducing the KASAN output to x86.
>>
>> Given the generic ptdump code has handling for KASAN already it should 
>> be possible to drop that from the powerpc arch code, which I think 
>> means we don't actually need to provide page size to notepage(). 
>> Hopefully that means more code to delete ;)
>>
> 
> Looking at how the generic ptdump code handles KASAN, I'm a bit sceptic.
> 
> IIUC, it is checking that kasan_early_shadow_pte is in the same page as 
> the pgtable referred by the PMD entry. But what happens if that PMD 
> entry is referring another pgtable which is inside the same page as 
> kasan_early_shadow_pte ?
> 
> Shouldn't the test be
> 
>      if (pmd_page_vaddr(val) == lm_alias(kasan_early_shadow_pte))
>          return note_kasan_page_table(walk, addr);

Now I come to look at this code again, I think you're right. On arm64 
this doesn't cause a problem - page tables are page sized and page 
aligned, so there couldn't be any non-KASAN pgtables sharing the page. 
Obviously that's not necessarily true of other architectures.

Feel free to add a patch to your series ;)

Steve
