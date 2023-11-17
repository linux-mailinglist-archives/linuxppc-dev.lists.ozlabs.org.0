Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB417EEC30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 07:15:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dLs3TuD6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWmpY1P6Kz3dHV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 17:15:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dLs3TuD6;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWmnd6yh9z2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 17:14:13 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SWmnc4hxsz4x5m
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 17:14:12 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SWmnc4dp6z4x5J; Fri, 17 Nov 2023 17:14:12 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dLs3TuD6;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SWmnc0pDpz4wd1;
	Fri, 17 Nov 2023 17:14:11 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH6Dh5l004534;
	Fri, 17 Nov 2023 06:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IpuCf88CLatnsy/ZTymjtjfmODIqKPjL+NFIBA0VzSE=;
 b=dLs3TuD6FoBX7jA+3g8nnCBKAJ6la0RUR6ND6UbDOQ0lgSKzpj1T90CkuXbMc3A4c4Xd
 xG3DBVVVPnSC8mmkcTrLY28lmzBP8ENoR61hWMGwDql+Aa9uekNu0q329eBnEgwsRCmy
 JPzR5+WikgKyf73YsmFURg656iwdFv/afMpyDKBqkwPQ1lSZHnyYaX4CUR6ovolK+eFF
 Em2GmDqDuKyiSmKTyV3m4xAXhypefWq4cZTaup8Y6kodPQc8vOXPSn3p12Ek8OkzyShA
 Cj6eHby+RIkLgPiA1oe+fe8KUAMjRf4SmV5QOHXoGhkE9y+cDLYd7Hcx34/crQSCBsZM kA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ue2je09rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 06:14:07 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH346Jv026248;
	Fri, 17 Nov 2023 06:14:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn23e1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 06:14:07 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AH6E4qR10879664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Nov 2023 06:14:04 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E63C20043;
	Fri, 17 Nov 2023 06:14:04 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01CF720040;
	Fri, 17 Nov 2023 06:14:03 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Nov 2023 06:14:02 +0000 (GMT)
Message-ID: <d615848e-d17f-31bd-f758-b557a4f1c735@linux.ibm.com>
Date: Fri, 17 Nov 2023 11:44:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
Content-Language: en-US
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
        Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
 <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
 <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ThqZvuV_tRfBkwF3M_TENH1xE1ptg5fX
X-Proofpoint-ORIG-GUID: ThqZvuV_tRfBkwF3M_TENH1xE1ptg5fX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_03,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170043
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/11/23 11:01 am, Aneesh Kumar K V wrote:
> On 11/17/23 10:03 AM, Sourabh Jain wrote:
>> Hi Aneesh,
>>
>> Thanks for reviewing the patch.
>>
>> On 15/11/23 10:14, Aneesh Kumar K.V wrote:
>>> Sourabh Jain<sourabhjain@linux.ibm.com>  writes:
>>>
>>> ....
>>>
>>>> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
>>>> index 27f9e11eda28..7be3d8894520 100644
>>>> --- a/arch/powerpc/include/asm/fadump-internal.h
>>>> +++ b/arch/powerpc/include/asm/fadump-internal.h
>>>> @@ -42,7 +42,25 @@ static inline u64 fadump_str_to_u64(const char *str)
>>>>      #define FADUMP_CPU_UNKNOWN        (~((u32)0))
>>>>    -#define FADUMP_CRASH_INFO_MAGIC        fadump_str_to_u64("FADMPINF")
>>>> +/*
>>>> + * The introduction of new fields in the fadump crash info header has
>>>> + * led to a change in the magic key, from `FADMPINF` to `FADMPSIG`.
>>>> + * This alteration ensures backward compatibility, enabling the kernel
>>>> + * with the updated fadump crash info to handle kernel dumps from older
>>>> + * kernels.
>>>> + *
>>>> + * To prevent the need for further changes to the magic number in the
>>>> + * event of future modifications to the fadump header, a version field
>>>> + * has been introduced to track the fadump crash info header version.
>>>> + *
>>>> + * Historically, there was no connection between the magic number and
>>>> + * the fadump crash info header version. However, moving forward, the
>>>> + * `FADMPINF` magic number in header will be treated as version 0, while
>>>> + * the `FADMPSIG` magic number in header will include a version field to
>>>> + * determine its version.
>>>> + */
>>>> +#define FADUMP_CRASH_INFO_MAGIC        fadump_str_to_u64("FADMPSIG")
>>>> +#define FADUMP_VERSION            1
>>>>
>>> Can we keep the old magic details as
>>>
>>> #define FADUMP_CRASH_INFO_MAGIC_OLD        fadump_str_to_u64("FADMPINF")
>>> #define FADUMP_CRASH_INFO_MAGIC        fadump_str_to_u64("FADMPSIG")
>>
>> Sure.
>>
>>> Also considering the struct need not be backward compatible, can we just
>>> do
>>>
>>> struct fadump_crash_info_header {
>>>      u64        magic_number;
>>>      u32        crashing_cpu;
>>>      u64        elfcorehdr_addr;
>>>      u64        elfcorehdr_size;
>>>      u64        vmcoreinfo_raddr;
>>>      u64        vmcoreinfo_size;
>>>      struct pt_regs    regs;
>>>      struct cpumask    cpu_mask;
>>> };
>>> static inline bool fadump_compatible(struct fadump_crash_info_header
>>> *fdh)
>>> {
>>>      return (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC)
>>> }
>>>
>>> and fail fadump if we find it not compatible?
>>
>> Agree that it is unsafe to collect a dump with an incompatible fadump crash info header.
>>
>> Given that I am updating the fadump crash info header, we can make a few arrangements
>> like adding a size filed for the dynamic size attribute like pt_regs and cpumask to ensure
>> better compatibility in the future.
>>
>> Additionally, let's introduce a version field to the fadump crash info header to avoid changing
>> the magic number in the future.
>>
> 
> I am not sure whether we need to add all the complexity to enable supporting different fadump kernel
> version. Is that even a possible use case with fadump? Can't we always assume that with fadump the
> crash kernel and fadump kernel will be same version? if yes we can simply fail with a magic number
> mismatch because that indicates an user config error?

If we decide not to support different kernel versions for production
kernel and capture kernel, We can make that implicit by adding kernel
version info of production kernel in the header and bailing out if
there is kernel version mismatch as magic could still match for two
different kernel versions.

I would personally prefer something like the below though:

	struct fadump_crash_info_header {
		u64		magic_number;
		u32		version
		u32		crashing_cpu;
		u64		elfcorehdr_addr;
		u64		elfcorehdr_size;
		u64		vmcoreinfo_raddr;
		u64		vmcoreinfo_size;
		u8		kernel_version[];
		u32		pt_regs_sz;
		struct pt_regs	regs;
		u32		cpu_mask_sz;
		struct cpumask	cpu_mask;
	};

	if (magic_number != new_magic)
		goto err;	/* Error out */

	if (kernel_version != capture_kernel_version)
	{
		if (cpu_mask_sz == sizeof(struct pt_regs) && cpu_mask_sz == 
sizeof(struct cpumask))
			/*
			 * Warn about the kernel version mismatch and how data can be different
			 * across kernel versions and proceed anyway!
			 */
		else
			goto err;	/* Error out */
	}

This ensures we warn and proceed in cases where it is less likely to
have issues capturing kernel dump. This helps in dev environment where
we are trying to debug an early boot crash - in which case capture
kernel can't be the same kernel as it would likely hit the same problem
while booting..

Thanks
Hari
