Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 893EE7F6CE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 08:27:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IKgfpH4Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc64k3DrTz3vdY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IKgfpH4Q;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc63q3P7jz3d8t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:26:31 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sc63n6mZrz4x1R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:26:29 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Sc63n6fMpz4wy1; Fri, 24 Nov 2023 18:26:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IKgfpH4Q;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Sc63n1FvWz4wdF;
	Fri, 24 Nov 2023 18:26:28 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO7BZ9s031892;
	Fri, 24 Nov 2023 07:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DNjK8OThQhTnUGVs/WM2Elymlbva4U7lZnMZTar0hyI=;
 b=IKgfpH4QgLPokXuSnvsEMCKkO8whSrcRa+S6c58a9zY1LZUPODpIbkMnDZfpkLxUe0HY
 y3mHa+B95sdDXZnohdZwJqxPDUEgwj0dFtA9n/s6ifegNNei7OJMFeATwOfn4B/8yVge
 19s0wFqP40SzQ9cBSjTVzomjt9e7eqdzw+VXFnmzejvWEOc+9y1LYgdoTIXDLCyaXDo/
 hUPVVBtTtUauv6PO/P4JdOnOfr95OgrmLUOJP/WZ5o9JIALxQzI3Ri4Yb2dQjwvuJFpq
 GjXqqnHaJNCaM2Wu+Tcru9z0gTJ+r3lN65HimSeSGB+s5IlwrPG/GOfoVmi88MrzinWz CA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ujpe5s63c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 07:26:23 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO6J4X8013996;
	Fri, 24 Nov 2023 07:21:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf8kpc5qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 07:21:22 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AO7LJPY42140016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Nov 2023 07:21:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77A3320043;
	Fri, 24 Nov 2023 07:21:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CBE920040;
	Fri, 24 Nov 2023 07:21:18 +0000 (GMT)
Received: from [9.43.127.117] (unknown [9.43.127.117])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Nov 2023 07:21:17 +0000 (GMT)
Message-ID: <f75a2cd4-e75d-40d0-bf86-e3f8cc9ce302@linux.ibm.com>
Date: Fri, 24 Nov 2023 12:51:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
 <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
 <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
 <87fs0yjrjf.fsf@mail.lhotse>
 <e65c4dd0-df97-481d-b3e9-0088f2c9b2ea@linux.ibm.com>
 <87cyw2j6h1.fsf@mail.lhotse>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87cyw2j6h1.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5sHoOS4xXe8KFGsflF8tDxy8G7-fiN7E
X-Proofpoint-GUID: 5sHoOS4xXe8KFGsflF8tDxy8G7-fiN7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240057
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

On 22/11/23 18:22, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> On 22/11/23 10:47, Michael Ellerman wrote:
>>> Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:
>>> ...
>>>> I am not sure whether we need to add all the complexity to enable supporting different fadump kernel
>>>> version. Is that even a possible use case with fadump? Can't we always assume that with fadump the
>>>> crash kernel and fadump kernel will be same version?
>>> How sure are we of that?
>>>
>>> Don't we go through grub when we boot into the 2nd kernel. And so
>>> couldn't it choose to boot a different kernel, for whatever reason.
>>>
>>> I don't think we need to support different pt_reg / cpumask sizes, but
>>> requiring the exact same kernel version is too strict I think.
>> Agree.
>>> But maybe I'm wrong. Would be good to hear what distro folks think.
>> How about checking fadump crash info header compatibility in the
>> following way?
>>
>> static bool is_fadump_header_compatible(struct fadump_crash_info_header
>> *fdh)
>> {
>>       if (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC_OLD) {
>>           pr_err("Old magic number, can't process the dump.");
>>           return false;
>>       }
>>
>>       if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
>>           pr_err("Fadump header is corrupted.");
>>           return false;
>>       }
>>
>>       /*
>>        * If the kernel version of the first/crashed kernel and the
>> second/fadump
>>        * kernel is not same, then only collect the dump if the size of all
>>        * non-primitive type members of the fadump header is the same
>> across kernels.
>>        */
>>       if (strcmp(fdh->kernel_version, init_uts_ns.name.release)) {
>   
> I don't think the kernel version check is necessary?

I didn't find a place where pt_regs members are accessed to take
a decision in fadump kernel. we just copy the pt_regs in fadump kernel.

So I think as long as size is same across kernels, we are good.

>
>>           if (fdh->pt_regs_sz != sizeof(struct pt_regs) || fdh->cpu_mask_sz != sizeof(struct cpumask)) {
>>               pr_err("Fadump header size mismatch.\n")
>>               return false;
> Yeah I think that works.
>
>>           } else
>>               pr_warn("Kernel version mismatch; dump data is unreliable.\n");
>>       }
>>
>>       return true;
>> }
>>
>> And the new fadump crash info header will be: As suggested by Hari.
>>
>> /* fadump crash info structure */
>> struct fadump_crash_info_header {
>>       u64        magic_number;
>> +  u32        version;
>   
> Do we need version? We're effectively using the magic_number as a
> version already. Having an actual version would allow us to make
> backward compatible changes in future, but it's not clear we'll need or
> want to do that.
Agree that currently version field is not used but I added a version 
field to
make the fadump header structure compatible with future changes without
changing the magic number.

I will add a comment on how version field should be utilized if one 
changes fadump
header in future.

>
>>       u32        crashing_cpu;
>>       u64        elfcorehdr_addr;
>> +  u64        elfcorehdr_size;
>> +  u64        vmcoreinfo_raddr;
>> +  u64        vmcoreinfo_size;
>> +  u8          kernel_version[__NEW_UTS_LEN + 1];
>> +  u32        pt_regs_sz;
>>       struct pt_regs    regs;
>> +  u32        cpu_mask_sz;
>   
> Typically you would put all the size fields before the variable sized
> fields, because otherwise the later size fields may not be where you
> expect them to be. But because we're bailing out if any of the sizes
> don't match it doesn't actually matter.

Yeah, but I will reorganize fadump header and put the size fields before the
variable sized fields.

>
>>       struct cpumask    cpu_mask;
>> };
> The other issue is endian. I assume we're just declaring that the
> 1st/2nd kernel must be the same endian? We should still make that
> explicit though.

A comment is fine or should we add a explicit check and error out
with relevant error message if endianness is not same across the
kernels?

Something like:

if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
     if (fdh->magic_number == swab64(FADUMP_CRASH_INFO_MAGIC)) {
         pr_err("Endianness mismatch");
     } else {
         pr_err("Fadump header is corrupted.");
     }
     return false;
}


>
> To make it clearer that this struct is somewhat an ABI, I think we
> should move the definition into arch/powerpc/include/uapi/asm/fadump.h
Sure
>
> We don't expect userspace to actually use the header, but it will
> hopefully remind everyone that the struct needs to be changed with care :)
Agree

Thanks,
Sourabh Jain
