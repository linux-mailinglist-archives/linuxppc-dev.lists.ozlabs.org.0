Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A8D2D46A5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 17:23:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crj5n1GhVzDqYd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 03:23:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.45.231; helo=8.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 852 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Dec 2020 03:21:58 AEDT
Received: from 8.mo51.mail-out.ovh.net (8.mo51.mail-out.ovh.net
 [46.105.45.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crj466cPqzDqjR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 03:21:56 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 0EAEC23FC7E;
 Wed,  9 Dec 2020 17:04:18 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 17:04:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0054a016ddd-0b66-4ae3-8e71-992049e126c4,
 F89B705946B58AFC48376D7414C518838B559611) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 07/13] powerpc/xive: Add a debug_show handler to the XIVE
 irq_domain
To: Greg Kurz <groug@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-8-clg@kaod.org> <20201209165035.65c8a731@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fb99c73b-3f70-9077-df8d-0fd406427df4@kaod.org>
Date: Wed, 9 Dec 2020 17:04:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201209165035.65c8a731@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ae50762b-4258-432e-9ce0-fc2448c05788
X-Ovh-Tracer-Id: 17690420811863264154
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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

On 12/9/20 4:50 PM, Greg Kurz wrote:
> On Tue, 8 Dec 2020 16:11:18 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> Full state of the Linux interrupt descriptors can be dumped under
>> debugfs when compiled with CONFIG_GENERIC_IRQ_DEBUGFS. Add support for
>> the XIVE interrupt controller.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/sysdev/xive/common.c | 58 +++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index 721617f0f854..411cba12d73b 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -1303,11 +1303,69 @@ static int xive_irq_domain_match(struct irq_domain *h, struct device_node *node,
>>  	return xive_ops->match(node);
>>  }
>>  
>> +#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
>> +static const char * const esb_names[] = { "RESET", "OFF", "PENDING", "QUEUED" };
>> +
>> +static const struct {
>> +	u64  mask;
>> +	char *name;
>> +} xive_irq_flags[] = {
>> +	{ XIVE_IRQ_FLAG_STORE_EOI, "STORE_EOI" },
>> +	{ XIVE_IRQ_FLAG_LSI,       "LSI"       },
> 
>> +	{ XIVE_IRQ_FLAG_SHIFT_BUG, "SHIFT_BUG" },
>> +	{ XIVE_IRQ_FLAG_MASK_FW,   "MASK_FW"   },
>> +	{ XIVE_IRQ_FLAG_EOI_FW,    "EOI_FW"    },
> 
> If seems that you don't even need these ^^ if you move this patch after
> patch 11 actually.>
> 
>> +	{ XIVE_IRQ_FLAG_H_INT_ESB, "H_INT_ESB" },
>> +	{ XIVE_IRQ_FLAG_NO_EOI,    "NO_EOI"    },
>> +};
>> +
>> +static void xive_irq_domain_debug_show(struct seq_file *m, struct irq_domain *d,
>> +				       struct irq_data *irqd, int ind)
>> +{
>> +	struct xive_irq_data *xd;
>> +	u64 val;
>> +	int i;
>> +
>> +	/* No IRQ domain level information. To be done */
>> +	if (!irqd)
>> +		return;
>> +
>> +	if (!is_xive_irq(irq_data_get_irq_chip(irqd)))
> 
> Wouldn't it be a bug to get anything else but the XIVE irqchip here ?

no.

> WARN_ON_ONCE() ?

XIVE IPIs are in the same domain but have a different chip. 

C.
 
>> +		return;
>> +
>> +	seq_printf(m, "%*sXIVE:\n", ind, "");
>> +	ind++;
>> +
>> +	xd = irq_data_get_irq_handler_data(irqd);
>> +	if (!xd) {
>> +		seq_printf(m, "%*snot assigned\n", ind, "");
>> +		return;
>> +	}
>> +
>> +	val = xive_esb_read(xd, XIVE_ESB_GET);
>> +	seq_printf(m, "%*sESB:      %s\n", ind, "", esb_names[val & 0x3]);
>> +	seq_printf(m, "%*sPstate:   %s %s\n", ind, "", xd->stale_p ? "stale" : "",
>> +		   xd->saved_p ? "saved" : "");
>> +	seq_printf(m, "%*sTarget:   %d\n", ind, "", xd->target);
>> +	seq_printf(m, "%*sChip:     %d\n", ind, "", xd->src_chip);
>> +	seq_printf(m, "%*sTrigger:  0x%016llx\n", ind, "", xd->trig_page);
>> +	seq_printf(m, "%*sEOI:      0x%016llx\n", ind, "", xd->eoi_page);
>> +	seq_printf(m, "%*sFlags:    0x%llx\n", ind, "", xd->flags);
>> +	for (i = 0; i < ARRAY_SIZE(xive_irq_flags); i++) {
>> +		if (xd->flags & xive_irq_flags[i].mask)
>> +			seq_printf(m, "%*s%s\n", ind + 12, "", xive_irq_flags[i].name);
>> +	}
>> +}
>> +#endif
>> +
>>  static const struct irq_domain_ops xive_irq_domain_ops = {
>>  	.match = xive_irq_domain_match,
>>  	.map = xive_irq_domain_map,
>>  	.unmap = xive_irq_domain_unmap,
>>  	.xlate = xive_irq_domain_xlate,
>> +#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
>> +	.debug_show = xive_irq_domain_debug_show,
>> +#endif
>>  };
>>  
>>  static void __init xive_init_host(struct device_node *np)
> 

