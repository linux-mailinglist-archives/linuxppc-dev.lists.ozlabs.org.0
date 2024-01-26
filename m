Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D683DD49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 16:20:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WbCFRpYo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM1bC5SYRz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 02:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WbCFRpYo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM1ZS15bvz2yk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 02:19:27 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40QF2DcZ006856;
	Fri, 26 Jan 2024 15:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=V5LjmVGdzbJgz18a5DWViGzLHhFurvsunSeYcuKPsjs=;
 b=WbCFRpYoR0SMUpTyr4yZQ15GGHaNY3SD/MaN0AE/direuhl9CmKTKSnJ8BGIj1a4hTLT
 zuG3ySe9KOyFovBnYlFf88QElSch9MoQJm/EAMo0CxZOVDeQX5LsENuatc4GkRbadQTj
 GtXxzAJo2DYGEjODDaJmV+gqIKQrJetBivW5c3ciNPEgpNFT1+TVkTpmuBAZw843cKHy
 s3PnyjxHTDmcDN24hjdB13KLd2Xl3SKaTyNfPYOo2oU36Kj79yuSCZ6LLF9I6RAzS4Qy
 vSF/Kka+Gun1qaD/aco9VQGoh61UX5ewRXtJSagVUoQb35tEuemSr1GZXQtO4NfZ2r5H CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vveeuhdyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:19:13 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QFBR58012048;
	Fri, 26 Jan 2024 15:19:12 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vveeuhdy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:19:12 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40QDaFVO026475;
	Fri, 26 Jan 2024 15:19:12 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrrgturbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:19:12 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40QFJ9hC40501952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jan 2024 15:19:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2920220049;
	Fri, 26 Jan 2024 15:19:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0EAF20040;
	Fri, 26 Jan 2024 15:19:05 +0000 (GMT)
Received: from [9.43.53.156] (unknown [9.43.53.156])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jan 2024 15:19:05 +0000 (GMT)
Message-ID: <c03f81bb-3a50-4191-9884-25a914e60672@linux.ibm.com>
Date: Fri, 26 Jan 2024 20:49:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu: Fix the domain type checks when default_domain
 is set
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <170618452753.3805.4425669653666211728.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <20240125155257.GX50608@ziepe.ca>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <20240125155257.GX50608@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yx0JUC79HWRFCurxWhU3gNr5kY8QHd-K
X-Proofpoint-ORIG-GUID: c2je4RH8m4kTZROvYF205gx-VdNobq8C
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=987 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401260112
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

On 1/25/24 21:22, Jason Gunthorpe wrote:
> On Thu, Jan 25, 2024 at 06:08:52AM -0600, Shivaprasad G Bhat wrote:
>> On PPC64, the iommu_ops.def_domain_type() is not defined and
>> CONFIG_IOMMU_DMA not enabled. With commit 0f6a90436a57 ("iommu: Do not
>> use IOMMU_DOMAIN_DMA if CONFIG_IOMMU_DMA is not enabled"), the
>> iommu_get_default_domain_type() return IOMMU_DOMAIN_IDENTITY. With
>> commit 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove
>> set_platform_dma_ops"), the defaule_domain is set wih the type being
>> PLATFORM. With these two changes, iommu_group_alloc_default_domain()
>> ends up returning the NULL(with recent changes, ERR_PTR(-EINVAL))
>> leading to iommu_probe_device() failure and the device has no
>> iommu_group set in effect. Subsequently, the bind to vfio(VFIO_IOMMU)
>> fail as the iommu_group is not set for the device.
>>
>> Make the iommu_get_default_domain_type() to take default_domain->type
>> into consideration along with default_domain_type() and fix
>> iommu_group_alloc_default_domain() to not error out if the requested
>> type is same as default domain type.
>>
>> Fixes: 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove set_platform_dma_ops")
>> Fixes: 0f6a90436a57 ("iommu: Do not use IOMMU_DOMAIN_DMA if CONFIG_IOMMU_DMA is not enabled")
>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>> ---
>>   drivers/iommu/iommu.c |   14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
> Are you OK with this version?
>
> https://lore.kernel.org/linux-iommu/20240123174905.GS50608@ziepe.ca/
>
> ?
>
> I think it does the same thing

Yes, This works. I see a very minor difference of default_domain->type 
is given

precedence over def_domain_type(). Please keep me CC when you post this 
fix, I'll

test it with any(?) other changes if coming along with it.


Thanks,

Shivaprasad

> Jason
