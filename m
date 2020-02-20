Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AFA166293
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 17:27:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ng435z5MzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 03:27:47 +1100 (AEDT)
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
 header.s=mail header.b=jJASL1fe; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Ng1H5Zg9zDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 03:25:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Ng1B1T63z9v9DJ;
 Thu, 20 Feb 2020 17:25:18 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jJASL1fe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lgxD27TnwSFB; Thu, 20 Feb 2020 17:25:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Ng1B09y4z9v9DG;
 Thu, 20 Feb 2020 17:25:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582215918; bh=noDN+g7RqQflzLdckfMbm/Rys1UhPtb8wxrfE5KCYlY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jJASL1feaxHVIhv9kgc27RgkkB8f5POuuhTopgVEoV19bSGEYsled7qiYlULl/iR1
 RpRYInhZ0INNdsxqJGL06ew7RphkPiW4PeGGgCkI4O5/lunSEAID8naPHqYUPZ6744
 DhfStNsbeJz/Zbumg9xKB6rjYMuUR9jT63CfjDYk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A15BD8B87B;
 Thu, 20 Feb 2020 17:25:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r3I8kBAQzloT; Thu, 20 Feb 2020 17:25:19 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4D12D8B866;
 Thu, 20 Feb 2020 17:25:19 +0100 (CET)
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
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8008403c-49cd-29bc-712d-2e13b601041c@c-s.fr>
Date: Thu, 20 Feb 2020 17:25:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD5jUk_L0tmy-2YwC9pZA=PXTeVLhq64emF3J5Vz=mVP_VHZ_w@mail.gmail.com>
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



Le 20/02/2020 à 17:02, Radu Rendec a écrit :
> On 02/20/2020 at 3:38 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>> On 02/19/2020 10:39 PM, Radu Rendec wrote:
>>> On 02/19/2020 at 4:21 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>>> Interesting.
>>>>>
>>>>> 0x900 is the adress of the timer interrupt.
>>>>>
>>>>> Would the MCE occur just after the timer interrupt ?
>>>
>>> I doubt that. I'm using a small test module to artificially trigger the
>>> MCE. Basically it's just this (the full code is in my original post):
>>>
>>>           bad_addr_base = ioremap(0xf0000000, 0x100);
>>>           x = ioread32(bad_addr_base);
>>>
>>> I find it hard to believe that every time I load the module the lwbrx
>>> instruction that triggers the MCE is executed exactly after the timer
>>> interrupt (or that the timer interrupt always occurs close to the lwbrx
>>> instruction).
>>
>> Can you try to see how much time there is between your read and the MCE ?
>> The below should allow it, you'll see first value in r13 and the other
>> in r14 (mce.c is your test code)
>>
>> Also provide the timebase frequency as reported in /proc/cpuinfo
> 
> I just ran a test: r13 is 0xda8e0f91 and r14 is 0xdaae0f9c.
> 
> # cat /proc/cpuinfo
> processor       : 0
> cpu             : e300c4
> clock           : 800.000004MHz
> revision        : 1.1 (pvr 8086 1011)
> bogomips        : 200.00
> timebase        : 100000000
> 
> The difference between r14 and r13 is 0x20000b. Assuming TB is
> incremented with 'timebase' frequency, that means 20.97 milliseconds
> (although the e300 manual says TB is "incremented once every four core
> input clock cycles").

I wouldn't be surprised that the internal CPU clock be twice the input 
clock.

So that's long enough to surely get a timer interrupt during every bad 
access.

Now we have to understand why SRR1 contains the address of the timer 
exception entry and not the address of the bad access.

The value of SRR1 confirms that it comes from 0x900 as MSR[IR] and [DR] 
are cleared when interrupts are enabled.

Maybe you should file a support case at NXP. They are usually quite 
professionnal at responding.

Christophe
