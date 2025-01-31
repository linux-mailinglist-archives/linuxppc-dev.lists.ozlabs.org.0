Return-Path: <linuxppc-dev+bounces-5749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE224A23F7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 16:14:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkzvT0Nq8z307V;
	Sat,  1 Feb 2025 02:14:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738336469;
	cv=none; b=QNwumJAcRHvzWH1qqsaELFlln9JhNVs9C4GIHsfC20+mgxGX0eMI3umLL67+RIrIdvQvErKPr/rc1aoPMfcbNBFFjVxM0fRl2z9R/zyOyrHcF0SkqngbwxZZdXwPjJQQOMHremS26USuMcAWh5JvaaKWZk6GyZZDpCMIyuX3vot/0ii3lUq99deci5RJUqNSJb+57Oj+N78UP7lsHgzCk4Syd0/RPMuDVXHc8UMgG3wwUc2hscQsGwtghx2AlYMO+M9neUNfN+k6tUuHQ7H2NubM4vATJw+x4bIrXtEQZBSmQrwWtPmCuGnMhZU11gLWH9sjar35Vxarvjm3fPdeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738336469; c=relaxed/relaxed;
	bh=2yBr5Bj5qeKmGiR1Ad5Ti2ixvjXZWaPyUaS7vvnKuZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUHkK4DVTbsoGcbx/rGpMRl1UHbcrSpqiymOt/Pn/n9KLUewsXtQU4bHpHHmpODjIvtJZjF+eJJjHaH/6eF6ms//+eE2Dj3OaoqmKQABeAGBzzxXplA4ylEiz0cUp8hzzUfRn9c4ZuT4RpOIDk8t8D1ERlCa4XYU4FM9x9HadeR+4+TRXMf/MWDpwnOtauo4ucRDMWCsRDV/93dhay/X1Nloaclze5b+kvGZPvt2TOyPMu2Fa6hDT9r7VdZKBLwNFG7RUH1WZw8zYb6c/d/68XIrkW8hhDroy97CUzjVBUJbFPeSgYDgjRRvKI8N89J4KBDOMLgtlFcNFfCsYYC9hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M4WVmw7r; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M4WVmw7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkzvS1Rtxz2yMh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 02:14:27 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VF1V4M013259;
	Fri, 31 Jan 2025 15:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2yBr5B
	j5qeKmGiR1Ad5Ti2ixvjXZWaPyUaS7vvnKuZ8=; b=M4WVmw7rQ5b3kgrBlliP3a
	/v9OfFYzrWXIijuNQLNHamQAIH5PFfRRzW/3Gc1rjPzTtdJ1rRQ76N53ef8oSaHI
	4bxzy3rZHOMnmG+qbvu254JNr0nefyVzC/Lx/vm8igxvh1y+Cu0x2mg0uLGT7Bzp
	YQFuwewR7iT/xRQJxIFsNtooi+7MqfhHEfmHHoglJAagaujTyCkKegTZa+UYXTt9
	B8N1IQpJ1p15PVWSKyfO6ONq54BpRCFPoz5EfvgS5k5xBsQZt6D9iJgOWVl8sJv5
	GWkDtvM6gCjZ/IXWX6h3wgGRqBWqPrL5KD+fj2hR4yYtLUnlQ6etS55tzY9lXXZQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44h0t002a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 15:14:18 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCL8pd013864;
	Fri, 31 Jan 2025 15:14:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gf93c47w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 15:14:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VFEEc444499246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 15:14:14 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A97D2005A;
	Fri, 31 Jan 2025 15:14:14 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F1722004D;
	Fri, 31 Jan 2025 15:14:12 +0000 (GMT)
Received: from [9.43.17.5] (unknown [9.43.17.5])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 15:14:12 +0000 (GMT)
Message-ID: <c0ace54a-af67-4df5-a284-b96e454869a9@linux.ibm.com>
Date: Fri, 31 Jan 2025 20:44:11 +0530
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
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <773fec68e97a408de6871eb3d2c2ac61@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E4B25fP_wWhz3RzyGVI86Vg87Ag65TkM
X-Proofpoint-ORIG-GUID: E4B25fP_wWhz3RzyGVI86Vg87Ag65TkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=785
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310115
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 23/01/25 7:54 pm, Avnish Chouhan wrote:
> On 2025-01-23 15:26, Hari Bathini wrote:
>> On 20/01/25 11:05 pm, Sourabh Jain wrote:
>>> Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
>>> dump capture kernel") introduced the additional parameter feature in
>>> fadump for HASH MMU with the understanding that GRUB does not use the
>>> memory area between 640MB and 768MB for its operation.
>>>
>>> However, the patch ("powerpc: increase MIN RMA size for CAS
>>> negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
>>> memory up to 768MB. This makes the fadump reservation for the additional
>>> parameter feature for HASH MMU unreliable.
>>>
>>> To address this, adjust the memory range for the additional parameter in
>>> fadump for HASH MMU. This will ensure that GRUB does not overwrite the
>>> memory reserved for fadump's additional parameter in HASH MMU.
>>>
>>
>>> The new policy for the memory range for the additional parameter in HASH
>>> MMU is that the first memory block must be larger than the MIN_RMA size,
>>> as the bootloader can use memory up to the MIN_RMA size. The range
>>> should be between MIN_RMA and the RMA size (ppc64_rma_size), and it must
>>> not overlap with the fadump reserved area.
>>
>> IIRC, even memory above MIN_RMA is used by the bootloader except for
>> 640MB to 768MB (assuming RMA size is >768MB). So, how does this change
>> guarantee that the bootloader is not using memory reserved for bootargs?
>>
>> Avnish, earlier, bootloader was using RUNTIME_MIN_SPACE (128MB) starting
>> top-down at 768MB earlier. With MIN_RMA changed to 768MB, is bootloader
>> still using the concept of RUNTIME_MIN_SPACE to set aside some memory
>> for kernel to use. If yes, where exactly is it allocating this space
>> now? Also, rtas instantiates top-down at 768MB. Would that not have
>> a conflict with grub allocations without RUNTIME_MIN_SPACE at 768MB?
>>
>> - Hari
> 
> Hi Hari,

Hi Avnish,

> The RUNTIME_MIN_SPACE is the space left aside by Grub is within the 
> MIN_RMA size. Grub won't use memory beyond the MIN_RMA. With this 
> change, we haven't changed the RUNTIME_MIN_SPACE behavior. Grub will 
> still keep the 128 MB space in MIN_RMA for loading stock kernel and initrd.

IIUC, you mean, 640MB to 768MB is not used by Grub even if MIN_RMA
is at 768MB? If that is true, this change is not needed, as fadump
could still use the memory between 640MB to 768MB, right?
Am I missing something here..

- Hari

