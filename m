Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C0A16654A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 18:49:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nhtm5SzdzDqQG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 04:49:52 +1100 (AEDT)
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
 header.s=mail header.b=daljYzrE; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NhsH11ppzDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 04:48:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Nhs72V4xz9vBX1;
 Thu, 20 Feb 2020 18:48:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=daljYzrE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DwJF5wuzhRdz; Thu, 20 Feb 2020 18:48:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Nhs7149Bz9vBX0;
 Thu, 20 Feb 2020 18:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582220907; bh=7USdYpppWpLUMz/hmHevKU4uIzx9tYL4F01jbT8kXX4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=daljYzrEDJ4nTA2V5r/NMDUGk6B04dKozXLFkQK02SKX4Quu+Xfeoyp6SALYuWg3i
 84M2BUTpQ3+8MwcAHsjm6JugexRacOYVPrkHEVXykiYOY0F5I2WJNslEegS5xuOH89
 8vGp3/1icMoLG5ZUHb1xJ4W9IK6verpn8KXLXn58=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B955E8B87F;
 Thu, 20 Feb 2020 18:48:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sL247EO-2Fwd; Thu, 20 Feb 2020 18:48:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 586CD8B866;
 Thu, 20 Feb 2020 18:48:28 +0100 (CET)
Subject: Re: MCE handler gets NIP wrong on MPC8378
To: Radu Rendec <radu.rendec@gmail.com>
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
 <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
 <CAD5jUk9sd6tRZHySwxD5XxEJR-Cf2NNRgN-Y1HJRnSRqQBJWgA@mail.gmail.com>
 <20200219220829.Horde.I5UfTmHgQd92hm3jMgSMMA1@messagerie.si.c-s.fr>
 <20200219222110.Horde.MNo_rRZ0LaYxBYa_bppgCw1@messagerie.si.c-s.fr>
 <CAD5jUk-Wta-W26D7PUwi2__2GoDp9pOrKMiNCdu9TnWgMvy4GQ@mail.gmail.com>
 <09e9a042-766c-d2e6-2300-cebc372cabde@c-s.fr>
 <CAD5jUk_L0tmy-2YwC9pZA=PXTeVLhq64emF3J5Vz=mVP_VHZ_w@mail.gmail.com>
 <8008403c-49cd-29bc-712d-2e13b601041c@c-s.fr>
 <CAD5jUk9kEsWJDkgOD4rSsL6D2U92FLcunOSu6dVQjR1qdbMQWg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ba767239-339d-33a7-c3fb-6756d2484b1d@c-s.fr>
Date: Thu, 20 Feb 2020 18:48:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD5jUk9kEsWJDkgOD4rSsL6D2U92FLcunOSu6dVQjR1qdbMQWg@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/02/2020 à 18:34, Radu Rendec a écrit :
> On 02/20/2020 at 11:25 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>> Le 20/02/2020 à 17:02, Radu Rendec a écrit :
>>> On 02/20/2020 at 3:38 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>> On 02/19/2020 10:39 PM, Radu Rendec wrote:
>>>>> On 02/19/2020 at 4:21 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>>>>> Interesting.
>>>>>>>
>>>>>>> 0x900 is the adress of the timer interrupt.
>>>>>>>
>>>>>>> Would the MCE occur just after the timer interrupt ?
>>>>>
>>>>> I doubt that. I'm using a small test module to artificially trigger the
>>>>> MCE. Basically it's just this (the full code is in my original post):
>>>>>
>>>>>            bad_addr_base = ioremap(0xf0000000, 0x100);
>>>>>            x = ioread32(bad_addr_base);
>>>>>
>>>>> I find it hard to believe that every time I load the module the lwbrx
>>>>> instruction that triggers the MCE is executed exactly after the timer
>>>>> interrupt (or that the timer interrupt always occurs close to the lwbrx
>>>>> instruction).
>>>>
>>>> Can you try to see how much time there is between your read and the MCE ?
>>>> The below should allow it, you'll see first value in r13 and the other
>>>> in r14 (mce.c is your test code)
>>>>
>>>> Also provide the timebase frequency as reported in /proc/cpuinfo
>>>
>>> I just ran a test: r13 is 0xda8e0f91 and r14 is 0xdaae0f9c.
>>>
>>> # cat /proc/cpuinfo
>>> processor       : 0
>>> cpu             : e300c4
>>> clock           : 800.000004MHz
>>> revision        : 1.1 (pvr 8086 1011)
>>> bogomips        : 200.00
>>> timebase        : 100000000
>>>
>>> The difference between r14 and r13 is 0x20000b. Assuming TB is
>>> incremented with 'timebase' frequency, that means 20.97 milliseconds
>>> (although the e300 manual says TB is "incremented once every four core
>>> input clock cycles").
>>
>> I wouldn't be surprised that the internal CPU clock be twice the input
>> clock.
>>
>> So that's long enough to surely get a timer interrupt during every bad
>> access.
>>
>> Now we have to understand why SRR1 contains the address of the timer
>> exception entry and not the address of the bad access.
>>
>> The value of SRR1 confirms that it comes from 0x900 as MSR[IR] and [DR]
>> are cleared when interrupts are enabled.
>>
>> Maybe you should file a support case at NXP. They are usually quite
>> professionnal at responding.
> 
> I already did (quite some time ago), but it started off as "why does the
> MCE occur in the first place". That part has already been figured out,
> but unfortunately I don't have a viable solution to it. Like you said,
> now the focus has shifted to understanding why the SRR0 value is not
> what we expect.
> 
> I asked them the question about SRR0 as soon as you helped me get back
> on track and figured out there's nothing wrong with the Linux MCE
> handler and the NIP value comes from SRR0. What they came up with is
> basically this paragraph in the e300 core manual (section 5.5.2):
> 
> | Note that the e300 core makes no attempt to force recoverability on a
> | machine check; however, it does guarantee that the machine check
> | interrupt is always taken immediately upon request, with a nonpredicted
> | address saved in SRR0, regardless of the current machine state.
> 
> ... and with an emphasis on "nonpredicted". To be honest, I am a bit
> disappointed with their response and I believe in this context what
> "unpredicted" means is that the address that is saved to SRR0 is a
> "real" address rather than the result of branch prediction. The support
> folks were probably thinking "unpredictable". But that's another word
> and the difference is quite subtle :)
> 
> I updated the case and added information about the interrupts and the
> timing. Let's see what they come up with this time.
> 

Yes now the point is to understand why it starts processing the timer 
interrupt at 0x900 (with IR and DR cleared as observed in SRR1) just 
before taking the Machine Check.

Allthough the execution of the decrementer interrupt is queue for after 
the completion of the failing memory access, I'd expect the Machine 
Check to take priority.

Note that I have never observed such a behaviour on MPC8321 which has an 
e300c2 core.

Christophe
