Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9B55B897
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 10:27:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWgnh0Ccfz3c95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 18:27:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.41; helo=mail-qv1-f41.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWgnC6Hyqz3bls
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 18:26:55 +1000 (AEST)
Received: by mail-qv1-f41.google.com with SMTP id 89so13833119qvc.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 01:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ir7A3VG3rQ4e3U1bE1FV/pPr5VS7k4YiEaqfUpRXgys=;
        b=g1vTrqyH3AdsQ3K5arpm8ZluXOZZjiNhJubb3MGXy1JZKs+IbC4GPl4hbIqK3L1NI7
         YrO8dOiyGZtSZNrpLn0uYuDuuFW7ejbO1ySeBAmQ8Ykzm8KYRLGrHsbs58qKa2P0gY22
         3VnQi9WmOdMp8ufLqaDJ8ErqmMivX7NMq+bJ5B5LCvmZyyYKU/N05BBY9ZZUCTEyN3tW
         XRh6qS9YGw3bqrZCzUg7wxYw4imGQB6f1zBN2UvNHXvUazEP6d+CCy/vjie3nR5YHKiR
         Z4oSDu4mupY/hKZQppKFcpfxnsMB4OxRM8hwjXVsE5SrGnFKrRTAIs3MhtyKNOe6NqE3
         /kug==
X-Gm-Message-State: AJIora87nlm3yW8nr4fxWV0CYTQDXAw2MaLL5gvAEiCxVmgfQ3QmCwBZ
	b5k878QUm+oZwXG9MnB8nxfrcgmShfoWfg==
X-Google-Smtp-Source: AGRyM1thEWyNqrYC279prxFc2u9p7VdRCzqFuh2U8zQwq/xxNV91KgnVhOtSrCmiiN/8P7QAuAP1dg==
X-Received: by 2002:ac8:5e4e:0:b0:306:773f:b747 with SMTP id i14-20020ac85e4e000000b00306773fb747mr8179927qtx.499.1656318411982;
        Mon, 27 Jun 2022 01:26:51 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 194-20020a370acb000000b006a8b6848556sm8049001qkk.7.2022.06.27.01.26.50
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:26:51 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3176d94c236so78078637b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 01:26:50 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr14193176ywg.383.1656318410280; Mon, 27
 Jun 2022 01:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
In-Reply-To: <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jun 2022 10:26:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
Message-ID: <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To: Michael Schmitz <schmitzmic@gmail.com>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > All architecture-independent users of virt_to_bus() and bus_to_virt()
> > have been fixed to use the dma mapping interfaces or have been
> > removed now.  This means the definitions on most architectures, and the
> > CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
> >
> > The only exceptions to this are a few network and scsi drivers for m68k
> > Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> > with the old interfaces and are probably not worth changing.
>
> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
> virt_to_bus by virt_to_phys in the dma_setup() function there would
> cause no functional change at all.

FTR, the sgiwd93 driver use dma_map_single().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
