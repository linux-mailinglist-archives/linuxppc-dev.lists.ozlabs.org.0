Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 005565AC3C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 17:41:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bdCY45N9zDqML
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 01:41:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bd9m1PkDzDqq0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 01:39:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5TFbEIX040503
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 11:39:52 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2te0ws5571-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 11:39:51 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Sat, 29 Jun 2019 16:39:50 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 29 Jun 2019 16:39:47 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5TFdkZi52232196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Jun 2019 15:39:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FB51AE045;
 Sat, 29 Jun 2019 15:39:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98591AE051;
 Sat, 29 Jun 2019 15:39:43 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.70.170])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat, 29 Jun 2019 15:39:43 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Sat, 29 Jun 2019 21:09:42 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org, mpe@ellerman.id.au
Subject: Re: ["RFC PATCH" 2/2] powerpc/mm: Conslidate numa_enable check and
 min_common_depth check
In-Reply-To: <20190629083629.29037-2-aneesh.kumar@linux.ibm.com>
References: <20190629083629.29037-1-aneesh.kumar@linux.ibm.com>
 <20190629083629.29037-2-aneesh.kumar@linux.ibm.com>
Date: Sat, 29 Jun 2019 21:09:42 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19062915-0028-0000-0000-0000037ED6AA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062915-0029-0000-0000-0000243F07E9
Message-Id: <87imsos8n5.fsf@vajain21.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-29_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906290195
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Update min_common_depth = -1 if numa is disabled. This
> help us to avoid checking for both in different code paths.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index f6d68baeaa96..c84062a390cc 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -212,7 +212,7 @@ static int associativity_to_nid(const __be32 *associativity)
>  {
>  	int nid = NUMA_NO_NODE;
>  
> -	if (min_common_depth == -1 || !numa_enabled)
> +	if (min_common_depth == -1)
>  		goto out;
>  
>  	if (of_read_number(associativity, 1) >= min_common_depth)
> @@ -625,6 +625,7 @@ static int __init parse_numa_properties(void)
>  
>  	if (numa_enabled == 0) {
>  		printk(KERN_WARNING "NUMA disabled by user\n");
> +		min_common_depth = -1;
>  		return -1;
>  	}

I would prefer updating the definition of variable 'min_common_depth' to

static int min_common_depth = -1;

This would handle the case where someone calls 'associativity_to_nid()' and
other functions that read 'min_common_depth' and get an invalid result
back. And also handle the case where kernel is booted with 'numa = off'.

Also the init value 'min_common_depth == 0' indicates that the
first word in "ibm,associativity" array represents the node-id which is
wrong. Instead its the length of the "ibm,associativity" array.

>  
> @@ -747,7 +748,7 @@ void __init dump_numa_cpu_topology(void)
>  	unsigned int node;
>  	unsigned int cpu, count;
>  
> -	if (min_common_depth == -1 || !numa_enabled)
> +	if (min_common_depth == -1)
>  		return;
>  
>  	for_each_online_node(node) {
> @@ -812,7 +813,7 @@ static void __init find_possible_nodes(void)
>  	struct device_node *rtas;
>  	u32 numnodes, i;
>  
> -	if (min_common_depth <= 0 || !numa_enabled)
> +	if (min_common_depth <= 0)
>  		return;
>  
>  	rtas = of_find_node_by_path("/rtas");
> @@ -1014,7 +1015,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
>  	struct device_node *memory = NULL;
>  	int nid;
>  
> -	if (!numa_enabled || (min_common_depth < 0))
> +	if (min_common_depth < 0)
>  		return first_online_node;
>  
>  	memory = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
> -- 
> 2.21.0
>

-- 
Vaibhav Jain <vaibhav@linux.ibm.com>
Linux Technology Center, IBM India Pvt. Ltd.

