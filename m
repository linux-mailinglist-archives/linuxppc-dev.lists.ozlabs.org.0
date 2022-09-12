Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 721AC5B5897
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 12:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR38x199Qz3c2R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 20:43:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eG++1Myb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eG++1Myb;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR38K341Jz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 20:42:39 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id b21so8172146plz.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=e8i3AEXWk+a/KfQ+pkaBKZPSaucmrJXCXprCtbpwRd8=;
        b=eG++1MybL2CNZl5UfHC5yEODotFrPC7b2BZQSE437o/iaJ9DuiMnAfqzxqRapeWXat
         ExPYH2Rf/iaSwtIH5+gEz8bfCGPvTxl5aUYGNyDmVaGq7caxdZv7Ketq8X9H343Qa18W
         FexJIjzsl/s0pCi+OJgXd4lQGfIVGQRDPPUPcgTVPwXvHmp8PXh72gQbdKuMLtvYFMVq
         +0cb0rYk9qqD43+yN6eF9axng2woXxiQUFSczOSMwdCDqgXPIBbQNTxiquBrEFcY6omT
         eV+c7OWT2/pS/naOw/4TFmc1edd2CEr2oIJc8d8ywapg8zaXJMHmdia1JoAkcW/Q5Nth
         9jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=e8i3AEXWk+a/KfQ+pkaBKZPSaucmrJXCXprCtbpwRd8=;
        b=PAbwvdL2Oo+eD8d1YzJE8nxe2frZVhQA+56HNnxxfScv87hnf6OJLnMQb0h84pyrjy
         btl08eX4JsG2k6TOlOoxOZ08XIo4CpYwZF9OCD2qE8g+E3JC4gKvNXZbQ0iMOb8Ug1yf
         muXORPv2eWFBn3rd5spJeBzIL1uwxx7BjbBpgcy2g4EpRFa3il6C/j0knFPK7ccwhZVc
         /fAhbXn9PKSzZ7Me+ly2APujjsIGxvJtWRTpf3nmB7Oxk2N4uNbN+lP9tqts9axVEO/U
         3eak5sqxagKFNwbipqq8N5wMx5yAuXg8hqQiHg4fPma9Ujx4RY/VgxvOFB3sGiaQfgLv
         Yw3g==
X-Gm-Message-State: ACgBeo36su5A8edN6y9pHoIluA5n98d5et60XVJHwah+OVMXKa15T60D
	6UZbZrCQJ60UzkJdtTKZfLk=
X-Google-Smtp-Source: AA6agR5ik6YJ1txxOmsGJtPROAhvRGk5JjVWXpifJ5B3s5E0rx7jwSZbkqvLBfE0iU/UsDuZ/zMmkQ==
X-Received: by 2002:a17:902:d512:b0:178:2898:8099 with SMTP id b18-20020a170902d51200b0017828988099mr7375096plg.131.1662979357586;
        Mon, 12 Sep 2022 03:42:37 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id ij9-20020a170902ab4900b0016ee4b0bd60sm5603618plb.166.2022.09.12.03.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:42:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 20:42:32 +1000
Message-Id: <CMUCZC1TQBYV.T5VOLUARFB7C@bobo>
Subject: Re: [PATCH v4 09/20] powerpc: Enable compile-time check for syscall
 handlers
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-10-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-10-rmclure@linux.ibm.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> The table of syscall handlers and registered compatibility syscall
> handlers has in past been produced using assembly, with function
> references resolved at link time. This moves link-time errors to
> compile-time, by rewriting systbl.S in C, and including the
> linux/syscalls.h, linux/compat.h and asm/syscalls.h headers for
> prototypes.

Well this is pretty cool.

Unrelated, but since commit ab66dcc76d6a, is
arch/powerpc/kernel/systbl_chk.sh unused in the tree?

>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: New patch.
> ---
>  arch/powerpc/kernel/{systbl.S =3D> systbl.c} | 27 ++++++++++----------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.c
> similarity index 59%
> rename from arch/powerpc/kernel/systbl.S
> rename to arch/powerpc/kernel/systbl.c
> index cb3358886203..99ffdfef6b9c 100644
> --- a/arch/powerpc/kernel/systbl.S
> +++ b/arch/powerpc/kernel/systbl.c
> @@ -10,31 +10,32 @@
>   * PPC64 updates by Dave Engebretsen (engebret@us.ibm.com)=20
>   */
> =20
> -#include <asm/ppc_asm.h>
> +#include <linux/syscalls.h>
> +#include <linux/compat.h>
> +#include <asm/unistd.h>
> +#include <asm/syscalls.h>
> =20
> -.section .rodata,"a"
> +#define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
> =20
> -#ifdef CONFIG_PPC64
> -	.p2align	3
> -#define __SYSCALL(nr, entry)	.8byte entry
> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +#define __SYSCALL(nr, entry) [nr] =3D __powerpc_##entry,
> +#define __powerpc_sys_ni_syscall	sys_ni_syscall
>  #else
> -#define __SYSCALL(nr, entry)	.long entry
> +#define __SYSCALL(nr, entry) [nr] =3D entry,
>  #endif
> =20
> -#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
> -.globl sys_call_table
> -sys_call_table:
> +void *sys_call_table[] =3D {

Humour me, the asm version had this in rodata, does this change that or
does it somehow get put back in there? Should this be const?

Otherwise,=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>  #ifdef CONFIG_PPC64
>  #include <asm/syscall_table_64.h>
>  #else
>  #include <asm/syscall_table_32.h>
>  #endif
> +};
> =20
>  #ifdef CONFIG_COMPAT
>  #undef __SYSCALL_WITH_COMPAT
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
> -.globl compat_sys_call_table
> -compat_sys_call_table:
> -#define compat_sys_sigsuspend	sys_sigsuspend
> +void *compat_sys_call_table[] =3D {
>  #include <asm/syscall_table_32.h>
> -#endif
> +};
> +#endif /* CONFIG_COMPAT */
> --=20
> 2.34.1

