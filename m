Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE884E722F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 12:33:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ0Mb42BQz30hl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 22:33:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aWoQCcHu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ0Ln5QHHz2yHc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 22:32:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aWoQCcHu; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KQ0Ln3G7Dz4xPv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 22:32:33 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KQ0Ln3B14z4xc3; Fri, 25 Mar 2022 22:32:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aWoQCcHu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KQ0Ln05Rfz4xPv
 for <linuxppc-dev@ozlabs.org>; Fri, 25 Mar 2022 22:32:32 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P9gaiG013241; 
 Fri, 25 Mar 2022 11:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Qej6A/JImW9cO4gvkpmGVgF89rrAQsEn5nWGL7D13Ec=;
 b=aWoQCcHuXE0krLDF9zwf+ud2Rp9Wx1sJk8vm1OKmOL4JyBZerSVjHJY09RhxYvHqLZa4
 vm7g4RRrFT6/5mxJ8zHPSCHCCCs6Wuio65S0v7Mc+zdVD/geL69R4RmKMP8WcbzLOcN8
 SEdKkZjY2PtVQrOXnldmooAxeaXB2K7NBUx9+qRRYUG80p8QoRFNOeA5TccJfdFgLf0m
 rZzmT/XuxjduHMQgwkhvFh5pTE73yGiihIvnliIrVvgDh8fOGVQPgjs5YgjUQjOdfl77
 5PiJWrrEo3Y7j/zViVcutFbHt3W0SSZdZvIS06SjrtKz20bJKxyE8V03L7ORCnNLPgAo iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0t26wt6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 11:32:16 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PAoIb1021385;
 Fri, 25 Mar 2022 11:32:16 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0t26wt69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 11:32:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PBTInG004163;
 Fri, 25 Mar 2022 11:32:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t953yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 11:32:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22PBKOiV50921796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 11:20:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE53CAE04D;
 Fri, 25 Mar 2022 11:32:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0CF0AE045;
 Fri, 25 Mar 2022 11:32:07 +0000 (GMT)
Received: from [9.200.39.231] (unknown [9.200.39.231])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Mar 2022 11:32:07 +0000 (GMT)
Message-ID: <37be240d-b083-7501-7552-cb7aefbce7eb@linux.ibm.com>
Date: Fri, 25 Mar 2022 17:02:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 PATCH 4/5] powerpc/crash hp: add crash hotplug support
 for kexec_file_load
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <20220321080422.56255-5-sourabhjain@linux.ibm.com>
 <a8b58549-1fee-24d5-4fcb-b12cf8851ca4@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <a8b58549-1fee-24d5-4fcb-b12cf8851ca4@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iBMfmqO-CVgLCyvc43exkI9lZlYMfYFt
X-Proofpoint-GUID: gnFsqkcCo5dm6JFsUl6yXM3FA8Qd6VlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250065
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, bhe@redhat.com,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Eric,

On 24/03/22 00:02, Eric DeVolder wrote:
> Notes below.
> eric
>
> On 3/21/22 03:04, Sourabh Jain wrote:
>> Two major changes are done to enable the crash CPU hotplug handler.
>> Firstly, updated the kexec_load path to prepare kimage for hotplug
>> changes and secondly, implemented the crash hotplug handler itself.
>>
>> On the kexec load path, memsz allocation of crash FDT segment is
>> updated to ensure that it has sufficient buffer space to accommodate
>> future hot add CPUs. Initialized the kimage members to track the FDT
>> segment.
>>
>> The crash hotplug handler updates the cpus node of crash FDT. While
>> we update crash FDT the kexec_crash_image is marked invalid and restored
>> after FDT update to avoid race.
>>
>> Since memory crash hotplug support is not there yet the crash hotplug
>> handler simply warn the user and return.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kexec/core_64.c | 46 ++++++++++++++++++++++++++++++++++++
>>   arch/powerpc/kexec/elf_64.c  | 40 +++++++++++++++++++++++++++++++
>>   2 files changed, 86 insertions(+)
>>
>> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
>> index 249d2632526d..a470fe6904e3 100644
>> --- a/arch/powerpc/kexec/core_64.c
>> +++ b/arch/powerpc/kexec/core_64.c
>> @@ -466,6 +466,52 @@ int update_cpus_node(void *fdt)
>>       return ret;
>>   }
>>   +#ifdef CONFIG_CRASH_HOTPLUG
>> +/**
>> + * arch_crash_hotplug_handler() - Handle hotplug FDT changes
>> + * @image: the active struct kimage
>> + * @hp_action: the hot un/plug action being handled
>> + * @a: first parameter dependent upon hp_action
>> + * @b: first parameter dependent upon hp_action
>> + *
>> + * To accurately reflect CPU hot un/plug changes, the FDT
>> + * must be updated with the new list of CPUs and memories.
>> + */
>> +void arch_crash_hotplug_handler(struct kimage *image, unsigned int 
>> hp_action,
>> +                unsigned long a, unsigned long b)
>> +{
>> +    void *fdt;
>> +
>> +    /* No action needed for CPU hot-unplug */
>> +    if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
>> +        return;
> Just curious why no action is needed on cpu remove?


Since CPU note addresses are already available for all possible CPUs 
(regardless they are online or not) the
PHDR is allocated for all possible CPUs during elfcorehdr creation. At 
least for the kexec_load system call.

Now on the crash path, the crashing CPU initiates an IPI call to update 
the CPU data of all online CPUs and
jumps to the purgatory. Hence no action is needed for the remove case.

With the above logic, we shouldn't be taking any action for the CPU add 
case too, right? But on PowerPC early
boot path there is validation that checks the boot CPU is part of the 
Flattened Device Tree (FDT) or not. If the
boot CPU is not found in FDT the boot fails. Hence FDT needs to be 
updated for every new CPU added to the
system.

>
>> +
>> +    /* crash update on memory hotplug is not support yet */
>> +    if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == 
>> KEXEC_CRASH_HP_ADD_MEMORY) {
>> +        pr_err("crash hp: crash update is not supported with memory 
>> hotplug\n");
>> +        return;
>> +    }
>> +
>> +    /* Must have valid FDT index */
>> +    if (!image->arch.fdt_index_valid) {
>> +        pr_err("crash hp: unable to locate FDT segment");
>> +        return;
>> +    }
>> +
>> +    fdt = __va((void *)image->segment[image->arch.fdt_index].mem);
>> +
>> +    /* Temporarily invalidate the crash image while it is replaced */
>> +    xchg(&kexec_crash_image, NULL);
>> +
>> +    /* update FDT to refelect changes to CPU resrouces */
>> +    if (update_cpus_node(fdt))
>> +        pr_err("crash hp: failed to update crash FDT");
>> +
>> +    /* The crash image is now valid once again */
>> +    xchg(&kexec_crash_image, image);
>> +}
>> +#endif /* CONFIG_CRASH_HOTPLUG */
>> +
>>   #ifdef CONFIG_PPC_64S_HASH_MMU
>>   /* Values we need to export to the second kernel via the device 
>> tree. */
>>   static unsigned long htab_base;
>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>> index eeb258002d1e..2ffe6d69e186 100644
>> --- a/arch/powerpc/kexec/elf_64.c
>> +++ b/arch/powerpc/kexec/elf_64.c
>> @@ -24,6 +24,33 @@
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>>   +
>> +#ifdef CONFIG_CRASH_HOTPLUG
>> +#define MAX_CORE 256
> Is there a better config option to tie this value too?

The above #defines are just placeholders. Eventually, we will replace 
the MAX_CORE with possible CPUs to calculate the FDT size. Maybe in the 
next version, the above #define will be removed.

>> +#define PER_CORE_NODE_SIZE 1500
>> +
>>

Thanks for the review Eric.

- Sourabh Jain

