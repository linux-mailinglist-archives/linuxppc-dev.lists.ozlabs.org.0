Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4AF25650
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 19:05:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457hwt2ZPWzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 03:05:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="m3tdzT78"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457hvK3kBczDqNP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 03:04:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 457hvC50BKz9v1md
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 19:04:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=m3tdzT78; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id y47qU0-mD-b7 for <linuxppc-dev@lists.ozlabs.org>;
 Tue, 21 May 2019 19:04:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 457hvC3hf8z9v1fC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 19:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558458263; bh=/9/R/hR6dUiQSkHbZ/UG1Agw1nOpcjcfhtKolnDX9PA=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=m3tdzT78YCX3xFWQxHmPl+o9xoyGCTAZwtz1bvg9MsACMiOrn/N2k1NUCmuDnsLZ4
 RS/ztbD3Tv7TI8AcbwasCSUMmQNpHrLtHKVxWLcYoSpyNX1fEBQJLn/OKZD2bwYaJU
 KeUgJvwlelqaRExNB5wsElj/VLBK1dzopcQIHyO0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 389AC8B815
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 19:04:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rC5B7rjpADNt for <linuxppc-dev@lists.ozlabs.org>;
 Tue, 21 May 2019 19:04:25 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D45D68B814
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 19:04:24 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 2/5] powerpc: Fix vDSO clock_getres()
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20190416161434.32691-1-vincenzo.frascino@arm.com>
 <20190416161434.32691-3-vincenzo.frascino@arm.com>
 <5f59aad9-f6d2-5622-b183-4506f13eedbd@c-s.fr>
 <6df7b0de-931b-618f-08c4-915451eb72e4@arm.com>
Message-ID: <031609a9-cc54-12ba-44df-16ce4b081abc@c-s.fr>
Date: Tue, 21 May 2019 19:04:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6df7b0de-931b-618f-08c4-915451eb72e4@arm.com>
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



Le 21/05/2019 à 18:08, Vincenzo Frascino a écrit :
> Hi Christophe,
> 
> I did not see this patch in 5.2-rc1 and I was wondering if there is anything I
> can do to help with upstraming it.

As far as I can see you series still has status 'new' in patchwork so I 
guess Michael didn't have time to look at it 
(https://patchwork.ozlabs.org/patch/1086410/)

> 
> Please let me know.


You series involves several arches, how do you plan to handle it ? Do 
you expect each arch maintainer to take each patch independentely, or do 
you expect acks from arch maintainers in order to merge the entire 
series in a given tree (which one ?)

Christophe


> 
> Thanks,
> Vincenzo
> 
> On 23/04/2019 17:33, Christophe Leroy wrote:
>>
>>
>> Le 16/04/2019 à 18:14, Vincenzo Frascino a écrit :
>>> clock_getres in the vDSO library has to preserve the same behaviour
>>> of posix_get_hrtimer_res().
>>>
>>> In particular, posix_get_hrtimer_res() does:
>>>       sec = 0;
>>>       ns = hrtimer_resolution;
>>> and hrtimer_resolution depends on the enablement of the high
>>> resolution timers that can happen either at compile or at run time.
>>>
>>> Fix the powerpc vdso implementation of clock_getres keeping a copy of
>>> hrtimer_resolution in vdso data and using that directly.
>>>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>>
>> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>
>>> ---
>>>    arch/powerpc/include/asm/vdso_datapage.h  | 2 ++
>>>    arch/powerpc/kernel/asm-offsets.c         | 2 +-
>>>    arch/powerpc/kernel/time.c                | 1 +
>>>    arch/powerpc/kernel/vdso32/gettimeofday.S | 7 +++++--
>>>    arch/powerpc/kernel/vdso64/gettimeofday.S | 7 +++++--
>>>    5 files changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
>>> index bbc06bd72b1f..4333b9a473dc 100644
>>> --- a/arch/powerpc/include/asm/vdso_datapage.h
>>> +++ b/arch/powerpc/include/asm/vdso_datapage.h
>>> @@ -86,6 +86,7 @@ struct vdso_data {
>>>    	__s32 wtom_clock_nsec;			/* Wall to monotonic clock nsec */
>>>    	__s64 wtom_clock_sec;			/* Wall to monotonic clock sec */
>>>    	struct timespec stamp_xtime;		/* xtime as at tb_orig_stamp */
>>> +	__u32 hrtimer_res;			/* hrtimer resolution */
>>>       	__u32 syscall_map_64[SYSCALL_MAP_SIZE]; /* map of syscalls  */
>>>       	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
>>>    };
>>> @@ -107,6 +108,7 @@ struct vdso_data {
>>>    	__s32 wtom_clock_nsec;
>>>    	struct timespec stamp_xtime;	/* xtime as at tb_orig_stamp */
>>>    	__u32 stamp_sec_fraction;	/* fractional seconds of stamp_xtime */
>>> +	__u32 hrtimer_res;		/* hrtimer resolution */
>>>       	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
>>>    	__u32 dcache_block_size;	/* L1 d-cache block size     */
>>>    	__u32 icache_block_size;	/* L1 i-cache block size     */
>>> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
>>> index 86a61e5f8285..52e4b98a8492 100644
>>> --- a/arch/powerpc/kernel/asm-offsets.c
>>> +++ b/arch/powerpc/kernel/asm-offsets.c
>>> @@ -383,6 +383,7 @@ int main(void)
>>>    	OFFSET(WTOM_CLOCK_NSEC, vdso_data, wtom_clock_nsec);
>>>    	OFFSET(STAMP_XTIME, vdso_data, stamp_xtime);
>>>    	OFFSET(STAMP_SEC_FRAC, vdso_data, stamp_sec_fraction);
>>> +	OFFSET(CLOCK_REALTIME_RES, vdso_data, hrtimer_res);
>>>    	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_data, icache_block_size);
>>>    	OFFSET(CFG_DCACHE_BLOCKSZ, vdso_data, dcache_block_size);
>>>    	OFFSET(CFG_ICACHE_LOGBLOCKSZ, vdso_data, icache_log_block_size);
>>> @@ -413,7 +414,6 @@ int main(void)
>>>    	DEFINE(CLOCK_REALTIME_COARSE, CLOCK_REALTIME_COARSE);
>>>    	DEFINE(CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC_COARSE);
>>>    	DEFINE(NSEC_PER_SEC, NSEC_PER_SEC);
>>> -	DEFINE(CLOCK_REALTIME_RES, MONOTONIC_RES_NSEC);
>>>    
>>>    #ifdef CONFIG_BUG
>>>    	DEFINE(BUG_ENTRY_SIZE, sizeof(struct bug_entry));
>>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>>> index bc0503ef9c9c..62c04a6746d8 100644
>>> --- a/arch/powerpc/kernel/time.c
>>> +++ b/arch/powerpc/kernel/time.c
>>> @@ -955,6 +955,7 @@ void update_vsyscall(struct timekeeper *tk)
>>>    	vdso_data->wtom_clock_nsec = tk->wall_to_monotonic.tv_nsec;
>>>    	vdso_data->stamp_xtime = xt;
>>>    	vdso_data->stamp_sec_fraction = frac_sec;
>>> +	vdso_data->hrtimer_res = hrtimer_resolution;
>>>    	smp_wmb();
>>>    	++(vdso_data->tb_update_count);
>>>    }
>>> diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
>>> index afd516b572f8..2b5f9e83c610 100644
>>> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
>>> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
>>> @@ -160,12 +160,15 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
>>>    	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
>>>    	bne	cr0,99f
>>>    
>>> +	mflr	r12
>>> +  .cfi_register lr,r12
>>> +	bl	__get_datapage@local
>>> +	lwz	r5,CLOCK_REALTIME_RES(r3)
>>> +	mtlr	r12
>>>    	li	r3,0
>>>    	cmpli	cr0,r4,0
>>>    	crclr	cr0*4+so
>>>    	beqlr
>>> -	lis	r5,CLOCK_REALTIME_RES@h
>>> -	ori	r5,r5,CLOCK_REALTIME_RES@l
>>>    	stw	r3,TSPC32_TV_SEC(r4)
>>>    	stw	r5,TSPC32_TV_NSEC(r4)
>>>    	blr
>>> diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
>>> index 1f324c28705b..f07730f73d5e 100644
>>> --- a/arch/powerpc/kernel/vdso64/gettimeofday.S
>>> +++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
>>> @@ -190,12 +190,15 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
>>>    	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
>>>    	bne	cr0,99f
>>>    
>>> +	mflr	r12
>>> +  .cfi_register lr,r12
>>> +	bl	V_LOCAL_FUNC(__get_datapage)
>>> +	lwz	r5,CLOCK_REALTIME_RES(r3)
>>> +	mtlr	r12
>>>    	li	r3,0
>>>    	cmpldi	cr0,r4,0
>>>    	crclr	cr0*4+so
>>>    	beqlr
>>> -	lis	r5,CLOCK_REALTIME_RES@h
>>> -	ori	r5,r5,CLOCK_REALTIME_RES@l
>>>    	std	r3,TSPC64_TV_SEC(r4)
>>>    	std	r5,TSPC64_TV_NSEC(r4)
>>>    	blr
>>>
> 
