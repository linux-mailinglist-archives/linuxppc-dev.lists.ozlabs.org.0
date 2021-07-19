Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EB93CD64C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 16:05:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT3Wx07fvz30Hr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 00:05:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XLqCNBxX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XLqCNBxX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT3WP3Xwjz2ylk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 00:04:48 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JE3XUj134066; Mon, 19 Jul 2021 10:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=K/qph8xAPs+/unSVzbU2OaBjL7zxFBbX5wIrfrydwSY=;
 b=XLqCNBxXD7UjO+Ygm2kv3fO1zb8MtgSEUBDiYO/C+AoMqdOwsZFisAucGuSkcbsZ8rbB
 Jg8/7nri9U8pC6flbdIQw7dyU0ldRi8Xy1uYtXOYdlSx1r6hhXMFNA/k/LZwjmaSjutM
 6aWs1WpOs+tItQoVla3VgsxomxC9Xd/well7uHu6WlhIvS7Yon1JA/KnSOVx1mQLxTij
 EgWNnIsf6WYZAmRXzPbkMAwutmfjNzyL5s7yKtfLZJzhevb0hAVEkMC1nDU++fuRMQp5
 +pFqS4C0rYfRgNAUPBcRKWH/5EybG6pEDP9eC6KLlIcutUlAnPCVUUlR24E1tITZ47/d BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wa3h1vce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 10:04:40 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JE3nt1136584;
 Mon, 19 Jul 2021 10:04:39 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wa3h1vab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 10:04:39 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JDDY9g024395;
 Mon, 19 Jul 2021 14:04:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 39upu88cw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 14:04:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16JE2CLr22937888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 14:02:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B364AE057;
 Mon, 19 Jul 2021 14:04:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D92AEAE05A;
 Mon, 19 Jul 2021 14:04:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.62.205])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 14:04:33 +0000 (GMT)
Subject: Re: [PATCH v5 03/11] powerpc/pseries/iommu: Add
 iommu_pseries_alloc_table() helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-4-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <8110756f-a41f-3ba1-d7bc-af15630c4fbc@linux.ibm.com>
Date: Mon, 19 Jul 2021 16:04:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716082755.428187-4-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hmEZvi-D7tjyR4oDIrYgvtF1RswvzWsC
X-Proofpoint-ORIG-GUID: zI9xunaWU2iMx6Ea44WrVkNBPaRfpz9X
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190082
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/07/2021 10:27, Leonardo Bras wrote:
> Creates a helper to allow allocating a new iommu_table without the need
> to reallocate the iommu_group.
> 
> This will be helpful for replacing the iommu_table for the new DMA window,
> after we remove the old one with iommu_tce_table_put().
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index b1b8d12bab39..33d82865d6e6 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -53,28 +53,31 @@ enum {
>   	DDW_EXT_QUERY_OUT_SIZE = 2
>   };
>   
> -static struct iommu_table_group *iommu_pseries_alloc_group(int node)
> +static struct iommu_table *iommu_pseries_alloc_table(int node)
>   {
> -	struct iommu_table_group *table_group;
>   	struct iommu_table *tbl;
>   
> -	table_group = kzalloc_node(sizeof(struct iommu_table_group), GFP_KERNEL,
> -			   node);
> -	if (!table_group)
> -		return NULL;
> -
>   	tbl = kzalloc_node(sizeof(struct iommu_table), GFP_KERNEL, node);
>   	if (!tbl)
> -		goto free_group;
> +		return NULL;
>   
>   	INIT_LIST_HEAD_RCU(&tbl->it_group_list);
>   	kref_init(&tbl->it_kref);
> +	return tbl;
> +}
>   
> -	table_group->tables[0] = tbl;
> +static struct iommu_table_group *iommu_pseries_alloc_group(int node)
> +{
> +	struct iommu_table_group *table_group;
> +
> +	table_group = kzalloc_node(sizeof(*table_group), GFP_KERNEL, node);
> +	if (!table_group)
> +		return NULL;
>   
> -	return table_group;
> +	table_group->tables[0] = iommu_pseries_alloc_table(node);
> +	if (table_group->tables[0])
> +		return table_group;


Nitpick: for readability, we'd usually expect the error path to be 
detected with the if statement and keep going on the good path, and here 
the code does the opposite. No big deal though, so

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   
> -free_group:
>   	kfree(table_group);
>   	return NULL;
>   }
> 
