Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EAC851660
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:03:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2nb50/V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYR574VG6z3dVr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 01:03:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2nb50/V;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYR4M0F95z3c2b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:02:59 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TYR4M014Yz4wcY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:02:59 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TYR4L74Dwz4wqM; Tue, 13 Feb 2024 01:02:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2nb50/V;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TYR4L4bK9z4wcY
	for <linuxppc-dev@ozlabs.org>; Tue, 13 Feb 2024 01:02:58 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41CDlrSb016026;
	Mon, 12 Feb 2024 14:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WDFquMZdyteP9vub8u38wzLlo4C4RMyX7VZRrXelmCE=;
 b=M2nb50/VG9NaGKT8fxuB8OdtOgx+paxjd/lesiwRDo7c/YOXHuVIpyHoCrZk6Mt17xXY
 7Epc/Cg75LADoY+0N/9TeKPFMa/8ci97MYCE4idFdnhHUEYOcZJP1l4sf0IHV5rCHOvn
 KLqJl73veS6V5S1Vg8MunXTap+jm/cEHOpUtXomT+oDYYRgcCKPzd87z385VDVKyuibR
 9ZlTSXvvoN4VTQMNvQtQ56i0zbwG2ipdrA5gNQhtZxjuRjr06VNInTRuS0FBklNkyTKx
 RBzIsN7UNkjNIMxXFK8YRCTDj9/yzWOn6WcMqwo6Gz0uFmC5ovHcZ+V/qDjFgsaiVZm6 aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w7mhf8csp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 14:01:29 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41CDmcC7018847;
	Mon, 12 Feb 2024 14:01:28 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w7mhf8cny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 14:01:28 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41CC3uEb009920;
	Mon, 12 Feb 2024 13:57:24 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p62gdd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 13:57:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41CDvJYq10552032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 13:57:21 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F54C20043;
	Mon, 12 Feb 2024 13:57:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94CB220040;
	Mon, 12 Feb 2024 13:57:05 +0000 (GMT)
Received: from [9.61.8.5] (unknown [9.61.8.5])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Feb 2024 13:57:05 +0000 (GMT)
Message-ID: <cc02538f-9460-4cbb-9ae4-194412b85e36@linux.ibm.com>
Date: Mon, 12 Feb 2024 19:27:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/5] crash: add a new kexec flag for hotplug support
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
 <20240111105138.251366-3-sourabhjain@linux.ibm.com>
 <ZcBRle7szFrD3cW+@MiWiFi-R3L-srv>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZcBRle7szFrD3cW+@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pEj1g4C062_8_BcoLlEZGUs5DCIJk-cd
X-Proofpoint-GUID: eipVXqe8RoyqcOnrvMu35-_kwziOE1Z0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_10,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402120106
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

On 05/02/24 08:40, Baoquan He wrote:
> Hi Sourabh,
>
> Thanks for the great work. There are some concerns, please see inline
> comments.

Thank you :)

>
> On 01/11/24 at 04:21pm, Sourabh Jain wrote:
> ......
>> Now, if the kexec tool sends KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag to
>> the kernel, it indicates to the kernel that all the required kexec
>> segment is skipped from SHA calculation and it is safe to update kdump
>> image loaded using the kexec_load syscall.
> So finally you add a new KEXEC_CRASH_HOTPLUG_SUPPORT flag, that's fine.
>
> ......
>> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
>> index 9bb6607e864e..e791129fdf6c 100644
>> --- a/arch/x86/include/asm/kexec.h
>> +++ b/arch/x86/include/asm/kexec.h
>> @@ -211,6 +211,9 @@ extern void kdump_nmi_shootdown_cpus(void);
>>   void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>>   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>>   
>> +int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
>> +#define arch_crash_hotplug_support arch_crash_hotplug_support
>> +
>>   #ifdef CONFIG_HOTPLUG_CPU
>>   int arch_crash_hotplug_cpu_support(void);
>>   #define crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
> Then crash_hotplug_cpu_support is not needed any more on x86_64, and
> crash_hotplug_memory_support(), if you remove their implementation in
> arch/x86/kernel/crash.c, won't it cause building warning or error on x86?

Yeah, crash_hotplug_cpu_support and crash_hotplug_memory_support are
no longer required. My bad, I forgot to remove them.

>> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
>> index 44744e9c68ec..293b54bff706 100644
>> --- a/arch/x86/kernel/crash.c
>> +++ b/arch/x86/kernel/crash.c
>> @@ -398,20 +398,16 @@ int crash_load_segments(struct kimage *image)
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "crash hp: " fmt
>>   
>> -/* These functions provide the value for the sysfs crash_hotplug nodes */
>> -#ifdef CONFIG_HOTPLUG_CPU
>> -int arch_crash_hotplug_cpu_support(void)
>> +int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
>>   {
>> -	return crash_check_update_elfcorehdr();
>> -}
>> -#endif
>>   
>> -#ifdef CONFIG_MEMORY_HOTPLUG
>> -int arch_crash_hotplug_memory_support(void)
>> -{
>> -	return crash_check_update_elfcorehdr();
>> -}
>> +#ifdef CONFIG_KEXEC_FILE
>> +	if (image->file_mode)
>> +		return 1;
>>   #endif
>> +	return (kexec_flags & KEXEC_UPDATE_ELFCOREHDR ||
>> +		kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT);
> Do we need add some document to tell why there are two kexec flags on
> x86_64, except of checking this patch log?

Sure I will add a comment about it.

>
>> +}
>>   
>>   unsigned int arch_crash_get_elfcorehdr_size(void)
>>   {
>> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
>> index 548491de818e..2f411ddfbd8b 100644
>> --- a/drivers/base/cpu.c
>> +++ b/drivers/base/cpu.c
>> @@ -306,7 +306,7 @@ static ssize_t crash_hotplug_show(struct device *dev,
>>   				     struct device_attribute *attr,
>>   				     char *buf)
>>   {
>> -	return sysfs_emit(buf, "%d\n", crash_hotplug_cpu_support());
>> +	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
>>   }
>>   static DEVICE_ATTR_ADMIN_RO(crash_hotplug);
>>   #endif
>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>> index 8a13babd826c..e70ab1d3428e 100644
>> --- a/drivers/base/memory.c
>> +++ b/drivers/base/memory.c
>> @@ -514,7 +514,7 @@ static DEVICE_ATTR_RW(auto_online_blocks);
>>   static ssize_t crash_hotplug_show(struct device *dev,
>>   				       struct device_attribute *attr, char *buf)
>>   {
>> -	return sysfs_emit(buf, "%d\n", crash_hotplug_memory_support());
>> +	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
>>   }
>>   static DEVICE_ATTR_RO(crash_hotplug);
>>   #endif
>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>> index 802052d9c64b..7880d74dc5c4 100644
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -317,8 +317,8 @@ struct kimage {
>>   	/* If set, we are using file mode kexec syscall */
>>   	unsigned int file_mode:1;
>>   #ifdef CONFIG_CRASH_HOTPLUG
>> -	/* If set, allow changes to elfcorehdr of kexec_load'd image */
>> -	unsigned int update_elfcorehdr:1;
>> +	/* If set, allow changes to kexec segments of kexec_load'd image */
> The code comment doesn't reflect the usage of the flag.
I should have updated the comment to indicate that this flag is for both 
system calls.
More comments below.

> You set it too
> when it's kexec_file_load. Speaking of this, I do wonder why you need
> set it too for kexec_file_load,
If we do this one can just access image->hotplug_support to find hotplug
support for currently loaded kdump image without bothering about which
system call was used to load the kdump image.

> and why we have
> arch_crash_hotplug_support(), then crash_check_hotplug_support() both of
> which have the same effect.

arch_crash_hotplug_support(): This function processes the kexec flags 
and finds the
hotplug support for the kdump image. Based on the return value of this 
function,
the image->hotplug_support attribute is set.

Now, once the kdump image is loaded, we no longer have access to the 
kexec flags.
Therefore, crash_check_hotplug_support simply returns the value of 
image->hotplug_support
when user space accesses the following sysfs files: 
/sys/devices/system/[cpu|memory]/crash_hotplug.

To keep things simple, I have introduced two functions: One function 
processes the kexec flags
and determines the hotplug support for the image being loaded. And other 
function simply
accesses image->hotplug_support and advertises CPU/Memory hotplug 
support to userspace.

Let me know you opinion.

Thanks for reviewing the patch.

- Sourabh Jain
>
>> +	unsigned int hotplug_support:1;
>>   #endif
>>   
>>   #ifdef ARCH_HAS_KIMAGE_ARCH
>> @@ -396,9 +396,10 @@ bool kexec_load_permitted(int kexec_image_type);
>>   
>>   /* List of defined/legal kexec flags */
>>   #ifndef CONFIG_KEXEC_JUMP
>> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
>> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_CRASH_HOTPLUG_SUPPORT)
>>   #else
>> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
>> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
>> +			KEXEC_CRASH_HOTPLUG_SUPPORT)
>>   #endif
>>   
>>   /* List of defined/legal kexec file flags */
>> @@ -486,14 +487,18 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
>>   static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>>   #endif
>>   
>> -int crash_check_update_elfcorehdr(void);
>> +int crash_check_hotplug_support(void);
>>   
>> -#ifndef crash_hotplug_cpu_support
>> -static inline int crash_hotplug_cpu_support(void) { return 0; }
>> -#endif
>> +#ifndef arch_crash_hotplug_support
>> +static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
>> +{
>>   
>> -#ifndef crash_hotplug_memory_support
>> -static inline int crash_hotplug_memory_support(void) { return 0; }
>> +#ifdef CONFIG_KEXEC_FILE
>> +	if (image->file_mode)
>> +		return 1;
>> +#endif
>> +	return kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT;
>> +}
>>   #endif
>>   
>>   #ifndef crash_get_elfcorehdr_size
>> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
>> index c17bb096ea68..5ae1741ea8ea 100644
>> --- a/include/uapi/linux/kexec.h
>> +++ b/include/uapi/linux/kexec.h
>> @@ -13,6 +13,7 @@
>>   #define KEXEC_ON_CRASH		0x00000001
>>   #define KEXEC_PRESERVE_CONTEXT	0x00000002
>>   #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
>> +#define KEXEC_CRASH_HOTPLUG_SUPPORT 0x00000008
>>   #define KEXEC_ARCH_MASK		0xffff0000
>>   
>>   /*
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index ab1c8e79759d..111548ad03e9 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -876,7 +876,7 @@ DEFINE_MUTEX(__crash_hotplug_lock);
>>    * It reflects the kernel's ability/permission to update the crash
>>    * elfcorehdr directly.
>>    */
>> -int crash_check_update_elfcorehdr(void)
>> +int crash_check_hotplug_support(void)
>>   {
>>   	int rc = 0;
>>   
>> @@ -888,10 +888,7 @@ int crash_check_update_elfcorehdr(void)
>>   		return 0;
>>   	}
>>   	if (kexec_crash_image) {
>> -		if (kexec_crash_image->file_mode)
>> -			rc = 1;
>> -		else
>> -			rc = kexec_crash_image->update_elfcorehdr;
>> +		rc = kexec_crash_image->hotplug_support;
>>   	}
>>   	/* Release lock now that update complete */
>>   	kexec_unlock();
>> @@ -932,8 +929,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>>   
>>   	image = kexec_crash_image;
>>   
>> -	/* Check that updating elfcorehdr is permitted */
>> -	if (!(image->file_mode || image->update_elfcorehdr))
>> +	/* Check that kexec segments update is permitted */
>> +	if (!image->hotplug_support)
>>   		goto out;
>>   
>>   	if (hp_action == KEXEC_CRASH_HP_ADD_CPU ||
>> diff --git a/kernel/kexec.c b/kernel/kexec.c
>> index 8f35a5a42af8..9dc5b7ed5b73 100644
>> --- a/kernel/kexec.c
>> +++ b/kernel/kexec.c
>> @@ -130,8 +130,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>>   		image->preserve_context = 1;
>>   
>>   #ifdef CONFIG_CRASH_HOTPLUG
>> -	if (flags & KEXEC_UPDATE_ELFCOREHDR)
>> -		image->update_elfcorehdr = 1;
>> +	if ((flags & KEXEC_ON_CRASH) && arch_crash_hotplug_support(image, flags))
>> +		image->hotplug_support = 1;
>>   #endif
>>   
>>   	ret = machine_kexec_prepare(image);
>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>> index bef2f6f2571b..4dddf9264a69 100644
>> --- a/kernel/kexec_file.c
>> +++ b/kernel/kexec_file.c
>> @@ -373,6 +373,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
>>   	if (ret)
>>   		goto out;
>>   
>> +#ifdef CONFIG_CRASH_HOTPLUG
>> +	if ((flags & KEXEC_FILE_ON_CRASH) && arch_crash_hotplug_support(image, flags))
>> +		image->hotplug_support = 1;
>> +#endif
>> +
>>   	ret = machine_kexec_prepare(image);
>>   	if (ret)
>>   		goto out;
>> -- 
>> 2.41.0
>>

