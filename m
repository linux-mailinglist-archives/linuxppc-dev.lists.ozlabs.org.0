Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C681B165961
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 09:39:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NSgz0T63zDqRG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 19:39:43 +1100 (AEDT)
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
 header.s=mail header.b=bWDVjU3v; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NSfb3BDpzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 19:38:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48NSfR74D3z9v9y8;
 Thu, 20 Feb 2020 09:38:23 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bWDVjU3v; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pDGLRoDSGhFg; Thu, 20 Feb 2020 09:38:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48NSfR62PFz9v9xt;
 Thu, 20 Feb 2020 09:38:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582187903; bh=RB5+lw78T5RmCG0uyiDQr982stu8MZb/EITpqR2PPXc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bWDVjU3vj9eJJIdQNnsy3xdGemxyskaOVkSg/8h1UYu5ztH9N7X7vtj54pMjzaGlZ
 lDS/USVYAV1HGYWjBOITFmfqd7QLBRtQ9mDMTWKLdcPmTSlkvBWDf8eaiT8AO9e8PN
 X6khmrzTPdWjxWHEYkndzVjkNzhpDWdarCBOwIEs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B36408B781;
 Thu, 20 Feb 2020 09:38:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Fykl8zKB4Fk8; Thu, 20 Feb 2020 09:38:24 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 612B98B77E;
 Thu, 20 Feb 2020 09:38:24 +0100 (CET)
Subject: Re: MCE handler gets NIP wrong on MPC8378
To: Radu Rendec <radu.rendec@gmail.com>
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
 <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
 <CAD5jUk9sd6tRZHySwxD5XxEJR-Cf2NNRgN-Y1HJRnSRqQBJWgA@mail.gmail.com>
 <20200219220829.Horde.I5UfTmHgQd92hm3jMgSMMA1@messagerie.si.c-s.fr>
 <20200219222110.Horde.MNo_rRZ0LaYxBYa_bppgCw1@messagerie.si.c-s.fr>
 <CAD5jUk-Wta-W26D7PUwi2__2GoDp9pOrKMiNCdu9TnWgMvy4GQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <09e9a042-766c-d2e6-2300-cebc372cabde@c-s.fr>
Date: Thu, 20 Feb 2020 08:38:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAD5jUk-Wta-W26D7PUwi2__2GoDp9pOrKMiNCdu9TnWgMvy4GQ@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/19/2020 10:39 PM, Radu Rendec wrote:
> On 02/19/2020 at 4:21 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>> Radu Rendec <radu.rendec@gmail.com> a écrit :
>>>> On 02/19/2020 at 10:11 AM Radu Rendec <radu.rendec@gmail.com> wrote:
>>>>> On 02/18/2020 at 1:08 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>>>> Le 18/02/2020 à 18:07, Radu Rendec a écrit :
>>>>>>> The saved NIP seems to be broken inside machine_check_exception() on
>>>>>>> MPC8378, running Linux 4.9.191. The value is 0x900 most of the times,
>>>>>>> but I have seen other weird values.
>>>>>>>
>>>>>>> I've been able to track down the entry code to head_32.S (vector 0x200),
>>>>>>> but I'm not sure where/how the NIP value (where the exception occurred)
>>>>>>> is captured.
>>>>>>
>>>>>> NIP value is supposed to come from SRR0, loaded in r12 in PROLOG_2 and
>>>>>> saved into _NIP(r11) in transfer_to_handler in entry_32.S
>>>>>>
>>>>>> Can something clobber r12 at some point ?
>>>>>>
>>>>>
>>>>> I did something even simpler: I added the following
>>>>>
>>>>>       lis r12,0x1234
>>>>>
>>>>> ... right after
>>>>>
>>>>>       mfspr r12,SPRN_SRR0
>>>>>
>>>>> ... and now the NIP value I see in the crash dump is 0x12340000. This
>>>>> means r12 is not clobbered and most likely the NIP value I normally see
>>>>> is the actual SRR0 value.
>>>>
>>>> I apologize for the noise. I just found out accidentally that the saved
>>>> NIP value is correct if interrupts are disabled at the time when the
>>>> faulty access that triggers the MCE occurs. This seems to happen
>>>> consistently.
>>>>
>>>> By "interrupts are disabled" I mean local_irq_save/local_irq_restore, so
>>>> it's basically enough to wrap ioread32 to get the NIP value right.
>>>>
>>>> Does this make any sense? Maybe it's not a silicon bug after all, or
>>>> maybe it is and I just found a workaround. Could this happen on other
>>>> PowerPC CPUs as well?
>>>
>>> Interesting.
>>>
>>> 0x900 is the adress of the timer interrupt.
>>>
>>> Would the MCE occur just after the timer interrupt ?
> 
> I doubt that. I'm using a small test module to artificially trigger the
> MCE. Basically it's just this (the full code is in my original post):
> 
>          bad_addr_base = ioremap(0xf0000000, 0x100);
>          x = ioread32(bad_addr_base);
> 
> I find it hard to believe that every time I load the module the lwbrx
> instruction that triggers the MCE is executed exactly after the timer
> interrupt (or that the timer interrupt always occurs close to the lwbrx
> instruction).

Can you try to see how much time there is between your read and the MCE ?
The below should allow it, you'll see first value in r13 and the other 
in r14 (mce.c is your test code)

Also provide the timebase frequency as reported in /proc/cpuinfo

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 97c887950c3c..0ae6a0a17e26 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -273,6 +273,7 @@ __secondary_hold_acknowledge:
  	. = 0x200
  	DO_KVM  0x200
  MachineCheck:
+	mftbl	r14
  	EXCEPTION_PROLOG_0
  #ifdef CONFIG_VMAP_STACK
  	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
diff --git a/arch/powerpc/platforms/83xx/mce.c 
b/arch/powerpc/platforms/83xx/mce.c
index 91c2de6b73ca..0b7e4dcc0cb3 100644
--- a/arch/powerpc/platforms/83xx/mce.c
+++ b/arch/powerpc/platforms/83xx/mce.c
@@ -11,7 +11,7 @@ static int __init test_mce_init(void)
          bad_addr_base = ioremap(0xf0000000, 0x100);

          if (bad_addr_base) {
-                __asm__ __volatile__ ("isync");
+                __asm__ __volatile__ ("isync ; mftbl 13");
                  x = ioread32(bad_addr_base);
                  pr_info("Test: %#0x\n", x);
          } else


> 
>>>
>>> Can you tell how are configured your IO busses, etc ... ?
> 
> Nothing special. The device tree is mostly similar to mpc8379_rdb.dts,
> but I can provide the actual dts if you think it's relevant.
> 
>> And what's the value of SERSR after the machine check ?
> 
> I'm assuming you're talking about the IPIC SERSR register. I modified
> machine_check_exception and added a call to ipic_get_mcp_status, which
> seems to read IPIC_SERSR. The value is 0, both with interrupts enabled
> and disabled (which makes sense, since disabling/enabling interrupts is
> local to the CPU core).

And what's the reason given in the Oops message for the machine check ? 
Is that "Caused by (from SRR1=49030): Transfer error ack signal" or 
something else ?

> 
>> Do you use the local bus monitoring driver ?
> 
> I don't. In fact, I'm not even aware of it. What driver is that?

CONFIG_FSL_LBC

Christophe
