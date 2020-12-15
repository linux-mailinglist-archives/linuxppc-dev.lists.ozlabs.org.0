Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E52DAFC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 16:09:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwM9y2b9RzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 02:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.96.117; helo=1.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 6870 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Dec 2020 02:07:30 AEDT
Received: from 1.mo52.mail-out.ovh.net (1.mo52.mail-out.ovh.net
 [178.32.96.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwM7Q0hsxzDqFY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 02:07:26 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 56B63221A34;
 Tue, 15 Dec 2020 13:33:04 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 15 Dec
 2020 13:33:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0018ecf23da-3f7a-4d66-b472-983f194a5c08,
 183EAEFD93E47124B0E2BAA2234C33E21A9C0622) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] powerpc/vas: Fix IRQ name allocation
To: Haren Myneni <haren@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20201212142707.2102141-1-clg@kaod.org>
 <facf50fec946b5ee85f8151c4e539acf60cc149e.camel@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6d2e255d-cb16-4f28-b081-6fb7a97fcded@kaod.org>
Date: Tue, 15 Dec 2020 13:33:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <facf50fec946b5ee85f8151c4e539acf60cc149e.camel@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 347f26c3-f3e6-4454-a8a7-c3b1d41fb460
X-Ovh-Tracer-Id: 12465963768765844448
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohephhgrrhgvnheslhhinhhugidrihgsmhdrtghomh
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/15/20 11:56 AM, Haren Myneni wrote:
> On Sat, 2020-12-12 at 15:27 +0100, Cédric Le Goater wrote:
>> The VAS device allocates a generic interrupt to handle page faults
>> but
>> the IRQ name doesn't show under /proc. This is because it's on
>> stack. Allocate the name.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks for fixing.

I was wondering where those ^B interrupt numbers were coming from.

/proc/interrupts looks better now: 

     36:  ...   0  XIVE-IRQ 50331732 Edge      vas-6
     40:  ...   0  XIVE-IRQ 33554504 Edge      vas-4
     72:  ...   0  XIVE-IRQ 16777304 Edge      vas-2
    124:  ...   0  XIVE-IRQ      124 Edge      vas-0


> 
> Acked-by: Haren Myneni <haren@linux.ibm.com>
> 
>> ---
>>
>>  I didn't understand this part in init_vas_instance() :
>>
>> 	if (vinst->virq) {
>> 		rc = vas_irq_fault_window_setup(vinst);
>> 		/*
>> 		 * Fault window is used only for user space send
>> windows.
>> 		 * So if vinst->virq is NULL, tx_win_open returns
>> -ENODEV
>> 		 * for user space.
>> 		 */
>> 		if (rc)
>> 			vinst->virq = 0;
>> 	}
>>
>>  If the IRQ cannot be requested, the device probing should fail but
>>  it's not today. The use of 'vinst->virq' is suspicious.
> 
> VAS raises an interrupt only when NX sees fault on request buffers and
> faults can happen only for user space requests. So Fault window setup
> is needed for user space requests. For kernel requests, continue even
> if IRQ / fault_window_setup is failed. 
>
> When window open request is issued from user space, kernel returns
> -ENODEV if vinst->virq = 0 (means fault window setup is failed). 

It looks ok to deactivate a feature (page faulting for user space 
requests) if vas_setup_fault_window() fails but if the IRQ layer 
routine request_threaded_irq() fails, something is really wrong 
in the system and we should stop probing IMO.

We should probably move the IRQ request after allocating/mapping 
the XIVE IPI IRQ.

this test is always true : 

	if (vinst->virq) {
		rc = vas_irq_fault_window_setup(vinst);
	
since above, we did : 

	vinst->virq = irq_create_mapping(NULL, hwirq);
	if (!vinst->virq) {
		pr_err("Inst%d: Unable to map global irq %d\n",
				vinst->vas_id, hwirq);
		return -EINVAL;
	}

Cheers,

C.


> 
> 
>>
>>  arch/powerpc/platforms/powernv/vas.h |  1 +
>>  arch/powerpc/platforms/powernv/vas.c | 11 ++++++++---
>>  2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/vas.h
>> b/arch/powerpc/platforms/powernv/vas.h
>> index 70f793e8f6cc..c7db3190baca 100644
>> --- a/arch/powerpc/platforms/powernv/vas.h
>> +++ b/arch/powerpc/platforms/powernv/vas.h
>> @@ -340,6 +340,7 @@ struct vas_instance {
>>  	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
>>  	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
>>  
>> +	char *name;
>>  	char *dbgname;
>>  	struct dentry *dbgdir;
>>  };
>> diff --git a/arch/powerpc/platforms/powernv/vas.c
>> b/arch/powerpc/platforms/powernv/vas.c
>> index 598e4cd563fb..b65256a63e87 100644
>> --- a/arch/powerpc/platforms/powernv/vas.c
>> +++ b/arch/powerpc/platforms/powernv/vas.c
>> @@ -28,12 +28,10 @@ static DEFINE_PER_CPU(int, cpu_vas_id);
>>  
>>  static int vas_irq_fault_window_setup(struct vas_instance *vinst)
>>  {
>> -	char devname[64];
>>  	int rc = 0;
>>  
>> -	snprintf(devname, sizeof(devname), "vas-%d", vinst->vas_id);
>>  	rc = request_threaded_irq(vinst->virq, vas_fault_handler,
>> -				vas_fault_thread_fn, 0, devname,
>> vinst);
>> +				vas_fault_thread_fn, 0, vinst->name,
>> vinst);
>>  
>>  	if (rc) {
>>  		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
>> @@ -80,6 +78,12 @@ static int init_vas_instance(struct
>> platform_device *pdev)
>>  	if (!vinst)
>>  		return -ENOMEM;
>>  
>> +	vinst->name = kasprintf(GFP_KERNEL, "vas-%d", vasid);
>> +	if (!vinst->name) {
>> +		kfree(vinst);
>> +		return -ENOMEM;
>> +	}
>> +
>>  	INIT_LIST_HEAD(&vinst->node);
>>  	ida_init(&vinst->ida);
>>  	mutex_init(&vinst->mutex);
>> @@ -162,6 +166,7 @@ static int init_vas_instance(struct
>> platform_device *pdev)
>>  	return 0;
>>  
>>  free_vinst:
>> +	kfree(vinst->name);
>>  	kfree(vinst);
>>  	return -ENODEV;
>>  
> 

