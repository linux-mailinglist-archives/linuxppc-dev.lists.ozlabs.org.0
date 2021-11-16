Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966984534BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 15:57:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htq0m3XGvz2yKF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 01:57:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244;
 helo=10.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Htq0H1ct6z2xtK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 01:57:02 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 06FE9210C8;
 Tue, 16 Nov 2021 14:49:15 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 15:49:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001cbb67def-6dd2-4b5e-b908-92d0c411f594,
 BFAEB7FE3C4E2C4D96001007C3BA12B7689A693E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <bcc9f90d-1ba1-6814-960c-e9205c9b2c85@kaod.org>
Date: Tue, 16 Nov 2021 15:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc/xive: Change IRQ domain to a tree domain
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
References: <20211116134022.420412-1-clg@kaod.org>
 <20211116152343.782c687c@bahia>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211116152343.782c687c@bahia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 04f44e8b-7443-4b51-9fb3-50cbd988cafb
X-Ovh-Tracer-Id: 14189435051388472227
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/16/21 15:23, Greg Kurz wrote:
> On Tue, 16 Nov 2021 14:40:22 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> Commit 4f86a06e2d6e ("irqdomain: Make normal and nomap irqdomains
>> exclusive") introduced an IRQ_DOMAIN_FLAG_NO_MAP flag to isolate the
>> 'nomap' domains still in use under the powerpc arch. With this new
>> flag, the revmap_tree of the IRQ domain is not used anymore. This
>> change broke the support of shared LSIs [1] in the XIVE driver because
>> it was relying on a lookup in the revmap_tree to query previously
>> mapped interrupts. Linux now creates two distinct IRQ mappings on the
>> same HW IRQ which can lead to unexpected behavior in the drivers.
>>
>> The XIVE IRQ domain is not a direct mapping domain and its HW IRQ
>> interrupt number space is rather large : 1M/socket on POWER9 and
>> POWER10, change the XIVE driver to use a 'tree' domain type instead.
>>
>> [1] For instance, a linux KVM guest with virtio-rng and virtio-balloon
>>      devices.
>>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: stable@vger.kernel.org # v5.14+
>> Fixes: 4f86a06e2d6e ("irqdomain: Make normal and nomap irqdomains exclusive")
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
> 
> Tested-by: Greg Kurz <groug@kaod.org>
> 
> with a KVM guest + virtio-rng + virtio-balloon on a POWER9 host.

Did you test on a 5.14 backport or mainline ?

I am asking because a large change adding support for MSI domains
to XIVE was merged in 5.15.

Thanks,

C.


> 
>>   Marc,
>>
>>   The Fixes tag is there because the patch in question revealed that
>>   something was broken in XIVE. genirq is not in cause. However, I
>>   don't know for PS3 and Cell. May be less critical for now.
>>   
>>   arch/powerpc/sysdev/xive/common.c | 3 +--
>>   arch/powerpc/sysdev/xive/Kconfig  | 1 -
>>   2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index fed6fd16c8f4..9d0f0fe25598 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -1536,8 +1536,7 @@ static const struct irq_domain_ops xive_irq_domain_ops = {
>>   
>>   static void __init xive_init_host(struct device_node *np)
>>   {
>> -	xive_irq_domain = irq_domain_add_nomap(np, XIVE_MAX_IRQ,
>> -					       &xive_irq_domain_ops, NULL);
>> +	xive_irq_domain = irq_domain_add_tree(np, &xive_irq_domain_ops, NULL);
>>   	if (WARN_ON(xive_irq_domain == NULL))
>>   		return;
>>   	irq_set_default_host(xive_irq_domain);
>> diff --git a/arch/powerpc/sysdev/xive/Kconfig b/arch/powerpc/sysdev/xive/Kconfig
>> index 97796c6b63f0..785c292d104b 100644
>> --- a/arch/powerpc/sysdev/xive/Kconfig
>> +++ b/arch/powerpc/sysdev/xive/Kconfig
>> @@ -3,7 +3,6 @@ config PPC_XIVE
>>   	bool
>>   	select PPC_SMP_MUXED_IPI
>>   	select HARDIRQS_SW_RESEND
>> -	select IRQ_DOMAIN_NOMAP
>>   
>>   config PPC_XIVE_NATIVE
>>   	bool
> 

