Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F156848C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdFWS4yhFz3c6j
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:04:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdFVz2CxWz3bl8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:03:53 +1000 (AEST)
Received: by mail-qt1-f174.google.com with SMTP id k14so17483177qtm.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Jul 2022 03:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=moQR5LBdu+yLzctPNV/vOqPzvGKHHurzxQlNOu9l9Us=;
        b=RblsIaOSSRP4dLEKnHtl1iDThgcCfOzXs4dQjPOXBoOZAZTw2l8xQ74FaBb02Dy6uD
         uRPdjXI99sHECERDiP/5LyoCB0HvFyeO1HAXNMvYrgtgBHh+Z63PzjmsrSBAe9avSVn/
         cZ9aGlPTTmZbSn5pYAgZg8PoakQhv846FjEB1kzvhAel0UweInkmeKvOYZlKOtZSRIFX
         fTDo5JHGxJK1BoBD+rAxxAjBRQD1lXTBC1QFvb2EUArsmrJzsVIMk8a2k/lH92+gdDuL
         O0YJEvBypmCRBJsF0dyXdsmh6iGgr0AGXUoZ/jV5WVhd5wgmVhITLw3feVGyPL7ZjIeT
         JPLg==
X-Gm-Message-State: AJIora9qQj2ZcYtvmbgzr3kD5Zb/F0fqy4IPrFHoh0d36U6auJiVlA+O
	RtzlLp32GV0Gz6HjT3WwdREtxwK6Fn8VOIfD
X-Google-Smtp-Source: AGRyM1sPHbCBfo3enjq7tns4jUnh1JdnZzEp2Lr5nGPa3my8v1wPa0qRKMak2LNHD1jH1jsZX1OgRw==
X-Received: by 2002:a05:6214:5181:b0:473:1a26:99f6 with SMTP id kl1-20020a056214518100b004731a2699f6mr1684638qvb.47.1657101830489;
        Wed, 06 Jul 2022 03:03:50 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id bn32-20020a05620a2ae000b006b26790293bsm12535673qkb.100.2022.07.06.03.03.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:03:49 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31cf1adbf92so7789767b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Jul 2022 03:03:49 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr44581975ywd.283.1657101828958; Wed, 06
 Jul 2022 03:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220630051630.1718927-1-anshuman.khandual@arm.com> <20220630051630.1718927-22-anshuman.khandual@arm.com>
In-Reply-To: <20220630051630.1718927-22-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 12:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_Ji7dCzzCc3xw5ic6J=0PaPkyzXKpOgUFjjEkR+yJOw@mail.gmail.com>
Message-ID: <CAMuHMdX_Ji7dCzzCc3xw5ic6J=0PaPkyzXKpOgUFjjEkR+yJOw@mail.gmail.com>
Subject: Re: [PATCH V6 21/26] m68k/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, arcml <linux-snps-arc@lists.infradead.org>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, linux-um <linux-um@lists.infradead.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Openrisc <openrisc@lists.librecores.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Andre
 w Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anshuman,

On Thu, Jun 30, 2022 at 7:19 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
> vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
> up a private and static protection_map[] array. Subsequently all __SXXX and
> __PXXX macros can be dropped which are no longer needed.
>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/mcf_pgtable.h
> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> @@ -91,60 +91,6 @@
>   * for use. In general, the bit positions are xwr, and P-items are
>   * private, the S-items are shared.
>   */

The comment above should be removed, too.

> -#define __P000         PAGE_NONE
> -#define __P001         __pgprot(CF_PAGE_VALID \
> -                                | CF_PAGE_ACCESSED \
> -                                | CF_PAGE_READABLE)

> --- a/arch/m68k/include/asm/motorola_pgtable.h
> +++ b/arch/m68k/include/asm/motorola_pgtable.h
> @@ -83,28 +83,6 @@ extern unsigned long mm_cachebits;
>  #define PAGE_COPY_C    __pgprot(_PAGE_PRESENT | _PAGE_RONLY | _PAGE_ACCESSED)
>  #define PAGE_READONLY_C        __pgprot(_PAGE_PRESENT | _PAGE_RONLY | _PAGE_ACCESSED)

You might move the *_C definitions above into arch/m68k/mm/motorola.c
as well, as they are only used in the latter.

>
> -/*
> - * The m68k can't do page protection for execute, and considers that the same are read.
> - * Also, write permissions imply read permissions. This is the closest we can get..
> - */
> -#define __P000 PAGE_NONE_C
> -#define __P001 PAGE_READONLY_C
> -#define __P010 PAGE_COPY_C
> -#define __P011 PAGE_COPY_C
> -#define __P100 PAGE_READONLY_C
> -#define __P101 PAGE_READONLY_C
> -#define __P110 PAGE_COPY_C
> -#define __P111 PAGE_COPY_C
> -
> -#define __S000 PAGE_NONE_C
> -#define __S001 PAGE_READONLY_C
> -#define __S010 PAGE_SHARED_C
> -#define __S011 PAGE_SHARED_C
> -#define __S100 PAGE_READONLY_C
> -#define __S101 PAGE_READONLY_C
> -#define __S110 PAGE_SHARED_C
> -#define __S111 PAGE_SHARED_C
> -
>  #define pmd_pgtable(pmd) ((pgtable_t)pmd_page_vaddr(pmd))
>
>  /*
> diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
> index 5e4e753f0d24..9d919491765b 100644
> --- a/arch/m68k/include/asm/sun3_pgtable.h
> +++ b/arch/m68k/include/asm/sun3_pgtable.h
> @@ -71,23 +71,6 @@
>   * protection settings, valid (implying read and execute) and writeable. These
>   * are as close as we can get...
>   */

The comment above should be removed, too.

> -#define __P000 PAGE_NONE
> -#define __P001 PAGE_READONLY

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
