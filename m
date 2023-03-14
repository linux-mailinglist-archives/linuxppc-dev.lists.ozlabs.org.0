Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0F6B8A04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 06:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbLxD1z1Jz3cGm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 16:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zg3I94MN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbLwD3ncHz3c6V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:01:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zg3I94MN;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PbLwD39zKz4x1f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:01:32 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PbLwD30YQz4xDp; Tue, 14 Mar 2023 16:01:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zg3I94MN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PbLwC74Z7z4x1f
	for <linuxppc-dev@ozlabs.org>; Tue, 14 Mar 2023 16:01:31 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32E4N4gn031612;
	Tue, 14 Mar 2023 05:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LzJoRwQrgNLlBUeq8375AoNBf9REiCPzOBqQbKKZURA=;
 b=Zg3I94MNaH3GBs9UT1G5o2BwCQnjKXx911DGwOpP4Uan93KcQUwobnkluekdxxiGKOjF
 Rj4urrKEYnalEuzOHo5UrV41541OlknWqA0pnXh6n+dYrGkQ+DEMlqXdFa0UuXQIHZB0
 ULpgXAt3OAI/LXQDIR407uAS3CfWW6QevCFV/F3WLqaXEs1mWhv6Xm+TT2FCMO+5Tnwd
 v8lupvrKlfINDK/dbZBewLcqkC5lpUPKIeY/BnD286pO37N3wQUJI4d1w2punq3tFopm
 93gYgZPkkXa/UC69wO+E5uxBp8MoI8DDsnDys3fvm8n6nwNDNmxtkG+bEopchRUNyQ65 ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pahus0nvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 05:01:13 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32E50pX7000543;
	Tue, 14 Mar 2023 05:01:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pahus0nux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 05:01:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DEIDkC000962;
	Tue, 14 Mar 2023 05:01:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p8h96m7xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 05:01:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32E517Ys32637346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Mar 2023 05:01:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 290932004F;
	Tue, 14 Mar 2023 05:01:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C2AF20043;
	Tue, 14 Mar 2023 05:01:05 +0000 (GMT)
Received: from [9.43.46.246] (unknown [9.43.46.246])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Mar 2023 05:01:05 +0000 (GMT)
Message-ID: <7eeea00d-78d6-c35c-f94c-f3ad73bcb509@linux.ibm.com>
Date: Tue, 14 Mar 2023 10:31:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 3/6] powerpc/crash: add a new member to the kimage_arch
 struct
Content-Language: en-US
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
 <20230312181154.278900-4-sourabhjain@linux.ibm.com>
 <5093127d-0199-2ef5-8a10-f293d54f3d90@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <5093127d-0199-2ef5-8a10-f293d54f3d90@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yt88Ncwu4e7nCa-cWwXX7Jr86_E78iGN
X-Proofpoint-ORIG-GUID: B2bLUMkO7PMIebrngwIPHDMWtmhjKfwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140040
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 13/03/23 21:55, Laurent Dufour wrote:
> On 12/03/2023 19:11:51, Sourabh Jain wrote:
>> A new member "fdt_index" is added to the kimage_arch struct to hold
>> the index of the FDT (Flattened Device Tree) segment from the kexec
>> the segment array.
>>
>> fdt_index will provide direct access to the FDT segment in the kexec
>> segment array after the kdump kernel is loaded.
>>
>> The new attribute will be used in the arch crash hotplug handler
>> (added in upcoming patches) on every CPU and memory hotplug event.
>>
>> The fdt_index is populated for both kexec_load and kexec_file_load
>> case.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/kexec.h |  5 +++++
>>   arch/powerpc/kexec/core_64.c     | 31 +++++++++++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
>> index 8090ad7d97d9d..348eb96e8ca67 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -103,6 +103,8 @@ void kexec_copy_flush(struct kimage *image);
>>   struct crash_mem;
>>   int update_cpus_node(void *fdt);
>>   int get_crash_memory_ranges(struct crash_mem **mem_ranges);
>> +int machine_kexec_post_load(struct kimage *image);
>> +#define machine_kexec_post_load machine_kexec_post_load
> Minor comment, when CONFIG_CRASH_HOTPLUG is not set the function is simply
> returning 0, why not defining it has an inline in that case?

We can, but if the initialization of fdt_index is taken care during the 
allocation
of kimage struct, I will move the fdt_index discovery logic to arch crash
hotplug handler. More on fdt_index initialization in the next comment.


>>   #endif
>>   
>>   #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
>> @@ -118,6 +120,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
>>   struct kimage_arch {
>>   	struct crash_mem *exclude_ranges;
>>   
>> +#if defined(CONFIG_CRASH_HOTPLUG)
>> +	int fdt_index;
>> +#endif
>>   	unsigned long backup_start;
>>   	void *backup_buf;
>>   	void *fdt;
>> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
>> index 0b292f93a74cc..531486c973988 100644
>> --- a/arch/powerpc/kexec/core_64.c
>> +++ b/arch/powerpc/kexec/core_64.c
>> @@ -77,6 +77,37 @@ int machine_kexec_prepare(struct kimage *image)
>>   	return 0;
>>   }
>>   
>> +int machine_kexec_post_load(struct kimage *kimage)
>> +{
>> +#if defined(CONFIG_CRASH_HOTPLUG)
>> +	int i;
>> +	void *ptr;
>> +	unsigned long mem;
>> +
>> +	/* Mark fdt_index invalid */
>> +	kimage->arch.fdt_index = -1;
> Why is that not done in the series introducing the generic
> crash hotplug update, in do_kimage_alloc_init() ?

do_kimage_alloc_init is a generic function where as fdt_index is a ppc 
specific
attribute. If fdt_index is initialized in do_kimage_alloc_init then 
other architectures
will have build issues.

> This way there is a guarantee that the field will not be used while set by
> default to 0.

I agree that until the kernel hits the machine_kexec_post_load function 
on the
kdump kernel load path there is no way to identify the fdt_index is holding
a valid index or not.

Since there is no consumer of kimage's fdt_index attribute from the 
point of its
allocation to until it is initialized, we don't have any impact of 
fdt_index holding
value 0 (which is not valid) for sometime.

But still we can do few things to allow fdt_index attribute consumers to 
check
the sanity of fdt_index.

1. Introduce arch specific function call to initialize kimage_arch 
struct (basically fdt_index for now).
and call it inside do_kimage_alloc_init and initialize the fdt_index 
with -1 there.

2. Add another attribute in kimage_arch struct to indicate the sanity of the
fdt_index attribute. For example fdt_index_valid, if this holds zero then
the fdt_index holds invalid index. (looks inefficient to me)

Not sure is it worth doing but please let me know your opinion.

Thanks,
Sourabh Jain

