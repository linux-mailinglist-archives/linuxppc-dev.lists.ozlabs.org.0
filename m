Return-Path: <linuxppc-dev+bounces-4887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AC7A06CAD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 05:12:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTBFy3VhFz2xWt;
	Thu,  9 Jan 2025 15:12:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736395958;
	cv=none; b=ZK6yke0XCIfrJR/piaYmXVPhw3Exo/MgpK7M3wuiDcdR0FoecKFOPqzgfslGxhKJnWxy284IAcJV9J8VnNkU70YsQ76ccxYdPmnrXiyq4erC7erPWl+wjo0nfu0esI25KxHwDQfSinSAx92ctmlEH/d/qvblwR2OdXArFnn2SQYkkdwsCPV1HpDMbec7FCpwpV5oqgWDwZVcGnTDthRq+CAzwcOWM1envfj4jQvrjmeHRBkPHI3NAhiRuSzbwKW3HHm3yZYQUpgeUjlaI/WMV+wo/3Pe51sZd3ctrBZNjik82p+oqjqP+Xn5Izd61LRQZtV0xc5QpznulNjGtL4SxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736395958; c=relaxed/relaxed;
	bh=b2mjqvTGempTon9Ywa1jbwZqI26Px4SPJHG2UyEKJDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEMPmLVK7zE5xA8OIcT8suIA4fOY3qUuiJHTxTbFqfkV6Lj/++7JF8b4PtUmYhUaP8EnPkSC1Qvel21dU7ty/AsRwl9fnW+SnKlmWO4Q1oiRdST+jSwzj+rxpjlcju0gjlq92eWgojQwio+CGVtm8o1T7qV24uBKjFUklxcDuCaHsXd8+sEjWMQTMoyo3D6jUsx659VNJZS4zOdss80Ge8UvXbl4kkrPWmnNWb5v6GEHavnYjuDk18WKp8CSdn3KEnZDmcQGqoyNH/2hCK4DDSYfH6HnZJyyAwfzoMzRBwfHvdWnhwyKxTvftI2B8qtF0DaJcT32StD15I5tBwqY/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AbCf7KV9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AbCf7KV9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTBFw6h15z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 15:12:36 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5093r3Qi006598;
	Thu, 9 Jan 2025 04:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=b2mjqv
	TGempTon9Ywa1jbwZqI26Px4SPJHG2UyEKJDU=; b=AbCf7KV9MtHn9ZFW9MK/FL
	oCHMyrup5GM2mvCK8iJvPXaYrdKlKGHOuRTAUc3BtaD/JX0SyQXHqxpwS+J1fNAE
	N/1TFTuR74wc8CBaUZiQK3Zvxr1kH/QoAEE7mErsiSTR2lmvQxGQZZWg5KAJbnjq
	chF3vsMTwFZClVQQ4hNe6gPs1Gd10xCUjUb3O8v8zRXVbiCBrHPFOUKN9nc3CqhI
	DYvHGUWMeoxHQpXOg3s5gvuaWhqHEUxYzG+9COLkQ8ZHN32c2yiXK5fLpeYCvCOE
	z8bdHZOU99PrBJYzx34rPq6cKxktBvvlbGU3MCiT9Xbf43gUg1Su+xInf2sAlEFA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4426xc82dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:12:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50910t6s013698;
	Thu, 9 Jan 2025 04:12:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygap39ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:12:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5094CJYv18678034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 04:12:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5827E20049;
	Thu,  9 Jan 2025 04:12:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46A4420040;
	Thu,  9 Jan 2025 04:12:16 +0000 (GMT)
Received: from [9.43.18.121] (unknown [9.43.18.121])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 04:12:15 +0000 (GMT)
Message-ID: <ea2d2f5d-5410-4f7e-a3f5-258c432e9be9@linux.ibm.com>
Date: Thu, 9 Jan 2025 09:42:14 +0530
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
Subject: Re: [PATCH] kexec: Initialize ELF lowest address to ULONG_MAX
To: Baoquan he <bhe@redhat.com>, ebiederm@xmission.com
Cc: Hari Bathini <hbathini@linux.ibm.com>, akpm@linux-foundation.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241210091314.185785-1-sourabhjain@linux.ibm.com>
 <Z1pQoh7IwtERIWe5@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Z1pQoh7IwtERIWe5@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BBvxfhqmZn0KHJqDL_jyalZewOdicwfn
X-Proofpoint-ORIG-GUID: BBvxfhqmZn0KHJqDL_jyalZewOdicwfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Baoquan and Eric,


On 12/12/24 08:25, Baoquan he wrote:
> On 12/10/24 at 02:43pm, Sourabh Jain wrote:
>> kexec_elf_load() loads an ELF executable and sets the address of the
>> lowest PT_LOAD section to the address held by the lowest_load_addr
>> function argument.
>>
>> To determine the lowest PT_LOAD address, a local variable lowest_addr
>> (type unsigned long) is initialized to UINT_MAX. After loading each
>> PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
>> address is lower, lowest_addr is updated. However, setting lowest_addr
>> to UINT_MAX won't work when the kernel image is loaded above 4G, as the
>> returned lowest PT_LOAD address would be invalid. This is resolved by
>> initializing lowest_addr to ULONG_MAX instead.
>>
>> This issue was discovered while implementing crashkernel high/low
>> reservation on the PowerPC architecture.
>>
>> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   kernel/kexec_elf.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
>> index d3689632e8b9..3a5c25b2adc9 100644
>> --- a/kernel/kexec_elf.c
>> +++ b/kernel/kexec_elf.c
>> @@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
>>   			 struct kexec_buf *kbuf,
>>   			 unsigned long *lowest_load_addr)
>>   {
>> -	unsigned long lowest_addr = UINT_MAX;
>> +	unsigned long lowest_addr = ULONG_MAX;
> Great catch.
>
> Acked-by: Baoquan He <bhe@redhat.com>
Thank you for the Ack! The upcoming two patch series, which aim to 
enable generic crashkernel reservation, depends on this fix. One of them 
is already posted for upstream review: 
https://lore.kernel.org/all/20250108101458.406806-1-sourabhjain@linux.ibm.com/ 
I was wondering if you could guide us on how to get this fix pushed to 
the mainline tree.

Thanks,
Sourabh Jain

