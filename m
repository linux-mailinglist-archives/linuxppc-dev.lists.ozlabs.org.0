Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAEA5B56ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 11:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR0yw02HDz3bdk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 19:04:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GPJTUwB7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GPJTUwB7;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR0yH3JPsz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 19:03:49 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso7503741pjm.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=UMVxhTuexTyRYmLrMgk1+FdhMPlbXwOphrXXpbgw0kw=;
        b=GPJTUwB7wq1Ty88KWkUxWhwwF5ZyvTY9vAHS1ZKrNf9vyGiIHK+Yf7nr21tTTwAzZe
         0c06OPHne7o8JC7I2Vu61XWNSLpgmSsO5Za/MOzs+8CzOTcGq1JXn8BfoUlfiEdMiW1A
         OpoX4Y5ZHaOpa6n4MNxc8RxY56A2aBiZMTZEKMkWe4b8Xjo1+RwOF2RFHOLPgZ//yKCe
         LzxfivtyCpEOF75lSCM5/XAjMVPUn8hlUYx3auF+5owYJRrodptzJv1h2mLxHfcv1NTm
         /pFTXbArpy8YG0WqssFzClFhGqOTgghZKQvu7+UpwKJ/c4zuTMBy9kJql2ZAgbVmeX9s
         6Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=UMVxhTuexTyRYmLrMgk1+FdhMPlbXwOphrXXpbgw0kw=;
        b=fubCGsyGO5r79hCGBZoykGI1rGWOwKcNkhWYui7BqA+8kTUDcxjdxlK94qW/vUoKJi
         VAj0erXpg3qK85L1XsiRsAY5MllAVkFU1Z0V0YCSjrYHC/3Qbl0k2LvTamRFRdl/QXLx
         L8TsOb2aCiMAasOZqmi0VXEk9sVCE8pamwDYoXW+xOF5IidRCUPGj4rnTuNLTpbH7k5L
         3VucOkq7UNjsTEIvfNohpGGBdgIN9pBoDMQylM6BHwdEkeTOKOfzsgp5AjauceONb8XD
         6iFIsBCmYiBwjP/xZ/S17/tjcW2Q5UYJ34UTdYWRn4oOfcTLh/g8DNA4DtWjXhOx3nMh
         sm5g==
X-Gm-Message-State: ACgBeo2OXuu508kwu8xt5gWQ+xisGadgYC7H0UC4v6fUgawnJpatHTLa
	5eU2s9ZQb822OB1WRRvlvXPKSBM3M1M=
X-Google-Smtp-Source: AA6agR6uAtaH7ZVvFxJvuEbyT29djs4mPhv2hkR+9RLa7UrYi7hteT1ZM2SPNo3fOEjUvZmeQHnThw==
X-Received: by 2002:a17:90b:1bc7:b0:200:7f05:3c2 with SMTP id oa7-20020a17090b1bc700b002007f0503c2mr22722777pjb.95.1662973424542;
        Mon, 12 Sep 2022 02:03:44 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b00176cdd80148sm5322057plg.305.2022.09.12.02.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 02:03:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 19:03:39 +1000
Message-Id: <CMUAVMDUD1XS.9X8HB8W4YK1I@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 03/20] powerpc/32: Remove powerpc select
 specialisation
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-4-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-4-rmclure@linux.ibm.com>
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
> Syscall #82 has been implemented for 32-bit platforms in a unique way on
> powerpc systems. This hack will in effect guess whether the caller is
> expecting new select semantics or old select semantics. It does so via a
> guess, based off the first parameter. In new select, this parameter
> represents the length of a user-memory array of file descriptors, and in
> old select this is a pointer to an arguments structure.
>
> The heuristic simply interprets sufficiently large values of its first
> parameter as being a call to old select. The following is a discussion
> on how this syscall should be handled.
>
> Link: https://lore.kernel.org/lkml/13737de5-0eb7-e881-9af0-163b0d29a1a0@c=
sgroup.eu/

Seems okay to me, probably Christophe needs to ack it.
Should some of that history be included directly in this changelog?

Should ppc64 compat be added back too, if this is being updated instead
of removed? I don't know much about compat but it seems odd not provide
it (considering it's just using compat_sys_old_select, isn't it?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> As discussed in this thread, the existence of such a hack suggests that f=
or
> whatever powerpc binaries may predate glibc, it is most likely that they
> would have taken use of the old select semantics. x86 and arm64 both
> implement this syscall with oldselect semantics.
>
> Remove the powerpc implementation, and update syscall.tbl to refer to emi=
t
> a reference to sys_old_select for 32-bit binaries, in keeping with how
> other architectures support syscall #82.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Remove arch-specific select handler
> V2 -> V3: Remove ppc_old_select prototype in <asm/syscalls.h>. Move to
> earlier in patch series
> ---
>  arch/powerpc/include/asm/syscalls.h           |  2 --
>  arch/powerpc/kernel/syscalls.c                | 17 -----------------
>  arch/powerpc/kernel/syscalls/syscall.tbl      |  2 +-
>  .../arch/powerpc/entry/syscalls/syscall.tbl   |  2 +-
>  4 files changed, 2 insertions(+), 21 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index 675a8f5ec3ca..739498c358a1 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -18,8 +18,6 @@ long sys_mmap2(unsigned long addr, size_t len,
>  	       unsigned long fd, unsigned long pgoff);
>  long ppc64_personality(unsigned long personality);
>  long sys_rtas(struct rtas_args __user *uargs);
> -int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
> -	       fd_set __user *exp, struct __kernel_old_timeval __user *tvp);
>  long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_lo=
w,
>  		      u32 len_high, u32 len_low);
> =20
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscall=
s.c
> index fc999140bc27..ef5896bee818 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -63,23 +63,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len=
,
>  	return do_mmap2(addr, len, prot, flags, fd, offset, PAGE_SHIFT);
>  }
> =20
> -#ifdef CONFIG_PPC32
> -/*
> - * Due to some executables calling the wrong select we sometimes
> - * get wrong args.  This determines how the args are being passed
> - * (a single ptr to them all args passed) then calls
> - * sys_select() with the appropriate args. -- Cort
> - */
> -int
> -ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user=
 *exp, struct __kernel_old_timeval __user *tvp)
> -{
> -	if ((unsigned long)n >=3D 4096)
> -		return sys_old_select((void __user *)n);
> -
> -	return sys_select(n, inp, outp, exp, tvp);
> -}
> -#endif
> -
>  #ifdef CONFIG_PPC64
>  long ppc64_personality(unsigned long personality)
>  {
> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kern=
el/syscalls/syscall.tbl
> index 2600b4237292..4cbbb810ae10 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -110,7 +110,7 @@
>  79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
>  80	common	getgroups			sys_getgroups
>  81	common	setgroups			sys_setgroups
> -82	32	select				ppc_select			sys_ni_syscall
> +82	32	select				sys_old_select			sys_ni_syscall
>  82	64	select				sys_ni_syscall
>  82	spu	select				sys_ni_syscall
>  83	common	symlink				sys_symlink
> diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/p=
erf/arch/powerpc/entry/syscalls/syscall.tbl
> index 2600b4237292..4cbbb810ae10 100644
> --- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> +++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> @@ -110,7 +110,7 @@
>  79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
>  80	common	getgroups			sys_getgroups
>  81	common	setgroups			sys_setgroups
> -82	32	select				ppc_select			sys_ni_syscall
> +82	32	select				sys_old_select			sys_ni_syscall
>  82	64	select				sys_ni_syscall
>  82	spu	select				sys_ni_syscall
>  83	common	symlink				sys_symlink
> --=20
> 2.34.1

