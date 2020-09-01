Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD61258B33
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 11:15:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BghHP0rHQzDqVb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 19:15:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BghCl15xXzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 19:11:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BghCZ5xN7z9v6LQ;
 Tue,  1 Sep 2020 11:11:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NAat5xh4Agsy; Tue,  1 Sep 2020 11:11:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BghCZ45gXz9v6LH;
 Tue,  1 Sep 2020 11:11:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5AA628B75E;
 Tue,  1 Sep 2020 11:11:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id y8-hvOAjwjEi; Tue,  1 Sep 2020 11:11:55 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CBF28B77C;
 Tue,  1 Sep 2020 11:11:54 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm: Remove DEBUG_VM_PGTABLE support on ppc64
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200901080245.67950-1-aneesh.kumar@linux.ibm.com>
 <4519baaa-cb95-6ebb-200f-4520badb56f6@csgroup.eu>
 <39467f79-d213-772d-9ed1-93afedc2fc7a@linux.ibm.com>
 <6661a001-0a00-17b6-cb34-0f3510ca1fec@csgroup.eu>
Message-ID: <49fbd2b4-31af-826d-c884-32b7cc1c6e8d@csgroup.eu>
Date: Tue, 1 Sep 2020 11:10:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6661a001-0a00-17b6-cb34-0f3510ca1fec@csgroup.eu>
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



Le 01/09/2020 à 10:15, Christophe Leroy a écrit :
> 
> 
> Le 01/09/2020 à 10:12, Aneesh Kumar K.V a écrit :
>> On 9/1/20 1:40 PM, Christophe Leroy wrote:
>>>
>>>
>>> Le 01/09/2020 à 10:02, Aneesh Kumar K.V a écrit :
>>>> The test is broken w.r.t page table update rules and results in kernel
>>>> crash as below. Disable the support untill we get the tests updated.
>>>>
>>>>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>
>>> Any Fixes: tag ?
>>>
>>>> ---
>>>>   arch/powerpc/Kconfig | 1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index 65bed1fdeaad..787e829b6f25 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -116,7 +116,6 @@ config PPC
>>>>       #
>>>>       select ARCH_32BIT_OFF_T if PPC32
>>>>       select ARCH_HAS_DEBUG_VIRTUAL
>>>> -    select ARCH_HAS_DEBUG_VM_PGTABLE
>>>
>>>
>>> You say you remove support for ppc64 but you are removing it for both 
>>> PPC64 and PPC32. Should you replace the line by:
>>
>> Does it work on PPC32 with DEBUG_VM enabled? I was expecting it will 
>> be broken there too.
> 
> I was wondering. I have just started a build to test that on my 8xx. 
> I'll tell you before noon (Paris).
> 

There are warnings but it boots OK. So up to you, but if you deactivate 
it for both PPC32 and PPC64, say so in the subject like.

[    7.065399] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating 
architecture page table helpers
[    7.075155] ------------[ cut here ]------------
[    7.079590] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/pgtable.c:185 
set_pte_at+0x20/0xf4
[    7.087542] CPU: 0 PID: 1 Comm: swapper Not tainted 
5.9.0-rc2-s3k-dev-01348-g283e890ee4ad #3933
[    7.096122] NIP:  c000f634 LR: c07440f8 CTR: 00000000
[    7.101124] REGS: c9023c50 TRAP: 0700   Not tainted 
(5.9.0-rc2-s3k-dev-01348-g283e890ee4ad)
[    7.109445] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 53000339  XER: 80006100
[    7.116072]
[    7.116072] GPR00: c07440f8 c9023d08 c60e4000 c6ba4000 1efac000 
c6ba8eb0 c9023da8 00000001
[    7.116072] GPR08: 00000004 007346c9 c6ba8ebc 00000000 93000333 
00000000 c000390c 00000000
[    7.116072] GPR16: c0840000 00000ec9 000001ec 00734000 06ba8000 
c6bb0000 c05f43e8 1efac000
[    7.116072] GPR24: fffffff0 c6b96d08 c6ba8eac c6ba4000 1efac000 
007346c9 c6ba8eb0 007346c9
[    7.150796] NIP [c000f634] set_pte_at+0x20/0xf4
[    7.155274] LR [c07440f8] pte_advanced_tests+0xec/0x2bc
[    7.160401] Call Trace:
[    7.162831] [c9023d08] [c080db94] 0xc080db94 (unreliable)
[    7.168183] [c9023d28] [c07440f8] pte_advanced_tests+0xec/0x2bc
[    7.174036] [c9023dd8] [c0744498] debug_vm_pgtable+0x1d0/0x668
[    7.179827] [c9023e98] [c0734cd4] do_one_initcall+0x8c/0x1cc
[    7.185405] [c9023ef8] [c0735008] kernel_init_freeable+0x178/0x1d0
[    7.191511] [c9023f28] [c0003920] kernel_init+0x14/0x114
[    7.196763] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    7.202818] Instruction dump:
[    7.205754] bba10014 7c0803a6 38210020 4e800020 7c0802a6 9421ffe0 
bfc10018 90010024
[    7.213412] 83e60000 81250000 71270001 41820008 <0fe00000> 73e90040 
41820080 73ea0001
[    7.221249] ---[ end trace 95bbebcafa22d0f7 ]---
[    7.226049] ------------[ cut here ]------------
[    7.230438] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/pgtable.c:185 
set_pte_at+0x20/0xf4
[    7.238410] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.9.0-rc2-s3k-dev-01348-g283e890ee4ad #3933
[    7.248363] NIP:  c000f634 LR: c0744218 CTR: 00000000
[    7.253368] REGS: c9023c50 TRAP: 0700   Tainted: G        W 
(5.9.0-rc2-s3k-dev-01348-g283e890ee4ad)
[    7.263064] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 53000335  XER: a0006100
[    7.269690]
[    7.269690] GPR00: c0744218 c9023d08 c60e4000 c6ba4000 1efac000 
c6ba8eb0 c9023da8 00000001
[    7.269690] GPR08: 00000000 007341c9 00000000 007341c9 93000333 
00000000 c000390c 00000000
[    7.269690] GPR16: c0840000 00000ec9 000001ec 00734000 06ba8000 
c6bb0000 c05f43e8 1efac000
[    7.269690] GPR24: fffffff0 c6b96d08 c6ba8eac c6ba4000 1efac000 
007346c9 c6ba8eb0 007346c9
[    7.304418] NIP [c000f634] set_pte_at+0x20/0xf4
[    7.308892] LR [c0744218] pte_advanced_tests+0x20c/0x2bc
[    7.314105] Call Trace:
[    7.316535] [c9023d08] [c080db94] 0xc080db94 (unreliable)
[    7.321888] [c9023d28] [c0744218] pte_advanced_tests+0x20c/0x2bc
[    7.327826] [c9023dd8] [c0744498] debug_vm_pgtable+0x1d0/0x668
[    7.333613] [c9023e98] [c0734cd4] do_one_initcall+0x8c/0x1cc
[    7.339196] [c9023ef8] [c0735008] kernel_init_freeable+0x178/0x1d0
[    7.345300] [c9023f28] [c0003920] kernel_init+0x14/0x114
[    7.350551] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    7.356609] Instruction dump:
[    7.359545] bba10014 7c0803a6 38210020 4e800020 7c0802a6 9421ffe0 
bfc10018 90010024
[    7.367203] 83e60000 81250000 71270001 41820008 <0fe00000> 73e90040 
41820080 73ea0001
[    7.375039] ---[ end trace 95bbebcafa22d0f8 ]---
[    7.379783] ------------[ cut here ]------------
[    7.384228] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/pgtable.c:276 
set_huge_pte_at+0x104/0x134
[    7.392803] CPU: 0 PID: 1 Comm: swapper Tainted: G        W 
5.9.0-rc2-s3k-dev-01348-g283e890ee4ad #3933
[    7.402756] NIP:  c000f8fc LR: c074465c CTR: 00000000
[    7.407761] REGS: c9023d00 TRAP: 0700   Tainted: G        W 
(5.9.0-rc2-s3k-dev-01348-g283e890ee4ad)
[    7.417456] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 53000339  XER: a0006100
[    7.424082]
[    7.424082] GPR00: c074465c c9023db8 c60e4000 c6ba4000 000001ec 
c6ba8eb0 c9023e48 00000001
[    7.424082] GPR08: c6ba90ac 0000000b 007346c9 007341c9 93000333 
00000000 c000390c 00000000
[    7.424082] GPR16: c0840000 c6ba8eac 000001ec 00734000 06ba8000 
c6bb0000 c05f43e8 1efac000
[    7.424082] GPR24: c7fb39a0 c6ba8000 c6b96d08 000001cd 000006c9 
c0840000 007346c9 00000080
[    7.458810] NIP [c000f8fc] set_huge_pte_at+0x104/0x134
[    7.463885] LR [c074465c] debug_vm_pgtable+0x394/0x668
[    7.468928] Call Trace:
[    7.471358] [c9023db8] [c6ba8000] 0xc6ba8000 (unreliable)
[    7.476709] [c9023dd8] [c074465c] debug_vm_pgtable+0x394/0x668
[    7.482497] [c9023e98] [c0734cd4] do_one_initcall+0x8c/0x1cc
[    7.488081] [c9023ef8] [c0735008] kernel_init_freeable+0x178/0x1d0
[    7.494182] [c9023f28] [c0003920] kernel_init+0x14/0x114
[    7.499436] [c9023f38] [c000e184] ret_from_kernel_thread+0x14/0x1c
[    7.505494] Instruction dump:
[    7.508429] 7d2a482e 712a0800 40a2ff78 812204b4 2f890000 419e0014 
812900a0 55290034
[    7.516088] 2b890400 419e0014 57de06b0 4bffff54 <0fe00000> 4bffff3c 
7fa3eb78 90a10008
[    7.523925] ---[ end trace 95bbebcafa22d0f9 ]---


Christophe
