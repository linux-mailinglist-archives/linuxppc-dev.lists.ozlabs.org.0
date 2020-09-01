Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CA7258A30
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 10:17:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgg0y0p5rzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 18:17:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgfz65jnLzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 18:15:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bgfyz1lftz9v20B;
 Tue,  1 Sep 2020 10:15:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vrO1j-oApmn5; Tue,  1 Sep 2020 10:15:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bgfyz0zcNz9v208;
 Tue,  1 Sep 2020 10:15:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2EA198B774;
 Tue,  1 Sep 2020 10:15:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5T9UKEc4Lnwh; Tue,  1 Sep 2020 10:15:56 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92CD68B75E;
 Tue,  1 Sep 2020 10:15:55 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm: Remove DEBUG_VM_PGTABLE support on ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200901080245.67950-1-aneesh.kumar@linux.ibm.com>
 <4519baaa-cb95-6ebb-200f-4520badb56f6@csgroup.eu>
 <39467f79-d213-772d-9ed1-93afedc2fc7a@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6661a001-0a00-17b6-cb34-0f3510ca1fec@csgroup.eu>
Date: Tue, 1 Sep 2020 10:15:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <39467f79-d213-772d-9ed1-93afedc2fc7a@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/09/2020 à 10:12, Aneesh Kumar K.V a écrit :
> On 9/1/20 1:40 PM, Christophe Leroy wrote:
>>
>>
>> Le 01/09/2020 à 10:02, Aneesh Kumar K.V a écrit :
>>> The test is broken w.r.t page table update rules and results in kernel
>>> crash as below. Disable the support untill we get the tests updated.
>>>
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>
>> Any Fixes: tag ?
>>
>>> ---
>>>   arch/powerpc/Kconfig | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 65bed1fdeaad..787e829b6f25 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -116,7 +116,6 @@ config PPC
>>>       #
>>>       select ARCH_32BIT_OFF_T if PPC32
>>>       select ARCH_HAS_DEBUG_VIRTUAL
>>> -    select ARCH_HAS_DEBUG_VM_PGTABLE
>>
>>
>> You say you remove support for ppc64 but you are removing it for both 
>> PPC64 and PPC32. Should you replace the line by:
> 
> Does it work on PPC32 with DEBUG_VM enabled? I was expecting it will be 
> broken there too.

I was wondering. I have just started a build to test that on my 8xx. 
I'll tell you before noon (Paris).

Christophe

> 
>>
>>      select ARCH_HAS_DEBUG_VM_PGTABLE if PPC32
>>
>>>       select ARCH_HAS_DEVMEM_IS_ALLOWED
>>>       select ARCH_HAS_ELF_RANDOMIZE
>>>       select ARCH_HAS_FORTIFY_SOURCE
>>>
>>
>> What about 
>> Documentation/features/debug/debug-vm-pgtable/arch-support.txt ?
>>
> 
> I am hoping we can enable the config once we resolve the test issues. 
> may be in next merge window.
> 
> -aneesh
> 
> 
> 
