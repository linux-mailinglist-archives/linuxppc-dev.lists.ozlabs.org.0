Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D87872E0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 09:23:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464cCj2jlnzDqyv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 17:23:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464c9z4MSwzDqjj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 17:21:42 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id l15so129064797otn.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 00:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A7mCF4lTq2gFXOvcmY2h+y2/MZQDfsM2+XB9S0QJ6k4=;
 b=omOZE0HfSgb6L+p5HNOr1gmJ5d/cF2J4Svz3gop6UCHwR6afZcOIPFM9KUKS9Czl54
 HqUTn9SlMZjdkv8wcDHtWsbcUznnvK1r2AI8Rl/FeHsi6yX0EWuhj7wxozMJmoA7tUo5
 mNjpfCe+Ew3lIF50Jt83oXSjRSI7KdD93F0QZsvlk4eNslGND5NFU6ONwAjKx7GjUfWv
 MwbUBgoDaVjR54+b3pQXw3lGvL4tfgFFb0uLWqjiVV1t1pL4RE4jsU1AzGG99LxyIAS0
 ef7MGiP6uiXiOnf+6qXbxGdrnM2UxM5rvLxAiMNlHo0c50Svzxw0dqAoxuRXiIbk8eUa
 xLlg==
X-Gm-Message-State: APjAAAVmzCkwvZ6fzBWa887tSIKKm/2f5wwK8K5/HjTzP30hsP7bjqCK
 XsoRfRbgb9jLn+zgjYTWQ+Kjixry+j+DkJOtwq4=
X-Google-Smtp-Source: APXvYqyBXPOK98jaQhUmqtFlEEGP/W76NVu4RQ2ZHS+SsKdevOL3KYGUiRHhF15E80P339HCx6FddAsKPmlukbGoIK8=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr17247630otn.297.1565335299510; 
 Fri, 09 Aug 2019 00:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190808160005.10325-1-hch@lst.de>
 <20190808160005.10325-9-hch@lst.de>
In-Reply-To: <20190808160005.10325-9-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Aug 2019 09:21:28 +0200
Message-ID: <CAMuHMdV0JfZ_K2V7W0FQkobE_zLwe4Uez-EWzMMdTfVffpAWtA@mail.gmail.com>
Subject: Re: [PATCH 8/8] dma-mapping: remove CONFIG_ARCH_NO_COHERENT_DMA_MMAP
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
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Thu, Aug 8, 2019 at 6:01 PM Christoph Hellwig <hch@lst.de> wrote:
> CONFIG_ARCH_NO_COHERENT_DMA_MMAP is now functionally identical to
> !CONFIG_MMU, so remove the separate symbol.  The only difference is that
> arm did not set it for !CONFIG_MMU, but arm uses a separate dma mapping
> implementation including its own mmap method, which is handled by moving
> the CONFIG_MMU check in dma_can_mmap so that is only applies to the
> dma-direct case, just as the other ifdefs for it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig       |  1 -

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
