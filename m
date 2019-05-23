Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FEF27A3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 12:21:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458lrq6ZQTzDqf8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 20:20:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Ztt6HmrN"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458lqC0GMGzDqDr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 20:19:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458lq62vp2z9v2Mq;
 Thu, 23 May 2019 12:19:30 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ztt6HmrN; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ygTTjGEG3vBX; Thu, 23 May 2019 12:19:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458lq61Zbmz9v2Mp;
 Thu, 23 May 2019 12:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558606770; bh=1LQ+y1Mys68MhcPnUTI8vxp4rWEm8EoTFQ3umQHk1YU=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Ztt6HmrN1FFB7VErb3p/4TYE1QerQQ2YqK5eSmIIKlFD5hCehdipRI+51krcf+SJx
 bjcnL6ZdIEtgFBgYilWD70vrO1hqEyTqePzd141GVOpeXNwnhnKlJx8anQ2ru95lx7
 BOqPj/fayarclooFajfPOKsqKWklGtNNaNaZGfis=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 697A38B85C;
 Thu, 23 May 2019 12:19:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DtooQodochog; Thu, 23 May 2019 12:19:31 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF1D68B858;
 Thu, 23 May 2019 12:19:30 +0200 (CEST)
Subject: Re: Failure to boot G4: dt_headr_start=0x01501000
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Mathieu Malaterre <malat@debian.org>
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
 <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
 <9b6e027e-0fa0-e088-d9a3-47b005cbc356@c-s.fr>
 <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
 <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
 <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
 <ba3a1c25-72ce-cfb4-67ac-df07584f57f5@c-s.fr>
 <158e1855-62ef-baf6-4fff-f28131a7e095@c-s.fr>
Message-ID: <70ff4c17-11eb-66ad-a788-9abc8d329c29@c-s.fr>
Date: Thu, 23 May 2019 10:18:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <158e1855-62ef-baf6-4fff-f28131a7e095@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/23/2019 10:05 AM, Christophe Leroy wrote:
> 
> 
> On 05/23/2019 09:59 AM, Christophe Leroy wrote:
>>
>>
>> On 05/23/2019 09:45 AM, Christophe Leroy wrote:
>>>
>>>
>>> Le 23/05/2019 à 10:53, Mathieu Malaterre a écrit :
>>>>> Commit id is:
>>>>>
>>>>> e93c9c99a629 (tag: v5.1) Linux 5.1
>>>>>
>>>>>> Did you try latest powerpc/merge branch ?
>>>>>
>>>>> Will try that next.
>>>>
>>>> I confirm powerpc/merge does not boot for me (same config). Commit id:
>>>>
>>>> a27eaa62326d (powerpc/merge) Automatic merge of branches 'master',
>>>> 'next' and 'fixes' into merge
>>>
>>> I see in the config you sent me that you have selected CONFIG_KASAN, 
>>> which is a big new stuff.
>>>
>>> Can you try without it ?
>>
>> While building with your config, I get a huge amount of:
>>
>> ppc-linux-ld: warning: orphan section `.data..LASAN0' from 
>> `lib/xarray.o' being placed in section `.data..LASAN0'.
>>    SORTEX  vmlinux
>>
>>
>>
>> I see you have also selected CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
>>
>> I guess nobody have never tried both this and CONFIG_KASAN together on 
>> ppc32. I'll give it a try.
> 
> 
> And you also have CONFIG_FTRACE.
> 
> In a recent patch implementing KASAN on PPC64, Daniel says that KASAN 
> and FTRACE don't go together well 
> (https://patchwork.ozlabs.org/patch/1103826/)
> 
> If you find out that it works without KASAN, can you then try with KASAN 
> but without FTRACE ?
> 

I tried your config in Qemu, looks I'm getting a recursive Oops:

#50 0xc0066af0 in do_exit (code=0xb) at kernel/exit.c:787
#51 0xc0013984 in oops_end (flags=<optimized out>, regs=<optimized out>, 
signr=0xb) at arch/powerpc/kernel/traps.c:253
#52 0xc001c30c in handle_page_fault () at arch/powerpc/kernel/entry_32.S:637
#53 0x20302e30 in ?? ()
#54 0xc001cb60 in btext_drawchar (c=0x0) at arch/powerpc/kernel/btext.c:522
#55 0xc00167cc in udbg_write (s=0xc113ae22 <text+2> "   0.000000] CPU: 0 
PID: 0 Comm: swapper Not tainted 5.1.0+ #1647\n0\n", n=0x37) at 
arch/powerpc/kernel/udbg.c:114
#56 0xc00d43f0 in call_console_drivers (ext_text=<optimized out>, 
text=<optimized out>, len=<optimized out>, ext_len=<optimized out>) at 
kernel/printk/printk.c:1780
#57 console_unlock () at kernel/printk/printk.c:2462
#58 0xc00d6630 in console_flush_on_panic () at kernel/printk/printk.c:2552
#59 0xc00618a0 in panic (fmt=0xc10f459f <buf+31> "!") at kernel/panic.c:280
#60 0xc0066af0 in do_exit (code=0xb) at kernel/exit.c:787
#61 0xc0013984 in oops_end (flags=<optimized out>, regs=<optimized out>, 
signr=0xb) at arch/powerpc/kernel/traps.c:253
#62 0xc001c30c in handle_page_fault () at arch/powerpc/kernel/entry_32.S:637
#63 0x20302e30 in ?? ()
#64 0xc001cb60 in btext_drawchar (c=0x0) at arch/powerpc/kernel/btext.c:522
#65 0xc00167cc in udbg_write (s=0xc113ae22 <text+2> "   0.000000] CPU: 0 
PID: 0 Comm: swapper Not tainted 5.1.0+ #1647\n0\n", n=0x45) at 
arch/powerpc/kernel/udbg.c:114
#66 0xc00d43f0 in call_console_drivers (ext_text=<optimized out>, 
text=<optimized out>, len=<optimized out>, ext_len=<optimized out>) at 
kernel/printk/printk.c:1780
#67 console_unlock () at kernel/printk/printk.c:2462
#68 0xc00d6630 in console_flush_on_panic () at kernel/printk/printk.c:2552
#69 0xc00618a0 in panic (fmt=0xc10f459f <buf+31> "!") at kernel/panic.c:280
#70 0xc0066af0 in do_exit (code=0xb) at kernel/exit.c:787
#71 0xc0013984 in oops_end (flags=<optimized out>, regs=<optimized out>, 
signr=0xb) at arch/powerpc/kernel/traps.c:253
#72 0xc001c30c in handle_page_fault () at arch/powerpc/kernel/entry_32.S:637
#73 0x20302e30 in ?? ()
#74 0xc001cb60 in btext_drawchar (c=0x0) at arch/powerpc/kernel/btext.c:522
#75 0xc00167cc in udbg_write (s=0xc113ae22 <text+2> "   0.000000] CPU: 0 
PID: 0 Comm: swapper Not tainted 5.1.0+ #1647\n0\n", n=0x32) at 
arch/powerpc/kernel/udbg.c:114
#76 0xc00d43f0 in call_console_drivers (ext_text=<optimized out>, 
text=<optimized out>, len=<optimized out>, ext_len=<optimized out>) at 
kernel/printk/printk.c:1780
#77 console_unlock () at kernel/printk/printk.c:2462
#78 0xc00d68d8 in vprintk_emit (facility=<optimized out>, 
level=<optimized out>, dict=0x0, dictlen=0x0, fmt=0xc085e4c0 
"\001\066printk: %sconsole [%s%d] enabled\n",
     args=0xc10cff30) at kernel/printk/printk.c:1985
#79 0xc00d69d8 in vprintk_default (fmt=<optimized out>, args=<optimized 
out>) at kernel/printk/printk.c:2012
#80 0xc00d7a40 in vprintk_func (fmt=<optimized out>, args=<optimized 
out>) at kernel/printk/printk_safe.c:398
#81 0xc00d2638 in printk (fmt=<optimized out>) at 
kernel/printk/printk.c:2045
#82 0xc00d4ef8 in register_console (newcon=0xc0cb9a20 <udbg_console>) at 
kernel/printk/printk.c:2777
#83 0xc0b79ed0 in machine_init (dt_ptr=<optimized out>) at 
arch/powerpc/kernel/setup_32.c:83
#84 0xc000347c in start_here () at arch/powerpc/kernel/head_32.S:901

Christophe
