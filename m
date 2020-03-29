Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B719196C56
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 12:04:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qrm81pp1zDqfF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 21:04:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=wkzIp4Sl; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qrPj1mkHzDqc7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 20:48:25 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48qrPZ20Z7z9tyY2;
 Sun, 29 Mar 2020 11:48:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wkzIp4Sl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id a-YX7TigDYri; Sun, 29 Mar 2020 11:48:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48qrPZ0n2nz9tyY1;
 Sun, 29 Mar 2020 11:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585475298; bh=QMHt+CzUvu9PdrsCMW23L7vVLi66IzMH33dqHOLEvp0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=wkzIp4SlY62kuhQIBgmcI/5xGhSRfgP+eVn0BEV3FVpr3LBYI/IWCoXN1WHiahGVV
 FK5udao4bhdHPrDglhnRRFxvi0euUS1ekEn0hO9VtTOayLTVAocziCH8IayOWMU57Z
 B+FBgxFb7AaVgEXuDuCQgJTig8tv9dEZNs42ZFLw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E7BAA8B770;
 Sun, 29 Mar 2020 11:48:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2Enbwj-751-v; Sun, 29 Mar 2020 11:48:19 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 460B28B752;
 Sun, 29 Mar 2020 11:48:16 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/kprobes: Blacklist functions running with MMU
 disabled on PPC32
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <3ada1af1b479c5a88bf9f3b8955bf5ba3f32f1ba.1582565849.git.christophe.leroy@c-s.fr>
 <1585299144.f9e0pmxsgv.naveen@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9fd6134f-1807-bb49-cf6a-fa49175fdfe5@c-s.fr>
Date: Sun, 29 Mar 2020 11:48:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1585299144.f9e0pmxsgv.naveen@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/03/2020 à 10:07, Naveen N. Rao a écrit :
> Christophe Leroy wrote:
>> kprobe does not handle events happening in real mode, all
>> functions running with MMU disabled have to be blacklisted.
>>
>> As already done for PPC64, do it for PPC32.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>> v2:
>> - Don't rename nonrecoverable as local, mark it noprobe instead.
>> - Add missing linux/kprobes.h include in pq2.c
>> ---
>>  arch/powerpc/include/asm/ppc_asm.h           | 10 +++
>>  arch/powerpc/kernel/cpu_setup_6xx.S          |  4 +-
>>  arch/powerpc/kernel/entry_32.S               | 65 ++++++++------------
>>  arch/powerpc/kernel/fpu.S                    |  1 +
>>  arch/powerpc/kernel/idle_6xx.S               |  2 +-
>>  arch/powerpc/kernel/idle_e500.S              |  2 +-
>>  arch/powerpc/kernel/l2cr_6xx.S               |  2 +-
>>  arch/powerpc/kernel/misc.S                   |  2 +
>>  arch/powerpc/kernel/misc_32.S                |  4 +-
>>  arch/powerpc/kernel/swsusp_32.S              |  6 +-
>>  arch/powerpc/kernel/vector.S                 |  1 +
>>  arch/powerpc/mm/book3s32/hash_low.S          | 38 ++++++------
>>  arch/powerpc/mm/mem.c                        |  2 +
>>  arch/powerpc/platforms/52xx/lite5200_sleep.S |  2 +
>>  arch/powerpc/platforms/82xx/pq2.c            |  3 +
>>  arch/powerpc/platforms/83xx/suspend-asm.S    |  1 +
>>  arch/powerpc/platforms/powermac/cache.S      |  2 +
>>  arch/powerpc/platforms/powermac/sleep.S      | 13 ++--
>>  18 files changed, 86 insertions(+), 74 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/ppc_asm.h 
>> b/arch/powerpc/include/asm/ppc_asm.h
>> index 6b03dff61a05..e8f34ba89497 100644
>> --- a/arch/powerpc/include/asm/ppc_asm.h
>> +++ b/arch/powerpc/include/asm/ppc_asm.h
>> @@ -267,8 +267,18 @@ GLUE(.,name):
>>      .pushsection "_kprobe_blacklist","aw";        \
>>      PPC_LONG (entry) ;                \
>>      .popsection
>> +#define _NOKPROBE_ENTRY(entry)                \
>> +    _ASM_NOKPROBE_SYMBOL(entry)                \
>> +    _ENTRY(entry)
>> +#define _NOKPROBE_GLOBAL(entry)                \
>> +    _ASM_NOKPROBE_SYMBOL(entry)                \
>> +    _GLOBAL(entry)
>>  #else
>>  #define _ASM_NOKPROBE_SYMBOL(entry)
>> +#define _NOKPROBE_ENTRY(entry)                \
>> +    _ENTRY(entry)
>> +#define _NOKPROBE_GLOBAL(entry)                \
>> +    _GLOBAL(entry)
>>  #endif
> 
> Michael hasn't preferred including NOKPROBE variants of those macros 
> previously, since he would like to see some cleanups there:
> https://patchwork.ozlabs.org/patch/696138/

Ok

[...]

>> @@ -194,8 +188,7 @@ transfer_to_handler:
>>      bt-    31-TLF_NAPPING,4f
>>      bt-    31-TLF_SLEEPING,7f
>>  #endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
>> -    .globl transfer_to_handler_cont
>> -transfer_to_handler_cont:
>> +_NOKPROBE_ENTRY(transfer_to_handler_cont)
>>  3:
>>      mflr    r9
>>      tovirt_novmstack r2, r2     /* set r2 to current */
>> @@ -297,6 +290,7 @@ reenable_mmu:
>>   * On kernel stack overflow, load up an initial stack pointer
>>   * and call StackOverflow(regs), which should not return.
>>   */
>> +_ASM_NOKPROBE_SYMBOL(stack_ovf)
>>  stack_ovf:
> 
> The current convention is to add the NOKPROBE annotation at the _end_ of 
> the associated function/symbol...

Ok. For big functions that looks unpractical, but I'll do that.

[...]

>> @@ -1033,17 +1026,15 @@ exc_exit_restart_end:
>>      li    r10, 0
>>      stw    r10, 8(r1)
>>      REST_2GPRS(9, r1)
>> -    .globl exc_exit_restart
>> +_NOKPROBE_ENTRY(exc_exit_restart)
>>  exc_exit_restart:
>>      lwz    r11,_NIP(r1)
>>      lwz    r12,_MSR(r1)
>> -exc_exit_start:
>>      mtspr    SPRN_SRR0,r11
>>      mtspr    SPRN_SRR1,r12
>>      REST_2GPRS(11, r1)
>>      lwz    r1,GPR1(r1)
>> -    .globl exc_exit_restart_end
>> -exc_exit_restart_end:
>> +.Lexc_exit_restart_end:
> 
> I think it would be good to break this into smaller patches to handle 
> specific code paths, if possible. At the very least, it would be good to 
> move changes to symbol visibility to a separate patch since this also 
> changes the names printed in a backtrace.

Ok.

I removed most symbol visibility changes. I only kept the ones in 
book3s32/hash_low.S and did a separate patch for it.

I split into patches per platform, then one bigger for everything in 
arch/powerpc/kernel/ except entries, then I did one for exception entry, 
one for syscall exit and one for exception exit.

Christophe
