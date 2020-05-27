Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7403C1E39D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 09:04:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X1zd2ZvrzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 17:04:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X1xm25m5zDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 17:03:06 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id 23so19683927oiq.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 00:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmrgkNrS7YJyoX//CVVX8i/eCGz9CaA9GDfJeRj6hok=;
 b=Vlh/b50uXUVjJFWASjBCH+qDfT+HX1fYNM8lxoQm87GxQa9WhSlvMFXU2sQFbov6qx
 e0v4gSkgJk2WbVMgzB2RwPj86PipmguasvyGVd9gqDvltrTTkHveQNMQUE+Zz5Hxy+jv
 BbdsaXAd/bvneeREey0h2aQQnbTc6p6T8dFeAarJ3/y6ZhA7SfOC5yntWainjf9jk0Xk
 SrIe/CFmm+J2ZrNsVFVToRwD8TAov0enC3+xqwML7a4m7Gs3Y/RZQlNDqIvDPraxXPrS
 4nbwRsb0AMGVvljXcQHsYeO4gVp2AdDmhzFHzf9A/OlTAjc8n1aZcw+VWBmjPp89UFLF
 8X6w==
X-Gm-Message-State: AOAM530EtFHq0g6lQhg5CB3qn4VeTiwRHQJJ6poijsdMQr3fRFDAQCVv
 UIIapULZUhuGYgS2x8dyG1DCqurwGgeGxyz7Kbk=
X-Google-Smtp-Source: ABdhPJyJItgq7CbQXJlF6MFLLk/+bu/fSz/XUZ+gwTEqMYOT9P6OwO82+92+P3alNyNfXtW65E6GNWlSoFsc0hwoXsQ=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr1778697oic.54.1590562983010; 
 Wed, 27 May 2020 00:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200515143646.3857579-7-hch@lst.de>
 <20200527043426.3242439-1-natechancellor@gmail.com>
In-Reply-To: <20200527043426.3242439-1-natechancellor@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2020 09:02:51 +0200
Message-ID: <CAMuHMdVSduTOi5bUgF9sLQdGADwyL1+qALWsKgin1TeOLGhAKQ@mail.gmail.com>
Subject: Re: [PATCH] media: omap3isp: Shuffle cacheflush.h and include mm.h
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

CC Laurent

On Wed, May 27, 2020 at 6:37 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> After mm.h was removed from the asm-generic version of cacheflush.h,
> s390 allyesconfig shows several warnings of the following nature:
>
> In file included from ./arch/s390/include/generated/asm/cacheflush.h:1,
>                  from drivers/media/platform/omap3isp/isp.c:42:
> ./include/asm-generic/cacheflush.h:16:42: warning: 'struct mm_struct'
> declared inside parameter list will not be visible outside of this
> definition or declaration
>
> cacheflush.h does not include mm.h nor does it include any forward
> declaration of these structures hence the warning. To avoid this,
> include mm.h explicitly in this file and shuffle cacheflush.h below it.
>
> Fixes: 19c0054597a0 ("asm-generic: don't include <linux/mm.h> in cacheflush.h")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for your patch!

> I am aware the fixes tag is kind of irrelevant because that SHA will
> change in the next linux-next revision and this will probably get folded
> into the original patch anyways but still.
>
> The other solution would be to add forward declarations of these structs
> to the top of cacheflush.h, I just chose to do what Christoph did in the
> original patch. I am happy to do that instead if you all feel that is
> better.

That actually looks like a better solution to me, as it would address the
problem for all users.

>  drivers/media/platform/omap3isp/isp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> index a4ee6b86663e..54106a768e54 100644
> --- a/drivers/media/platform/omap3isp/isp.c
> +++ b/drivers/media/platform/omap3isp/isp.c
> @@ -39,8 +39,6 @@
>   *     Troy Laramy <t-laramy@ti.com>
>   */
>
> -#include <asm/cacheflush.h>
> -
>  #include <linux/clk.h>
>  #include <linux/clkdev.h>
>  #include <linux/delay.h>
> @@ -49,6 +47,7 @@
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/omap-iommu.h>
>  #include <linux/platform_device.h>
> @@ -58,6 +57,8 @@
>  #include <linux/sched.h>
>  #include <linux/vmalloc.h>
>
> +#include <asm/cacheflush.h>
> +
>  #ifdef CONFIG_ARM_DMA_USE_IOMMU
>  #include <asm/dma-iommu.h>
>  #endif

Why does this file need <asm/cacheflush.h> at all?
It doesn't call any of the flush_*() functions, and seems to compile fine
without (on arm32).

Perhaps it was included at the top intentionally, to override the definitions
of copy_{to,from}_user_page()? Fortunately that doesn't seem to be the
case, from a quick look at the assembler output.

So let's just remove the #include instead?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
