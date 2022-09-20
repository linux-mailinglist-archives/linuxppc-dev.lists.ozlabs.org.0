Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A25BD963
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWkXB2fJdz3c42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 11:31:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dZqMGhQN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dZqMGhQN;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWkWZ5QLtz2xJS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 11:30:32 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id bh13so1043690pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 18:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=mRb3qVUCae9tpxft3cduTET9jhig4IHJ6IDwPQeSAvM=;
        b=dZqMGhQNsol+UY4O+9xlzLDtpkG9DQYqA7g5X+Zzr3zSoImUst2hDShW8SIL9s0ona
         qvSSjckWjkF4VsnbRX+yvSKQmsUmTzZAESlfSAZWfeGEy5GO5zr6br2I3ES7/V1nGlg+
         hFaOaeenxQl0/nNrBSPYKoWNeOrFIM46wrmGAFE1VHQ9HPQflqWdeysnUdh0IpnHi5Tm
         YpJOpQVdRCz3VVKWug49qUyCMP+hqRuzbNKDJ/LSZLgjExgaHXXxkANG3vFYNtuH/1ro
         ygdFac2PWfHJT4m4hWkYrwWbQs7lvZET4+1CXp0tMiKilzdqwl6GwVA6FZLEhPRxeWDH
         C2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=mRb3qVUCae9tpxft3cduTET9jhig4IHJ6IDwPQeSAvM=;
        b=mBTD5oNP7lsp2d6eEGpXVlEtVulepRAZ7/Q5XymV6UzXwITbnYpzgSlXijGEscvEEe
         FWuQcKuKUKZBnI9CMD2Rz8ZXhRuIXTsCtcYEnPDO3q9UwjXQcTQ6t0tfhydQj8wVZ4QS
         iNitKLTxY+ILwzXyJVp++QB10tJrLhOG/oaX8ZUTo2u8sjs9ICIVIGQoGtARPpl6Qbsn
         HXJrdgVqr+zAag8jODVgZ91vT3nCqF3X+M/MfOEGSj8QZMiYt5RGGDWjkcsRhmdfxJ0g
         aWnMFrwB2F6FC1ibKt07aUotmSccENh6WNGuDQEfKno6BvU6yT4NPQtmZ0aKqjBrQR8y
         dBzg==
X-Gm-Message-State: ACrzQf0BhVX9xDjuTT4aXCYVQZGiAU1MtGN6BAeJBy63c1dC4oJACdfT
	02OGeoWfJZ0cNnxLxGABHO3vWCMIKbI=
X-Google-Smtp-Source: AMsMyM6Ttr36l+kAeIn8nawv8s1bao73ZzJCx1CNEQm6c+9ubzd1fLbIjYx4hv+J3Ze6yqJhy7h0Ew==
X-Received: by 2002:a63:4ca:0:b0:434:b550:2115 with SMTP id 193-20020a6304ca000000b00434b5502115mr17881617pge.203.1663637430758;
        Mon, 19 Sep 2022 18:30:30 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b00172d0c7edf4sm48856plh.106.2022.09.19.18.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 18:30:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 11:30:25 +1000
Message-Id: <CN0U8YDYVPMM.3UYCVY2V79L0@bobo>
Subject: Re: [PATCH 17/23] powerpc: Enable compile-time check for syscall
 handlers
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-18-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-18-rmclure@linux.ibm.com>
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

On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
> The table of syscall handlers and registered compatibility syscall
> handlers has in past been produced using assembly, with function
> references resolved at link time. This moves link-time errors to
> compile-time, by rewriting systbl.S in C, and including the
> linux/syscalls.h, linux/compat.h and asm/syscalls.h headers for
> prototypes.
>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> V1 -> V2: New patch.
> V4 -> V5: For this patch only, represent handler function pointers as
> unsigned long. Remove reference to syscall wrappers. Use asm/syscalls.h
> which implies asm/syscall.h

Thanks, I think this is the right way to split the patches.

I'm not sure if I reported this issue, but I really like the patch.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kernel/{systbl.S =3D> systbl.c} | 28 ++++++++------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.c
> similarity index 61%
> rename from arch/powerpc/kernel/systbl.S
> rename to arch/powerpc/kernel/systbl.c
> index 6c1db3b6de2d..ce52bd2ec292 100644
> --- a/arch/powerpc/kernel/systbl.S
> +++ b/arch/powerpc/kernel/systbl.c
> @@ -10,32 +10,26 @@
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
> +#define __SYSCALL(nr, entry) [nr] =3D (unsigned long) &entry,
> =20
> -#ifdef CONFIG_PPC64
> -	.p2align	3
> -#define __SYSCALL(nr, entry)	.8byte entry
> -#else
> -	.p2align	2
> -#define __SYSCALL(nr, entry)	.long entry
> -#endif
> -
> -#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
> -.globl sys_call_table
> -sys_call_table:
> +const unsigned long sys_call_table[] =3D {
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
> +const unsigned long compat_sys_call_table[] =3D {
>  #include <asm/syscall_table_32.h>
> -#endif
> +};
> +#endif /* CONFIG_COMPAT */
> --=20
> 2.34.1

