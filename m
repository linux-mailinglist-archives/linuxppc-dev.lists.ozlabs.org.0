Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A685A10C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 11:33:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MrZKWm79;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tdf5L53tPz3d42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 21:33:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MrZKWm79;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tdf4c5kc6z2yst
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 21:32:48 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tdf4c29dkz4wcs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 21:32:48 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Tdf4c25nJz4wcy; Mon, 19 Feb 2024 21:32:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MrZKWm79;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Tdf4b5zBRz4wcs
	for <linuxppc-dev@ozlabs.org>; Mon, 19 Feb 2024 21:32:47 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41JAV7EC022943;
	Mon, 19 Feb 2024 10:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=l8upNAqQmBCSeuVc4LW1BEI9kgEN/cbxkhP9+sVlKvc=;
 b=MrZKWm79Qr0kmE9r308eLe0YbORYBuLbH96RhxnW6juabUEKyBTGSW+QxMIJC/SiGDNN
 1JG8EUbhN0fqvWjx4Dg8Le6Kfnvko2zDWA5pxVKd+k9NbyWS24yIFzUbNBsGQ+WrMmsb
 a76Hpj2KbivL6FFSDkDQgRrd4ggX8ecmGMME1834zG9c9CaletokrotJDU1KLDuEYggo
 YnfRno5y1adU6M55c8s02gEzRGv0Jbqyo0IgnfCFYaVkeOrGjKbgyNQ8dyFlweBHYtQ6
 T0eVxQcm9mbRGtzEbqQWIo7YHFAmatMTyNkabQQmOH/fhM8yrEVdCmdi0mO9ITPKk//a YQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wc40ea5hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 10:32:37 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41J8JsXW009627;
	Mon, 19 Feb 2024 10:32:35 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb84p0k6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 10:32:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41JAWUgD44957952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Feb 2024 10:32:32 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0265F2004B;
	Mon, 19 Feb 2024 10:32:30 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C19FC2004D;
	Mon, 19 Feb 2024 10:32:26 +0000 (GMT)
Received: from [9.61.140.65] (unknown [9.61.140.65])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Feb 2024 10:32:26 +0000 (GMT)
Message-ID: <425f4366-cb7d-4783-bbf8-53c55f2a0430@linux.ibm.com>
Date: Mon, 19 Feb 2024 16:02:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] powerpc: make fadump resilient with memory
 add/remove events
Content-Language: en-US
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20240111140943.297501-1-sourabhjain@linux.ibm.com>
 <20240111140943.297501-2-sourabhjain@linux.ibm.com>
 <41a0647e-8a8a-40ca-9a07-3e97f02cc369@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <41a0647e-8a8a-40ca-9a07-3e97f02cc369@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ENhlctLvmT-oNTXIRFPNVeKGQHwa3hMa
X-Proofpoint-ORIG-GUID: ENhlctLvmT-oNTXIRFPNVeKGQHwa3hMa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_07,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2402190079
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Hari,

On 23/01/24 15:39, Hari Bathini wrote:
>
>
> On 11/01/24 7:39 pm, Sourabh Jain wrote:
>> Due to changes in memory resources caused by either memory hotplug or
>> online/offline events, the elfcorehdr, which describes the CPUs and
>> memory of the crashed kernel to the kernel that collects the dump (known
>> as second/fadump kernel), becomes outdated. Consequently, attempting
>> dump collection with an outdated elfcorehdr can lead to failed or
>> inaccurate dump collection.
>>
>> Memory hotplug or online/offline events is referred as memory add/remove
>> events in reset of the commit message.
>>
>> The current solution to address the aforementioned issue is as follows:
>> Monitor memory add/remove events in userspace using udev rules, and
>> re-register fadump whenever there are changes in memory resources. This
>> leads to the creation of a new elfcorehdr with updated system memory
>> information.
>>
>> There are several notable issues associated with re-registering fadump
>> for every memory add/remove events.
>>
>> 1. Bulk memory add/remove events with udev-based fadump re-registration
>>     can lead to race conditions and, more importantly, it creates a wide
>>     window during which fadump is inactive until all memory add/remove
>>     events are settled.
>> 2. Re-registering fadump for every memory add/remove event is
>>     inefficient.
>> 3. The memory for elfcorehdr is allocated based on the memblock regions
>>     available during early boot and remains fixed thereafter. 
>> However, if
>>     elfcorehdr is later recreated with additional memblock regions, its
>>     size will increase, potentially leading to memory corruption.
>>
>> Address the aforementioned challenges by shifting the creation of
>> elfcorehdr from the first kernel (also referred as the crashed kernel),
>> where it was created and frequently recreated for every memory
>> add/remove event, to the fadump kernel. As a result, the elfcorehdr only
>> needs to be created once, thus eliminating the necessity to re-register
>> fadump during memory add/remove events.
>>
>> At present, the first kernel prepares the fadump header and stores it in
>> the fadump reserved area. The fadump header contains start address of
>> the elfcorehd, crashing CPU details, etc.  In the event of first kernel
>
> "elfcorehd" used instead of "elfcorehdr" at a couple of places..

Fixed it now. Thanks.

>
>> crash, the second/fadump boots and access the fadump header prepared by
>> first kernel and do the following in a platform-specific function
>> [rtas|opal]_fadump_process:
>>
>> At present, the first kernel is responsible for preparing the fadump
>> header and storing it in the fadump reserved area. The fadump header
>> includes the start address of the elfcorehd, crashing CPU details, and
>> other relevant information. In the event of a crash in the first kernel,
>> the second/fadump boots and accesses the fadump header prepared by the
>> first kernel. It then performs the following steps in a
>> platform-specific function [rtas|opal]_fadump_process:
>>
>> 1. Sanity check for fadump header
>> 2. Update CPU notes in elfcorehdr
>> 3. Set the global variable elfcorehdr_addr to the address of the
>>     fadump header's elfcorehdr. For vmcore module to process it later 
>> on.
>>
>> Along with the above, update the setup_fadump()/fadump.c to create
>> elfcorehdr in second/fadump kernel.
>>
>> Section below outlines the information required to create the elfcorehdr
>> and the changes made to make it available to the fadump kernel if it's
>> not already.
>>
>> To create elfcorehdr, the following crashed kernel information is
>> required: CPU notes, vmcoreinfo, and memory ranges.
>>
>> At present, the CPU notes are already prepared in the fadump kernel, so
>> no changes are needed in that regard. The fadump kernel has access to
>> all crashed kernel memory regions, including boot memory regions that
>> are relocated by firmware to fadump reserved areas, so no changes for
>> that either. However, it is necessary to add new members to the fadump
>> header, i.e., the 'fadump_crash_info_header' structure, in order to pass
>> the crashed kernel's vmcoreinfo address and its size to fadump kernel.
>>
>> In addition to the vmcoreinfo address and size, there are a few other
>> attributes also added to the fadump_crash_info_header structure.
>>
>> 1. version:
>>     It stores the fadump header version, which is currently set to 1.
>>     This provides flexibility to update the fadump crash info header in
>>     the future without changing the magic number. For each change in the
>>     fadump header, the version will be increased. This will help the
>>     updated kernel determine how to handle kernel dumps from older
>>     kernels. The magic number remains relevant for checking fadump 
>> header
>>     corruption.
>>
>> 2. elfcorehdr_size:
>>     since elfcorehdr is now prepared in the fadump/second kernel and
>>     it is not part of the reserved area, this attribute is needed to
>>     track the memory allocated for elfcorehdr to do the deallocation
>>     properly.
>>
>> 3. pt_regs_sz/cpu_mask_sz:
>>     Store size of pt_regs and cpu_mask strucutre in first kernel. These
>>     attributes are used avoid processing the dump if the sizes of 
>> pt_regs
>>     and cpu_mask are not the same across the crashed and fadump kernel.
>>
>> Note: if either first/crashed kernel or second/fadump kernel do not have
>> the changes introduced here then kernel fail to collect the dump and
>> prints relevant error message on the console.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Cc: Aditya Gupta <adityag@linux.ibm.com>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Naveen N Rao <naveen@kernel.org>
>> ---
>>   arch/powerpc/include/asm/fadump-internal.h   |  31 +-
>>   arch/powerpc/kernel/fadump.c                 | 355 +++++++++++--------
>>   arch/powerpc/platforms/powernv/opal-fadump.c |  18 +-
>>   arch/powerpc/platforms/pseries/rtas-fadump.c |  23 +-
>>   4 files changed, 242 insertions(+), 185 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/fadump-internal.h 
>> b/arch/powerpc/include/asm/fadump-internal.h
>> index 27f9e11eda28..a632e9708610 100644
>> --- a/arch/powerpc/include/asm/fadump-internal.h
>> +++ b/arch/powerpc/include/asm/fadump-internal.h
>> @@ -42,13 +42,40 @@ static inline u64 fadump_str_to_u64(const char *str)
>>     #define FADUMP_CPU_UNKNOWN        (~((u32)0))
>>   -#define FADUMP_CRASH_INFO_MAGIC fadump_str_to_u64("FADMPINF")
>> +/*
>> + * The introduction of new fields in the fadump crash info header has
>> + * led to a change in the magic key from `FADMPINF` to `FADMPSIG` for
>> + * identifying a kernel crash from an old kernel.
>> + *
>> + * To prevent the need for further changes to the magic number in the
>> + * event of future modifications to the fadump crash info header, a
>> + * version field has been introduced to track the fadump crash info
>> + * header version.
>> + *
>> + * Consider a few points before adding new members to the fadump 
>> crash info
>> + * header structure:
>> + *
>> + *  - Append new members; avoid adding them in between.
>> + *  - Non-primitive members should have a size member as well.
>> + *  - For every change in the fadump header, increment the
>> + *    fadump header version. This helps the updated kernel decide 
>> how to
>> + *    handle kernel dumps from older kernels.
>> + */
>> +#define FADUMP_CRASH_INFO_MAGIC_OLD fadump_str_to_u64("FADMPINF")
>> +#define FADUMP_CRASH_INFO_MAGIC fadump_str_to_u64("FADMPSIG")
>> +#define FADUMP_HEADER_VERSION        1
>>     /* fadump crash info structure */
>>   struct fadump_crash_info_header {
>>       u64        magic_number;
>> -    u64        elfcorehdr_addr;
>> +    u32        version;
>>       u32        crashing_cpu;
>
>> +    u64        elfcorehdr_addr;
>> +    u64        elfcorehdr_size;
>
> fadump_crash_info_header structure is to share info across reboots.
> Now that elfcorehdr is prepared in second kernel and also dump capture
> of older kernel is not supported, get rid of elfcorehdr_addr &
> elfcorehdr_size from fadump_crash_info_header structure and put them
> in fw_dump structure instead..

Including elfcorehdr_addr and elfcorehdr_size in the fw_dump structure 
removes the
dependency on address translation from physical to virtual."

I have included the above suggestion in v8.
https://lore.kernel.org/all/20240217072004.148293-1-sourabhjain@linux.ibm.com/

Thanks for the suggestion.

- Sourabh
