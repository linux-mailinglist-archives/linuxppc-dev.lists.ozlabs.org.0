Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9F7EEBFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 06:32:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RizDj2BF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWlsG17z2z3dH2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 16:32:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RizDj2BF;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWlrK3hcFz3c5K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 16:31:29 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SWlrK340sz4x5q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 16:31:29 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SWlrK309rz4x5J; Fri, 17 Nov 2023 16:31:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RizDj2BF;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SWlrJ69d6z4x3D;
	Fri, 17 Nov 2023 16:31:28 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH5M8La029416;
	Fri, 17 Nov 2023 05:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xNlLdtpkeFd1EahKRSx3mRBYsa4ki/Q3KNxfWUadJ6Q=;
 b=RizDj2BFHgImEpkCjiXSKvHQ5NC7Tbu0Q56dqyTlawYs9aKSt3VkYCmVlAzbt0qsQzSw
 qQ622nYtlNEAnmXuYTXuaQWvB3gBSFkgvZrQswxva5+CXOildFFsWcNl13iuMydZ387y
 J0TM3ywPKBJV/FwA5ltLcVX4UcnQkxC2fAcIh1DA/A/bQcgabvA8Vtfhj+YTOJ2d7Z5h
 jBAR3mHXMRvinTjCiNF98yChrk2O5T3WbboNxLc7dDr6wzAGr9vgm/sHKmHafvg32YZ8
 okS0o0bfEYVV0wQv39lr4DaRYFOnI0VKz8cwxMPIWzTGwY0ACnN75klykwnTJbBWE9Gj /w== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ue1ybr6x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 05:31:23 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH340b9022657;
	Fri, 17 Nov 2023 05:31:08 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamayuwxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 05:31:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AH5V4au19792512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Nov 2023 05:31:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4F3A20043;
	Fri, 17 Nov 2023 05:31:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B9BD20040;
	Fri, 17 Nov 2023 05:31:03 +0000 (GMT)
Received: from [9.43.109.22] (unknown [9.43.109.22])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Nov 2023 05:31:03 +0000 (GMT)
Message-ID: <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
Date: Fri, 17 Nov 2023 11:01:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
 <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SvEm208d4u5ceiIG9WUXaEawEIwQ8dmT
X-Proofpoint-ORIG-GUID: SvEm208d4u5ceiIG9WUXaEawEIwQ8dmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_03,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=880 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170038
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/17/23 10:03 AM, Sourabh Jain wrote:
> Hi Aneesh,
> 
> Thanks for reviewing the patch.
> 
> On 15/11/23 10:14, Aneesh Kumar K.V wrote:
>> Sourabh Jain<sourabhjain@linux.ibm.com>  writes:
>>
>> ....
>>
>>> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
>>> index 27f9e11eda28..7be3d8894520 100644
>>> --- a/arch/powerpc/include/asm/fadump-internal.h
>>> +++ b/arch/powerpc/include/asm/fadump-internal.h
>>> @@ -42,7 +42,25 @@ static inline u64 fadump_str_to_u64(const char *str)
>>>     #define FADUMP_CPU_UNKNOWN        (~((u32)0))
>>>   -#define FADUMP_CRASH_INFO_MAGIC        fadump_str_to_u64("FADMPINF")
>>> +/*
>>> + * The introduction of new fields in the fadump crash info header has
>>> + * led to a change in the magic key, from `FADMPINF` to `FADMPSIG`.
>>> + * This alteration ensures backward compatibility, enabling the kernel
>>> + * with the updated fadump crash info to handle kernel dumps from older
>>> + * kernels.
>>> + *
>>> + * To prevent the need for further changes to the magic number in the
>>> + * event of future modifications to the fadump header, a version field
>>> + * has been introduced to track the fadump crash info header version.
>>> + *
>>> + * Historically, there was no connection between the magic number and
>>> + * the fadump crash info header version. However, moving forward, the
>>> + * `FADMPINF` magic number in header will be treated as version 0, while
>>> + * the `FADMPSIG` magic number in header will include a version field to
>>> + * determine its version.
>>> + */
>>> +#define FADUMP_CRASH_INFO_MAGIC        fadump_str_to_u64("FADMPSIG")
>>> +#define FADUMP_VERSION            1
>>>
>> Can we keep the old magic details as
>>
>> #define FADUMP_CRASH_INFO_MAGIC_OLD        fadump_str_to_u64("FADMPINF")
>> #define FADUMP_CRASH_INFO_MAGIC        fadump_str_to_u64("FADMPSIG")
> 
> Sure.
> 
>> Also considering the struct need not be backward compatible, can we just
>> do
>>
>> struct fadump_crash_info_header {
>>     u64        magic_number;
>>     u32        crashing_cpu;
>>     u64        elfcorehdr_addr;
>>     u64        elfcorehdr_size;
>>     u64        vmcoreinfo_raddr;
>>     u64        vmcoreinfo_size;
>>     struct pt_regs    regs;
>>     struct cpumask    cpu_mask;
>> };
>> static inline bool fadump_compatible(struct fadump_crash_info_header
>> *fdh)
>> {
>>     return (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC)
>> }
>>
>> and fail fadump if we find it not compatible?
> 
> Agree that it is unsafe to collect a dump with an incompatible fadump crash info header.
> 
> Given that I am updating the fadump crash info header, we can make a few arrangements
> like adding a size filed for the dynamic size attribute like pt_regs and cpumask to ensure
> better compatibility in the future.
> 
> Additionally, let's introduce a version field to the fadump crash info header to avoid changing
> the magic number in the future.
>

I am not sure whether we need to add all the complexity to enable supporting different fadump kernel
version. Is that even a possible use case with fadump? Can't we always assume that with fadump the
crash kernel and fadump kernel will be same version? if yes we can simply fail with a magic number
mismatch because that indicates an user config error? 

-aneesh

