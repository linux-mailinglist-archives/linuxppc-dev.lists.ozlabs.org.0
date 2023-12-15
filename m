Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5654B81417F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 06:48:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lKTUBBTL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srytw6wwyz3dWD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 16:48:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lKTUBBTL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Srysm0PYnz3dK8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 16:47:24 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Srysl3HPBz4xKb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 16:47:23 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Srysl34r5z4xKl; Fri, 15 Dec 2023 16:47:23 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lKTUBBTL;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Srysl03XJz4xKb
	for <linuxppc-dev@ozlabs.org>; Fri, 15 Dec 2023 16:47:22 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF4Wivg013603;
	Fri, 15 Dec 2023 05:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=G8C4JCcUHSTTyPo3/q5F0LdFKK76tWUNMSiYqbvZEPc=;
 b=lKTUBBTLG3A3M6ioeWGeWDIqq7KwP9emioloBv+ec0smxDPO58Uw//XbEmw27rmOFVTp
 /DeEU+7MKeEEcWrbrVhZVtGvyxROWnQQqI4oL4nb6leROCOk6cwiZQlJMynWAvJWKUIR
 6cNYTEUfjc56ZKZk/PUDI4fbWZ/NY2iGjh2xtmcjbbihS6lXTKK3p4bAcgKcse7WldvV
 TkYHX97nyfPEzAFbwZTY8pllpDa7Q0/kWJKsEwC4CScQARhG7JcmrVgtcTjJZhzDDm+T
 QHo6Ym9YM3gx3zB2zWbsF/LA6mmqs/bOSgSXA8befSGUBNt/4r2isAAc/yUyEFCLN3ya 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v0fv1hjv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 05:46:43 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BF5aiSA004809;
	Fri, 15 Dec 2023 05:46:42 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v0fv1hjux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 05:46:42 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF33ApE005049;
	Fri, 15 Dec 2023 05:46:41 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw4skwkv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 05:46:41 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BF5kc4k44105986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Dec 2023 05:46:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 622D72004D;
	Fri, 15 Dec 2023 05:46:38 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21AED20040;
	Fri, 15 Dec 2023 05:46:33 +0000 (GMT)
Received: from [9.79.186.169] (unknown [9.79.186.169])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Dec 2023 05:46:32 +0000 (GMT)
Message-ID: <02622173-c9a1-425d-99b2-ba1dee802029@linux.ibm.com>
Date: Fri, 15 Dec 2023 11:16:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/6] crash: make CPU and Memory hotplug support
 reporting flexible
To: Baoquan He <bhe@redhat.com>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-3-sourabhjain@linux.ibm.com>
 <ZXsNjTT7Ax9blFIt@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZXsNjTT7Ax9blFIt@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uC2PU0LIbWEhLol4EIYDyboh6McGcCYg
X-Proofpoint-ORIG-GUID: HEhJn4GifKh9x3hTUEmTcC264YDfLPUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_02,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312150033
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Baoquan,

On 14/12/23 19:43, Baoquan He wrote:
> On 12/11/23 at 02:00pm, Sourabh Jain wrote:
>> Architectures' specific functions `arch_crash_hotplug_cpu_support()` and
>> `arch_crash_hotplug_memory_support()` advertise the kernel's capability
>> to update the kdump image on CPU and Memory hotplug events to userspace
>> via the sysfs interface. These architecture-specific functions need to
>> access various attributes of the `kexec_crash_image` object to determine
>> whether the kernel can update the kdump image and advertise this
>> information to userspace accordingly.
>>
>> As the architecture-specific code is not exposed to the APIs required to
>> acquire the lock for accessing the `kexec_crash_image` object, it calls
>> a generic function, `crash_check_update_elfcorehdr()`, to determine
>> whether the kernel can update the kdump image or not.
>>
>> The lack of access to the `kexec_crash_image` object in
>> architecture-specific code restricts architectures from performing
>> additional architecture-specific checks required to determine if the
>> kdump image is updatable or not. For instance, on PowerPC, the kernel
>> can update the kdump image only if both the elfcorehdr and FDT are
>> marked as updatable for the `kexec_load` system call.
>>
>> So define two generic functions, `crash_hotplug_cpu_support()` and
>> `crash_hotplug_memory_support()`, which are called when userspace
>> attempts to read the crash CPU and Memory hotplug support via the sysfs
>> interface. These functions take the necessary locks needed to access the
>> `kexec_crash_image` object and then forward it to the
>> architecture-specific handler to do the rest.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Cc: Akhil Raj <lf32.dev@gmail.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Cc: Baoquan He <bhe@redhat.com>
>> Cc: Borislav Petkov (AMD) <bp@alien8.de>
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: Dave Young <dyoung@redhat.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Eric DeVolder <eric.devolder@oracle.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Mimi Zohar <zohar@linux.ibm.com>
>> Cc: Naveen N Rao <naveen@kernel.org>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Valentin Schneider <vschneid@redhat.com>
>> Cc: Vivek Goyal <vgoyal@redhat.com>
>> Cc: kexec@lists.infradead.org
>> Cc: x86@kernel.org
>> ---
>>   arch/x86/include/asm/kexec.h |  8 ++++----
>>   arch/x86/kernel/crash.c      | 20 +++++++++++++++-----
>>   include/linux/kexec.h        | 13 +++++++------
>>   kernel/crash_core.c          | 23 +++++++++++++++++------
>>   4 files changed, 43 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
>> index 9bb6607e864e..5c88d27b086d 100644
>> --- a/arch/x86/include/asm/kexec.h
>> +++ b/arch/x86/include/asm/kexec.h
>> @@ -212,13 +212,13 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>>   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>>   
>>   #ifdef CONFIG_HOTPLUG_CPU
>> -int arch_crash_hotplug_cpu_support(void);
>> -#define crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
>> +int arch_crash_hotplug_cpu_support(struct kimage *image);
>> +#define arch_crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
>>   #endif
>>   
>>   #ifdef CONFIG_MEMORY_HOTPLUG
>> -int arch_crash_hotplug_memory_support(void);
>> -#define crash_hotplug_memory_support arch_crash_hotplug_memory_support
>> +int arch_crash_hotplug_memory_support(struct kimage *image);
>> +#define arch_crash_hotplug_memory_support arch_crash_hotplug_memory_support
>>   #endif
>>   
>>   unsigned int arch_crash_get_elfcorehdr_size(void);
>> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
>> index 0d7b2657beb6..ad5941665589 100644
>> --- a/arch/x86/kernel/crash.c
>> +++ b/arch/x86/kernel/crash.c
>> @@ -398,18 +398,28 @@ int crash_load_segments(struct kimage *image)
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "crash hp: " fmt
>>   
>> -/* These functions provide the value for the sysfs crash_hotplug nodes */
>> +#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_MEMORY_HOTPLUG)
>> +static int crash_hotplug_support(struct kimage *image)
>> +{
>> +	if (image->file_mode)
>> +		return 1;
>> +
>> +	return image->update_elfcorehdr;
>> +}
>> +#endif
>> +
>>   #ifdef CONFIG_HOTPLUG_CPU
>> -int arch_crash_hotplug_cpu_support(void)
>> +/* These functions provide the value for the sysfs crash_hotplug nodes */
>> +int arch_crash_hotplug_cpu_support(struct kimage *image)
>>   {
>> -	return crash_check_update_elfcorehdr();
>> +	return crash_hotplug_support(image);
>>   }
>>   #endif
>>   
>>   #ifdef CONFIG_MEMORY_HOTPLUG
>> -int arch_crash_hotplug_memory_support(void)
>> +int arch_crash_hotplug_memory_support(struct kimage *image)
>>   {
>> -	return crash_check_update_elfcorehdr();
>> +	return crash_hotplug_support(image);
>>   }
>>   #endif
>>   
>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>> index ee28c09a7fb0..0f6ea35879ee 100644
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -486,16 +486,17 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
>>   static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>>   #endif
>>   
>> -int crash_check_update_elfcorehdr(void);
>> -
>> -#ifndef crash_hotplug_cpu_support
>> -static inline int crash_hotplug_cpu_support(void) { return 0; }
>> +#ifndef arch_crash_hotplug_cpu_support
>> +static inline int arch_crash_hotplug_cpu_support(struct kimage *image) { return 0; }
>>   #endif
>>   
>> -#ifndef crash_hotplug_memory_support
>> -static inline int crash_hotplug_memory_support(void) { return 0; }
>> +#ifndef arch_crash_hotplug_memory_support
>> +static inline int arch_crash_hotplug_memory_support(struct kimage *image) { return 0; }
>>   #endif
>>   
>> +extern int crash_hotplug_cpu_support(void);
>> +extern int crash_hotplug_memory_support(void);
>> +
>>   #ifndef crash_get_elfcorehdr_size
>>   static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>>   #endif
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index b9190265fe52..b621f03c1104 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -892,12 +892,14 @@ DEFINE_MUTEX(__crash_hotplug_lock);
>>   #define crash_hotplug_lock() mutex_lock(&__crash_hotplug_lock)
>>   #define crash_hotplug_unlock() mutex_unlock(&__crash_hotplug_lock)
>>   
>> +#define CPU_HOTPLUG	0
>> +#define MEM_HOTPLUG	1
>>   /*
>>    * This routine utilized when the crash_hotplug sysfs node is read.
>>    * It reflects the kernel's ability/permission to update the crash
>>    * elfcorehdr directly.
>>    */
>> -int crash_check_update_elfcorehdr(void)
>> +static int crash_hotplug_support(int hotplug)
> Is it possible that we rename this function to different name? e.g
> crash_hotplug_check_support() or other name. We may easily mixing it up
> with the one of ARCH version. personal opinion

Sure I will rename the common function to crash_hotplug_check_support()
and arch-specific function to arch_crash_hotplug_check_support.

Thanks,
Sourabh

>
>>   {
>>   	int rc = 0;
>>   
>> @@ -909,18 +911,27 @@ int crash_check_update_elfcorehdr(void)
>>   		return 0;
>>   	}
>>   	if (kexec_crash_image) {
>> -		if (kexec_crash_image->file_mode)
>> -			rc = 1;
>> -		else
>> -			rc = kexec_crash_image->update_elfcorehdr;
>> +		if (hotplug == CPU_HOTPLUG)
>> +			rc = arch_crash_hotplug_cpu_support(kexec_crash_image);
>> +		else if (hotplug == MEM_HOTPLUG)
>> +			rc = arch_crash_hotplug_memory_support(kexec_crash_image);
>>   	}
>>   	/* Release lock now that update complete */
>>   	kexec_unlock();
>>   	crash_hotplug_unlock();
>> -
>>   	return rc;
>>   }
>>   
>> +int crash_hotplug_cpu_support(void)
>> +{
>> +	return crash_hotplug_support(CPU_HOTPLUG);
>> +}
>> +
>> +int crash_hotplug_memory_support(void)
>> +{
>> +	return crash_hotplug_support(MEM_HOTPLUG);
>> +}
>> +
>>   /*
>>    * To accurately reflect hot un/plug changes of cpu and memory resources
>>    * (including onling and offlining of those resources), the elfcorehdr
>> -- 
>> 2.41.0
>>

