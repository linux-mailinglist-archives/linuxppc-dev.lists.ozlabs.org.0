Return-Path: <linuxppc-dev+bounces-6018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2EEA2E44B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 07:45:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yrw7H06xZz2yRd;
	Mon, 10 Feb 2025 17:45:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739169914;
	cv=none; b=FGm/ZMj1l6i+Pix5INfijRRBxYM6rJtvk42fXjLeVPXgieQZT+PH7FKTAchsZxZkB/nK+34uqeTjsGAZIllYxQLHXT1+3SY5O+NLs0lxWprlWFTN0pG0AjIeN0bIWBaakkU1sazZWivoUGbgnYElyMsTmtfECZA1muDpB9Y9haLY738SW0KZdQrfUK3C3G+01rpgabtiaeeiQ2orEdThP3GKMKQfjE9hCKTTAGJRC9KIxb+TLouEJf6Rw2hct4MKycAsuIgAiCGFYRCY8bUDe2TDVbvxG5eRkBe6ZkwqPJFvE1XUMzdYL4Vf5y1/kLNr0CZjf8TgdkwmeeqP9QO4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739169914; c=relaxed/relaxed;
	bh=f9/wScwKjsjXZBq3jdnM7R9V7UQdvD+xrlTwGEyzEiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQi4jB7kW9O/nVROWvXMiRd4ducSHsnSm4NTS6oK/yGh6n5NcL4p+hEWpTZW3KBkUPvzxG9V4cfqoaB04gMAPkgX5tYNOqH/TnPfMmc6yN5KZH4zi18QOTXNz5O7aibhdKL1eNZhZmbEdmr4VSZr8lKfTSCR8yBkBpepmCT4OxPa1VNnpvvIVNmeE5EsgOO4wi7QUK8WdXOi9F958QYgNOn+lm0o3HkU0mgt50HLFk6w95rHEYdVMreWrIZqZ4j8zjin3fa4vZkuk3agHwi6v0BdKQvWceo4Qbgv26gxXuQ1Jhl1d0iq9u7W+H37gldq6sblnRlAAFYYtpTiSLn3vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FLrpXvNi; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FLrpXvNi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yrw7F0Sv9z2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 17:45:12 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A17p4s023174;
	Mon, 10 Feb 2025 06:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=f9/wSc
	wKjsjXZBq3jdnM7R9V7UQdvD+xrlTwGEyzEiE=; b=FLrpXvNidoC8EXIW2A24YM
	Mi9n1zNMqtFZ0vxPh9tansMYwxTCw0geT2sFjHRPjC9Vq2Pi9IlwWOP54KgJGtAY
	aMAp0lp/zEE8++mJb+vpP9GEAbi/EY0IMlXmnV4WwbKFSFLbuvIrGn61LEvmK+LD
	7djjnHghpaNNz0FQomAMpAG2/r0IKyxWhTw4ka+7RCiU1XoJ2uB9NEkqWgkusb9q
	W55iQvrC3/dAcZpcfsh+cFbI8QriDaKXfbctHr829MAnaj3NeynmHNkKSz8qyVNC
	8C/BX9OiUikMfFWDBqnHPvUZVqOkQg0oHXdmEgGnfw877inJ3CQCF8pbyKhHckVg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44q7h99516-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 06:45:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51A5Z7gN028716;
	Mon, 10 Feb 2025 06:45:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma1ckwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 06:45:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51A6j0hk59638114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 06:45:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C40520043;
	Mon, 10 Feb 2025 06:45:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D33B220040;
	Mon, 10 Feb 2025 06:44:58 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Feb 2025 06:44:58 +0000 (GMT)
Message-ID: <77f3eabb-2176-4ff2-8871-61319a084af1@linux.ibm.com>
Date: Mon, 10 Feb 2025 12:14:57 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] powerpc/fadump: fix additional param memory
 reservation for HASH MMU
To: Avnish Chouhan <avnish@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Brian King <brking@linux.ibm.com>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
 <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
 <6322511c-e56a-4f4c-9b13-efec018cb3a7@linux.ibm.com>
 <773fec68e97a408de6871eb3d2c2ac61@linux.ibm.com>
 <c0ace54a-af67-4df5-a284-b96e454869a9@linux.ibm.com>
 <a47286ca0936ea707ed2e80cd276311c@linux.ibm.com>
 <fdf5cec6-54ce-4042-b8a5-2560ce7dd623@linux.ibm.com>
 <405d82eb1ba6799b63b6ed90347d88c9@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <405d82eb1ba6799b63b6ed90347d88c9@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oaeSj3UQ1g9t8x9WP1sN7j1yt2001P44
X-Proofpoint-ORIG-GUID: oaeSj3UQ1g9t8x9WP1sN7j1yt2001P44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=926 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100053
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 04/02/25 2:07 pm, Avnish Chouhan wrote:
> On 2025-02-04 11:57, Hari Bathini wrote:
>> On 04/02/25 10:58 am, Avnish Chouhan wrote:
>>> On 2025-01-31 20:44, Hari Bathini wrote:
>>>> On 23/01/25 7:54 pm, Avnish Chouhan wrote:
>>>>> On 2025-01-23 15:26, Hari Bathini wrote:
>>>>>> On 20/01/25 11:05 pm, Sourabh Jain wrote:
>>>>>>> Commit 683eab94da75bc ("powerpc/fadump: setup additional 
>>>>>>> parameters for
>>>>>>> dump capture kernel") introduced the additional parameter feature in
>>>>>>> fadump for HASH MMU with the understanding that GRUB does not use 
>>>>>>> the
>>>>>>> memory area between 640MB and 768MB for its operation.
>>>>>>>
>>>>>>> However, the patch ("powerpc: increase MIN RMA size for CAS
>>>>>>> negotiation") changes the MIN RMA size to 768MB, allowing GRUB to 
>>>>>>> use
>>>>>>> memory up to 768MB. This makes the fadump reservation for the 
>>>>>>> additional
>>>>>>> parameter feature for HASH MMU unreliable.
>>>>>>>
>>>>>>> To address this, adjust the memory range for the additional 
>>>>>>> parameter in
>>>>>>> fadump for HASH MMU. This will ensure that GRUB does not 
>>>>>>> overwrite the
>>>>>>> memory reserved for fadump's additional parameter in HASH MMU.
>>>>>>>
>>>>>>
>>>>>>> The new policy for the memory range for the additional parameter 
>>>>>>> in HASH
>>>>>>> MMU is that the first memory block must be larger than the 
>>>>>>> MIN_RMA size,
>>>>>>> as the bootloader can use memory up to the MIN_RMA size. The range
>>>>>>> should be between MIN_RMA and the RMA size (ppc64_rma_size), and 
>>>>>>> it must
>>>>>>> not overlap with the fadump reserved area.
>>>>>>
>>>>>> IIRC, even memory above MIN_RMA is used by the bootloader except for
>>>>>> 640MB to 768MB (assuming RMA size is >768MB). So, how does this 
>>>>>> change
>>>>>> guarantee that the bootloader is not using memory reserved for 
>>>>>> bootargs?
>>>>>>
>>>>>> Avnish, earlier, bootloader was using RUNTIME_MIN_SPACE (128MB) 
>>>>>> starting
>>>>>> top-down at 768MB earlier. With MIN_RMA changed to 768MB, is 
>>>>>> bootloader
>>>>>> still using the concept of RUNTIME_MIN_SPACE to set aside some memory
>>>>>> for kernel to use. If yes, where exactly is it allocating this space
>>>>>> now? Also, rtas instantiates top-down at 768MB. Would that not have
>>>>>> a conflict with grub allocations without RUNTIME_MIN_SPACE at 768MB?
>>>>>>
>>>>>> - Hari
>>>>>
>>>>> Hi Hari,
>>>>
>>>> Hi Avnish,
>>>>
>>>>> The RUNTIME_MIN_SPACE is the space left aside by Grub is within the 
>>>>> MIN_RMA size. Grub won't use memory beyond the MIN_RMA. With this 
>>>>> change, we haven't changed the RUNTIME_MIN_SPACE behavior. Grub 
>>>>> will still keep the 128 MB space in MIN_RMA for loading stock 
>>>>> kernel and initrd.
>>>>
>>>> IIUC, you mean, 640MB to 768MB is not used by Grub even if MIN_RMA
>>>> is at 768MB? If that is true, this change is not needed, as fadump
>>>> could still use the memory between 640MB to 768MB, right?
>>>> Am I missing something here..
>>>
>>> Hari,
>>>
>>> No. As we are changing MIN_RMA to 768 MB, GRUB can use memory till 
>>> 768 MB if required.
>>
>> Does that mean 'linux_rmo_save' related code in
>> grub-core/kern/ieee1275/init.c is going to be dead code after this
>> change. Also, does this imply, there isn't going to be any
>> RUNTIME_MIN_SPACE support for linux in grub?
> 
> No Hari, there's no change in RUNTIME_MIN_SPACE as mentioned earlier nor 
> the change leading to any dead code in grub. If we have MIN_RMA as 512 
> MB, the grub will consider RUNTIME_MIN_SPACE region within the MIN_RMA 
> as (384[512-128] to 512). And if we have MIN_RMA as 768 MB, it will be 
> (640[768-128] to 768).
> 
> Grub will keep the 128 MB space in MIN_RMA for loading stock kernel and 
> initrd as stated earlier.

Thanks, Avnish.
That clears it.

- Hari

