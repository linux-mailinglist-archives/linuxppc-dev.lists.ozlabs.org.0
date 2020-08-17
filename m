Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53A246EA8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 19:34:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVh4N1wcXzDqPy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 03:34:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YyEr97ZU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVh1J0lxbzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 03:31:47 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HH2TWc186789; Mon, 17 Aug 2020 13:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4+FnpX3hUdju+JmAayjYg94zyYfKT47NrO3YpJXIePE=;
 b=YyEr97ZUkV6FfBQfPMLma8ICENj4QgBkQqep8ySD7ERz5a5b4h/GD/5+YQ8VTe4t9fAM
 kNe9RESI4PeYgrVwEhb8v6FogDcvYLTiWwfGY1shqT1nNO7xGQaSataR/wZLTNK+5jVg
 hrZCUvdSOPUaycNvlLQFfEyxhiIWhY1LnHj+mSUp1u/Xvni9AHN0JC3+tFYMd1jfOdPN
 DmeSgjVLxWMMxVJ/nYKhF+5zKRrf2OggRgZCoobAICZF2X13D4Z/kFzeJpP0lAV2Y7R1
 1BEP0hN+wZ1VHgpMxhb1CSOsE1Iok0cW7c28OqMzK8owf+9/lPOF6oHp80z14V9YVjkn Iw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ywt89493-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 13:31:43 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HHVCR1029124;
 Mon, 17 Aug 2020 17:31:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 32x7b81h07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 17:31:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07HHU9QM64684292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 17:30:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEB4A4204B;
 Mon, 17 Aug 2020 17:31:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF6A24204C;
 Mon, 17 Aug 2020 17:31:36 +0000 (GMT)
Received: from [9.102.3.161] (unknown [9.102.3.161])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 17:31:36 +0000 (GMT)
Subject: Re: [RFC PATCH] powerpc/drmem: use global variable instead of
 fetching again
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200806123604.248361-1-aneesh.kumar@linux.ibm.com>
 <20200806125200.252403-1-aneesh.kumar@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <2cb84914-2cb2-008a-2dfc-321dcd6c7da9@linux.ibm.com>
Date: Mon, 17 Aug 2020 23:01:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806125200.252403-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_13:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170120
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/08/20 6:22 pm, Aneesh Kumar K.V wrote:
> use mem_addr_cells/mem_size_cells instead of fetching the values
> again from device tree.
> 

Looks good to me.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/mm/drmem.c | 24 ++++++------------------
>   1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
> index b2eeea39684c..f533a7b04ab9 100644
> --- a/arch/powerpc/mm/drmem.c
> +++ b/arch/powerpc/mm/drmem.c
> @@ -14,8 +14,6 @@
>   #include <asm/prom.h>
>   #include <asm/drmem.h>
>   
> -static int n_root_addr_cells, n_root_size_cells;
> -
>   static struct drmem_lmb_info __drmem_info;
>   struct drmem_lmb_info *drmem_info = &__drmem_info;
>   
> @@ -196,8 +194,8 @@ static void read_drconf_v1_cell(struct drmem_lmb *lmb,
>   {
>   	const __be32 *p = *prop;
>   
> -	lmb->base_addr = of_read_number(p, n_root_addr_cells);
> -	p += n_root_addr_cells;
> +	lmb->base_addr = of_read_number(p, mem_addr_cells);
> +	p += mem_addr_cells;
>   	lmb->drc_index = of_read_number(p++, 1);
>   
>   	p++; /* skip reserved field */
> @@ -233,8 +231,8 @@ static void read_drconf_v2_cell(struct of_drconf_cell_v2 *dr_cell,
>   	const __be32 *p = *prop;
>   
>   	dr_cell->seq_lmbs = of_read_number(p++, 1);
> -	dr_cell->base_addr = of_read_number(p, n_root_addr_cells);
> -	p += n_root_addr_cells;
> +	dr_cell->base_addr = of_read_number(p, mem_addr_cells);
> +	p += mem_addr_cells;
>   	dr_cell->drc_index = of_read_number(p++, 1);
>   	dr_cell->aa_index = of_read_number(p++, 1);
>   	dr_cell->flags = of_read_number(p++, 1);
> @@ -285,10 +283,6 @@ int __init walk_drmem_lmbs_early(unsigned long node, void *data,
>   	if (!prop || len < dt_root_size_cells * sizeof(__be32))
>   		return ret;
>   
> -	/* Get the address & size cells */
> -	n_root_addr_cells = dt_root_addr_cells;
> -	n_root_size_cells = dt_root_size_cells;
> -
>   	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
>   
>   	usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
> @@ -318,12 +312,12 @@ static int init_drmem_lmb_size(struct device_node *dn)
>   		return 0;
>   
>   	prop = of_get_property(dn, "ibm,lmb-size", &len);
> -	if (!prop || len < n_root_size_cells * sizeof(__be32)) {
> +	if (!prop || len < mem_size_cells * sizeof(__be32)) {
>   		pr_info("Could not determine LMB size\n");
>   		return -1;
>   	}
>   
> -	drmem_info->lmb_size = of_read_number(prop, n_root_size_cells);
> +	drmem_info->lmb_size = of_read_number(prop, mem_size_cells);
>   	return 0;
>   }
>   
> @@ -353,12 +347,6 @@ int walk_drmem_lmbs(struct device_node *dn, void *data,
>   	if (!of_root)
>   		return ret;
>   
> -	/* Get the address & size cells */
> -	of_node_get(of_root);
> -	n_root_addr_cells = of_n_addr_cells(of_root);
> -	n_root_size_cells = of_n_size_cells(of_root);
> -	of_node_put(of_root);
> -
>   	if (init_drmem_lmb_size(dn))
>   		return ret;
>   
> 

Thanks
Hari
