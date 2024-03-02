Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 623F186F088
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 14:20:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ajRX89AY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tn5Cy06Qmz3vYb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 00:19:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ajRX89AY;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tn5BK4Qphz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 00:18:33 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tn5BF3l4Wz4wcQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 00:18:29 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Tn5BF3h5Lz4wcb; Sun,  3 Mar 2024 00:18:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ajRX89AY;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Tn5BF0kDdz4wcQ
	for <linuxppc-dev@ozlabs.org>; Sun,  3 Mar 2024 00:18:28 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 422ClaRr008588;
	Sat, 2 Mar 2024 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=9DLD6Glas6Y6HxLxZTXEVU07JFzQgpJYflIsJE0zmUE=;
 b=ajRX89AYCo1P+METAPO5SK4BTd8+GMsGABuFZnQDNF2CCCb7QQtpjATr4XQp7WxurBPy
 kAWaefSWSCnWG7bcYn6Xiv9WzWrC5svhaK3vOiaMdmhg+xy5f+AjMUaSlTjYfAYeQp+W
 ib+sVswggKjQBIZfokrDVhgaB8hqPs143fu3330vptfDMYGjd/1t7s6P4GrlzqP051ng
 OXxZtqT8XtK1x/VgKhh4UZPesgfvzaDsPwvOxqYm8ElY2/aiyI/6GJ40I9i6gyFrdUiL
 XR2NGvnCIpRVpo97wboeYYgNzPjKQdlY1ffvToyDXd9Kllk4YRK0Hvr4TKu418XmxD+L Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wm4e38f37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:17:48 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 422DEKxI008664;
	Sat, 2 Mar 2024 13:17:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wm4e38f2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:17:47 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 422D0Sjl012332;
	Sat, 2 Mar 2024 13:17:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfwg32dnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:17:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 422DHeYA52036072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Mar 2024 13:17:42 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE64B20043;
	Sat,  2 Mar 2024 13:17:40 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77CCC20040;
	Sat,  2 Mar 2024 13:17:34 +0000 (GMT)
Received: from [9.43.41.117] (unknown [9.43.41.117])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Mar 2024 13:17:34 +0000 (GMT)
Message-ID: <413699f9-89ad-4aed-b9cb-b12d23cf1999@linux.ibm.com>
Date: Sat, 2 Mar 2024 18:47:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v17 1/6] crash: forward memory_notify arg to arch crash
 hotplug handler
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EAu5Wl1jBIYGFGhqOvEGcj5r7zE9CjXd
X-Proofpoint-GUID: 0MdsIea0LD4D0GsWmmnzFchqEZmRyJa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-02_04,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403020115
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/02/24 2:11 pm, Sourabh Jain wrote:
> In the event of memory hotplug or online/offline events, the crash
> memory hotplug notifier `crash_memhp_notifier()` receives a
> `memory_notify` object but doesn't forward that object to the
> generic and architecture-specific crash hotplug handler.
> 
> The `memory_notify` object contains the starting PFN (Page Frame Number)
> and the number of pages in the hot-removed memory. This information is
> necessary for architectures like PowerPC to update/recreate the kdump
> image, specifically `elfcorehdr`.
> 
> So update the function signature of `crash_handle_hotplug_event()` and
> `arch_crash_handle_hotplug_event()` to accept the `memory_notify` object
> as an argument from crash memory hotplug notifier.
> 
> Since no such object is available in the case of CPU hotplug event, the
> crash CPU hotplug notifier `crash_cpuhp_online()` passes NULL to the
> crash hotplug handler.
> 

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> Cc: Akhil Raj <lf32.dev@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Borislav Petkov (AMD) <bp@alien8.de>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mimi Zohar <zohar@linux.ibm.com>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Vivek Goyal <vgoyal@redhat.com>
> Cc: kexec@lists.infradead.org
> Cc: x86@kernel.org
> ---
>   arch/x86/include/asm/kexec.h |  2 +-
>   arch/x86/kernel/crash.c      |  4 +++-
>   include/linux/crash_core.h   |  2 +-
>   kernel/crash_core.c          | 14 +++++++-------
>   4 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 91ca9a9ee3a2..cb1320ebbc23 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -207,7 +207,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image);
>   extern void kdump_nmi_shootdown_cpus(void);
>   
>   #ifdef CONFIG_CRASH_HOTPLUG
> -void arch_crash_handle_hotplug_event(struct kimage *image);
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>   
>   #ifdef CONFIG_HOTPLUG_CPU
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index e74d0c4286c1..2a682fe86352 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -432,10 +432,12 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
>   /**
>    * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
>    * @image: a pointer to kexec_crash_image
> + * @arg: struct memory_notify handler for memory hotplug case and
> + *       NULL for CPU hotplug case.
>    *
>    * Prepare the new elfcorehdr and replace the existing elfcorehdr.
>    */
> -void arch_crash_handle_hotplug_event(struct kimage *image)
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>   {
>   	void *elfbuf = NULL, *old_elfcorehdr;
>   	unsigned long nr_mem_ranges;
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index d33352c2e386..647e928efee8 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -37,7 +37,7 @@ static inline void arch_kexec_unprotect_crashkres(void) { }
>   
>   
>   #ifndef arch_crash_handle_hotplug_event
> -static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
> +static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>   #endif
>   
>   int crash_check_update_elfcorehdr(void);
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 78b5dc7cee3a..70fa8111a9d6 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -534,7 +534,7 @@ int crash_check_update_elfcorehdr(void)
>    * list of segments it checks (since the elfcorehdr changes and thus
>    * would require an update to purgatory itself to update the digest).
>    */
> -static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
> +static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>   {
>   	struct kimage *image;
>   
> @@ -596,7 +596,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>   	image->hp_action = hp_action;
>   
>   	/* Now invoke arch-specific update handler */
> -	arch_crash_handle_hotplug_event(image);
> +	arch_crash_handle_hotplug_event(image, arg);
>   
>   	/* No longer handling a hotplug event */
>   	image->hp_action = KEXEC_CRASH_HP_NONE;
> @@ -612,17 +612,17 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>   	crash_hotplug_unlock();
>   }
>   
> -static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *v)
> +static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *arg)
>   {
>   	switch (val) {
>   	case MEM_ONLINE:
>   		crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY,
> -			KEXEC_CRASH_HP_INVALID_CPU);
> +			KEXEC_CRASH_HP_INVALID_CPU, arg);
>   		break;
>   
>   	case MEM_OFFLINE:
>   		crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY,
> -			KEXEC_CRASH_HP_INVALID_CPU);
> +			KEXEC_CRASH_HP_INVALID_CPU, arg);
>   		break;
>   	}
>   	return NOTIFY_OK;
> @@ -635,13 +635,13 @@ static struct notifier_block crash_memhp_nb = {
>   
>   static int crash_cpuhp_online(unsigned int cpu)
>   {
> -	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu);
> +	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu, NULL);
>   	return 0;
>   }
>   
>   static int crash_cpuhp_offline(unsigned int cpu)
>   {
> -	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu);
> +	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu, NULL);
>   	return 0;
>   }
>   
