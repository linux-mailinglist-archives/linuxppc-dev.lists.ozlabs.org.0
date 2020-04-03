Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC21E19D4A0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 12:08:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48twcw6RB1zDsXK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 21:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48twXj2BGfzDsRY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 21:05:05 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033A3Nx9139036
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Apr 2020 06:05:03 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3061kqjmtx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:05:03 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.vnet.ibm.com>;
 Fri, 3 Apr 2020 11:04:44 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Apr 2020 11:04:43 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033A4wc858261546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 10:04:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5A9EAE051;
 Fri,  3 Apr 2020 10:04:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FC6BAE056;
 Fri,  3 Apr 2020 10:04:56 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.199.60.182])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  3 Apr 2020 10:04:55 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 15:34:55 +0530
From: Vaibhav Jain <vaibhav@linux.vnet.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/pseries/ddw: Extend upper limit for huge
 DMA window for persistent memory
In-Reply-To: <20200331012338.23773-1-aik@ozlabs.ru>
References: <20200331012338.23773-1-aik@ozlabs.ru>
Date: Fri, 03 Apr 2020 15:34:54 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 20040310-4275-0000-0000-000003B8C95C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040310-4276-0000-0000-000038CE221B
Message-Id: <874ku0ubp5.fsf@vajain21.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_06:2020-04-02,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=44
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030082
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
Cc: Brian J King <bjking1@us.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> Unlike normal memory ("memory" compatible type in the FDT),
> the persistent memory ("ibm,pmemory" in the FDT) can be mapped anywhere
> in the guest physical space and it can be used for DMA.
>
> In order to maintain 1:1 mapping via the huge DMA window, we need to
> know the maximum physical address at the time of the window setup.
> So far we've been looking at "memory" nodes but "ibm,pmemory" does not
> have fixed addresses and the persistent memory may be mapped afterwards.
>
> Since the persistent memory is still backed with page structs,
> use MAX_PHYSMEM_BITS as the upper limit.
>
> This effectively disables huge DMA window in LPAR under pHyp if
> persistent memory is present but this is the best we can do.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thanks for the patch Alexy,
LGTM.

Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>

> ---
>  arch/powerpc/platforms/pseries/iommu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 2e0a8eab5588..6d47b4a3ce39 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -945,6 +945,15 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>  	phys_addr_t max_addr = memory_hotplug_max();
>  	struct device_node *memory;
>
> +	/*
> +	 * The "ibm,pmemory" can appear anywhere in the address space.
> +	 * Assuming it is still backed by page structs, set the upper limit
> +	 * for the huge DMA window as MAX_PHYSMEM_BITS.
> +	 */
> +	if (of_find_node_by_type(NULL, "ibm,pmemory"))
> +		return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
> +			(phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
> +
>  	for_each_node_by_type(memory, "memory") {
>  		unsigned long start, size;
>  		int n_mem_addr_cells, n_mem_size_cells, len;
> -- 
> 2.17.1
>

-- 
Vaibhav Jain <vaibhav@linux.ibm.com>
Linux Technology Center, IBM India Pvt. Ltd.

