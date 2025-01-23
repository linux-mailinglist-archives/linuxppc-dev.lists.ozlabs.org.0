Return-Path: <linuxppc-dev+bounces-5521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7EFA1A5B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 15:24:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf39q1sGQz303d;
	Fri, 24 Jan 2025 01:24:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737642287;
	cv=none; b=LXY+t1DcFSOim2v1gEG3mQo2ymzEii2iGfz9L84MaB2auksKjNCfWcXfp+7RBKS//SLSD1z+XXRBhvsb3oNFHRMML1sM5L5pdQPnoY+j6bBSOq2siCKkQ+cEF9X0n3e/WEH+AtS8nPTCxmqb32PAJ/461qWu7A2lJThRMC5UK5e65ol6ce6nHUJJYtfi97HLAH76QZVOeyoKgg2b91V5DgdODy62GJR3+KIYgu+s5c4HCaBRcKh2j8EqCpj+nQnPMDKnWHjkKXgNylprktuLHl/Hbo5km8uAqjjTOX+V0rkhCwxbQXMHFSKbWKIR5mi86gdxtA75NKvFOoXaxgzHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737642287; c=relaxed/relaxed;
	bh=sA3shYnMjhrizrtxzeKzF68X56xbX2Phy/2o9muhQ6s=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=dJdJPnr/o7eJcD6f0NMrMfhiGfY2sK/QLippdEl6Wtst/L86NZCYf3foyKnHQpOar9J1KG9z21FXJobyF3VTYummBZ4IgounzVBmmftOz+MjQ15eWHzYZj36+a6ZE+Ecddkf5fpQ4TYNxznE5Y8AHJiygtt36MftPLTD6qEcQb/idN95SUoavC8d9Vz2Pa8pVDYUGsg5FNp2E4DbP1nHFnD/Cy3wUefKfGa/bO3EttHDey/V4VB/3ik2IlPBuWQF+25H19osEFxQPC8TGH+BK0IdV264h7SzPsS6uJ56t2dyV7/iyc7ZXSaba6iZzzB6fXnGaUP+PiMNnmuC8GXibA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=khqZwXJ+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=khqZwXJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf39p1N8cz2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 01:24:45 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NCGK3c022730;
	Thu, 23 Jan 2025 14:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sA3shY
	nMjhrizrtxzeKzF68X56xbX2Phy/2o9muhQ6s=; b=khqZwXJ+1gxt24NTa0wjyu
	eIszbykKitrrmF5VuCOz2MkQ8McgffsWRFNB5hBCmpVsUf8m9VEvNx/v9bstIcp/
	b3mL03kb/kM6YKHHKAq57YzsG9NjEUnYdj+EkIBdlLHZDY3xsJa+y5wZbhFqoEwt
	NgEF6SCSA/ghY6kBFsDO8bjJr5hdcJxT6YNCzAzQ7uEFyJFaY83wZ4gp9WYEeOyA
	BT5MX04U4WLZfjxYUcuA5huVpB9OXiaiBDf2Fv+9x7Qh81QmMVoNBNqL1LmYAPah
	Bv9PedV3shaxxHWwaZvOcD/PbsdlZjLev2jPVWpMk0uoPDSFHLpVxkA8LiblRFoA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bbu9bdb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 14:24:37 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50NCVmvJ021002;
	Thu, 23 Jan 2025 14:24:36 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1nhac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 14:24:36 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NEOYk212059282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 14:24:35 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB3A258053;
	Thu, 23 Jan 2025 14:24:34 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A62E58043;
	Thu, 23 Jan 2025 14:24:34 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 14:24:34 +0000 (GMT)
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
Date: Thu, 23 Jan 2025 19:54:33 +0530
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
In-Reply-To: <6322511c-e56a-4f4c-9b13-efec018cb3a7@linux.ibm.com>
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
 <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
 <6322511c-e56a-4f4c-9b13-efec018cb3a7@linux.ibm.com>
Message-ID: <773fec68e97a408de6871eb3d2c2ac61@linux.ibm.com>
X-Sender: avnish@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7pIAfC6Kjk1uwAPS9V2EoZirCfxtPLmY
X-Proofpoint-ORIG-GUID: 7pIAfC6Kjk1uwAPS9V2EoZirCfxtPLmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230104
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-23 15:26, Hari Bathini wrote:
> On 20/01/25 11:05 pm, Sourabh Jain wrote:
>> Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters 
>> for
>> dump capture kernel") introduced the additional parameter feature in
>> fadump for HASH MMU with the understanding that GRUB does not use the
>> memory area between 640MB and 768MB for its operation.
>> 
>> However, the patch ("powerpc: increase MIN RMA size for CAS
>> negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
>> memory up to 768MB. This makes the fadump reservation for the 
>> additional
>> parameter feature for HASH MMU unreliable.
>> 
>> To address this, adjust the memory range for the additional parameter 
>> in
>> fadump for HASH MMU. This will ensure that GRUB does not overwrite the
>> memory reserved for fadump's additional parameter in HASH MMU.
>> 
> 
>> The new policy for the memory range for the additional parameter in 
>> HASH
>> MMU is that the first memory block must be larger than the MIN_RMA 
>> size,
>> as the bootloader can use memory up to the MIN_RMA size. The range
>> should be between MIN_RMA and the RMA size (ppc64_rma_size), and it 
>> must
>> not overlap with the fadump reserved area.
> 
> IIRC, even memory above MIN_RMA is used by the bootloader except for
> 640MB to 768MB (assuming RMA size is >768MB). So, how does this change
> guarantee that the bootloader is not using memory reserved for 
> bootargs?
> 
> Avnish, earlier, bootloader was using RUNTIME_MIN_SPACE (128MB) 
> starting
> top-down at 768MB earlier. With MIN_RMA changed to 768MB, is bootloader
> still using the concept of RUNTIME_MIN_SPACE to set aside some memory
> for kernel to use. If yes, where exactly is it allocating this space
> now? Also, rtas instantiates top-down at 768MB. Would that not have
> a conflict with grub allocations without RUNTIME_MIN_SPACE at 768MB?
> 
> - Hari

Hi Hari,

The RUNTIME_MIN_SPACE is the space left aside by Grub is within the 
MIN_RMA size. Grub won't use memory beyond the MIN_RMA. With this 
change, we haven't changed the RUNTIME_MIN_SPACE behavior. Grub will 
still keep the 128 MB space in MIN_RMA for loading stock kernel and 
initrd.

For your RTAS query, as it gets initiated just below the MIN_RMA. So it 
will not have any impact with this RMA size change.
**
When MIN_RMA is 768MB, rtas will be instantiate at 0x000000002ec50000 
(approximately at 748 MB).
**

Thank you!

Regards,
Avnish Chouhan

> 
>> 
>> Cc: Avnish Chouhan <avnish@linux.ibm.com>
>> Cc: Brian King <brking@linux.ibm.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump.c | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/fadump.c 
>> b/arch/powerpc/kernel/fadump.c
>> index 4b371c738213..5831f3ec8561 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -33,6 +33,7 @@
>>   #include <asm/fadump-internal.h>
>>   #include <asm/setup.h>
>>   #include <asm/interrupt.h>
>> +#include <asm/prom.h>
>>     /*
>>    * The CPU who acquired the lock to trigger the fadump crash should
>> @@ -1764,19 +1765,19 @@ void __init fadump_setup_param_area(void)
>>   		range_end = memblock_end_of_DRAM();
>>   	} else {
>>   		/*
>> -		 * Passing additional parameters is supported for hash MMU only
>> -		 * if the first memory block size is 768MB or higher.
>> +		 * Memory range for passing additional parameters for HASH MMU
>> +		 * must meet the following conditions:
>> +		 * 1. The first memory block size must be higher than the
>> +		 *    minimum RMA (MIN_RMA) size. Bootloader can use memory
>> +		 *    up to RMA size. So it should be avoided.
>> +		 * 2. The range should be between MIN_RMA and RMA size 
>> (ppc64_rma_size)
>> +		 * 3. It must not overlap with the fadump reserved area.
>>   		 */
>> -		if (ppc64_rma_size < 0x30000000)
>> +		if (ppc64_rma_size < MIN_RMA*1024*1024)
>>   			return;
>>   -		/*
>> -		 * 640 MB to 768 MB is not used by PFW/bootloader. So, try 
>> reserving
>> -		 * memory for passing additional parameters in this range to avoid
>> -		 * being stomped on by PFW/bootloader.
>> -		 */
>> -		range_start = 0x2A000000;
>> -		range_end = range_start + 0x4000000;
>> +		range_start = MIN_RMA * 1024 * 1024;
>> +		range_end = min(ppc64_rma_size, fw_dump.boot_mem_top);
>>   	}
>>     	fw_dump.param_area = memblock_phys_alloc_range(COMMAND_LINE_SIZE,

