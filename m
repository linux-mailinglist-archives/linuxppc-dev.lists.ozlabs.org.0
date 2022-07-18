Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242F577D6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 10:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmZj23B8Lz3bls
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 18:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.47; helo=mail-oo1-f47.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmZhd2cv6z3bYs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 18:22:40 +1000 (AEST)
Received: by mail-oo1-f47.google.com with SMTP id c203-20020a4a4fd4000000b0043566a4e265so2152292oob.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 01:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EQibuB+HRd3lrCPdCHjd5Kptvz7t3wE5RCUTUbzpTH8=;
        b=Ev2yR5uZwZRONu20haYxyV+zb6pcSfcMCz4zhNjVdFnTmy/ZeYHPPF2QJvgoJD2mLh
         FKq1f3BkfecumbYSfVEZ7vDYlKfl5qyAsNFA174GgSmrYU+fa2yECLLFF83RL8IuqH9k
         mVgvWR593+KCP6FH5kpPB6btH9INSl0N/11jiwr5zXRmjBJDsoJ0GB46aH3zICnI+rM4
         0tWGDrTmjU79p/xgppKdmybC9ROz11cM2rbmBDEZ5pbAB6egeTNrxP5aH9HCI7ry8j1/
         9G1ZkyJWTiTdQAhqIlEEZ1QZ0wH2irKD71howY/a7HhyippsUiLAKqjQWiZjfyTzQiMq
         Fmqw==
X-Gm-Message-State: AJIora+eKAnfKybpnUq5l0DFxctEq+QQwAZJhzCPvtP04Sg6h8ek1zjx
	sC9Qcyp3d7KdGcpc7mroYl7c/hOQ2zMWaA==
X-Google-Smtp-Source: AGRyM1uMHDixxyWuXPHL4FWz/edkWuq/6jaJkxPFth36hlHfmzHRMgwWE+cXy6IGq5ildEYsNHmCYQ==
X-Received: by 2002:a4a:986c:0:b0:40e:94c3:3233 with SMTP id z41-20020a4a986c000000b0040e94c33233mr9012606ooi.2.1658132556086;
        Mon, 18 Jul 2022 01:22:36 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id t17-20020a056870601100b0010d15f11512sm4124649oaa.4.2022.07.18.01.22.35
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 01:22:35 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id g19-20020a9d1293000000b0061c7bfda5dfso8311096otg.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 01:22:35 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr28386378ywb.502.1658132545091; Mon, 18
 Jul 2022 01:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220718004114.3925745-1-shorne@gmail.com> <20220718004114.3925745-2-shorne@gmail.com>
In-Reply-To: <20220718004114.3925745-2-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Jul 2022 10:22:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP=1ovo62oXaOXT4ipA9Qb61XQ1e4XVVi1gEi+s+wtTQ@mail.gmail.com>
Message-ID: <CAMuHMdVP=1ovo62oXaOXT4ipA9Qb61XQ1e4XVVi1gEi+s+wtTQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
To: Stafford Horne <shorne@gmail.com>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.c
 om>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 2:41 AM Stafford Horne <shorne@gmail.com> wrote:
> The generic pci.h header now only provides a definition of
> pci_get_legacy_ide_irq which is used by architectures that support PNP.
> Of the architectures that use asm-generic/pci.h this is only x86.
>
> This patch removes the old pci.h in order to make room for a new
> pci.h to be used by arm64, riscv, openrisc, etc.
>
> The existing code in pci.h is moved out to x86.  On other architectures
> we clean up any outstanding references.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v2:
>  - Remove pci_get_legacy_ide_irq in m68k
> Since v1:
>  - Remove pci_get_legacy_ide_irq for most architectures as its not needed.

>  arch/m68k/include/asm/pci.h    |  2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
