Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 835193DFB09
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 07:25:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfgDz3LVyz3cVG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:25:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfgDZ2Qy8z2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 15:25:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GfgDR2pSqz9sWD;
 Wed,  4 Aug 2021 07:25:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwnPOfv-FcV0; Wed,  4 Aug 2021 07:25:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GfgDR1WyJz9sVr;
 Wed,  4 Aug 2021 07:25:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F36F68B790;
 Wed,  4 Aug 2021 07:25:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id La9pB5DTjAGj; Wed,  4 Aug 2021 07:25:10 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A04A8B764;
 Wed,  4 Aug 2021 07:25:10 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc/bug: Remove specific powerpc BUG_ON() and
 WARN_ON() on PPC32
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618244758.git.christophe.leroy@csgroup.eu>
 <c2525223-ad29-6126-afa1-d70b8e29d721@csgroup.eu>
Message-ID: <2325c462-07ab-4b0f-db9e-566883d5fc15@csgroup.eu>
Date: Wed, 4 Aug 2021 07:25:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c2525223-ad29-6126-afa1-d70b8e29d721@csgroup.eu>
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

Gentle ping Michael ?

Le 25/06/2021 à 16:41, Christophe Leroy a écrit :
> Hi Michael,
> 
> What happened to this series ? It has been flagged 'under review' in Patchwork since mid April but I 
> never saw it in next-test.
> 
> Thanks
> Christophe
> 
> Le 12/04/2021 à 18:26, Christophe Leroy a écrit :
>> powerpc BUG_ON() and WARN_ON() are based on using twnei instruction.
>>
>> For catching simple conditions like a variable having value 0, this
>> is efficient because it does the test and the trap at the same time.
>> But most conditions used with BUG_ON or WARN_ON are more complex and
>> forces GCC to format the condition into a 0 or 1 value in a register.
>> This will usually require 2 to 3 instructions.
>>
>> The most efficient solution would be to use __builtin_trap() because
>> GCC is able to optimise the use of the different trap instructions
>> based on the requested condition, but this is complex if not
>> impossible for the following reasons:
>> - __builtin_trap() is a non-recoverable instruction, so it can't be
>> used for WARN_ON
>> - Knowing which line of code generated the trap would require the
>> analysis of DWARF information. This is not a feature we have today.
>>
>> As mentioned in commit 8d4fbcfbe0a4 ("Fix WARN_ON() on bitfield ops")
>> the way WARN_ON() is implemented is suboptimal. That commit also
>> mentions an issue with 'long long' condition. It fixed it for
>> WARN_ON() but the same problem still exists today with BUG_ON() on
>> PPC32. It will be fixed by using the generic implementation.
>>
>> By using the generic implementation, gcc will naturally generate a
>> branch to the unconditional trap generated by BUG().
>>
>> As modern powerpc implement zero-cycle branch,
>> that's even more efficient.
>>
>> And for the functions using WARN_ON() and its return, the test
>> on return from WARN_ON() is now also used for the WARN_ON() itself.
>>
>> On PPC64 we don't want it because we want to be able to use CFAR
>> register to track how we entered the code that trapped. The CFAR
>> register would be clobbered by the branch.
>>
>> A simple test function:
>>
>>     unsigned long test9w(unsigned long a, unsigned long b)
>>     {
>>         if (WARN_ON(!b))
>>             return 0;
>>         return a / b;
>>     }
>>
>> Before the patch:
>>
>>     0000046c <test9w>:
>>      46c:    7c 89 00 34     cntlzw  r9,r4
>>      470:    55 29 d9 7e     rlwinm  r9,r9,27,5,31
>>      474:    0f 09 00 00     twnei   r9,0
>>      478:    2c 04 00 00     cmpwi   r4,0
>>      47c:    41 82 00 0c     beq     488 <test9w+0x1c>
>>      480:    7c 63 23 96     divwu   r3,r3,r4
>>      484:    4e 80 00 20     blr
>>
>>      488:    38 60 00 00     li      r3,0
>>      48c:    4e 80 00 20     blr
>>
>> After the patch:
>>
>>     00000468 <test9w>:
>>      468:    2c 04 00 00     cmpwi   r4,0
>>      46c:    41 82 00 0c     beq     478 <test9w+0x10>
>>      470:    7c 63 23 96     divwu   r3,r3,r4
>>      474:    4e 80 00 20     blr
>>
>>      478:    0f e0 00 00     twui    r0,0
>>      47c:    38 60 00 00     li      r3,0
>>      480:    4e 80 00 20     blr
>>
>> So we see before the patch we need 3 instructions on the likely path
>> to handle the WARN_ON(). With the patch the trap goes on the unlikely
>> path.
>>
>> See below the difference at the entry of system_call_exception where
>> we have several BUG_ON(), allthough less impressing.
>>
>> With the patch:
>>
>>     00000000 <system_call_exception>:
>>        0:    81 6a 00 84     lwz     r11,132(r10)
>>        4:    90 6a 00 88     stw     r3,136(r10)
>>        8:    71 60 00 02     andi.   r0,r11,2
>>        c:    41 82 00 70     beq     7c <system_call_exception+0x7c>
>>       10:    71 60 40 00     andi.   r0,r11,16384
>>       14:    41 82 00 6c     beq     80 <system_call_exception+0x80>
>>       18:    71 6b 80 00     andi.   r11,r11,32768
>>       1c:    41 82 00 68     beq     84 <system_call_exception+0x84>
>>       20:    94 21 ff e0     stwu    r1,-32(r1)
>>       24:    93 e1 00 1c     stw     r31,28(r1)
>>       28:    7d 8c 42 e6     mftb    r12
>>     ...
>>       7c:    0f e0 00 00     twui    r0,0
>>       80:    0f e0 00 00     twui    r0,0
>>       84:    0f e0 00 00     twui    r0,0
>>
>> Without the patch:
>>
>>     00000000 <system_call_exception>:
>>        0:    94 21 ff e0     stwu    r1,-32(r1)
>>        4:    93 e1 00 1c     stw     r31,28(r1)
>>        8:    90 6a 00 88     stw     r3,136(r10)
>>        c:    81 6a 00 84     lwz     r11,132(r10)
>>       10:    69 60 00 02     xori    r0,r11,2
>>       14:    54 00 ff fe     rlwinm  r0,r0,31,31,31
>>       18:    0f 00 00 00     twnei   r0,0
>>       1c:    69 60 40 00     xori    r0,r11,16384
>>       20:    54 00 97 fe     rlwinm  r0,r0,18,31,31
>>       24:    0f 00 00 00     twnei   r0,0
>>       28:    69 6b 80 00     xori    r11,r11,32768
>>       2c:    55 6b 8f fe     rlwinm  r11,r11,17,31,31
>>       30:    0f 0b 00 00     twnei   r11,0
>>       34:    7d 8c 42 e6     mftb    r12
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/bug.h | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
>> index d1635ffbb179..101dea4eec8d 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -68,7 +68,11 @@
>>       BUG_ENTRY("twi 31, 0, 0", 0);                \
>>       unreachable();                        \
>>   } while (0)
>> +#define HAVE_ARCH_BUG
>> +
>> +#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
>> +#ifdef CONFIG_PPC64
>>   #define BUG_ON(x) do {                        \
>>       if (__builtin_constant_p(x)) {                \
>>           if (x)                        \
>> @@ -78,8 +82,6 @@
>>       }                            \
>>   } while (0)
>> -#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
>> -
>>   #define WARN_ON(x) ({                        \
>>       int __ret_warn_on = !!(x);                \
>>       if (__builtin_constant_p(__ret_warn_on)) {        \
>> @@ -93,9 +95,10 @@
>>       unlikely(__ret_warn_on);                \
>>   })
>> -#define HAVE_ARCH_BUG
>>   #define HAVE_ARCH_BUG_ON
>>   #define HAVE_ARCH_WARN_ON
>> +#endif
>> +
>>   #endif /* __ASSEMBLY __ */
>>   #else
>>   #ifdef __ASSEMBLY__
>>
