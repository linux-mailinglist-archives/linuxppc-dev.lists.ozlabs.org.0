Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0A8FCAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 09:45:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468wNX6hCwzDrGG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 17:45:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.195; helo=mail-oi1-f195.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468wLL3z6tzDrC9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 17:43:53 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id c15so4200178oic.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bvAyBsUlIJF0bF+3UmDVqzcZaxe3TRuVyFQ4SKm03Ag=;
 b=AxGbaWyCsA2JbrhjXiVhCs8ep6GVbgZAFGahTTSAOVqYfnLIc53oUx/OLASG4E+FM6
 nVD5dYjObtWdFkPD16JjrmTBKSDA92/8BDSU3FGPXXckojP7VzhWVBC+eQhkS5Mvh9xm
 hQZqfDwsO46mC+ZFEBwiwDunP1Gm2yvvwIRGM5XrHBrgHyS+qHxn9WoPc84G/PN1HUz2
 DoegVMBJVd1U554rZK4Wtfn54gkqzx+Q0NKNQjJohaHS7kPPZqSEGdORtuAtIm3z2Qv8
 Cf+FquIH+q+MphBxDNGL94T8i6P1ED4ECwZ0UVy7ihyOLtn9r4vBIl+l5Xyvm68b8CLX
 jN1Q==
X-Gm-Message-State: APjAAAWzzlWNGaBwin+uT0gXF3SEnLUELsZok+MtDEZ5ypfDUUJj5ZwN
 24UqYiIsgOkPF5ei4M4mgN0OYdZgl8TazEhTBjc=
X-Google-Smtp-Source: APXvYqxDhwWwhe23FnPOhfwBJdvvv1RZQ4uxY4zTeFQQdGxuUoRdT5WMzdETbuNlDvSjEY17/b21joZDSXi2Bi1nfwg=
X-Received: by 2002:a54:478d:: with SMTP id o13mr4253177oic.54.1565941431065; 
 Fri, 16 Aug 2019 00:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190816070754.15653-1-hch@lst.de>
 <20190816070754.15653-5-hch@lst.de>
In-Reply-To: <20190816070754.15653-5-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Aug 2019 09:43:40 +0200
Message-ID: <CAMuHMdVk3LZk3Ro3PYn9aOZ6NRUr5AOp+NwSNiaq2hBTS0-BtQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] dma-mapping: remove arch_dma_mmap_pgprot
To: Christoph Hellwig <hch@lst.de>
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
Cc: Shawn Anastasio <shawn@anastas.io>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Will Deacon <will@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, Catalin Marinas <catalin.marinas@arm.com>,
 James Hogan <jhogan@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 9:19 AM Christoph Hellwig <hch@lst.de> wrote:
> arch_dma_mmap_pgprot is used for two things:
>
>  1) to override the "normal" uncached page attributes for mapping
>     memory coherent to devices that can't snoop the CPU caches
>  2) to provide the special DMA_ATTR_WRITE_COMBINE semantics on older
>     arm systems
>
> Replace one with the pgprot_dmacoherent macro that is already provided
> by arm and much simpler to use, and lift the DMA_ATTR_WRITE_COMBINE
> handling to common code with an explicit arch opt-in.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig                  |  1 -
>  arch/m68k/include/asm/pgtable_mm.h |  3 +++
>  arch/m68k/kernel/dma.c             |  3 +--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
