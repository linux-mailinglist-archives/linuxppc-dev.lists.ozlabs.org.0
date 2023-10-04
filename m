Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C37B81E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 16:12:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gx9SBmXK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0xV45swqz3vXP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 01:12:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gx9SBmXK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0xT86J8Yz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 01:11:56 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394E8DxA011547;
	Wed, 4 Oct 2023 14:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UXZFFm9QVeNyHzZ2gPEIPfR4p7Ke3QK2THSLpRRIOns=;
 b=gx9SBmXKnMyTZj3UnRbNXjV9gBC1+X0lTtEfIGZxtkI422pjqrVyBvZ/3nUWEAiBzzGz
 hswa78QhSXp5gum64lc7vStP/S+nubdGkWNwXpvjIW3UUOyRAUZo+8IN6DZboEjQdMrZ
 2x9A8BtY2KYKI1Kv5ppceFkzG44t0+JYMtciCJBSlOlVRgFlbvauNQ11mpo1r7Bg/n/J
 yaBEbne9ZFeWUQ6x+HXZfUI+D/SAzUDFbUto10B78OVA9mU9E2dVKyZJNCtUUna1fqym
 R6iwwF1dnSAok6acih3/lyfYE91TkDxTSsINJ0rwnHa8lbIZoJNuT2ZQzi+sLliM33Dw yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3th9ahgfta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 14:11:42 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 394E8O89012117;
	Wed, 4 Oct 2023 14:11:41 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3th9ahgfsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 14:11:41 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 394D9QaR006749;
	Wed, 4 Oct 2023 14:11:40 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf07k50eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 14:11:40 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 394EBdBs35717470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Oct 2023 14:11:40 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C190658054;
	Wed,  4 Oct 2023 14:11:39 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FEBB5804E;
	Wed,  4 Oct 2023 14:11:31 +0000 (GMT)
Received: from [9.171.13.11] (unknown [9.171.13.11])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Oct 2023 14:11:31 +0000 (GMT)
Message-ID: <b15b5058-b45e-0ad7-788d-9fe3e1d90440@linux.vnet.ibm.com>
Date: Wed, 4 Oct 2023 19:41:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Bisected] [commit 2ad56efa80dba89162106c06ebc00b611325e584]
 [linux-next] WARNING while booting to kernel 6.6.0-rc3-next-20230929
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <d06cee81-c47f-9d62-dfc6-4c77b60058db@linux.vnet.ibm.com>
 <20231004113818.GD682044@nvidia.com>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <20231004113818.GD682044@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c-E1floQFZ09AiqSKDCuZTrycm-eIpFU
X-Proofpoint-GUID: hU-kh1cx1zTvA-CrruXSRw_FAmafyHdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_06,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040102
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
Cc: jroedel@suse.de, mputtash@linux.vnet.com, gbatra@linux.vnet.ibm.com, ruscur@russell.cc, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, sachinp@linux.vnet.com, abdhalee@linux.vnet.ibm.com, linux-next@vger.kernel.org, gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Jason. Yes the suggested changes works and Warnings are not seen.

On 10/4/23 17:08, Jason Gunthorpe wrote:
> On Wed, Oct 04, 2023 at 04:37:10PM +0530, Tasmiya Nalatwad wrote:
>>     Greetings,
>>
>>     [linux-next] [6.6.0-rc3-next-20230929] [git bisect ->
>>     2ad56efa80dba89162106c06ebc00b611325e584]WARNING: CPU: 0 PID: 8 at
>>     arch/powerpc/kernel/[1]iommu.c:407 __iommu_free+0x1e4/0x1f0
>>     gitbisect is pointing to the below commit
>>     commit 2ad56efa80dba89162106c06ebc00b611325e584
>>         powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
> I assume this means there are still sequencing problems with power at
> boot time. eg we turned on the dma ops in the wrong order or something
> like that
>
> As far as I can see the only difference here is that we do the
> operation to claim dma ops during the iommu drive probe. We can avoid that.
>
> Does this work for you?
>
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index d6ad3fde85a212..115b9031badac7 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -1280,13 +1280,19 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
>   /*
>    * A simple iommu_ops to allow less cruft in generic VFIO code.
>    */
> -static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
> -					       struct device *dev)
> +static int
> +spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
> +				    struct device *dev)
>   {
> +	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
>   	struct iommu_group *grp = iommu_group_get(dev);
>   	struct iommu_table_group *table_group;
>   	int ret = -EINVAL;
>
> +	/* At first attach the ownership is already set */
> +	if (!domain)
> +		return 0;
> +
>   	if (!grp)
>   		return -ENODEV;
>
>
-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

