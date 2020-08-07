Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4CD23EB28
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 12:04:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNLYj1x4WzDqwY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 20:04:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNLWn5vP4zDqvn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 20:02:43 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.189])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BFC874E006D3;
 Fri,  7 Aug 2020 12:02:37 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 7 Aug 2020
 12:02:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0022d3d0bfb-de3a-4c3b-84c4-7ce737f420c9,
 9C6B65F6CFD3D723D723CC07BEDAC6F805E88D1E) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 2/2] powerpc/pci: unmap all interrupts when a PHB is
 removed
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200617162938.743439-1-clg@kaod.org>
 <20200617162938.743439-3-clg@kaod.org>
 <5d5e128d-ac5f-1003-0b3f-3017c612e1ea@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9ccdd46e-4afb-3e86-07ef-e9506ecf0388@kaod.org>
Date: Fri, 7 Aug 2020 12:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5d5e128d-ac5f-1003-0b3f-3017c612e1ea@ozlabs.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 00f11dd9-bebd-4dc3-a985-fb0ccb8d39a5
X-Ovh-Tracer-Id: 2791387344582904800
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedvgddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrihhksehoiihlrggsshdrrhhu
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/7/20 8:01 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 18/06/2020 02:29, Cédric Le Goater wrote:
>> Some PCI adapters, like GPUs, use the "interrupt-map" property to
>> describe interrupt mappings other than the legacy INTx interrupts.
>> There can be more than 4 mappings.
>>
>> To clear all interrupts when a PHB is removed, we need to increase the
>> 'irq_map' array in which mappings are recorded. Compute the number of
>> interrupt mappings from the "interrupt-map" property and allocate a
>> bigger 'irq_map' array.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/kernel/pci-common.c | 49 +++++++++++++++++++++++++++++++-
>>  1 file changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
>> index 515480a4bac6..deb831f0ae13 100644
>> --- a/arch/powerpc/kernel/pci-common.c
>> +++ b/arch/powerpc/kernel/pci-common.c
>> @@ -353,9 +353,56 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
>>  	return NULL;
>>  }
>>  
>> +/*
>> + * Assumption is made on the interrupt parent. All interrupt-map
>> + * entries are considered to have the same parent.
>> + */
>> +static int pcibios_irq_map_count(struct pci_controller *phb)
> 
> I wonder if
> int of_irq_count(struct device_node *dev)
> could work here too. If it does not, then never mind.

I wished it would, but no.

> Other than that, the only other comment is - merge this one into 1/2 as
> 1/2 alone won't properly fix the problem but it may look like that it does:
> 
> for phyp, the test machine just happens to have 4 entries in the map but
> this is the phyp implementation detail;

yes
 
> for qemu, there are more but we only unregister 4 but kvm does not care
> in general so it is ok which is also implementation detail;
>
> and 2/2 just makes these details not matter. Thanks,

OK. It will ease backport. Sending a v2.

Thanks for the review Alexey !

C.
 
> 
> 
>> +{
>> +	const __be32 *imap;
>> +	int imaplen;
>> +	struct device_node *parent;
>> +	u32 intsize, addrsize, parintsize, paraddrsize;
>> +
>> +	if (of_property_read_u32(phb->dn, "#interrupt-cells", &intsize))
>> +		return 0;
>> +	if (of_property_read_u32(phb->dn, "#address-cells", &addrsize))
>> +		return 0;
>> +
>> +	imap = of_get_property(phb->dn, "interrupt-map", &imaplen);
>> +	if (!imap) {
>> +		pr_debug("%pOF : no interrupt-map\n", phb->dn);
>> +		return 0;
>> +	}
>> +	imaplen /= sizeof(u32);
>> +	pr_debug("%pOF : imaplen=%d\n", phb->dn, imaplen);
>> +
>> +	if (imaplen < (addrsize + intsize + 1))
>> +		return 0;
>> +
>> +	imap += intsize + addrsize;
>> +	parent = of_find_node_by_phandle(be32_to_cpup(imap));
>> +	if (!parent) {
>> +		pr_debug("%pOF : no imap parent found !\n", phb->dn);
>> +		return 0;
>> +	}
>> +
>> +	if (of_property_read_u32(parent, "#interrupt-cells", &parintsize)) {
>> +		pr_debug("%pOF : parent lacks #interrupt-cells!\n", phb->dn);
>> +		return 0;
>> +	}
>> +
>> +	if (of_property_read_u32(parent, "#address-cells", &paraddrsize))
>> +		paraddrsize = 0;
>> +
>> +	return imaplen / (addrsize + intsize + 1 + paraddrsize + parintsize);
>> +}
>> +
>>  static void pcibios_irq_map_init(struct pci_controller *phb)
>>  {
>> -	phb->irq_count = PCI_NUM_INTX;
>> +	phb->irq_count = pcibios_irq_map_count(phb);
>> +	if (phb->irq_count < PCI_NUM_INTX)
>> +		phb->irq_count = PCI_NUM_INTX;
>>  
>>  	pr_debug("%pOF : interrupt map #%d\n", phb->dn, phb->irq_count);
>>  
>>
> 

