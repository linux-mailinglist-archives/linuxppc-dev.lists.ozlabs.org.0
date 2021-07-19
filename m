Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C76083CD65D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 16:15:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT3ld5hRJz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 00:15:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Br7qR/8x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Br7qR/8x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT3l73zMFz2yLT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 00:14:59 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JE4RvH019531; Mon, 19 Jul 2021 10:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wrNzt1WBw4y/MVelaIxzrQvPfFZ+JaBY8YERVGr24Pk=;
 b=Br7qR/8x+c0LNAisWax8FYApxqSj/n9kFcffKrBgEkimya4gsfU/QhqcJlFXfmd1b4li
 0M20bp2NKKXz9bOW4xMFG/ZZsm+38YT0HkQ3M63j1cB0l6KQzTtMizH8oUCUutG+1NpD
 Lh8EDH+a1yVzSHanGZD9lxEhXX1fDqKFgPvfGP+cAqDwmGemR+x/jMO1hfhWJGOJ4GEx
 fwO0eLPoLAyTn/AAObAl+aDht4QtZm1Mo5fzyjEu0tCDUzp9sozhnJWrwtnrYOSQ+7hI
 zO9Va0l52w+e1HqrVXbWcffqI+5d4cNf4dDBN2Kc2kTrN5ozIbTn7N4PWgKujB5TmM/K sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wadbhqqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 10:14:52 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JE54hM024404;
 Mon, 19 Jul 2021 10:14:51 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wadbhqnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 10:14:51 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JDDroP008583;
 Mon, 19 Jul 2021 14:14:48 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 39upu88d1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 14:14:47 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JEEjBb23396638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 14:14:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4882DAE057;
 Mon, 19 Jul 2021 14:14:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6615AE059;
 Mon, 19 Jul 2021 14:14:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.62.205])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 14:14:44 +0000 (GMT)
Subject: Re: [PATCH v5 04/11] powerpc/pseries/iommu: Add ddw_list_new_entry()
 helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-5-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <ae8fe44e-24c1-9d5f-70f9-96098167170a@linux.ibm.com>
Date: Mon, 19 Jul 2021 16:14:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716082755.428187-5-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J-EzlINOzKb0RHd-jVPdEm_skdQJOdDr
X-Proofpoint-ORIG-GUID: vZD-PRUnaf3PTTLrhdipL06pM5iJbcqk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190082
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
> There are two functions creating direct_window_list entries in a
> similar way, so create a ddw_list_new_entry() to avoid duplicity and
> simplify those functions.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

LGTM
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   arch/powerpc/platforms/pseries/iommu.c | 32 +++++++++++++++++---------
>   1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 33d82865d6e6..712d1667144a 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -874,6 +874,21 @@ static u64 find_existing_ddw(struct device_node *pdn, int *window_shift)
>   	return dma_addr;
>   }
>   
> +static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
> +						const struct dynamic_dma_window_prop *dma64)
> +{
> +	struct direct_window *window;
> +
> +	window = kzalloc(sizeof(*window), GFP_KERNEL);
> +	if (!window)
> +		return NULL;
> +
> +	window->device = pdn;
> +	window->prop = dma64;
> +
> +	return window;
> +}
> +
>   static int find_existing_ddw_windows(void)
>   {
>   	int len;
> @@ -886,18 +901,15 @@ static int find_existing_ddw_windows(void)
>   
>   	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
>   		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
> -		if (!direct64)
> -			continue;
> -
> -		window = kzalloc(sizeof(*window), GFP_KERNEL);
> -		if (!window || len < sizeof(struct dynamic_dma_window_prop)) {
> -			kfree(window);
> +		if (!direct64 || len < sizeof(*direct64)) {
>   			remove_ddw(pdn, true);
>   			continue;
>   		}
>   
> -		window->device = pdn;
> -		window->prop = direct64;
> +		window = ddw_list_new_entry(pdn, direct64);
> +		if (!window)
> +			break;
> +
>   		spin_lock(&direct_window_list_lock);
>   		list_add(&window->list, &direct_window_list);
>   		spin_unlock(&direct_window_list_lock);
> @@ -1307,7 +1319,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
>   		  create.liobn, dn);
>   
> -	window = kzalloc(sizeof(*window), GFP_KERNEL);
> +	window = ddw_list_new_entry(pdn, ddwprop);
>   	if (!window)
>   		goto out_clear_window;
>   
> @@ -1326,8 +1338,6 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		goto out_free_window;
>   	}
>   
> -	window->device = pdn;
> -	window->prop = ddwprop;
>   	spin_lock(&direct_window_list_lock);
>   	list_add(&window->list, &direct_window_list);
>   	spin_unlock(&direct_window_list_lock);
> 
