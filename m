Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F951332B05
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 16:49:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw0583GWzz3cYP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:49:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw04q5kz5z30gd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:49:14 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 4D97E94F6D88;
 Tue,  9 Mar 2021 16:49:12 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 16:49:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0036f6670b3-846d-474c-b0cf-6acf8e7f409b,
 8C9061D2296CFEABF2D52E5F4F8F8063DC0B97BF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 7/8] powerpc/xive: Fix xmon command "dxi"
To: Greg Kurz <groug@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-8-clg@kaod.org> <20210309112325.7b161cc7@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d2d9078e-1cc6-c0e8-2d35-36e34cd588a8@kaod.org>
Date: Tue, 9 Mar 2021 16:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210309112325.7b161cc7@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a392fa72-ff38-4080-a795-55432c91a139
X-Ovh-Tracer-Id: 11022560089089412003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/9/21 11:23 AM, Greg Kurz wrote:
> On Wed, 3 Mar 2021 18:48:56 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> When under xmon, the "dxi" command dumps the state of the XIVE
>> interrupts. If an interrupt number is specified, only the state of
>> the associated XIVE interrupt is dumped. This form of the command
>> lacks an irq_data parameter which is nevertheless used by
>> xmon_xive_get_irq_config(), leading to an xmon crash.
>>
>> Fix that by doing a lookup in the system IRQ mapping to query the IRQ
>> descriptor data. Invalid interrupt numbers, or not belonging to the
>> XIVE IRQ domain, OPAL event interrupt number for instance, should be
>> caught by the previous query done at the firmware level.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Fixes: 97ef27507793 ("powerpc/xive: Fix xmon support on the PowerNV platform")
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> I've tested this in a KVM guest and it seems to do the job.
> 
> 6:mon> dxi 1201
> IRQ 0x00001201 : target=0xfffffc00 prio=ff lirq=0x0 flags= LH PQ=-Q
> 
> Bad HW irq numbers are filtered by the hypervisor:
> 
> 6:mon> dxi bad
> [  696.390577] xive: H_INT_GET_SOURCE_CONFIG lisn=2989 failed -55
> IRQ 0x00000bad : no config rc=-6
> 
> Note that this also allows to show IPIs:
> 
> 6:mon> dxi 0
> IRQ 0x00000000 : target=0x0 prio=06 lirq=0x10 
> 
> This is a bit inconsistent with output of the 0-argument form of "dxi",

It's an hidden feature ! :) 

Yes. You can query at the FW level the configuration of any valid HW 
interrupt number where as "dxi" without an argument only loops on the 
XIVE IRQ domain which does not include the XIVE CPU IPIs which are 
special. You should "dxa" for these. 

> which filters them out for a reason that isn't obvious to me. 

For historical reason. XIVE support for PowerNV was the first to reach 
Linux. If you run the same xmon commands on a PowerNV machine (you could 
use QEMU), the ouput is different. it has more low level details.

> No big deal though, this should be addressed in another patch anyway.

We could simplify the xmon helpers to be sync with the debugfs one
and the QEMU/KVM "info pic" command. I agree.

Thanks,

C. 


> Reviewed-and-tested-by: Greg Kurz <groug@kaod.org>
> 
>>  arch/powerpc/sysdev/xive/common.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index f6b7b15bbb3a..8eefd152b947 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -255,17 +255,20 @@ notrace void xmon_xive_do_dump(int cpu)
>>  	xmon_printf("\n");
>>  }
>>  
>> +static struct irq_data *xive_get_irq_data(u32 hw_irq)
>> +{
>> +	unsigned int irq = irq_find_mapping(xive_irq_domain, hw_irq);
>> +
>> +	return irq ? irq_get_irq_data(irq) : NULL;
>> +}
>> +
>>  int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
>>  {
>> -	struct irq_chip *chip = irq_data_get_irq_chip(d);
>>  	int rc;
>>  	u32 target;
>>  	u8 prio;
>>  	u32 lirq;
>>  
>> -	if (!is_xive_irq(chip))
>> -		return -EINVAL;
>> -
>>  	rc = xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
>>  	if (rc) {
>>  		xmon_printf("IRQ 0x%08x : no config rc=%d\n", hw_irq, rc);
>> @@ -275,6 +278,9 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
>>  	xmon_printf("IRQ 0x%08x : target=0x%x prio=%02x lirq=0x%x ",
>>  		    hw_irq, target, prio, lirq);
>>  
>> +	if (!d)
>> +		d = xive_get_irq_data(hw_irq);
>> +
>>  	if (d) {
>>  		struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
>>  		u64 val = xive_esb_read(xd, XIVE_ESB_GET);
> 

