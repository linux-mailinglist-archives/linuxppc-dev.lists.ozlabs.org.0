Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7325203CD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 19:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxpdS2Gnkz3cCq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 03:51:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lOajRfE7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=lOajRfE7; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxpcr2dV4z3bdM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 03:51:07 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id q130so17968571ljb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 10:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6h/UbBcSsy6Cwv/zRBUg+8oIkiwnR5qcB1QDqTp6w8=;
 b=lOajRfE7fyP+ep3MKFGW9mQh4e9I1Uiq21usbZezTUhM7EFdhg1SnvvNjY4eG59ULs
 V4Owko+szwUqUWwUMOPZ7L4L7x5m3g1Mm7rbCdqAjqtaLm5FvW/K5dfZdN0XW5hf65HO
 78imLtJfT6cP2hesjWXVSZsQU4pIUmnZcKDPw9almOyM+aeGj7565UrKRLWpVcmNrEwe
 xJkgCcUXrlopAOgqZYayw1LQ0mSuw5EChiwGNUaBuTsB3BXNrjGOYu+K76TLXsRGHsBe
 eQK1QSxvGw/P89SyjP0B19ZHce6iDYv7Nz+kMtnMo+aOblb0/ntvWz3HsYVV84q3HMkk
 YVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6h/UbBcSsy6Cwv/zRBUg+8oIkiwnR5qcB1QDqTp6w8=;
 b=DLXew/nCqDyNKAlqJa5IVWoDpVGF+rPgksed5aJM7W5AB5i3ZwL23JoiZWHZgQ58O4
 oOD8XTfanioGYXaHdPmJvLL9fK3A759Ba9c6aXrYrL4bFZwRfv+Po1D28lZSb0+sp4Q8
 pyAuwQI8m9cnFRadi+tQxXn5c7dt3f4Ki8f9zPkoWaj8jsVcQ0cIEa5IHJkaFyboFFP1
 xsFkDcex9qmr7NSpCdT+7P//FaQG51ZCTWe0W2OljKiVLo+9qe3mdX47idLeJ/4MebzJ
 sLPP0eoQvLJTUFT3EKE2BEC4q2ggQxXpQMF/PKhno2SVHe6Vs+PU67G1kJau4dRPGmmy
 HijA==
X-Gm-Message-State: AOAM533gXFj5JhxyXmG0TjlgjbuWQMKzhPOu3AK2idyX/PxmgUuOJCH7
 UKM3AnFQSdwahEHwuuRYyeYT9YEDb/u5drdN6UlJWqVegnuU+w==
X-Google-Smtp-Source: ABdhPJzH0GFY+4K8szx4KHcz2z6G62DNfHvef1hX/KTMFMx//VA0v3aill5VeXt5HmS0uJd9IHn4xVPu7N0kN8BJZnI=
X-Received: by 2002:a2e:a7c8:0:b0:24f:700a:4df5 with SMTP id
 x8-20020a2ea7c8000000b0024f700a4df5mr11176691ljp.472.1652118662391; Mon, 09
 May 2022 10:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-7-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-7-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 10:50:50 -0700
Message-ID: <CAKwvOdm_oSLHddWWSzF5UuYrLCsAwF8AwbUGotUnPvV+6JkSkg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] kbuild: link symbol CRCs at final link,
 removing CONFIG_MODULE_REL_CRCS
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 clang-built-linux <llvm@lists.linux.dev>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
> index 07a36a874dca..51ce72ce80fa 100644
> --- a/include/asm-generic/export.h
> +++ b/include/asm-generic/export.h
> @@ -2,6 +2,14 @@
>  #ifndef __ASM_GENERIC_EXPORT_H
>  #define __ASM_GENERIC_EXPORT_H
>
> +/*
> + * This comment block is used by fixdep. Please do not remove.

I don't know much about fixdep. How does that work, if you could summarize?

> + *
> + * When CONFIG_MODVERSIONS is changed from n to y, all source files having
> + * EXPORT_SYMBOL variants must be re-compiled because genksyms is run as a
> + * side effect of the .o build rule.
> + */
> +
>  #ifndef KSYM_FUNC
>  #define KSYM_FUNC(x) x
>  #endif
> @@ -12,9 +20,6 @@
>  #else
>  #define KSYM_ALIGN 4
>  #endif
> -#ifndef KCRC_ALIGN
> -#define KCRC_ALIGN 4
> -#endif

The #ifndef is there because arch/m68k/include/asm/export.h:1 defines
KCRC_ALIGN. You should delete that, too.

> diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> index 4827c5abe5b7..6e6933ae7911 100644
> --- a/scripts/genksyms/genksyms.c
> +++ b/scripts/genksyms/genksyms.c
> @@ -33,7 +33,7 @@ char *cur_filename;
>  int in_source_file;
>
>  static int flag_debug, flag_dump_defs, flag_reference, flag_dump_types,
> -          flag_preserve, flag_warnings, flag_rel_crcs;
> +          flag_preserve, flag_warnings;
>
>  static int errors;
>  static int nsyms;
> @@ -681,10 +681,7 @@ void export_symbol(const char *name)
>                         fputs(">\n", debugfile);
>
>                 /* Used as a linker script. */

^ Does this comment still apply?

> -               printf(!flag_rel_crcs ? "__crc_%s = 0x%08lx;\n" :
> -                      "SECTIONS { .rodata : ALIGN(4) { "
> -                      "__crc_%s = .; LONG(0x%08lx); } }\n",
> -                      name, crc);
> +               printf("__crc_%s = 0x%08lx;\n", name, crc);
>         }
>  }
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index eceb3ee7ec06..6aee2401f3ad 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -88,11 +88,6 @@ modpost_link()
>                 gen_initcalls
>                 lds="-T .tmp_initcalls.lds"
>
> -               if is_enabled CONFIG_MODVERSIONS; then
> -                       gen_symversions

^ this is the only caller of gen_symversions, right? Then
gen_symversions can be cleaned up, too?

> -                       lds="${lds} -T .tmp_symversions.lds"
> -               fi
> -
>                 # This might take a while, so indicate that we're doing
>                 # an LTO link
>                 info LTO ${1}
> @@ -183,6 +178,10 @@ vmlinux_link()
>                 libs="${KBUILD_VMLINUX_LIBS}"
>         fi
>
> +       if is_enabled CONFIG_MODULES; then
> +               objs="${objs} .vmlinux.export.o"
> +       fi
> +
>         if [ "${SRCARCH}" = "um" ]; then
>                 wl=-Wl,
>                 ld="${CC}"
> @@ -312,6 +311,7 @@ cleanup()
>         rm -f vmlinux.o
>         rm -f .vmlinux.d
>         rm -f .vmlinux.objs
> +       rm -f .vmlinux.export.c

Probably can drop the `rm -f .tmp_symversions.lds` here, too?
-- 
Thanks,
~Nick Desaulniers
