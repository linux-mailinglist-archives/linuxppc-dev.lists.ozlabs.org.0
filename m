Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90CA5B57CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 12:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR2KZ6GmDz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 20:05:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iclDLl/R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iclDLl/R;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR2Jw6vCXz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 20:05:02 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id g4so7833750pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=ng4sxgpARRpuU+3LFY+WnzBiEj3ghOBmps/QeVcpaag=;
        b=iclDLl/RJg7DEVhb6PJOFmbUOMXMnBnxiy0Qk9ndLtFykumC5jQbx3c4cLc3ZLa+n0
         89aTIdfHLNGc4I3A82O0XFnw6ImKOZDbgoNCpXWH6HmSWtldrdWnwrTBNKVFppOImH6Z
         z7q2MEW6aQIWg9TzZLH+rlJKTkc2Opu2V9FoJr7nAZ8/lWSZ4vRRLZsgvDU0hv93j2cl
         38wfi4yJKtg0ZYFAjVxeI4duvgwrFXlMg6DsviA4N7RjHiK+i3pVZo4uoeORUKcUpZ+W
         nxWWapDMn2jJBtOPup5CQEah3AHR7sG/fNqPZC1WB9U2qsMXx9I5muJFcdAbv1MJUIcY
         Twiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=ng4sxgpARRpuU+3LFY+WnzBiEj3ghOBmps/QeVcpaag=;
        b=v3gULiuRs524P2mxE7Atlv0VVsLRhxwtOkqtlaSC0Q21cMZRkvhWphuTKVrfnLuWbW
         D6yApov+Y7IbU3fCIvUiCDZ86Wl8I4jBp7Fadnfdz15iuWuOBj+Xf9M7+eQ8fyD94Ics
         4w00Bbd3AOsTTfNH5ELgUR0MGWNFDIx2v7jn1xkwKD3W3T/BL5ToyPR2SlosjmnprCC7
         TxQ/4LMnM0gsRz+P760aKp/q1Ng4uvaVeSGgusOpLGQ3+XK2CrFK02/Kix+3CF3StlIp
         OHQcCyrtHFy3s1J3HRNsjgGpdySJ8s4hS5clawbp5fkV9Q4RLVGLu4NiriJV9X0x13eI
         Bnhw==
X-Gm-Message-State: ACgBeo2WUWrJv2R69XX8q1NLDSBOS2LSEIADNijDCtfiD3mH8f2duAa+
	NGNz2RWqylb0qn1Dl/G8Yl1yD45mnHk=
X-Google-Smtp-Source: AA6agR40dxKjuih2QPUb/GpJLqsTDTKqHl5psAZRyHrIHxfJmDPk+mc3ztdsnUHBAATSUFFDRZr/NQ==
X-Received: by 2002:a63:1555:0:b0:42c:146a:6722 with SMTP id 21-20020a631555000000b0042c146a6722mr22334029pgv.605.1662977099419;
        Mon, 12 Sep 2022 03:04:59 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b0017685f53537sm5572765plg.186.2022.09.12.03.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:04:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 20:04:54 +1000
Message-Id: <CMUC6IJAITDY.3K35JX88G1LZ3@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 07/20] powerpc: Adopt SYSCALL_DEFINE for
 arch-specific syscall handlers
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-8-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-8-rmclure@linux.ibm.com>
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

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> Arch-specific implementations of syscall handlers are currently used
> over generic implementations for the following reasons:
>
> 1. Semantics unique to powerpc
> 2. Compatibility syscalls require 'argument padding' to comply with
>    64-bit argument convention in ELF32 abi.
> 3. Parameter types or order is different in other architectures.
>
> These syscall handlers have been defined prior to this patch series
> without invoking the SYSCALL_DEFINE or COMPAT_SYSCALL_DEFINE macros with
> custom input and output types. We remove every such direct definition in
> favour of the aforementioned macros.

And what about sys_fallocate, where did that go?

>
> Also update syscalls.tbl in order to refer to the symbol names generated
> by each of these macros. Since ppc64_personality can be called by both
> 64 bit and 32 bit binaries through compatibility, we must generate both
> both compat_sys_ and sys_ symbols for this handler.

Actually I don't have a concern about this patch, I thoughtthere was
something odd going on with ppc64_personality but I misread, it all
looks pretty good.

>
> A number of architectures including arm and powerpc agree on an
> alternative argument order and numbering for most of these arch-specific
> handlers. A future patch series may allow for asm/unistd.h to signal
> through its defines that a generic implementation of these syscall
> handlers with the correct calling convention be omitted, through the
> __ARCH_WANT_COMPAT_SYS_... convention.

I'm on the fence about including this in changelog. arm developers
might not see it, for example. Putting it in include/linux/compat.h
as a comment  might be better.

If you keep it in the changelog, maybe preface with something like
aside, side note, in future or something so that's clear it's not part
of the current patch.

Thanks,
Nick

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: All syscall handlers wrapped by this macro.
> V2 -> V3: Move creation of do_ppc64_personality helper to prior patch.
> V3 -> V4: Fix parenthesis alignment. Don't emit sys_*** symbols.
> ---
>  arch/powerpc/include/asm/syscalls.h          | 10 ++--
>  arch/powerpc/kernel/sys_ppc32.c              | 45 ++++++++++--------
>  arch/powerpc/kernel/syscalls.c               | 17 +++++--
>  arch/powerpc/kernel/syscalls/syscall.tbl     | 22 ++++-----
>  .../arch/powerpc/entry/syscalls/syscall.tbl  | 22 ++++-----
>  5 files changed, 64 insertions(+), 52 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index 739498c358a1..3e3aff0835a6 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -16,10 +16,10 @@ long sys_mmap(unsigned long addr, size_t len,
>  long sys_mmap2(unsigned long addr, size_t len,
>  	       unsigned long prot, unsigned long flags,
>  	       unsigned long fd, unsigned long pgoff);
> -long ppc64_personality(unsigned long personality);
> +long sys_ppc64_personality(unsigned long personality);
>  long sys_rtas(struct rtas_args __user *uargs);
> -long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_lo=
w,
> -		      u32 len_high, u32 len_low);
> +long sys_ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offse=
t_low,
> +			  u32 len_high, u32 len_low);
> =20
>  #ifdef CONFIG_COMPAT
>  unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
> @@ -40,8 +40,8 @@ int compat_sys_truncate64(const char __user *path, u32 =
reg4,
>  int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1=
,
>  			   unsigned long len2);
> =20
> -long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
> -		     size_t len, int advice);
> +long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 off=
set2,
> +				size_t len, int advice);
> =20
>  long compat_sys_sync_file_range2(int fd, unsigned int flags,
>  				 unsigned int offset1, unsigned int offset2,
> diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_pp=
c32.c
> index bc6491ed6454..dd9039671227 100644
> --- a/arch/powerpc/kernel/sys_ppc32.c
> +++ b/arch/powerpc/kernel/sys_ppc32.c
> @@ -59,52 +59,55 @@
>  #define merge_64(high, low) ((u64)high << 32) | low
>  #endif
> =20
> -compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, co=
mpat_size_t count,
> -			     u32 reg6, u32 pos1, u32 pos2)
> +COMPAT_SYSCALL_DEFINE6(ppc_pread64,
> +		       unsigned int, fd,
> +		       char __user *, ubuf, compat_size_t, count,
> +		       u32, reg6, u32, pos1, u32, pos2)
>  {
>  	return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
>  }
> =20
> -compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *u=
buf, compat_size_t count,
> -			      u32 reg6, u32 pos1, u32 pos2)
> +COMPAT_SYSCALL_DEFINE6(ppc_pwrite64,
> +		       unsigned int, fd,
> +		       const char __user *, ubuf, compat_size_t, count,
> +		       u32, reg6, u32, pos1, u32, pos2)
>  {
>  	return ksys_pwrite64(fd, ubuf, count, merge_64(pos1, pos2));
>  }
> =20
> -compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 off=
set2, u32 count)
> +COMPAT_SYSCALL_DEFINE5(ppc_readahead,
> +		       int, fd, u32, r4,
> +		       u32, offset1, u32, offset2, u32, count)
>  {
>  	return ksys_readahead(fd, merge_64(offset1, offset2), count);
>  }
> =20
> -int compat_sys_truncate64(const char __user * path, u32 reg4,
> -				unsigned long len1, unsigned long len2)
> +COMPAT_SYSCALL_DEFINE4(ppc_truncate64,
> +		       const char __user *, path, u32, reg4,
> +		       unsigned long, len1, unsigned long, len2)
>  {
>  	return ksys_truncate(path, merge_64(len1, len2));
>  }
> =20
> -long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
> -				     u32 len1, u32 len2)
> -{
> -	return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
> -			     merge_64(len1, len2));
> -}
> -
> -int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1=
,
> -				 unsigned long len2)
> +COMPAT_SYSCALL_DEFINE4(ppc_ftruncate64,
> +		       unsigned int, fd, u32, reg4,
> +		       unsigned long, len1, unsigned long, len2)
>  {
>  	return ksys_ftruncate(fd, merge_64(len1, len2));
>  }
> =20
> -long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
> -		     size_t len, int advice)
> +COMPAT_SYSCALL_DEFINE6(ppc32_fadvise64,
> +		       int, fd, u32, unused, u32, offset1, u32, offset2,
> +		       size_t, len, int, advice)
>  {
>  	return ksys_fadvise64_64(fd, merge_64(offset1, offset2), len,
>  				 advice);
>  }
> =20
> -long compat_sys_sync_file_range2(int fd, unsigned int flags,
> -				   unsigned offset1, unsigned offset2,
> -				   unsigned nbytes1, unsigned nbytes2)
> +COMPAT_SYSCALL_DEFINE6(ppc_sync_file_range2,
> +		       int, fd, unsigned int, flags,
> +		       unsigned int, offset1, unsigned int, offset2,
> +		       unsigned int, nbytes1, unsigned int, nbytes2)
>  {
>  	loff_t offset =3D merge_64(offset1, offset2);
>  	loff_t nbytes =3D merge_64(nbytes1, nbytes2);
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscall=
s.c
> index 32fadf3c2cd3..2d4c62e5bac7 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -87,14 +87,23 @@ static inline long do_ppc64_personality(unsigned long=
 personality)
>  		ret =3D (ret & ~PER_MASK) | PER_LINUX;
>  	return ret;
>  }
> -long ppc64_personality(unsigned long personality)
> +
> +SYSCALL_DEFINE1(ppc64_personality, unsigned long, personality)
>  {
>  	return do_ppc64_personality(personality);
>  }
> -#endif
> =20
> -long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_lo=
w,
> -		      u32 len_high, u32 len_low)
> +#ifdef CONFIG_COMPAT
> +COMPAT_SYSCALL_DEFINE1(ppc64_personality, unsigned long, personality)
> +{
> +	return do_ppc64_personality(personality);
> +}
> +#endif /* CONFIG_COMPAT */
> +#endif /* CONFIG_PPC64 */
> +
> +SYSCALL_DEFINE6(ppc_fadvise64_64,
> +		int, fd, int, advice, u32, offset_high, u32, offset_low,
> +		u32, len_high, u32, len_low)
>  {
>  	return ksys_fadvise64_64(fd, (u64)offset_high << 32 | offset_low,
>  				 (u64)len_high << 32 | len_low, advice);
> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kern=
el/syscalls/syscall.tbl
> index 4cbbb810ae10..b4c970c9c6b1 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -178,9 +178,9 @@
>  133	common	fchdir				sys_fchdir
>  134	common	bdflush				sys_ni_syscall
>  135	common	sysfs				sys_sysfs
> -136	32	personality			sys_personality			ppc64_personality
> -136	64	personality			ppc64_personality
> -136	spu	personality			ppc64_personality
> +136	32	personality			sys_personality			compat_sys_ppc64_personality
> +136	64	personality			sys_ppc64_personality
> +136	spu	personality			sys_ppc64_personality
>  137	common	afs_syscall			sys_ni_syscall
>  138	common	setfsuid			sys_setfsuid
>  139	common	setfsgid			sys_setfsgid
> @@ -228,8 +228,8 @@
>  176	64	rt_sigtimedwait			sys_rt_sigtimedwait
>  177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueue=
info
>  178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
> -179	common	pread64				sys_pread64			compat_sys_pread64
> -180	common	pwrite64			sys_pwrite64			compat_sys_pwrite64
> +179	common	pread64				sys_pread64			compat_sys_ppc_pread64
> +180	common	pwrite64			sys_pwrite64			compat_sys_ppc_pwrite64
>  181	common	chown				sys_chown
>  182	common	getcwd				sys_getcwd
>  183	common	capget				sys_capget
> @@ -242,10 +242,10 @@
>  188	common 	putpmsg				sys_ni_syscall
>  189	nospu	vfork				sys_vfork
>  190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
> -191	common	readahead			sys_readahead			compat_sys_readahead
> +191	common	readahead			sys_readahead			compat_sys_ppc_readahead
>  192	32	mmap2				sys_mmap2			compat_sys_mmap2
> -193	32	truncate64			sys_truncate64			compat_sys_truncate64
> -194	32	ftruncate64			sys_ftruncate64			compat_sys_ftruncate64
> +193	32	truncate64			sys_truncate64			compat_sys_ppc_truncate64
> +194	32	ftruncate64			sys_ftruncate64			compat_sys_ppc_ftruncate64
>  195	32	stat64				sys_stat64
>  196	32	lstat64				sys_lstat64
>  197	32	fstat64				sys_fstat64
> @@ -288,7 +288,7 @@
>  230	common	io_submit			sys_io_submit			compat_sys_io_submit
>  231	common	io_cancel			sys_io_cancel
>  232	nospu	set_tid_address			sys_set_tid_address
> -233	common	fadvise64			sys_fadvise64			ppc32_fadvise64
> +233	common	fadvise64			sys_fadvise64			compat_sys_ppc32_fadvise64
>  234	nospu	exit_group			sys_exit_group
>  235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
>  236	common	epoll_create			sys_epoll_create
> @@ -323,7 +323,7 @@
>  251	spu	utimes				sys_utimes
>  252	common	statfs64			sys_statfs64			compat_sys_statfs64
>  253	common	fstatfs64			sys_fstatfs64			compat_sys_fstatfs64
> -254	32	fadvise64_64			ppc_fadvise64_64
> +254	32	fadvise64_64			sys_ppc_fadvise64_64
>  254	spu	fadvise64_64			sys_ni_syscall
>  255	common	rtas				sys_rtas
>  256	32	sys_debug_setcontext		sys_debug_setcontext		sys_ni_syscall
> @@ -390,7 +390,7 @@
>  305	common	signalfd			sys_signalfd			compat_sys_signalfd
>  306	common	timerfd_create			sys_timerfd_create
>  307	common	eventfd				sys_eventfd
> -308	common	sync_file_range2		sys_sync_file_range2		compat_sys_sync_file_=
range2
> +308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_f=
ile_range2
>  309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
>  310	nospu	subpage_prot			sys_subpage_prot
>  311	32	timerfd_settime			sys_timerfd_settime32
> diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/p=
erf/arch/powerpc/entry/syscalls/syscall.tbl
> index 4cbbb810ae10..b4c970c9c6b1 100644
> --- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> +++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> @@ -178,9 +178,9 @@
>  133	common	fchdir				sys_fchdir
>  134	common	bdflush				sys_ni_syscall
>  135	common	sysfs				sys_sysfs
> -136	32	personality			sys_personality			ppc64_personality
> -136	64	personality			ppc64_personality
> -136	spu	personality			ppc64_personality
> +136	32	personality			sys_personality			compat_sys_ppc64_personality
> +136	64	personality			sys_ppc64_personality
> +136	spu	personality			sys_ppc64_personality
>  137	common	afs_syscall			sys_ni_syscall
>  138	common	setfsuid			sys_setfsuid
>  139	common	setfsgid			sys_setfsgid
> @@ -228,8 +228,8 @@
>  176	64	rt_sigtimedwait			sys_rt_sigtimedwait
>  177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueue=
info
>  178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
> -179	common	pread64				sys_pread64			compat_sys_pread64
> -180	common	pwrite64			sys_pwrite64			compat_sys_pwrite64
> +179	common	pread64				sys_pread64			compat_sys_ppc_pread64
> +180	common	pwrite64			sys_pwrite64			compat_sys_ppc_pwrite64
>  181	common	chown				sys_chown
>  182	common	getcwd				sys_getcwd
>  183	common	capget				sys_capget
> @@ -242,10 +242,10 @@
>  188	common 	putpmsg				sys_ni_syscall
>  189	nospu	vfork				sys_vfork
>  190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
> -191	common	readahead			sys_readahead			compat_sys_readahead
> +191	common	readahead			sys_readahead			compat_sys_ppc_readahead
>  192	32	mmap2				sys_mmap2			compat_sys_mmap2
> -193	32	truncate64			sys_truncate64			compat_sys_truncate64
> -194	32	ftruncate64			sys_ftruncate64			compat_sys_ftruncate64
> +193	32	truncate64			sys_truncate64			compat_sys_ppc_truncate64
> +194	32	ftruncate64			sys_ftruncate64			compat_sys_ppc_ftruncate64
>  195	32	stat64				sys_stat64
>  196	32	lstat64				sys_lstat64
>  197	32	fstat64				sys_fstat64
> @@ -288,7 +288,7 @@
>  230	common	io_submit			sys_io_submit			compat_sys_io_submit
>  231	common	io_cancel			sys_io_cancel
>  232	nospu	set_tid_address			sys_set_tid_address
> -233	common	fadvise64			sys_fadvise64			ppc32_fadvise64
> +233	common	fadvise64			sys_fadvise64			compat_sys_ppc32_fadvise64
>  234	nospu	exit_group			sys_exit_group
>  235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
>  236	common	epoll_create			sys_epoll_create
> @@ -323,7 +323,7 @@
>  251	spu	utimes				sys_utimes
>  252	common	statfs64			sys_statfs64			compat_sys_statfs64
>  253	common	fstatfs64			sys_fstatfs64			compat_sys_fstatfs64
> -254	32	fadvise64_64			ppc_fadvise64_64
> +254	32	fadvise64_64			sys_ppc_fadvise64_64
>  254	spu	fadvise64_64			sys_ni_syscall
>  255	common	rtas				sys_rtas
>  256	32	sys_debug_setcontext		sys_debug_setcontext		sys_ni_syscall
> @@ -390,7 +390,7 @@
>  305	common	signalfd			sys_signalfd			compat_sys_signalfd
>  306	common	timerfd_create			sys_timerfd_create
>  307	common	eventfd				sys_eventfd
> -308	common	sync_file_range2		sys_sync_file_range2		compat_sys_sync_file_=
range2
> +308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_f=
ile_range2
>  309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
>  310	nospu	subpage_prot			sys_subpage_prot
>  311	32	timerfd_settime			sys_timerfd_settime32
> --=20
> 2.34.1

