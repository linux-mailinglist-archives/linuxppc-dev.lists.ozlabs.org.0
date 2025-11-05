Return-Path: <linuxppc-dev+bounces-13780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1AC33E1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 04:51:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1WZr173Gz2yr9;
	Wed,  5 Nov 2025 14:51:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762314676;
	cv=none; b=FtrCf6jmmvze4KznsCElTMpuqVwswx1SjcIEKeP1zg7U8o6nFxJco8Z12+t3IG70n+TdoeZ9CrjlXIVdmtIAh2sUNjvmN4sOK7uyvjLL59G4Y3XlOZYI5s2yOKZkZZrl6H1NWuL1cGEkIVYlvc/H8vYnKeWBUlHQXDvko4up6mhweBxqNNY5j95+06N3uUz9lPeKW6WNOlpRIDBTsOHFvuwbqyDbrkz9hf5W57crWnY8vtdz8I56oZp9M/0jD8tSM3UAhgSBRItf5ia1LzBdupf8WPDYBsOPEohdLCiBPfGJI3wFW6rGpyId7z2m5/gS6rciuNUqFAD/1gvIz3iGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762314676; c=relaxed/relaxed;
	bh=8qrzGhwEpQyn2ArhPh8Ntq7G0BXphFX7U+G79Ez9yUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nShxLBMXZcYHHBImy8V0VVCCINReYKpbHz4w9FbfChBwGR2xsbv0IhXHlSoihzisSh3Z+nwwRBSQut7XL3cuYLw6QGgh9FREfA4jA8fQTkn+e+jg8qQISZR69VuCRZmY39MEc1pAw0wto9emGfUtOec6OM3gq7MZ5pr6dONx7o/ylXO4I8ntlr0jMp9iTLEUk+qCgtsDpe7XIJEnyv7NRXND3pwm1tpIbZUyPfMFg5dvA/uHbiTbiOp66OSSjUsYDqch1n9HJ96KwFHIreTE3YE7EqD9r6Dxd4iAB2MZDDA8N/5sY8QBn84i8glgtqHwlEmG+IV9aFjrYcSJ50ELTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T4dFGKpe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T4dFGKpe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1WZp56yvz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 14:51:14 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4KWFaU006421;
	Wed, 5 Nov 2025 03:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8qrzGh
	wEpQyn2ArhPh8Ntq7G0BXphFX7U+G79Ez9yUc=; b=T4dFGKpewmXnq/MRppWBvG
	Dz1TRARw9z+ifR+Y7pHUc35E41JyTnDqA6EOkeSsnDNdJG1nd5xfAR7NQrcEfMBk
	/A2cLWRG5p4AG73sLQgnk/wSWPED0tfOST3lwF9JqkHe9umISo2kritYqxTSN81i
	sWKFMzPKtc/oJ2unKVh1EfLGbGRY6a4HxLr+X9kYSdzOGrung+ln6XyUIkoICRuC
	r7pYSMUXuM02Ad1gLdOGI1zYMPh3F5sdS8YUbuTLKF1I71genUjMcaufdMclAJaj
	pthUTgff3dr01bSpUPqNK1SvAMfiDSFPyTiubXsnAheb/vxeDoTH/YCv+p06aghQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xby7pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 03:50:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A53knZN007212;
	Wed, 5 Nov 2025 03:50:47 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xby7pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 03:50:47 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4N5UQn021558;
	Wed, 5 Nov 2025 03:50:46 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrjp37g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 03:50:46 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A53ojEF27853532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Nov 2025 03:50:46 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D91AD5804E;
	Wed,  5 Nov 2025 03:50:45 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A67955803F;
	Wed,  5 Nov 2025 03:50:41 +0000 (GMT)
Received: from [9.43.111.253] (unknown [9.43.111.253])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Nov 2025 03:50:41 +0000 (GMT)
Message-ID: <6f52c355-c29d-4788-8dab-1e1ad5e4de04@linux.ibm.com>
Date: Wed, 5 Nov 2025 09:20:39 +0530
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
Subject: Re: [PATCH 0/2] Fixes for pmac32_defconfig after fb.h removal from
 backlight.h
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nathan Chancellor <nathan@kernel.org>, Lee Jones <lee@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Thompson <danielt@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Simona Vetter <simona.vetter@ffwll.ch>, linuxppc-dev@lists.ozlabs.org,
        patches@lists.linux.dev, Thierry Reding <treding@nvidia.com>
References: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
 <70a965d7-9839-4973-a306-4da4f1089bfc@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <70a965d7-9839-4973-a306-4da4f1089bfc@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX6yWMntHcJlla
 k5JtFRpRRGT2izzgKOHTjy8B37/em4nPrXrrHt5x8xbjIHmQFCWdIhEs2V2Q0ZkUyWinGjFurjG
 F28mf7ig0vmK9r2VpxO1NEeWQ2224oonwjfgBgge41NOpIj8m8GRk6IIy9tnWbrZCmNgc2xV1q2
 iwUvT2HeejQoEeaUfWzHUlSF7+b6ilNSE1dJF6dgQiA6eXZ3ugXmFISO9rEt5MECo3UInqNpyJm
 8Ei8mu1bFIc1hbGiKYTv5454uteLKlhvQ6Wt4zb4bXHWATtxZUyjIDCXMaj0gDFeE7y0UwTB9n/
 rYD7KLu3jxBQeqzF1Nj5p+suUgnvDZkSHMiQqXRUQv3RP08c+KsmOaMLI7I/BwWHxcN8ocCcKKx
 Yb1HrZiEnqv3mvDeg8K7hod2nn44pg==
X-Proofpoint-GUID: KHFDrnlGsMN7N-ytlNuA2w6CHWHwoGZI
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=690ac998 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=lzAno4yBQp4m_lSgxmwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 7oUFY4i6YNclZkfcuIoVKmNnsJlFZcot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/4/25 4:59 PM, Christophe Leroy wrote:
> Hi All,
> 
> Le 26/09/2025 à 01:46, Nathan Chancellor a écrit :
>> Commit 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header
>> file") exposed some necessary includes that were missing from a few
>> powerpc drivers, breaking the build. This series resolves them.
>>
>> This should go via the backlight tree, which includes 9f218f9bb9d2, but
>> I have included the PowerPC folks for visibility.
> 
> What is the status of this fixing series ? I see a couple of similar redundant patchs (see below) roaming around, which make me wonder if this series has been properly processed in the backlight tree.
> 

Yes, i will pull this as part of the powerpc tree.

Maddy
(sorry for the delay)


> https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20251029150940.2523328-1-thierry.reding@gmail.com/
> https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20251027140646.227025-1-tzimmermann@suse.de/
> 
> Christophe
> 
>>
>> ---
>> Nathan Chancellor (2):
>>        powerpc/powermac: Include linux/of.h in backlight.c
>>        macintosh/via-pmu-backlight: Include linux/of.h and uapi/linux/fb.h
>>
>>   arch/powerpc/platforms/powermac/backlight.c | 1 +
>>   drivers/macintosh/via-pmu-backlight.c       | 2 ++
>>   2 files changed, 3 insertions(+)
>> ---
>> base-commit: 9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2
>> change-id: 20250925-ppc-fixes-for-backlight-fb-h-removal-2b6a87cced02
>>
>> Best regards,
>> -- 
>> Nathan Chancellor <nathan@kernel.org>
>>
> 


