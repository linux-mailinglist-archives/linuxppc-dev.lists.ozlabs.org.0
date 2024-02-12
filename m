Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8088512CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 12:59:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJ6omRxg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYNKt1D9Yz2xWJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 22:59:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJ6omRxg;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYNK7156Dz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 22:58:51 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TYNK31qr9z4wc6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 22:58:47 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TYNK31XDVz4wd0; Mon, 12 Feb 2024 22:58:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJ6omRxg;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TYNK24c0wz4wc6
	for <linuxppc-dev@ozlabs.org>; Mon, 12 Feb 2024 22:58:46 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41CBuMsg027069;
	Mon, 12 Feb 2024 11:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fjgm4EVcv42uFuuYVFwe4hjzuCWEw3kmWX6V7EkIpkM=;
 b=dJ6omRxgBKiAISLjTrCaoc40P6qRsGeAfveK+gLUIJNfaJOQQjDhJmWqdxUzFWwhCRbC
 dMYKGyhOVCjgeyQCbHaTgbe+qITmDhiypJiBKAHq50nJwRj+NAbvNMPWP/LM61aSJGEa
 OW7tgAOlETuFFeT3CME68mMieARW3S0fpYi2WNKXrNIAqLarbOLJg7369teojwfwSRL2
 rcINYxUadb5hC3/mAk+3w9rO3tRTE6s7arBvqfMyaiq+p7mEYpkEfUjkNJ+N5SW2xyXy
 KzPBgt4jcCbysiBrPFLbOQrfvggsVDhvP2WK7peNZS16PyRJwfCzNHZ0S9XC+LU2ZV2R gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w7jw8r2j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 11:58:09 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41CBuctl028176;
	Mon, 12 Feb 2024 11:58:08 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w7jw8r2fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 11:58:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41CBYXhF010063;
	Mon, 12 Feb 2024 11:58:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npkg0x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 11:58:07 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41CBw2bU2687620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 11:58:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FD9B20043;
	Mon, 12 Feb 2024 11:58:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08DC520040;
	Mon, 12 Feb 2024 11:57:51 +0000 (GMT)
Received: from [9.61.8.5] (unknown [9.61.8.5])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Feb 2024 11:57:50 +0000 (GMT)
Message-ID: <0bfaf88a-4ffc-4401-9673-ec4a125a04b9@linux.ibm.com>
Date: Mon, 12 Feb 2024 17:27:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/5] crash: forward memory_notify arg to arch crash
 hotplug handler
To: Baoquan He <bhe@redhat.com>
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
 <20240111105138.251366-2-sourabhjain@linux.ibm.com>
 <ZcBR8Q+/WL3luZnP@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZcBR8Q+/WL3luZnP@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OLYrLvp5aRXBuf99ow6AA4bwTs9giQSt
X-Proofpoint-ORIG-GUID: -nNR88___-ZZP6OuTmNrURUYx8etNA1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_09,2024-02-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 mlxscore=0 mlxlogscore=968 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402120091
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/02/24 08:41, Baoquan He wrote:
> On 01/11/24 at 04:21pm, Sourabh Jain wrote:
>> In the event of memory hotplug or online/offline events, the crash
>> memory hotplug notifier `crash_memhp_notifier()` receives a
>> `memory_notify` object but doesn't forward that object to the
>> generic and architecture-specific crash hotplug handler.
>>
>> The `memory_notify` object contains the starting PFN (Page Frame Number)
>> and the number of pages in the hot-removed memory. This information is
>> necessary for architectures like PowerPC to update/recreate the kdump
>> image, specifically `elfcorehdr`.
>>
>> So update the function signature of `crash_handle_hotplug_event()` and
>> `arch_crash_handle_hotplug_event()` to accept the `memory_notify` object
>> as an argument from crash memory hotplug notifier.
>>
>> Since no such object is available in the case of CPU hotplug event, the
>> crash CPU hotplug notifier `crash_cpuhp_online()` passes NULL to the
>> crash hotplug handler.
>>
> ......
>> ---
>>   arch/x86/include/asm/kexec.h |  2 +-
>>   arch/x86/kernel/crash.c      |  3 ++-
>>   include/linux/kexec.h        |  2 +-
>>   kernel/crash_core.c          | 14 +++++++-------
>>   4 files changed, 11 insertions(+), 10 deletions(-)
> LGTM,
>
> Acked-by: Baoquan He <bhe@redhat.com>

Thanks Baoquan He

- Sourabh

>
>> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
>> index c9f6a6c5de3c..9bb6607e864e 100644
>> --- a/arch/x86/include/asm/kexec.h
>> +++ b/arch/x86/include/asm/kexec.h
>> @@ -208,7 +208,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image);
>>   extern void kdump_nmi_shootdown_cpus(void);
>>   
>>   #ifdef CONFIG_CRASH_HOTPLUG
>> -void arch_crash_handle_hotplug_event(struct kimage *image);
>> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>>   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>>   
>>   #ifdef CONFIG_HOTPLUG_CPU
>> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
>> index b6b044356f1b..44744e9c68ec 100644
>> --- a/arch/x86/kernel/crash.c
>> +++ b/arch/x86/kernel/crash.c
>> @@ -428,10 +428,11 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
>>   /**
>>    * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
>>    * @image: a pointer to kexec_crash_image
>> + * @arg: struct memory_notify handler for memory hotplug case and NULL for CPU hotplug case.
>>    *
>>    * Prepare the new elfcorehdr and replace the existing elfcorehdr.
>>    */
>> -void arch_crash_handle_hotplug_event(struct kimage *image)
>> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>   {
>>   	void *elfbuf = NULL, *old_elfcorehdr;
>>   	unsigned long nr_mem_ranges;
>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>> index 400cb6c02176..802052d9c64b 100644
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -483,7 +483,7 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
>>   #endif
>>   
>>   #ifndef arch_crash_handle_hotplug_event
>> -static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
>> +static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>>   #endif
>>   
>>   int crash_check_update_elfcorehdr(void);
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index d48315667752..ab1c8e79759d 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -914,7 +914,7 @@ int crash_check_update_elfcorehdr(void)
>>    * list of segments it checks (since the elfcorehdr changes and thus
>>    * would require an update to purgatory itself to update the digest).
>>    */
>> -static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>> +static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>>   {
>>   	struct kimage *image;
>>   
>> @@ -976,7 +976,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>>   	image->hp_action = hp_action;
>>   
>>   	/* Now invoke arch-specific update handler */
>> -	arch_crash_handle_hotplug_event(image);
>> +	arch_crash_handle_hotplug_event(image, arg);
>>   
>>   	/* No longer handling a hotplug event */
>>   	image->hp_action = KEXEC_CRASH_HP_NONE;
>> @@ -992,17 +992,17 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>>   	crash_hotplug_unlock();
>>   }
>>   
>> -static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *v)
>> +static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *arg)
>>   {
>>   	switch (val) {
>>   	case MEM_ONLINE:
>>   		crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY,
>> -			KEXEC_CRASH_HP_INVALID_CPU);
>> +			KEXEC_CRASH_HP_INVALID_CPU, arg);
>>   		break;
>>   
>>   	case MEM_OFFLINE:
>>   		crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY,
>> -			KEXEC_CRASH_HP_INVALID_CPU);
>> +			KEXEC_CRASH_HP_INVALID_CPU, arg);
>>   		break;
>>   	}
>>   	return NOTIFY_OK;
>> @@ -1015,13 +1015,13 @@ static struct notifier_block crash_memhp_nb = {
>>   
>>   static int crash_cpuhp_online(unsigned int cpu)
>>   {
>> -	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu);
>> +	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu, NULL);
>>   	return 0;
>>   }
>>   
>>   static int crash_cpuhp_offline(unsigned int cpu)
>>   {
>> -	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu);
>> +	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu, NULL);
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.41.0
>>

