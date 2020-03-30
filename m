Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC61980EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 18:23:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rd6S1lCdzDqgp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 03:22:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CH3DXNhk; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rd4G1WXnzDqfN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 03:21:01 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id d17so8900115pgo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rSae6Vewe/pKHx71bupn1zsciiuzANk0QhhWFPsLGxo=;
 b=CH3DXNhkiamE3xgHese3GbwPpKauxiSrqiFNgPQGy2CLyT2p0W+026JXQ9etIiFRmQ
 JCp/JjKX1pwU95Ziy5tV5U+S88N1wtdu+KbzL2rcF5OTDK5TiYk2ILK6CefvHq/Siw6Z
 AiqnEWVeI1fGXo9BQaUq1zyzHHUN6Utt7AFbq3eEOU61nlHbBzvLv74p6MC2cAAqn8cd
 1gRGIbIjDlaqzmSRyYkfeSIt1I37Hym9fFjYO/I73XQqQTjIIC+euazZee7wuWrW88K5
 XlQIEbXSOfjVT/KiYi47WH4hbaYsx+iHcjsilRxfgbRD48RI3MIMdQsvza+PrRoXXeKf
 07aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rSae6Vewe/pKHx71bupn1zsciiuzANk0QhhWFPsLGxo=;
 b=UtCOF4EhK5fjAeC0JE7AXvrIPyUp8454Q6Fvq6Kh8SwCrzSV3HrZCdBoN3GvkbOKTl
 cZE6akMjsVN97t+B6Ljy+4tvwj0LEMa5g3CmooDSMwhizPIwRwOu6JKk0/XO2UmSh2Dx
 TdGa0177v5zdrt1jgDWEMnf0lwImekHAU3GYZlMJ/e7ox8LPnxp9gu3gk5iaRDTRcUP4
 Fib+Di6FpkO770H57gJ6XeSxpdZMZFGY6EgomWgRTugoNN0HgUt3Yx7XuzKNyn6XohV3
 WUJK+qbw6633LOx6+HQyvRBw9TwpjNWOIBHHLXMNkhws3wl02r0IXJyMQYAjW2FcB9DB
 jMTg==
X-Gm-Message-State: AGi0PuaLAaALsdn7BVwS8wH3swHytBn+2xlwXP6jcPpGDMgdMc5sFfKm
 YTrEp2za+an67pHFZZLT6Yhh5s1MsmT7IjOv0JpNvA==
X-Google-Smtp-Source: APiQypLuCzCsbkG5giznCGJJrHmX0Nt01re4K/iPIu/36KlIa1mVFCUVCpNIEc9Rp031yqlIuMSW4Np8rDwTZfTSRAg=
X-Received: by 2002:a63:f963:: with SMTP id q35mr6219088pgk.381.1585585258519; 
 Mon, 30 Mar 2020 09:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200327100801.161671-1-courbet@google.com>
 <20200330080400.124803-1-courbet@google.com>
In-Reply-To: <20200330080400.124803-1-courbet@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 30 Mar 2020 09:20:47 -0700
Message-ID: <CAKwvOdmO_0yosb-k+UHenSa5W5HtZgPLFaHfapxD8WiDNpFJUA@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc: Make setjmp/longjmp signature standard
To: Clement Courbet <courbet@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 30, 2020 at 1:04 AM Clement Courbet <courbet@google.com> wrote:
>
> Declaring setjmp()/longjmp() as taking longs makes the signature
> non-standard, and makes clang complain. In the past, this has been
> worked around by adding -ffreestanding to the compile flags.
>
> The implementation looks like it only ever propagates the value
> (in longjmp) or sets it to 1 (in setjmp), and we only call longjmp
> with integer parameters.
>
> This allows removing -ffreestanding from the compilation flags.
>
> Context:
> https://lore.kernel.org/patchwork/patch/1214060
> https://lore.kernel.org/patchwork/patch/1216174
>
> Signed-off-by: Clement Courbet <courbet@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Cc: stable@vger.kernel.org # v4.14+
> Fixes: c9029ef9c957 ("powerpc: Avoid clang warnings around setjmp and longjmp")

Third time's a charm (for patches that tackle this warning). Thanks
for following up on this cleanup!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

The extent of my testing was compile testing with Clang.

>
> ---
>
> v2:
> Use and array type as suggested by Segher Boessenkool
> Add fix tags.
>
> v3:
> Properly place tags.
> ---
>  arch/powerpc/include/asm/setjmp.h | 6 ++++--
>  arch/powerpc/kexec/Makefile       | 3 ---
>  arch/powerpc/xmon/Makefile        | 3 ---
>  3 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
> index e9f81bb3f83b..f798e80e4106 100644
> --- a/arch/powerpc/include/asm/setjmp.h
> +++ b/arch/powerpc/include/asm/setjmp.h
> @@ -7,7 +7,9 @@
>
>  #define JMP_BUF_LEN    23
>
> -extern long setjmp(long *) __attribute__((returns_twice));
> -extern void longjmp(long *, long) __attribute__((noreturn));
> +typedef long jmp_buf[JMP_BUF_LEN];
> +
> +extern int setjmp(jmp_buf env) __attribute__((returns_twice));
> +extern void longjmp(jmp_buf env, int val) __attribute__((noreturn));
>
>  #endif /* _ASM_POWERPC_SETJMP_H */
> diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
> index 378f6108a414..86380c69f5ce 100644
> --- a/arch/powerpc/kexec/Makefile
> +++ b/arch/powerpc/kexec/Makefile
> @@ -3,9 +3,6 @@
>  # Makefile for the linux kernel.
>  #
>
> -# Avoid clang warnings around longjmp/setjmp declarations
> -CFLAGS_crash.o += -ffreestanding
> -
>  obj-y                          += core.o crash.o core_$(BITS).o
>
>  obj-$(CONFIG_PPC32)            += relocate_32.o
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index c3842dbeb1b7..6f9cccea54f3 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -1,9 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for xmon
>
> -# Avoid clang warnings around longjmp/setjmp declarations
> -subdir-ccflags-y := -ffreestanding
> -
>  GCOV_PROFILE := n
>  KCOV_INSTRUMENT := n
>  UBSAN_SANITIZE := n
> --
> 2.26.0.rc2.310.g2932bb562d-goog
>


-- 
Thanks,
~Nick Desaulniers
