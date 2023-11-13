Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD27E96BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 07:43:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZQlUaDRi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STKcs1qFfz3cTb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 17:43:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZQlUaDRi;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STKbx398Pz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 17:42:21 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4STKbv6StYz4xPh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 17:42:19 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4STKbv6Lp6z4xNH; Mon, 13 Nov 2023 17:42:19 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZQlUaDRi;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4STKbv302hz4xFR;
	Mon, 13 Nov 2023 17:42:18 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AD6dePR015403;
	Mon, 13 Nov 2023 06:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=49rmV5crsNSGM7KgNAb70g/eO86QYMuSk5BqE4eDsIA=;
 b=ZQlUaDRiAE8DpDbR2RSBW//lX+icC1ehXHN4FNEhHkbdByPntXNdZDsm86sU5HtkxLrQ
 Ve2QTZjts+2LtfnDyTcf9qje+YqtAxz6hjn2sudO3iOSyCjqylGkLwk53CLxHBD/bSgS
 2wq3ulqM+bogW5tPkbVupAmeMMXjUbtFwQhdqurHq3MikRXjU9+ZCiiyTK70sOsfK+Wk
 UuDZQOhMXWRwtt7UnuhfUbImJdLmpHq96eQQlmTq6u/+pL4yhV3HKnhAIQHlG7P6HP7b
 ZS1eT35tnCrScyzKu8f0O4k74on+8ikRfADxY+FByo3CUSZaVgwSXYbYwpJJ/rmV1tIV +w== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubeqn81rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 06:42:16 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AD4mrS1029421;
	Mon, 13 Nov 2023 06:42:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uakxsfjuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 06:42:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AD6gCBe20316682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 06:42:12 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7ADF120043;
	Mon, 13 Nov 2023 06:42:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35CE520040;
	Mon, 13 Nov 2023 06:42:09 +0000 (GMT)
Received: from [9.43.61.71] (unknown [9.43.61.71])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Nov 2023 06:42:08 +0000 (GMT)
Message-ID: <3fb7dada-56e3-4b19-94e5-38776492b404@linux.ibm.com>
Date: Mon, 13 Nov 2023 12:12:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <87leb7qg1p.fsf@mail.lhotse>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87leb7qg1p.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0LSPqMWF4XAnNpZe5v0POt-Az8Bhff1m
X-Proofpoint-GUID: 0LSPqMWF4XAnNpZe5v0POt-Az8Bhff1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=732
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130056
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

Hello Michael,


On 09/11/23 17:44, Michael Ellerman wrote:
> Hi Sourabh,
>
> This seems like a good change to the design, but I'm confused by
> some things, more below ...

Thanks.

> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> ...
>> Table 1 below illustrates kernel's ability to collect dump if either the
>> first/crashed kernel or the second/fadump kernel does not have the
>> changes introduced here. Consider the 'old kernel' as the kernel without
>> this patch, and the 'new kernel' as the kernel with this patch included.
>>
>> +----------+------------------------+------------------------+-------+
>> | scenario |  first/crashed kernel  |  second/fadump kernel  |  Dump |
>> +----------+------------------------+------------------------+-------+
>> |    1     |       old kernel       |        new kernel      |  Yes  |
>> +----------+------------------------+------------------------+-------+
>> |    2     |       new kernel       |        old kernel      |  No   |
>> +----------+------------------------+------------------------+-------+
>>
>> 			      Table 1
>>
>> Scenario 1:
>> -----------
>> Since the magic number of fadump header is updated, the second kernel
>> can differentiate the crashed kernel is of type 'new kernel' or
>> 'old kernel' and act accordingly. In this scenario, since the crashed
>> kernel is of type 'old kernel,' the fadump kernel skips elfcorehdr
>> creation and uses the one prepared in the first kernel itself to collect
>> the dump.
>>
>> Scenario 2:
>> -----------
>> Since 'old kernel' as the fadump kernel is NOT capable of processing
>> fadump header with updated magic number from 'new kernel' hence it
>> gracefully fails with the below error and dump collection fails in this
>> scenario.
>>
>> [    0.007365] rtas fadump: Crash info header is not valid.
>>
>> Add a version field to the fadump_crash_info_header structure to avoid
>> the need to change its magic number in the future. Adding a version
>> field to the fadump header was one of the TODO items listed in
>> Documentation/powerpc/firmware-assisted-dump.rst.
> This is a good analysis of the issues with different kernel versions,
> and seems like an OK trade off, ie. that old kernels can't process dumps
> from new kernels.
>
> But do we actually support using different kernel versions for the
> crash/dump kernel?
>
> Because AFAICS the fadump_crash_info_header is not safe across kernel
> versions, in its current form or with your changes.

Yeah, I was also under the impression that it is not supported, but I 
was not aware
that the size of pt_regs and cpumask can change based on the configuration.

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
>>   /* fadump crash info structure */
>>   struct fadump_crash_info_header {
>> @@ -51,6 +69,10 @@ struct fadump_crash_info_header {
>>
> struct fadump_crash_info_header {
> 	u64		magic_number;
> 	u64		elfcorehdr_addr;
>
>>   	u32		crashing_cpu;
>>   	struct pt_regs	regs;
>>   	struct cpumask	cpu_mask;
>> +	u32		version;
>> +	u64		elfcorehdr_size;
>> +	u64		vmcoreinfo_raddr;
>> +	u64		vmcoreinfo_size;
>>   };
> The reason I say it's not safe is because pt_regs and especially cpumask
> can change size depending on the kernel configuration.
>
> pt_regs probably doesn't change size in practice for common kernel
> configurations, but some of the fields are under #ifdef.
>
> cpumask on the other hand is directly controlled by CONFIG_NR_CPUS. So
> if the first and second kernel have a different value for NR_CPUS they
> will disagree on the size of the struct.
>
> That has presumably worked OK so far because folks tend to use the same, or
> similar kernels for the first/second kernel. And also the cpumask is the
> last element of the struct, so a disagreement about it size doesn't
> affect the location of other fields.
>
> However with your new design the version field will move based on the
> cpumask size, which will potentially break detection of the version by
> the second kernel.
>
> At least that's how it looks to me, I don't see any checks anywhere that
> will save us, or did I miss something?
I agree with you. If the sizes of pt_regs and cpu_mask are different between
the first/crash kernel and the fadump/second kernel, the dump collection
might not work correctly.

Given that dump capture is not supported across kernel versions, I think 
it is
better to keep new attributes introduced in this patch to struct 
fadump_crash_info_header
before pt_regs and cpumask. For example:

/* fadump crash info structure */
struct fadump_crash_info_header {
     u64        magic_number;
+  u32        version;
+  u64        vmcoreinfo_raddr;
+  u64        vmcoreinfo_size;
     u64        elfcorehdr_addr;
+  u64        elfcorehdr_size;
     u32        crashing_cpu;
     struct pt_regs    regs;
     struct cpumask    cpu_mask;
};

Kernel with this patch included will not process the dump if 
fadump_crash_info_header
holds old magic number.

Something like:

     if (fdh->magic_number == fadump_str_to_u64("FADMPINF")) {
         pr_err("Incompatible fadump header, can't process the dump");
     }

Does this approach look good to you?

Thanks,
Sourabh
