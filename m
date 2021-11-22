Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8E1458F54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 14:24:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HySgB0wy1z3c6G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 00:24:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.49; helo=mail-ua1-f49.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HySfj28Jtz2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 00:24:27 +1100 (AEDT)
Received: by mail-ua1-f49.google.com with SMTP id p2so36372410uad.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 05:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=xarPnle33Vd1NAVNINArZXI9fdyD3SNGNTfacLEzKQo=;
 b=j/dzKMn8mBkHGTekgezkzIBxCJvNw96pvGx7zQdXK5a67JRG+WnACqoF9VWofwSd+l
 FX2qTeUQEpjrXn17ce+IR52sE0762Z4H0PgQCOP1AKAelMhNnnnWQjUz7TO+mO4JyUIL
 plSipP4+UT99+b/EjEjXB7dlgdp0PILDaBn0mYy059Sy6y3NohDrgEOeqnyITX8v/A02
 5XixsrqcgGmPyxzovRnwc2BjeQfO5KkfhEac6suEnPhQ4BMGK5Wd+kgNm154WNYss1Qf
 5URnN4NJszJpgzvfgWshqe3mbvTPZYOwOEMw3smDEwlsBTIXEABEcsProM7hF4TnuOhH
 VPrQ==
X-Gm-Message-State: AOAM5320pj363VQjhZqwuYcbDpjrN4BcIWbCBTvPf9+ChHegErXiokOt
 Zz/5hMTRosyw4pepsNlyERiVDp2dsBeeeg==
X-Google-Smtp-Source: ABdhPJyMETM25G4idk+BALH84gHkuS1Rc0Q/KyxQl56QR9t8ie580FH8OjF8M48naa5H2ukmLxeVkg==
X-Received: by 2002:ab0:6ca7:: with SMTP id j7mr85816291uaa.133.1637587463319; 
 Mon, 22 Nov 2021 05:24:23 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id y7sm4383118uac.3.2021.11.22.05.24.22
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 05:24:22 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id t13so36389107uad.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 05:24:22 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr85736008uar.14.1637587462423; 
 Mon, 22 Nov 2021 05:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20211122111214.3801534-1-geert@linux-m68k.org>
In-Reply-To: <20211122111214.3801534-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Nov 2021 14:24:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7jcoNHyBomcbkkHU-m32uAureeHYj_PhaMC=O2b4wLA@mail.gmail.com>
Message-ID: <CAMuHMdW7jcoNHyBomcbkkHU-m32uAureeHYj_PhaMC=O2b4wLA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.16-rc2
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-um@lists.infradead.org, sparclinux@vger.kernel.org, 
 linux-ntfs-dev@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 22, 2021 at 12:28 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.16-rc2[1] compared to v5.15[2].
>
> Summarized:
>   - build errors: +13/-12
>   - build warnings: +3/-26
>
> JFYI, when comparing v5.16-rc2[1] to v5.16-rc1[3], the summaries are:
>   - build errors: +6/-12

  + /kisskb/src/drivers/mtd/nand/raw/mpc5121_nfc.c: error: unused
variable 'mtd' [-Werror=unused-variable]:  => 294:19

ppc32_allmodconfig (patch sent)

  + /kisskb/src/drivers/video/fbdev/nvidia/nvidia.c: error: passing
argument 1 of 'iounmap' discards 'volatile' qualifier from pointer
target type [-Werror=discarded-qualifiers]:  => 1439:10, 1414:10
  + /kisskb/src/drivers/video/fbdev/riva/fbdev.c: error: passing
argument 1 of 'iounmap' discards 'volatile' qualifier from pointer
target type [-Werror=discarded-qualifiers]:  => 2095:11, 2062:11

um-all{mod,yes}config

  + /kisskb/src/fs/netfs/read_helper.c: error: implicit declaration of
function 'flush_dcache_folio' [-Werror=implicit-function-declaration]:
 => 435:4

sparc-allmodconfig
sparc64-allmodconfig

  + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2192 bytes is
larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1

ppc64le_allmodconfig

  + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2256 bytes is
larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1

powerpc-allyesconfig

> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/136057256686de39cc3a07c2e39ef6bc43003ff6/ (all 90 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf/ (all 90 configs)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
