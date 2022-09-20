Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 312AE5BD972
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWkkG0CZtz307g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 11:39:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RWaoPs6p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RWaoPs6p;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWkjZ6xD4z2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 11:39:12 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso5225749pjk.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 18:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=l2yMtNMI/OYd4WrfnbQ9bQLizOfggyM3qKTkC0REZ4c=;
        b=RWaoPs6ps21lP+c9M6tAyyFzJO6/CjvAIuMqxjNRexuRj2443bsLQ3RChPocpdbc+R
         VUobl3CrJqmZUaF7GKgC2Z4ZdryUcO/85Lm3Gi2se1xsDVnJdDlpoog6Kd3wtEtzOjRV
         C/x7sritS8HotBI66AqM7Tiykr71JZmQoqWgvqpc08+PXkF5+z9/5K9tHQJD6n58nCaW
         mXJ/ZaOlNg93zYKLA7D8u8Y+BjgKUlBMDGnz81rGLRUHddEni8kWuKx1STcc1+VLjWen
         HWCJTpGKriCJF+yE8Vqb+QwlIyJ4nrZYLxWG/m0PqvvGIZ1MDkrsOzKNgYkqQQirgGOf
         Y4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=l2yMtNMI/OYd4WrfnbQ9bQLizOfggyM3qKTkC0REZ4c=;
        b=BuA+nlN6xywrMUCxeFSjX9iBwaQpLY6WKNkb5iUlxsUIortNCxri8BUw1nlYLbJc7n
         NbZDpSaOoOFUweHsP/PejITpUZ7IbNgCA0rB0GW8jF0SMALSohTbxCPb/sxsWcNEFGnM
         SxpJRy2MSYYsZWYFRTcNT2iYymUXi84DeZ3g/kA4uoxWKUozH+6FVdPg3sJn1ouO/Bea
         +nRVk7ZcXHL0nLeT141i9LU6jl8dTHv3mr5RqToIbNUc0t7/t3dHor21gUEPmrNVxErM
         7dQLxRXBJEOgmABEHiFuo0o83y2L2W4QFj8+UZ8fvk3Y77iG+q/hQYyBlv8J5UcJlNOE
         A0fg==
X-Gm-Message-State: ACrzQf25uq3R7+8i8JF1dqbBzPaw50EswxQv60bvOtIwJTGpYazYyVq7
	yC+93iLzt6L3h6Xf+J0DP+TLXo8l5RE=
X-Google-Smtp-Source: AMsMyM7hSlrEWDZRqIRDOxs8rTuWaT8+FNc0GT8Xu/cOHTUk9h9a5bYFCNmZDs0jz3QimSIUrTPqfQ==
X-Received: by 2002:a17:90b:1b4c:b0:202:c1a3:25ce with SMTP id nv12-20020a17090b1b4c00b00202c1a325cemr1213364pjb.232.1663637950756;
        Mon, 19 Sep 2022 18:39:10 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001788ccecbf5sm64737plh.31.2022.09.19.18.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 18:39:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 11:39:06 +1000
Message-Id: <CN0UFLP2BHVT.A77F00ZJRZA4@bobo>
Subject: Re: [PATCH 18/23] powerpc: Use common syscall handler type
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-19-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-19-rmclure@linux.ibm.com>
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
> Cause syscall handlers to be typed as follows when called indirectly
> throughout the kernel. This is to allow for better type checking.
>
> typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long,
>                            unsigned long, unsigned long, unsigned long);
>
> Since both 32 and 64-bit abis allow for at least the first six
> machine-word length parameters to a function to be passed by registers,
> even handlers which admit fewer than six parameters may be viewed as
> having the above type.
>
> Coercing syscalls to syscall_fn requires a cast to void* to avoid
> -Wcast-function-type.

This could possibly be a comment in systbl.c as well?

>
> Fixup comparisons in VDSO to avoid pointer-integer comparison. Introduce
> explicit cast on systems with SPUs.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: New patch.
> V2 -> V3: Remove unnecessary cast from const syscall_fn to syscall_fn
> V4 -> V5: Update patch description.
> ---
>  arch/powerpc/include/asm/syscall.h          | 7 +++++--
>  arch/powerpc/include/asm/syscalls.h         | 1 +
>  arch/powerpc/kernel/systbl.c                | 6 +++---
>  arch/powerpc/kernel/vdso.c                  | 4 ++--
>  arch/powerpc/platforms/cell/spu_callbacks.c | 6 +++---

What's happened to arch/powerpc/kernel/syscall.c? We have
approximately the same type defined there with the same name.
That can just use your new type AFAIKS.

We're hopefully solving the rodata thing separately, so long
as you've got the const there that's enough.

Other than that,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

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
> =20
>  static inline int syscall_get_nr(struct task_struct *task, struct pt_reg=
s *regs)
>  {
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index 5d106acf7906..cc87168d6ecb 100644
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
> diff --git a/arch/powerpc/kernel/systbl.c b/arch/powerpc/kernel/systbl.c
> index ce52bd2ec292..e5d419822b4e 100644
> --- a/arch/powerpc/kernel/systbl.c
> +++ b/arch/powerpc/kernel/systbl.c
> @@ -16,9 +16,9 @@
>  #include <asm/syscalls.h>
> =20
>  #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
> -#define __SYSCALL(nr, entry) [nr] =3D (unsigned long) &entry,
> +#define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
> =20
> -const unsigned long sys_call_table[] =3D {
> +const syscall_fn sys_call_table[] =3D {
>  #ifdef CONFIG_PPC64
>  #include <asm/syscall_table_64.h>
>  #else
> @@ -29,7 +29,7 @@ const unsigned long sys_call_table[] =3D {
>  #ifdef CONFIG_COMPAT
>  #undef __SYSCALL_WITH_COMPAT
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
> -const unsigned long compat_sys_call_table[] =3D {
> +const syscall_fn compat_sys_call_table[] =3D {
>  #include <asm/syscall_table_32.h>
>  };
>  #endif /* CONFIG_COMPAT */
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index bf9574ec26ce..fcca06d200d3 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -304,10 +304,10 @@ static void __init vdso_setup_syscall_map(void)
>  	unsigned int i;
> =20
>  	for (i =3D 0; i < NR_syscalls; i++) {
> -		if (sys_call_table[i] !=3D (unsigned long)&sys_ni_syscall)
> +		if (sys_call_table[i] !=3D (void *)&sys_ni_syscall)
>  			vdso_data->syscall_map[i >> 5] |=3D 0x80000000UL >> (i & 0x1f);
>  		if (IS_ENABLED(CONFIG_COMPAT) &&
> -		    compat_sys_call_table[i] !=3D (unsigned long)&sys_ni_syscall)
> +		    compat_sys_call_table[i] !=3D (void *)&sys_ni_syscall)
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

