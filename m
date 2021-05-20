Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181838ADDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 14:18:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm80D38NTz30JY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:18:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 488 seconds by postgrey-1.36 at boromir;
 Thu, 20 May 2021 22:18:00 AEST
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm7zr32Mpz2xvG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 22:17:59 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9CBFAA60B8ED;
 Thu, 20 May 2021 14:09:43 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Thu, 20 May
 2021 14:09:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006626da0d7-f5c3-497a-ba31-8c8936d191c4,
 2C87984337330801490BFDABE922B5CE11A7A10A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 176.145.65.252
Subject: Re: [PATCH 15/31] KVM: PPC: Book3S HV: XIVE: Fix mapping of
 passthrough interrupts
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20210430080407.4030767-1-clg@kaod.org>
 <20210430080407.4030767-16-clg@kaod.org>
 <87im3l2g48.ffs@nanos.tec.linutronix.de> <878s4g5lfs.wl-maz@kernel.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <638e0250-b8c3-33a4-1b88-02d29d7a80b0@kaod.org>
Date: Thu, 20 May 2021 14:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <878s4g5lfs.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: afaecca4-bc4a-4e53-bb12-1bd74470d8e1
X-Ovh-Tracer-Id: 5874664239050492835
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmrgiisehkvghrnhgvlhdrohhrgh
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

On 5/15/21 12:40 PM, Marc Zyngier wrote:
> On Fri, 14 May 2021 21:51:51 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> On Fri, Apr 30 2021 at 10:03, Cédric Le Goater wrote:
>>
>> CC: +Marc
> 
> Thanks Thomas.
> 
>>
>>> PCI MSI interrupt numbers are now mapped in a PCI-MSI domain but the
>>> underlying calls handling the passthrough of the interrupt in the
>>> guest need a number in the XIVE IRQ domain.
>>>
>>> Use the IRQ data mapped in the XIVE IRQ domain and not the one in the
>>> PCI-MSI domain.
>>>
>>> Exporting irq_get_default_host() might not be the best solution.
>>>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Paul Mackerras <paulus@ozlabs.org>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  arch/powerpc/kvm/book3s_xive.c | 3 ++-
>>>  kernel/irq/irqdomain.c         | 1 +
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
>>> index 3a7da42bed57..81b9f4fc3978 100644
>>> --- a/arch/powerpc/kvm/book3s_xive.c
>>> +++ b/arch/powerpc/kvm/book3s_xive.c
>>> @@ -861,7 +861,8 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned long guest_irq,
>>>  	struct kvmppc_xive *xive = kvm->arch.xive;
>>>  	struct kvmppc_xive_src_block *sb;
>>>  	struct kvmppc_xive_irq_state *state;
>>> -	struct irq_data *host_data = irq_get_irq_data(host_irq);
>>> +	struct irq_data *host_data =
>>> +		irq_domain_get_irq_data(irq_get_default_host(), host_irq);
>>>  	unsigned int hw_irq = (unsigned int)irqd_to_hwirq(host_data);
>>>  	u16 idx;
>>>  	u8 prio;
>>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>>> index d10ab1d689d5..8a073d1ce611 100644
>>> --- a/kernel/irq/irqdomain.c
>>> +++ b/kernel/irq/irqdomain.c
>>> @@ -481,6 +481,7 @@ struct irq_domain *irq_get_default_host(void)
>>>  {
>>>  	return irq_default_domain;
>>>  }
>>> +EXPORT_SYMBOL_GPL(irq_get_default_host);
>>>  
>>>  static void irq_domain_clear_mapping(struct irq_domain *domain,
>>>  				     irq_hw_number_t hwirq)
>>
> 
> Is there any reason why we should add more users of the "default host"
> fallback? I would really hope that new code would actually track their
> irqdomain in a more fine-grained way, specially when using the
> hierarchical MSi setup, which seems to be the goal of this series.
> 
> Don't you have enough topology information that you can make use of to
> correctly assign a domain identifier (of_node or otherwise)?


PHB have a node ID and this is taken into account by the MSI domains.
However, one thing PPC (pSeries and PowerNV) lacks is an interrupt
controller node per chip which makes the IRQ domain hierarchy a bit
incomplete.

It will be difficult to change the pseries platform (VM) since the
PAPR architecture only specifies a single interrupt domain for the
whole machine. The PowerNV platform is designed in a similar way
(because the pseries platform preexisted) and the OPAL firmware hides
the interrupt controllers of each chip behind a single node. The
underlying topology is encoded in HW interrupt numbers. This is a bit
unfortunate since some PowerNV Linux drivers need that information.
Rewriting a new interrupt controller driver in OPAL would be a lot of
work and it won't happen any time soon. But it's feasible.

All that to say that we have a default IRQ domain on these platforms
and not one  IRQ domain per node/chip.

Also, there are two types of interrupt models to consider: the older
XICS (for P8/P7 processors) and the newer XIVE (for P9/P10).

Regarding MSI passthrough, the XIVE side is simpler (I can't believe I
am saying that, XIVE is anything but simple) and I think we can rework
kvmppc_xive_set_mapped() and xive_irq_set_vcpu_affinity() to remove
the IRQ domain bypass. 

XICS adds optimizations for passthrough done in real mode:

 e3c13e56a471 ("KVM: PPC: Book3S HV: Handle passthrough interrupts in guest")
 5d375199ea96 ("KVM: PPC: Book3S HV: Set server for passed-through interrupts")

That's a ~10% bandwidth improvements on CX5 adapters, it's good to
have but they are much more complex to rework. I took some time to
look for a solution for these because of the use of irq_to_desc() and
the use of the host IRQ in the XICS domain which are ugly but nothing
comes to mind yet.

For the time being, I think these changes bypassing the IRQ domains
are fine. I need some more time to mature an alternative.

Thanks,

C. 

