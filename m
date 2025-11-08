Return-Path: <linuxppc-dev+bounces-13963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6CC426CE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 05:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3NDH3BDpz3069;
	Sat,  8 Nov 2025 15:26:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762575999;
	cv=none; b=H+yNinA5R4Afm8aTgY8PgfZ0BSDeMEeKEEAJSSgHNc5f+U2miWCWmg53tHWMwh40VijpYT39askWDjT+XT/kcZf5OczpqVDqV/ZJzRbTqgoGjzHnP2vLsCVIs01nlrcDBkm/j5z7ZR5wQZWWg1eti6iz1N0pstttWwO4abQIq7gg8GNLJmwwNLKkDdMSsgwiz93a5AHg0XNQbFa6OoWzUnvyi2np0PYq//lQSJ3IzK/T4IfeXy1c2+lSZoGp6/dJTxlwfSTitQmUT6sWog3tTXmW8oHOe5QqOB5KPVThXFKDzzL75kRPfZ4xAjwwkJEnoayhxw2riYdwn8uLoF87dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762575999; c=relaxed/relaxed;
	bh=PVeT9y3RWDD3B/XC1iBfCoGemPCNDWw+wApB5+mFwaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDq4QwMBNO0+2KZ80mvlOp88DAd4C9k4SDkyeRa54/am12850zzkD2oj4GICnnkfIpagF6tAazmdEYC8Tq/APQsJbtaiikzjaX5OTjE2n/oPltJb7yJz+eSqw0DXBkLKh+rA7i8HGNcmkmI0oDEWwrNSha27+CclgvCjln0vwWq9/lE3SE3M3jwJkHWOJr2xnBNfFLVCp7NLuVJccrKxWAA9iFgq2HQfLVNRMlCpZrcr3/5zKuaTayeqZV753vi9k9pdPOnzi0g0hcFJLxiYULPpEaJIGsSk+ZCx5hkeMMGs40sQ0bS3ZsTel9H3bTN0iNZUGlcOFuNLop1dMeJ9hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNFnyd/y; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNFnyd/y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3NDG36gDz2yqh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 15:26:38 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A84HQGF021783;
	Sat, 8 Nov 2025 04:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PVeT9y
	3RWDD3B/XC1iBfCoGemPCNDWw+wApB5+mFwaQ=; b=tNFnyd/yEALZR2GNpzb0VL
	/1s0QHJ2DhufPyaALcJcPl9eJI54PArLIasa/DF715zUPUtkyKDzJb0weQg0Hab3
	q1v/WNqPT2uXm9fKQK0n/X2knbz/RpkrwO9DbjUBuYlOSNHpbVoKhdg5iheheMKh
	CsKhDavAe12syABhmwepelbHaTbiFY5F8YSN3p0EP2qwQ3dDoZMP8iw3do0+U85a
	f+JBRU53D4WRd1axGGqX8SG9+Vtgfs28xzGpNLRnj1BJGszfAT/z6ZL7VLG7bhdX
	W+qZvC4phZpbKBJwwMckbgcvfpjYmgic49G6co6rDSh8mgrc4G1qZmnhbdrb7XZg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9u9pgg3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 04:26:24 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A84QOXX001273;
	Sat, 8 Nov 2025 04:26:24 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9u9pgg3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 04:26:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A80PbcK012923;
	Sat, 8 Nov 2025 04:26:23 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y82ds0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 04:26:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A84QJW016449928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Nov 2025 04:26:19 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5157A20043;
	Sat,  8 Nov 2025 04:26:19 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC79720040;
	Sat,  8 Nov 2025 04:26:09 +0000 (GMT)
Received: from [9.124.216.170] (unknown [9.124.216.170])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Nov 2025 04:26:08 +0000 (GMT)
Message-ID: <7ad5c02f-63b1-404b-97a1-d7237220f6f7@linux.ibm.com>
Date: Sat, 8 Nov 2025 09:56:05 +0530
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
Subject: Re: [PATCH v7] powerpc/kdump: Add support for crashkernel CMA
 reservation
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
References: <20251107080334.708028-1-sourabhjain@linux.ibm.com>
 <87a50x450c.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87a50x450c.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAwMCBTYWx0ZWRfXydWUh1taKWy7
 BbywdaN6hGeSpEcCBvDfRsxoja0uBz4N6/ROKGiCPHSlJcyxBYUcjJgsj6kAXZfuEI+lvrsourc
 4MWvrjt6x82taVUsM4XVW28Hc2vV+VPd2tS+NcUa1AQRBTFo6jSlvvSrnDO4DhsNUxOzcXVK07k
 yaUb1zTF3UDYEBlbiUISlFDgknQbK9AxQ2GfPksfTaYHRnrxk+HAUEdF2AE/nQfG7T3B1D4XPu3
 UnPuQ+JUuYaktU3cAwHL5RaiaaUssp1lywXDotTtGG0UCpYRBPtZrn6qxWXoyq+n/4n3lrlPKig
 jLCIIBe6mYAfrvhrenObup0vH9GZJDTyI2OIVoXrTWgn7l6a0kS/W5n8YLFVF7x+iyUbCi1hCpt
 S6vgnMRgd7ed4KIbHOMO+JLgOvOu1Q==
X-Proofpoint-ORIG-GUID: lH5l2aBH3V6mv-od1dKTWDkfi-YMJg5U
X-Authority-Analysis: v=2.4 cv=JdWxbEKV c=1 sm=1 tr=0 ts=690ec670 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=JfrnYn6hAAAA:8 a=EzRo69HG9eLfTM0II18A:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Iqi9hMTUtNIZ9Wv_CQp6yieZCwE6P0be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 08/11/25 08:14, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
>> crashkernel= command line option") and commit ab475510e042 ("kdump:
>> implement reserve_crashkernel_cma") added CMA support for kdump
>> crashkernel reservation.
>>
>> Extend crashkernel CMA reservation support to powerpc.
>>
> Yup, would be nice to see this support landing in powerpc!
>
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
>> Update kernel-parameters.txt to document CMA support for crashkernel on
>> powerpc architecture.
>>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Jiri Bohac <jbohac@suse.cz>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>> Cc: kexec@lists.infradead.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>> Changelog:
>>
>> v6 -> v7
>> https://lore.kernel.org/all/20251104132818.1724562-1-sourabhjain@linux.ibm.com/
>>   - declare crashk_cma_size static
>>
>> ---
>>   .../admin-guide/kernel-parameters.txt         |  2 +-
>>   arch/powerpc/include/asm/kexec.h              |  2 +
>>   arch/powerpc/kernel/setup-common.c            |  4 +-
>>   arch/powerpc/kexec/core.c                     | 10 ++++-
>>   arch/powerpc/kexec/ranges.c                   | 43 ++++++++++++++-----
>>   5 files changed, 47 insertions(+), 14 deletions(-)
> Although my reviewed by may not count much here since I am not deeply
> familiar with arch/powerpc/kexec/** part..
>
> But FWIW, the patch overall looks logical to me.
> Keeping cma reservation in setup_arch() is the right thing to do to
> avoid issues like these in past [1]. The error handling logic and the
> loop logic for handling CMA ranges also looks correct to me.
>
> So feel free to add:
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>
> [1]: https://lore.kernel.org/linuxppc-dev/3ae208e48c0d9cefe53d2dc4f593388067405b7d.1729146153.git.ritesh.list@gmail.com/

Thanks for the Review Ritesh.

- Sourabh Jain

