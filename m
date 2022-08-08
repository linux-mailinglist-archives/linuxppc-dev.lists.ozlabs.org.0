Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863858C28D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 06:32:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1NbC0MBHz3bsS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 14:32:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=djmoxrTC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=djmoxrTC;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1NZP5z0Gz2xHg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 14:31:41 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2784DQc8023679;
	Mon, 8 Aug 2022 04:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=TtQuRwIc51qRCl7QBQqTnLtbZR8nErs3zH/Y4m8Bg6Y=;
 b=djmoxrTCbtSu5Per6sgjtoFUDP0wYDLr3NIxRljKNPLGL6kS4WVObInNm7U9uNle59CJ
 BS1wGEe0VUK13JVJfeets27FMYshAOfC8wWSzwlfROnAMI6tjSIUW1YZR4OcwCzAp2cH
 msYAN3EmjkAPoli9dJlZWCZDJ8JmavhHGZC4Ew9YCOzLD/ZqFH92egwXy7DT77xVeJNB
 jHxC2ZU4dMFYnFG58CPkVgR1PNGEyqRUDQenIVEiW656BasNEyy4ZA2L9rHbeegnNBO2
 DBvehxarrPVPw66iKK2zaxwj07RlTSIrPYVMCCjGfTWZ/7WPD+Nk+xP40E2OPkf8Mzm8 lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ht1yjhakr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 04:31:36 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2784TH84013856;
	Mon, 8 Aug 2022 04:31:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ht1yjhakd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 04:31:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2784Kp24010095;
	Mon, 8 Aug 2022 04:31:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3hsfjj1p6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 04:31:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2784VVMo36831548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 04:31:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78587A405F;
	Mon,  8 Aug 2022 04:31:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA15A4054;
	Mon,  8 Aug 2022 04:31:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 04:31:30 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AA5BE6012E;
	Mon,  8 Aug 2022 14:31:29 +1000 (AEST)
Message-ID: <0853fb1aba00e32ad6d09beb12f9d392386e2338.camel@linux.ibm.com>
Subject: Re: [PATCH v2 05/14] powerpc: Use generic fallocate compatibility
 syscall
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Aug 2022 14:31:29 +1000
In-Reply-To: <20220725062651.119176-1-rmclure@linux.ibm.com>
References: <20220725062651.119176-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l5_UC6K8JSfGJD69vc6YmD_Bva4IVNyo
X-Proofpoint-ORIG-GUID: xa67YcAuWbliQW2M6tZTT1Ff2ajJwtUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_01,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=633
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080019
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
Cc: npiggin@gmail.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:26 +1000, Rohan McLure wrote:
> The powerpc fallocate compat syscall handler is identical to the
> generic implementation provided by commit 59c10c52f573f ("riscv:
> compat: syscall: Add compat_sys_call_table implementation"), and as
> such can be removed in favour of the generic implementation.
> 
> A future patch series will replace more architecture-defined syscall
> handlers with generic implementations, dependent on introducing
> generic
> implementations that are compatible with powerpc and arm's parameter
> reorderings.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Remove arch-specific fallocate handler.
> ---
>  arch/powerpc/include/asm/compat.h        | 5 +++++
>  arch/powerpc/include/asm/unistd.h        | 1 +
>  arch/powerpc/kernel/asm-offsets.c        | 1 +
>  arch/powerpc/kernel/sys_ppc32.c          | 8 --------
>  arch/powerpc/kernel/syscalls/syscall.tbl | 2 +-
>  5 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/compat.h
> b/arch/powerpc/include/asm/compat.h
> index dda4091fd012..f20caae3f019 100644
> --- a/arch/powerpc/include/asm/compat.h
> +++ b/arch/powerpc/include/asm/compat.h
> @@ -16,6 +16,11 @@ typedef u16          compat_ipc_pid_t;
>  #include <asm-generic/compat.h>
>  
>  #ifdef __BIG_ENDIAN__
> +#define compat_arg_u64(name)           u32  name##_hi, u32 
> name##_lo
> +#define compat_arg_u64_dual(name)      u32, name##_hi, u32,
> name##_lo
> +#define compat_arg_u64_glue(name)      (((u64)name##_lo &
> 0xffffffffUL) | \
> +                                        ((u64)name##_hi << 32))
> +

Is there any reason this can't go into include/asm-generic/compat.h?

>  #define COMPAT_UTS_MACHINE     "ppc\0\0"
>  #else
>  #define COMPAT_UTS_MACHINE     "ppcle\0\0"
> diff --git a/arch/powerpc/include/asm/unistd.h
> b/arch/powerpc/include/asm/unistd.h
> index b1129b4ef57d..659a996c75aa 100644
> --- a/arch/powerpc/include/asm/unistd.h
> +++ b/arch/powerpc/include/asm/unistd.h
> @@ -45,6 +45,7 @@
>  #define __ARCH_WANT_SYS_UTIME
>  #define __ARCH_WANT_SYS_NEWFSTATAT
>  #define __ARCH_WANT_COMPAT_STAT
> +#define __ARCH_WANT_COMPAT_FALLOCATE
>  #define __ARCH_WANT_COMPAT_SYS_SENDFILE
>  #endif
>  #define __ARCH_WANT_SYS_FORK
> diff --git a/arch/powerpc/kernel/asm-offsets.c
> b/arch/powerpc/kernel/asm-offsets.c
> index 8c10f536e478..c669f1d1ee77 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -9,6 +9,7 @@
>   * #defines from the assembly-language output.
>   */
>  
> +#include <asm/compat.h>

What's this for?

>  #include <linux/compat.h>
>  #include <linux/signal.h>
>  #include <linux/sched.h>
> diff --git a/arch/powerpc/kernel/sys_ppc32.c
> b/arch/powerpc/kernel/sys_ppc32.c
> index 89e8c478fd6a..bd00b7dab7cd 100644
> --- a/arch/powerpc/kernel/sys_ppc32.c
> +++ b/arch/powerpc/kernel/sys_ppc32.c
> @@ -89,14 +89,6 @@ COMPAT_SYSCALL_DEFINE4(ppc_truncate64,
>         return ksys_truncate(path, merge_64(len1, len2));
>  }
>  
> -COMPAT_SYSCALL_DEFINE6(ppc_fallocate,
> -                      int, fd, int, mode, u32, offset1, u32,
> offset2,
> -                      u32, len1, u32, len2)
> -{
> -       return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) |
> offset2,
> -                            merge_64(len1, len2));
> -}
> -
>  COMPAT_SYSCALL_DEFINE4(ppc_ftruncate64,
>                        unsigned int, fd, u32, reg4, unsigned long,
> len1,
>                        unsigned long, len2)
> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl
> b/arch/powerpc/kernel/syscalls/syscall.tbl
> index c6cfcdf52c57..b4c970c9c6b1 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -391,7 +391,7 @@
>  306    common  timerfd_create                  sys_timerfd_create
>  307    common  eventfd                         sys_eventfd
>  308    common  sync_file_range2                sys_sync_file_range2 
>            compat_sys_ppc_sync_file_range2
> -
> 309    nospu   fallocate                       sys_fallocate          
>          compat_sys_ppc_fallocate
> +309    nospu   fallocate                       sys_fallocate        
>            compat_sys_fallocate
>  310    nospu   subpage_prot                    sys_subpage_prot
>  311    32      timerfd_settime                 sys_timerfd_settime32
>  311    64      timerfd_settime                 sys_timerfd_settime

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

