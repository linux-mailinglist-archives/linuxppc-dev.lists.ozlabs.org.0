Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B474B7BF8A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 12:27:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4XCD4mZBz3dDk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 21:27:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.170; helo=mail-yw1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4XBh425Dz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 21:26:50 +1100 (AEDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7af52ee31so13939447b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 03:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696933606; x=1697538406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbmON3xp7LlIs9AFrDaNfaYi2KFfIcOVngy3VzyA1Hk=;
        b=g5iypg/S7sGKFEqjJLwa9b9ts3LyqP3Q2sxThu8pXKNmsYCpHYqzQXkqeZCPPbe3hL
         9oW6woXMw0n/gn/8hXt1diXG0nnm36jyUPSFGUNKI9VkZhIIl8Ai+Xwq6KBCAgsasWvj
         vwcKPtrzy+4AaszHP2V5zTBTJ73cvXKNy+aPffZnRiy53Kl+YBan3/aHS1hfX6ZHzCcz
         7GVPpupp0g57Tm5D5eN9VJvXB4pnaFZ0KSag18aaT30gQviJaRqmjwr286S6TPFaTRBC
         SGmrZYWHh6BAfFjHUi3Uj67GlNXiqNqbycUxRBwM/DwFxkX2VMIUgice84GEqp5mLKt7
         n+Ew==
X-Gm-Message-State: AOJu0Yy5KPyaLdK8/hEUgI5BvBrcvJigxOf/igrYIDnc494/B5MC66A1
	qsmBB3g9aGBJ/qhP1k+Ji3bhyqyxKEsmkQ==
X-Google-Smtp-Source: AGHT+IEioGs67h/No3tgbg2SyyYy8CK1rgn0FckBzn1kkHMWEwH6pXMGCBNk0J5pj7FxM3fXMyE7Hw==
X-Received: by 2002:a25:e20b:0:b0:d85:b765:782c with SMTP id h11-20020a25e20b000000b00d85b765782cmr15436483ybe.20.1696933605953;
        Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id y7-20020a25dc07000000b00d85abbdc93esm3706119ybe.12.2023.10.10.03.26.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59f4db9e11eso64641297b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
X-Received: by 2002:a81:8647:0:b0:595:89b0:6b56 with SMTP id
 w68-20020a818647000000b0059589b06b56mr20014839ywf.28.1696933584327; Tue, 10
 Oct 2023 03:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231009211845.3136536-1-arnd@kernel.org> <20231009211845.3136536-2-arnd@kernel.org>
In-Reply-To: <20231009211845.3136536-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Oct 2023 12:26:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6MFLCOe4BSWr5oVC4JcLpBS+2PvQsoSEWMLRAFpvaGA@mail.gmail.com>
Message-ID: <CAMuHMdU6MFLCOe4BSWr5oVC4JcLpBS+2PvQsoSEWMLRAFpvaGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] vgacon: rework Kconfig dependencies
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Javier Martinez Canillas <javierm@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, Thoma
 s Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Mon, Oct 9, 2023 at 11:19=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The list of dependencies here is phrased as an opt-out, but this is missi=
ng
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
>
>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>    the merged arch/powerpc never did
>
>  - arm lists footbridge, integrator and netwinder, but netwinder is actua=
lly
>    part of footbridge, and integrator does not appear to have an actual
>    VGA hardware, or list it in its ATAG or DT.
>
>  - mips has a few platforms (malta, sibyte, and sni) that initialize
>    screen_info, on everything else the console is selected but cannot
>    actually work.
>
>  - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
>    in the opt-out table and declare a screen_info to allow building
>    vga_con, but this cannot work because the console is never selected.
>
> Replace this with an opt-in table that lists only the platforms that
> remain. This is effectively x86, plus a couple of historic workstation
> and server machines that reused parts of the x86 system architecture.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Khalid Aziz <khalid@gonehiking.org>
> Acked-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

A few suggestions for simplification below...

> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -7,9 +7,9 @@ menu "Console display driver support"
>
>  config VGA_CONSOLE
>         bool "VGA text console" if EXPERT || !X86
> -       depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SU=
PERH && \
> -               (!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWI=
NDER) && \
> -               !ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !U=
ML
> +       depends on ALPHA || IA64 || X86 || \
> +               (ARM && ARCH_FOOTBRIDGE) || \

You can drop "ARM &&", as it is implied by ARCH_FOOTBRIDGE.

> +               (MIPS && (MIPS_MALTA || SIBYTE_BCM112X || SIBYTE_SB1250 |=
| SIBYTE_BCM1x80 || SNI_RM))

Likewise for "MIPS &&".

The 3 SIBYTE dependencies can be replaced by SIBYTE_SB1xxx_SOC.

>         select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
>         default y
>         help

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
