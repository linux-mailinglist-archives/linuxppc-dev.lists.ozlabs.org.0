Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C09251437
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 10:29:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbMbf0rbqzDqTg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 18:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbMYv6WYMzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 18:27:47 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id t7so9738226otp.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 01:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hxg7mNwlR3vuscL5TlgoioLVulJhR5tUG0gm7sNHuU=;
 b=PZIlJjlMxZbeIW7SmDYuylWsIEuGfBMZgQmDxc+JnLD/SHQzy6YUq5TCCwIHBctWvv
 AH0kf1gtptmIR0hoMhxernlLk8aYW3UsiW57ZgQCn+e8D0iZO8UtHrxAQRWch7fZSZ1r
 Occ84zeAvPl40j2lH4aeZRF6kFMnogMLL+Qt8iZ0JdpHUM0+KNkeCvlkylR9wn9GRm2I
 dJGhJzH2KzZBw0tDXJWwWEJP9UJZjpcgy1PyAz83PJY6Um4HyyaJL06hMByzV8oDqZbP
 82RfoW9+IrR8qaQ0nkXskc1rpc3QLZpe2YrG02P68OuIZjZqXbOOVuzE7uxzLPiTR+JC
 MHtg==
X-Gm-Message-State: AOAM530P7T5Mc2HxTWC04iBb3ikPcLXyBidxdqiTkPUV17GWMszzMgSX
 Wj8yHMVbpkAyFJtE2hG7hD6XS9XErveapSPrgHs=
X-Google-Smtp-Source: ABdhPJx0zXPstCnHnri8lFi7O8MyFA9EVV1YuGVzMSeMep6iCVN61tQvMEWQU45MOEt5Xh8X+3G5H74q0zQlBpGScQA=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr6283711otn.250.1598344064333; 
 Tue, 25 Aug 2020 01:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200825081909.2797-1-geert@linux-m68k.org>
In-Reply-To: <20200825081909.2797-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2020 10:27:32 +0200
Message-ID: <CAMuHMdUZgx51cFuJdeKo57pmRX+NB+OBxsCv1sg46=MLxouN7w@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.9-rc2
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
Cc: sparclinux <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 25, 2020 at 10:23 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.9-rc2[1] to v5.9-rc1[3], the summaries are:
>   - build errors: +12/-0

  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:
error: implicit declaration of function 'disable_kernel_vsx'
[-Werror=implicit-function-declaration]:  => 676:2
  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:
error: implicit declaration of function 'enable_kernel_vsx'
[-Werror=implicit-function-declaration]:  => 640:2

powerpc-gcc4.9/ppc64_book3e_allmodconfig

  + error: arch/sparc/kernel/head_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against `.init.text':  => (.head.text+0x5040),
(.head.text+0x5100)
  + error: arch/sparc/kernel/head_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against symbol `leon_smp_cpu_startup' defined in .text
section in arch/sparc/kernel/trampoline_32.o:  => (.init.text+0xa4)
  + error: arch/sparc/kernel/process_32.o: relocation truncated to
fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0x4), (.fixup+0xc)
  + error: arch/sparc/kernel/signal_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against `.text':  => (.fixup+0x28), (.fixup+0x1c),
(.fixup+0x34), (.fixup+0x10), (.fixup+0x4)

sparc64/sparc-allmodconfig

  + error: modpost: "devm_ioremap"
[drivers/net/ethernet/xilinx/ll_temac.ko] undefined!:  => N/A
  + error: modpost: "devm_ioremap_resource"
[drivers/net/ethernet/xilinx/xilinx_emac.ko] undefined!:  => N/A
  + error: modpost: "devm_of_iomap"
[drivers/net/ethernet/xilinx/ll_temac.ko] undefined!:  => N/A
  + error: modpost: "devm_platform_ioremap_resource"
[drivers/iio/adc/adi-axi-adc.ko] undefined!:  => N/A
  + error: modpost: "devm_platform_ioremap_resource"
[drivers/ptp/ptp_ines.ko] undefined!:  => N/A
  + error: modpost: "devm_platform_ioremap_resource_byname"
[drivers/net/ethernet/xilinx/ll_temac.ko] undefined!:  => N/A

um-x86_64/um-all{mod,yes}config

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/d012a7190fc1fd72ed48911e77ca97ba4521bccd/ (all 192 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9123e3a74ec7b934a4a099e98af6a61c2f80bbf5/ (all 192 configs)
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
