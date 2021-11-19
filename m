Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109A4571A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 16:33:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwggD6PjWz3c91
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 02:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fFSCE7S2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fFSCE7S2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwgfQ4kYdz2ywf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 02:33:02 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJFW7Y0027196; 
 Fri, 19 Nov 2021 15:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Sz5g6x51e4dkwWjJP8xN6u4gN0o9/c9AaHUIKFyAr5k=;
 b=fFSCE7S2kMg1upFGNirFcM7d/v6YaEpkPM6QduoD8bZi4L19p8C9hlsxq3zo1D/6Dj3Z
 saJDwmOpP837X6vL7fKuNesuJ8nRAIaawc4+e+F2GOSiUuh4hTObOKCf4oiP8VjrbLpy
 XIIxH9uNYTtqhvNLSd9AC58/sBNwdes03o+pC1c5bCd8bsws9c4pftZZTF5hvPuQk7P/
 x2GG3tEnHa2woiQpwuFhYC+iVNRwDOSDT5F5kmMkBIRI9d6Zy81v5lChSpl5xEIAZX0v
 LxwpyKyMLTSjWoLln6yEGwyM7YbTsFFQl563IhH8Xlx1cNGtBq4VGzk+xkC8WdVpJbBS LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ceen900a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 15:32:59 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJFWwaw028716;
 Fri, 19 Nov 2021 15:32:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ceen9009x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 15:32:58 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJFE6v2007813;
 Fri, 19 Nov 2021 15:32:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3ca50c231f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 15:32:56 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJFWslP59179412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 15:32:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CACB4C05E;
 Fri, 19 Nov 2021 15:32:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7395C4C04A;
 Fri, 19 Nov 2021 15:32:54 +0000 (GMT)
Received: from [9.145.48.173] (unknown [9.145.48.173])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Nov 2021 15:32:54 +0000 (GMT)
Message-ID: <2b67e81f-6ba5-b7c1-a9b2-79add30240aa@linux.ibm.com>
Date: Fri, 19 Nov 2021 16:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v4 5/5] powerpc/watchdog: help remote CPUs to flush NMI
 printk output
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211119113146.752759-1-npiggin@gmail.com>
 <20211119113146.752759-6-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20211119113146.752759-6-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E9Ns3lVxN_e7KOYmPQLa5edcMUpsNw5D
X-Proofpoint-ORIG-GUID: oAP8Rhd9QjsMPXsHZmD_bKu__bM5nuqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190086
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 19/11/2021 à 12:31, Nicholas Piggin a écrit :
> The printk layer at the moment does not seem to have a good way to force
> flush printk messages that are created in NMI context, except in the
> panic path.
> 
> NMI-context printk messages normally get to the console with irq_work,
> but that won't help if the CPU is stuck with irqs disabled, as can be
> the case for hard lockup watchdog messages.
> 
> The watchdog currently flushes the printk buffers after detecting a
> lockup on remote CPUs, but they may not have processed their NMI IPI
> yet by that stage, or they may have self-detected a lockup in which
> case they won't go via this NMI IPI path.
> 
> Improve the situation by having NMI-context mark a flag if it called
> printk, and have watchdog timer interrupts check if that flag was set
> and try to flush if it was. Latency is not a big problem because we
> were already stuck for a while, just need to try to make sure the
> messages eventually make it out.
> 
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
> This patch requires commit 5d5e4522a7f4 ("printk: restore flushing of
> NMI buffers on remote CPUs after NMI backtraces"). If backporting this
> to a kernel without commit 93d102f094be ("printk: remove safe buffers"),
> then printk_safe_flush() should be used in place of
> printk_trigger_flush().
> 
> Thanks,
> Nick
> 
>   arch/powerpc/kernel/watchdog.c | 37 ++++++++++++++++++++++++++++------
>   1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 23745af38d62..bfc27496fe7e 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -86,6 +86,7 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
>   /* SMP checker bits */
>   static unsigned long __wd_smp_lock;
>   static unsigned long __wd_reporting;
> +static unsigned long __wd_nmi_output;
>   static cpumask_t wd_smp_cpus_pending;
>   static cpumask_t wd_smp_cpus_stuck;
>   static u64 wd_smp_last_reset_tb;
> @@ -154,6 +155,23 @@ static void wd_lockup_ipi(struct pt_regs *regs)
>   	else
>   		dump_stack();
>   
> +	/*
> +	 * __wd_nmi_output must be set after we printk from NMI context.
> +	 *
> +	 * printk from NMI context defers printing to the console to irq_work.
> +	 * If that NMI was taken in some code that is hard-locked, then irqs
> +	 * are disabled so irq_work will never fire. That can result in the
> +	 * hard lockup messages being delayed (indefinitely, until something
> +	 * else kicks the console drivers).
> +	 *
> +	 * Setting __wd_nmi_output will cause another CPU to notice and kick
> +	 * the console drivers for us.
> +	 *
> +	 * xchg is not needed here (it could be a smp_mb and store), but xchg
> +	 * gives the memory ordering and atomicity required.
> +	 */
> +	xchg(&__wd_nmi_output, 1);
> +
>   	/* Do not panic from here because that can recurse into NMI IPI layer */
>   }
>   
> @@ -227,12 +245,6 @@ static void watchdog_smp_panic(int cpu)
>   		cpumask_clear(&wd_smp_cpus_ipi);
>   	}
>   
> -	/*
> -	 * Force flush any remote buffers that might be stuck in IRQ context
> -	 * and therefore could not run their irq_work.
> -	 */
> -	printk_trigger_flush();
> -
>   	if (hardlockup_panic)
>   		nmi_panic(NULL, "Hard LOCKUP");
>   
> @@ -337,6 +349,17 @@ static void watchdog_timer_interrupt(int cpu)
>   
>   	if ((s64)(tb - wd_smp_last_reset_tb) >= (s64)wd_smp_panic_timeout_tb)
>   		watchdog_smp_panic(cpu);
> +
> +	if (__wd_nmi_output && xchg(&__wd_nmi_output, 0)) {
> +		/*
> +		 * Something has called printk from NMI context. It might be
> +		 * stuck, so this this triggers a flush that will get that
> +		 * printk output to the console.
> +		 *
> +		 * See wd_lockup_ipi.
> +		 */
> +		printk_trigger_flush();
> +	}
>   }
>   
>   DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
> @@ -386,6 +409,8 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   		print_irqtrace_events(current);
>   		show_regs(regs);
>   
> +		xchg(&__wd_nmi_output, 1); // see wd_lockup_ipi
> +
>   		if (sysctl_hardlockup_all_cpu_backtrace)
>   			trigger_allbutself_cpu_backtrace();
>   
> 

