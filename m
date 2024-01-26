Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B90B83DD33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 16:14:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XC+xYVUn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM1Sl0X5bz3cNV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 02:14:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XC+xYVUn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM1Rw23l0z30Dg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 02:13:48 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40QEThEh012122;
	Fri, 26 Jan 2024 15:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sYJj3Lxyxkh7Odj2MxxHOdVdCf9KKsefqAtu7UyDJHM=;
 b=XC+xYVUnTlJBI9/nRLlPHw6Ngkk3/8IQeAUOlQfKSz3q+JS8IgnuiCsPfc3QAJLTLWOd
 88KrtrBWeur4hr0BajKn4KGKoTrWhCmTbUvbThidBhhNki3bazS/jTSC9uwvtH+NcYvZ
 +PrMCxs2F5CWqHi0wq22QhDD/Bb85Vdb2xWWuiFHpL2/oUs+gRNh6bvmbjWEuYEGJiv5
 /HHDXu45easPDbh3OUogd1jNQmlOghx6qVVx3gh5zUtLPRzoSWR/QAwlByRsYYac65+p
 aVB50NzUleHNk8BictuskAfiZCNKRUpjkjUAmzflBCjsohQoceeKvyOIAdzQAQVr3quJ qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvb9pe1ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:13:22 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QEuvTK011199;
	Fri, 26 Jan 2024 15:13:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvb9pe1hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:13:21 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40QDJKe0028225;
	Fri, 26 Jan 2024 15:13:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vru732ydx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:13:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40QFDHOn36176202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jan 2024 15:13:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D39A720049;
	Fri, 26 Jan 2024 15:13:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED3A520040;
	Fri, 26 Jan 2024 15:13:13 +0000 (GMT)
Received: from [9.43.53.156] (unknown [9.43.53.156])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jan 2024 15:13:13 +0000 (GMT)
Message-ID: <b825dd04-3d32-4fbd-91e3-523ddf96fc7a@linux.ibm.com>
Date: Fri, 26 Jan 2024 20:43:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc: iommu: Bring back table group
 release_ownership() call
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <20240125155017.GW50608@ziepe.ca>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <20240125155017.GW50608@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TT-kCwoKaQRQRNZltl0PGeSZu0KO1M2s
X-Proofpoint-ORIG-GUID: y9E3c62hkdA1WHVDC7FqAteGfiDhjO7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260112
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 1/25/24 21:20, Jason Gunthorpe wrote:
> On Thu, Jan 25, 2024 at 06:08:39AM -0600, Shivaprasad G Bhat wrote:
>> The commit 2ad56efa80db ("powerpc/iommu: Setup a default domain and
[snip]
>> +		/*
>> +		 * The domain being set to PLATFORM from earlier
>> +		 * BLOCKED. The table_group ownership has to be released.
>> +		 */
>> +		table_group->ops->release_ownership(table_group);
>> +	} else if (platform_domain->type == IOMMU_DOMAIN_BLOCKED) {
>> +		table_group = iommu_group_get_iommudata(grp);
>> +		ret = table_group->ops->take_ownership(table_group);
>> +		iommu_group_put(grp);
>> +	}
> Sure, but please split the function, don't test on the
> platform->domain_type.
Sure.
> Also, is there any chance someone can work on actually fixing this to
> be a proper iommu driver? I think that will become important for power
> to use the common dma_iommu code in the next year...
We are looking into it.
> Sort of like this:
>
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index ebe259bdd46298..0d6a7fea2bd9a5 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -1287,20 +1287,20 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
>   	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
>   	struct iommu_group *grp = iommu_group_get(dev);
[snip]
> +static const struct iommu_domain_ops spapr_tce_blocked_domain_ops = {
> +	.attach_dev = spapr_tce_blocked_iommu_attach_dev,
> +};
> +
> +static struct iommu_domain spapr_tce_blocked_domain = {
> +	.type = IOMMU_DOMAIN_BLOCKED,
> +	.ops = &spapr_tce_blocked_domain_ops,
>   };
>   
>   static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)

I have posted the next version as suggested.

Thanks for the quick review!

Regards,

Shivaprasad


