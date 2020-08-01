Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74B235097
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 07:22:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJXbW370yzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 15:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJXYm6hPzzDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Aug 2020 15:21:16 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07152pvv018084; Sat, 1 Aug 2020 01:21:07 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32mwd6cy2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Aug 2020 01:21:06 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0715C5q1029807;
 Sat, 1 Aug 2020 05:21:04 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 32mynh828y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Aug 2020 05:21:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0715L1Rp59834546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 1 Aug 2020 05:21:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99502AE045;
 Sat,  1 Aug 2020 05:21:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 966ABAE04D;
 Sat,  1 Aug 2020 05:21:00 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  1 Aug 2020 05:21:00 +0000 (GMT)
Date: Sat, 1 Aug 2020 10:50:59 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
Message-ID: <20200801052059.GA24375@linux.vnet.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-01_01:2020-07-31,
 2020-08-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008010038
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-07-31 16:49:14]:

> We use ibm,associativity and ibm,associativity-lookup-arrays to derive the numa
> node numbers. These device tree properties are firmware indicated grouping of
> resources based on their hierarchy in the platform. These numbers (group id) are
> not sequential and hypervisor/firmware can follow different numbering schemes.
> For ex: on powernv platforms, we group them in the below order.
> 
>  *     - CCM node ID
>  *     - HW card ID
>  *     - HW module ID
>  *     - Chip ID
>  *     - Core ID
> 
> Based on ibm,associativity-reference-points we use one of the above group ids as
> Linux NUMA node id. (On PowerNV platform Chip ID is used). This results
> in Linux reporting non-linear NUMA node id and which also results in Linux
> reporting empty node 0 NUMA nodes.
> 

If its just to eliminate node 0, then we have 2 other probably better
solutions.
1. Dont mark node 0 as spl (currently still in mm-tree and a result in
linux-next)
2. powerpc specific: explicitly clear node 0 during numa bringup.

> This can  be resolved by mapping the firmware provided group id to a logical Linux
> NUMA id. In this patch, we do this only for pseries platforms considering the

On PowerVM, as you would know the nid is already a logical or a flattened
chip-id and not the actual hardware chip-id.

> firmware group id is a virtualized entity and users would not have drawn any
> conclusion based on the Linux Numa Node id.
> 
> On PowerNV platform since we have historically mapped Chip ID as Linux NUMA node
> id, we keep the existing Linux NUMA node id numbering.
> 
> Before Fix:
>  # numactl -H
> available: 2 nodes (0-1)
> node 0 cpus:
> node 0 size: 0 MB
> node 0 free: 0 MB
> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71
> node 1 size: 50912 MB
> node 1 free: 45248 MB
> node distances:
> node   0   1
>   0:  10  40
>   1:  40  10
> 
> after fix
>  # numactl  -H
> available: 1 nodes (0)
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71
> node 0 size: 50912 MB
> node 0 free: 49724 MB
> node distances:
> node   0
>   0:  10
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/topology.h |  1 +
>  arch/powerpc/mm/numa.c              | 49 ++++++++++++++++++++++-------
>  2 files changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index f0b6300e7dd3..15b0424a27a8 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -118,5 +118,6 @@ int get_physical_package_id(int cpu);
>  #endif
>  #endif
> 
> +int firmware_group_id_to_nid(int firmware_gid);
>  #endif /* __KERNEL__ */
>  #endif	/* _ASM_POWERPC_TOPOLOGY_H */
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index e437a9ac4956..6c659aada55b 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
>  	}
>  }
> 
> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
> +
> +int firmware_group_id_to_nid(int firmware_gid)
> +{
> +	static int last_nid = 0;
> +
> +	/*
> +	 * For PowerNV we don't change the node id. This helps to avoid
> +	 * confusion w.r.t the expected node ids. On pseries, node numbers
> +	 * are virtualized. Hence do logical node id for pseries.
> +	 */
> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
> +		return firmware_gid;
> +
> +	if (firmware_gid ==  -1)
> +		return NUMA_NO_NODE;
> +
> +	if (nid_map[firmware_gid] == NUMA_NO_NODE)
> +		nid_map[firmware_gid] = last_nid++;

How do we ensure 2 simultaneous firmware_group_id_to_nid() calls dont end up
at this place in parallel?

> +
> +	return nid_map[firmware_gid];
> +}
> +
>  /* Returns nid in the range [0..MAX_NUMNODES-1], or -1 if no useful numa
>   * info is found.
>   */
>  static int associativity_to_nid(const __be32 *associativity)
>  {
>  	int nid = NUMA_NO_NODE;
> +	int firmware_gid = -1;
> 
>  	if (!numa_enabled)
>  		goto out;
> 
>  	if (of_read_number(associativity, 1) >= min_common_depth)
> -		nid = of_read_number(&associativity[min_common_depth], 1);
> +		firmware_gid = of_read_number(&associativity[min_common_depth], 1);
> 
>  	/* POWER4 LPAR uses 0xffff as invalid node */
> -	if (nid == 0xffff || nid >= MAX_NUMNODES)
> -		nid = NUMA_NO_NODE;
> +	if (firmware_gid == 0xffff || firmware_gid >= MAX_NUMNODES)
> +		firmware_gid = -1;

Lets assume two or more invocations of associativity_to_nid for the same
associativity, end up with -1, In each case aren't giving different
nids?


> +
> +	nid = firmware_group_id_to_nid(firmware_gid);
> 
>  	if (nid > 0 &&
> -		of_read_number(associativity, 1) >= distance_ref_points_depth) {
> +	    of_read_number(associativity, 1) >= distance_ref_points_depth) {
>  		/*
>  		 * Skip the length field and send start of associativity array
>  		 */
> @@ -432,24 +458,25 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
>  static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>  {
>  	struct assoc_arrays aa = { .arrays = NULL };
> -	int default_nid = NUMA_NO_NODE;
> -	int nid = default_nid;
> +	int nid = NUMA_NO_NODE, firmware_gid;
>  	int rc, index;
> 
>  	if ((min_common_depth < 0) || !numa_enabled)
> -		return default_nid;
> +		return NUMA_NO_NODE;
> 
>  	rc = of_get_assoc_arrays(&aa);
>  	if (rc)
> -		return default_nid;
> +		return NUMA_NO_NODE;

https://lore.kernel.org/linuxppc-dev/87lfjc1b5f.fsf@linux.ibm.com/t/#u

> 
>  	if (min_common_depth <= aa.array_sz &&
>  	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
>  		index = lmb->aa_index * aa.array_sz + min_common_depth - 1;
> -		nid = of_read_number(&aa.arrays[index], 1);
> +		firmware_gid = of_read_number(&aa.arrays[index], 1);
> 
> -		if (nid == 0xffff || nid >= MAX_NUMNODES)
> -			nid = default_nid;
> +		if (firmware_gid == 0xffff || firmware_gid >= MAX_NUMNODES)
> +			firmware_gid = -1;

Same case as above, How do we ensure that we return unique nid for a
similar assoc_array?

> +
> +		nid = firmware_group_id_to_nid(firmware_gid);
> 
>  		if (nid > 0) {
>  			index = lmb->aa_index * aa.array_sz;
> -- 
> 2.26.2
> 

-- 
Thanks and Regards
Srikar Dronamraju
