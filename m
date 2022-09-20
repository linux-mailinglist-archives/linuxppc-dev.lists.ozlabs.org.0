Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EF25BD955
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:28:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWkT46v0Qz3c2h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 11:28:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ioVZ4cm2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ioVZ4cm2;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWkSR4dS8z2xG4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 11:27:51 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 3so1046175pga.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 18:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=27QxZOVJL4AYtV2tP+ZCVq7m6lgfLTYwyTSGnPTiml4=;
        b=ioVZ4cm2ddqrP85VOmeqkBHdzG7LyKHIXL3x65tLAD8/F+Fecei6UBJwJEtUdYNLS7
         XSF1npsELza3ADMHxhJE9QU0gXF5z+jKXIJtklRyz4UWJAo3AjXpUl/OZzlz90Sua7r8
         tMFKE+sjowCmbrtpRwl5Pywagi3MNxR9fOEIAvFFik9YCAztUuXqE416x10Yuh3tfeee
         TF9LS55FYfQIboGZXvBFIOBhKYAe7Rdx5uw+oTw3UKpGeBZOMW/xbHEwsgPmb62gTkB3
         qRVyAwgMa8I3Gou6ognuHeuVkutfGsAaTLGEStabRfYQLUjzfYyxr23G4RGLcwmXLTwd
         h5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=27QxZOVJL4AYtV2tP+ZCVq7m6lgfLTYwyTSGnPTiml4=;
        b=4YEzR+zHXzIKNEX/iHL9yBNN6hTbcHEc2mFjQqmk423gERv3uEhxqFOm7b+dSZW/rz
         J8e5xog95DrIYU7uEg6rFk8s19u8yVIx4mWQALZPwzAF24UMDEvhgttWGHqTReQOBwXT
         YOQxOCupawaWtS37RdbbfdRFra3LMMnt/XqO8kLilw8cTWkc5+B72XS4kGEAYRKHOvU+
         SKGdTVkbuz6Glg5e/Y3uQRMdmnAiUqQDCPu3FucbDaiDQRJEXL8YoCgjgsh+MAmxT1Fl
         HCKDesGpPEqBzi7fJ9PqpO4LxwezNfF6g2u/Q4raAPmU4W+YYigakg+5e7GerLRly+hT
         pLLg==
X-Gm-Message-State: ACrzQf3XswhAhoL0IIrJYR1Rqavayd2xwVDZTQHi9hGemRf1tnRNPxA/
	5LNCNGFN0XCLpMgiVJraWnwLQHYQ/pU=
X-Google-Smtp-Source: AMsMyM5tqeHBkRcVDdecNK9ysSdLjIDTYMdl4o3cAXdJM29wxJRuiahCGQeBG7h3i8AdgaQoq4mYmg==
X-Received: by 2002:a62:4c2:0:b0:52e:bd4d:50e1 with SMTP id 185-20020a6204c2000000b0052ebd4d50e1mr21595720pfe.8.1663637268344;
        Mon, 19 Sep 2022 18:27:48 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id d19-20020aa797b3000000b0052d98fbf8f3sm53974pfq.56.2022.09.19.18.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 18:27:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 11:27:43 +1000
Message-Id: <CN0U6W1ZA0GA.1J34ZJPEE7J1D@bobo>
Subject: Re: [PATCH 16/23] powerpc: Include all arch-specific syscall
 prototypes
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-17-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-17-rmclure@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
> Forward declare all syscall handler prototypes where a generic prototype
> is not provided in either linux/syscalls.h or linux/compat.h in
> asm/syscalls.h. This is required for compile-time type-checking for
> syscall handlers, which is implemented later in this series.
>
> 32-bit compatibility syscall handlers are expressed in terms of types in
> ppc32.h. Expose this header globally.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

I didn't go through all the code moving carefully but I guess that
would blow up with the compile time checking so it must be right :)

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> V1 -> V2: Explicitly include prototypes.
> V2 -> V3: Remove extraneous #include <asm/compat.h> and ppc_fallocate
> prototype. Rename header.
> V4 -> V5: Clean. Elaborate comment on long long munging. Remove
> prototype hiding conditional on SYSCALL_WRAPPER.
> ---
>  arch/powerpc/include/asm/syscalls.h          | 97 ++++++++++++++----
>  .../ppc32.h =3D> include/asm/syscalls_32.h}    |  0
>  arch/powerpc/kernel/signal_32.c              |  2 +-
>  arch/powerpc/perf/callchain_32.c             |  2 +-
>  4 files changed, 77 insertions(+), 24 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index 525d2aa0c8ca..5d106acf7906 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -8,6 +8,14 @@
>  #include <linux/types.h>
>  #include <linux/compat.h>
> =20
> +#ifdef CONFIG_PPC64
> +#include <asm/syscalls_32.h>
> +#endif
> +#include <asm/unistd.h>
> +#include <asm/ucontext.h>
> +
> +struct rtas_args;
> +
>  /*
>   * long long munging:
>   * The 32 bit ABI passes long longs in an odd even register pair.
> @@ -20,44 +28,89 @@
>  #define merge_64(high, low) ((u64)high << 32) | low
>  #endif
> =20
> -struct rtas_args;
> +long sys_ni_syscall(void);
> +
> +/*
> + * PowerPC architecture-specific syscalls
> + */
> +
> +long sys_rtas(struct rtas_args __user *uargs);
> +
> +#ifdef CONFIG_PPC64
> +long sys_ppc64_personality(unsigned long personality);
> +#ifdef CONFIG_COMPAT
> +long compat_sys_ppc64_personality(unsigned long personality);
> +#endif /* CONFIG_COMPAT */
> +#endif /* CONFIG_PPC64 */
> =20
> +long sys_swapcontext(struct ucontext __user *old_ctx,
> +		     struct ucontext __user *new_ctx, long ctx_size);
>  long sys_mmap(unsigned long addr, size_t len,
>  	      unsigned long prot, unsigned long flags,
>  	      unsigned long fd, off_t offset);
>  long sys_mmap2(unsigned long addr, size_t len,
>  	       unsigned long prot, unsigned long flags,
>  	       unsigned long fd, unsigned long pgoff);
> -long sys_ppc64_personality(unsigned long personality);
> -long sys_rtas(struct rtas_args __user *uargs);
> -long sys_ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offse=
t_low,
> -			  u32 len_high, u32 len_low);
> +long sys_switch_endian(void);
> =20
> -#ifdef CONFIG_COMPAT
> -unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
> -			       unsigned long prot, unsigned long flags,
> -			       unsigned long fd, unsigned long pgoff);
> -
> -compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, co=
mpat_size_t count,
> -				  u32 reg6, u32 pos1, u32 pos2);
> +#ifdef CONFIG_PPC32
> +long sys_sigreturn(void);
> +long sys_debug_setcontext(struct ucontext __user *ctx, int ndbg,
> +			  struct sig_dbg_op __user *dbg);
> +#endif
> =20
> -compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *u=
buf, compat_size_t count,
> -				   u32 reg6, u32 pos1, u32 pos2);
> +long sys_rt_sigreturn(void);
> =20
> -compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 off=
set2, u32 count);
> +long sys_subpage_prot(unsigned long addr,
> +		      unsigned long len, u32 __user *map);
> =20
> -int compat_sys_truncate64(const char __user *path, u32 reg4,
> -			  unsigned long len1, unsigned long len2);
> +#ifdef CONFIG_COMPAT
> +long compat_sys_swapcontext(struct ucontext32 __user *old_ctx,
> +			    struct ucontext32 __user *new_ctx,
> +			    int ctx_size);
> +long compat_sys_old_getrlimit(unsigned int resource,
> +			      struct compat_rlimit __user *rlim);
> +long compat_sys_sigreturn(void);
> +long compat_sys_rt_sigreturn(void);
> +#endif /* CONFIG_COMPAT */
> =20
> -int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1=
,
> -			   unsigned long len2);
> +/*
> + * Architecture specific signatures required by long long munging:
> + * The 32 bit ABI passes long longs in an odd even register pair.
> + * The following signatures provide a machine long parameter for
> + * each register that will be supplied. The implementation is
> + * responsible for combining parameter pairs.
> + */
> =20
> +#ifdef CONFIG_COMPAT
> +long compat_sys_mmap2(unsigned long addr, size_t len,
> +		      unsigned long prot, unsigned long flags,
> +		      unsigned long fd, unsigned long pgoff);
> +long compat_sys_ppc_pread64(unsigned int fd,
> +			    char __user *ubuf, compat_size_t count,
> +			    u32 reg6, u32 pos1, u32 pos2);
> +long compat_sys_ppc_pwrite64(unsigned int fd,
> +			     const char __user *ubuf, compat_size_t count,
> +			     u32 reg6, u32 pos1, u32 pos2);
> +long compat_sys_ppc_readahead(int fd, u32 r4,
> +			      u32 offset1, u32 offset2, u32 count);
> +long compat_sys_ppc_truncate64(const char __user *path, u32 reg4,
> +			       unsigned long len1, unsigned long len2);
> +long compat_sys_ppc_ftruncate64(unsigned int fd, u32 reg4,
> +				unsigned long len1, unsigned long len2);
>  long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 off=
set2,
>  				size_t len, int advice);
> +long compat_sys_ppc_sync_file_range2(int fd, unsigned int flags,
> +				     unsigned int offset1,
> +				     unsigned int offset2,
> +				     unsigned int nbytes1,
> +				     unsigned int nbytes2);
> +#endif /* CONFIG_COMPAT */
> =20
> -long compat_sys_sync_file_range2(int fd, unsigned int flags,
> -				 unsigned int offset1, unsigned int offset2,
> -				 unsigned int nbytes1, unsigned int nbytes2);
> +#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
> +long sys_ppc_fadvise64_64(int fd, int advice,
> +			  u32 offset_high, u32 offset_low,
> +			  u32 len_high, u32 len_low);
>  #endif
> =20
>  #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/kernel/ppc32.h b/arch/powerpc/include/asm/sysca=
lls_32.h
> similarity index 100%
> rename from arch/powerpc/kernel/ppc32.h
> rename to arch/powerpc/include/asm/syscalls_32.h
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal=
_32.c
> index 157a7403e3eb..c114c7f25645 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -43,7 +43,7 @@
>  #include <asm/tm.h>
>  #include <asm/asm-prototypes.h>
>  #ifdef CONFIG_PPC64
> -#include "ppc32.h"
> +#include <asm/syscalls_32.h>
>  #include <asm/unistd.h>
>  #else
>  #include <asm/ucontext.h>
> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callcha=
in_32.c
> index b83c47b7947f..ea8cfe3806dc 100644
> --- a/arch/powerpc/perf/callchain_32.c
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -19,7 +19,7 @@
>  #include "callchain.h"
> =20
>  #ifdef CONFIG_PPC64
> -#include "../kernel/ppc32.h"
> +#include <asm/syscalls_32.h>
>  #else  /* CONFIG_PPC64 */
> =20
>  #define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
> --=20
> 2.34.1

