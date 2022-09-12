Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61F5B5671
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:39:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR0Q62Qlsz3cdd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:39:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LemjJEYI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LemjJEYI;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR0PS20rcz2xJD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:38:51 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id z9-20020a17090a468900b001ffff693b27so7468011pjf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=fv3qHwXokPjsqPP6SYzvt16YuaY7hf/IajhkORfyY6A=;
        b=LemjJEYIqJZafsp7H9l0A+ciNA5S1j/TTVaQJ9BnBWGFjFBo5A7sNw8/ZTo4ATjht9
         daTIl89zA4PUXu7t3PBEGWu+ie3I4E8LB9LKAg+LTcmQ54WSOa5ln80SKAj3lxQbEfQz
         rIBMHGJnQfMbDVJZn8yVg9Uh6Go73xOxIyySeYbfSEOTrSsbb/OGNVVczRmOsHA0lZCn
         t9SbL4SQkvIehcWaXChV3qJK+0p/FuNKO782RLvJ7v1VCwSqYbzbk9YDgu6G+s51+2Zv
         5g01EMaM4swuLCgPP321V6moFdr7fS3nYLksEaogMYv9MHuTXWx4WoY382KTcxufz4lw
         iQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=fv3qHwXokPjsqPP6SYzvt16YuaY7hf/IajhkORfyY6A=;
        b=eUfsFmR8UXVKtto6LuuPpvYImMSCgb56o+sXpesmn1fdFDk3CW0eRridYiT1mAkmHC
         elVuYBL2NLZAV1NR7sprPeCMP+R0NK2GKyQgGLuqPAMizI89JHt3H9fOZ414Oa/1+Kwa
         DzPW6IF3f/66tSiAqoQaJfCYUeRKDwoqpywavxN/iAokE5QZXlTQR/2qk/X9QGSf5/a7
         q14eShU0Xkf0wggRYpU7vJecpJk2bJOQHVUZt0b4zVjrmWudVoFGCvgUw4IVNgqfzUGR
         WQJsoQT034m8hJrxBIVp734KWf+PXN9u5p5e9XyKPFV+hu4uCSBALfT+F2Gf5IUs7oMp
         8dhA==
X-Gm-Message-State: ACgBeo3XbPq8He7fW0pDZdMXPvhZzHGGTaeQ+0zsh+r4IwpYi3m8PKvp
	sa45CwYK1Jo00stDlzJbZFc=
X-Google-Smtp-Source: AA6agR6lijxs6wpQTHMr7cbJD0B0VylmQspTRsTvWLifsohjOWSQEyK+cjgCx6cAm67HA6O2JvUCRw==
X-Received: by 2002:a17:90a:4d82:b0:1fb:6497:e071 with SMTP id m2-20020a17090a4d8200b001fb6497e071mr22540363pjh.166.1662971928365;
        Mon, 12 Sep 2022 01:38:48 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id f14-20020a170902684e00b001641b2d61d4sm5407941pln.30.2022.09.12.01.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 01:38:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 18:38:43 +1000
Message-Id: <CMUACJ7N6P9U.2UABBGZM71SQ6@bobo>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 02/20] powerpc: Use generic fallocate compatibility
 syscall
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-3-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-3-rmclure@linux.ibm.com>
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
> The powerpc fallocate compat syscall handler is identical to the
> generic implementation provided by commit 59c10c52f573f ("riscv:
> compat: syscall: Add compat_sys_call_table implementation"), and as
> such can be removed in favour of the generic implementation.
>
> A future patch series will replace more architecture-defined syscall
> handlers with generic implementations, dependent on introducing generic
> implementations that are compatible with powerpc and arm's parameter
> reorderings.
>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Remove arch-specific fallocate handler.
> V2 -> V3: Remove generic fallocate prototype. Move to beginning of
> series.
> ---
>  arch/powerpc/include/asm/compat.h   | 5 +++++
>  arch/powerpc/include/asm/syscalls.h | 2 --
>  arch/powerpc/include/asm/unistd.h   | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm=
/compat.h
> index dda4091fd012..f20caae3f019 100644
> --- a/arch/powerpc/include/asm/compat.h
> +++ b/arch/powerpc/include/asm/compat.h
> @@ -16,6 +16,11 @@ typedef u16		compat_ipc_pid_t;
>  #include <asm-generic/compat.h>
> =20
>  #ifdef __BIG_ENDIAN__
> +#define compat_arg_u64(name)		u32  name##_hi, u32  name##_lo
> +#define compat_arg_u64_dual(name)	u32, name##_hi, u32, name##_lo
> +#define compat_arg_u64_glue(name)	(((u64)name##_lo & 0xffffffffUL) | \
> +					 ((u64)name##_hi << 32))

Is there a reason not to put this in asm-generic/compat.h?

Possibly you want to put this with the other compat definitions and
above the asm-generic include. The generic header expects the arch to
include it after defining what it wants to override.

Not sure why x_lo gets cast from u32 to u64 and masked before the |
there, but generic code does the same so this isn't the place to
change it.

Thanks,
Nick


> +
>  #define COMPAT_UTS_MACHINE	"ppc\0\0"
>  #else
>  #define COMPAT_UTS_MACHINE	"ppcle\0\0"
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index 21c2faaa2957..675a8f5ec3ca 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -39,8 +39,6 @@ compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32=
 offset1, u32 offset2, u3
>  int compat_sys_truncate64(const char __user *path, u32 reg4,
>  			  unsigned long len1, unsigned long len2);
> =20
> -long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, u3=
2 len1, u32 len2);
> -
>  int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1=
,
>  			   unsigned long len2);
> =20
> diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm=
/unistd.h
> index b1129b4ef57d..659a996c75aa 100644
> --- a/arch/powerpc/include/asm/unistd.h
> +++ b/arch/powerpc/include/asm/unistd.h
> @@ -45,6 +45,7 @@
>  #define __ARCH_WANT_SYS_UTIME
>  #define __ARCH_WANT_SYS_NEWFSTATAT
>  #define __ARCH_WANT_COMPAT_STAT
> +#define __ARCH_WANT_COMPAT_FALLOCATE
>  #define __ARCH_WANT_COMPAT_SYS_SENDFILE
>  #endif
>  #define __ARCH_WANT_SYS_FORK
> --=20
> 2.34.1

