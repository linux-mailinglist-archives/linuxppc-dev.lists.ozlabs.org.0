Return-Path: <linuxppc-dev+bounces-13626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B03C2351C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 07:06:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyVqS6Mcmz2yD5;
	Fri, 31 Oct 2025 17:06:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761890804;
	cv=none; b=AtLG3Ss/zyIQi+asfGgtfrpZZT90UGyEngCF7IXtvKb/uY+2/MAUPisCuQwbZcnFOMGBMH2ILhbdN0jRcXxtbsNm0z6bicyuikgewxsHTX059so6+1GsogBfdfYGMJb8x6zzz6QqEFpR4awN84lOIXKJDC42Ir1+RYg+K9C+UbyTitJJdj8O7zo/saXZ8b1CYZon45Gpw6at77IevIj6VPiGvFRdgC5xGtux7CIIm6M5EzXAqtPVlX8FbO3Le2ugMtFcASSRmZp+UZ2hVSVpfPWSSYWOmlv/dJ0YISmnICoPqc72bkRGZlNCUkt4fmBsXpiTVlV/htr6pjXDuo7DWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761890804; c=relaxed/relaxed;
	bh=R6V3yZW0l/ZuPMuhue4BGiQ9ElUn3osiq6Pn9XZ3A2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxMPM9fp0SEi9y4EfQfc5MHcBWJg3O1g1XQrgjauTngKxHlpiQunYnVNWLLBS1sJ1IeHybCKkr78WBfUQgBx6gAa02iMX7AU8KLDfTG0J6fLkfpCIJiqd6aswTO4wPscn7YPDRgYm5c5xOItC/S1rWlnoP3zMFQK5ghrG+FvRV+0l4cR6b8+WZpM2gYYbCYsrhwzVT7+I42nB9CrL8AHxKqCVUuzSDjKk+hcZTTd/HetYvW00E1gq7HgKmDtMCoONsXtKZwyvDqYAHA7iGE+Q+4B4xAUtWXv4gi5wKZtN1tFl5pAlCTBN2Y5OAheBLg1A0+l7TUnN1FWtnGAYDR1kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ixbZvzNd; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ixbZvzNd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyVqR717Nz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 17:06:43 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59UL2dTt025645;
	Fri, 31 Oct 2025 06:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=R6V3yZ
	W0l/ZuPMuhue4BGiQ9ElUn3osiq6Pn9XZ3A2I=; b=ixbZvzNdaMIv4UL5xZNjnM
	cYT03fHIAWKMuufSkoaJKdm4ePIOOUIFxp2WPqTDhUi12xpGz/r7gQ9t5Eukoq61
	MRB1znPEaQUSBbrOfbJeQfOE2DnXzJ4km5Cdt3k/UAe7RFqV/APei0+koH4Z2DGe
	wjMwbp3ohwZaQEgAXkcPWFCVEKrgBEfnHWNWNCAsePKf3dk/+teJ2u/0jdKk/Ust
	QFGl9I9fqYact3/6aaDdXtFLIfIEji/XYPLNptz8tmXUNUBM5bmPkhXt4ovebx1C
	alH/ou8iX+/loBShzb6V79VTHYhNqb4wBnISiRjNupcnLZ8yyEWkKNCqTP/Sp6wA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34acve6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 06:06:34 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59V66XLX006555;
	Fri, 31 Oct 2025 06:06:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34acve6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 06:06:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59V41kvA027440;
	Fri, 31 Oct 2025 06:06:32 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33w2vu5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 06:06:32 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59V66RpD22086396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Oct 2025 06:06:28 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0B702004D;
	Fri, 31 Oct 2025 06:06:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89F8F20040;
	Fri, 31 Oct 2025 06:06:25 +0000 (GMT)
Received: from [9.39.29.119] (unknown [9.39.29.119])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Oct 2025 06:06:25 +0000 (GMT)
Message-ID: <c6ce9b94-1126-49fd-869b-76a7e386a7d1@linux.ibm.com>
Date: Fri, 31 Oct 2025 11:36:24 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] powerpc/kdump: Add support for crashkernel CMA
 reservation
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
References: <20251030100955.1453314-1-sourabhjain@linux.ibm.com>
 <87o6pn7mfp.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87o6pn7mfp.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XbuEDY55 c=1 sm=1 tr=0 ts=690451ea cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8
 a=voM4FWlXAAAA:8 a=JfzW0AR9OPTSPtXaDBAA:9 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: aAE5Xlg14hs2CkRXlvpqYg-Ddux9tUJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX0Oyo/DVOR6fc
 tmbzz7QQ4AEDtTRu1pUZqTKVfTVbn+6OU75fnRofjYmgp5fuQFCRZfPsZACRBP6IoF6vg0RLyzd
 zF85zKKz6lGtohiX4obPHnN9L+nT7Auz+9gDcLXwy4nSaQDWTJGitt3QGsrJy6Lt0tVpKeEZ+l0
 jxcUEGz39DjS47uQyMOvjfqtW45LBHhpllx+UAG1XSpAuvQTwy8oHr32Ez26A5OFkXCRJd7y7zZ
 73jROdINeN81e+pm45XxIkqo/K8XSCJDvaHcxwcRrs6AG+7NFrLOVhnJ2mMUL2yNy+7/DO0oyll
 umMwL7CmBa4HJufZyes9xY0of43al8fzpeJETHVuFvs6B3NzCXplajne/oCLCUGps2u/LKSkqWD
 btnJG6bWPyF0v8xA9FQJSgjgZaBjBA==
X-Proofpoint-GUID: AiBJWSNMmrs4vpRDUqPedA2zDa4t0-5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ritesh,

On 31/10/25 09:27, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
>> crashkernel= command line option") and commit ab475510e042 ("kdump:
>> implement reserve_crashkernel_cma") added CMA support for kdump
>> crashkernel reservation.
>>
>> Extend crashkernel CMA reservation support to powerpc.
>>
>> The following changes are made to enable CMA reservation on powerpc:
>>
>> - Parse and obtain the CMA reservation size along with other crashkernel
>>    parameters
>> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump
>> - Include the CMA-reserved ranges in the usable memory ranges for the
>>    kdump kernel to use.
>> - Exclude the CMA-reserved ranges from the crash kernel memory to
>>    prevent them from being exported through /proc/vmcore.
>>
>> With the introduction of the CMA crashkernel regions,
>> crash_exclude_mem_range() needs to be called multiple times to exclude
>> both crashk_res and crashk_cma_ranges from the crash memory ranges. To
>> avoid repetitive logic for validating mem_ranges size and handling
>> reallocation when required, this functionality is moved to a new wrapper
>> function crash_exclude_mem_range_guarded().
>>
>> To ensure proper CMA reservation, reserve_crashkernel_cma() is called
>> after pageblock_order is initialized.
>>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Jiri Bohac <jbohac@suse.cz>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>> Changlog:
>>
>> v3 -> v4
>>   - Removed repeated initialization to tmem in
>>     crash_exclude_mem_range_guarded()
>>   - Call crash_exclude_mem_range() with right crashk ranges
>>
>> ---
>>   arch/powerpc/include/asm/kexec.h   |  2 ++
>>   arch/powerpc/kernel/setup-common.c |  4 ++-
>>   arch/powerpc/kexec/core.c          | 10 ++++++-
>>   arch/powerpc/kexec/ranges.c        | 43 ++++++++++++++++++++++--------
>>   4 files changed, 46 insertions(+), 13 deletions(-)
>
> I am not much familiar with the crash kernel workings but was curious
> about the following query related to this patch:
>
> As I understand this patch allows for the remaining crash kernel
> memory to come from CMA region. But do we limit the CMA region to be lower
> than 4G?

No we are not and we don't need to.

> Is this patch dependent over your other patch series [1] which
> supports high crashkernel reservation?
>
> [1]: https://lore.kernel.org/linuxppc-dev/20251027151338.819957-1-sourabhjain@linux.ibm.com/

No, this is an independent patch.

>
>
> A minor comment: I guess we could reflect the support for ,cma for PPC
> too in Documentation/admin-guide/kernel-parameters.txt like how it is
> done for x86.

Yes we should. I will make the change in the next version.

Thanks for the review.

- Sourabh Jain

