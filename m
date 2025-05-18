Return-Path: <linuxppc-dev+bounces-8645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F07FABADB6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:55:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0Rm80Ws4z2ySX;
	Sun, 18 May 2025 13:55:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747540503;
	cv=none; b=b3ZmeXEMpj1udfcNopawzopYVF/QE4AXCyzgR/69DLAZnw43hPVS3ro2Tx2QYwx2Fy+ymfcQTz6HyHPEjtrXlvkUfHqq0Yb9bMlFpsTSh7O9vqfk1/Iin13wp/EeJz1WYfbRcAXfGwKhYoKaJc7QMW88i/LCbuVyfuI4SqmfyWvqCubP4WQfoPVdv0/sayLJEtWO9s+VuZos0A12+G6udDCr9kprBrCqFfsj5EMLuI5Hw4MB6BvNFgxGXwjsAnQ6aiVkNrVelrgUO38Oy4mLPgx3lmienFS4o6WzLDtmbKkazXIh9tTMp0I4xr/EKu8AykdcAhgLOYOInWUmtlnSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747540503; c=relaxed/relaxed;
	bh=oVflPJ55lFvsFPeeFhHuIJUliSlGWCMUxmruL0Z1r6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHrG8kzpP/ktzfcaYjKkagYITGwS+QBP/kSliTlEl1o3UM5+42sfba5cqbK5B8jheZhLD+eDDrqlxWzSXPZmkiMboo3F3C1lzfxcPBZmPJQCaH/RpcUiCTAZVwy7vSAN8iwFfUauRqD0p17WxdRoYmIHofzgYe6mEUae0fKQZT7dsGSsB0xZHlKAaY2/1gC4oN2mhw9QRvH8jibxhEWb9vAKMiQlttaaP0pP5ENKBt+JgjtQ8xoW6Sm187+m3fgBXDHIIYqG/rEAsjwpz9XwE+byNTEfFoSbJtXtOPC3k3TSnrFlrIsdo5ZZGF8RVUSIiiw+wwWeMu7hoAEpmcttRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mzW32hnF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mzW32hnF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0Rm66b0qz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:55:02 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I19nKL005796;
	Sun, 18 May 2025 03:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oVflPJ
	55lFvsFPeeFhHuIJUliSlGWCMUxmruL0Z1r6g=; b=mzW32hnFFUmhUo5ipo/6j+
	CwcrOVBpm34324+/QYZluA/Yl4iulyL2x8A6FgFcvN+rRyqO2D0+pidpwC4xg7BK
	/NPnvjILzRgJ3CiqjH4iz8Buv/9vNv0DP9FIv1yITuUk2YdnKks6JKRorOD8Y4gE
	LMxqUN+/E5w9yBc0vBvKbLzk3qD1wsgjKoWmuV/pcsBvb2kiAak2x2WLI5vi+5z6
	kImGnnVohzKq3/m0R74JyKHmhYCe29JSIHVWS+Ao6XpazNrkMbFeKl13M+RuNjmk
	NRq7RLIo6jOcqGQElYlsy6E0uMoX44mzmwm4y3QMU0s9a9zKPByXli9qmEviTsuQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q0389af0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:54:51 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3spg6014531;
	Sun, 18 May 2025 03:54:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q0389aex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:54:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I2gPjO007225;
	Sun, 18 May 2025 03:54:50 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q70k078j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:54:50 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3sn7w27263426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:54:49 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D7CB58056;
	Sun, 18 May 2025 03:54:49 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51ED358052;
	Sun, 18 May 2025 03:54:46 +0000 (GMT)
Received: from [9.43.51.82] (unknown [9.43.51.82])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:54:45 +0000 (GMT)
Message-ID: <350af9cb-c8ef-49af-b9f3-4992a09b4e4d@linux.ibm.com>
Date: Sun, 18 May 2025 09:24:43 +0530
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
Subject: Re: [PATCH 4/6] powerpc: fix sparse warnings
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250422131040.374427-1-maddy@linux.ibm.com>
 <20250422131040.374427-5-maddy@linux.ibm.com>
 <897452a6-4c78-4aa6-9f6a-18e8720076ae@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <897452a6-4c78-4aa6-9f6a-18e8720076ae@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BbyhTM3sXMIbsfAPR5NxP9poKURBoPY9
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=68295a0b cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=frwGynP7dnVe7aHyOEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX3mqUd54yzGMV riDX496KMYLlf4sUOrusMPyOhtO8CNI2keXsy2upiRD0jG3SrkQ0ozGrU56J45M4juUaptehqZU 83necIcCm7EdVOQb6H5ZoK3Eop1VOQzVgdEk31c+SJZK67tNdqclxg43CzIkOt10SlE42GxQeAb
 I/Rec1mjfExDKwTQNBFaX75aaROq5Rv+ghppK9hMh7qWhZArFtxdHtozx1nwcJsf6Zh6x5tUvrl 0iCpX5kAQStiHDfyAN6moAEc6FbjiVNCKBnUgVBikfOAufoAzx+eoDnb2u9ccIHQbH8q7wweXnL 7PdK3EGoEChAGHpe0r+xj/F/IxrFM4YVvEtokt7mDLLQqzLbFkSrX8HqYRQORIXrQHVrlwoYaYc
 1tmfW/JU6Asj3KopHnF5SKJLypbAnQXe7u5Ninj788n8dDHRQ0Xhqqwr7L8i60LmKEIsdDM+
X-Proofpoint-ORIG-GUID: c45oFZDeL4Hk9yUU2FPSX8J1l69M6sFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/2/25 3:46 PM, Christophe Leroy wrote:
> 
> 
> Le 22/04/2025 à 15:10, Madhavan Srinivasan a écrit :
>> structs are local to the source and does not need to
>> be in global scope, so make it static.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/btext.c              | 2 +-
>>   arch/powerpc/kernel/setup-common.c       | 2 +-
>>   arch/powerpc/platforms/powernv/opal.c    | 2 +-
>>   arch/powerpc/platforms/pseries/lparcfg.c | 2 +-
>>   4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
>> index 7f63f1cdc6c3..fc7f5a5b6d76 100644
>> --- a/arch/powerpc/kernel/btext.c
>> +++ b/arch/powerpc/kernel/btext.c
>> @@ -40,7 +40,7 @@ static int dispDeviceRect[4] __force_data;
>>   static unsigned char *dispDeviceBase __force_data;
>>   static unsigned char *logicalDisplayBase __force_data;
>>   -unsigned long disp_BAT[2] __initdata = {0, 0};
>> +static unsigned long disp_BAT[2] __initdata = {0, 0};
> 
> disp_BAT is used in assembly, has to remain global:
> 
> arch/powerpc/kernel/head_book3s_32.S:   addis   r8,r3,disp_BAT@ha
> arch/powerpc/kernel/head_book3s_32.S:   addi    r8,r8,disp_BAT@l

Thought I did a top folder level sweep for this. My bad. 
Nice catch. Will drop this. 

Thanks

> 
> Christophe
> 


