Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 390FA15D040
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 04:06:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JdZR3W8BzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 14:06:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JdXb1f7QzDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:05:01 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01E2xS4M195253
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 22:04:58 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y57ddg6py-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 22:04:58 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Fri, 14 Feb 2020 03:04:56 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Feb 2020 03:04:53 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01E34roO26279970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 03:04:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF1E0A405F;
 Fri, 14 Feb 2020 03:04:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5710DA4054;
 Fri, 14 Feb 2020 03:04:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Feb 2020 03:04:52 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4C92EA01A5;
 Fri, 14 Feb 2020 14:04:47 +1100 (AEDT)
Subject: Re: [PATCH v2] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20200213052327.24207-1-dja@axtens.net>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 14 Feb 2020 14:04:49 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213052327.24207-1-dja@axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20021403-0008-0000-0000-00000352AE6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021403-0009-0000-0000-00004A7359CD
Message-Id: <59e8a506-572a-f355-e0ca-9c75758a9b65@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_10:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=900 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140022
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

On 13/2/20 4:23 pm, Daniel Axtens wrote:
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

There's some special handling for CPU_FTR_HVMODE in 
cpufeatures_setup_cpu() in kernel/dt_cpu_ftrs.c:

         /* Initialize the base environment -- clear FSCR/HFSCR.  */
         hv_mode = !!(mfmsr() & MSR_HV);
         if (hv_mode) {
                 /* CPU_FTR_HVMODE is used early in PACA setup */
                 cur_cpu_spec->cpu_features |= CPU_FTR_HVMODE;
                 mtspr(SPRN_HFSCR, 0);
         }

With this patch, the comment about PACA setup I assume is no longer 
true. It looks like we still rely on hv_mode being set to deal with 
discrepancies between the device tree and the MSR.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

