Return-Path: <linuxppc-dev+bounces-8243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BB6AA6C1D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 10:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpk0f2tlzz2yKq;
	Fri,  2 May 2025 18:02:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746172930;
	cv=none; b=C8zHuJkHpnuBz3sQRysHKwyTwyRmrth5G/MS7VLKFdWRKf6izaqM2yHvZ8XSxcggohFiopuYtTCCYtZvzqb/FPZvGIyjZNNpS+dPXbe69MGxI13A3K61zeUtGsMOORp+5yZnTV7RVp+jZBpM/Gi1KKneMiCn70PUTQf3bf+pc7uCTFqqsYU5mJSdzYGYzEj/wUNhFfyFz+vAzDG9cCNbyjsSfm62jctXRuu95y+BimV1DnUyPCQH95Er9fKa/TfLeEwq3DequvIfdXq+6psRyY2ADvMnVO7x0qPE80VhX8Bx9chG1pLZZSictBPELCLTqHsVewMwnTBjfJBV3zQGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746172930; c=relaxed/relaxed;
	bh=+DgrAenLIqibn7YwJP/D1qE6uQ4zKoKRDHZDHN9X78M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2Cg2ov6c3GSz+euWla3n6LayXp4lc4eZfjIaG+8okHqw8Ih/m1qlpqBA83AVz+fspG+kFUve1eHprcVFoO6dNmr4qWA4+SKRs+1/q1MtzQvmDwy6b40VQT6AIpkf0LIk9i+wiaBKvIWAuPbow/5k4Gw2AqitObsMzqZM167MCUN3R+7XKj4IexRb0isVyYhGWK4akoUGkd9LQD9oXn1lFdP7W4/GRlv3MERKT6E1cA3OrD1dGrQn5ItLbm8lPv5F7xhlc8sCcXNqcG4gBTKQNjXslpt2UC8GDY8TejKy5wV4r0vuuZnQc20X+ssNItIymXe9c2NIyLuhwRD60iysg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rDiDpc5x; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rDiDpc5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zpk0d2Q7xz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:02:08 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541NkC1H027840;
	Fri, 2 May 2025 08:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=+DgrAenLIqibn7YwJP/D1qE6uQ4zKo
	KRDHZDHN9X78M=; b=rDiDpc5xNh2jdVO/mYCTavNozcInq/byT/5YLWPuhHRW/+
	AAvgID2YH2ThW8gTuSkChyAJMYX/4VwzpMpPTATFEACmFxnbZ0sqoMzN0+UMdOIY
	Yl/oc3L3jzwIWDLEXjl4RSMzm0wbcrWgDMZwEM3hj3bUfxuaFe62wyHKynQfxl8C
	18vWkeODwgYxebuWM9cFeQu1Cb1tQYQ1+GyMG2R+/CevsHN99W/9nphJk4pKWQ7u
	vNw3WH2aL9r+Imksu4PVv3uyEyIYKtHnVZw96K7zLc3Z5YXeQ3G+L0u0aEGxWvhV
	2lf2EgvsNGwzRbi/teUo62i+buzpfwjgQWP+2Awg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46cjx09jd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 08:01:38 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54281bW2004328;
	Fri, 2 May 2025 08:01:37 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46cjx09jcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 08:01:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5427HJwH001830;
	Fri, 2 May 2025 08:01:37 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469ban0vmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 08:01:37 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54281Xn435062186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 08:01:33 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2196A20043;
	Fri,  2 May 2025 08:01:33 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F4B620040;
	Fri,  2 May 2025 08:01:28 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.124.221.245])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  2 May 2025 08:01:28 +0000 (GMT)
Date: Fri, 2 May 2025 13:31:26 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        neeraj.upadhyay@kernel.org, vschneid@redhat.com, tglx@linutronix.de,
        frederic@kernel.org, ankur.a.arora@oracle.com, bigeasy@linutronix.de,
        kees@kernel.org, oleg@redhat.com, peterz@infradead.org,
        tzimmermann@suse.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mcgrof@kernel.org, rppt@kernel.org, atrajeev@linux.vnet.ibm.com,
        anjalik@linux.ibm.com, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC V1 6/6] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <agci4d2ojrbeses2ysvdzk22r7whmoy2ucy3cavklsremhnrcl@fnnklvnyctdc>
References: <20250428152225.66044-2-mchauras@linux.ibm.com>
 <20250428152225.66044-9-mchauras@linux.ibm.com>
 <85084257-a186-430c-b46d-2fca10d17b8f@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85084257-a186-430c-b46d-2fca10d17b8f@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sqCBxGztOf_sGrOkddO4tCiH5JB4a8H5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA1OCBTYWx0ZWRfX8Erwh0XnbGWc 2Gp4tee98KNtP1AeI/HR7yFkD3/R4tt7jl9pSF1ueOOe9vyEYFuhm3F8/DdXQMg9Kp1QynTogGd Qe8QF1VDXtD/mJFXNsCuu27+F4gQhMBbNq6d8ZsYylVrMXBeMmh9qKA4OeeNLf2OkgpAJZpROTW
 NnXGHEoHU3bBBH6Pe5PFsPK52Bje9NupIWUhCqHNjgF/tH2A3GWGjlNuCa47AMWZhrScg3Vrh4Q oCZOFTnbxttCjzrXyRyP30UHL2nT2kE7fhnaKz4g7PdSTrwC90FXggQdJtsMMn2BYXTTPhwAPr+ UK/xSZN1QrWPEzwPHiuX0iTZckeMaR8d7cb67gxJvuw/mb8j3HWlUzbK+TY6ZTJQEkRZA4YY1uM
 92xb/Ydz0aPEBnSrPMtIUVNWRqa9kE2sZrlxerkU7oNbYnuzSarU+vbyIYdEsPWgOiDVh0V3
X-Authority-Analysis: v=2.4 cv=YqMPR5YX c=1 sm=1 tr=0 ts=68147be2 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=FOtWzUBjwl5FsU5dkRsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: Jn693d3Ub26GK-aLofmrX4xu93Y-VLvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020058
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 29, 2025 at 11:41:09AM +0530, Shrikanth Hegde wrote:
> 
> 
> On 4/28/25 20:52, Mukesh Kumar Chaurasiya wrote:
> > Enable the syscall entry and exit path from generic framework.
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Hi Mukesh. Thanks for working on this. Trying to go through it.
> 
> > ---
> >   arch/powerpc/Kconfig                |   1 +
> >   arch/powerpc/kernel/interrupt.c     |  46 +++++++----
> >   arch/powerpc/kernel/ptrace/ptrace.c | 103 ------------------------
> >   arch/powerpc/kernel/signal.c        |   8 +-
> >   arch/powerpc/kernel/syscall.c       | 117 +---------------------------
> >   5 files changed, 38 insertions(+), 237 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 6722625a406a0..45b70ccf7c89e 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -202,6 +202,7 @@ config PPC
> >   	select GENERIC_CPU_AUTOPROBE
> >   	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
> >   	select GENERIC_EARLY_IOREMAP
> > +	select GENERIC_ENTRY
> 
> IMHO this should be enabled after irqentry_* is supported too.
>
Yeah, it will be done after irq is supported. I did this just for the sake of syscall.
> >   	select GENERIC_GETTIMEOFDAY
> >   	select GENERIC_IDLE_POLL_SETUP
> >   	select GENERIC_IOREMAP
> > diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> > index 7f31f3fb9c1d8..8731064631de0 100644
> > --- a/arch/powerpc/kernel/interrupt.c
> > +++ b/arch/powerpc/kernel/interrupt.c
> > @@ -1,6 +1,7 @@
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >   #include <linux/context_tracking.h>
> > +#include <linux/entry-common.h>
> >   #include <linux/err.h>
> >   #include <linux/compat.h>
> >   #include <linux/rseq.h>
> > @@ -163,15 +164,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
> >   	unsigned long ret = 0;
> >   	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
> > -	CT_WARN_ON(ct_state() == CT_STATE_USER);
> > -
> >   	kuap_assert_locked();
> >   	regs->result = r3;
> > -	/* Check whether the syscall is issued inside a restartable sequence */
> > -	rseq_syscall(regs);
> > -
> >   	ti_flags = read_thread_flags();
> >   	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
> > @@ -192,13 +188,27 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
> >   	}
> >   	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> > -		do_syscall_trace_leave(regs);
> >   		ret |= _TIF_RESTOREALL;
> >   	}
> > -	local_irq_disable();
> > -	ret = interrupt_exit_user_prepare_main(ret, regs);
> 
> This loop i dont understand why.
>
This is if there are any interrupts to process.
> > +again:
> > +	syscall_exit_to_user_mode(regs);
> 
> exit_to_user_mode also calls user_enter_irqoff.
> so below user_enter_irqoff may be a nop or wrong.
Oh yeah, i'll fix this in next version.
> 
> also, syscall_exit_to_user_mode disables local interrupts first.
> 
> is local_irq_enable fixing something here?
>
It just enables irq for a short while so we can receive interrupts.
> > +
> > +	user_enter_irqoff();
> > +	if (!prep_irq_for_enabled_exit(true)) {
> > +		user_exit_irqoff();
> > +		local_irq_enable();
> > +		local_irq_disable();
> > +		goto again;
> > +	}
> > +
> > +	/* Restore user access locks last */
> > +	kuap_user_restore(regs);
> > +	if (unlikely((local_paca->generic_fw_flags & GFW_RESTORE_ALL) == GFW_RESTORE_ALL)) {
> > +		ret |= _TIF_RESTOREALL;
> > +		local_paca->generic_fw_flags &= ~GFW_RESTORE_ALL;
> > +	}
> >   #ifdef CONFIG_PPC64
> >   	regs->exit_result = ret;
> >   #endif
> > @@ -209,6 +219,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
> >   #ifdef CONFIG_PPC64
> >   notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *regs)
> >   {
> > +	unsigned long ret = 0;
> >   	/*
> >   	 * This is called when detecting a soft-pending interrupt as well as
> >   	 * an alternate-return interrupt. So we can't just have the alternate
> > @@ -222,14 +233,23 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
> >   #ifdef CONFIG_PPC_BOOK3S_64
> >   	set_kuap(AMR_KUAP_BLOCKED);
> >   #endif
> > +again:
> > +	syscall_exit_to_user_mode(regs);
> > -	trace_hardirqs_off();
> > -	user_exit_irqoff();
> > -	account_cpu_user_entry();
> > +	user_enter_irqoff();
> > +	if (!prep_irq_for_enabled_exit(true)) {
> > +		user_exit_irqoff();
> > +		local_irq_enable();
> > +		local_irq_disable();
> > +		goto again;
> > +	}
> > -	BUG_ON(!user_mode(regs));
> > +	if (unlikely((local_paca->generic_fw_flags & GFW_RESTORE_ALL) == GFW_RESTORE_ALL)) {
> > +		ret = _TIF_RESTOREALL;
> > +		local_paca->generic_fw_flags &= ~GFW_RESTORE_ALL;
> > +	}
> > -	regs->exit_result = interrupt_exit_user_prepare_main(regs->exit_result, regs);
> > +	regs->exit_result |= ret;
> >   	return regs->exit_result;
> >   }
> > diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> > index c6997df632873..2a2b0b94a3eaa 100644
> > --- a/arch/powerpc/kernel/ptrace/ptrace.c
> > +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> > @@ -21,9 +21,6 @@
> >   #include <asm/switch_to.h>
> >   #include <asm/debug.h>
> > -#define CREATE_TRACE_POINTS
> > -#include <trace/events/syscalls.h>
> > -
> >   #include "ptrace-decl.h"
> >   /*
> > @@ -233,106 +230,6 @@ static int do_seccomp(struct pt_regs *regs)
> >   static inline int do_seccomp(struct pt_regs *regs) { return 0; }
> >   #endif /* CONFIG_SECCOMP */
> > -/**
> > - * do_syscall_trace_enter() - Do syscall tracing on kernel entry.
> > - * @regs: the pt_regs of the task to trace (current)
> > - *
> > - * Performs various types of tracing on syscall entry. This includes seccomp,
> > - * ptrace, syscall tracepoints and audit.
> > - *
> > - * The pt_regs are potentially visible to userspace via ptrace, so their
> > - * contents is ABI.
> > - *
> > - * One or more of the tracers may modify the contents of pt_regs, in particular
> > - * to modify arguments or even the syscall number itself.
> > - *
> > - * It's also possible that a tracer can choose to reject the system call. In
> > - * that case this function will return an illegal syscall number, and will put
> > - * an appropriate return value in regs->r3.
> > - *
> > - * Return: the (possibly changed) syscall number.
> > - */
> > -long do_syscall_trace_enter(struct pt_regs *regs)
> > -{
> > -	u32 flags;
> > -
> > -	flags = read_thread_flags() & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
> > -
> > -	if (flags) {
> > -		int rc = ptrace_report_syscall_entry(regs);
> > -
> > -		if (unlikely(flags & _TIF_SYSCALL_EMU)) {
> > -			/*
> > -			 * A nonzero return code from
> > -			 * ptrace_report_syscall_entry() tells us to prevent
> > -			 * the syscall execution, but we are not going to
> > -			 * execute it anyway.
> > -			 *
> > -			 * Returning -1 will skip the syscall execution. We want
> > -			 * to avoid clobbering any registers, so we don't goto
> > -			 * the skip label below.
> > -			 */
> > -			return -1;
> > -		}
> > -
> > -		if (rc) {
> > -			/*
> > -			 * The tracer decided to abort the syscall. Note that
> > -			 * the tracer may also just change regs->gpr[0] to an
> > -			 * invalid syscall number, that is handled below on the
> > -			 * exit path.
> > -			 */
> > -			goto skip;
> > -		}
> > -	}
> > -
> > -	/* Run seccomp after ptrace; allow it to set gpr[3]. */
> > -	if (do_seccomp(regs))
> > -		return -1;
> > -
> > -	/* Avoid trace and audit when syscall is invalid. */
> > -	if (regs->gpr[0] >= NR_syscalls)
> > -		goto skip;
> > -
> > -	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> > -		trace_sys_enter(regs, regs->gpr[0]);
> > -
> > -	if (!is_32bit_task())
> > -		audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
> > -				    regs->gpr[5], regs->gpr[6]);
> > -	else
> > -		audit_syscall_entry(regs->gpr[0],
> > -				    regs->gpr[3] & 0xffffffff,
> > -				    regs->gpr[4] & 0xffffffff,
> > -				    regs->gpr[5] & 0xffffffff,
> > -				    regs->gpr[6] & 0xffffffff);
> > -
> > -	/* Return the possibly modified but valid syscall number */
> > -	return regs->gpr[0];
> > -
> > -skip:
> > -	/*
> > -	 * If we are aborting explicitly, or if the syscall number is
> > -	 * now invalid, set the return value to -ENOSYS.
> > -	 */
> > -	regs->gpr[3] = -ENOSYS;
> > -	return -1;
> > -}
> > -
> > -void do_syscall_trace_leave(struct pt_regs *regs)
> > -{
> > -	int step;
> > -
> > -	audit_syscall_exit(regs);
> > -
> > -	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> > -		trace_sys_exit(regs, regs->result);
> > -
> > -	step = test_thread_flag(TIF_SINGLESTEP);
> > -	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
> > -		ptrace_report_syscall_exit(regs, step);
> > -}
> > -
> >   void __init pt_regs_check(void);
> >   /*
> > diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> > index 719930cf4ae1f..8e1a1b26b5eae 100644
> > --- a/arch/powerpc/kernel/signal.c
> > +++ b/arch/powerpc/kernel/signal.c
> > @@ -6,6 +6,7 @@
> >    *    Extracted from signal_32.c and signal_64.c
> >    */
> > +#include <linux/entry-common.h>
> >   #include <linux/resume_user_mode.h>
> >   #include <linux/signal.h>
> >   #include <linux/uprobes.h>
> > @@ -22,11 +23,6 @@
> >   #include "signal.h"
> > -/* This will be removed */
> > -#ifdef CONFIG_GENERIC_ENTRY
> > -#include <linux/entry-common.h>
> > -#endif /* CONFIG_GENERIC_ENTRY */
> > -
> >   #ifdef CONFIG_VSX
> >   unsigned long copy_fpr_to_user(void __user *to,
> >   			       struct task_struct *task)
> > @@ -374,11 +370,9 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
> >   				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
> >   }
> > -#ifdef CONFIG_GENERIC_ENTRY
> >   void arch_do_signal_or_restart(struct pt_regs *regs)
> >   {
> >   	BUG_ON(regs != current->thread.regs);
> >   	local_paca->generic_fw_flags |= GFW_RESTORE_ALL;
> >   	do_signal(current);
> >   }
> > -#endif /* CONFIG_GENERIC_ENTRY */
> > diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> > index 9f03a6263fb41..66fd6ca4462b0 100644
> > --- a/arch/powerpc/kernel/syscall.c
> > +++ b/arch/powerpc/kernel/syscall.c
> > @@ -3,6 +3,7 @@
> >   #include <linux/compat.h>
> >   #include <linux/context_tracking.h>
> >   #include <linux/randomize_kstack.h>
> > +#include <linux/entry-common.h>
> >   #include <asm/interrupt.h>
> >   #include <asm/kup.h>
> > @@ -21,121 +22,9 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
> >   	kuap_lock();
> >   	add_random_kstack_offset();
> > +	r0 = syscall_enter_from_user_mode(regs, r0);
> > -	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> > -		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
> > -
> > -	trace_hardirqs_off(); /* finish reconciling */
> > -
> > -	CT_WARN_ON(ct_state() == CT_STATE_KERNEL);
> > -	user_exit_irqoff();
> > -
> > -	BUG_ON(regs_is_unrecoverable(regs));
> > -	BUG_ON(!user_mode(regs));
> > -	BUG_ON(regs_irqs_disabled(regs));
> > -
> > -#ifdef CONFIG_PPC_PKEY
> > -	if (mmu_has_feature(MMU_FTR_PKEY)) {
> > -		unsigned long amr, iamr;
> > -		bool flush_needed = false;
> > -		/*
> > -		 * When entering from userspace we mostly have the AMR/IAMR
> > -		 * different from kernel default values. Hence don't compare.
> > -		 */
> > -		amr = mfspr(SPRN_AMR);
> > -		iamr = mfspr(SPRN_IAMR);
> > -		regs->amr  = amr;
> > -		regs->iamr = iamr;
> > -		if (mmu_has_feature(MMU_FTR_KUAP)) {
> > -			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
> > -			flush_needed = true;
> > -		}
> > -		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
> > -			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
> > -			flush_needed = true;
> > -		}
> > -		if (flush_needed)
> > -			isync();
> > -	} else
> > -#endif
> > -		kuap_assert_locked();
> > -
> > -	booke_restore_dbcr0();
> > -
> > -	account_cpu_user_entry();
> > -
> > -	account_stolen_time();
> > -
> > -	/*
> > -	 * This is not required for the syscall exit path, but makes the
> > -	 * stack frame look nicer. If this was initialised in the first stack
> > -	 * frame, or if the unwinder was taught the first stack frame always
> > -	 * returns to user with IRQS_ENABLED, this store could be avoided!
> > -	 */
> > -	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
> > -
> > -	/*
> > -	 * If system call is called with TM active, set _TIF_RESTOREALL to
> > -	 * prevent RFSCV being used to return to userspace, because POWER9
> > -	 * TM implementation has problems with this instruction returning to
> > -	 * transactional state. Final register values are not relevant because
> > -	 * the transaction will be aborted upon return anyway. Or in the case
> > -	 * of unsupported_scv SIGILL fault, the return state does not much
> > -	 * matter because it's an edge case.
> > -	 */
> > -	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> > -			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
> > -		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
> > -
> > -	/*
> > -	 * If the system call was made with a transaction active, doom it and
> > -	 * return without performing the system call. Unless it was an
> > -	 * unsupported scv vector, in which case it's treated like an illegal
> > -	 * instruction.
> > -	 */
> > -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > -	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
> > -	    !trap_is_unsupported_scv(regs)) {
> > -		/* Enable TM in the kernel, and disable EE (for scv) */
> > -		hard_irq_disable();
> > -		mtmsr(mfmsr() | MSR_TM);
> > -
> > -		/* tabort, this dooms the transaction, nothing else */
> > -		asm volatile(".long 0x7c00071d | ((%0) << 16)"
> > -				:: "r"(TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT));
> > -
> > -		/*
> > -		 * Userspace will never see the return value. Execution will
> > -		 * resume after the tbegin. of the aborted transaction with the
> > -		 * checkpointed register state. A context switch could occur
> > -		 * or signal delivered to the process before resuming the
> > -		 * doomed transaction context, but that should all be handled
> > -		 * as expected.
> > -		 */
> > -		return -ENOSYS;
> > -	}
> > -#endif // CONFIG_PPC_TRANSACTIONAL_MEM
> > -
> > -	local_irq_enable();
> > -
> > -	if (unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)) {
> > -		if (unlikely(trap_is_unsupported_scv(regs))) {
> > -			/* Unsupported scv vector */
> > -			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
> > -			return regs->gpr[3];
> > -		}
> > -		/*
> > -		 * We use the return value of do_syscall_trace_enter() as the
> > -		 * syscall number. If the syscall was rejected for any reason
> > -		 * do_syscall_trace_enter() returns an invalid syscall number
> > -		 * and the test against NR_syscalls will fail and the return
> > -		 * value to be used is in regs->gpr[3].
> > -		 */
> > -		r0 = do_syscall_trace_enter(regs);
> > -		if (unlikely(r0 >= NR_syscalls))
> > -			return regs->gpr[3];
> > -
> > -	} else if (unlikely(r0 >= NR_syscalls)) {
> > +	if (unlikely(r0 >= NR_syscalls)) {
> >   		if (unlikely(trap_is_unsupported_scv(regs))) {
> >   			/* Unsupported scv vector */
> >   			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
> 

