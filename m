Return-Path: <linuxppc-dev+bounces-8236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C8AA69B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 06:13:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpcwD2MDzz2ymg;
	Fri,  2 May 2025 14:13:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746159180;
	cv=none; b=SxapSz957W8gb0j1H7uMfYozPS3qsJRQpFOuv3YISuxYvbikujpNppeA9NyIemwxmi2fOCTGKi3HLySwItNhsP6UwpP2eXM1U0NC780zfF+JfdTLHBrs6syuuU3rMDzRZgOmbQrjXxM3R4LEjZDg76cVRvs6/Wr72yaNFwpktn3Oi3+d/Yuv9VFiiD+1HdzhC0aJoRybCdUTYvvqL+Eq0m0A+lCfby3RjLnRUUyvJkrBdtUrHgitVmyN0NMgHzbQjWj4WFHHclrXuEdjyI0xjx89ujmgOd5lXH2iqPXK/3YvBZhTg1gmeCweTMsTvnynKiQ9qrJWM4iB6TbjWMQ3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746159180; c=relaxed/relaxed;
	bh=NcmWfthnPHQDUlzxLJaKRULCubnGPMFdKqEnETJKvi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoZei5m765O2KVoF2KsURXHoDxEVQRLJt87QuPog3UDIT67kO1sB0IYERyvoNJJXTiWNd+RhLfHOVHwzZz6fnKbD/ETqQmCRP3n/zHVf5L8N9fI5RHZjhVybWW3qSHcAWK6WnqRzSU91CoPhlXjh8kygJBiyctKafLUx/Jo1fVz7SdKvB0Rve53ZTMJBojE47CABgZVtjs+A+7vUcbfpvAEoE6fuUwMLCoVhjcPSIR78KPbZCqsq6bqDc9gChLGkz+P7+tmKFAE2zYTfe5T3vTQ6UgEn27bx8pe+XyOemg+kP/DZUxMNzhrcyQd1lr0szCxJFF+//wuOjx/4n4tThw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CFFMvJLv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CFFMvJLv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpcwB62Vyz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 14:12:58 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541LrEGC022584;
	Fri, 2 May 2025 04:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NcmWft
	hnPHQDUlzxLJaKRULCubnGPMFdKqEnETJKvi0=; b=CFFMvJLv6goEMBuEWNCf7u
	RpRpU1NrLwsFa2Ft/t2QTa2NeW0yoFWDjC6ChDc1AIpGXbDpLkfSfBUta4/4GJKY
	6y0fRHJzWy+d3K8jfQ7QzT2e3QP7tLCjefN5t9o29oBJxGhPq781T+l2TzXxSiSf
	LU/Pr3GYp5aaCgcd3hkPODSg+0zaeiPyp+26y49g4jf8AcM826nlFfRcVgWgnNcs
	/mRa0zme8506MRZvQGiNzCOYFJDqhHzECaZyEh61ouROMyuQqjZicZUcFAr6c0/z
	bW1TSlz5vxo5viSZp44BbxvXB5oF1trFZKUr+m5+JRklj317m/ATph41LvFXWLCw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c6vjm3kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:12:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5424Cm6a000563;
	Fri, 2 May 2025 04:12:48 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c6vjm3kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:12:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5422jIvj001917;
	Fri, 2 May 2025 04:12:46 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469ban04t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:12:46 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5424CiMO59244888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 04:12:44 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBC3358045;
	Fri,  2 May 2025 04:12:44 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F32758056;
	Fri,  2 May 2025 04:12:40 +0000 (GMT)
Received: from [9.43.91.235] (unknown [9.43.91.235])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 May 2025 04:12:39 +0000 (GMT)
Message-ID: <5a23e0d7-f32a-4097-b3cc-dcccb7355778@linux.ibm.com>
Date: Fri, 2 May 2025 09:42:37 +0530
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
Subject: Re: [PATCH] Documentation: Fix description format for powerpc RTAS
 ioctls
To: Bagas Sanjaya <bagasdotme@gmail.com>, Haren Myneni <haren@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: sfr@canb.auug.org.au, tyreld@linux.ibm.com, linux-next@vger.kernel.org,
        hbabu@us.ibm.com
References: <20250430022847.1118093-1-haren@linux.ibm.com>
 <aBHodTu4IjqzZeXb@archie.me>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <aBHodTu4IjqzZeXb@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAyOSBTYWx0ZWRfXzVZkK5Vh47hh U5hk5uEBRf6bDlKdURulHgavbmYlhdPgZyRGeHnzbOVzk8czpnzjfrq3g+KlhZtb5SXYw4aIgjx et44aeDf/7Wy7bISyvQMz7238OqwXz0n/c6MUXJSY1IZNz8kJKPnkYd6dORp121tMnvmI92e6SN
 kAd8ZBG2EKL1z4he2tzrOuAjitA0I6Ig8i6aw0npGBLhybu4yh8fKWejrcGYjzSARTX5iwjTY2B viGxmh3p3DnaMB/9I/uJbGc7jGogzk1SKTbFTPM7iNtO5JVD7/bUUDBtBk9+7gJwpjoSE8xBD0x kG70DRGkvd2CjxtdAw+T+BVwJkDph+Nw5kzvuM5oBPR4FxHL1N6q2Ztqq3hS9htPFJe6XCKpF8g
 uRYeriVop0CE5FYZE6bMTPuhagWuoZhZRPJq9RTkIX7valLHIHNzYonJDW3jThr6jDJDeDwu
X-Authority-Analysis: v=2.4 cv=GI8IEvNK c=1 sm=1 tr=0 ts=68144640 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8
 a=rmmP8zxhHohSwG9kuDgA:9 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: x3m5nFGnMEqquqfDHny04VVUZk9aa5AT
X-Proofpoint-ORIG-GUID: QcLHAZmg28OdBOefPxG_iYrewZ3MnegJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020029
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/30/25 2:38 PM, Bagas Sanjaya wrote:
> On Tue, Apr 29, 2025 at 07:28:47PM -0700, Haren Myneni wrote:
>> Fix the description format for the following build warnings:
>>
>> "Documentation/userspace-api/ioctl/ioctl-number.rst:369:
>> ERROR: Malformed table. Text in column margin in table line 301.
>>
>> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
>> powerpc/pseries indices API
>>                             <mailto:linuxppc-dev>
>> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
>> powerpc/pseries Platform Dump API
>>                             <mailto:linuxppc-dev>
>> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
>> powerpc/pseries Physical Attestation API
>>                             <mailto:linuxppc-dev>"
>>
> 
> Hi,
> 
> FYI, I've also submitted the fix earlier at [1] (but different approach).
> ppc maintainers, would you like taking this patch instead or mine?

Looked your patch (thanks for the link) and it is more of generic clean up. 
I would prefer to take Haren patch now since it fixes the specific failure
case. But would encourage you to send it as generic cleanup patch.

Maddy


> 
> [1]: https://lore.kernel.org/linuxppc-dev/20250429130524.33587-2-bagasdotme@gmail.com/
> 
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls")
>> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
>> Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestation RTAS")
>> Closes: https://lore.kernel.org/linux-next/20250429181707.7848912b@canb.auug.org.au/
>> ---
>>  Documentation/userspace-api/ioctl/ioctl-number.rst | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
>> index 017a23aeadc3..fee5c4731501 100644
>> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
>> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
>> @@ -366,11 +366,11 @@ Code  Seq#    Include File                                           Comments
>>                                                                       <mailto:linuxppc-dev>
>>  0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
>>                                                                       <mailto:linuxppc-dev>
>> -0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerpc/pseries indices API
>> +0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            powerpc/pseries indices API
>>                                                                       <mailto:linuxppc-dev>
>> -0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerpc/pseries Platform Dump API
>> +0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      powerpc/pseries Platform Dump API
>>                                                                       <mailto:linuxppc-dev>
>> -0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
>> +0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    powerpc/pseries Physical Attestation API
>>                                                                       <mailto:linuxppc-dev>
>>  0xB3  00     linux/mmc/ioctl.h
>>  0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
> 
> In any case,
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> Thanks.
> 


