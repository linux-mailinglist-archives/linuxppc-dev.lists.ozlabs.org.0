Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7749332ABB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 16:40:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvztV6z8Jz3cXX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:40:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvzt800Swz30NY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:39:59 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 4F0DA94F6174;
 Tue,  9 Mar 2021 16:39:56 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 16:39:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00113ee808b-8367-4560-b0e5-dc772e871015,
 8C9061D2296CFEABF2D52E5F4F8F8063DC0B97BF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 4/8] powerpc/xive: Simplify xive_core_debug_show()
To: Greg Kurz <groug@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-5-clg@kaod.org> <20210308190710.4dba0379@bahia.lan>
 <464b873b-b8d9-c656-fb72-365bfca9d8c6@kaod.org>
 <20210309101339.1b1e2d4e@bahia.lan> <20210309104220.663840a2@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <204848f7-1aa7-3542-abad-292ce7b5349c@kaod.org>
Date: Tue, 9 Mar 2021 16:39:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210309104220.663840a2@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 601bc60f-30b9-4485-9e15-473cd3504fd5
X-Ovh-Tracer-Id: 10865778527815306138
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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

On 3/9/21 10:42 AM, Greg Kurz wrote:
> On Tue, 9 Mar 2021 10:13:39 +0100
> Greg Kurz <groug@kaod.org> wrote:
> 
>> On Mon, 8 Mar 2021 19:11:11 +0100
>> Cédric Le Goater <clg@kaod.org> wrote:
>>
>>> On 3/8/21 7:07 PM, Greg Kurz wrote:
>>>> On Wed, 3 Mar 2021 18:48:53 +0100
>>>> Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>>> Now that the IPI interrupt has its own domain, the checks on the HW
>>>>> interrupt number XIVE_IPI_HW_IRQ and on the chip can be replaced by a
>>>>> check on the domain.
>>>>>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>> ---
>>>>
>>>> Shouldn't this have the following tags ?
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> Fixes: 930914b7d528 ("powerpc/xive: Add a debugfs file to dump internal XIVE state")
>>>
>>> The next patch has because it removes the useless check on irq_data.
>>>  
>>
>> Ok I get it. This report isn't about an actual crash. Just a false
>> positive because of the not needed check in the caller.
>>
> 
> Hrm... I meant because of the check in xive_debug_show_irq(). On the
> contrary, the check removed by this patch in xive_core_debug_show()
> was rather an explicit hint that xive_debug_show_irq() couldn't be
> called with d being NULL.

yes. irq_desc_get_irq_data() does not return a NULL value and 
xive_debug_show_irq() is only called from the for_each_irq_desc()
loop. 


C.


> 
>>> C.
>>>
>>>>
>>>> Anyway,
>>>>
>>>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>>>
>>>>>  arch/powerpc/sysdev/xive/common.c | 18 ++++--------------
>>>>>  1 file changed, 4 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>>>>> index 678680531d26..7581cb12bb53 100644
>>>>> --- a/arch/powerpc/sysdev/xive/common.c
>>>>> +++ b/arch/powerpc/sysdev/xive/common.c
>>>>> @@ -1579,17 +1579,14 @@ static void xive_debug_show_cpu(struct seq_file *m, int cpu)
>>>>>  	seq_puts(m, "\n");
>>>>>  }
>>>>>  
>>>>> -static void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struct irq_data *d)
>>>>> +static void xive_debug_show_irq(struct seq_file *m, struct irq_data *d)
>>>>>  {
>>>>> -	struct irq_chip *chip = irq_data_get_irq_chip(d);
>>>>> +	unsigned int hw_irq = (unsigned int)irqd_to_hwirq(d);
>>>>>  	int rc;
>>>>>  	u32 target;
>>>>>  	u8 prio;
>>>>>  	u32 lirq;
>>>>>  
>>>>> -	if (!is_xive_irq(chip))
>>>>> -		return;
>>>>> -
>>>>>  	rc = xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
>>>>>  	if (rc) {
>>>>>  		seq_printf(m, "IRQ 0x%08x : no config rc=%d\n", hw_irq, rc);
>>>>> @@ -1627,16 +1624,9 @@ static int xive_core_debug_show(struct seq_file *m, void *private)
>>>>>  
>>>>>  	for_each_irq_desc(i, desc) {
>>>>>  		struct irq_data *d = irq_desc_get_irq_data(desc);
>>>>> -		unsigned int hw_irq;
>>>>> -
>>>>> -		if (!d)
>>>>> -			continue;
>>>>> -
>>>>> -		hw_irq = (unsigned int)irqd_to_hwirq(d);
>>>>>  
>>>>> -		/* IPIs are special (HW number 0) */
>>>>> -		if (hw_irq != XIVE_IPI_HW_IRQ)
>>>>> -			xive_debug_show_irq(m, hw_irq, d);
>>>>> +		if (d->domain == xive_irq_domain)
>>>>> +			xive_debug_show_irq(m, d);
>>>>>  	}
>>>>>  	return 0;
>>>>>  }
>>>>
>>>
>>
> 

