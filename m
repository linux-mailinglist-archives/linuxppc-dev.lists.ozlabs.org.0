Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104FC44D653
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 13:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqgSk66ggz3c75
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 23:07:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QbNz/Tpp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QbNz/Tpp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqgRw1KCVz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 23:06:35 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ABBmfjF016034; 
 Thu, 11 Nov 2021 12:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zH0E8RQ5B+CETc+Z62MAIT5YzAhPedMBrJa2qydERKg=;
 b=QbNz/Tpp4Y2jt7QOLJTKIR4wUyW3+9QTMcFXZGSRLBDKlqPZI4CrLvvGEkEqNgDeFibg
 fpNAgQEulGNeHapdmq5nSYzyFE2iQBuCbewDoIn4zKIRZk3yGSgTrGdr5JgQiRJKlmyV
 VIsv5GdlaxHZC47iwhEMLPFjjeLW9aWiX0KGAi+qLfiCyWcs313wWzSAPRrEUMPyN5Au
 9Q/00qH6+0loPTYmpi72+jtnjYhekCNqfdMLTpDpY4jgYzVqVdQIdPjs9ccBGHt9UFTY
 N1maNTYQWVChmOxFdeACHHYSzHA6kx3c1QbJZskigGMzonxrfc5e4hzdL8P0bm1REsx3 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c92mkge42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 12:06:29 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ABBwlZr008493;
 Thu, 11 Nov 2021 12:06:28 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c92mkge33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 12:06:28 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ABC3GX9014058;
 Thu, 11 Nov 2021 12:06:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3c5hbak1vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 12:06:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ABC6Mjk50331990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 12:06:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE95352057;
 Thu, 11 Nov 2021 12:06:22 +0000 (GMT)
Received: from [9.43.14.105] (unknown [9.43.14.105])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 90F915204F;
 Thu, 11 Nov 2021 12:06:19 +0000 (GMT)
Message-ID: <1c3effbd-1c88-efdb-93c9-54790ee566b8@linux.ibm.com>
Date: Thu, 11 Nov 2021 17:36:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] ppc64/fadump: fix inaccurate CPU state info in vmcore
 generated with panic
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20211110190143.186346-1-hbathini@linux.ibm.com>
 <87lf1vmd78.fsf@mpe.ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <87lf1vmd78.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TIhLVJ9SUTpFJe32VlZgOvZ57zyVecRw
X-Proofpoint-GUID: gNlxe_ubVyIZCMpcLD9is9QT7Ai058EK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_03,2021-11-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110072
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
Cc: npiggin@gmail.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/11/21 11:44 am, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> In panic path, fadump is triggered via a panic notifier function.
>> Before calling panic notifier functions, smp_send_stop() gets called,
>> which stops all CPUs except the panic'ing CPU. Commit 8389b37dffdc
>> ("powerpc: stop_this_cpu: remove the cpu from the online map.") and
>> again commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
>> started marking CPUs as offline while stopping them. So, if a kernel
>> has either of the above commits, vmcore captured with fadump via panic
>> path would show only the panic'ing CPU as online. Sample output of
>> crash-utility with such vmcore:
>>
>>    # crash vmlinux vmcore
>>    ...
>>          KERNEL: vmlinux
>>        DUMPFILE: vmcore  [PARTIAL DUMP]
>>            CPUS: 1
>>            DATE: Wed Nov 10 09:56:34 EST 2021
>>          UPTIME: 00:00:42
>>    LOAD AVERAGE: 2.27, 0.69, 0.24
>>           TASKS: 183
>>        NODENAME: XXXXXXXXX
>>         RELEASE: 5.15.0+
>>         VERSION: #974 SMP Wed Nov 10 04:18:19 CST 2021
>>         MACHINE: ppc64le  (2500 Mhz)
>>          MEMORY: 8 GB
>>           PANIC: "Kernel panic - not syncing: sysrq triggered crash"
>>             PID: 3394
>>         COMMAND: "bash"
>>            TASK: c0000000150a5f80  [THREAD_INFO: c0000000150a5f80]
>>             CPU: 1
>>           STATE: TASK_RUNNING (PANIC)
>>
>>    crash> p -x __cpu_online_mask
>>    __cpu_online_mask = $1 = {
>>      bits = {0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
>>    }
>>    crash>
>>    crash>
>>    crash> p -x __cpu_active_mask
>>    __cpu_active_mask = $2 = {
>>      bits = {0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
>>    }
>>    crash>
>>
>> While this has been the case since fadump was introduced, the issue
>> was not identified for two probable reasons:
>>
>>    - In general, the bulk of the vmcores analyzed were from crash
>>      due to exception.
>>
>>    - The above did change since commit 8341f2f222d7 ("sysrq: Use
>>      panic() to force a crash") started using panic() instead of
>>      deferencing NULL pointer to force a kernel crash. But then
>>      commit de6e5d38417e ("powerpc: smp_send_stop do not offline
>>      stopped CPUs") stopped marking CPUs as offline till kernel
>>      commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
>>      reverted that change.
>>
>> To avoid vmcore from showing only one CPU as online in panic path,
>> skip marking non panic'ing CPUs as offline while stopping them
>> during fadump crash.
> 
> Is this really worth the added complexity/bug surface?
> 
> Why does it matter if the vmcore shows only one CPU online?

We lose out on backtrace/register data of non-crashing CPUs as they
are explicitly marked offline.

Actually, the state of CPU resources is explicitly changed after the
panic though the aim of vmcore is to capture the system state at the
time of panic...

Alternatively, how about moving crash_fadump() call from panic notifier
into panic() function explicitly, just like __crash_kexec() - before the
smp_send_stop() call, so as to remove dependency with smp_send_stop()
implementation altogether...

> 
>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>> index c23ee842c4c3..20555d5d5966 100644
>> --- a/arch/powerpc/kernel/smp.c
>> +++ b/arch/powerpc/kernel/smp.c
>> @@ -61,6 +61,7 @@
>>   #include <asm/cpu_has_feature.h>
>>   #include <asm/ftrace.h>
>>   #include <asm/kup.h>
>> +#include <asm/fadump.h>
>>   
>>   #ifdef DEBUG
>>   #include <asm/udbg.h>
>> @@ -626,7 +627,8 @@ static void nmi_stop_this_cpu(struct pt_regs *regs)
>>   	/*
>>   	 * IRQs are already hard disabled by the smp_handle_nmi_ipi.
>>   	 */
>> -	set_cpu_online(smp_processor_id(), false);
>> +	if (!(oops_in_progress && should_fadump_crash()))
>> +		set_cpu_online(smp_processor_id(), false);
>>   
>>   	spin_begin();
>>   	while (1)
>> @@ -650,7 +652,8 @@ static void stop_this_cpu(void *dummy)
>>   	 * to know other CPUs are offline before it breaks locks to flush
>>   	 * printk buffers, in case we panic()ed while holding the lock.
>>   	 */
>> -	set_cpu_online(smp_processor_id(), false);
>> +	if (!(oops_in_progress && should_fadump_crash()))
>> +		set_cpu_online(smp_processor_id(), false);
> 
> The comment talks about printk_safe_flush_on_panic(), and this change
> would presumably break that. Except that printk_safe_flush_on_panic() no
> longer exists.
> 
> So do we need to set the CPU online here at all?
> 
> ie. could we revert bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
> now that printk_safe_flush_on_panic() no longer exists?

Yeah, sounds like the logical thing to do but I guess, Nick would be in
a better position to answer this..

Thanks,
Hari
