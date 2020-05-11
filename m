Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019A1CD322
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 09:44:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LCcc0L5yzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 17:44:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LCXt0DgNzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 17:41:01 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id k110so6795961otc.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 00:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VS2fk1JcC03oZxkfqvBGknuVzDopGVbMhfQjjlcRALA=;
 b=o54jL3Hfhu2sLBAJxR4iZ9rAVrHeNp2wq9LDMpoeMYVYT3fqt+a2j8bHTETuijISVs
 StwMlbs9vSYkDDOxw+oeGTJB5s/UhzZXR8ZOc1MgwDsLsS8QKzgco6HQFrNQKj/SqGsW
 9BIPCfKtUFERhLgwVCg0/xZGyFUi1qg3ZSf4nhdSzUCy2Nm3IkHD4uV5Q/yiC533NZaR
 MnDdhCEcfCB2ODIt8pmdpkHaQaBN15rskaVpbtUpyH+O18KJI7FlphQWSDPzCd0pGHhg
 pR/kPgf7SNZXqiYyv+ZO3VszU8VcSlYYeEMcWx9LkqMi9xuCwghpeBmdefpikplQ+IFv
 OCLg==
X-Gm-Message-State: AGi0PuY7o50zNTp+HP6FXn7V6SUBielbiBNy/lfmyiO9xHsPkGN8iapa
 9IE0FFu0lTYjT6TCn/VK3F1h1e8JeAQWOcOvPrk=
X-Google-Smtp-Source: APiQypLrnA3x0TQgcu4GbQXkWDUyTXgEK7R9Byl6mAxrtqxgZZGXhJd6czCyilOQXM5O9JA2CdYzbDyIV5/QIHKRb9A=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr10878643otl.107.1589182859874; 
 Mon, 11 May 2020 00:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-32-hch@lst.de>
In-Reply-To: <20200510075510.987823-32-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:40:39 +0200
Message-ID: <CAMuHMdU_OxNoKfO=i903kx0mgk0-i2h4u2ase3m9_dn6oFh_5g@mail.gmail.com>
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

On Sun, May 10, 2020 at 9:57 AM Christoph Hellwig <hch@lst.de> wrote:
>
> flush_icache_range generally operates on kernel addresses, but for some
> reason m68k needed a set_fs override.  Move that into the m68k code
> insted of keeping it in the module loader.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
