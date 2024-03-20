Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D505188149D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 16:30:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xf4yX4sB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0CGc3Cvrz3dWc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 02:30:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xf4yX4sB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0CFs1NtLz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 02:30:08 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42KEeUaH015103;
	Wed, 20 Mar 2024 15:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=41QkvDnloJQpHX/mvmIYkk7SfwYlD2OLUl5OMcCY33U=;
 b=Xf4yX4sBcM/5YZ5wFHEuwuel+wMeDDdQUKh64jmhaw63hVRdiSaRV1O4hilgS7AXHeOH
 tMJ+3uK+g6mrNaC3OD6pIcdL10dKd2Isz0TRhcu1WYYnSJDwIpmBnNTe9m2h+mWu7FGL
 ycO/TWEGti0glZyp46GX9EYsXdDg1I/fJkW2Od2LhG6CUixRJVG45dr6bYfHa9KHsJ3U
 gjpA+9IMSzh1dcvhgS8vcpZbHDe37FdpE5cJYYcr7adOoi3KA+HXece0Zkyc1tTRGJgD
 G/f6f6oPorSpDewWL5OXRYZ5Y6Ir+Giip9lZB+TZgWvnLWlx8R/fmX91I9dWf5hpgh28 oA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x01rw04d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 15:29:53 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42KFTrrV030362;
	Wed, 20 Mar 2024 15:29:53 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x01rw04d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 15:29:53 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42KDEN9D019843;
	Wed, 20 Mar 2024 15:29:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wwqykps5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 15:29:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42KFTkHn52363644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Mar 2024 15:29:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C202F20065;
	Wed, 20 Mar 2024 15:29:46 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E17F20040;
	Wed, 20 Mar 2024 15:29:41 +0000 (GMT)
Received: from [9.43.11.243] (unknown [9.43.11.243])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 Mar 2024 15:29:40 +0000 (GMT)
Message-ID: <0514fb50-443d-427f-ac5b-a29679b6938b@linux.ibm.com>
Date: Wed, 20 Mar 2024 20:59:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] powerpc/pseries/iommu: Bring back userspace view
 for single level TCE tables
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com>
 <171026725393.8367.17497620074051138306.stgit@linux.ibm.com>
 <20240319143202.GA66976@ziepe.ca>
Content-Language: en-US
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <20240319143202.GA66976@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 05_um4XcOnvDcBpMa4NSeN7Rh3q98Cpl
X-Proofpoint-ORIG-GUID: _jYtsAZMxDuH7SH4XYs0QdvBkKr_lJ4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403200123
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, kvm@vger.kernel.org, gbatra@linux.vnet.ibm.com, aik@ozlabs.ru, alex.williamson@redhat.com, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, tpearson@raptorengineering.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jason,

On 3/19/24 20:02, Jason Gunthorpe wrote:
> On Tue, Mar 12, 2024 at 01:14:20PM -0500, Shivaprasad G Bhat wrote:
>> The commit 090bad39b237a ("powerpc/powernv: Add indirect levels to
>> it_userspace") which implemented the tce indirect levels
>> support for PowerNV ended up removing the single level support
>> which existed by default(generic tce_iommu_userspace_view_alloc/free()
>> calls). On pSeries the TCEs are single level, and the allocation
>> of userspace view is lost with the removal of generic code.
> :( :(
>
> If this has been broken since 2018 and nobody cared till now can we
> please go in a direction of moving this code to the new iommu APIs
> instead of doubling down on more of this old stuff that apparently
> almost nobody cares about ??

We have existing software stack deployments using VFIO userspace
device assignment running on Power platform. We have to enable
similar software stack on newer generation Power10 platform and
also in a pSeries lpar environment. These distros rely on VFIO enabled
in kernel and currently have IOMMUFD disabled. This patch series is
a simpler low risk enablement that functionally get the software stack
working while we continue to enable and move to IOMMUFD in phases.
We have to fix the older APIs in order to stage the functional enablement
in small increments.

We are working on iommufd support for pSeries and looking forward
to Timothy's patches.


-Thanks

Shivaprasad

> Jason
