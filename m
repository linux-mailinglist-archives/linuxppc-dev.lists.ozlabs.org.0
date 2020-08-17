Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87400246A85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 17:37:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVdTZ3kc6zDqVn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 01:37:38 +1000 (AEST)
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
 header.s=pp1 header.b=o2wckWxv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVdKY4qm9zDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 01:30:40 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HF2tYV008448; Mon, 17 Aug 2020 11:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XY7ef/ZNGXaY+4zIeIrYjsVEZoEip3TEkhxKc3SxnBM=;
 b=o2wckWxv8wLZ9VF9Mgcl3tT4BvjJi0Z8T0PcTghWY9sV1bZwfAjDqalXez9PSLns+FTG
 92OEqcdkKhNL5Zfz0Hwgv7KFKa+NwH6QdnQMJDtD9s5QAQYV8P5r2pjxpjySWT7eYgPr
 ZbbsE6SPto5PSIuxf7bkvM0/4OXL4ngGe1LCW3TfOmj15Jb31uq1dWpHbQlmj4xZmCoz
 MDXXNjTp60lNmuA7ZE2wPFYDNWAN0Z0HXHh8XitE3raeQxqvl7XGe30O6w9AImJp/8YZ
 QJz2NL5uIgFP41oSxy6guZMIhpHM5ks4b5HR2CKoKkhWRtN45pmFj5zKZVBZ3yHbADES Kg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y3ssjb2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 11:30:32 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HFGSqT019089;
 Mon, 17 Aug 2020 15:30:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 32x7b81f68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 15:30:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07HFSw7E15008012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 15:28:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76451A405B;
 Mon, 17 Aug 2020 15:30:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7935AA4051;
 Mon, 17 Aug 2020 15:30:26 +0000 (GMT)
Received: from [9.102.3.161] (unknown [9.102.3.161])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 15:30:26 +0000 (GMT)
Subject: Re: [PATCH v2 2/4] powerpc/mem: Store the dt_root_size/addr cell
 values for later usage
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200806162329.276534-1-aneesh.kumar@linux.ibm.com>
 <20200806162329.276534-2-aneesh.kumar@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <f0c90b3b-5192-de01-c18c-0c69e895237f@linux.ibm.com>
Date: Mon, 17 Aug 2020 21:00:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806162329.276534-2-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_10:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008170116
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



On 06/08/20 9:53 pm, Aneesh Kumar K.V wrote:
> dt_root_addr_cells and dt_root_size_cells are __initdata variables.
> So make a copy of the same which can be used post init.
> 

This avoids doing the same thing at multiple places.
So, thanks for the patch, Aneesh.

Looks good to me.

but nitpick below...

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/drmem.h | 2 ++
>   arch/powerpc/kernel/prom.c       | 7 +++++++
>   arch/powerpc/mm/numa.c           | 1 +
>   3 files changed, 10 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index d719cbac34b2..ffb59caa88ee 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -123,4 +123,6 @@ static inline void lmb_clear_nid(struct drmem_lmb *lmb)
>   }
>   #endif
>   
> +extern int mem_addr_cells, mem_size_cells;

Should this be in include/asm/prom.h instead, given the definition
comes from kernel/prom.c file?

> +
>   #endif /* _ASM_POWERPC_LMB_H */
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index d8a2fb87ba0c..9a1701e85747 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -73,6 +73,7 @@ u64 ppc64_rma_size;
>   #endif
>   static phys_addr_t first_memblock_size;
>   static int __initdata boot_cpu_count;
> +int mem_addr_cells, mem_size_cells;
>   
>   static int __init early_parse_mem(char *p)
>   {
> @@ -536,6 +537,12 @@ static int __init early_init_dt_scan_memory_ppc(unsigned long node,
>   						const char *uname,
>   						int depth, void *data)
>   {
> +	/*
> +	 * Make a copy from __initdata variable
> +	 */
> +	mem_addr_cells = dt_root_addr_cells;
> +	mem_size_cells = dt_root_size_cells;
> +
>   #ifdef CONFIG_PPC_PSERIES
>   	if (depth == 1 &&
>   	    strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 058fee9a0835..77d41d9775d2 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -368,6 +368,7 @@ static void __init get_n_mem_cells(int *n_addr_cells, int *n_size_cells)
>   	of_node_put(memory);
>   }
>   
> +/*  dt_mem_next_cell is __init  */
>   static unsigned long read_n_cells(int n, const __be32 **buf)
>   {
>   	unsigned long result = 0;
> 
