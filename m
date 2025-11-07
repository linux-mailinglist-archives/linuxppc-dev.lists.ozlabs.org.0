Return-Path: <linuxppc-dev+bounces-13945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B55C40DA9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 17:24:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d34Bf6C4kz3bt9;
	Sat,  8 Nov 2025 03:24:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762532650;
	cv=none; b=TZHlb+BKXQcRZcnaEqfvehruNPuxp+uNDyhzI0ZRiURAZTeBcTo0HvuvfkoHP7UNj73VCHu+o2EsQwRB3VL3qYHLMgrWEkQl752epfbs17dKBgTOGELezTjtq1FPlvQBTY5Vl2KLL7OvuyNEs/GfKTmOeQYj0r66j7pAcU3kSXP7pWkhHqt+4sf8N6M/u3Z0zF0O0DF8KRHZbDXiPObwa1NLqw8YTTAya5+uOB5oAU98KgJT5bkLsFLyTUHe84jK/s3DwXYPp7/pZvWbNIiYWuKaRyxEacc/UkiVJ9zGWjx52DD8XCkUQY6cejBjYEwEd97+n0HhpGstNZNjP0DSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762532650; c=relaxed/relaxed;
	bh=DsfblbiVy50iyzWSSQtr3TVl9NRjbvAm1vCXT9V2WE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=FMHsqAtp0MIi3PDx0ysMmB66ssFXYfboQl7zR5esWEcotd52+Ui7KdJJCekql19oSZfB8yiLdcKWYgMKJ/nA+n/5ySgTYSGNjvo5lNn+AyYMxLXkquOfjK3bPqePCBYiX7b2n+32RInekMcX3DWqxnREnH6fIh7RR6HzYC1BrDf2qxCmsjUkHwN7kJuAG+jrIeCWdIQeRqTL3sbW1ORRKlAWvJdqOkjfLIHxtXg99h0iNzyit3WX0Dj0tEqPzfljTD8vGFDy3UbToqufNZQaZGshvYVo0hy/jK3yEGLNHqQpsLcahqPpZacq/ohw5+MAktObq0gmxHCHtrs8JSAnrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/vCcZS9; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/vCcZS9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d34Bd5pxTz3bsN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 03:24:09 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7GM1wd002735;
	Fri, 7 Nov 2025 16:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Dsfblb
	iVy50iyzWSSQtr3TVl9NRjbvAm1vCXT9V2WE0=; b=o/vCcZS9mChH/kf0kQTxiu
	VgCkZbMnICvgKIEObzgUFkcf7ml1AjqvF/beox0ldUYjWkCfyKyn14MK9W8rtMap
	f0Vm1KxptBVscE+01PtyHj542CMvTAZNmfyBHu+X9IiQ23IzzEVo+Se9Dzf3DH5i
	fMxOiY1WdeP3v70zHjqcy98jIb2UdzVBKFUG1S/7YIRC8+3MEfE65UxtSqbaec4t
	fJ+B8LtTuhbQTfULL4KLNwqYj9JkAdhcGGjowIiFzDMCv6CulitG/IVXJ5l0CzwB
	KH60rUWuf/3rAvFvdbUVk91kmyfWTw1QM4KqpWQO2v4+QV4kSTLnOmUi4tk/A7Rg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a58mmcm5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 16:23:27 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A7GBoUQ010201;
	Fri, 7 Nov 2025 16:23:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a58mmcm5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 16:23:26 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7EBU8o025569;
	Fri, 7 Nov 2025 16:23:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5vht3uyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 16:23:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A7GNLG331326666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 16:23:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3CDE20063;
	Fri,  7 Nov 2025 16:23:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 468EE20040;
	Fri,  7 Nov 2025 16:23:15 +0000 (GMT)
Received: from [9.39.18.215] (unknown [9.39.18.215])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 16:23:15 +0000 (GMT)
Message-ID: <5a2678a6-66e5-4c15-b95a-ce9f977f79e5@linux.ibm.com>
Date: Fri, 7 Nov 2025 21:53:13 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com
References: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, akpm@linux-foundation.org, macro@orcam.me.uk,
        ldv@strace.io, deller@gmx.de, charlie@rivosinc.com,
        bigeasy@linutronix.de, segher@kernel.crashing.org,
        thomas.weissschuh@linutronix.de, menglong8.dong@gmail.com,
        ankur.a.arora@oracle.com, peterz@infradead.org, namcao@linutronix.de,
        tglx@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        coltonlewis@google.com, rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xBjNzwAGArkd9zRFf8743xnFRLWEab_U
X-Proofpoint-GUID: SSC2i9FCI_yJg6NNrJkaWxCSQqUa4o9J
X-Authority-Analysis: v=2.4 cv=SqidKfO0 c=1 sm=1 tr=0 ts=690e1cff cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=LwpTY9eDNtmqyekYXdUA:9 a=QEXdDO2ut3YA:10 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwOSBTYWx0ZWRfXw/zJ4rnKFJRC
 5NzWA5vG38xGbuWPp0ZyjzNIbmyoBHW6rSmIRZVnDAQxWYUzAgrG8/Ggxx4LlJKhEaWcAcJfS/v
 7TiBCjneC9OFSliWaXMx7AFegAaBYhVXfIJ5tgtaivPzh/cvE9Wio+fc/FV4BnxGUTfABxW6GnU
 Wzxa/LanQhah9QRZM3lL0cJoeqPpmJSWjXB094LvXMyLLhpfiL6VCYfKLVC9/SHIahtwsmGRyqr
 XrzRgV791+U1nlVpzJThNd39ksNRfNQiLf86LEbARFoMAhXzYjU/BpZfNPpTGg+q4SFIMQpwlBc
 HG9XoyBNnxyzV5oY4usjarbCO+iwcwsv3142uY5H7B76mxUTj1PlF2CxZUQfni9cBmOvaWXQh7I
 aPLpgWliHzrVTM+Qx6DlkmTipDVE0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/2/25 5:23 PM, Mukesh Kumar Chaurasiya wrote:
> Adding support for the generic irq entry/exit handling for PowerPC. The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
> 
> This is slightly tested of ppc64le and ppc32.
> 
> The performance benchmarks from perf bench basic syscall are below:
> 
> | Metric     | W/O Generic Framework | With Generic Framework | Change |
> | ---------- | --------------------- | ---------------------- | ------ |
> | Total time | 0.939 [sec]           | 0.938 [sec]            | ~0%    |
> | usecs/op   | 0.093900              | 0.093882               | ~0%    |
> | ops/sec    | 1,06,49,615           | 1,06,51,725            | ~0%    |
> 
> Thats very close to performance earlier with arch specific handling.
> 
> Tests done:
>   - Build and boot on ppc64le pseries.
>   - Build and boot on ppc64le powernv8 powernv9 powernv10.
>   - Build and boot on ppc32.
>   - Performance benchmark done with perf syscall basic on pseries.
> 

Hi Mukesh.

The context tracking is not correct.
too many warning when booted with nohz_full=<>

Did some fiddling, but no luck still in avoiding the warnings.
Below helps to boot into atleast (less warning in comparison)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 466cfafc10ad..a66cafc94b5e 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -217,20 +217,11 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
  
         if (user_mode(regs)) {
                 kuap_lock();
-               CT_WARN_ON(ct_state() != CT_STATE_USER);
-               user_exit_irqoff();
  
                 account_cpu_user_entry();
                 account_stolen_time();
         } else {
                 kuap_save_and_lock(regs);
-               /*
-                * CT_WARN_ON comes here via program_check_exception,
-                * so avoid recursion.
-                */
-               if (TRAP(regs) != INTERRUPT_PROGRAM)
-                       CT_WARN_ON(ct_state() != CT_STATE_KERNEL &&
-                                  ct_state() != CT_STATE_IDLE);
                 INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
                 INT_SOFT_MASK_BUG_ON(regs, regs_irqs_disabled(regs) &&
                                      search_kernel_restart_table(regs->nip));
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index ce59431f977c..c7cf9a3f1202 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -118,16 +118,18 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
                 regs->exit_flags |= _TIF_RESTOREALL;
         }
  
-again:
+       local_irq_disable();
+
+       user_exit_irqoff();
         syscall_exit_to_user_mode(regs);
  
-       user_enter_irqoff();
-       if (!prep_irq_for_enabled_exit(true)) {
-               user_exit_irqoff();
-               local_irq_enable();
-               local_irq_disable();
-               goto again;
-       }
+again:
+       if (!prep_irq_for_enabled_exit(true)) {
+               local_irq_enable();
+               local_irq_disable();
+               goto again;
+       }
+
  
         /* Restore user access locks last */
         kuap_user_restore(regs);
@@ -155,16 +157,15 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
  #ifdef CONFIG_PPC_BOOK3S_64
         set_kuap(AMR_KUAP_BLOCKED);
  #endif
-again:
+       user_exit_irqoff();
         syscall_exit_to_user_mode(regs);
  
-       user_enter_irqoff();
-       if (!prep_irq_for_enabled_exit(true)) {
-               user_exit_irqoff();
-               local_irq_enable();
-               local_irq_disable();
-               goto again;
-       }
+again:
+       if (!prep_irq_for_enabled_exit(true)) {
+               local_irq_enable();
+               local_irq_disable();
+               goto again;
+       }
  
         regs->exit_result |= regs->exit_flags;
  
@@ -178,7 +179,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
  
         BUG_ON(regs_is_unrecoverable(regs));
         BUG_ON(regs_irqs_disabled(regs));
-       CT_WARN_ON(ct_state() == CT_STATE_USER);
  
         /*
          * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -188,17 +188,17 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
  
         local_irq_disable();
         regs->exit_flags = 0;
-again:
+
+       user_exit_irqoff();
         irqentry_exit_to_user_mode(regs);
         check_return_regs_valid(regs);
  
-       user_enter_irqoff();
-       if (!prep_irq_for_enabled_exit(true)) {
-               user_exit_irqoff();
-               local_irq_enable();
-               local_irq_disable();
-               goto again;
-       }
+again:
+       if (!prep_irq_for_enabled_exit(true)) {
+               local_irq_enable();
+               local_irq_disable();
+               goto again;
+       }
  
         /* Restore user access locks last */
         kuap_user_restore(regs);
@@ -222,20 +222,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
  
         if (regs_is_unrecoverable(regs))
                 unrecoverable_exception(regs);
-       /*
-        * CT_WARN_ON comes here via program_check_exception, so avoid
-        * recursion.
-        *
-        * Skip the assertion on PMIs on 64e to work around a problem caused
-        * by NMI PMIs incorrectly taking this interrupt return path, it's
-        * possible for this to hit after interrupt exit to user switches
-        * context to user. See also the comment in the performance monitor
-        * handler in exceptions-64e.S
-        */
-       if (!IS_ENABLED(CONFIG_PPC_BOOK3E_64) &&
-           TRAP(regs) != INTERRUPT_PROGRAM &&
-           TRAP(regs) != INTERRUPT_PERFMON)
-               CT_WARN_ON(ct_state() == CT_STATE_USER);
  
         kuap = kuap_get_and_assert_locked();
  
@@ -316,7 +302,6 @@ notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
  #endif
  
         trace_hardirqs_off();
-       user_exit_irqoff();
         account_cpu_user_entry();
  
         BUG_ON(!user_mode(regs));
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index df1c9a8d62bc..e041b187b1b7 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -20,6 +20,9 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
         syscall_fn f;
  
         add_random_kstack_offset();
+
+       local_irq_disable();
+       user_enter_irqoff();
         r0 = syscall_enter_from_user_mode(regs, r0);
  
         if (unlikely(r0 >= NR_syscalls)) {

