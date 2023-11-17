Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258E47EEBBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 05:34:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RafE36c0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWkZn0Q40z3dHR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 15:34:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RafE36c0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWkYt6kqvz3cT0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 15:33:54 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SWkYh4CBpz4x2W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 15:33:44 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SWkYh429Bz4x2V; Fri, 17 Nov 2023 15:33:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RafE36c0;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SWkYg5WMXz4wch;
	Fri, 17 Nov 2023 15:33:42 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH42YSS009841;
	Fri, 17 Nov 2023 04:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vK7EPql2BXMApYqXoLJjFA/iRCYsW6Q6soFPinYb3sg=;
 b=RafE36c0RXy/oISbGsd2pnbUiFZnIGZ/MZ+eykUDm3+P9nA/N57SwmUy/XEcas3JHG/m
 4iXzBkf0gN6OYl7fm8zrWQgImDWkQSVvYdbNa1t50zZEVjHv+USV4jJRGFsMM1j4EOCy
 R5xQ0jyaf9NXiqS4GVAwRzOX/VUgA4WuoSbSGdwZH7o/DC47xv8+xMI8BPBbQmq8hvx9
 iH7kbWqzMFd4nbmJubAGsgCVO/yjevjEnIOwko9JL2AhpfPP3YLNlEnUSLoEsowwQ8XI
 8z6C6EfI7F/9957mj1iGqknTy2y9SOD0kGCj4Ca3xZhN4GPCg/AQVLSxrzSGyRdLI9bc gg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ue0st8qrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 04:33:38 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH33u1H022448;
	Fri, 17 Nov 2023 04:33:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uap5kk0jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 04:33:37 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AH4XZWe8389226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Nov 2023 04:33:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F037A20043;
	Fri, 17 Nov 2023 04:33:34 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57B4120040;
	Fri, 17 Nov 2023 04:33:33 +0000 (GMT)
Received: from [9.43.99.43] (unknown [9.43.99.43])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Nov 2023 04:33:32 +0000 (GMT)
Message-ID: <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
Date: Fri, 17 Nov 2023 10:03:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <871qcr1v8v.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 86hvJ31B5-ko7tmsaDVLELzLeMp2sSDE
X-Proofpoint-ORIG-GUID: 86hvJ31B5-ko7tmsaDVLELzLeMp2sSDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_01,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 mlxscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=812 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170031
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

Hi Aneesh,

Thanks for reviewing the patch.

On 15/11/23 10:14, Aneesh Kumar K.V wrote:
> Sourabh Jain<sourabhjain@linux.ibm.com>  writes:
>
> ....
>
>> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
>> index 27f9e11eda28..7be3d8894520 100644
>> --- a/arch/powerpc/include/asm/fadump-internal.h
>> +++ b/arch/powerpc/include/asm/fadump-internal.h
>> @@ -42,7 +42,25 @@ static inline u64 fadump_str_to_u64(const char *str)
>>   
>>   #define FADUMP_CPU_UNKNOWN		(~((u32)0))
>>   
>> -#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPINF")
>> +/*
>> + * The introduction of new fields in the fadump crash info header has
>> + * led to a change in the magic key, from `FADMPINF` to `FADMPSIG`.
>> + * This alteration ensures backward compatibility, enabling the kernel
>> + * with the updated fadump crash info to handle kernel dumps from older
>> + * kernels.
>> + *
>> + * To prevent the need for further changes to the magic number in the
>> + * event of future modifications to the fadump header, a version field
>> + * has been introduced to track the fadump crash info header version.
>> + *
>> + * Historically, there was no connection between the magic number and
>> + * the fadump crash info header version. However, moving forward, the
>> + * `FADMPINF` magic number in header will be treated as version 0, while
>> + * the `FADMPSIG` magic number in header will include a version field to
>> + * determine its version.
>> + */
>> +#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPSIG")
>> +#define FADUMP_VERSION			1
>>
> Can we keep the old magic details as
>
> #define FADUMP_CRASH_INFO_MAGIC_OLD		fadump_str_to_u64("FADMPINF")
> #define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPSIG")

Sure.

> Also considering the struct need not be backward compatible, can we just
> do
>
> struct fadump_crash_info_header {
> 	u64		magic_number;
> 	u32		crashing_cpu;
> 	u64		elfcorehdr_addr;
> 	u64		elfcorehdr_size;
> 	u64		vmcoreinfo_raddr;
> 	u64		vmcoreinfo_size;
> 	struct pt_regs	regs;
> 	struct cpumask	cpu_mask;
> };
> static inline bool fadump_compatible(struct fadump_crash_info_header
> *fdh)
> {
> 	return (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC)
> }
>
> and fail fadump if we find it not compatible?

Agree that it is unsafe to collect a dump with an incompatible fadump 
crash info header.

Given that I am updating the fadump crash info header, we can make a few 
arrangements
like adding a size filed for the dynamic size attribute like pt_regs and 
cpumask to ensure
better compatibility in the future.

Additionally, let's introduce a version field to the fadump crash info 
header to avoid changing
the magic number in the future.

Thanks,
Sourabh
