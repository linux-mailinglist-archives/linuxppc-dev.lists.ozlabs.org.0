Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B3450983
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 17:20:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtDvJ0jXDz2yJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 03:20:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.48; helo=mail-ua1-f48.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtDtn62Gqz2xDr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 03:20:16 +1100 (AEDT)
Received: by mail-ua1-f48.google.com with SMTP id l24so31753538uak.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 08:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efm7nTUMt8rzsLA3IdyOYKyQXeHPPTB88YQ7l3tEZPU=;
 b=oVMoxJDY2nD2kUw41KTKbppAfuW+4ItE/I7njoMqkQaxsjSUdBLzkaF2IZterTbZo9
 0uPwU5JZ0Dav5f56tIC3gdWB23+i78ZZD+vGdOLH7fPGYLiixZVyTGq9hwVKzfkL8tcS
 A28Q24jAeeqz8AQUSfSd8q6szN4KkhgPIwEzvHikIpAIFqArRzeM4GiKsibZySHfP3yU
 KGOUwelcIEpuCvKJMt52Ey6HRfYdTOAxQforMSuOlqm/sch7pOykN2ZqWGozBYQ4Y4gq
 AH0y0PelV7vSIO5HewH6Tawqcxpu2sj8e12xFZb83QuAld7HwJ53ehcNy19q1oTYax6O
 YCgQ==
X-Gm-Message-State: AOAM533WcsD5Omyp+GA24eNRLmOFktillDDq1b40lZKVNNR9I2Bkimcz
 3Y8xU9iG+K+DkB0mpamvYVQxAGg+E2ZICg==
X-Google-Smtp-Source: ABdhPJytir+kQZzgcK6HwwhI6/dD2w7j86IP0D6rafLMEX397WO6CDM8zhC24ASG0ADpSWhWJ6lVPg==
X-Received: by 2002:a05:6102:6c9:: with SMTP id
 m9mr45136135vsg.32.1636993212464; 
 Mon, 15 Nov 2021 08:20:12 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id 23sm8497634vkk.17.2021.11.15.08.20.12
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 08:20:12 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id p2so36006951uad.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 08:20:12 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr60850690vkh.11.1636992782095; 
 Mon, 15 Nov 2021 08:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20211115155105.3797527-1-geert@linux-m68k.org>
In-Reply-To: <20211115155105.3797527-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Nov 2021 17:12:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
Message-ID: <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.16-rc1
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Helge Deller <deller@gmx.de>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Nick Terrell <terrelln@fb.com>, Joey Gouly <joey.gouly@arm.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, Hector Martin <marcan@marcan.st>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 15, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.16-rc1[1] compared to v5.15[2].
>
> Summarized:
>   - build errors: +20/-13
>   - build warnings: +3/-28
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf/ (all 90 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8bb7eca972ad531c9b149c0a51ab43a417385813/ (all 90 configs)
>
>
> *** ERRORS ***
>
> 20 error regressions:
>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: expected ':' before '__stringify':  => 33:4, 18:4
>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: label 'l_yes' defined but not used [-Werror=unused-label]:  => 38:1, 23:1

    due to static_branch_likely() in crypto/api.c

parisc-allmodconfig

>   + /kisskb/src/drivers/gpu/drm/msm/msm_drv.h: error: "COND" redefined [-Werror]:  => 531
>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 3252 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 47:1
>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 3360 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 499:1
>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 5344 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 334:1
>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 5380 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 354:1
>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 1824 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 372:1
>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 2224 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 204:1
>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 3800 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 476:1

parisc-allmodconfig

>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2240 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1
>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1
>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2320 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1

powerpc-allmodconfig

>   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_366' declared with attribute error: FIELD_PREP: value too large for the field:  => 335:38

    in drivers/pinctrl/pinctrl-apple-gpio.c

arm64-allmodconfig (gcc8)

>   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_overflow' declared with attribute error: detected read beyond size of object (1st parameter):  => 263:25, 277:17

    in lib/test_kasan.c

s390-all{mod,yes}config
arm64-allmodconfig (gcc11)

>   + error: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A
>   + error: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A
>   + error: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A
>   + error: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A
>   + error: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!:  => N/A

mips-allmodconfig

> 3 warning regressions:
>   + <stdin>: warning: #warning syscall futex_waitv not implemented [-Wcpp]:  => 1559:2

powerpc, m68k, mips, s390, parisc (and probably more)

>   + arch/m68k/configs/multi_defconfig: warning: symbol value 'm' invalid for MCTP:  => 322
>   + arch/m68k/configs/sun3_defconfig: warning: symbol value 'm' invalid for MCTP:  => 295

Yeah, that happens when symbols are changed from tristate to bool...
Will be fixed in 5.17-rc1, with the next defconfig refresh.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
