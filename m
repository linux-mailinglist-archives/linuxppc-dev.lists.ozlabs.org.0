Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2A228EA2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 05:31:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBLbd1dRXzDqtS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 13:31:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBLX35h7VzDqsd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 13:28:19 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M31OA6183920; Tue, 21 Jul 2020 23:28:14 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x7jwpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 23:28:14 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M3FNXt032172;
 Wed, 22 Jul 2020 03:28:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 32brq8rk7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:28:13 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M3SDNQ46662096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 03:28:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29AB428058;
 Wed, 22 Jul 2020 03:28:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBF762805C;
 Wed, 22 Jul 2020 03:28:12 +0000 (GMT)
Received: from localhost (unknown [9.160.116.141])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 03:28:12 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/numa: Remove a redundant variable
In-Reply-To: <20200715120534.3673-2-srikar@linux.vnet.ibm.com>
References: <871rljfet9.fsf@linux.ibm.com>
 <20200715120534.3673-1-srikar@linux.vnet.ibm.com>
 <20200715120534.3673-2-srikar@linux.vnet.ibm.com>
Date: Tue, 21 Jul 2020 22:28:12 -0500
Message-ID: <87lfjc1b5f.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_01:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=1 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220015
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> In of_drconf_to_nid_single() default_nid always refers to NUMA_NO_NODE.
> Hence replace it with NUMA_NO_NODE.
>
> No functional changes.
>

...

> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index a2c5fe0d0cad..b066d89c2975 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -432,16 +432,15 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
>  static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>  {
>  	struct assoc_arrays aa = { .arrays = NULL };
> -	int default_nid = NUMA_NO_NODE;
> -	int nid = default_nid;
> +	int nid = NUMA_NO_NODE;
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
>  
>  	if (min_common_depth <= aa.array_sz &&
>  	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
> @@ -449,7 +448,7 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>  		nid = of_read_number(&aa.arrays[index], 1);
>  
>  		if (nid == 0xffff || nid >= num_possible_nodes())
> -			nid = default_nid;
> +			nid = NUMA_NO_NODE;
>  
>  		if (nid > 0) {
>  			index = lmb->aa_index * aa.array_sz;

Doesn't seem like an improvement to me, sorry. Admittedly it's a small
point, but a local variable named "default_nid" communicates that it's a
default or fallback value. That information is lost with this change.
