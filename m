Return-Path: <linuxppc-dev+bounces-5510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7DA1A394
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:51:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdzmR17SVz3055;
	Thu, 23 Jan 2025 22:51:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737633063;
	cv=none; b=jzW0u/BurfECuKCtsljVhEKki6+P+bOfW2QvirbT3MTgUnTc7TT9qXREf8kfK60CDqiCKaRhMcfjAEKe1I26PmO8bm+WQyfitu3kmdkNqtPxLtvPMUOQlmf29sbNbxiLYjk3Ytmuw1ZUf1OTmBXG21gbhvPYGyK5AqqUZzd//6to4U9OVXdr9Lgw7U5H10NemES8azsvDP4gkVQmFv+qmVSPW9fpBxcape4JNC1lk3pW3xlQ0fZmscSK+qFtBJemFgivOGTJOAfrFhscbLBIjAZ+DxpmlMVDfJeA4JhzKLvZooODUZw4aSJsU2d68Ez6ijyByKZ6/2xCkIKxEfEeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737633063; c=relaxed/relaxed;
	bh=wztLYpcdvaafrvMBauDBzc7EB+s+9vhWjfjGFjsTNBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=og/Umw1Dmq+vaLppsym1C62KKSZTiqanzVH9TcmF2ZBLIn0HaCmPRzE4DGchvu7+ElBWZuH279ThyJcTekarQqDQmxxZg7vCBC4SUr7a7V4Eo7PScES+/38OGCUlDhBkHHvTkqZLhcIMXPOnuuSxg0hWUSFVn/OkG17CqNzdzndUqn+KzWQ/HeqHV9WyE1NWp8ZqpZvDYAEdTbCz/S/HHPMU4FyNJBYJEpGXT9bYnfPnqTNcWH/nkSnvtY77ljaIVQt+1NpMFkPAPwbN3y+AEzMpb7YSeAat8c/1JBdApyXy9ADIDmrDnnN+cTSB8yYs3JwHWVdAx123SK3fNikpOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VBNY/cBM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VBNY/cBM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdzmQ20Zpz304x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:51:01 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7WwLV028131;
	Thu, 23 Jan 2025 11:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wztLYp
	cdvaafrvMBauDBzc7EB+s+9vhWjfjGFjsTNBU=; b=VBNY/cBMefsefVUAKjygyF
	kQnfCNLZyHoRpe9n7lZMITCRLqi6J1kjMf5Gy0BhHWkJRFqxRZ0lcLAwyKu6NFpz
	03jkEBWgCiKlDCLD3MpJj7yDZP6bupcz1O8MQAK4DQX7GKGtAgkIYfCYaapjB07y
	YLmSjytvsWRtYVy7umBNiRJSsQ1ELSbjmvzr1l1LpXT20KFQWYPP0PaZTiXcCeqZ
	Id/Z23McdyyUIXcVMy9/XrQpgGgjtz43sGZWxevuIz286CksRm5yO5/pj7qSY5wv
	myBnGe5Ulo4y5FjA3zXt4TtIq04Q4pcNBtEHEp6STmXu3Ya2bpPCUBkpN5ZDOx1w
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bhfph5gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:50:50 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50NB4tWK029604;
	Thu, 23 Jan 2025 11:50:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448qmnnc2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:50:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NBok9o46531044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 11:50:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B2F820049;
	Thu, 23 Jan 2025 11:50:46 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71FE720040;
	Thu, 23 Jan 2025 11:50:44 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 11:50:44 +0000 (GMT)
Message-ID: <11b72488-e551-4889-b273-1f0da396193f@linux.ibm.com>
Date: Thu, 23 Jan 2025 17:20:43 +0530
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
Subject: Re: [PATCH v2 3/6] crash: let arch decide crash memory export to
 iomem_resource
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
 <20250121115442.1278458-4-sourabhjain@linux.ibm.com>
 <9207962e-acfe-4d68-a050-370ab0a48efa@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <9207962e-acfe-4d68-a050-370ab0a48efa@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a31hweNSB0MBkBt2EILDMRiH7zDBb67y
X-Proofpoint-ORIG-GUID: a31hweNSB0MBkBt2EILDMRiH7zDBb67y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Hari,


On 23/01/25 15:56, Hari Bathini wrote:
> Hi Sourabh,
>
> On 21/01/25 5:24 pm, Sourabh Jain wrote:
>> insert_crashkernel_resources() adds crash memory to iomem_resource if
>> generic crashkernel reservation is enabled on an architecture.
>>
>
>> On PowerPC, system RAM is added to iomem_resource. See commit
>> c40dd2f766440 ("powerpc: Add System RAM to /proc/iomem").
>
> The changelog clearly says the patch was added for kdump. But 
> kexec-tools or kernel code for kdump on powerpc don't seem to have relied
> on that. Device-tree memory nodes were used instead? Wondering if
> dropping commit c40dd2f766440 is better..
>

Hmm. Even I thought of removing that patch for the same reason.
But I noticed the below comment:

/*
  * System memory should not be in /proc/iomem but various tools expect it
  * (eg kdump).
  */

Since they said eg kdump. I thought maybe it is needed for tools other 
then kdump.
But I think this was only added for kdump. And as we know this is not
used in kexec/kdump tool anymore.

I will revert `c40dd2f766440 ("powerpc: Add System RAM to /proc/iomem"). `
change in the next series and take feedback from the community.

Thanks for the review.

- Sourabh Jain

>
>>
>> Enabling generic crashkernel reservation on PowerPC leads to a conflict
>> when system RAM is added to iomem_resource because a part of the system
>> RAM, the crashkernel memory, has already been added to iomem_resource.
>>
>> The next commit in the series "powerpc/crash: use generic crashkernel
>> reservation" enables generic crashkernel reservation on PowerPC. If the
>> crashkernel is added to iomem_resource, the kernel fails to add
>> system RAM to /proc/iomem and prints the following traces:
>>
>> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2+
>> snip...
>> NIP [c000000002016b3c] add_system_ram_resources+0xf0/0x15c
>> LR [c000000002016b34] add_system_ram_resources+0xe8/0x15c
>> Call Trace:
>> [c00000000484bbc0] [c000000002016b34] 
>> add_system_ram_resources+0xe8/0x15c
>> [c00000000484bc20] [c000000000010a4c] do_one_initcall+0x7c/0x39c
>> [c00000000484bd00] [c000000002005418] do_initcalls+0x144/0x18c
>> [c00000000484bd90] [c000000002005714] kernel_init_freeable+0x21c/0x290
>> [c00000000484bdf0] [c0000000000110f4] kernel_init+0x2c/0x1b8
>> [c00000000484be50] [c00000000000dd3c] 
>> ret_from_kernel_user_thread+0x14/0x1c
>>
>> To avoid this, an architecture hook is added in
>> insert_crashkernel_resources(), allowing the architecture to decide
>> whether crashkernel memory should be added to iomem_resource.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   include/linux/crash_reserve.h | 11 +++++++++++
>>   kernel/crash_reserve.c        |  3 +++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/include/linux/crash_reserve.h 
>> b/include/linux/crash_reserve.h
>> index 1fe7e7d1b214..f1205d044dae 100644
>> --- a/include/linux/crash_reserve.h
>> +++ b/include/linux/crash_reserve.h
>> @@ -18,6 +18,17 @@ int __init parse_crashkernel(char *cmdline, 
>> unsigned long long system_ram,
>>           unsigned long long *crash_size, unsigned long long 
>> *crash_base,
>>           unsigned long long *low_size, bool *high);
>>   +#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>> +
>> +#ifndef arch_add_crash_res_to_iomem
>> +static inline bool arch_add_crash_res_to_iomem(void)
>> +{
>> +    return true;
>> +}
>> +#endif
>> +
>> +#endif
>> +
>>   #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>>   #ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
>>   #define DEFAULT_CRASH_KERNEL_LOW_SIZE    (128UL << 20)
>> diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
>> index aff7c0fdbefa..190104f32fe1 100644
>> --- a/kernel/crash_reserve.c
>> +++ b/kernel/crash_reserve.c
>> @@ -460,6 +460,9 @@ void __init reserve_crashkernel_generic(unsigned 
>> long long crash_size,
>>   #ifndef HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY
>>   static __init int insert_crashkernel_resources(void)
>>   {
>> +    if (!arch_add_crash_res_to_iomem())
>> +        return 0;
>> +
>>       if (crashk_res.start < crashk_res.end)
>>           insert_resource(&iomem_resource, &crashk_res);
>


