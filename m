Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD04B33D3D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 13:28:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0CJ65Xrmz30R0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 23:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244; helo=10.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 10.mo52.mail-out.ovh.net (10.mo52.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0CHp03vmz30BH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 23:28:21 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6ACED250930;
 Tue, 16 Mar 2021 13:28:17 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Mar
 2021 13:28:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005fa0eac05-291b-4f37-9a1b-bb2b0861672f,
 F4745E3E32A08DF6AE8813652EB4480BB0CFD8A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20210312143154.3181109-1-clg@kaod.org>
 <20210316112811.GA2339179@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c64885a9-72d3-dcc3-c1b3-8cab5171ead2@kaod.org>
Date: Tue, 16 Mar 2021 13:28:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210316112811.GA2339179@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 12600d48-47d5-4bb7-86a0-8d77ae67ec7e
X-Ovh-Tracer-Id: 11844748498435672940
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeetfeejteefhfeuveethfduffeftdelvdeghfelhfeljeehheeuieevudeggefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/16/21 12:28 PM, Srikar Dronamraju wrote:
> * C?dric Le Goater <clg@kaod.org> [2021-03-12 15:31:54]:
> 
>> Initial commit 15863ff3b8da ("powerpc: Make chip-id information
>> available to userspace") introduce a cpu_to_chip_id() routine for the
>> PowerNV platform using the "ibm,chip-id" property to query the chip id
>> of a CPU. But PAPR does not specify such a property and the node id
>> query is broken.
>>
>> Use cpu_to_node() instead which guarantees to have a correct value on
>> all platforms, PowerNV an pSeries.
>>
>> Cc: Nathan Lynch <nathanl@linux.ibm.com>
>> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/include/asm/topology.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> (Sorry I somehow managed to mangle to-address. Hence resending this mail
> again)
> 
> While this looks good to me, @mpe had reservations on using nid as chip-id.
> https://lore.kernel.org/linuxppc-dev/87lfwhypv0.fsf@concordia.ellerman.id.au/t/#u

that was a different approach.

> He may be okay with using nid as a "virtual" package id in a pseries
> environment.

ibm,chip-id is only used in a couple of places in low level PowerNV
drivers. The CPU doesn't use this property. We should be fine on
all platforms.

> Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Thanks,

C.
 
> [---=| TOFU protection by t-prot: 24 lines snipped |=---]
> 
> --
> Thanks and Regards
> Srikar Dronamraju
> 
> 
>> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
>> index 3beeb030cd78..887c42a4e43d 100644
>> --- a/arch/powerpc/include/asm/topology.h
>> +++ b/arch/powerpc/include/asm/topology.h
>> @@ -123,7 +123,7 @@ static inline int cpu_to_coregroup_id(int cpu)
>>  #ifdef CONFIG_PPC64
>>  #include <asm/smp.h>
>>
>> -#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
>> +#define topology_physical_package_id(cpu)	(cpu_to_node(cpu))
>>
>>  #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
>>  #define topology_core_cpumask(cpu)	(cpu_cpu_mask(cpu))
>> --
>> 2.26.2
>>
> 
> --
> Thanks and Regards
> Srikar Dronamraju
> 

