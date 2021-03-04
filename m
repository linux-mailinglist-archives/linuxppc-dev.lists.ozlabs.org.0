Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616C32D128
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 11:51:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drnjm3pRqz3cls
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 21:51:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrnjR2ghqz30HP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 21:51:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrnjG6PdJz9v1rj;
 Thu,  4 Mar 2021 11:51:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4JLot1x6by_Q; Thu,  4 Mar 2021 11:51:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrnjG4kybz9v1rX;
 Thu,  4 Mar 2021 11:51:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 03B058B7FA;
 Thu,  4 Mar 2021 11:51:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zkrp1iWXFZBy; Thu,  4 Mar 2021 11:51:15 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E3628B773;
 Thu,  4 Mar 2021 11:51:13 +0100 (CET)
Subject: Re: [PATCH v3] powerpc/uprobes: Validation for prefixed instruction
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20210304050529.59391-1-ravi.bangoria@linux.ibm.com>
 <ac7aa126-59dd-31be-1084-6d3a2f0e4eb4@csgroup.eu>
 <4d365b9f-6f25-a4bc-c145-c06ee33f1f9f@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f1a61cd9-436e-b486-b99c-0c06f2956a89@csgroup.eu>
Date: Thu, 4 Mar 2021 11:51:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4d365b9f-6f25-a4bc-c145-c06ee33f1f9f@linux.ibm.com>
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
Cc: jniethe5@gmail.com, oleg@redhat.com, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/03/2021 à 11:13, Ravi Bangoria a écrit :
> 
> 
> On 3/4/21 1:02 PM, Christophe Leroy wrote:
>>
>>
>> Le 04/03/2021 à 06:05, Ravi Bangoria a écrit :
>>> As per ISA 3.1, prefixed instruction should not cross 64-byte
>>> boundary. So don't allow Uprobe on such prefixed instruction.
>>>
>>> There are two ways probed instruction is changed in mapped pages.
>>> First, when Uprobe is activated, it searches for all the relevant
>>> pages and replace instruction in them. In this case, if that probe
>>> is on the 64-byte unaligned prefixed instruction, error out
>>> directly. Second, when Uprobe is already active and user maps a
>>> relevant page via mmap(), instruction is replaced via mmap() code
>>> path. But because Uprobe is invalid, entire mmap() operation can
>>> not be stopped. In this case just print an error and continue.
>>>
>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>> ---
>>> v2: https://lore.kernel.org/r/20210204104703.273429-1-ravi.bangoria@linux.ibm.com
>>> v2->v3:
>>>    - Drop restriction for Uprobe on suffix of prefixed instruction.
>>>      It needs lot of code change including generic code but what
>>>      we get in return is not worth it.
>>>
>>>   arch/powerpc/kernel/uprobes.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
>>> index e8a63713e655..c400971ebe70 100644
>>> --- a/arch/powerpc/kernel/uprobes.c
>>> +++ b/arch/powerpc/kernel/uprobes.c
>>> @@ -41,6 +41,14 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
>>>       if (addr & 0x03)
>>>           return -EINVAL;
>>> +    if (!IS_ENABLED(CONFIG_PPC64) || !cpu_has_feature(CPU_FTR_ARCH_31))
>>
>> cpu_has_feature(CPU_FTR_ARCH_31) should return 'false' when CONFIG_PPC64 is not enabled, no need 
>> to double check.
> 
> Ok.
> 
> I'm going to drop CONFIG_PPC64 check because it's not really
> required as I replied to Naveen. So, I'll keep CPU_FTR_ARCH_31
> check as is.
> 
>>
>>> +        return 0;
>>> +
>>> +    if (ppc_inst_prefixed(auprobe->insn) && (addr & 0x3F) == 0x3C) {
>>
>> Maybe 3C instead of 4F ? : (addr & 0x3C) == 0x3C
> 
> Didn't follow. It's not (addr & 0x3C), it's (addr & 0x3F).

Sorry I meant 3c instead of 3f (And usually we don't use capital letters for that).
The last two bits are supposed to always be 0, so it doesn't really matter, I just thought it would 
look better having the same value both sides of the test, ie (addr & 0x3c) == 0x3c.

> 
>>
>> What about
>>
>> (addr & (SZ_64 - 4)) == SZ_64 - 4 to make it more explicit ?
> 
> Yes this is bit better. Though, it should be:
> 
>      (addr & (SZ_64 - 1)) == SZ_64 - 4

-1 or -4 should give the same results as instructions are always 32 bits aligned though.

Christophe
