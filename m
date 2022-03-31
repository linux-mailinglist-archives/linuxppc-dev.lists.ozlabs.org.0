Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F44ED669
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 11:02:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTckX2nXyz2yR4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 20:02:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y2bjqa7J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTcjn5Dkmz2xVq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 20:01:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y2bjqa7J; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KTcjm6qBGz4xXx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 20:01:32 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KTcjm6lhRz4xY0; Thu, 31 Mar 2022 20:01:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y2bjqa7J; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KTcjm3kvdz4xXx
 for <linuxppc-dev@ozlabs.org>; Thu, 31 Mar 2022 20:01:32 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22V7wShK004717; 
 Thu, 31 Mar 2022 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zO8nzZ7SCxcaFl1ZZt+VQVqMjX9PpbvMHNIJEaub2qA=;
 b=Y2bjqa7Jvz+QxlIEu2ybLvseAI+TJcvLq8uNpqNEIfsBHCLVsB2EdVhBfqGqgY75ceje
 WgJ//dIncrqY+v81mWcXMYgy/o7V6VtukR0EMX/eQ32cg5uvIT0FCs/y/Pwh2yyE0C9k
 SUxQqkMcF0HncM0LCe9+7QbEN6WEIm6pduSX5Q2kNiAeEKXpVIEYz7T4pcGF88LbxTAQ
 2x7LEVtpF7o00k9xpmAo6mJ6r0cKaNr9CHylmrklHALxj1SGjSEE56/I7On9iHDJXNd6
 iwjlgn7155azewwBHa8Uv1v/ez1u3uQtEhPRVqLFwsqhw/fysRhvA5Q0OhX9h8Y1ltha sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f58cqh5r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:00:18 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22V8gmUb031357;
 Thu, 31 Mar 2022 09:00:18 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f58cqh5q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:00:17 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22V8qR6j004989;
 Thu, 31 Mar 2022 09:00:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3f1tf90ryn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:00:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22V90CTh20185480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 09:00:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5F1AAE05A;
 Thu, 31 Mar 2022 09:00:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6702AE055;
 Thu, 31 Mar 2022 09:00:10 +0000 (GMT)
Received: from [9.43.21.51] (unknown [9.43.21.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 31 Mar 2022 09:00:10 +0000 (GMT)
Message-ID: <477e1960-ffd5-068b-1f87-cc1888d4394d@linux.ibm.com>
Date: Thu, 31 Mar 2022 14:30:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v3 PATCH 4/5] powerpc/crash hp: add crash hotplug support
 for kexec_file_load
Content-Language: en-US
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <20220321080422.56255-5-sourabhjain@linux.ibm.com>
 <b9cf2d6a-7fec-3ef3-0600-1b09ee7c1c37@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <b9cf2d6a-7fec-3ef3-0600-1b09ee7c1c37@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tkrAn_G4sHJVc60pgny2IsD9rgAfE2e4
X-Proofpoint-GUID: dbIrbrTEV2D-J2nrX93Fq5CNK5TR1ltM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_03,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310046
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
Cc: bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org,
 eric.devolder@oracle.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laurent,

On 25/03/22 23:33, Laurent Dufour wrote:
> On 21/03/2022, 09:04:21, Sourabh Jain wrote:
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
>>   arch/powerpc/kexec/core_64.c | 46 ++++++++++++++++++++++++++++++++++++
>>   arch/powerpc/kexec/elf_64.c  | 40 +++++++++++++++++++++++++++++++
>>   2 files changed, 86 insertions(+)
>>
>> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
>> index 249d2632526d..a470fe6904e3 100644
>> --- a/arch/powerpc/kexec/core_64.c
>> +++ b/arch/powerpc/kexec/core_64.c
>> @@ -466,6 +466,52 @@ int update_cpus_node(void *fdt)
>>   	return ret;
>>   }
>>   
>> +#ifdef CONFIG_CRASH_HOTPLUG
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
>> +void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
>> +				unsigned long a, unsigned long b)
>> +{
>> +	void *fdt;
>> +
>> +	/* No action needed for CPU hot-unplug */
>> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
>> +		return;
>> +
>> +	/* crash update on memory hotplug is not support yet */
>> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
>> +		pr_err("crash hp: crash update is not supported with memory hotplug\n");
> 		
> May be pr_info_once() that's not really an error ?


Ye not an error.

>
>> +		return;
>> +	}
>> +
>> +	/* Must have valid FDT index */
>> +	if (!image->arch.fdt_index_valid) {
>> +		pr_err("crash hp: unable to locate FDT segment");
>> +		return;
>> +	}
>> +
>> +	fdt = __va((void *)image->segment[image->arch.fdt_index].mem);
>> +
>> +	/* Temporarily invalidate the crash image while it is replaced */
>> +	xchg(&kexec_crash_image, NULL);
>> +
>> +	/* update FDT to refelect changes to CPU resrouces */
>> +	if (update_cpus_node(fdt))
>> +		pr_err("crash hp: failed to update crash FDT");
>> +
>> +	/* The crash image is now valid once again */
>> +	xchg(&kexec_crash_image, image);
>> +}
>> +#endif /* CONFIG_CRASH_HOTPLUG */
>> +
>>   #ifdef CONFIG_PPC_64S_HASH_MMU
>>   /* Values we need to export to the second kernel via the device tree. */
>>   static unsigned long htab_base;
>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>> index eeb258002d1e..2ffe6d69e186 100644
>> --- a/arch/powerpc/kexec/elf_64.c
>> +++ b/arch/powerpc/kexec/elf_64.c
>> @@ -24,6 +24,33 @@
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>>   
>> +
>> +#ifdef CONFIG_CRASH_HOTPLUG
>> +#define MAX_CORE 256
> Why not computing something based on nr_cpus_ids and threads_per_core instead?


Yes in the next version I will change this to nr_cpus.

>
>> +#define PER_CORE_NODE_SIZE 1500
> Is that size function of threadsd_per_core too?


It is per core basis. I noticed that the size of FDT get increased by
approx 1.5 KB after adding a core.

In next version this patch series, we will be computing FDT buffer
size needed of hotplug CPUs based on the existing core size.
While loading the kdump kernel we will go through all attributes
of the currently online CPU and use them to calculate the buffer
space needed for hotplug CPUs.

>> + *
>> + * Some assumption are made to calculate the additional buffer size needed
>> + * to accommodate future hot add CPUs to the crash FDT. The maximum core count
>> + * in the system would not go beyond MAX_CORE and memory needed to store per core
>> + * date in FDT is PER_CORE_NODE_SIZE.
>> + *
>> + * Certainly MAX_CORE count can be replaced with possible core count and
>> + * PER_CORE_NODE_SIZE to some standard value instead of randomly observed
>> + * core size value on Power9 LPAR.
> See above.
>
>> + */
>> +static unsigned int get_crash_fdt_mem_sz(void *fdt)
>> +{
>> +	return fdt_totalsize(fdt) + (PER_CORE_NODE_SIZE * MAX_CORE);
> I guess fdt_totalsize() is already taken in account the online CPUs, isn't it?
> If that's the case, you should add the remaining needed part only.

Agree, I will take of that in next series.


Thanks for the review.

- Sourabh Jain

