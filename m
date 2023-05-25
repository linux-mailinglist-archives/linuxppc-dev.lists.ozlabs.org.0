Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967F710E7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 16:41:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRrNG1NsWz3fC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 00:41:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iFhMvIy9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iFhMvIy9;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRrMP4630z3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 00:40:49 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34PEOPkl026559;
	Thu, 25 May 2023 14:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=R1GkNtKti9cERxNOtAxnfWAATfuV39rXWYkisl+OJ7Q=;
 b=iFhMvIy9ne/PTXUV8VhyP7anh/xFjACxxDcQ4LPl1PG1B6Q1TEjbYc0ki3v2EWLI8dc8
 9S/TuqGrYZpVOeJ4NrNVEnnwXTx3TxexX/sfbXvZLmk4XqiF6kh+gCm8k2V0a4aOQJir
 CFvcyWWy6fr7bWSf18KFHuAWFImdxkS615VsrHchln+76DPiNFQseax2sB3+l6D5/WA0
 tR9eKV0TWxBU4F4YyTIFK6/a+1dCHbX8BrhZcEIlUW1OywqlUuVFViaxghOPbVoy+DFD
 TSlXdbDPnTyNWEWHn5S8+i/1DW+i8IpiDjM40QHwdtqFKeKFOmumexszXCTjgTVG4YgL gA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qt9dmrjwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 14:40:42 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34PCCSwe010909;
	Thu, 25 May 2023 14:40:13 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3qppdsa1s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 14:40:13 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34PEeClm62456184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 May 2023 14:40:12 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD0DE58063;
	Thu, 25 May 2023 14:40:12 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17A8D58043;
	Thu, 25 May 2023 14:40:12 +0000 (GMT)
Received: from [9.67.119.98] (unknown [9.67.119.98])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 May 2023 14:40:11 +0000 (GMT)
Message-ID: <855906e7-4494-6058-aad9-50732899d054@linux.vnet.ibm.com>
Date: Thu, 25 May 2023 09:40:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2] powerpc/iommu: limit number of TCEs to 512 for
 H_STUFF_TCE hcall
Content-Language: en-US
To: mpe@ellerman.id.au
References: <20230525143454.56878-1-gbatra@linux.vnet.ibm.com>
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <20230525143454.56878-1-gbatra@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mI0mtgYP46em60S6HarOV9jamUdK_Jxy
X-Proofpoint-GUID: mI0mtgYP46em60S6HarOV9jamUdK_Jxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_08,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305250119
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

Here are the changes in v2 of the patch

1. added some wording to change log to specify why we are seeing the 
issue now. Also added "CC: stable@vger.kernel.org"

2. changed "limit" to unsigned long. I have kept "rpages" as "long"

Thanks,

Gaurav

On 5/25/23 9:34 AM, Gaurav Batra wrote:
> As of now, in tce_freemulti_pSeriesLP(), there is no limit on how many TCEs
> are passed to H_STUFF_TCE hcall. This was not an issue until now. Newer
> firmware releases have started enforcing this requirement.
>
> The interface has been in it's current form since the beginning.
>
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
> Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index c74b71d4733d..f159a195101d 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -306,13 +306,22 @@ static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
>   static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long npages)
>   {
>   	u64 rc;
> +	long rpages = npages;
> +	unsigned long limit;
>
>   	if (!firmware_has_feature(FW_FEATURE_STUFF_TCE))
>   		return tce_free_pSeriesLP(tbl->it_index, tcenum,
>   					  tbl->it_page_shift, npages);
>
> -	rc = plpar_tce_stuff((u64)tbl->it_index,
> -			     (u64)tcenum << tbl->it_page_shift, 0, npages);
> +	do {
> +		limit = min_t(unsigned long, rpages, 512);
> +
> +		rc = plpar_tce_stuff((u64)tbl->it_index,
> +			     	(u64)tcenum << tbl->it_page_shift, 0, limit);
> +
> +		rpages -= limit;
> +		tcenum += limit;
> +	} while (rpages > 0 && !rc);
>
>   	if (rc && printk_ratelimit()) {
>   		printk("tce_freemulti_pSeriesLP: plpar_tce_stuff failed\n");
