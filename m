Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA74A2CD0DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 09:15:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmpXv70DFzDqQH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 19:14:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Om2WTA9O; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmpW16vmnzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 19:13:17 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id o5so928656pgm.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 00:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QYOB0gfUjp3fOEy0Ej+mvT9YPuF/7bmhHcTHAdl6kKQ=;
 b=Om2WTA9OdH0CVs21jv19gA/ArtQZ7Zy3l8IPQt7M5VOagi/Q+Rl69QjBEvZcFiK6jk
 3KiG5I9o2TZw6zQUKnYyngg7c0Uq7F+qi2DHUUsQeZarH4iYklCo4a1Hp6YsTgYgmAcc
 nsZiG/V3qdE1HF+T0esScdV2Y95KYBXnKWuAtI/EUN90iUd7DHv5QcgTypW7rIUKwIkU
 Z4VH0cjLMMzKO9fON3RHVH1yY5iUsB5AfgObf1KR9t3enz+oj+YRfpQ1C0sBwbESnutJ
 PF/BObAhkBht+cYh6DtLFEOKz3F1qdRlQPVCYQl3KWO/Wfjuj1JpNMagJXVOsT4G5O0s
 OQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QYOB0gfUjp3fOEy0Ej+mvT9YPuF/7bmhHcTHAdl6kKQ=;
 b=m1djXgVWeb3gFWGrUItv7kyFP/RFOPlXw7bczvzTlpFHf1qh4cvrJGzPvQHQT6W4Yx
 CveiUh/QJohXkftu0sQWw1pE7iRJ2ce3uEltriX26b4RQ5X1gfNfKINiyXMlr35U5q/j
 QGYkylnk+c9bT7sHrmccaf4ZZ+34dbdRH7chqJQcgQWyUVhje7KD7bfYNQ9d3diP7V34
 zKgPQMtzGxP0rY9sDh/Arvba+XGCES5pcI6ahaax2GTBYO06MKx0znagysyI2zIZq+Y+
 WZ9V4tIPKOdKtdLDZdoSyYRpizmjftOL3ED2qCHIBas4ygy7W+67Xl/9F6eegSNEaHJt
 iK6A==
X-Gm-Message-State: AOAM531OZQ5tcETghM/bNmXHWBgMQt8SEC24R6v/zi+A5dvnZjBrGb6F
 AFj04LsFXr/GAiGgk5Orqf/uvQ==
X-Google-Smtp-Source: ABdhPJzcqc8SFAkVUJvIjNzvtDtzKXFNwGeQjkfhP2zJglFW0yv3CR2A0hNzz6KQdjyO045BJccJFA==
X-Received: by 2002:a62:7d90:0:b029:19d:917b:6c65 with SMTP id
 y138-20020a627d900000b029019d917b6c65mr2271569pfc.28.1606983193444; 
 Thu, 03 Dec 2020 00:13:13 -0800 (PST)
Received: from [0.0.0.0] (124-171-134-245.dyn.iinet.net.au. [124.171.134.245])
 by smtp.gmail.com with UTF8SMTPSA id
 u205sm874479pfc.146.2020.12.03.00.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 00:13:12 -0800 (PST)
Subject: Re: [PATCH kernel v2] powerpc/kuap: Restore AMR after replaying soft
 interrupts
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201203054724.44838-1-aik@ozlabs.ru>
 <7d09d218-2703-a37e-bf47-1cc47ee467b7@csgroup.eu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <8c177829-f2e2-fcea-0c85-a90dd6b02eb7@ozlabs.ru>
Date: Thu, 3 Dec 2020 19:13:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <7d09d218-2703-a37e-bf47-1cc47ee467b7@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/12/2020 19:03, Christophe Leroy wrote:
> 
> 
> Le 03/12/2020 à 06:47, Alexey Kardashevskiy a écrit :
>> When interrupted in raw_copy_from_user()/... after user memory access
>> is enabled, a nested handler may also access user memory (perf is
>> one example) and when it does so, it calls prevent_read_from_user()
>> which prevents the upper handler from accessing user memory.
>>
>> This saves/restores AMR when replaying interrupts.
>>
>> get_kuap/set_kuap have stubs for disabled KUAP on RADIX but there are
>> none for hash-only configs (BOOK3E) so this adds stubs and moves
>> AMR_KUAP_BLOCK_xxx.
>>
>> Found by syzkaller. More likely to break with enabled
>> CONFIG_DEBUG_ATOMIC_SLEEP, the call chain is
>> timer_interrupt -> ktime_get -> read_seqcount_begin -> local_irq_restore.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>> Changes:
>> v2:
>> * fixed compile on hash
>> * moved get/set to arch_local_irq_restore
>> * block KUAP before replaying
>>
>>
>> ---
>>
>> This is an example:
>>
>> ------------[ cut here ]------------
>> Bug: Read fault blocked by AMR!
>> WARNING: CPU: 0 PID: 1603 at 
>> /home/aik/p/kernel/arch/powerpc/include/asm/book3s/64/kup-radix.h:145 
>> __do_page_fau
>>
>> Modules linked in:
>> CPU: 0 PID: 1603 Comm: amr Not tainted 5.10.0-rc6_v5.10-rc6_a+fstn1 #24
>> NIP:  c00000000009ece8 LR: c00000000009ece4 CTR: 0000000000000000
>> REGS: c00000000dc63560 TRAP: 0700   Not tainted  
>> (5.10.0-rc6_v5.10-rc6_a+fstn1)
>> MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002888  XER: 20040000
>> CFAR: c0000000001fa928 IRQMASK: 1
>> GPR00: c00000000009ece4 c00000000dc637f0 c000000002397600 
>> 000000000000001f
>> GPR04: c0000000020eb318 0000000000000000 c00000000dc63494 
>> 0000000000000027
>> GPR08: c00000007fe4de68 c00000000dfe9180 0000000000000000 
>> 0000000000000001
>> GPR12: 0000000000002000 c0000000030a0000 0000000000000000 
>> 0000000000000000
>> GPR16: 0000000000000000 0000000000000000 0000000000000000 
>> bfffffffffffffff
>> GPR20: 0000000000000000 c0000000134a4020 c0000000019c2218 
>> 0000000000000fe0
>> GPR24: 0000000000000000 0000000000000000 c00000000d106200 
>> 0000000040000000
>> GPR28: 0000000000000000 0000000000000300 c00000000dc63910 
>> c000000001946730
>> NIP [c00000000009ece8] __do_page_fault+0xb38/0xde0
>> LR [c00000000009ece4] __do_page_fault+0xb34/0xde0
>> Call Trace:
>> [c00000000dc637f0] [c00000000009ece4] __do_page_fault+0xb34/0xde0 
>> (unreliable)
>> [c00000000dc638a0] [c00000000000c968] handle_page_fault+0x10/0x2c
>> --- interrupt: 300 at strncpy_from_user+0x290/0x440
>>      LR = strncpy_from_user+0x284/0x440
>> [c00000000dc63ba0] [c000000000c3dcb0] strncpy_from_user+0x2f0/0x440 
>> (unreliable)
>> [c00000000dc63c30] [c00000000068b888] getname_flags+0x88/0x2c0
>> [c00000000dc63c90] [c000000000662a44] do_sys_openat2+0x2d4/0x5f0
>> [c00000000dc63d30] [c00000000066560c] do_sys_open+0xcc/0x140
>> [c00000000dc63dc0] [c000000000045e10] system_call_exception+0x160/0x240
>> [c00000000dc63e20] [c00000000000da60] system_call_common+0xf0/0x27c
>> Instruction dump:
>> 409c0048 3fe2ff5b 3bfff128 fac10060 fae10068 482f7a85 60000000 3c62ff5b
>> 7fe4fb78 3863f250 4815bbd9 60000000 <0fe00000> 3c62ff5b 3863f2b8 4815c8b5
>> irq event stamp: 254
>> hardirqs last  enabled at (253): [<c000000000019550>] 
>> arch_local_irq_restore+0xa0/0x150
>> hardirqs last disabled at (254): [<c000000000008a10>] 
>> data_access_common_virt+0x1b0/0x1d0
>> softirqs last  enabled at (0): [<c0000000001f6d5c>] 
>> copy_process+0x78c/0x2120
>> softirqs last disabled at (0): [<0000000000000000>] 0x0
>> ---[ end trace ba98aec5151f3aeb ]---
>> ---
>>   arch/powerpc/include/asm/book3s/64/kup-radix.h |  3 ---
>>   arch/powerpc/include/asm/kup.h                 | 10 ++++++++++
>>   arch/powerpc/kernel/irq.c                      |  6 ++++++
>>   3 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h 
>> b/arch/powerpc/include/asm/book3s/64/kup-radix.h
>> index a39e2d193fdc..4ad607461b75 100644
>> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
>> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
>> @@ -5,9 +5,6 @@
>>   #include <linux/const.h>
>>   #include <asm/reg.h>
>> -#define AMR_KUAP_BLOCK_READ    UL(0x4000000000000000)
>> -#define AMR_KUAP_BLOCK_WRITE    UL(0x8000000000000000)
>> -#define AMR_KUAP_BLOCKED    (AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
>>   #define AMR_KUAP_SHIFT        62
>>   #ifdef __ASSEMBLY__
>> diff --git a/arch/powerpc/include/asm/kup.h 
>> b/arch/powerpc/include/asm/kup.h
>> index 0d93331d0fab..e63930767a96 100644
>> --- a/arch/powerpc/include/asm/kup.h
>> +++ b/arch/powerpc/include/asm/kup.h
>> @@ -14,6 +14,10 @@
>>   #define KUAP_CURRENT_WRITE    8
>>   #define KUAP_CURRENT        (KUAP_CURRENT_READ | KUAP_CURRENT_WRITE)
>> +#define AMR_KUAP_BLOCK_READ    UL(0x4000000000000000)
>> +#define AMR_KUAP_BLOCK_WRITE    UL(0x8000000000000000)
>> +#define AMR_KUAP_BLOCKED    (AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
>> +
> 
> Those macro are specific to BOOK3S_64, they have nothing to do in 
> asm/kup.h, must stay in the file included just below
> 
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   #include <asm/book3s/64/kup-radix.h>
>>   #endif
>> @@ -64,6 +68,12 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long 
>> address, bool is_write)
>>   }
>>   static inline void kuap_check_amr(void) { }
>> +static inline unsigned long get_kuap(void)
>> +{
>> +    return AMR_KUAP_BLOCKED;
>> +}
>> +
> 
> The above is not generic, it is specific to book3s 64, AMR doesn't exist 
> on book3s/32 or on 8xx.


ah ok, I did not want more ifdefs there but looks like it is 
unavoidable, I'll repost if there are no other comments. Thanks,


-- 
Alexey
