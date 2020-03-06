Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A117B7D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 09:02:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yg7c1hbRzDr0Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 19:02:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yg5P1BJpzDqjd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 19:00:08 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0267rEPQ038984
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Mar 2020 03:00:05 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfkne0ehq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 03:00:04 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Fri, 6 Mar 2020 08:00:01 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Mar 2020 07:59:59 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0267xxgG58916880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 07:59:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDB2C4203F;
 Fri,  6 Mar 2020 07:59:58 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59F9842047;
 Fri,  6 Mar 2020 07:59:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 07:59:58 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DB34FA011F;
 Fri,  6 Mar 2020 18:59:52 +1100 (AEDT)
Subject: Re: [PATCH v3] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20200306073000.9491-1-dja@axtens.net>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 6 Mar 2020 18:59:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306073000.9491-1-dja@axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030608-0020-0000-0000-000003B1005F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030607-0021-0000-0000-000022093FB2
Message-Id: <18e9cbdf-6056-e922-4bed-d8a3a205b2d3@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060055
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

On 6/3/20 6:30 pm, Daniel Axtens wrote:
> kcov instrumentation is collected the __sanitizer_cov_trace_pc hook in
> kernel/kcov.c. The compiler inserts these hooks into every basic block
> unless kcov is disabled for that file.
> 
> We then have a deep call-chain:
>   - __sanitizer_cov_trace_pc calls to check_kcov_mode()
>   - check_kcov_mode() (kernel/kcov.c) calls in_task()
>   - in_task() (include/linux/preempt.h) calls preempt_count().
>   - preempt_count() (include/asm-generic/preempt.h) calls
>       current_thread_info()
>   - because powerpc has THREAD_INFO_IN_TASK, current_thread_info()
>       (include/linux/thread_info.h) is defined to 'current'
>   - current (arch/powerpc/include/asm/current.h) is defined to
>       get_current().
>   - get_current (same file) loads an offset of r13.
>   - arch/powerpc/include/asm/paca.h makes r13 a register variable
>       called local_paca - it is the PACA for the current CPU, so
>       this has the effect of loading the current task from PACA.
>   - get_current returns the current task from PACA,
>   - current_thread_info returns the task cast to a thread_info
>   - preempt_count dereferences the thread_info to load preempt_count
>   - that value is used by in_task and so on up the chain
> 
> The problem is:
> 
>   - kcov instrumentation is enabled for arch/powerpc/kernel/dt_cpu_ftrs.c
> 
>   - even if it were not, dt_cpu_ftrs_init calls generic dt parsing code
>     which should definitely have instrumentation enabled.
> 
>   - setup_64.c calls dt_cpu_ftrs_init before it sets up a PACA.
> 
>   - If we don't set up a paca, r13 will contain unpredictable data.
> 
>   - In a zImage compiled with kcov and KASAN, we see r13 containing a value
>     that leads to dereferencing invalid memory (something like
>     912a72603d420015).
> 
>   - Weirdly, the same kernel as a vmlinux loaded directly by qemu does not
>     crash. Investigating with gdb, it seems that in the vmlinux boot case,
>     r13 is near enough to zero that we just happen to be able to read that
>     part of memory (we're operating with translation off at this point) and
>     the current pointer also happens to land in readable memory and
>     everything just works.
> 
>   - PACA setup refers to CPU features - setup_paca() looks at
>     early_cpu_has_feature(CPU_FTR_HVMODE)
> 
> There's no generic kill switch for kcov (as far as I can tell), and we
> don't want to have to turn off instrumentation in the generic dt parsing
> code (which lives outside arch/powerpc/) just because we don't have a real
> paca or task yet.
> 
> So:
>   - change the test when setting up a PACA to consider the actual value of
>     the MSR rather than the CPU feature.
> 
>   - move the PACA setup to before the cpu feature parsing.
> 
> Translations get switched on once we leave early_setup, so I think we'd
> already catch any other cases where the PACA or task aren't set up.
> 
> Boot tested on a P9 guest and host.
> 
> Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> 
> ---
> 
> Regarding moving the comment about printk()-safety:
> I am about 75% sure that the thing that makes printk() safe is the PACA,
> not the CPU features. That's what commit 24d9649574fb ("[POWERPC] Document
> when printk is useable") seems to indicate, but as someone wise recently
> told me, "bootstrapping is hard", so I may be totally wrong.
> 
> v3: Update comment, thanks Christophe Leroy.
>      Remove a comment in dt_cpu_ftrs.c that is no longer accurate - thanks
>        Andrew. I think we want to retain all the code still, but I'm open to
>        being told otherwise.

Thanks for doing that.

This patch and the justification doesn't seem obviously wrong, and is 
snowpatch-clean.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

(Is it worth cc'ing this to stable in case there are other situations we 
haven't foreseen where we hit the unpredictable r13 data? Few people use 
kcov...)


-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

