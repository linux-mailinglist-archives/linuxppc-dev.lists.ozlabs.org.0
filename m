Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E37DA3315AE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 19:16:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvRPZ6bCWz3dF5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 05:16:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 316 seconds by postgrey-1.36 at boromir;
 Tue, 09 Mar 2021 05:16:34 AEDT
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvRPG160Cz30JB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 05:16:33 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id CB64D94AB641;
 Mon,  8 Mar 2021 19:11:12 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 8 Mar 2021
 19:11:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0066fef773a-d623-4034-86cb-6ba82b2e547e,
 A17EDF06126F97A0E0FDE8E4D4F69D2D407EF276) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 4/8] powerpc/xive: Simplify xive_core_debug_show()
To: Greg Kurz <groug@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-5-clg@kaod.org> <20210308190710.4dba0379@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <464b873b-b8d9-c656-fb72-365bfca9d8c6@kaod.org>
Date: Mon, 8 Mar 2021 19:11:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210308190710.4dba0379@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5e5c0e19-b90e-4659-b7c4-92daeb7c9f58
X-Ovh-Tracer-Id: 7548032976184576989
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddugedggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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

On 3/8/21 7:07 PM, Greg Kurz wrote:
> On Wed, 3 Mar 2021 18:48:53 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> Now that the IPI interrupt has its own domain, the checks on the HW
>> interrupt number XIVE_IPI_HW_IRQ and on the chip can be replaced by a
>> check on the domain.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> Shouldn't this have the following tags ?
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 930914b7d528 ("powerpc/xive: Add a debugfs file to dump internal XIVE state")

The next patch has because it removes the useless check on irq_data.
 
C.

> 
> Anyway,
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
>>  arch/powerpc/sysdev/xive/common.c | 18 ++++--------------
>>  1 file changed, 4 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index 678680531d26..7581cb12bb53 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -1579,17 +1579,14 @@ static void xive_debug_show_cpu(struct seq_file *m, int cpu)
>>  	seq_puts(m, "\n");
>>  }
>>  
>> -static void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
>> +static void xive_debug_show_irq(struct seq_file *m, struct irq_data *d)
>>  {
>> -	struct irq_chip *chip = irq_data_get_irq_chip(d);
>> +	unsigned int hw_irq = (unsigned int)irqd_to_hwirq(d);
>>  	int rc;
>>  	u32 target;
>>  	u8 prio;
>>  	u32 lirq;
>>  
>> -	if (!is_xive_irq(chip))
>> -		return;
>> -
>>  	rc = xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
>>  	if (rc) {
>>  		seq_printf(m, "IRQ 0x%08x : no config rc=%d\n", hw_irq, rc);
>> @@ -1627,16 +1624,9 @@ static int xive_core_debug_show(struct seq_file *m, void *private)
>>  
>>  	for_each_irq_desc(i, desc) {
>>  		struct irq_data *d = irq_desc_get_irq_data(desc);
>> -		unsigned int hw_irq;
>> -
>> -		if (!d)
>> -			continue;
>> -
>> -		hw_irq = (unsigned int)irqd_to_hwirq(d);
>>  
>> -		/* IPIs are special (HW number 0) */
>> -		if (hw_irq != XIVE_IPI_HW_IRQ)
>> -			xive_debug_show_irq(m, hw_irq, d);
>> +		if (d->domain == xive_irq_domain)
>> +			xive_debug_show_irq(m, d);
>>  	}
>>  	return 0;
>>  }
> 

