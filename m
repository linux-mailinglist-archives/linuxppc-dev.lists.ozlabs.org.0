Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D263CD03D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 11:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSx2k6j5sz3bYx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 19:13:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EzCuWwj2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EzCuWwj2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSx2D5hpwz2yMg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 19:12:36 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J94GGX174442; Mon, 19 Jul 2021 05:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yShCcA3YVfen3fYq7Q43GUlmxUw0jLv42T1Lv3ceu6o=;
 b=EzCuWwj2oV5+aXC1REui9wNl73fot+T8wqwQvjesdq0OWMXZOMZXk5gYffcmAQRFkeXe
 a3KYDfVXxK0EpCeP555ANhGMNVZoTkHZow3a2+gMkxCAY1ynKeoG8qPxH3XrUHuSKKlo
 py67/zrHdVtbmeWyv6LS/ZMD1OEFeoEhc1oEhEV20vBjK4nj67bdkfn3HYD3SDA+CHLn
 eEf9R2P1PXPMIuemgjsTzSesIbxlyH3uSUI+Rdx99mez1f48Yt8jOE7PmDMdubcIhRwj
 3g30psAaCaawhRxN2Gub0GkAoG2XBOdjYtHaetAtQotEus4Y2O+Azvu0K0CRltls+jzW bA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39w4afv03n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 05:12:31 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16J999lS026047;
 Mon, 19 Jul 2021 09:12:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 39vng708gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 09:12:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16J9A5EU37945672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 09:10:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3E62AE056;
 Mon, 19 Jul 2021 09:12:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69EF3AE04D;
 Mon, 19 Jul 2021 09:12:26 +0000 (GMT)
Received: from pomme.local (unknown [9.145.1.33])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 09:12:26 +0000 (GMT)
Subject: Re: [PATCH v2] ppc64/numa: consider the max numa node for migratable
 LPAR
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
References: <20210511073136.17795-1-ldufour@linux.ibm.com>
Message-ID: <f789661e-c361-74c3-1e1e-a604692a363d@linux.ibm.com>
Date: Mon, 19 Jul 2021 11:12:23 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210511073136.17795-1-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jw8LrHtRJ0Or7DyxlRReaOYotIAFiWsd
X-Proofpoint-ORIG-GUID: Jw8LrHtRJ0Or7DyxlRReaOYotIAFiWsd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190050
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Is there a way to get that patch in 5.14?

Thanks,
Laurent.

Le 11/05/2021 à 09:31, Laurent Dufour a écrit :
> When a LPAR is migratable, we should consider the maximum possible NUMA
> node instead the number of NUMA node from the actual system.
> 
> The DT property 'ibm,current-associativity-domains' is defining the maximum
> number of nodes the LPAR can see when running on that box. But if the LPAR
> is being migrated on another box, it may seen up to the nodes defined by
> 'ibm,max-associativity-domains'. So if a LPAR is migratable, that value
> should be used.
> 
> Unfortunately, there is no easy way to know if a LPAR is migratable or
> not. The hypervisor is exporting the property 'ibm,migratable-partition' in
> the case it set to migrate partition, but that would not mean that the
> current partition is migratable.
> 
> Without this patch, when a LPAR is started on a 2 nodes box and then
> migrated to a 3 nodes box, the hypervisor may spread the LPAR's CPUs on the
> 3rd node. In that case if a CPU from that 3rd node is added to the LPAR, it
> will be wrongly assigned to the node because the kernel has been set to use
> up to 2 nodes (the configuration of the departure node). With this patch
> applies, the CPU is correctly added to the 3rd node.
> 
> Fixes: f9f130ff2ec9 ("powerpc/numa: Detect support for coregroup")
> Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
> V2: Address Srikar's comments
>   - Fix the commit message
>   - Use pr_info instead printk(KERN_INFO..)
> ---
>   arch/powerpc/mm/numa.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index f2bf98bdcea2..094a1076fd1f 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -893,7 +893,7 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>   static void __init find_possible_nodes(void)
>   {
>   	struct device_node *rtas;
> -	const __be32 *domains;
> +	const __be32 *domains = NULL;
>   	int prop_length, max_nodes;
>   	u32 i;
>   
> @@ -909,9 +909,14 @@ static void __init find_possible_nodes(void)
>   	 * it doesn't exist, then fallback on ibm,max-associativity-domains.
>   	 * Current denotes what the platform can support compared to max
>   	 * which denotes what the Hypervisor can support.
> +	 *
> +	 * If the LPAR is migratable, new nodes might be activated after a LPM,
> +	 * so we should consider the max number in that case.
>   	 */
> -	domains = of_get_property(rtas, "ibm,current-associativity-domains",
> -					&prop_length);
> +	if (!of_get_property(of_root, "ibm,migratable-partition", NULL))
> +		domains = of_get_property(rtas,
> +					  "ibm,current-associativity-domains",
> +					  &prop_length);
>   	if (!domains) {
>   		domains = of_get_property(rtas, "ibm,max-associativity-domains",
>   					&prop_length);
> @@ -920,6 +925,8 @@ static void __init find_possible_nodes(void)
>   	}
>   
>   	max_nodes = of_read_number(&domains[min_common_depth], 1);
> +	pr_info("Partition configured for %d NUMA nodes.\n", max_nodes);
> +
>   	for (i = 0; i < max_nodes; i++) {
>   		if (!node_possible(i))
>   			node_set(i, node_possible_map);
> 

