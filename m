Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 152FE5B58D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 12:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR3T371nwz3c2Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 20:57:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dlZR8+7r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dlZR8+7r;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR3SP3ml1z2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 20:56:36 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id s206so7926673pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=SELveKpqUFhXenPilYkCJCAF7P1qj+b6T4FlYxWYknU=;
        b=dlZR8+7rJEL00abf0Fj5LrctraamjWVZrJfN9WGLu/1scJNxfSk1Uhq/8TxH2NfRq2
         HYuPY3OgHYKO+vYurjPOIT571IzEQ3sWN4EwaFD4qt3AN88CieYEByTXRzAudx54jOlo
         1Bg9J9Xtn8Ha45xGkrS3lOkyOl74LGddXl4k+39nC9F72CkgshSMfSi0ZIOB7zmG4YYn
         qoesjblT1dL37KLz6Ty24aX+ydTVLqKWqfGr283N5OATUYqAibvlGI5nZFDj1eQz6R72
         Xw3C3hUQKWtT9/puDcfFvkaenLE5X7Vtk8Y5lwoIjTVj0WEoShj2iw7eLEF6oPAPWcGG
         vVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=SELveKpqUFhXenPilYkCJCAF7P1qj+b6T4FlYxWYknU=;
        b=nN/GStaZs5m55Z7eSkBYpeOwX7QMY9tWibEIbLWLQ0+xbJtF0G1dU2ugW3t1/3ykOi
         DgsKzPUVrALk7x0or9Dm72Y2O69DNu/K+92g23+jwbT6wJEFvnFbfxYa5yI2GfHv2msM
         agmz+lVqm1uGC2CXi3prU8maMFtKN2L53w4P3xRKwqiUIvgf1mw0XABLZ00Y4pjXbH8j
         EqJo/GqZJk5QffswrmyLVgIfk6QXM1pYvrUaRJwEinXH9TabZSztk2ccfxdd5xNo6f73
         ceaZkybumbYioSZz/Kl6/67KDLY7mfGLpfniQqC/qQTAu5wnBuJaukY8q1eJnkoPiI9P
         1jTQ==
X-Gm-Message-State: ACgBeo23MHRnsW4GRvd9o8S5TZJzcXScb7vgnmK/GVFAxyQGkVcMYiim
	A9uUeVqvtqELCC/l3c2HbJQiJCFDqrM=
X-Google-Smtp-Source: AA6agR6wKDSK2DhwQp24mErI9wTQ/j2dB8sIZXvMz5HSs7INYSUXWan9ANiW5fuon16RUwEUaj+e7Q==
X-Received: by 2002:a65:6b8a:0:b0:42b:1eca:eef1 with SMTP id d10-20020a656b8a000000b0042b1ecaeef1mr22626824pgw.205.1662980193586;
        Mon, 12 Sep 2022 03:56:33 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id k5-20020aa79985000000b00535d3caa66fsm5095446pfh.197.2022.09.12.03.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:56:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 20:56:29 +1000
Message-Id: <CMUDA0ALFBSI.5KMSI1NSJZH7@bobo>
Subject: Re: [PATCH v4 10/20] powerpc: Use common syscall handler type
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-11-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-11-rmclure@linux.ibm.com>
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
> Cause syscall handlers to be typed as follows when called indirectly
> throughout the kernel.
>
> typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long,
>                            unsigned long, unsigned long, unsigned long);

The point is... better type checking?

>
> Since both 32 and 64-bit abis allow for at least the first six
> machine-word length parameters to a function to be passed by registers,
> even handlers which admit fewer than six parameters may be viewed as
> having the above type.
>
> Fixup comparisons in VDSO to avoid pointer-integer comparison. Introduce
> explicit cast on systems with SPUs.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: New patch.
> V2 -> V3: Remove unnecessary cast from const syscall_fn to syscall_fn
> ---
>  arch/powerpc/include/asm/syscall.h          | 7 +++++--
>  arch/powerpc/include/asm/syscalls.h         | 1 +
>  arch/powerpc/kernel/systbl.c                | 6 +++---
>  arch/powerpc/kernel/vdso.c                  | 4 ++--
>  arch/powerpc/platforms/cell/spu_callbacks.c | 6 +++---
>  5 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/as=
m/syscall.h
> index 25fc8ad9a27a..d2a8dfd5de33 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -14,9 +14,12 @@
>  #include <linux/sched.h>
>  #include <linux/thread_info.h>
> =20
> +typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long,
> +			   unsigned long, unsigned long, unsigned long);
> +
>  /* ftrace syscalls requires exporting the sys_call_table */
> -extern const unsigned long sys_call_table[];
> -extern const unsigned long compat_sys_call_table[];
> +extern const syscall_fn sys_call_table[];
> +extern const syscall_fn compat_sys_call_table[];

Ah you constify it in this patch. I think the previous patch should have
kept the const, and it should keep the unsigned long type rather than
use void *. Either that or do this patch first.

>  static inline int syscall_get_nr(struct task_struct *task, struct pt_reg=
s *regs)
>  {
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index 91417dee534e..e979b7593d2b 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>  #include <linux/compat.h>
> =20
> +#include <asm/syscall.h>
>  #ifdef CONFIG_PPC64
>  #include <asm/syscalls_32.h>
>  #endif

Is this necessary or should be in another patch?

> diff --git a/arch/powerpc/kernel/systbl.c b/arch/powerpc/kernel/systbl.c
> index 99ffdfef6b9c..b88a9c2a1f50 100644
> --- a/arch/powerpc/kernel/systbl.c
> +++ b/arch/powerpc/kernel/systbl.c
> @@ -21,10 +21,10 @@
>  #define __SYSCALL(nr, entry) [nr] =3D __powerpc_##entry,
>  #define __powerpc_sys_ni_syscall	sys_ni_syscall
>  #else
> -#define __SYSCALL(nr, entry) [nr] =3D entry,
> +#define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
>  #endif

Also perhaps this should have been in the prior pach and this pach
should change the cast from void to syscall_fn ?

> =20
> -void *sys_call_table[] =3D {
> +const syscall_fn sys_call_table[] =3D {
>  #ifdef CONFIG_PPC64
>  #include <asm/syscall_table_64.h>
>  #else
> @@ -35,7 +35,7 @@ void *sys_call_table[] =3D {
>  #ifdef CONFIG_COMPAT
>  #undef __SYSCALL_WITH_COMPAT
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
> -void *compat_sys_call_table[] =3D {
> +const syscall_fn compat_sys_call_table[] =3D {
>  #include <asm/syscall_table_32.h>
>  };
>  #endif /* CONFIG_COMPAT */
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index 0da287544054..080c9e7de0c0 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -313,10 +313,10 @@ static void __init vdso_setup_syscall_map(void)
>  	unsigned int i;
> =20
>  	for (i =3D 0; i < NR_syscalls; i++) {
> -		if (sys_call_table[i] !=3D (unsigned long)&sys_ni_syscall)
> +		if (sys_call_table[i] !=3D (void *)&sys_ni_syscall)
>  			vdso_data->syscall_map[i >> 5] |=3D 0x80000000UL >> (i & 0x1f);
>  		if (IS_ENABLED(CONFIG_COMPAT) &&
> -		    compat_sys_call_table[i] !=3D (unsigned long)&sys_ni_syscall)
> +		    compat_sys_call_table[i] !=3D (void *)&sys_ni_syscall)

Also these.

Thanks,
Nick

>  			vdso_data->compat_syscall_map[i >> 5] |=3D 0x80000000UL >> (i & 0x1f)=
;
>  	}
>  }
> diff --git a/arch/powerpc/platforms/cell/spu_callbacks.c b/arch/powerpc/p=
latforms/cell/spu_callbacks.c
> index fe0d8797a00a..e780c14c5733 100644
> --- a/arch/powerpc/platforms/cell/spu_callbacks.c
> +++ b/arch/powerpc/platforms/cell/spu_callbacks.c
> @@ -34,15 +34,15 @@
>   *	mbind, mq_open, ipc, ...
>   */
> =20
> -static void *spu_syscall_table[] =3D {
> +static const syscall_fn spu_syscall_table[] =3D {
>  #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
> -#define __SYSCALL(nr, entry) [nr] =3D entry,
> +#define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
>  #include <asm/syscall_table_spu.h>
>  };
> =20
>  long spu_sys_callback(struct spu_syscall_block *s)
>  {
> -	long (*syscall)(u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6);
> +	syscall_fn syscall;
> =20
>  	if (s->nr_ret >=3D ARRAY_SIZE(spu_syscall_table)) {
>  		pr_debug("%s: invalid syscall #%lld", __func__, s->nr_ret);
> --=20
> 2.34.1

