Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1C78904
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 11:59:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xwC46XQrzDqKK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 19:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.221.66; helo=mail-wr1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xw8v6k50zDq61
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 19:57:35 +1000 (AEST)
Received: by mail-wr1-f66.google.com with SMTP id y4so61124184wrm.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 02:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EgmHLFik/OPgDdGuLMAdfuPiX1r55Htn8ht8rmVprc=;
 b=sGNYOp4+yW/7XDMa66aHr2QM6yCdNexEJcRBYVqrrqSmBawS2VCd1cD7sPOR3s7fqi
 ai8psUk9rXRhr2LvAMoDAeciq7952XiLV29TH55mJZgHLaOgaSLjB+Zx8UOkOWLsF+3H
 OTDgmdI0HIbJqSvPjm+nk8EfctmxlaVZlugJLRAbnFhESMaf6o7K+CU/P41Cr+IVy/q+
 fd3T+li/PvdnhLmdM5nzMWVidv3bTeBVzN/gxsKybH/O+hQVtQ6mMuOh2J6zI81PSqxF
 9FR9Ica8IECG3e4oDD+HPWBfIETqygtXsEDL3S+6nZNwP/NbRksayCBv4aMjbAvmBvNw
 thVg==
X-Gm-Message-State: APjAAAUnPVlvKKW+/yrF90oi5/CQTa7XcvBQxtFh7vXNcVKk4iKK+2RL
 ylIwtJQvqweqkpO9ch8fEAkqz+nXhtUbNRJYc3g=
X-Google-Smtp-Source: APXvYqwjfJqS4NGp1R7UrJA2JKANbRDFjcVknk63xGwZnvz1sSMLkkUqcYNpnDqWGXG4WZ8w21QgE4NZzRTpKbjjx94=
X-Received: by 2002:adf:f08f:: with SMTP id n15mr35431224wro.213.1564394251709; 
 Mon, 29 Jul 2019 02:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190725063401.29904-1-hch@lst.de>
 <20190725063401.29904-5-hch@lst.de>
In-Reply-To: <20190725063401.29904-5-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2019 11:57:19 +0200
Message-ID: <CAMuHMdUBPj8AVSuDwaBB_4gRD6k7vzo0WAFJEkTUbxSw31bzUg@mail.gmail.com>
Subject: Re: [PATCH 4/5] dma-mapping: provide a better default
 ->get_required_mask
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
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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

On Thu, Jul 25, 2019 at 8:35 AM Christoph Hellwig <hch@lst.de> wrote:
> Most dma_map_ops instances are IOMMUs that work perfectly fine in 32-bits
> of IOVA space, and the generic direct mapping code already provides its
> own routines that is intelligent based on the amount of memory actually
> present.  Wire up the dma-direct routine for the ARM direct mapping code
> as well, and otherwise default to the constant 32-bit mask.  This way
> we only need to override it for the occasional odd IOMMU that requires
> 64-bit IOVA support, or IOMMU drivers that are more efficient if they
> can fall back to the direct mapping.

As I know you like diving into cans of worms ;-)

Does 64-bit IOVA support actually work in general? Or only on 64-bit
platforms, due to dma_addr_t to unsigned long truncation on 32-bit?

https://lore.kernel.org/linux-renesas-soc/CAMuHMdWkQ918Y61tMJbHEu29AGLEyNwbvZbSBB-RRH7YYUNRcA@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
