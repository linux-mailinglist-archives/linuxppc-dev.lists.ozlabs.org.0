Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3832C5234
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:40:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChZ6H0fJwzDqkx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 21:40:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChZ4g5XRPzDr7x
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 21:39:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4ChZ4V08C4z9v071;
 Thu, 26 Nov 2020 11:39:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id y4x4T7cxa9f6; Thu, 26 Nov 2020 11:39:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4ChZ4T6Bg1z9v070;
 Thu, 26 Nov 2020 11:39:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 13C858B7ED;
 Thu, 26 Nov 2020 11:39:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qf_pW8kSwfBS; Thu, 26 Nov 2020 11:39:06 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 98F3D8B76D;
 Thu, 26 Nov 2020 11:39:06 +0100 (CET)
Subject: Re: [PATCH v6 16/22] powerpc/book3s64/kuap: Improve error reporting
 with KUAP
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-17-aneesh.kumar@linux.ibm.com>
 <bd854266-6cb5-3a04-ae80-a53e03f1e1d3@csgroup.eu>
 <87h7pctvdl.fsf@linux.ibm.com> <87r1ogxy8j.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0c8fc7e7-f910-ff1e-2cdc-fc93b14a648b@csgroup.eu>
Date: Thu, 26 Nov 2020 11:39:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87r1ogxy8j.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/11/2020 à 10:29, Michael Ellerman a écrit :
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>
>>> Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
>>>> With hash translation use DSISR_KEYFAULT to identify a wrong access.
>>>> With Radix we look at the AMR value and type of fault.
>>>>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> ---
>>>>    arch/powerpc/include/asm/book3s/32/kup.h     |  4 +--
>>>>    arch/powerpc/include/asm/book3s/64/kup.h     | 27 ++++++++++++++++----
>>>>    arch/powerpc/include/asm/kup.h               |  4 +--
>>>>    arch/powerpc/include/asm/nohash/32/kup-8xx.h |  4 +--
>>>>    arch/powerpc/mm/fault.c                      |  2 +-
>>>>    5 files changed, 29 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
>>>> index 32fd4452e960..b18cd931e325 100644
>>>> --- a/arch/powerpc/include/asm/book3s/32/kup.h
>>>> +++ b/arch/powerpc/include/asm/book3s/32/kup.h
>>>> @@ -177,8 +177,8 @@ static inline void restore_user_access(unsigned long flags)
>>>>    		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
>>>>    }
>>>>    
>>>> -static inline bool
>>>> -bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
>>>> +static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
>>>> +				  bool is_write, unsigned long error_code)
>>>>    {
>>>>    	unsigned long begin = regs->kuap & 0xf0000000;
>>>>    	unsigned long end = regs->kuap << 28;
>>>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
>>>> index 4a3d0d601745..2922c442a218 100644
>>>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>>>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>>>> @@ -301,12 +301,29 @@ static inline void set_kuap(unsigned long value)
>>>>    	isync();
>>>>    }
>>>>    
>>>> -static inline bool
>>>> -bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
>>>> +#define RADIX_KUAP_BLOCK_READ	UL(0x4000000000000000)
>>>> +#define RADIX_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
>>>> +
>>>> +static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long address,
>>>> +				  bool is_write, unsigned long error_code)
>>>>    {
>>>> -	return WARN(mmu_has_feature(MMU_FTR_KUAP) &&
>>>> -		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
>>>> -		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>>>> +	if (!mmu_has_feature(MMU_FTR_KUAP))
>>>> +		return false;
>>>> +
>>>> +	if (radix_enabled()) {
>>>> +		/*
>>>> +		 * Will be a storage protection fault.
>>>> +		 * Only check the details of AMR[0]
>>>> +		 */
>>>> +		return WARN((regs->kuap & (is_write ? RADIX_KUAP_BLOCK_WRITE : RADIX_KUAP_BLOCK_READ)),
>>>> +			    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>>>
>>> I think it is pointless to keep the WARN() here.
>>>
>>> I have a series aiming at removing them. See
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/cc9129bdda1dbc2f0a09cf45fece7d0b0e690784.1605541983.git.christophe.leroy@csgroup.eu/
>>
>> Can we do this as a spearate patch as you posted above? We can drop the
>> WARN in that while keeping the hash branch to look at DSISR value.
> 
> Yeah we can reconcile Christophe's series with yours later.
> 
> I'm still not 100% convinced I want to drop that WARN.

Ok, you can still take the rest of the series as that patch is the last one.

But, I really can't see the point with the WARN. When I hip a kuap bad fault, I get a double dump 
(see below). The second one is the interesting one, it tells me everything about the fault. But the 
WARN provides internals of do_page_fault() function. What interesting information do I get from there ?

[   37.842509] lkdtm: attempting bad write at b7bae000
[   37.842526] ------------[ cut here ]------------
[   37.842536] Bug: write fault blocked by segment registers !
[   37.842598] WARNING: CPU: 0 PID: 434 at arch/powerpc/include/asm/book3s/32/kup.h:189 
do_page_fault+0x3c8/0x5f0
[   37.842630] CPU: 0 PID: 434 Comm: busybox Not tainted 5.10.0-rc5-s3k-dev-01343-g8bec80f73baa #4165
[   37.842650] NIP:  c00155e4 LR: c00155e4 CTR: 00000000
[   37.842670] REGS: e6719c78 TRAP: 0700   Not tainted  (5.10.0-rc5-s3k-dev-01343-g8bec80f73baa)
[   37.842683] MSR:  00021032 <ME,IR,DR,RI>  CR: 22002224  XER: 20000000
[   37.842750]
[   37.842750] GPR00: c00155e4 e6719d30 c113c660 0000002f c097adf8 c097af10 00000027 00000027
[   37.842750] GPR08: c0b0afbc 00000000 00000023 00000001 24002224 100d166a 100a0920 00000000
[   37.842750] GPR16: 100cac0c 100b0000 10169444 1016a685 100d0000 100d0000 00000000 100a0900
[   37.842750] GPR24: ffffffef ffffffff c1392220 00000300 c076f424 02000000 b7bae000 e6719d70
[   37.843049] NIP [c00155e4] do_page_fault+0x3c8/0x5f0
[   37.843074] LR [c00155e4] do_page_fault+0x3c8/0x5f0
[   37.843087] Call Trace:
[   37.843114] [e6719d30] [c00155e4] do_page_fault+0x3c8/0x5f0 (unreliable)
[   37.843154] [e6719d60] [c0014384] handle_page_fault+0x10/0x3c
[   37.843211] --- interrupt: 301 at lkdtm_ACCESS_USERSPACE+0xdc/0xe4
[   37.843211]     LR = lkdtm_ACCESS_USERSPACE+0xd0/0xe4
[   37.843238] [e6719e48] [c039d76c] direct_entry+0xe0/0x164
[   37.843281] [e6719e68] [c0286730] full_proxy_write+0x78/0xbc
[   37.843325] [e6719e88] [c01657a8] vfs_write+0xdc/0x458
[   37.843359] [e6719f08] [c0165cb0] ksys_write+0x6c/0x11c
[   37.843397] [e6719f38] [c0014164] ret_from_syscall+0x0/0x34
[   37.843426] --- interrupt: c01 at 0xfd55784
[   37.843426]     LR = 0xfe16244
[   37.843438] Instruction dump:
[   37.843459] 38600007 4bff7a19 3bc00000 4bfffdbc 419e0110 813f00b0 55280006 7c1e4040
[   37.843529] 408000f4 3c60c080 3863e148 4801552d <0fe00000> 3c80c072 3c60c097 38840d84
[   37.843602] ---[ end trace 29c115c8ef352681 ]---
[   37.843627] Kernel attempted to write user page (b7bae000) - exploit attempt? (uid: 0)
[   37.851531] BUG: Unable to handle kernel data access on write at 0xb7bae000
[   37.858472] Faulting instruction address: 0xc039e550
[   37.863432] Oops: Kernel access of bad area, sig: 11 [#1]
[   37.868822] BE PAGE_SIZE=4K PREEMPT CMPCPRO
[   37.873029] SAF3000 DIE NOTIFICATION
[   37.876624] CPU: 0 PID: 434 Comm: busybox Tainted: G        W 
5.10.0-rc5-s3k-dev-01343-g8bec80f73baa #4165
[   37.886940] NIP:  c039e550 LR: c039e544 CTR: 00000000
[   37.891988] REGS: e6719d70 TRAP: 0300   Tainted: G        W 
(5.10.0-rc5-s3k-dev-01343-g8bec80f73baa)
[   37.901866] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 24002224  XER: 00000000
[   37.908617] DAR: b7bae000 DSISR: 0a000000
[   37.908617] GPR00: c039e544 e6719e28 c113c660 c083aad8 c097adf8 c097af10 00000027 00000027
[   37.908617] GPR08: c0b0afbc c0dec0de 00000023 00000001 28002224 100d166a 100a0920 00000000
[   37.908617] GPR16: 100cac0c 100b0000 10169444 1016a685 100d0000 100d0000 00000000 100a0900
[   37.908617] GPR24: ffffffef ffffffff e6719f10 00000011 c076f424 c1cb1000 c0839e24 b7bae000
[   37.946267] NIP [c039e550] lkdtm_ACCESS_USERSPACE+0xdc/0xe4
[   37.951842] LR [c039e544] lkdtm_ACCESS_USERSPACE+0xd0/0xe4
[   37.957316] Call Trace:
[   37.959782] [e6719e28] [c039e544] lkdtm_ACCESS_USERSPACE+0xd0/0xe4 (unreliable)
[   37.967102] [e6719e48] [c039d76c] direct_entry+0xe0/0x164
[   37.972524] [e6719e68] [c0286730] full_proxy_write+0x78/0xbc
[   37.978204] [e6719e88] [c01657a8] vfs_write+0xdc/0x458
[   37.983358] [e6719f08] [c0165cb0] ksys_write+0x6c/0x11c
[   37.988605] [e6719f38] [c0014164] ret_from_syscall+0x0/0x34
[   37.994185] --- interrupt: c01 at 0xfd55784
[   37.994185]     LR = 0xfe16244
[   38.001385] Instruction dump:
[   38.004360] 3863ac00 3d29c0df 3929c0de 91210008 4bcd04c9 3c60c084 3863ac24 7fe4fb78
[   38.012149] 4bcd04b9 3c60c084 81210008 3863aad8 <913f0000> 4bffff80 3c60c084 3863aa00
[   38.020120] ---[ end trace 29c115c8ef352682 ]---

Christophe
