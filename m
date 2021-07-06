Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58603BDA0D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 17:22:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK5s75dtvz3bZs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 01:22:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Y/Mv80Yb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.218;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Y/Mv80Yb; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK5rf14gNz2xvW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 01:22:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625584921;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=cQkUKuP4GwDOcm/QykW2fcaPtBXjJvQdQJH/V+4Tk0I=;
 b=Y/Mv80YbuqEJ5+jJOnSOsToiPXD3P1mo2ZzkObe8tx1U8B+B2c0XwK0l8KUUuTD7hU
 Fs1anWBH6W4HZ8rTlJzuubjHGWPbgu8SkKGeQhj16nmlw0b1A1jdAmCFuyMEaJ+8rAf2
 zKyIM39vsyLQlIv0zWHaiXp2+2tzCmK0qkirlfDHFW0kwZ9iFYTeRLtE1gyp2M5yR49o
 CLqsiG5VxDW08TfgFlMiIF5CJbWgZtcR43fKPS16TK4529IG+LkGXyV9rqHjIXmoBghi
 u9uG1pX5qkS+MwBUy13p/PgEpo8qvLyfCF0znFLHnNNPzgL675LV6GhZJkbEB7/CEPez
 uL2g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hZUmZXAXbYUBWF2x3OBR490ekaIAVREn8CoDlreD"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:a972:569d:25d0:f684:fc1b:518a]
 by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id D02c3ax66FM0RoQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 17:22:00 +0200 (CEST)
Subject: Re: [FSL P50xx] IRQ issues
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
 <86de3024-c025-ec65-a45a-264585730c4a@xenosoft.de>
 <cc1b16c0-47d5-2c50-fba0-9e1aa014ee8a@xenosoft.de>
 <1625527692.m58rsysc62.astroid@bobo.none>
 <8ba2f5a3-5fc8-042b-a738-7545f8fbcf4d@xenosoft.de>
Message-ID: <74509635-f4e2-d6e7-311f-dbdab8fe317f@xenosoft.de>
Date: Tue, 6 Jul 2021 17:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8ba2f5a3-5fc8-042b-a738-7545f8fbcf4d@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

Your patch works (see patch below)! Many thanks for your help! We tested 
it on an A-EON AmigaOne X5000/20 and in a virtual e5500 QEMU machine today.

Screenshots:

- 
http://www.skateman.nl/wp-content/uploads/2021/07/Screenshot-at-2021-07-06-113237.png
- https://i.ibb.co/h813RRp/Kernel-5-14-alpha3-Power-PC.png

Thanks,
Christian

On 06 July 2021 at 06:07 am, Christian Zigotzky wrote:
> Hi Nick,
>
> Thanks a lot for your patch! We will test it as soon as possible. 
> You're right that this issue doesn't exist in a virtual e5500 QEMU 
> machine.
>
> Have a nice day,
> Christian
>
> On 06 July 2021 at 01:36 am, Nicholas Piggin wrote:
>> Excerpts from Christian Zigotzky's message of July 6, 2021 4:49 am:
>>> Hi All,
>>>
>>> Our FSL P50xx machines don't boot anymore because of IRQ issues. [1]
>>>
>>> Please check the IRQ changes in the latest PowerPC updates 5.14-1. [2]
>>>
>>> Thanks,
>>> Christian
>>>
>>> [1]
>>> https://forum.hyperion-entertainment.com/download/file.php?id=2592&mode=view 
>>>
>>> [2]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=019b3fd94ba73d3ac615f0537440b81f129821f6 
>>>
>> This looks like mtmsrd in the 64e code. I think this should fix it.
>>
>> QEMU does not seem to trap on this, maybe something to improve.
>>
>> Thanks,
>> Nick
>> -- 
>>
>> diff --git a/arch/powerpc/kernel/interrupt_64.S 
>> b/arch/powerpc/kernel/interrupt_64.S
>> index 4063e8a3f704..d4212d2ff0b5 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -311,9 +311,13 @@ END_BTB_FLUSH_SECTION
>>        * trace_hardirqs_off().
>>        */
>>       li    r11,IRQS_ALL_DISABLED
>> -    li    r12,-1 /* Set MSR_EE and MSR_RI */
>>       stb    r11,PACAIRQSOFTMASK(r13)
>> +#ifdef CONFIG_PPC_BOOK3S
>> +    li    r12,-1 /* Set MSR_EE and MSR_RI */
>>       mtmsrd    r12,1
>> +#else
>> +    wrteei    1
>> +#endif
>>         /* Calling convention has r9 = orig r0, r10 = regs */
>>       mr    r9,r0
>

