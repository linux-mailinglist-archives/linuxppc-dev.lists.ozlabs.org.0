Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E0244690
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 10:46:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BScVM1BtczDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 18:46:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BScSB48fPzDqkT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 18:44:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B260A1063;
 Fri, 14 Aug 2020 01:44:23 -0700 (PDT)
Received: from [10.163.65.227] (unknown [10.163.65.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6E833F22E;
 Fri, 14 Aug 2020 01:44:21 -0700 (PDT)
Subject: Re: [PATCH 14/16] debug_vm_pgtable/hugetlb: Disable hugetlb test on
 ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-14-aneesh.kumar@linux.ibm.com>
 <d067c278-6391-72f1-75c2-ccbd52909233@arm.com>
 <efc8f8c8-c16d-0826-9401-a45005ecaf62@linux.ibm.com>
 <83766a01-6ffb-798c-c5b9-46b2d672f618@arm.com>
 <535169b9-f4f0-57ce-0c2b-30afc237d4bd@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <08c63a65-cd3f-73f3-1698-5e60f398fbad@arm.com>
Date: Fri, 14 Aug 2020 14:13:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <535169b9-f4f0-57ce-0c2b-30afc237d4bd@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/12/2020 07:22 PM, Aneesh Kumar K.V wrote:
> On 8/12/20 7:04 PM, Anshuman Khandual wrote:
>>
>>
>> On 08/12/2020 06:46 PM, Aneesh Kumar K.V wrote:
>>> On 8/12/20 6:33 PM, Anshuman Khandual wrote:
>>>>
>>>>
>>>> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>>>>> The seems to be missing quite a lot of details w.r.t allocating
>>>>> the correct pgtable_t page (huge_pte_alloc()), holding the right
>>>>> lock (huge_pte_lock()) etc. The vma used is also not a hugetlb VMA.
>>>>>
>>>>> ppc64 do have runtime checks within CONFIG_DEBUG_VM for most of these.
>>>>> Hence disable the test on ppc64.
>>>>
>>>> This test is free from any platform specific #ifdefs which should
>>>> never be broken. If hugetlb_advanced_tests() does not work or is
>>>> not detailed enough for ppc64, then it would be great if you could
>>>> suggest some improvements so that it works for all enabled platforms.
>>>>
>>>>
>>>
>>> As mentioned the test is broken. For hugetlb, the pgtable_t pages should be allocated by huge_pte_alloc(). We need to hold huget_pte_lock() before  updating huge tlb pte. That takes hugepage size, which is mostly derived out of vma. Hence vma need to be a hugetlb vma. Some of the functions also depend on hstate. Also we should use set_huge_pte_at() when setting up hugetlb pte entries. I was tempted to remove that test completely marking it broken. But avoided that by marking it broken on only PPC64.
>>
>> The test is not broken, hugetlb helpers on multiple platforms dont complain about
>> this at all. The tests here emulate 'enough' MM objects required for the helpers
>> on enabled platforms, to perform the primary task i.e page table transformation it
>> is expected to do. The test does not claim to emulate a perfect MM environment for
>> a given subsystem's (like HugeTLB) arch helpers. Now in this case, the MM objects
>> being emulated for the HugeTLB advanced tests does not seem to be sufficient for
>> ppc64 but it can be improved. But that does not mean it is broken in it's current
>> form for other platforms.
>>
> 
> There is nothing ppc64 specific here. It is just that we have CONFIG_DEBUG_VM based checks for different possibly wrong usages of these functions. This was done because we have different page sizes, two different translations to support and we want to avoid any wrong usage. IMHO expecting hugetlb page table helpers to work with a non hugetlb VMA and  without holding hugeTLB pte lock is a clear violation of hugetlb interface.

Do you have a modified version of the test with HugeTLB marked VMA and with pte lock
held, which works on ppc664 ?
