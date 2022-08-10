Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594BC58EA7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 12:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2mWh3m8gz3br0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 20:34:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gS5SIqKX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gS5SIqKX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2mVv1GJbz2xGr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 20:33:26 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27A9cLqs028109;
	Wed, 10 Aug 2022 10:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=px4Q1/NSQUmCE2qMo3n/qF8TtW+1nQLNTM7TzvTdtKg=;
 b=gS5SIqKXVeFFBY4yr3UdIraNmO4zkwwnjf0P7bZEek+B2sfFquyurs+nB+zPBdPuYwf3
 lJTxIHHntWWVgo5hUcsCF7PAmcgsJ1YWVa4u5Ms2EtG01mxnZdujYty8hJNhxnWznsMk
 hFs+WqZlx35fsxNgchSkcARYZRPC7FP53oYckeIJbQIYRpwzeg2M/JopDBNRNrM0IW/D
 GtdUffLXcDBAWViGt9FB83iY3msoss8k3dCJikKVFlDELHBHWJlCX7hzrTLGZKDDJJ5L
 iGF1HKes+mHnInqhNnOvY4zx64/zyx6YM71NqVDTxSj00Q9Eifvg1eYyi4myXxCV2WF8 Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv6dcre8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Aug 2022 10:33:16 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27AAQLJh021643;
	Wed, 10 Aug 2022 10:33:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv6dcre0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Aug 2022 10:33:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27AAMJjN014858;
	Wed, 10 Aug 2022 10:33:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 3huww2gq2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Aug 2022 10:33:11 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27AAX8V632112950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 10:33:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0074A4065;
	Wed, 10 Aug 2022 10:33:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24F71A4054;
	Wed, 10 Aug 2022 10:33:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 10 Aug 2022 10:33:08 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 75611600E5;
	Wed, 10 Aug 2022 20:32:59 +1000 (AEST)
Message-ID: <5a5bcd3e8211d3195a9fa185ef095df3c4619b5b.camel@linux.ibm.com>
Subject: Re: [PATCH v2 10/14] powerpc: Provide syscall wrapper
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 10 Aug 2022 20:32:58 +1000
In-Reply-To: <20220725063024.120674-1-rmclure@linux.ibm.com>
References: <20220725063024.120674-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CsZDg2hp-rr4XOscps5DAgPhb5v8W9_q
X-Proofpoint-GUID: H1gb39K6FecEvXlEqV1MElGJ-q-1iZBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_05,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 mlxlogscore=748 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100032
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
Cc: christophe.leroy@c-s.fr, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:30 +1000, Rohan McLure wrote:
> Implement syscall wrapper as per s390, x86, arm64. When enabled
> cause handlers to accept parameters from a stack frame rather than
> from user scratch register state. This allows for user registers to
> be
> safely cleared in order to reduce caller influence on speculation
> within syscall routine. The wrapper is a macro that emits syscall
> handler symbols that call into the target handler, obtaining its
> parameters from a struct pt_regs on the stack.
> 
> As registers are already saved to the stack prior to calling
> system_call_exception, it appears that this function is executed more
> efficiently with the new stack-pointer convention than with
> parameters
> passed by registers, avoiding the allocation of a stack frame for
> this
> method. On a 32-bit system, we see >20% performance increases on the
> null_syscall microbenchmark, and on a Power 8 the performance gains
> amortise the cost of clearing and restoring registers which is
> implemented at the end of this series, seeing final result of ~5.6%
> performance improvement on null_syscall.
> 
> Syscalls are wrapped in this fashion on all platforms except for the
> Cell processor as this commit does not provide SPU support. This can
> be
> quickly fixed in a successive patch, but requires spu_sys_callback to
> allocate a pt_regs structure to satisfy the wrapped calling
> convention.
> 
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

[This patch needs some trivial changes to rebase on top of commit
1547db7d1f44 ("powerpc: Move system_call_exception() to syscall.c")]

> ---
> V1 -> V2: Generate prototypes for symbols produced by the wrapper.
> ---

Thanks for fixing this!

>  arch/powerpc/Kconfig                       |  1 +
>  arch/powerpc/include/asm/interrupt.h       |  3 +-
>  arch/powerpc/include/asm/syscall.h         |  4 +
>  arch/powerpc/include/asm/syscall_wrapper.h | 94 ++++++++++++++++++++
>  arch/powerpc/include/asm/syscalls.h        | 25 +++++-
>  arch/powerpc/kernel/entry_32.S             |  6 +-
>  arch/powerpc/kernel/interrupt.c            | 31 +++----
>  arch/powerpc/kernel/interrupt_64.S         | 30 +++----
>  arch/powerpc/kernel/systbl.c               |  2 +
>  arch/powerpc/kernel/vdso.c                 |  2 +
>  10 files changed, 156 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 26331cdd3642..447bd34b5b87 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>         select ARCH_HAS_STRICT_KERNEL_RWX       if (PPC_BOOK3S ||
> PPC_8xx || 40x) && !HIBERNATION
>         select ARCH_HAS_STRICT_KERNEL_RWX       if FSL_BOOKE &&
> !HIBERNATION && !RANDOMIZE_BASE
>         select ARCH_HAS_STRICT_MODULE_RWX       if
> ARCH_HAS_STRICT_KERNEL_RWX
> +       select ARCH_HAS_SYSCALL_WRAPPER         if !SPU_BASE
>         select ARCH_HAS_TICK_BROADCAST          if
> GENERIC_CLOCKEVENTS_BROADCAST
>         select ARCH_HAS_UACCESS_FLUSHCACHE
>         select ARCH_HAS_UBSAN_SANITIZE_ALL
> diff --git a/arch/powerpc/include/asm/interrupt.h
> b/arch/powerpc/include/asm/interrupt.h
> index 8069dbc4b8d1..3f9cad81585c 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -665,8 +665,7 @@ static inline void
> interrupt_cond_local_irq_enable(struct pt_regs *regs)
>                 local_irq_enable();
>  }
>  
> -long system_call_exception(long r3, long r4, long r5, long r6, long
> r7, long r8,
> -                          unsigned long r0, struct pt_regs *regs);
> +long system_call_exception(unsigned long r0, struct pt_regs *regs);
>  notrace unsigned long syscall_exit_prepare(unsigned long r3, struct
> pt_regs *regs, long scv);
>  notrace unsigned long interrupt_exit_user_prepare(struct pt_regs
> *regs);
>  notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs
> *regs);
> diff --git a/arch/powerpc/include/asm/syscall.h
> b/arch/powerpc/include/asm/syscall.h
> index d2a8dfd5de33..3dd36c5e334a 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -14,8 +14,12 @@
>  #include <linux/sched.h>
>  #include <linux/thread_info.h>
>  
> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +typedef long (*syscall_fn)(const struct pt_regs *);
> +#else
>  typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned
> long,
>                            unsigned long, unsigned long, unsigned
> long);
> +#endif
>  
>  /* ftrace syscalls requires exporting the sys_call_table */
>  extern const syscall_fn sys_call_table[];
> diff --git a/arch/powerpc/include/asm/syscall_wrapper.h
> b/arch/powerpc/include/asm/syscall_wrapper.h
> new file mode 100644
> index 000000000000..ebeffcb08d3d
> --- /dev/null
> +++ b/arch/powerpc/include/asm/syscall_wrapper.h
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * syscall_wrapper.h - powerpc specific wrappers to syscall
> definitions
> + *
> + * Based on arch/{x86,arm64}/include/asm/syscall_wrapper.h
> + */
> +
> +#ifndef __ASM_SYSCALL_WRAPPER_H
> +#define __ASM_SYSCALL_WRAPPER_H
> +
> +struct pt_regs;
> +
> +#define SC_POWERPC_REGS_TO_ARGS(x,
> ...)                                \
> +       __MAP(x,__SC_ARGS                                       \
> +             ,,regs->gpr[3],,regs->gpr[4],,regs->gpr[5]        \
> +             ,,regs->gpr[6],,regs->gpr[7],,regs->gpr[8])
> +
> +#ifdef CONFIG_COMPAT
> +
> +#define COMPAT_SYSCALL_DEFINEx(x, name,
> ...)                                           \
> +       asmlinkage long __powerpc_compat_sys##name(const struct
> pt_regs *regs);         \
> +       ALLOW_ERROR_INJECTION(__powerpc_compat_sys##name,
> ERRNO);                       \
> +       static long
> __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));              \
> +       static inline long
> __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));       \
> +       asmlinkage long __powerpc_compat_sys##name(const struct
> pt_regs *regs)          \
> +       {                                                            
>                    \
> +               return
> __se_compat_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));   \
> +       }                                                            
>                    \
> +       static long
> __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))               \
> +       {                                                            
>                    \
> +               return
> __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));        \
> +       }                                                            
>                    \
> +       static inline long
> __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
> +
> +#define
> COMPAT_SYSCALL_DEFINE0(sname)                                        
>           \
> +       asmlinkage long __powerpc_compat_sys_##sname(const struct
> pt_regs *__unused);   \
> +       ALLOW_ERROR_INJECTION(__powerpc_compat_sys_##sname,
> ERRNO);                     \
> +       asmlinkage long __powerpc_compat_sys_##sname(const struct
> pt_regs *__unused)
> +
> +#define
> COND_SYSCALL_COMPAT(name)                                            
>           \
> +       long __powerpc_compat_sys_##name(const struct pt_regs
> *regs);                   \
> +       asmlinkage long __weak __powerpc_compat_sys_##name(const
> struct pt_regs *regs)  \
> +       {                                                            
>                    \
> +               return
> sys_ni_syscall();                                                \
> +       }
> +#define COMPAT_SYS_NI(name) \
> +       SYSCALL_ALIAS(__powerpc_compat_sys_##name,
> sys_ni_posix_timers);
> +
> +#endif /* CONFIG_COMPAT */
> +
> +#define __SYSCALL_DEFINEx(x, name,
> ...)                                                \
> +       asmlinkage long __powerpc_sys##name(const struct pt_regs
> *regs);        \
> +       ALLOW_ERROR_INJECTION(__powerpc_sys##name,
> ERRNO);                      \
> +       long
> sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));                         \
> +       static long
> __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));             \
> +       static inline long
> __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));      \
> +       asmlinkage long __powerpc_sys##name(const struct pt_regs
> *regs)         \
> +       {                                                            
>            \
> +               return
> __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));  \
> +       }                                                            
>            \
> +       long
> sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))                          \
> +       {                                                            
>            \
> +               return
> __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));          \
> +       }                                                            
>            \
> +       static long
> __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))              \
> +       {                                                            
>            \
> +               long ret =
> __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));      \
> +               __MAP(x,__SC_TEST,__VA_ARGS__);                      
>            \
> +               __PROTECT(x,
> ret,__MAP(x,__SC_ARGS,__VA_ARGS__));               \
> +               return
> ret;                                                     \
> +       }                                                            
>            \
> +       static inline long
> __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
> +
> +#define
> SYSCALL_DEFINE0(sname)                                               
>   \
> +       SYSCALL_METADATA(_##sname,
> 0);                                          \
> +       long
> sys_##sname(void);                                                 \
> +       asmlinkage long __powerpc_sys_##sname(const struct pt_regs
> *__unused);  \
> +       ALLOW_ERROR_INJECTION(__powerpc_sys_##sname,
> ERRNO);                    \
> +       long
> sys_##sname(void)                                                  \
> +       {                                                            
>            \
> +               return
> __powerpc_sys_##sname(NULL);                             \
> +       }                                                            
>            \
> +       asmlinkage long __powerpc_sys_##sname(const struct pt_regs
> *__unused)
> +
> +#define
> COND_SYSCALL(name)                                                   
>   \
> +       long __powerpc_sys_##name(const struct pt_regs
> *regs);                  \
> +       asmlinkage long __weak __powerpc_sys_##name(const struct
> pt_regs *regs) \
> +       {                                                            
>            \
> +               return
> sys_ni_syscall();                                        \
> +       }
> +
> +#define SYS_NI(name) SYSCALL_ALIAS(__powerpc_sys_##name,
> sys_ni_posix_timers);
> +
> +#endif /* __ASM_SYSCALL_WRAPPER_H */
> diff --git a/arch/powerpc/include/asm/syscalls.h
> b/arch/powerpc/include/asm/syscalls.h
> index fbeab8e88c5e..7b66f9fdfa04 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -15,6 +15,12 @@
>  #include <asm/unistd.h>
>  #include <asm/ucontext.h>
>  
> +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +asmlinkage long sys_ni_syscall(void);
> +#else
> +asmlinkage long sys_ni_syscall(const struct pt_regs *regs);
> +#endif
> +
>  struct rtas_args;
>  
>  #ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> @@ -24,7 +30,6 @@ struct rtas_args;
>   */
>  
>  asmlinkage long sys_rtas(struct rtas_args __user *uargs);
> -asmlinkage long sys_ni_syscall(void);
>  
>  #ifdef CONFIG_PPC64
>  asmlinkage long sys_ppc64_personality(unsigned long personality);
> @@ -95,6 +100,24 @@ asmlinkage long
> compat_sys_ppc_sync_file_range2(int fd, unsigned int flags,
>                                                 unsigned int
> nbytes2);
>  #endif /* CONFIG_COMPAT */
>  
> +#else
> +
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)      __SYSCALL(nr,
> native)
> +#define __SYSCALL(nr, entry) \
> +       asmlinkage long __powerpc_##entry(const struct pt_regs
> *regs);
> +
> +#ifdef CONFIG_PPC64
> +#include <asm/syscall_table_64.h>
> +#else
> +#include <asm/syscall_table_32.h>
> +#endif /* CONFIG_PPC64 */
> +
> +#ifdef CONFIG_COMPAT
> +#undef __SYSCALL_WITH_COMPAT
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)      __SYSCALL(nr,
> compat)
> +#include <asm/syscall_table_32.h>
> +#endif /* CONFIG_COMPAT */
> +
>  #endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
>  
>  #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/kernel/entry_32.S
> b/arch/powerpc/kernel/entry_32.S
> index 1d599df6f169..be66040f7708 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -121,9 +121,9 @@ transfer_to_syscall:
>         SAVE_NVGPRS(r1)
>         kuep_lock
>  
> -       /* Calling convention has r9 = orig r0, r10 = regs */
> -       addi    r10,r1,STACK_FRAME_OVERHEAD
> -       mr      r9,r0
> +       /* Calling convention has r3 = orig r0, r4 = regs */
> +       addi    r4,r1,STACK_FRAME_OVERHEAD
> +       mr      r3,r0
>         bl      system_call_exception
>  
>  ret_from_syscall:
> diff --git a/arch/powerpc/kernel/interrupt.c
> b/arch/powerpc/kernel/interrupt.c
> index 62e636e0f684..faa94a7e1edc 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -72,15 +72,13 @@ static notrace __always_inline bool
> prep_irq_for_enabled_exit(bool restartable)
>  }
>  
>  /* Has to run notrace because it is entered not completely
> "reconciled" */
> -notrace long system_call_exception(long r3, long r4, long r5,
> -                                  long r6, long r7, long r8,
> -                                  unsigned long r0, struct pt_regs
> *regs)
> +notrace long system_call_exception(unsigned long r0, struct pt_regs
> *regs)
>  {
>         syscall_fn f;
>  
>         kuap_lock();
>  
> -       regs->orig_gpr3 = r3;
> +       regs->orig_gpr3 = regs->gpr[3];
>  
>         if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>                 BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
> @@ -194,12 +192,6 @@ notrace long system_call_exception(long r3, long
> r4, long r5,
>                 r0 = do_syscall_trace_enter(regs);
>                 if (unlikely(r0 >= NR_syscalls))
>                         return regs->gpr[3];
> -               r3 = regs->gpr[3];
> -               r4 = regs->gpr[4];
> -               r5 = regs->gpr[5];
> -               r6 = regs->gpr[6];
> -               r7 = regs->gpr[7];
> -               r8 = regs->gpr[8];
>  
>         } else if (unlikely(r0 >= NR_syscalls)) {
>                 if (unlikely(trap_is_unsupported_scv(regs))) {
> @@ -216,18 +208,23 @@ notrace long system_call_exception(long r3,
> long r4, long r5,
>         if (unlikely(is_compat_task())) {
>                 f = (void *)compat_sys_call_table[r0];
>  
> -               r3 &= 0x00000000ffffffffULL;
> -               r4 &= 0x00000000ffffffffULL;
> -               r5 &= 0x00000000ffffffffULL;
> -               r6 &= 0x00000000ffffffffULL;
> -               r7 &= 0x00000000ffffffffULL;
> -               r8 &= 0x00000000ffffffffULL;
> +               regs->gpr[3] &= 0x00000000ffffffffULL;
> +               regs->gpr[4] &= 0x00000000ffffffffULL;
> +               regs->gpr[5] &= 0x00000000ffffffffULL;
> +               regs->gpr[6] &= 0x00000000ffffffffULL;
> +               regs->gpr[7] &= 0x00000000ffffffffULL;
> +               regs->gpr[8] &= 0x00000000ffffffffULL;
>  
>         } else {
>                 f = (void *)sys_call_table[r0];
>         }
>  
> -       return f(r3, r4, r5, r6, r7, r8);
> +       #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +       return f(regs);
> +       #else
> +       return f(regs->gpr[3], regs->gpr[4], regs->gpr[5],
> +                regs->gpr[6], regs->gpr[7], regs->gpr[8]);
> +       #endif

Kernel coding style generally aligns #ifdefs to column 0

>  }
>  
>  static notrace void booke_load_dbcr0(void)
> diff --git a/arch/powerpc/kernel/interrupt_64.S
> b/arch/powerpc/kernel/interrupt_64.S
> index ce25b28cf418..3e8a811e09c4 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -91,9 +91,9 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>         li      r11,\trapnr
>         std     r11,_TRAP(r1)
>         std     r12,_CCR(r1)
> -       addi    r10,r1,STACK_FRAME_OVERHEAD
> +       addi    r4,r1,STACK_FRAME_OVERHEAD
>         ld      r11,exception_marker@toc(r2)
> -       std     r11,-16(r10)            /* "regshere" marker */
> +       std     r11,-16(r4)             /* "regshere" marker */
>  
>  BEGIN_FTR_SECTION
>         HMT_MEDIUM
> @@ -108,8 +108,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>          * but this is the best we can do.
>          */
>  
> -       /* Calling convention has r9 = orig r0, r10 = regs */
> -       mr      r9,r0
> +       /* Calling convention has r3 = orig r0, r4 = regs */
> +       mr      r3,r0
>         bl      system_call_exception
>  
>  .Lsyscall_vectored_\name\()_exit:
> @@ -275,9 +275,9 @@ END_BTB_FLUSH_SECTION
>         std     r10,_LINK(r1)
>         std     r11,_TRAP(r1)
>         std     r12,_CCR(r1)
> -       addi    r10,r1,STACK_FRAME_OVERHEAD
> +       addi    r4,r1,STACK_FRAME_OVERHEAD
>         ld      r11,exception_marker@toc(r2)
> -       std     r11,-16(r10)            /* "regshere" marker */
> +       std     r11,-16(r4)             /* "regshere" marker */
>  
>  #ifdef CONFIG_PPC_BOOK3S
>         li      r11,1
> @@ -298,8 +298,8 @@ END_BTB_FLUSH_SECTION
>         wrteei  1
>  #endif
>  
> -       /* Calling convention has r9 = orig r0, r10 = regs */
> -       mr      r9,r0
> +       /* Calling convention has r3 = orig r0, r4 = regs */
> +       mr      r3,r0
>         bl      system_call_exception
>  
>  .Lsyscall_exit:
> @@ -343,16 +343,8 @@
> END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>         cmpdi   r3,0
>         bne     .Lsyscall_restore_regs
>         /* Zero volatile regs that may contain sensitive kernel data
> */
> -       li      r0,0
> -       li      r4,0
> -       li      r5,0
> -       li      r6,0
> -       li      r7,0
> -       li      r8,0
> -       li      r9,0
> -       li      r10,0
> -       li      r11,0
> -       li      r12,0
> +       NULLIFY_GPR(0)
> +       NULLIFY_GPRS(4, 12)

Move this to a different patch

>         mtctr   r0
>         mtspr   SPRN_XER,r0
>  .Lsyscall_restore_regs_cont:
> @@ -378,7 +370,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>         REST_NVGPRS(r1)
>         mtctr   r3
>         mtspr   SPRN_XER,r4
> -       ld      r0,GPR0(r1)
> +       REST_GPR(0, r1)

Same for this

>         REST_GPRS(4, 12, r1)
>         b       .Lsyscall_restore_regs_cont
>  .Lsyscall_rst_end:
> diff --git a/arch/powerpc/kernel/systbl.c
> b/arch/powerpc/kernel/systbl.c
> index b88a9c2a1f50..cb05e302ea58 100644
> --- a/arch/powerpc/kernel/systbl.c
> +++ b/arch/powerpc/kernel/systbl.c
> @@ -15,8 +15,10 @@
>  #include <asm/unistd.h>
>  #include <asm/syscalls.h>
>  
> +#undef __SYSCALL_WITH_COMPAT
>  #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr,
> entry)
>  
> +#undef __SYSCALL
>  #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>  #define __SYSCALL(nr, entry) [nr] = __powerpc_##entry,
>  #define __powerpc_sys_ni_syscall       sys_ni_syscall
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index 080c9e7de0c0..900dc8ed1f14 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -39,6 +39,8 @@
>  extern char vdso32_start, vdso32_end;
>  extern char vdso64_start, vdso64_end;
>  
> +asmlinkage long sys_ni_syscall(void);
> +
>  /*
>   * The vdso data page (aka. systemcfg for old ppc64 fans) is here.
>   * Once the early boot kernel code no longer needs to muck around

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

