Return-Path: <linuxppc-dev+bounces-5588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13231A1D245
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 09:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhLvC66bVz305X;
	Mon, 27 Jan 2025 19:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737966007;
	cv=none; b=KIPqb6FjIoqlFc2gH8WZv4Q9HItWGtx9hXD/3hJ5GXMuCdzkb9AJFzLLbc2JHd3cxs/uJDb7XURPY4xWb9k/ZhUwRdUKpxGPgUXMASP9P5NcK4PnWkIdJ4Fn3lUFk48n3ceRCNa1tvdcFNPAOXkJDNdHf21acIBAX4yh0w5dzi31AqeDc0Zphg+rFAXrPcCsWjY3dEEFFKjkERsPVveH0MzN2HH3ud3dEKntF9CkH+55KYlbdPuBS91QIGrwU0zhUqCiWn32yatFezshb8cX5CuRU0KcB0DNfsyT/Uh+ieW5JbiM+jeJ3c3U26CNpla8EvZohs+8V48yqHCsQeexnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737966007; c=relaxed/relaxed;
	bh=+FJacsYVp0AZoRNvYkbf358GGMZxV6gHm/78gu5nKag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTyFdCMToLh6TM3RBe0KesQ6+/waYUXzcqUo+kXp1D8pOoaSBeXd2SLxQmKa7z6+entgkCXzkkZyaIZ4f9EeaeGbBk4/xr+BfwbyAifzWPiDAoeI8KMLfwJ7tW0nlx9B9O39ySzgD84hOOPKBVk3MdRBIosRIbdQPC3LY1Zz0rtm/xDz8awUH+5MUz3aQeawxpEw6u80+X9u3Lo0+HAS7Df3/ieBKSmHONTZE7MBYxuonOUNLFu/8ef/x3ODEBseTcwFyjl0KYouDCO6lvAyEF1k6c+9R+7HEaX+Bnpv2qi859EllP9ajHSJXpM4E9V91WnXFGm+Uq9PAePoM7arvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhLvB3T6cz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 19:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YhLBC1Pt7z9sSC;
	Mon, 27 Jan 2025 08:48:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWjNAvMI1NLe; Mon, 27 Jan 2025 08:48:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YhLBC0T7Vz9rvV;
	Mon, 27 Jan 2025 08:48:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2CD58B764;
	Mon, 27 Jan 2025 08:48:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id f85sdsFLNGYh; Mon, 27 Jan 2025 08:48:02 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F8AF8B763;
	Mon, 27 Jan 2025 08:48:02 +0100 (CET)
Message-ID: <e1af96e7-a021-4473-8c2b-6a16b20374bb@csgroup.eu>
Date: Mon, 27 Jan 2025 08:48:02 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/hugetlb: Disable gigantic hugepages if fadump
 is active
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20250124103220.111303-1-sourabhjain@linux.ibm.com>
 <147cd977-bfd0-4f9d-a9ae-748351ebaeab@csgroup.eu>
 <dbd59336-5838-41fe-a795-f6bf0574732f@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <dbd59336-5838-41fe-a795-f6bf0574732f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 25/01/2025 à 10:32, Sourabh Jain a écrit :
> Hello Christophe
> 
> 
> On 24/01/25 19:44, Christophe Leroy wrote:
>>
>>
>> Le 24/01/2025 à 11:32, Sourabh Jain a écrit :
>>> The fadump kernel boots with limited memory solely to collect the kernel
>>> core dump. Having gigantic hugepages in the fadump kernel is of no use.
>>> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
>>> gigantic hugepages are allocated.
>>>
>>> To address this, disable gigantic hugepages if fadump is active by
>>> returning early from arch_hugetlb_valid_size() using
>>> hugepages_supported(). hugepages_supported() returns false if fadump is
>>> active.
>>>
>>> Returning early from arch_hugetlb_valid_size() not only disables
>>> gigantic hugepages but also avoids unnecessary hstate initialization for
>>> every hugepage size supported by the platform.
>>>
>>> kernel logs related to hugepages with this patch included:
>>> kernel argument passed: hugepagesz=1G hugepages=1
>>>
>>> First kernel: gigantic hugepage got allocated
>>> ==============================================
>>>
>>> dmesg | grep -i "hugetlb"
>>> -------------------------
>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>>> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
>>> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>>>
>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>> -------------------------------------
>>> Hugetlb:         1048576 kB
>>>
>>> Fadump kernel: gigantic hugepage not allocated
>>> ===============================================
>>>
>>> dmesg | grep -i "hugetlb"
>>> -------------------------
>>> [    0.000000] HugeTLB: unsupported hugepagesz=1G
>>> [    0.000000] HugeTLB: hugepages=1 does not follow a valid 
>>> hugepagesz, ignoring
>>> [    0.706375] HugeTLB support is disabled!
>>> [    0.773530] hugetlbfs: disabling because there are no supported 
>>> hugepage sizes
>>>
>>> $ cat /proc/meminfo | grep -i "hugetlb"
>>> ----------------------------------
>>> <Nothing>
>>>
>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>>
>>> Changelog:
>>>
>>> v1:
>>> https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250121150419.1342794-1- 
>>> sourabhjain%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C747d8db131e44ea472cf08dd3d234a0f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638733943957107236%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=wArHG9ozTqBJWRbp850rkU7ioemZjai3TEf7nZGm4h0%3D&reserved=0
>>>
>>> v2:
>>>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>>>
>>> ---
>>>   arch/powerpc/mm/hugetlbpage.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/ 
>>> hugetlbpage.c
>>> index 6b043180220a..087a8df32416 100644
>>> --- a/arch/powerpc/mm/hugetlbpage.c
>>> +++ b/arch/powerpc/mm/hugetlbpage.c
>>> @@ -135,8 +135,12 @@ int __init alloc_bootmem_huge_page(struct hstate 
>>> *h, int nid)
>>>     bool __init arch_hugetlb_valid_size(unsigned long size)
>>>   {
>>> -    int shift = __ffs(size);
>>> -    int mmu_psize;
>>> +    int shift, mmu_psize;
>>> +
>>> +    if (!hugepages_supported())
>>> +        return false;
>>> +
>>> +    shift = __ffs(size);
>>
>> Why change the declaration/init of shift ?
> 
> I did this to avoid running code that wasn't necessary.

The compiler does it for you, when you look at the assembly you see the 
calculation is done only when needed.


> 
>>
>> It should be enough to leave things as they are and just add
>>
>>     if (!hugepages_supported())
>>         return false;
> 
> Sure.
> 
>>
>>
>>>         /* Check that it is a page size supported by the hardware and
>>>        * that it fits within pagetable and slice limits. */
>>
> 
> Thanks for the review.
> 
> - Sourabh Jain


