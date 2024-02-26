Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7831D866A08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 07:24:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oFjbnXi0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjrFC1bK2z3cCr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:24:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oFjbnXi0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjrDP5jldz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 17:24:05 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q5J04a003448;
	Mon, 26 Feb 2024 06:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+rzyNGbr1w+zjHDRi+zhuRA1LgQ+uQKMXd7YtZYrb5g=;
 b=oFjbnXi04z8v4dCWOJqunyidcEEbv9auDfKsfshXebfKYLzbDYOJ9JYC6L6SW6O/mQr0
 MYmywtwx8067CKU5OAY7zVx26jIH4Nt1HCWDM5MVacrdTTa+dt0ZqD/QA5HiyBC1nEOg
 edSyA6oai714/+Berj6ihgx9hgxPPMMj6u1SOpY/sjZUsUeaRIB335seVUzc4ILABaZE
 kPpjRTSZRktCm9+fQ3NOzqdT7Dds9bzrJCai1rgOkEWNdVjocYXCde8UqyoWD/ZoEb5j
 bXm2K/e0Ox+GHguaamHYtqCfoDopdN29B1zL4+hNgK7RwQ3aTIE2C9jyQ13/88p+Pkit Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wfp42r6mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:23:59 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41Q5oAuu005772;
	Mon, 26 Feb 2024 06:23:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wfp42r6mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:23:58 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q4NS1m008792;
	Mon, 26 Feb 2024 06:23:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftst7gtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:23:57 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41Q6Nq0E10355394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 06:23:54 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6A9520040;
	Mon, 26 Feb 2024 06:23:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 293AC2004D;
	Mon, 26 Feb 2024 06:23:49 +0000 (GMT)
Received: from [9.203.115.195] (unknown [9.203.115.195])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 06:23:48 +0000 (GMT)
Message-ID: <1893a74b-693e-4734-8029-795e68e57734@linux.ibm.com>
Date: Mon, 26 Feb 2024 11:53:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next 3/3] powerpc/kdump: Split KEXEC_CORE and
 CRASH_DUMP dependency
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Kexec-ml <kexec@lists.infradead.org>
References: <20240213113150.1148276-1-hbathini@linux.ibm.com>
 <20240213113150.1148276-4-hbathini@linux.ibm.com>
 <d6d42acb-6913-4c39-a21a-f91b05894fa6@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <d6d42acb-6913-4c39-a21a-f91b05894fa6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NQcU3e6qg9BKE-cNr9b_rWlOJGbG-l54
X-Proofpoint-ORIG-GUID: gjPtLLVrIQXb7eQnZyR-NrSVy0Fc-iz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_03,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402260046
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
Cc: Baoquan He <bhe@redhat.com>, lkml <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 23/02/24 1:05 pm, Sourabh Jain wrote:
> Hello Hari,

Hi Sourabh,

> 
> Build failure detected.

Thanks for trying out the patches.

> 
> On 13/02/24 17:01, Hari Bathini wrote:
>> Remove CONFIG_CRASH_DUMP dependency on CONFIG_KEXEC. CONFIG_KEXEC_CORE
>> was used at places where CONFIG_CRASH_DUMP or CONFIG_CRASH_RESERVE was
>> appropriate. Replace with appropriate #ifdefs to support CONFIG_KEXEC
>> and !CONFIG_CRASH_DUMP configuration option. Also, make CONFIG_FA_DUMP
>> dependent on CONFIG_CRASH_DUMP to avoid unmet dependencies for FA_DUMP
>> with !CONFIG_KEXEC_CORE configuration option.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig               |  9 +--
>>   arch/powerpc/include/asm/kexec.h   | 98 +++++++++++++++---------------
>>   arch/powerpc/kernel/prom.c         |  2 +-
>>   arch/powerpc/kernel/setup-common.c |  2 +-
>>   arch/powerpc/kernel/smp.c          |  4 +-
>>   arch/powerpc/kexec/Makefile        |  3 +-
>>   arch/powerpc/kexec/core.c          |  4 ++
>>   7 files changed, 60 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 5cf8ad8d7e8e..e377deefa2dc 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -607,11 +607,6 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
>>   config ARCH_SUPPORTS_KEXEC
>>       def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
>> -config ARCH_SELECTS_KEXEC
>> -    def_bool y
>> -    depends on KEXEC
>> -    select CRASH_DUMP
>> -
>>   config ARCH_SUPPORTS_KEXEC_FILE
>>       def_bool PPC64
>> @@ -622,7 +617,6 @@ config ARCH_SELECTS_KEXEC_FILE
>>       def_bool y
>>       depends on KEXEC_FILE
>>       select KEXEC_ELF
>> -    select CRASH_DUMP
>>       select HAVE_IMA_KEXEC if IMA
>>   config PPC64_BIG_ENDIAN_ELF_ABI_V2
>> @@ -694,8 +688,7 @@ config ARCH_SELECTS_CRASH_DUMP
>>   config FA_DUMP
>>       bool "Firmware-assisted dump"
>> -    depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
>> -    select CRASH_DUMP
>> +    depends on CRASH_DUMP && PPC64 && (PPC_RTAS || PPC_POWERNV)
>>       help
>>         A robust mechanism to get reliable kernel crash dump with
>>         assistance from firmware. This approach does not use kexec,
>> diff --git a/arch/powerpc/include/asm/kexec.h 
>> b/arch/powerpc/include/asm/kexec.h
>> index e1b43aa12175..fdb90e24dc74 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -55,59 +55,18 @@
>>   typedef void (*crash_shutdown_t)(void);
>>   #ifdef CONFIG_KEXEC_CORE
>> -
>> -/*
>> - * This function is responsible for capturing register states if coming
>> - * via panic or invoking dump using sysrq-trigger.
>> - */
>> -static inline void crash_setup_regs(struct pt_regs *newregs,
>> -                    struct pt_regs *oldregs)
>> -{
>> -    if (oldregs)
>> -        memcpy(newregs, oldregs, sizeof(*newregs));
>> -    else
>> -        ppc_save_regs(newregs);
>> -}
>> +struct kimage;
>> +struct pt_regs;
>>   extern void kexec_smp_wait(void);    /* get and clear naca physid, 
>> wait for
>>                         master to copy new code to 0 */
>> -extern int crashing_cpu;
>> -extern void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs 
>> *));
>> -extern void crash_ipi_callback(struct pt_regs *);
>> -extern int crash_wake_offline;
>> -
>> -struct kimage;
>> -struct pt_regs;
>>   extern void default_machine_kexec(struct kimage *image);
>> -extern void default_machine_crash_shutdown(struct pt_regs *regs);
>> -extern int crash_shutdown_register(crash_shutdown_t handler);
>> -extern int crash_shutdown_unregister(crash_shutdown_t handler);
>> -
>> -extern void crash_kexec_prepare(void);
>> -extern void crash_kexec_secondary(struct pt_regs *regs);
>> -int __init overlaps_crashkernel(unsigned long start, unsigned long 
>> size);
>> -extern void reserve_crashkernel(void);
>>   extern void machine_kexec_mask_interrupts(void);
>> -static inline bool kdump_in_progress(void)
>> -{
>> -    return crashing_cpu >= 0;
>> -}
>> -
>>   void relocate_new_kernel(unsigned long indirection_page, unsigned 
>> long reboot_code_buffer,
>>                unsigned long start_address) __noreturn;
>> -
>>   void kexec_copy_flush(struct kimage *image);
>> -#if defined(CONFIG_CRASH_DUMP)
>> -bool is_kdump_kernel(void);
>> -#define is_kdump_kernel            is_kdump_kernel
>> -#if defined(CONFIG_PPC_RTAS)
>> -void crash_free_reserved_phys_range(unsigned long begin, unsigned 
>> long end);
>> -#define crash_free_reserved_phys_range crash_free_reserved_phys_range
>> -#endif /* CONFIG_PPC_RTAS */
>> -#endif /* CONFIG_CRASH_DUMP */
>> -
>>   #ifdef CONFIG_KEXEC_FILE
>>   extern const struct kexec_file_ops kexec_elf64_ops;
>> @@ -152,15 +111,56 @@ int setup_new_fdt_ppc64(const struct kimage 
>> *image, void *fdt,
>>   #endif /* CONFIG_KEXEC_FILE */
>> -#else /* !CONFIG_KEXEC_CORE */
>> -static inline void crash_kexec_secondary(struct pt_regs *regs) { }
>> +#endif /* CONFIG_KEXEC_CORE */
>> +
>> +#ifdef CONFIG_CRASH_RESERVE
>> +int __init overlaps_crashkernel(unsigned long start, unsigned long 
>> size);
>> +extern void reserve_crashkernel(void);
>> +#else
>> +static inline void reserve_crashkernel(void) {}
>> +static inline int overlaps_crashkernel(unsigned long start, unsigned 
>> long size) { return 0; }
>> +#endif
>> -static inline int overlaps_crashkernel(unsigned long start, unsigned 
>> long size)
>> +#if defined(CONFIG_CRASH_DUMP)
>> +/*
>> + * This function is responsible for capturing register states if coming
>> + * via panic or invoking dump using sysrq-trigger.
>> + */
>> +static inline void crash_setup_regs(struct pt_regs *newregs,
>> +                    struct pt_regs *oldregs)
>>   {
>> -    return 0;
>> +    if (oldregs)
>> +        memcpy(newregs, oldregs, sizeof(*newregs));
>> +    else
>> +        ppc_save_regs(newregs);
>> +}
>> +
>> +extern int crashing_cpu;
>> +extern void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs 
>> *));
>> +extern void crash_ipi_callback(struct pt_regs *regs);
>> +extern int crash_wake_offline;
>> +
>> +extern int crash_shutdown_register(crash_shutdown_t handler);
>> +extern int crash_shutdown_unregister(crash_shutdown_t handler);
>> +extern void default_machine_crash_shutdown(struct pt_regs *regs);
>> +
>> +extern void crash_kexec_prepare(void);
>> +extern void crash_kexec_secondary(struct pt_regs *regs);
>> +
>> +static inline bool kdump_in_progress(void)
>> +{
>> +    return crashing_cpu >= 0;
>>   }
>> -static inline void reserve_crashkernel(void) { ; }
>> +bool is_kdump_kernel(void);
>> +#define is_kdump_kernel            is_kdump_kernel
>> +#if defined(CONFIG_PPC_RTAS)
>> +void crash_free_reserved_phys_range(unsigned long begin, unsigned 
>> long end);
>> +#define crash_free_reserved_phys_range crash_free_reserved_phys_range
>> +#endif /* CONFIG_PPC_RTAS */
>> +
>> +#else /* !CONFIG_CRASH_DUMP */
>> +static inline void crash_kexec_secondary(struct pt_regs *regs) { }
>>   static inline int crash_shutdown_register(crash_shutdown_t handler)
>>   {
>> @@ -183,7 +183,7 @@ static inline void crash_send_ipi(void 
>> (*crash_ipi_callback)(struct pt_regs *))
>>   {
>>   }
>> -#endif /* CONFIG_KEXEC_CORE */
>> +#endif /* CONFIG_CRASH_DUMP */
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   #include <asm/book3s/64/kexec.h>
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index 0b5878c3125b..1edc34b711ba 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -453,7 +453,7 @@ static int __init 
>> early_init_dt_scan_chosen_ppc(unsigned long node,
>>           tce_alloc_end = *lprop;
>>   #endif
>> -#ifdef CONFIG_KEXEC_CORE
>> +#ifdef CONFIG_CRASH_RESERVE
>>       lprop = of_get_flat_dt_prop(node, "linux,crashkernel-base", NULL);
>>       if (lprop)
>>           crashk_res.start = *lprop;
>> diff --git a/arch/powerpc/kernel/setup-common.c 
>> b/arch/powerpc/kernel/setup-common.c
>> index 733f210ffda1..35cac3eaaf75 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -109,7 +109,7 @@ int ppc_do_canonicalize_irqs;
>>   EXPORT_SYMBOL(ppc_do_canonicalize_irqs);
>>   #endif
>> -#ifdef CONFIG_VMCORE_INFO
>> +#ifdef CONFIG_CRASH_DUMP
>>   /* This keeps a track of which one is the crashing cpu. */
>>   int crashing_cpu = -1;
>>   #endif
>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>> index 693334c20d07..aa81c95c73a4 100644
>> --- a/arch/powerpc/kernel/smp.c
>> +++ b/arch/powerpc/kernel/smp.c
>> @@ -588,7 +588,7 @@ void smp_send_debugger_break(void)
>>   }
>>   #endif
>> -#ifdef CONFIG_KEXEC_CORE
>> +#ifdef CONFIG_CRASH_DUMP
>>   void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
>>   {
>>       int cpu;
>> @@ -631,7 +631,7 @@ void crash_smp_send_stop(void)
>>       stopped = true;
>> -#ifdef CONFIG_KEXEC_CORE
>> +#ifdef CONFIG_CRASH_DUMP
>>       if (kexec_crash_image) {
>>           crash_kexec_prepare();
>>           return;
>> diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
>> index 91e96f5168b7..8e469c4da3f8 100644
>> --- a/arch/powerpc/kexec/Makefile
>> +++ b/arch/powerpc/kexec/Makefile
>> @@ -3,12 +3,13 @@
>>   # Makefile for the linux kernel.
>>   #
>> -obj-y                += core.o crash.o core_$(BITS).o
>> +obj-y                += core.o core_$(BITS).o
>>   obj-$(CONFIG_PPC32)        += relocate_32.o
>>   obj-$(CONFIG_KEXEC_FILE)    += file_load.o ranges.o 
>> file_load_$(BITS).o elf_$(BITS).o
>>   obj-$(CONFIG_VMCORE_INFO)    += vmcore_info.o
>> +obj-$(CONFIG_CRASH_DUMP)    += crash.o
> 
> 
> Observed a build failure with this patch.
> 
> arch/powerpc/platforms/powernv/smp.c: In function ‘pnv_smp_init’:
> arch/powerpc/platforms/powernv/smp.c:438:2: error: ‘crash_wake_offline’ 
> undeclared (first use in this function); did you mean ‘cpu_is_offline’?
>    crash_wake_offline = 1;
>    ^~~~~~~~~~~~~~~~~~
>    cpu_is_offline
> arch/powerpc/platforms/powernv/smp.c:438:2: note: each undeclared 
> identifier is reported only once for each function it appears in
> make[5]: *** [scripts/Makefile.build:244: 
> arch/powerpc/platforms/powernv/smp.o] Error 1
> 
> CONFIG:
> 
> CONFIG_KEXEC=y
> CONFIG_KEXEC_FILE=y
> # CONFIG_CRASH_DUMP is not set
> 
> Below changes fixes the above issue:
> 
> diff --git a/arch/powerpc/platforms/powernv/smp.c 
> b/arch/powerpc/platforms/powernv/smp.c
> index 9e1a25398f98..8f14f0581a21 100644
> --- a/arch/powerpc/platforms/powernv/smp.c
> +++ b/arch/powerpc/platforms/powernv/smp.c
> @@ -434,7 +434,7 @@ void __init pnv_smp_init(void)
>          smp_ops = &pnv_smp_ops;
> 
>   #ifdef CONFIG_HOTPLUG_CPU
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_CRASH_DUMP
>          crash_wake_offline = 1;
>   #endif
>   #endif

Right. Missed testing with CONFIG_PPC_POWERNV.
Will post v2.

Thanks
Hari
