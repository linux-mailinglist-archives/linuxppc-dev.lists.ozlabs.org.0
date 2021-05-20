Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4838B525
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 19:25:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmGpj1KyBz30G7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 03:25:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.42.229; helo=4.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 16798 seconds by postgrey-1.36 at boromir;
 Fri, 21 May 2021 03:25:12 AEST
Received: from 4.mo51.mail-out.ovh.net (4.mo51.mail-out.ovh.net
 [188.165.42.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmGpJ4QD0z2xtn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 03:25:11 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 66FFA29BC7B;
 Thu, 20 May 2021 19:25:07 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Thu, 20 May
 2021 19:25:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0022c459407-a28c-4a49-b2c0-2a7f320633b4,
 2C87984337330801490BFDABE922B5CE11A7A10A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 92.184.110.239
Subject: Re: [PATCH 07/31] powerpc/xive: Fix xive_irq_set_affinity for MSI
To: Thomas Gleixner <tglx@linutronix.de>, <linuxppc-dev@lists.ozlabs.org>
References: <20210430080407.4030767-1-clg@kaod.org>
 <20210430080407.4030767-8-clg@kaod.org>
 <87pmxt2g9o.ffs@nanos.tec.linutronix.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <939af90b-6bcf-0bee-4ae1-48d5ff532770@kaod.org>
Date: Thu, 20 May 2021 19:25:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87pmxt2g9o.ffs@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 664563d6-dde4-444c-ab91-4c8490b7eb60
X-Ovh-Tracer-Id: 11201296700085144541
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggv
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

On 5/14/21 10:48 PM, Thomas Gleixner wrote:
> On Fri, Apr 30 2021 at 10:03, Cédric Le Goater wrote:
>> The MSI affinity is automanaged and it can be set before starting the
>> associated IRQ.
>>
>> ( Should we simply remove the irqd_is_started() test ? )
> 
> If the hardware can handle it properly.
> 
> But see:
> 
>   cffb717ceb8e ("powerpc/xive: Ensure active irqd when setting affinity")

Thanks for digging. That's a patch from the early days of XIVE support. 

> which introduced that condition. It mutters something about migration of
> shutdown interrupts:
> 
>        [  123.053037264,3] XIVE[ IC 00  ] ISN 2 lead to invalid IVE !

The XIVE driver in OPAL is complaining.

Linux is trying to configure the target of HW IRQ number 2 but OPAL refuses
because it's invalid. The first 16 are reserved (like on Linux).

So it's another problem. 2 could be a value from an "interrupts" property,
giving the INTx number assigned to a PCI device or an OPAL event IRQ 
number leaked into the XIVE domain. Given the low Linux IRQ number that 
might be the latter. 

>        [   77.885859] xive: Error -6 reconfiguring irq 17
>        [   77.885862] IRQ17: set affinity failed(-6).
> 
> Not that I can decode that :)

A device name would help but you have guessed most of it ;)

> 
> Non-managed interrupts have the sequence:
> 
>       startup()
>       set_affinity()
> 
> which is historical and an earlier attempt to flip it caused havoc in
> some places.
> 
> With managed we needed to make sure that the affinity is set correctly
> right at start. So it needs to be done the other way round and it turned
> out that for MSI this works.
> 
> I have no idea, whether that might make the above issue reappear or
> not. If so, then we need some extra state to make it work.
> 
> The root cause which triggered the problem got fixed, so there should be
> no issue _if_ this was specifically related to that CPU unplug case.

I would vote for this option. I will simply remove the irqd_is_started() 
test which looks bogus and do some extra tests on all platforms.

Thanks,

C.


 
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index 96737938e8e3..3485baf9ec8c 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -710,7 +710,7 @@ static int xive_irq_set_affinity(struct irq_data *d,
>>  		return -EINVAL;
>>  
>>  	/* Don't do anything if the interrupt isn't started */
>> -	if (!irqd_is_started(d))
>> +	if (!irqd_is_started(d) && !irqd_affinity_is_managed(d))
>>  		return IRQ_SET_MASK_OK;
>>  
>>  	/*
> 
> Thanks,
> 
>         tglx
> 

