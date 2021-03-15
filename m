Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF8733C16F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 17:16:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzhPd6Vn2z30D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 03:16:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.255.19; helo=2.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 2.mo51.mail-out.ovh.net (2.mo51.mail-out.ovh.net
 [178.33.255.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzhPJ5Fjbz2yRg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:16:18 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id BF667270A7E;
 Mon, 15 Mar 2021 17:16:15 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 17:16:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00316cc062d-37cb-4ab2-937a-4f7af29ee175,
 6ECECE93D947A1E75FB970C6684F7B2999F5CB5C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210312143154.3181109-1-clg@kaod.org>
 <bd0c948c-64f8-cf64-6d30-b9167b6a7629@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <09b298ce-a566-0542-0aa8-8c4e5248bda6@kaod.org>
Date: Mon, 15 Mar 2021 17:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bd0c948c-64f8-cf64-6d30-b9167b6a7629@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bcaf5aad-f8d8-4a92-9159-987ef8a8c915
X-Ovh-Tracer-Id: 9822069314311916396
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/15/21 4:12 PM, Daniel Henrique Barboza wrote:
> 
> 
> On 3/12/21 11:31 AM, Cédric Le Goater wrote:
>> Initial commit 15863ff3b8da ("powerpc: Make chip-id information
>> available to userspace") introduce a cpu_to_chip_id() routine for the
>> PowerNV platform using the "ibm,chip-id" property to query the chip id
>> of a CPU. But PAPR does not specify such a property and the node id
>> query is broken.
>>
>> Use cpu_to_node() instead which guarantees to have a correct value on
>> all platforms, PowerNV an pSeries.
> 
> It is worth mentioning that that this patch will change how
> topology_physical_package_id() represents in a QEMU guest. Right now, ibm,chip-id
> in QEMU is matching the socket-id. After this patch, topology_physical_package_id()
> will now match the NUMA id of the CPU.

yes. I should have added some more background. 

LPARs are impacted by the use of ibm,chip-id because the property 
does not exist under PowerVM and the topology-id in sysfs is always
-1 even if NUMA nodes are defined.

Under QEMU/KVM, ibm,chip-id is badly calculated when using uncommon 
SMT configuration. This leads to a bogus topology-id value being 
exported in sysfs.

The use of cpu_to_node() guarantees to have a correct NUMA node id 
under both environments QEMU/KVM and PowerVM.

On the PowerNV platform, the numa node id returned by cpu_to_node() 
is computed from the "ibm,associativity" property of the CPU. Its 
value is built from the OPAL chip id and is equivalent to ibm,chip-id. 

May be I should rephrase the commit log in a v2 ?

C.

 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
>>
>> Cc: Nathan Lynch <nathanl@linux.ibm.com>
>> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   arch/powerpc/include/asm/topology.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
>> index 3beeb030cd78..887c42a4e43d 100644
>> --- a/arch/powerpc/include/asm/topology.h
>> +++ b/arch/powerpc/include/asm/topology.h
>> @@ -123,7 +123,7 @@ static inline int cpu_to_coregroup_id(int cpu)
>>   #ifdef CONFIG_PPC64
>>   #include <asm/smp.h>
>>   -#define topology_physical_package_id(cpu)    (cpu_to_chip_id(cpu))
>> +#define topology_physical_package_id(cpu)    (cpu_to_node(cpu))
>>     #define topology_sibling_cpumask(cpu)    (per_cpu(cpu_sibling_map, cpu))
>>   #define topology_core_cpumask(cpu)    (cpu_cpu_mask(cpu))
>>

