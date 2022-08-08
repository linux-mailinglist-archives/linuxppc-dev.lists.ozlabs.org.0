Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FE358C2CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 07:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1Pm11Zpgz3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sMPSwW3o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sMPSwW3o;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1PlF3mjrz2x9G
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 15:24:24 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2785BoqY022722
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 05:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ZJBcIStJ8JNs5/aXOTM8RUN36h9tm9v0XaMqOblcMes=;
 b=sMPSwW3oxdGZ3pml1+VR7OeASBW4Tr88GnqqsqgLH53ufkwS1D43amA1nR5GF6OTmi0Y
 XOoqohhlQLHuSqcJVbU9yokiqGSt7tYchh/dFOzV39p4LIur38ShS1Y/HpT2pefJich6
 5s8d1F+IM4dlFXaEYjz2K5+SSX920YYGvgkoRSqHJnTVuJrj+veICHg0E6Xi9mJo+Dsl
 94h6IQGzXMXSTTqSQM9ahsbaA/2GA1VuU8aOJU8wkoug8MCXMAy+QbA6ZF9QJylqdlDf
 L/wwKEPa0YQiRKmIIBlV9tNG/M7Sh/FNt0Pa2yjWC15Qzc0xOAjhrR56njSyTW/7ZsnH TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htv4g88ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 05:24:22 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2785KRBM016628
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 05:24:21 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htv4g88xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 05:24:21 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2785MK1F021122;
	Mon, 8 Aug 2022 05:24:19 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3hsfx8s9d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 05:24:19 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2785OG1732113028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 05:24:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8C84A4040;
	Mon,  8 Aug 2022 05:24:16 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27949A404D;
	Mon,  8 Aug 2022 05:24:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 05:24:16 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3E98B6012E;
	Mon,  8 Aug 2022 15:24:11 +1000 (AEST)
Message-ID: <9109e768d3b7d141d1b0095773cd737bf9ae497c.camel@linux.ibm.com>
Subject: Re: [PATCH v2 06/14] powerpc: Include all arch-specific syscall
 prototypes
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Aug 2022 15:24:10 +1000
In-Reply-To: <20220725062750.119476-1-rmclure@linux.ibm.com>
References: <20220725062750.119476-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MotRTpF6v6pJPtob8--WUTyFlg-FUbH6
X-Proofpoint-ORIG-GUID: _hIptOGiEhCg_bfxXp7Df-RKs9eu350L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_01,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=990 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080025
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:27 +1000, Rohan McLure wrote:
> Forward declare all syscall handler prototypes where a generic
> prototype
> is not provided in either linux/syscalls.h or linux/compat.h in
> asm/syscalls.h. This is required for compile-time type-checking for
> syscall handlers, which is implemented later in this series.
> 
> 32-bit compatibility syscall handlers are expressed in terms of types
> in
> ppc32.h. Expose this header globally.
> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>



> ---
> V1 -> V2: Explicitly include prototypes.
> ---
>  arch/powerpc/{kernel => include/asm}/ppc32.h |   0
>  arch/powerpc/include/asm/syscalls.h          | 104 ++++++++++++-----
>  arch/powerpc/kernel/signal_32.c              |   2 +-
>  arch/powerpc/perf/callchain_32.c             |   2 +-
>  4 files changed, 76 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/ppc32.h
> b/arch/powerpc/include/asm/ppc32.h
> similarity index 100%
> rename from arch/powerpc/kernel/ppc32.h
> rename to arch/powerpc/include/asm/ppc32.h
> diff --git a/arch/powerpc/include/asm/syscalls.h
> b/arch/powerpc/include/asm/syscalls.h
> index 025d4b877161..8b2757d7f423 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -8,49 +8,93 @@
>  #include <linux/types.h>
>  #include <linux/compat.h>
>  
> +#ifdef CONFIG_PPC64
> +#include <asm/ppc32.h>
> +#endif
> +#include <asm/unistd.h>
> +#include <asm/ucontext.h>
> +
>  struct rtas_args;
>  
> -asmlinkage long sys_mmap(unsigned long addr, size_t len,
> -               unsigned long prot, unsigned long flags,
> -               unsigned long fd, off_t offset);
> -asmlinkage long sys_mmap2(unsigned long addr, size_t len,
> -               unsigned long prot, unsigned long flags,
> -               unsigned long fd, unsigned long pgoff);
> -asmlinkage long sys_ppc64_personality(unsigned long personality);
> +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +
> +/*
> + * PowerPC architecture-specific syscalls
> + */
> +
>  asmlinkage long sys_rtas(struct rtas_args __user *uargs);
> -int sys_ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
> -                  fd_set __user *exp, struct __kernel_old_timeval
> __user *tvp);

Move to patch 4?

> -long sys_ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32
> offset_low,
> -                         u32 len_high, u32 len_low);
> +asmlinkage long sys_ni_syscall(void);
>  
> +#ifdef CONFIG_PPC64
> +asmlinkage long sys_ppc64_personality(unsigned long personality);
>  #ifdef CONFIG_COMPAT
> -unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
> -                              unsigned long prot, unsigned long
> flags,
> -                              unsigned long fd, unsigned long
> pgoff);
> +asmlinkage long compat_sys_ppc64_personality(unsigned long
> personality);
> +#endif /* CONFIG_COMPAT */
> +#endif /* CONFIG_PPC64 */
>  
> -compat_ssize_t compat_sys_pread64(unsigned int fd, char __user
> *ubuf, compat_size_t count,
> -                                 u32 reg6, u32 pos1, u32 pos2);
> +/* Parameters are reordered for powerpc to avoid padding */
> +asmlinkage long sys_ppc_fadvise64_64(int fd, int advice,
> +                                    u32 offset_high, u32 offset_low,
> +                                    u32 len_high, u32 len_low);
> +asmlinkage long sys_swapcontext(struct ucontext __user *old_ctx,
> +                               struct ucontext __user *new_ctx, long
> ctx_size);
> +asmlinkage long sys_mmap(unsigned long addr, size_t len,
> +                        unsigned long prot, unsigned long flags,
> +                        unsigned long fd, off_t offset);
> +asmlinkage long sys_mmap2(unsigned long addr, size_t len,
> +                         unsigned long prot, unsigned long flags,
> +                         unsigned long fd, unsigned long pgoff);
> +asmlinkage long sys_switch_endian(void);
>  
> -compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char
> __user *ubuf, compat_size_t count,
> -                                  u32 reg6, u32 pos1, u32 pos2);
> +#ifdef CONFIG_PPC32
> +asmlinkage long sys_sigreturn(void);
> +asmlinkage long sys_debug_setcontext(struct ucontext __user *ctx,
> int ndbg,
> +                                    struct sig_dbg_op __user *dbg);
> +#endif
>  
> -compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32
> offset2, u32 count);
> +asmlinkage long sys_rt_sigreturn(void);
>  
> -int compat_sys_truncate64(const char __user *path, u32 reg4,
> -                         unsigned long len1, unsigned long len2);
> +asmlinkage long sys_subpage_prot(unsigned long addr,
> +                                unsigned long len, u32 __user *map);
>  
> -long compat_sys_fallocate(int fd, int mode, u32 offset1, u32
> offset2, u32 len1, u32 len2);

Move to patch 5?

> +#ifdef CONFIG_COMPAT
> +asmlinkage long compat_sys_swapcontext(struct ucontext32 __user
> *old_ctx,
> +                                      struct ucontext32 __user
> *new_ctx,
> +                                      int ctx_size);
> +asmlinkage long compat_sys_old_getrlimit(unsigned int resource,
> +                                        struct compat_rlimit __user
> *rlim);
> +asmlinkage long compat_sys_sigreturn(void);
> +asmlinkage long compat_sys_rt_sigreturn(void);
>  
> -int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long
> len1,
> -                          unsigned long len2);
> +/* Architecture-specific implementations in sys_ppc32.c */
>  
> -long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32
> offset2,
> -                               size_t len, int advice);
> +asmlinkage long compat_sys_mmap2(unsigned long addr, size_t len,
> +                                    unsigned long prot, unsigned
> long flags,
> +                                    unsigned long fd, unsigned long
> pgoff);
> +asmlinkage long compat_sys_ppc_pread64(unsigned int fd,
> +                                      char __user *ubuf,
> compat_size_t count,
> +                                      u32 reg6, u32 pos1, u32 pos2);
> +asmlinkage long compat_sys_ppc_pwrite64(unsigned int fd,
> +                                       const char __user *ubuf,
> compat_size_t count,
> +                                       u32 reg6, u32 pos1, u32
> pos2);
> +asmlinkage long compat_sys_ppc_readahead(int fd, u32 r4,
> +                                        u32 offset1, u32 offset2,
> u32 count);
> +asmlinkage long compat_sys_ppc_truncate64(const char __user *path,
> u32 reg4,
> +                                         unsigned long len1,
> unsigned long len2);
> +asmlinkage long compat_sys_ppc_fallocate(int fd, int mode, u32
> offset1, u32 offset2,
> +                                        u32 len1, u32 len2);

This should be unnecessary thanks to patch 5?

> +asmlinkage long compat_sys_ppc_ftruncate64(unsigned int fd, u32
> reg4,
> +                                          unsigned long len1,
> unsigned long len2);
> +asmlinkage long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32
> offset1, u32 offset2,
> +                                          size_t len, int advice);
> +asmlinkage long compat_sys_ppc_sync_file_range2(int fd, unsigned int
> flags,
> +                                               unsigned int offset1,
> +                                               unsigned int offset2,
> +                                               unsigned int nbytes1,
> +                                               unsigned int
> nbytes2);
> +#endif /* CONFIG_COMPAT */
>  
> -long compat_sys_sync_file_range2(int fd, unsigned int flags,
> -                                unsigned int offset1, unsigned int
> offset2,
> -                                unsigned int nbytes1, unsigned int
> nbytes2);
> -#endif
> +#endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
>  
>  #endif /* __KERNEL__ */
>  #endif /* __ASM_POWERPC_SYSCALLS_H */
> 

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

