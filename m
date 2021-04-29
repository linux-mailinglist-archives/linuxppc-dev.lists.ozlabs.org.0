Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF90B36F080
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 21:29:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWQYt4Rpzz30CT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 05:29:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UnTzE5HT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UnTzE5HT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWQYQ2hPnz2xg4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 05:29:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TJMHne140114; Thu, 29 Apr 2021 15:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hvhI1WyAPVMRREp9vgAVp0dr+SCLctzVy2fSEnoO77E=;
 b=UnTzE5HT+V7qKTb5aSLABsumnV2k7gJXkoOSw37TA8CrholAWFk9yoI9y/e2gV5O7Ojj
 LR0tdgw6HQvOajOJq2RLvzrv+pMWtwlZuH0EtI/fDNVAL7PVLP0d8d4K3FmSrSIL1jt6
 zE6PpRqlhvPn5IkKw3nDxPkOtA3xS/enaYiLu64yzKwLZTxuxHNOiqYxEkewtYbFSfAH
 SngVlhup8842YYOtY68jFHNMPjrzJD2md/4ksSD9QBJDj/T1nP6zQ7OKZFuLklBBCPlc
 q1ZqcwaIX786EfXOnJKE27dx3IULIKgqpTfm6HiBbyRfXT/EUwwkoeMu1RibnrQhdBB0 2g== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38822b9hv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 15:29:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TJSrA8021210;
 Thu, 29 Apr 2021 19:29:21 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 384aya6mms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 19:29:21 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TJTK6636307404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 19:29:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C7F212405A;
 Thu, 29 Apr 2021 19:29:20 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D53E0124053;
 Thu, 29 Apr 2021 19:29:18 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.61.17])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 19:29:18 +0000 (GMT)
Subject: Re: [PATCH] ppc64/numa: consider the max numa node for migratable LPAR
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20210429181901.17674-1-ldufour@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <ae59de4d-17a3-6c39-ddb5-a151909992c3@linux.ibm.com>
Date: Thu, 29 Apr 2021 12:29:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210429181901.17674-1-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NNTWAeIm6apVq5FDFjarLExzNtQ0vu57
X-Proofpoint-ORIG-GUID: NNTWAeIm6apVq5FDFjarLExzNtQ0vu57
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_10:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290121
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

On 4/29/21 11:19 AM, Laurent Dufour wrote:
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

Wording is a little hard to follow for me here. From PAPR the
'ibm,migratable-partition' property presence indicates that the platform
supports the potential migration of the partition. I guess maybe the point is
that all migratable partitions define 'ibm,migratable-partition', but all
partitions that define 'ibm,migratable-partition' are not necessarily migratable.

-Tyrel

> 
> Without that patch, when a LPAR is started on a 2 nodes box and then
> migrated to a 3 nodes box, the hypervisor may spread the LPAR's CPUs on the
> 3rd node. In that case if a CPU from that 3rd node is added to the LPAR, it
> will be wrongly assigned to the node because the kernel has been set to use
> up to 2 nodes (the configuration of the departure node). With that patch
> applies, the CPU is correctly added to the 3rd node.
> 
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index f2bf98bdcea2..673fa6e47850 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -893,7 +893,7 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>  static void __init find_possible_nodes(void)
>  {
>  	struct device_node *rtas;
> -	const __be32 *domains;
> +	const __be32 *domains = NULL;
>  	int prop_length, max_nodes;
>  	u32 i;
> 
> @@ -909,9 +909,14 @@ static void __init find_possible_nodes(void)
>  	 * it doesn't exist, then fallback on ibm,max-associativity-domains.
>  	 * Current denotes what the platform can support compared to max
>  	 * which denotes what the Hypervisor can support.
> +	 *
> +	 * If the LPAR is migratable, new nodes might be activated after a LPM,
> +	 * so we should consider the max number in that case.
>  	 */
> -	domains = of_get_property(rtas, "ibm,current-associativity-domains",
> -					&prop_length);
> +	if (!of_get_property(of_root, "ibm,migratable-partition", NULL))
> +		domains = of_get_property(rtas,
> +					  "ibm,current-associativity-domains",
> +					  &prop_length);
>  	if (!domains) {
>  		domains = of_get_property(rtas, "ibm,max-associativity-domains",
>  					&prop_length);
> @@ -920,6 +925,9 @@ static void __init find_possible_nodes(void)
>  	}
> 
>  	max_nodes = of_read_number(&domains[min_common_depth], 1);
> +	printk(KERN_INFO "Partition configured for %d NUMA nodes.\n",
> +	       max_nodes);
> +
>  	for (i = 0; i < max_nodes; i++) {
>  		if (!node_possible(i))
>  			node_set(i, node_possible_map);
> 

