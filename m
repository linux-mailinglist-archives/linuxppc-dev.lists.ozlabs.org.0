Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F425BD900
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWjtl4VLZz3blJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 11:02:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FVSHCzNn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FVSHCzNn;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWjtB6MMQz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 11:01:36 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id w20so828897ply.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 18:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=RAgaoHsDo3elt18PP4XWqgizEgnhXAxIau+PGg9qH74=;
        b=FVSHCzNnX+wlpK/1lCEk8ySdC03fI2OUFiHoq91htYKoM0kMY+chC5dHd1lIOQJzxw
         5kj7JCKlHmnhMURAaGo3q10h/msIwqERRcT+OoKcC0vJrR2qO54BeDblfSrpT7mZZfa8
         sIRfkJvOABuxiao4M68rL1+IWnRd53nO14FOsQXJ48wNRvNFjQ7ysOFck+8DW3r4Mleo
         idI4WCAj5AN0AtEQ2n2UVQqUbFc3OGlupNL+c2xFXVCYwy9/BI42cRtzlMVwR0FfI0f/
         hJsLIrEMrf1kzC3A7HlUg2lHlNJnRYa9t6revS5qOUotiLwnYAqsd1qvdPUh4s0WugUp
         /YCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=RAgaoHsDo3elt18PP4XWqgizEgnhXAxIau+PGg9qH74=;
        b=POi72tDGQaGqtyHQkFjzr1hpmlqQCXrdxLZTygJ5MB0oseWc4ggUuaAAfOVZ3yQQ63
         Cr1ZCnVvLrhkntIrqfvdd7O5i7LKOb2Foi4E7EEyf0hCKo+7MMtvRDkE4LrJeNs+eUez
         TCga4MSGKOofBdwBfRnmz+jueztiE9h/599hjiD141GZcxQRuBjQ0/siR1S6YUGG/god
         sJTm4VRzsdRgCRxYo81MZTPfWNg6RJpT2QHuOfkJUWfg30+usUzakrbr5+9xxVet2FIA
         PaRBoW3MsA5VjpVp1m2idizc+/m+Aed3zovsi823YEOkrnmozqDzpFxPplEyPwYNPPPs
         5x2Q==
X-Gm-Message-State: ACrzQf1BcR/Us+Nzpz7npQOb4bgRIThGkzAB4qieAT/mBBI4RcihPsOS
	cCJZLdpj/ViCbKpqwdMbD2s=
X-Google-Smtp-Source: AMsMyM6w1zmPr215FleTRE9u13BqEjPJLvaMeJdvinBOzm+3a5qDEoLPyKqJzYjDWb3f11N/gQbKMw==
X-Received: by 2002:a17:902:ec85:b0:178:8a69:45fb with SMTP id x5-20020a170902ec8500b001788a6945fbmr2396080plg.130.1663635694695;
        Mon, 19 Sep 2022 18:01:34 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id f128-20020a623886000000b00541c68a0689sm39273pfa.7.2022.09.19.18.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 18:01:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 11:01:29 +1000
Message-Id: <CN0TMSVQE1BM.2R2K6AA15GQDM@bobo>
Subject: Re: [PATCH 08/23] powerpc: Fix fallocate and fadvise64_64 compat
 parameter combination
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-9-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-9-rmclure@linux.ibm.com>
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
> As reported[1] by Arnd, the arch-specific fadvise64_64 and fallocate
> compatibility handlers assume parameters are passed with 32-bit
> big-endian ABI. This affects the assignment of odd-even parameter pairs
> to the high or low words of a 64-bit syscall parameter.
>
> Fix fadvise64_64 fallocate compat handlers to correctly swap upper/lower
> 32 bits conditioned on endianness.
>
> A future patch will replace the arch-specific compat fallocate with an
> asm-generic implementation. This patch is intended for ease of
> back-port.
>
> [1]: https://lore.kernel.org/all/be29926f-226e-48dc-871a-e29a54e80583@www=
.fastmail.com/
>
> Fixes: 57f48b4b74e7 ("powerpc/compat_sys: swap hi/lo parts of 64-bit sysc=
all args in LE mode")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

I'm still not sure if ppc32 is usable with LE kernel, but in any case
the patch is good I think.

Reviewed-by: Nicholas Piggin <npiggin@gmai.com>

> ---
> V4 -> V5: New patch.
> ---
>  arch/powerpc/include/asm/syscalls.h | 12 ++++++++++++
>  arch/powerpc/kernel/sys_ppc32.c     | 14 +-------------
>  arch/powerpc/kernel/syscalls.c      |  4 ++--
>  3 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index 21c2faaa2957..16b668515d15 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -8,6 +8,18 @@
>  #include <linux/types.h>
>  #include <linux/compat.h>
> =20
> +/*
> + * long long munging:
> + * The 32 bit ABI passes long longs in an odd even register pair.
> + * High and low parts are swapped depending on endian mode,
> + * so define a macro (similar to mips linux32) to handle that.
> + */
> +#ifdef __LITTLE_ENDIAN__
> +#define merge_64(low, high) ((u64)high << 32) | low
> +#else
> +#define merge_64(high, low) ((u64)high << 32) | low
> +#endif
> +
>  struct rtas_args;
> =20
>  long sys_mmap(unsigned long addr, size_t len,
> diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_pp=
c32.c
> index f4edcc9489fb..ba363328da2b 100644
> --- a/arch/powerpc/kernel/sys_ppc32.c
> +++ b/arch/powerpc/kernel/sys_ppc32.c
> @@ -56,18 +56,6 @@ unsigned long compat_sys_mmap2(unsigned long addr, siz=
e_t len,
>  	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
>  }
> =20
> -/*=20
> - * long long munging:
> - * The 32 bit ABI passes long longs in an odd even register pair.
> - * High and low parts are swapped depending on endian mode,
> - * so define a macro (similar to mips linux32) to handle that.
> - */
> -#ifdef __LITTLE_ENDIAN__
> -#define merge_64(low, high) ((u64)high << 32) | low
> -#else
> -#define merge_64(high, low) ((u64)high << 32) | low
> -#endif
> -
>  compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, co=
mpat_size_t count,
>  			     u32 reg6, u32 pos1, u32 pos2)
>  {
> @@ -94,7 +82,7 @@ int compat_sys_truncate64(const char __user * path, u32=
 reg4,
>  long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
>  				     u32 len1, u32 len2)
>  {
> -	return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
> +	return ksys_fallocate(fd, mode, merge_64(offset1, offset2),
>  			     merge_64(len1, len2));
>  }
> =20
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscall=
s.c
> index fc999140bc27..abc3fbb3c490 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -98,8 +98,8 @@ long ppc64_personality(unsigned long personality)
>  long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_lo=
w,
>  		      u32 len_high, u32 len_low)
>  {
> -	return ksys_fadvise64_64(fd, (u64)offset_high << 32 | offset_low,
> -				 (u64)len_high << 32 | len_low, advice);
> +	return ksys_fadvise64_64(fd, merge_64(offset_high, offset_low),
> +				 merge_64(len_high, len_low), advice);
>  }
> =20
>  SYSCALL_DEFINE0(switch_endian)
> --=20
> 2.34.1

