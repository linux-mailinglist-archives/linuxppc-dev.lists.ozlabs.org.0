Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FE3F9D26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx5XL4NVHz3bN5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:58:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QkLX0juN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QkLX0juN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx5Wb57D9z2xlD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:58:19 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RGXnw9160813; Fri, 27 Aug 2021 12:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=G1bFtCzAbdq5KNIoJFyJHvQDP04QzWYfpuJi2xotdEY=;
 b=QkLX0juNXKVs2GaymTVoYEnmdMCvoUGqZ84bNTsofzop2LXTHLsSpytEAvdz9cobv/ED
 VXtTFkRyiK1sUgnQIQqJlzf7ZYTTjEx/0WI/sjALcUFDc58Y/+5/uwoimk3tWkvkay9x
 WmLv7V9wjYjLg5LwtAgLB9UMKaYSNvVhQqWWA52KJND4NgRyLaycur7UH9680rdKfahk
 lvddWOltFTcYrmiGVlgg/z+Ug4W+2kpCDEUQvuRJt0fff4eqE20cPAb3v4BLOn3cPdnZ
 F0ZiQV0OdwDi3lfsCZynq94Qdi00HJdvYuzJhjMXurELqtw/b4wLsRoEhEVOjlYflxOh QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aq0ysdy5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 12:58:09 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17RGYs99171307;
 Fri, 27 Aug 2021 12:58:09 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aq0ysdy4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 12:58:09 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17RGrgSc020316;
 Fri, 27 Aug 2021 16:58:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3ajrrhkw05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 16:58:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17RGw4WF54395290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 16:58:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C41095205A;
 Fri, 27 Aug 2021 16:58:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.153.220])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6F1A95204F;
 Fri, 27 Aug 2021 16:58:04 +0000 (GMT)
Subject: Re: [PATCH v6 08/11] powerpc/pseries/iommu: Update
 remove_dma_window() to accept property name
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
 <20210817063929.38701-9-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <50172860-7ceb-184e-6173-2cd728584d81@linux.ibm.com>
Date: Fri, 27 Aug 2021 18:58:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817063929.38701-9-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nxMHvHR7oQfitpF_3Ct4eDD1p45CYc_W
X-Proofpoint-ORIG-GUID: ujsb9XzkpUROXa6uMA-7fxo-6qRNkDNf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_04:2021-08-26,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270098
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



On 17/08/2021 08:39, Leonardo Bras wrote:
> Update remove_dma_window() so it can be used to remove DDW with a given
> property name.
> 
> This enables the creation of new property names for DDW, so we can
> have different usage for it, like indirect mapping.
> 
> Also, add return values to it so we can check if the property was found
> while removing the active DDW. This allows skipping the remaining property
> names while reducing the impact of multiple property names.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   arch/powerpc/platforms/pseries/iommu.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index a47f59a8f107..901f290999d0 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -844,31 +844,33 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
>   	__remove_dma_window(np, ddw_avail, liobn);
>   }
>   
> -static void remove_ddw(struct device_node *np, bool remove_prop)
> +static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_name)
>   {
>   	struct property *win;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>   	int ret = 0;
>   
> +	win = of_find_property(np, win_name, NULL);
> +	if (!win)
> +		return -EINVAL;
> +
>   	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
>   					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
>   	if (ret)
> -		return;
> +		return 0;
>   
> -	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
> -	if (!win)
> -		return;
>   
>   	if (win->length >= sizeof(struct dynamic_dma_window_prop))
>   		remove_dma_window(np, ddw_avail, win);
>   
>   	if (!remove_prop)
> -		return;
> +		return 0;
>   
>   	ret = of_remove_property(np, win);
>   	if (ret)
>   		pr_warn("%pOF: failed to remove direct window property: %d\n",
>   			np, ret);
> +	return 0;
>   }
>   
>   static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift)
> @@ -921,7 +923,7 @@ static int find_existing_ddw_windows(void)
>   	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
>   		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
>   		if (!direct64 || len < sizeof(*direct64)) {
> -			remove_ddw(pdn, true);
> +			remove_ddw(pdn, true, DIRECT64_PROPNAME);
>   			continue;
>   		}
>   
> @@ -1565,7 +1567,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
>   		 * we have to remove the property when releasing
>   		 * the device node.
>   		 */
> -		remove_ddw(np, false);
> +		remove_ddw(np, false, DIRECT64_PROPNAME);
>   		if (pci && pci->table_group)
>   			iommu_pseries_free_group(pci->table_group,
>   					np->full_name);
> 
