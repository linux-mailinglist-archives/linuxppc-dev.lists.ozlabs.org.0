Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A605446446
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 14:40:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm1pr1XWhz3bmf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 00:40:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASCsmnhX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ASCsmnhX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm1p46YdPz2yb3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 00:39:40 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5ChEaR003336
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 13:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GPn76SK1mooR2srauMTi5vIIzrVQIXShW9fETmVWPL8=;
 b=ASCsmnhXaIS6IpKt/YrU7+IhttV4WeD4MovcwavRV2q2/TSqr5pSYb5O74vUjgw4Kqep
 dtRd2dP63i7f8vARI88Re/RB60sDYvnBJrwScVUZnWir+XwwVUxfT/dJm3TTicIwsV9S
 53gKAuB3YGoIglyTA4vhyU11/4HZvoyrh5vxPLjKXmK0zwNozEyAVbwKtQBxmBkKEE+Y
 twGH9AcvABEwewa5uHEaaa3QzN6XA3fuf4zh2CLbZaWttC0tqPharcbdPPwcw3IeDU0m
 lmPyo+RRlucmS6IQnD319gRELvm5sNIqTqlO46U6H+rkHOYJdDT3kr+md2V1TQ+wrHQc AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c544dt658-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 13:39:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A5BqcS6003485
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 13:39:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c544dt64r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 13:39:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A5DRkVB019253;
 Fri, 5 Nov 2021 13:39:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3c4t4kw5ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 13:39:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A5DdWpn65798574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 13:39:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FF5D4C044;
 Fri,  5 Nov 2021 13:39:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FDA54C040;
 Fri,  5 Nov 2021 13:39:32 +0000 (GMT)
Received: from pomme.local (unknown [9.145.172.6])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 13:39:32 +0000 (GMT)
Subject: Re: [PATCH v2 4/5] powerpc/watchdog: Read TB close to where it is used
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211104161057.1255659-1-npiggin@gmail.com>
 <20211104161057.1255659-5-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <b0880e6e-71c7-0ea2-1e6d-6dee86265abe@linux.ibm.com>
Date: Fri, 5 Nov 2021 14:39:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211104161057.1255659-5-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3GzqEuB2m6JOOlcW1s7fwgovsefD7wex
X-Proofpoint-ORIG-GUID: MIR8QvP8lt8HIXvicIGSfQ4PeXj4zD9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_02,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050078
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 04/11/2021 à 17:10, Nicholas Piggin a écrit :
> When taking watchdog actions, printing messages, comparing and
> re-setting wd_smp_last_reset_tb, etc., read TB close to the point of use
> and under wd_smp_lock or printing lock (if applicable).
> 
> This should keep timebase mostly monotonic with kernel log messages, and
> could prevent (in theory) a laggy CPU updating wd_smp_last_reset_tb to
> something a long way in the past, and causing other CPUs to appear to be
> stuck.
> 
> These additional TB reads are all slowpath (lockup has been detected),
> so performance does not matter.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/watchdog.c | 30 ++++++++++++++++++------------
>   1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 0265d27340f1..2444cd10b61a 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -94,6 +94,10 @@ static u64 wd_smp_last_reset_tb;
>    * Try to take the exclusive watchdog action / NMI IPI / printing lock.
>    * wd_smp_lock must be held. If this fails, we should return and wait
>    * for the watchdog to kick in again (or another CPU to trigger it).
> + *
> + * Importantly, if hardlockup_panic is set, wd_try_report failure should
> + * not delay the panic, because whichever other CPU is reporting will
> + * call panic.
>    */

I guess this comment should be part of the previous commit in this series.

Despite that, please consider

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

>   static bool wd_try_report(void)
>   {
> @@ -153,7 +157,7 @@ static void wd_lockup_ipi(struct pt_regs *regs)
>   	/* Do not panic from here because that can recurse into NMI IPI layer */
>   }
>   
> -static bool set_cpu_stuck(int cpu, u64 tb)
> +static bool set_cpu_stuck(int cpu)
>   {
>   	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
>   	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
> @@ -162,7 +166,7 @@ static bool set_cpu_stuck(int cpu, u64 tb)
>   	 */
>   	smp_mb();
>   	if (cpumask_empty(&wd_smp_cpus_pending)) {
> -		wd_smp_last_reset_tb = tb;
> +		wd_smp_last_reset_tb = get_tb();
>   		cpumask_andnot(&wd_smp_cpus_pending,
>   				&wd_cpus_enabled,
>   				&wd_smp_cpus_stuck);
> @@ -171,14 +175,16 @@ static bool set_cpu_stuck(int cpu, u64 tb)
>   	return false;
>   }
>   
> -static void watchdog_smp_panic(int cpu, u64 tb)
> +static void watchdog_smp_panic(int cpu)
>   {
>   	static cpumask_t wd_smp_cpus_ipi; // protected by reporting
>   	unsigned long flags;
> +	u64 tb;
>   	int c;
>   
>   	wd_smp_lock(&flags);
>   	/* Double check some things under lock */
> +	tb = get_tb();
>   	if ((s64)(tb - wd_smp_last_reset_tb) < (s64)wd_smp_panic_timeout_tb)
>   		goto out;
>   	if (cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
> @@ -192,7 +198,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>   			continue; // should not happen
>   
>   		__cpumask_set_cpu(c, &wd_smp_cpus_ipi);
> -		if (set_cpu_stuck(c, tb))
> +		if (set_cpu_stuck(c))
>   			break;
>   	}
>   	if (cpumask_empty(&wd_smp_cpus_ipi)) {
> @@ -232,7 +238,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>   	wd_smp_unlock(&flags);
>   }
>   
> -static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
> +static void wd_smp_clear_cpu_pending(int cpu)
>   {
>   	if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
>   		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
> @@ -240,7 +246,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>   			unsigned long flags;
>   
>   			pr_emerg("CPU %d became unstuck TB:%lld\n",
> -				 cpu, tb);
> +				 cpu, get_tb());
>   			print_irqtrace_events(current);
>   			if (regs)
>   				show_regs(regs);
> @@ -301,7 +307,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>   		 */
>   		wd_smp_lock(&flags);
>   		if (cpumask_empty(&wd_smp_cpus_pending)) {
> -			wd_smp_last_reset_tb = tb;
> +			wd_smp_last_reset_tb = get_tb();
>   			cpumask_andnot(&wd_smp_cpus_pending,
>   					&wd_cpus_enabled,
>   					&wd_smp_cpus_stuck);
> @@ -316,10 +322,10 @@ static void watchdog_timer_interrupt(int cpu)
>   
>   	per_cpu(wd_timer_tb, cpu) = tb;
>   
> -	wd_smp_clear_cpu_pending(cpu, tb);
> +	wd_smp_clear_cpu_pending(cpu);
>   
>   	if ((s64)(tb - wd_smp_last_reset_tb) >= (s64)wd_smp_panic_timeout_tb)
> -		watchdog_smp_panic(cpu, tb);
> +		watchdog_smp_panic(cpu);
>   }
>   
>   DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
> @@ -356,7 +362,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   			return 0;
>   		}
>   
> -		set_cpu_stuck(cpu, tb);
> +		set_cpu_stuck(cpu);
>   
>   		wd_smp_unlock(&flags);
>   
> @@ -417,7 +423,7 @@ void arch_touch_nmi_watchdog(void)
>   	tb = get_tb();
>   	if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
>   		per_cpu(wd_timer_tb, cpu) = tb;
> -		wd_smp_clear_cpu_pending(cpu, tb);
> +		wd_smp_clear_cpu_pending(cpu);
>   	}
>   }
>   EXPORT_SYMBOL(arch_touch_nmi_watchdog);
> @@ -475,7 +481,7 @@ static void stop_watchdog(void *arg)
>   	cpumask_clear_cpu(cpu, &wd_cpus_enabled);
>   	wd_smp_unlock(&flags);
>   
> -	wd_smp_clear_cpu_pending(cpu, get_tb());
> +	wd_smp_clear_cpu_pending(cpu);
>   }
>   
>   static int stop_watchdog_on_cpu(unsigned int cpu)
> 

