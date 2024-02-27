Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4C868B62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 09:55:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkWXv4GmGz3vcL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.170; helo=mail-oi1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkWXV6d5jz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 19:55:22 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c19dd9ade5so875777b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709024119; x=1709628919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LF4kXg8LPe/h8pV/74EqYHGgPgOEfsUWLG6ibzoE1S0=;
        b=t+D9DYK8wvy4SdJNQuke5WmMo0KWNNzGtLmmaWvloYjZrAuyJ7LX8GvKCazxWvQIbx
         g+WcMFO6OAVOuzLVOm5BXiZHmFc9pDj9cpsJnr+k1Sp1lSdTrnM2Z/UIJsqj+OujWqgk
         V1iek9f2AY6SQeykzu80dRJcW9qeoKFLWXh49lmHpENYqtzPaaYCNYUJAST/Z8LM39OS
         tMZ6lxlaG6r0shP3YaMldSniqRMYlm66Htj9KGKtdgA1NDq/zSmpvcH1U6aMik3FxyUc
         mNXoVPrEhTygLIQKXoRzQsjwiPuHBIpHBuS1n66eolcJ7B0EyWyb9u4inJmqTneN9KhY
         Jw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6z/IFjwpmKLDli5pi1VE/Ci7yE3dnTArRhgkMVQT8sj+DblD9QmYPQIxepNd4Us7IafQ1i56/q91TDKUkPEmaRlohnTwxCEbKQrq10w==
X-Gm-Message-State: AOJu0YzB8ls/Jv5bRP7LKLx4SkpQlKVngDeKcR+lAUHXHLgZMzRhLUuv
	RbTe45b+N9uFmsxGL2HTNz7nrXMjwzj2VPI9BchhHKADKMd5RusH+b5WpGmpNKJHWQ==
X-Google-Smtp-Source: AGHT+IFhD3mG0pSI0vz9DyeLGep+G9ChA7EkjzGYp8/UQ9vT6bJQE/Jil/vyf4X1Qg92u6624LCDCA==
X-Received: by 2002:a05:6808:f94:b0:3c1:b289:f8d2 with SMTP id o20-20020a0568080f9400b003c1b289f8d2mr156201oiw.4.1709024119234;
        Tue, 27 Feb 2024 00:55:19 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a00230a00b006e363ca24dcsm5362726pfh.67.2024.02.27.00.55.18
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:55:18 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3426707a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:55:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1IJoFAR4C0+UtzBAPZ4ysydSABAIojlK07zxAeBkEr3fL5Mt3b2spdxItcAfmMNFpPko2pECt0XTBZlxeI+hlJCb4ZXi0AHIeAv+1Lw==
X-Received: by 2002:a25:71c3:0:b0:dcf:2b44:f38d with SMTP id
 m186-20020a2571c3000000b00dcf2b44f38dmr1589302ybc.49.1709024097788; Tue, 27
 Feb 2024 00:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-4-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:54:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Message-ID: <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik
 .fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Mon, Feb 26, 2024 at 5:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -84,12 +84,15 @@ config MMU
>
>  config MMU_MOTOROLA
>         bool
> +       select HAVE_PAGE_SIZE_4KB
>
>  config MMU_COLDFIRE
> +       select HAVE_PAGE_SIZE_8KB

I think you can do without this...

>         bool
>
>  config MMU_SUN3
>         bool
> +       select HAVE_PAGE_SIZE_8KB
>         depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
>
>  config ARCH_SUPPORTS_KEXEC
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 9dcf245c9cbf..c777a129768a 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -30,6 +30,7 @@ config COLDFIRE
>         select GENERIC_CSUM
>         select GPIOLIB
>         select HAVE_LEGACY_CLK
> +       select HAVE_PAGE_SIZE_8KB if !MMU

.... if you would drop the !MMU-dependency here.

>
>  endchoice
>
> @@ -45,6 +46,7 @@ config M68000
>         select GENERIC_CSUM
>         select CPU_NO_EFFICIENT_FFS
>         select HAVE_ARCH_HASH
> +       select HAVE_PAGE_SIZE_4KB

Perhaps replace this by

    config M68KCLASSIC
            bool "Classic M68K CPU family support"
            select HAVE_ARCH_PFN_VALID
  +         select HAVE_PAGE_SIZE_4KB if !MMU

so it covers all 680x0 CPUs without MMU?

>         select LEGACY_TIMER_TICK
>         help
>           The Freescale (was Motorola) 68000 CPU is the first generation =
of

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
