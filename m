Return-Path: <linuxppc-dev+bounces-5800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A470CA26D5F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 09:37:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnGvJ0sPmz2xCj;
	Tue,  4 Feb 2025 19:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738658236;
	cv=none; b=VJ/hO1ryto9PEHAjy1tRUVTaeiyvbezULilBNGeHx3BZatOzKw3cKNRKQC5iIMDKJxNWYfOYiCxs+6hIEZ0VFpSKXe+7UYBZELwTovNOcnzp8wERXTGxT7NIIx9mjAzxQrtYo1A4RhRVK2EszKw4Ag1DHkULLc+GVY4HnUeEf8G2YI8KzI2Nkp8iYQumXat0CM+QrdKpYZqApSGipoe/iz101DfyQR2RofMxLrn6CeMN5vu3S0zc99VNFmoE8n2rOR/Ga69msWeEhxOveFYokAnGfWTxt2A/vQLiTvrfkAQr3GhwL9N9wtDPON78yMmJwwbpe+hzaC9loYkdGF3o8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738658236; c=relaxed/relaxed;
	bh=Z0zsa6x0YEQwMLqsOLH6anXv+hYaQEocon4Mx3gFi4o=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ccHzi+lgjMMhvKdJcB/h3yzuoiFtzisTfI3xDg1y02XX989MEueixUyJbLXnb4NREXRjyzpIOPY8ABNoZvYvGQ4NKe5+QV38QWEWg0Pv1Dxla55Gp8GcQW1+7mlKthggGyGyHtnar7fUDxQg+N03fAf4rKbrNb9jjYuZtuGQOkORg2BXLhwuOUjDR7tL7zie/3Xg0v3y5CZklmNqRBQSfgaIEYPwZoK+8oUDCoCaMybuUUJPNcaZxf26ve9vsGCKaiZGLiNVF/ee3O330Pghipw4d+NKqBHRt7acST0TNctjI/8pyCNQwEssvlAETnekc4zhOo0pqyT0hnQsdEsKwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GCmbbriT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GCmbbriT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnGvH00HSz2xBK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 19:37:14 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5144TA76016379;
	Tue, 4 Feb 2025 08:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Z0zsa6
	x0YEQwMLqsOLH6anXv+hYaQEocon4Mx3gFi4o=; b=GCmbbriTcsd7PcVKiGAv5h
	BKAV4Gq85C/uUnAZ23E4eU5yThSgvI9J9TaoxXTmsFUrgjzF/TZTeLdJPBDnoHVj
	BcqF7in2gmP6444/fehuuEvMpmAwX587AN/E85qiooOmAd5ZDN75PA/xWruhkX0X
	Rq7q5KSuB59AhTz2aWie3BsDta0dftj7fkmiU05zVZuM9eSzLP2gq+zMYis9Dq3V
	hOmDi8G6sm9iMdZDFuucloNF7rTY0GRktOpR7Nj3viwlXnSMeWWnEJeR61Ysp9Ds
	YccyHVzM2aSnxPmJKbPrresVY877bWLKV8CBBsewW9YjHh+EF8YRgGmbAEmPMb4Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44k02ymc74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 08:37:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5148Wxu4006502;
	Tue, 4 Feb 2025 08:37:05 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyekag6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 08:37:05 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5148b3fU27263650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 08:37:04 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADD5358050;
	Tue,  4 Feb 2025 08:37:03 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F30258052;
	Tue,  4 Feb 2025 08:37:03 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 08:37:02 +0000 (GMT)
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
Date: Tue, 04 Feb 2025 14:07:02 +0530
From: Avnish Chouhan <avnish@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Brian King <brking@linux.ibm.com>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh
 Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/fadump: fix additional param memory
 reservation for HASH MMU
In-Reply-To: <fdf5cec6-54ce-4042-b8a5-2560ce7dd623@linux.ibm.com>
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
 <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
 <6322511c-e56a-4f4c-9b13-efec018cb3a7@linux.ibm.com>
 <773fec68e97a408de6871eb3d2c2ac61@linux.ibm.com>
 <c0ace54a-af67-4df5-a284-b96e454869a9@linux.ibm.com>
 <a47286ca0936ea707ed2e80cd276311c@linux.ibm.com>
 <fdf5cec6-54ce-4042-b8a5-2560ce7dd623@linux.ibm.com>
Message-ID: <405d82eb1ba6799b63b6ed90347d88c9@linux.ibm.com>
X-Sender: avnish@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -WPhr2r9tqOQ1BHSmx97u2bOk63a4CzC
X-Proofpoint-ORIG-GUID: -WPhr2r9tqOQ1BHSmx97u2bOk63a4CzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=821 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040067
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-02-04 11:57, Hari Bathini wrote:
> On 04/02/25 10:58 am, Avnish Chouhan wrote:
>> On 2025-01-31 20:44, Hari Bathini wrote:
>>> On 23/01/25 7:54 pm, Avnish Chouhan wrote:
>>>> On 2025-01-23 15:26, Hari Bathini wrote:
>>>>> On 20/01/25 11:05 pm, Sourabh Jain wrote:
>>>>>> Commit 683eab94da75bc ("powerpc/fadump: setup additional 
>>>>>> parameters for
>>>>>> dump capture kernel") introduced the additional parameter feature 
>>>>>> in
>>>>>> fadump for HASH MMU with the understanding that GRUB does not use 
>>>>>> the
>>>>>> memory area between 640MB and 768MB for its operation.
>>>>>> 
>>>>>> However, the patch ("powerpc: increase MIN RMA size for CAS
>>>>>> negotiation") changes the MIN RMA size to 768MB, allowing GRUB to 
>>>>>> use
>>>>>> memory up to 768MB. This makes the fadump reservation for the 
>>>>>> additional
>>>>>> parameter feature for HASH MMU unreliable.
>>>>>> 
>>>>>> To address this, adjust the memory range for the additional 
>>>>>> parameter in
>>>>>> fadump for HASH MMU. This will ensure that GRUB does not overwrite 
>>>>>> the
>>>>>> memory reserved for fadump's additional parameter in HASH MMU.
>>>>>> 
>>>>> 
>>>>>> The new policy for the memory range for the additional parameter 
>>>>>> in HASH
>>>>>> MMU is that the first memory block must be larger than the MIN_RMA 
>>>>>> size,
>>>>>> as the bootloader can use memory up to the MIN_RMA size. The range
>>>>>> should be between MIN_RMA and the RMA size (ppc64_rma_size), and 
>>>>>> it must
>>>>>> not overlap with the fadump reserved area.
>>>>> 
>>>>> IIRC, even memory above MIN_RMA is used by the bootloader except 
>>>>> for
>>>>> 640MB to 768MB (assuming RMA size is >768MB). So, how does this 
>>>>> change
>>>>> guarantee that the bootloader is not using memory reserved for 
>>>>> bootargs?
>>>>> 
>>>>> Avnish, earlier, bootloader was using RUNTIME_MIN_SPACE (128MB) 
>>>>> starting
>>>>> top-down at 768MB earlier. With MIN_RMA changed to 768MB, is 
>>>>> bootloader
>>>>> still using the concept of RUNTIME_MIN_SPACE to set aside some 
>>>>> memory
>>>>> for kernel to use. If yes, where exactly is it allocating this 
>>>>> space
>>>>> now? Also, rtas instantiates top-down at 768MB. Would that not have
>>>>> a conflict with grub allocations without RUNTIME_MIN_SPACE at 
>>>>> 768MB?
>>>>> 
>>>>> - Hari
>>>> 
>>>> Hi Hari,
>>> 
>>> Hi Avnish,
>>> 
>>>> The RUNTIME_MIN_SPACE is the space left aside by Grub is within the 
>>>> MIN_RMA size. Grub won't use memory beyond the MIN_RMA. With this 
>>>> change, we haven't changed the RUNTIME_MIN_SPACE behavior. Grub will 
>>>> still keep the 128 MB space in MIN_RMA for loading stock kernel and 
>>>> initrd.
>>> 
>>> IIUC, you mean, 640MB to 768MB is not used by Grub even if MIN_RMA
>>> is at 768MB? If that is true, this change is not needed, as fadump
>>> could still use the memory between 640MB to 768MB, right?
>>> Am I missing something here..
>> 
>> Hari,
>> 
>> No. As we are changing MIN_RMA to 768 MB, GRUB can use memory till 768 
>> MB if required.
> 
> Does that mean 'linux_rmo_save' related code in
> grub-core/kern/ieee1275/init.c is going to be dead code after this
> change. Also, does this imply, there isn't going to be any
> RUNTIME_MIN_SPACE support for linux in grub?

No Hari, there's no change in RUNTIME_MIN_SPACE as mentioned earlier nor 
the change leading to any dead code in grub. If we have MIN_RMA as 512 
MB, the grub will consider RUNTIME_MIN_SPACE region within the MIN_RMA 
as (384[512-128] to 512). And if we have MIN_RMA as 768 MB, it will be 
(640[768-128] to 768).

Grub will keep the 128 MB space in MIN_RMA for loading stock kernel and 
initrd as stated earlier.

Thank you,
Avnish Chouhan
> 
> - Hari

