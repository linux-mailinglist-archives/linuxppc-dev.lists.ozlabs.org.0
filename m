Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618A281669C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 07:41:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WUhxLDXl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Stqx30Y2Gz3cGv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 17:41:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WUhxLDXl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Stqw96MS3z30g1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 17:40:57 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BI42ZKs014660
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 06:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=J4ubEhTJJPu7XFRvit1Hy+eUXyM3ps4F9PB5/sWP6NE=;
 b=WUhxLDXl8qv9pvqfmp5tby+y95/jvv/snkwoUXFaBHEWGQDYJb2KDSi9ZPF4eKteRpy4
 EMdB2ebx3j0g8UCwA3p6YkiJPJPgshtvd/GjbB1dXTMuQk6tk16gvl8Nmd4tmIFec7e2
 uun2vZ7iS1Eepo+ZCkKvIHkec4X0FirvaDrt1g94QCqMeu6HCioRKPzi49Q3v7sT9cX+
 2y0LnOtE8Rls5fA+p7sopbOG7RUUKJmX9IsFTPQjy+rWx2T/hs+f9b8GdF6SqLyj3Yqz
 p4AoGG6BwmCdOoLDx+9M09H4NgITktlCEIWQTgMtuv19MljBVmXTdeWEWmRA8e/R9ob/ lw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v2epx3dcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 06:40:54 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BI3nAWK027086
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 06:40:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3v1rejptnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 06:40:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BI6enMq12059216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Dec 2023 06:40:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B73E02004B;
	Mon, 18 Dec 2023 06:40:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2A0520043;
	Mon, 18 Dec 2023 06:40:48 +0000 (GMT)
Received: from [9.203.115.195] (unknown [9.203.115.195])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 Dec 2023 06:40:48 +0000 (GMT)
Message-ID: <967d5157-e678-4bc4-9508-37ab87339f0e@linux.ibm.com>
Date: Mon, 18 Dec 2023 12:10:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] powerpc/fadump: pass additional parameters to
 dump capture kernel
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20231205201835.388030-1-hbathini@linux.ibm.com>
 <20231205201835.388030-3-hbathini@linux.ibm.com>
 <1de00a5a-afa0-4c75-9f29-4b5e091d8321@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <1de00a5a-afa0-4c75-9f29-4b5e091d8321@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IlRyJScj1lMkL5TpHI7Bzy0sdid46fEm
X-Proofpoint-ORIG-GUID: IlRyJScj1lMkL5TpHI7Bzy0sdid46fEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-18_02,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312180046
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sourabh,

On 15/12/23 2:12 pm, Sourabh Jain wrote:
> Hello Hari,
> 
> On 06/12/23 01:48, Hari Bathini wrote:
>> For fadump case, passing additional parameters to dump capture kernel
>> helps in minimizing the memory footprint for it and also provides the
>> flexibility to disable components/modules, like hugepages, that are
>> hindering the boot process of the special dump capture environment.
>>
>> Set up a dedicated parameter area to be passed to the capture kernel.
>> This area type is defined as RTAS_FADUMP_PARAM_AREA. Sysfs attribute
>> '/sys/kernel/fadump/bootargs_append' is exported to the userspace to
>> specify the additional parameters to be passed to the capture kernel
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/fadump-internal.h   |  3 +
>>   arch/powerpc/kernel/fadump.c                 | 80 ++++++++++++++++++++
>>   arch/powerpc/platforms/powernv/opal-fadump.c |  6 +-
>>   arch/powerpc/platforms/pseries/rtas-fadump.c | 35 ++++++++-
>>   arch/powerpc/platforms/pseries/rtas-fadump.h | 11 ++-
>>   5 files changed, 126 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/fadump-internal.h 
>> b/arch/powerpc/include/asm/fadump-internal.h
>> index b3956c400519..81629226b15f 100644
>> --- a/arch/powerpc/include/asm/fadump-internal.h
>> +++ b/arch/powerpc/include/asm/fadump-internal.h
>> @@ -97,6 +97,8 @@ struct fw_dump {
>>       unsigned long    cpu_notes_buf_vaddr;
>>       unsigned long    cpu_notes_buf_size;
>> +    unsigned long    param_area;
>> +
>>       /*
>>        * Maximum size supported by firmware to copy from source to
>>        * destination address per entry.
>> @@ -111,6 +113,7 @@ struct fw_dump {
>>       unsigned long    dump_active:1;
>>       unsigned long    dump_registered:1;
>>       unsigned long    nocma:1;
>> +    unsigned long    param_area_supported:1;
>>       struct fadump_ops    *ops;
>>   };
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 757681658dda..98f089747ac9 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -1470,6 +1470,7 @@ static ssize_t mem_reserved_show(struct kobject 
>> *kobj,
>>       return sprintf(buf, "%ld\n", fw_dump.reserve_dump_area_size);
>>   }
>> +
>>   static ssize_t registered_show(struct kobject *kobj,
>>                      struct kobj_attribute *attr,
>>                      char *buf)
>> @@ -1477,6 +1478,43 @@ static ssize_t registered_show(struct kobject 
>> *kobj,
>>       return sprintf(buf, "%d\n", fw_dump.dump_registered);
>>   }
>> +static ssize_t bootargs_append_show(struct kobject *kobj,
>> +                   struct kobj_attribute *attr,
>> +                   char *buf)
>> +{
>> +    return sprintf(buf, "%s\n", (char *)__va(fw_dump.param_area));
>> +}
>> +
>> +static ssize_t bootargs_append_store(struct kobject *kobj,
>> +                   struct kobj_attribute *attr,
>> +                   const char *buf, size_t count)
>> +{
>> +    char *params;
>> +
>> +    if (!fw_dump.fadump_enabled || fw_dump.dump_active)
>> +        return -EPERM;
>> +
>> +    if (count >= COMMAND_LINE_SIZE)
>> +        return -EINVAL;
>> +
>> +    /*
>> +     * Fail here instead of handling this scenario with
>> +     * some silly workaround in capture kernel.
>> +     */
>> +    if (saved_command_line_len + count >= COMMAND_LINE_SIZE) {
>> +        pr_err("Appending parameters exceeds cmdline size!\n");
>> +        return -ENOSPC;
>> +    }
>> +
>> +    params = __va(fw_dump.param_area);
>> +    strscpy_pad(params, buf, COMMAND_LINE_SIZE);
>> +    /* Remove newline character at the end. */
>> +    if (params[count-1] == '\n')
>> +        params[count-1] = '\0';
>> +
>> +    return count;
>> +}
>> +
>>   static ssize_t registered_store(struct kobject *kobj,
>>                   struct kobj_attribute *attr,
>>                   const char *buf, size_t count)
>> @@ -1535,6 +1573,7 @@ static struct kobj_attribute release_attr = 
>> __ATTR_WO(release_mem);
>>   static struct kobj_attribute enable_attr = __ATTR_RO(enabled);
>>   static struct kobj_attribute register_attr = __ATTR_RW(registered);
>>   static struct kobj_attribute mem_reserved_attr = 
>> __ATTR_RO(mem_reserved);
>> +static struct kobj_attribute bootargs_append_attr = 
>> __ATTR_RW(bootargs_append);
>>   static struct attribute *fadump_attrs[] = {
>>       &enable_attr.attr,
>> @@ -1611,6 +1650,46 @@ static void __init fadump_init_files(void)
>>       return;
>>   }
>> +/*
>> + * Reserve memory to store additional parameters to be passed
>> + * for fadump/capture kernel.
>> + */
>> +static void fadump_setup_param_area(void)
>> +{
>> +    phys_addr_t range_start, range_end;
>> +
>> +    if (!fw_dump.param_area_supported || fw_dump.dump_active)
>> +        return;
>> +
>> +    /* This memory can't be used by PFW or bootloader as it is shared 
>> across kernels */
>> +    if (radix_enabled()) {
>> +        /*
>> +         * Anywhere in the upper half should be good enough as all 
>> memory
>> +         * is accessible in real mode.
>> +         */
>> +        range_start = memblock_end_of_DRAM() / 2;
>> +        range_end = memblock_end_of_DRAM();
>> +    } else {
>> +        /*
>> +         * Passing additional parameters is supported for hash MMU only
>> +         * if the first memory block size is 768MB or higher.
>> +         */
>> +        if (ppc64_rma_size < 0x30000000)
>> +            return;
>> +
>> +        /* 640 MB to 768 MB is not used by bootloader */
>> +        range_start = 0x28000000;
>> +        range_end = range_start + 0x4000000;
>> +    }
>> +
>> +    fw_dump.param_area = memblock_phys_alloc_range(COMMAND_LINE_SIZE,
>> +                               COMMAND_LINE_SIZE,
>> +                               range_start,
>> +                               range_end);
> 
> Should we initialize the `param_area` to avoid garbage values, or retrieve
> command-line arguments from the previous boot?
> 
> I observed that cat /sys/kernel/fadump/bootargs_append prints the same
> value which I set before reboot. Is this expected?

I implemented it as such to reuse the arguments set in the
previous boot. Not likely to see garbage there. Even if we
do, unlikely that garbage is going to have a negative impact
on capture kernel boot (even if we don't reset the bootargs
in the userspace before crash)..

Thanks
Hari
