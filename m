Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EA745689
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 09:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvdX867NJz3c2H
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 17:55:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.53; helo=mail-qv1-f53.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvdWb6Rlvz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 17:55:23 +1000 (AEST)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-635de6776bdso31408056d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 00:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688370920; x=1690962920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap+98X7lUU4Mb/R2w4KrLGdPkASGfI2gOWe+xareG/w=;
        b=La3zBCUFLLALMMI+WstRB9xg3NBYFbMrJlHiLmDAqBK9nZub7gWOqRbEemaLyz9RPk
         MJ1jfet4A40rHDGz3iFFOAvmQ0rRU+tbAagSPPyc2S1wGrHuk0wJ9+sjQLpoq79+hwfF
         LndtEudQoKeUF7XNz1cJZ4Gz2EHfetTl4Iw8l9wFbtHQxWKL+1vJ44fZdtjVZIQPvr5a
         n/dNaDc1KwiQft1bvBvUTa1B3bs/hEYCpUneqJXmrAT8HbZ5oadkt5kmY7T1y50hpjqB
         Xau/OunCuHubphWc1CAIkbEHRk5qBJxCI3BfPDkBaxJdoue1Q2v07MKmj0NSiFCE7BYw
         xa9w==
X-Gm-Message-State: ABy/qLZhp+mSjTxVGpE8TCV3L2riIxb4uiRKFmjlccT2LdwHTQQofJPR
	eQuuDWYsqmofw7xYyVJtg0nKVswPhCAREA==
X-Google-Smtp-Source: APBJJlGIlohfBQIvsbzmLYLxMzEEGVxJGzuovWOFbRanF8qgVCWOWOzz918JxQX87VpHSaHEZhmkyQ==
X-Received: by 2002:a05:6214:238f:b0:635:4113:baed with SMTP id fw15-20020a056214238f00b006354113baedmr10887290qvb.33.1688370919568;
        Mon, 03 Jul 2023 00:55:19 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id p15-20020a0cf68f000000b0063631be090csm4672433qvn.125.2023.07.03.00.55.19
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 00:55:19 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4021451a4a4so33839111cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 00:55:19 -0700 (PDT)
X-Received: by 2002:a25:a287:0:b0:c1a:2928:74ab with SMTP id
 c7-20020a25a287000000b00c1a292874abmr8554017ybi.31.1688370898299; Mon, 03 Jul
 2023 00:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-21-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-21-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Jul 2023 09:54:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5bXeE=nr7+hHxL+xhm2q05udkJpMBM-BG7g9S7Nt7Zg@mail.gmail.com>
Message-ID: <CAMuHMdW5bXeE=nr7+hHxL+xhm2q05udkJpMBM-BG7g9S7Nt7Zg@mail.gmail.com>
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean() helper
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstr
 ong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Mon, Mar 27, 2023 at 2:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm version of the arch_sync_dma_for_cpu() function annotates pages a=
s
> PG_dcache_clean after a DMA, but no other architecture does this here. On
> ia64, the same thing is done in arch_sync_dma_for_cpu(), so it makes sens=
e
> to use the same hook in order to have identical arch_sync_dma_for_cpu()
> semantics as all other architectures.
>
> Splitting this out has multiple effects:
>
>  - for dma-direct, this now gets called after arch_sync_dma_for_cpu()
>    for DMA_FROM_DEVICE mappings, but not for DMA_BIDIRECTIONAL. While
>    it would not be harmful to keep doing it for bidirectional mappings,
>    those are apparently not used in any callers that care about the flag.
>
>  - Since arm has its own dma-iommu abstraction, this now also needs to
>    call the same function, so the calls are added there to mirror the
>    dma-direct version.
>
>  - Like dma-direct, the dma-iommu version now marks the dcache clean
>    for both coherent and noncoherent devices after a DMA, but it only
>    does this for DMA_FROM_DEVICE, not DMA_BIDIRECTIONAL.
>
> [ HELP NEEDED: can anyone confirm that it is a correct assumption
>   on arm that a cache-coherent device writing to a page always results
>   in it being in a PG_dcache_clean state like on ia64, or can a device
>   write directly into the dcache?]
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit 322dbe898f82fd8a
("ARM: dma-mapping: split out arch_dma_mark_clean() helper") in
esmil/jh7100-dmapool.

If CONFIG_ARM_DMA_USE_IOMMU=3Dy, the build fails.

> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c

> @@ -1294,6 +1298,17 @@ static int arm_iommu_map_sg(struct device *dev, st=
ruct scatterlist *sg,
>         return -EINVAL;
>  }
>
> +static void arm_iommu_sync_dma_for_cpu(phys_addr_t phys, size_t len,
> +                                      enum dma_data_direction dir,
> +                                      bool dma_coherent)
> +{
> +       if (!dma_coherent)
> +               arch_sync_dma_for_cpu(phys, s->length, dir);

s/s->length/len/

> +
> +       if (dir =3D=3D DMA_FROM_DEVICE)
> +               arch_dma_mark_clean(phys, s->length);

Likewise.

> +}
> +
>  /**
>   * arm_iommu_unmap_sg - unmap a set of SG buffers mapped by dma_map_sg
>   * @dev: valid struct device pointer

> @@ -1425,9 +1438,9 @@ static void arm_iommu_unmap_page(struct device *dev=
, dma_addr_t handle,
>         if (!iova)
>                 return;
>
> -       if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
> +       if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))

Missing opening curly brace.

>                 phys =3D iommu_iova_to_phys(mapping->domain, handle);
> -               arch_sync_dma_for_cpu(phys, size, dir);
> +               arm_iommu_sync_dma_for_cpu(phys, size, dir, dev->dma_cohe=
rent);
>         }
>
>         iommu_unmap(mapping->domain, iova, len);

With the above fixed, it builds and boots fine (on R-Car M2-W).

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
