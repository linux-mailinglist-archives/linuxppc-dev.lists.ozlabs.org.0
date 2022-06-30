Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C36561296
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 08:38:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYTDD0HcPz3dpw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 16:38:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gc6Bq64e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gc6Bq64e;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYTCS3zMBz3blx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 16:37:23 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U63xEX004592;
	Thu, 30 Jun 2022 06:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2WCDOWDXCp//EBGvUfQtvI9crqq9yoOKWQpPiCysCA0=;
 b=Gc6Bq64eA/6myHs8Cy/ItIwCb4BMf0AN1MIrJH85hTHB9i+buxWk73IhZ1bq6U80nVyT
 zZOWdAoUII6Ah6DBVbzlewqoWcqAY1TYqDJIOhC2ZYn7PEnn7vVBZ6OYUHc3WJFKqfxS
 /esJxicy8UUQl6BoSgVkvGGDnauYjqdicBUVc+LUREsEZiMQ+fMAAycUR695bfPwwdnr
 eBVTopzF4sK2RgI9Ad73d4oNIyd0LKJrMMfTj7F+1EGdxc3TM1OGrVHYXL/vP0vXmMgc
 Y2H3utCtJ+S762Nb0Lz+YelhqN3KP/Hjz0VS+2t9a5cpeW81HxzcaYGFr83jR7HQ3tSp Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1681rwud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 06:37:16 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25U6UUJY025778;
	Thu, 30 Jun 2022 06:37:16 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1681rwtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 06:37:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25U6ZDZY004343;
	Thu, 30 Jun 2022 06:37:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3gwt08yk25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 06:37:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25U6bBfN22479272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 06:37:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24B9C11C052;
	Thu, 30 Jun 2022 06:37:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C483311C04C;
	Thu, 30 Jun 2022 06:37:08 +0000 (GMT)
Received: from [9.211.95.189] (unknown [9.211.95.189])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jun 2022 06:37:08 +0000 (GMT)
Message-ID: <3f02b679-89e5-7a34-a6df-b9348decde68@linux.ibm.com>
Date: Thu, 30 Jun 2022 12:07:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] powerpc/crash: save cpu register data in
 crash_smp_send_stop()
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20220630053023.181991-1-hbathini@linux.ibm.com>
In-Reply-To: <20220630053023.181991-1-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 41F-TdpNJDyeFQEmTsLXIYBWAkWAVAZt
X-Proofpoint-GUID: rSeUYRuebPWKvL2UT9FjBt-0o_t226pS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_03,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300023
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Please ignore this thread. Will resend with v2 tag..

On 30/06/22 11:00 am, Hari Bathini wrote:
> During kdump, two set of NMI IPIs are sent to secondary CPUs, if
> 'crash_kexec_post_notifiers' option is set. The first set of NMI IPIs
> to stop the CPUs and the other set to collect register data. Instead,
> capture register data for secondary CPUs while stopping them itself.
> Also, fallback to smp_send_stop() in case the function gets called
> without kdump configured.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/kexec.h |  1 +
>   arch/powerpc/kernel/smp.c        | 29 ++++--------
>   arch/powerpc/kexec/crash.c       | 77 +++++++++++++++++++-------------
>   3 files changed, 57 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 2aefe14e1442..cce69101205e 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -83,6 +83,7 @@ extern void default_machine_crash_shutdown(struct pt_regs *regs);
>   extern int crash_shutdown_register(crash_shutdown_t handler);
>   extern int crash_shutdown_unregister(crash_shutdown_t handler);
>   
> +extern void crash_kexec_prepare(void);
>   extern void crash_kexec_secondary(struct pt_regs *regs);
>   int __init overlaps_crashkernel(unsigned long start, unsigned long size);
>   extern void reserve_crashkernel(void);
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index bcefab484ea6..6b850c157a62 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -35,6 +35,7 @@
>   #include <linux/stackprotector.h>
>   #include <linux/pgtable.h>
>   #include <linux/clockchips.h>
> +#include <linux/kexec.h>
>   
>   #include <asm/ptrace.h>
>   #include <linux/atomic.h>
> @@ -55,7 +56,6 @@
>   #endif
>   #include <asm/vdso.h>
>   #include <asm/debug.h>
> -#include <asm/kexec.h>
>   #include <asm/cpu_has_feature.h>
>   #include <asm/ftrace.h>
>   #include <asm/kup.h>
> @@ -619,20 +619,6 @@ void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
>   }
>   #endif
>   
> -#ifdef CONFIG_NMI_IPI
> -static void crash_stop_this_cpu(struct pt_regs *regs)
> -#else
> -static void crash_stop_this_cpu(void *dummy)
> -#endif
> -{
> -	/*
> -	 * Just busy wait here and avoid marking CPU as offline to ensure
> -	 * register data is captured appropriately.
> -	 */
> -	while (1)
> -		cpu_relax();
> -}
> -
>   void crash_smp_send_stop(void)
>   {
>   	static bool stopped = false;
> @@ -651,11 +637,14 @@ void crash_smp_send_stop(void)
>   
>   	stopped = true;
>   
> -#ifdef CONFIG_NMI_IPI
> -	smp_send_nmi_ipi(NMI_IPI_ALL_OTHERS, crash_stop_this_cpu, 1000000);
> -#else
> -	smp_call_function(crash_stop_this_cpu, NULL, 0);
> -#endif /* CONFIG_NMI_IPI */
> +#ifdef CONFIG_KEXEC_CORE
> +	if (kexec_crash_image) {
> +		crash_kexec_prepare();
> +		return;
> +	}
> +#endif
> +
> +	smp_send_stop();
>   }
>   
>   #ifdef CONFIG_NMI_IPI
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index 80f54723cf6d..252724ed666a 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -40,6 +40,14 @@
>   #define REAL_MODE_TIMEOUT	10000
>   
>   static int time_to_dump;
> +
> +/*
> + * In case of system reset, secondary CPUs enter crash_kexec_secondary with out
> + * having to send an IPI explicitly. So, indicate if the crash is via
> + * system reset to avoid sending another IPI.
> + */
> +static int is_via_system_reset;
> +
>   /*
>    * crash_wake_offline should be set to 1 by platforms that intend to wake
>    * up offline cpus prior to jumping to a kdump kernel. Currently powernv
> @@ -101,7 +109,7 @@ void crash_ipi_callback(struct pt_regs *regs)
>   	/* NOTREACHED */
>   }
>   
> -static void crash_kexec_prepare_cpus(int cpu)
> +static void crash_kexec_prepare_cpus(void)
>   {
>   	unsigned int msecs;
>   	volatile unsigned int ncpus = num_online_cpus() - 1;/* Excluding the panic cpu */
> @@ -113,7 +121,15 @@ static void crash_kexec_prepare_cpus(int cpu)
>   	if (crash_wake_offline)
>   		ncpus = num_present_cpus() - 1;
>   
> -	crash_send_ipi(crash_ipi_callback);
> +	/*
> +	 * If we came in via system reset, secondaries enter via crash_kexec_secondary().
> +	 * So, wait a while for the secondary CPUs to enter for that case.
> +	 * Else, send IPI to all other CPUs.
> +	 */
> +	if (is_via_system_reset)
> +		mdelay(PRIMARY_TIMEOUT);
> +	else
> +		crash_send_ipi(crash_ipi_callback);
>   	smp_wmb();
>   
>   again:
> @@ -202,7 +218,7 @@ void crash_kexec_secondary(struct pt_regs *regs)
>   
>   #else	/* ! CONFIG_SMP */
>   
> -static void crash_kexec_prepare_cpus(int cpu)
> +static void crash_kexec_prepare_cpus(void)
>   {
>   	/*
>   	 * move the secondaries to us so that we can copy
> @@ -248,6 +264,32 @@ noinstr static void __maybe_unused crash_kexec_wait_realmode(int cpu)
>   static inline void crash_kexec_wait_realmode(int cpu) {}
>   #endif	/* CONFIG_SMP && CONFIG_PPC64 */
>   
> +void crash_kexec_prepare(void)
> +{
> +	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
> +	printk_deferred_enter();
> +
> +	/*
> +	 * This function is only called after the system
> +	 * has panicked or is otherwise in a critical state.
> +	 * The minimum amount of code to allow a kexec'd kernel
> +	 * to run successfully needs to happen here.
> +	 *
> +	 * In practice this means stopping other cpus in
> +	 * an SMP system.
> +	 * The kernel is broken so disable interrupts.
> +	 */
> +	hard_irq_disable();
> +
> +	/*
> +	 * Make a note of crashing cpu. Will be used in machine_kexec
> +	 * such that another IPI will not be sent.
> +	 */
> +	crashing_cpu = smp_processor_id();
> +
> +	crash_kexec_prepare_cpus();
> +}
> +
>   /*
>    * Register a function to be called on shutdown.  Only use this if you
>    * can't reset your device in the second kernel.
> @@ -311,35 +353,10 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
>   	unsigned int i;
>   	int (*old_handler)(struct pt_regs *regs);
>   
> -	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
> -	printk_deferred_enter();
> -
> -	/*
> -	 * This function is only called after the system
> -	 * has panicked or is otherwise in a critical state.
> -	 * The minimum amount of code to allow a kexec'd kernel
> -	 * to run successfully needs to happen here.
> -	 *
> -	 * In practice this means stopping other cpus in
> -	 * an SMP system.
> -	 * The kernel is broken so disable interrupts.
> -	 */
> -	hard_irq_disable();
> -
> -	/*
> -	 * Make a note of crashing cpu. Will be used in machine_kexec
> -	 * such that another IPI will not be sent.
> -	 */
> -	crashing_cpu = smp_processor_id();
> -
> -	/*
> -	 * If we came in via system reset, wait a while for the secondary
> -	 * CPUs to enter.
> -	 */
>   	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
> -		mdelay(PRIMARY_TIMEOUT);
> +		is_via_system_reset = 1;
>   
> -	crash_kexec_prepare_cpus(crashing_cpu);
> +	crash_smp_send_stop();
>   
>   	crash_save_cpu(regs, crashing_cpu);
>   
