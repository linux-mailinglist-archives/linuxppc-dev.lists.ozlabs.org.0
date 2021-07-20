Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7D3D00FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 19:53:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTmXZ2RR8z3bgq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 03:53:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=alpgRWSJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=alpgRWSJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTmX75WGDz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 03:52:55 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KHd2cU086407; Tue, 20 Jul 2021 13:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pZ2BLSFfZ3iD9iqUnEeFuqBjhm6IoN58pwjgZXuLho4=;
 b=alpgRWSJbXAsNWYu/lG585zyfgLXrMt0nQM5/82Pt86aZDYOe27yGuR+c+cz7n16gHHj
 gwkyFHvmJ0+TsgnPk3DejO831p6nCyBI6Sy9UZi6gQtLYW+yNWB/mDCNL3Xdw29Exmle
 Xurx/IQwURp0WRC3p2EdU+XhRGbX7VsBmnZwvGkb1DRgUzeFfDv4QyJFKxnVqBTrT7sW
 H3JIR8DUO7hq8HT9FQpevkBboJjxLRS52Jz0B9wzyiNSgu3n82gIye/pJmjltzVovNEO
 J8f+mrhA+VRh/OUxE/vNWcaMVYH579IyyrUW0WvSChPIFENEqj1fNX1mfmk8GHCpgD5A 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39x2kk12a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:52:44 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16KHd9S6087607;
 Tue, 20 Jul 2021 13:52:44 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39x2kk129k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:52:44 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KHj0ji008010;
 Tue, 20 Jul 2021 17:52:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 39upfh8ut8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 17:52:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16KHoHGn23396732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 17:50:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEB574C040;
 Tue, 20 Jul 2021 17:52:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 673734C046;
 Tue, 20 Jul 2021 17:52:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.178.12])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 17:52:38 +0000 (GMT)
Subject: Re: [PATCH v5 09/11] powerpc/pseries/iommu: Find existing DDW with
 given property name
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-10-leobras.c@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <ada48b13-1de5-cb38-680f-71c9ca530e5a@linux.ibm.com>
Date: Tue, 20 Jul 2021 19:52:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716082755.428187-10-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: K_uMRQOx9Xz77linXJCLpf03qAv-4His
X-Proofpoint-GUID: lm9D8xb3EeGYQV2lhtWUMzdblCsrDzyN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107200115
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
> At the moment pseries stores information about created directly mapped
> DDW window in DIRECT64_PROPNAME.
> 
> With the objective of implementing indirect DMA mapping with DDW, it's
> necessary to have another propriety name to make sure kexec'ing into older
> kernels does not break, as it would if we reuse DIRECT64_PROPNAME.
> 
> In order to have this, find_existing_ddw_windows() needs to be able to
> look for different property names.
> 
> Extract find_existing_ddw_windows() into find_existing_ddw_windows_named()
> and calls it with current property name.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>




>   arch/powerpc/platforms/pseries/iommu.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 17c6f4706e76..22d251e15b61 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -895,24 +895,21 @@ static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
>   	return window;
>   }
>   
> -static int find_existing_ddw_windows(void)
> +static void find_existing_ddw_windows_named(const char *name)
>   {
>   	int len;
>   	struct device_node *pdn;
>   	struct direct_window *window;
> -	const struct dynamic_dma_window_prop *direct64;
> -
> -	if (!firmware_has_feature(FW_FEATURE_LPAR))
> -		return 0;
> +	const struct dynamic_dma_window_prop *dma64;
>   
> -	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
> -		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
> -		if (!direct64 || len < sizeof(*direct64)) {
> -			remove_ddw(pdn, true, DIRECT64_PROPNAME);
> +	for_each_node_with_property(pdn, name) {
> +		dma64 = of_get_property(pdn, name, &len);
> +		if (!dma64 || len < sizeof(*dma64)) {
> +			remove_ddw(pdn, true, name);
>   			continue;
>   		}
>   
> -		window = ddw_list_new_entry(pdn, direct64);
> +		window = ddw_list_new_entry(pdn, dma64);
>   		if (!window)
>   			break;
>   
> @@ -920,6 +917,14 @@ static int find_existing_ddw_windows(void)
>   		list_add(&window->list, &direct_window_list);
>   		spin_unlock(&direct_window_list_lock);
>   	}
> +}
> +
> +static int find_existing_ddw_windows(void)
> +{
> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
> +		return 0;
> +
> +	find_existing_ddw_windows_named(DIRECT64_PROPNAME);
>   
>   	return 0;
>   }
> 
