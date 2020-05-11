Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C5B1CD2B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 09:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LCTh6rphzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 17:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LCRS5R7TzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 17:36:20 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id 72so6806793otu.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 00:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3VY/12wWR1zHjOHzyqluXVdqy0F7FQQDSlqPm2Zx5o=;
 b=imzUtrOr9Mba4PauiNUimWGqJsjcepd4GAtIY6N/G1WILF29M/+RUSLPEie5WkWyb0
 LF703qRryv0k8jMDzb79td3pjzwwMZPynx4/SGW3O9L8KLapRkpA2EzKnlvYs8Ij1RJZ
 rFnAdVVXYKHCNcgP2ogsRxCoGgscmkQi56darcnx9gfsOGUbQvzZcRggw8FdzZ2WuFqS
 lqu7LYfaAcwGLfkOk6Q/Z5ZET0SDL8TyqUyrmYbfETuqIZ3vqkCtGlItymqj5ZqH74zJ
 dZs8WTc1melK3N1bEqo/l4mvW4QH+tC9V9moHWPrGQjKXjrCE+SNFXW/nOXwy32lsd0f
 6quQ==
X-Gm-Message-State: AGi0PuYfvESseZKgD3s1wdX10y67MhvGpti0tw80IVIRRqd5F/MMVIZB
 n44TNJGcXPGZie0YQsXDe3ZD2OKUfjq9Jy07dVI=
X-Google-Smtp-Source: APiQypLU+moEt/plrIiBoDJtx6y9Ecp1jwHNmsr5IHgDhGkXTabpMRQH56iYz7dU/N/BpO7atrGAmOYhZDTTv1TixAM=
X-Received: by 2002:a9d:7990:: with SMTP id h16mr11274742otm.145.1589182577008; 
 Mon, 11 May 2020 00:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-22-hch@lst.de>
In-Reply-To: <20200510075510.987823-22-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:36:05 +0200
Message-ID: <CAMuHMdXS-ygT01KfhS0y9WcYbi9HKdQL7Q1HXgUZdayzQb_qSA@mail.gmail.com>
Subject: Re: [PATCH 21/31] mm: rename flush_icache_user_range to
 flush_icache_user_page
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

On Sun, May 10, 2020 at 9:57 AM Christoph Hellwig <hch@lst.de> wrote:
> The function currently known as flush_icache_user_range only operates
> on a single page.  Rename it to flush_icache_user_page as we'll need
> the name flush_icache_user_range for something else soon.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/include/asm/cacheflush_mm.h  |  4 ++--
>  arch/m68k/mm/cache.c                   |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
