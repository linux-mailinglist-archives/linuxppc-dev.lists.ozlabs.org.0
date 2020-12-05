Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 694A72CFABD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 10:07:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp3cL25B9zDqkG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 20:07:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp3Zc72hCzDqfP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 20:05:44 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id t205so9152590oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Dec 2020 01:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGdaUmtB30TVsj7alwm/cJhVAoMWhBl+L16TLVJy0GU=;
 b=ePbXHDrN2gMsekl81fAwIVe5AND9ELUD/eTxcJJ/qLRAEINIIIuZZjwr1BukCSJfnd
 VrSsKaaED8P1/j/LDG07PigFk+1Girfnfed69BZqgZ3bkw/yT0elvPyJVH823CyrFiFW
 KTvz0J+gTZDZFWf3vhnIpfrUhVqG6XzKqQPUjsy/bdyLb94dxCm2JgHZe50sPDRq9SVB
 i8QA71SGsrxV9bFT+TUn0VFZ8h/kYoq11X9N8kyMDW4gi6NsAimkQhHq3/5Lfv2mK1Zm
 Z5I3m27ZAPDiONpL6BOwiVZFS0bnkeUVfwuGWfNjPl4KFbt9TJ20FELiO7iS06I5SsyY
 TLzQ==
X-Gm-Message-State: AOAM531tbbwc8WyGmb9CvIAkAo1QaVPLOjjEg7OnoyTuiVlKjnjlaMWV
 25mAhZWvtYstNpt5pyfZGml4SHayZ8jUTAx5Z/g=
X-Google-Smtp-Source: ABdhPJwLYvltQQGfaxz5Cw2w/zv1Y+C9MgjWhLpZYxRx4VvMLhZqNWb3xLk+V7UCvmYR02UJOryygCbm26eslneYzJA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr5872940oih.153.1607159141323; 
 Sat, 05 Dec 2020 01:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20201130085743.1656317-1-geert+renesas@glider.be>
 <160714944657.1580929.4595234852977229885@swboyd.mtv.corp.google.com>
In-Reply-To: <160714944657.1580929.4595234852977229885@swboyd.mtv.corp.google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 5 Dec 2020 10:05:29 +0100
Message-ID: <CAMuHMdWJhiO5A7b3B8CH2YpURe_G0dEPEmES6R8n_8D-Z+Q65A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-clk <linux-clk@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On Sat, Dec 5, 2020 at 7:24 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2020-11-30 00:57:43)
> > The R9A06G032 clock driver uses an array of packed structures to reduce
> > kernel size.  However, this array contains pointers, which are no longer
> > aligned naturally, and cannot be relocated on PPC64.  Hence when
> > compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=y (e.g.
> > PowerPC allyesconfig), the following warnings are produced:
> >
> >     WARNING: 136 bad relocations
> >     c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
> >     c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
> >     ...
> >
> > Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
> > definition, trading a small size increase for portability.
> >
> > This increases the 156-entry clock table by 1 byte per entry, but due to
> > the compiler generating more efficient code for unpacked accesses, the
> > net size increase is only 76 bytes (gcc 9.3.0 on arm32).
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
>
> Unless you want me to pick this up for clk-fixes?

Yes please. Forgot to retain this comment for v2:

   "Please take directly (ppc or clk), as this is a build fix.
    https://lore.kernel.org/linux-clk/20201128122819.32187696@canb.auug.org.au/"

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
