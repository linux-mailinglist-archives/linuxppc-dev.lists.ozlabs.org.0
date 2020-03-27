Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E5E195C14
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:12:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ppMH05cjzDrHP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 04:12:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MUofL7R+; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ppKK5Nb7zDrCM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 04:10:59 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id g9so4035170pjp.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 10:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pBCjAk0gvrWE6sWceslEiTTxRDFmFfcP2iFKJjO3ChU=;
 b=MUofL7R+c9y0EimApYtKI2cV7puewIhhm4xcuMre9PFcte34QvzRO3E+BjSqbxQq/W
 V4wOUffxoLqvTXH0xqIsvVYmK1n2lpBjQZHuC/j+A6nt6q8TCVEg+jiu7uwI2YSOon+A
 4vNrFtRo24tAfC6HmUvq7c/xyTv0Au9miX4lkYujg4uZ+KHbG0DG0xhYuKuhoPeI0Erj
 xB2bb/YyF37BPn7J9KBk+q0GHKfL3NI8gxpnZenBeX/gCWyLwfgPIMZww3IKxW3C5aSY
 QjuF5/Ibt767T3+70NfOHxqPw1+Nya6Ecq4e1J2Hh3IGPBh/w5rYEgS1yp8tb9ZKUD/F
 QhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBCjAk0gvrWE6sWceslEiTTxRDFmFfcP2iFKJjO3ChU=;
 b=C0tz8C4FthEvwVq9ywDJKxqRWiOzpRp0j/B9I1V8cmkvk9IXRChusVs/GtnUS8KJZx
 EL/zkvBYmffFlmQ94/XMlJ/TgfyNG7AGgWiRYgw/NQh0ujARNFsXhJAep6gB/3BfhoCS
 Uqj5YIj4hivqr5aKQalm2Mmr1qRrGn2zUQKw48b0IFbW0xUnI15RloTkIahZLMZQInE3
 dRDEZ2vH8ddO84VFFwATIq7XEhHI0r4UyYwWIrNEUpHmrazqWRyFWzFZfGqua8KsOqfG
 sfOUqMwcnORzR9fxqT7qtm+ec5zwYRxVSdiPijAhZ178Eh3Hw61nkHQphN3TcEouXQS5
 XLcA==
X-Gm-Message-State: ANhLgQ3Nil3PiZnN5374aI8hOEedGGLFaFdxZMbULFPDyiwAjxrTG/wS
 zqK4SjPjwhNqFFSI20ITj52oBtdB7TxPSxdO6NCAnQ==
X-Google-Smtp-Source: ADFU+vuNf59yIvIcvWQM3jTPYWY7cD1fCsAchiEpBFOwsOwNUxrvnq2kDqUq3c10YN7+V13dQ/6ztQG8dOldkp67IRE=
X-Received: by 2002:a17:902:820a:: with SMTP id
 x10mr62388pln.179.1585329056243; 
 Fri, 27 Mar 2020 10:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200327100801.161671-1-courbet@google.com>
In-Reply-To: <20200327100801.161671-1-courbet@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 27 Mar 2020 10:10:44 -0700
Message-ID: <CAKwvOdmLmfJY4Uk-Atd9dT5+zQTPeoagjMZMcDqdVfKCU7_BuA@mail.gmail.com>
Subject: Re: [PATCH v1] powerpc: Make setjmp/longjump signature standard
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 3:08 AM Clement Courbet <courbet@google.com> wrote:
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

Hi Clement, thanks for the patch! Would you mind sending a V2 that
included a similar fix to arch/powerpc/xmon/Makefile?

For context, this was the original patch:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aea447141c7e7824b81b49acd1bc78
which was then modified to:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c9029ef9c95765e7b63c4d9aa780674447db1ec0

So on your V2, if you include in the commit message, the line:

Fixes c9029ef9c957 ("powerpc: Avoid clang warnings around setjmp and longjmp")

then that will help our LTS branch maintainers back port it to the
appropriate branches.

>
> ---
>  arch/powerpc/include/asm/setjmp.h | 6 ++++--
>  arch/powerpc/kexec/Makefile       | 3 ---
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
> index e9f81bb3f83b..84bb0d140d59 100644
> --- a/arch/powerpc/include/asm/setjmp.h
> +++ b/arch/powerpc/include/asm/setjmp.h
> @@ -7,7 +7,9 @@
>
>  #define JMP_BUF_LEN    23
>
> -extern long setjmp(long *) __attribute__((returns_twice));
> -extern void longjmp(long *, long) __attribute__((noreturn));
> +typedef long *jmp_buf;
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
> --
> 2.25.1.696.g5e7596f4ac-goog
>


-- 
Thanks,
~Nick Desaulniers
