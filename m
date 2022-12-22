Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5848654283
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 15:13:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdC2X5P85z3c8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 01:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.176; helo=mail-yw1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdC1y3v6Mz2xtv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Dec 2022 01:12:36 +1100 (AEDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3e45d25de97so28231507b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 06:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaSeJ7b4XoTWS2Tt6rTxmu6n/STTyq8+F8PwIAXlFPg=;
        b=rCMpYoCbGxY67vvg8qdmQ60dBkxetfeUuONgJTQt24huk3iy9BjZ+xhpHyuZLF3oaZ
         GTGjMkZp//f1+lYR+m1R918OgbAjPcOwvSxB/KEoKYxdFOLKSjTcDWoMHbIJTQWv40Qh
         niTiphLMBQ0JANdFW/euz1kQyop8af0NvHCEl8xTbrOIEVmCsR5SrSWfNkeOEdCIFUWj
         4bTbqwoOb3dVVssPdsFasumHowMuAdrZzZntP70jwvQvk4bcBXiyTFjrcaRJNjGnXsb7
         A0mVnME1SXxDX/9Y3QHqNEWyI1MA467gMDl5LJ+/IIbmNsWG5XyRCh7c9LYAkFkf0iiH
         Q37w==
X-Gm-Message-State: AFqh2krzT4kME73MFzIV/Tmm/F7u0YUzoYUTdT9NZzpks0RgT80A6REP
	/cc8PPyzpnPUtif2zf3VKvKokQcAUALxyQ==
X-Google-Smtp-Source: AMrXdXt6h/RjwmIhHSYTsPttHJF/0CcThH8wj5KNwsduOlIkcoyiOuHRkF9GgMyO4QSxZLUDOcJOIA==
X-Received: by 2002:a05:7500:33a6:b0:ee:4dd2:52cb with SMTP id cr38-20020a05750033a600b000ee4dd252cbmr404359gab.12.1671718352973;
        Thu, 22 Dec 2022 06:12:32 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id j6-20020a05620a288600b006fc9847d207sm344176qkp.79.2022.12.22.06.12.31
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 06:12:31 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id g4so2074243ybg.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 06:12:31 -0800 (PST)
X-Received: by 2002:a25:d243:0:b0:702:90b4:2e24 with SMTP id
 j64-20020a25d243000000b0070290b42e24mr417369ybg.365.1671718351056; Thu, 22
 Dec 2022 06:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Dec 2022 15:12:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
Message-ID: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andrzej,

Thanks for your series!

On Thu, Dec 22, 2022 at 12:49 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> I hope there will be place for such tiny helper in kernel.
> Quick cocci analyze shows there is probably few thousands places
> where it could be useful.
> I am not sure who is good person to review/ack such patches,
> so I've used my intuition to construct to/cc lists, sorry for mistakes.
> This is the 2nd approach of the same idea, with comments addressed[0].
>
> The helper is tiny and there are advices we can leave without it, so
> I want to present few arguments why it would be good to have it:
>
> 1. Code readability/simplification/number of lines:
>
> Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> -       previous_min_rate = evport->qos.min_rate;
> -       evport->qos.min_rate = min_rate;
> +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);

Upon closer look, shouldn't that be

    previous_min_rate = __xchg(&evport->qos.min_rate, min_rate);

?

> For sure the code is more compact, and IMHO more readable.
>
> 2. Presence of similar helpers in other somehow related languages/libs:
>
> a) Rust[1]: 'replace' from std::mem module, there is also 'take'
>     helper (__xchg(&x, 0)), which is the same as private helper in
>     i915 - fetch_and_zero, see latest patch.
> b) C++ [2]: 'exchange' from utility header.
>
> If the idea is OK there are still 2 qestions to answer:
>
> 1. Name of the helper, __xchg follows kernel conventions,
>     but for me Rust names are also OK.

Before I realized the missing "&", I wondered how this is different
from swap(), so naming is important.
https://elixir.bootlin.com/linux/latest/source/include/linux/minmax.h#L139

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
