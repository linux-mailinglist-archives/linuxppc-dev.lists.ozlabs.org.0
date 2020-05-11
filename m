Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A77991CDF00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 17:29:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LPxR0kQRzDr6c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 01:29:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.66; helo=mail-oo1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LPr01gDYzDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 01:24:45 +1000 (AEST)
Received: by mail-oo1-f66.google.com with SMTP id i9so2014060ool.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 08:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cFOqYFe+JnxanB4tWXMEfN+/EOvlslN0N0IK+ztKBU4=;
 b=XTSNimE2aIVgFH3ne3ASlXcwezhf2xYl0OWp1BwfKoFPGK0ZuiLHwQXxyfToZRzka+
 /24qVXDhswYOIaygk7NrJv85jPzVBtM5m1V7y3jX8a6aBEJ32yDkKxiDIxIijtY4vVUB
 kNj6N2hc3WIWBiDLX0g2kWblhmfjrC+haEQXpe1GYAG93TCLIwtQ3FDUCtFK/f1unVvc
 kdh5lZMEABhdGWhfsFjVvxKfwYdmshah6GpRmkMQbOxoIcS2eTGunfHECXVs0x1TuVxF
 hyQkXYOrw/Mivq25TTP5G/xrXSpYrVutDdSD1iGm0JSz0Y7xFCb0sazjZSyBF9EMVJJn
 TMug==
X-Gm-Message-State: AGi0PuYUoNlzXphXMddQWDbVu0ZbEg75FtJduqs21LOT5cMD62MdWuUs
 s55qK2MjV2PUmcerhjbqyoLh6KtMgrJwvkqSeNM=
X-Google-Smtp-Source: APiQypJasCN4yl8lWM1FRmzaz39ukL/iWbljLpcbY1TKIvOnIUfi1IKvTWCvzobh4HXgocJWo6GBkm5ORmsQ5s6pFSU=
X-Received: by 2002:a4a:d204:: with SMTP id c4mr2380562oos.1.1589210682093;
 Mon, 11 May 2020 08:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-32-hch@lst.de>
 <CAMuHMdU_OxNoKfO=i903kx0mgk0-i2h4u2ase3m9_dn6oFh_5g@mail.gmail.com>
 <20200511151120.GA28634@lst.de>
In-Reply-To: <20200511151120.GA28634@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 17:24:30 +0200
Message-ID: <CAMuHMdW1S91i3x0unNcJnypHse7ifynGb4dZcVhJaemR3GH1Pg@mail.gmail.com>
Subject: Re: [PATCH 31/31] module: move the set_fs hack for flush_icache_range
 to m68k
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Mon, May 11, 2020 at 5:11 PM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, May 11, 2020 at 09:40:39AM +0200, Geert Uytterhoeven wrote:
> > On Sun, May 10, 2020 at 9:57 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > flush_icache_range generally operates on kernel addresses, but for some
> > > reason m68k needed a set_fs override.  Move that into the m68k code
> > > insted of keeping it in the module loader.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Btw, do you know what part of flush_icache_range relied on set_fs?
> Do any of the m68k maintainers have an idea how to handle that in
> a nicer way when we can split the implementations?

arch/m68k/mm/cache.c:virt_to_phys_slow()

All instructions that look up addresses in the page tables look at the
source/destination function codes (SFC/DFC) to know if they have to use
the supervisor or user page tables.
So the actual implementation is the same: set_fs() merely configures
SFC/DFC, to select the address space to use.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
