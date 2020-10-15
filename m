Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE728EB5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 05:01:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBYw30FG7zDqRf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 14:01:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBYtN3lZQzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:00:10 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE6F831B;
 Wed, 14 Oct 2020 20:00:07 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2459F3F719;
 Wed, 14 Oct 2020 20:00:05 -0700 (PDT)
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
To: Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20201013135858.f4a7f0c5f3b0a69a2a304cfe@linux-foundation.org>
 <034db663-a5bd-fd5e-b7f6-3ec31310e8e5@linux.ibm.com>
 <20201014133607.fbf63d060e331fcd6007b624@linux-foundation.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6669114f-8522-c0cf-8b99-53f064b5b946@arm.com>
Date: Thu, 15 Oct 2020 08:29:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201014133607.fbf63d060e331fcd6007b624@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/15/2020 02:06 AM, Andrew Morton wrote:
> On Wed, 14 Oct 2020 08:45:16 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
> 
>>> Against mm-debug_vm_pgtable-avoid-none-pte-in-pte_clear_test.patch:
>>>
>>> https://lkml.kernel.org/r/87zh5wx51b.fsf@linux.ibm.com
>>
>>
>> yes this one we should get fixed. I was hoping someone familiar with 
>> Riscv pte updates rules would pitch in. IIUC we need to update 
>> RANDON_ORVALUE similar to how we updated it for s390 and ppc64.
>>
>>
>>   Alternatively we can do this
>>
>> modified   mm/debug_vm_pgtable.c
>> @@ -548,7 +548,7 @@ static void __init pte_clear_tests(struct mm_struct 
>> *mm, pte_t *ptep,
>>   	pte_t pte = pfn_pte(pfn, prot);
>>
>>   	pr_debug("Validating PTE clear\n");
>> -	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>> +//	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>>   	set_pte_at(mm, vaddr, ptep, pte);
>>   	barrier();
>>   	pte_clear(mm, vaddr, ptep);
>>
>> till we get that feedback from RiscV team?
> 
> Would it be better to do
> 
> #ifdef CONFIG_S390
> 	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> #endif

I would suggest just dropping RANDOM_ORVALUE from pte_clear_tests()
possibly with a comment saying it needs to be fixed on RISCV before
being added back later.

	pte = __pte(pte_val(pte));

OR

Disable RANDOM_ORVALUE only for RISCV.

#ifndef CONFIG_RISCV
	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
#endif
