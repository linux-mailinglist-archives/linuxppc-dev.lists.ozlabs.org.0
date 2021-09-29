Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11B41BF7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 09:01:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK6jy6sBqz305X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 17:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CwTFssb4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CwTFssb4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK6j91Dwcz2yM4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 17:01:00 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T5YQ2Z003765; 
 Wed, 29 Sep 2021 03:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0BGMwmFa4W1i68vE0aeAC5HE8/NxWYNq34ECmzlhSzo=;
 b=CwTFssb4bn+oeCSvGCa7lx/mCoLpW+wxNWO7hQ8v87FPJup0Y57IVIlbgKk0Vw2hmfBz
 BHowN/7YHPgbJvsi2QmhZjjS1LdovZwsdxnwTC69JWXuKpnFQEbO0mpBWrWLlhrhtEkS
 9Q0pNzcznW5NejpX52Gkk1LrxcMx1ibJzNJN5MXfXaY6iU7A5sPd56UrjjrJPe6CFog3
 6qPG0TRexP19ks9IYeoenXiWFWNPImwavkLcqsFVZarJJY+Tp5P6tjxGFVW2RXBucBKV
 gHoT+jtvk7JFSWwwQCVQO70meVpNJPRzGd/kWQjS39Ycx4LyAusjpxEMKHvss5OWfku8 Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bceyynaka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 03:00:57 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18T6twEi009848;
 Wed, 29 Sep 2021 03:00:56 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bceyynajg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 03:00:56 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18T6pLJO013760;
 Wed, 29 Sep 2021 07:00:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3b9u1k2tfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 07:00:53 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18T6ti3N59834632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 06:55:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B49C1A405D;
 Wed, 29 Sep 2021 07:00:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F77FA4057;
 Wed, 29 Sep 2021 07:00:46 +0000 (GMT)
Received: from [9.145.170.102] (unknown [9.145.170.102])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Sep 2021 07:00:46 +0000 (GMT)
Message-ID: <c07bf442-e57d-c694-831f-5cf4b0e4b02d@linux.ibm.com>
Date: Wed, 29 Sep 2021 09:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH kernel] powerps/pseries/dma: Add support for 2M IOMMU page
 size
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20210928101521.3956331-1-aik@ozlabs.ru>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20210928101521.3956331-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XcClkSe_K7Hjy0_p7LlJHXLq8D9mxaj1
X-Proofpoint-GUID: RUTFL2aQqYwYvMuKNmC28YbZkO77DxFQ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290040
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
Cc: Leonardo Augusto Guimaraes Garcia <lagarcia@br.ibm.com>,
 Leonardo Bras <leobras.c@gmail.com>, Travis Pizel <verno@us.ibm.com>,
 Brian J King <bjking1@us.ibm.com>, Murilo Vicentini <muvic@br.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 28/09/2021 12:15, Alexey Kardashevskiy wrote:
> The upcoming PAPR spec adds a 2M page size, bit 23 right after the 16G page
> size in the "ibm,query-pe-dma-window" call.
> 
> This adds support for the new page size. Since the new page size is out
> of sorted order, this changes the loop to not assume that shift[] is
> sorted.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---


Looks ok to me
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


> 
> This might not work if PHYP keeps rejecting new window requests for less
> than 32768 TCEs. This is needed:
> https://github.com/aik/linux/commit/8cc8fa5ba5b3b4a18efbc9d81d9e5b85ca7c8a95
> 
> 
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index c741689a5165..237bf405b0cb 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1159,14 +1159,15 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
>   /* Return largest page shift based on "IO Page Sizes" output of ibm,query-pe-dma-window. */
>   static int iommu_get_page_shift(u32 query_page_size)
>   {
> -	/* Supported IO page-sizes according to LoPAR */
> +	/* Supported IO page-sizes according to LoPAR, note that 2M is out of order */
>   	const int shift[] = {
>   		__builtin_ctzll(SZ_4K),   __builtin_ctzll(SZ_64K), __builtin_ctzll(SZ_16M),
>   		__builtin_ctzll(SZ_32M),  __builtin_ctzll(SZ_64M), __builtin_ctzll(SZ_128M),
> -		__builtin_ctzll(SZ_256M), __builtin_ctzll(SZ_16G)
> +		__builtin_ctzll(SZ_256M), __builtin_ctzll(SZ_16G), __builtin_ctzll(SZ_2M)
>   	};
>   
>   	int i = ARRAY_SIZE(shift) - 1;
> +	int ret = 0;
>   
>   	/*
>   	 * On LoPAR, ibm,query-pe-dma-window outputs "IO Page Sizes" using a bit field:
> @@ -1176,11 +1177,10 @@ static int iommu_get_page_shift(u32 query_page_size)
>   	 */
>   	for (; i >= 0 ; i--) {
>   		if (query_page_size & (1 << i))
> -			return shift[i];
> +			ret = max(ret, shift[i]);
>   	}
>   
> -	/* No valid page size found. */
> -	return 0;
> +	return ret;
>   }
>   
>   static struct property *ddw_property_create(const char *propname, u32 liobn, u64 dma_addr,
> 
