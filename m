Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66182307130
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 09:18:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRCzZ2lYWzDrgC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 19:18:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.176;
 helo=mail-oi1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRCxw2MzfzDrfh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 19:17:23 +1100 (AEDT)
Received: by mail-oi1-f176.google.com with SMTP id g69so5147908oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 00:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TL3tp80ch5Ojmt15uhmuDBGqfvQ8YwjAwOvbZ3H5gho=;
 b=GLMgGJoqNuAbEQudKJlaoKB+Qpx+KL31IyFhriIUmtKR/HIuzs//GcZIPjBOIpvbkQ
 cJQz5LqYxis7ZZr3N1siq3Y+Yr6vMw+g5BylDyKHIgLmUvY3V9tBAv/f9tvW6OC9uUOd
 qBacrAigNjj1DuifEVwVFZ+42jbDSa8E555HEYgx/w4io4I619VgJRzA0PRv5N1zvL0T
 ANuzldPlFnV08r/zI2D6h4HpHXEv76e9RrbNIkiKivRs3UcUUQVJRTb1EauCCetHTeS9
 hqa3oFSHG1HHkVnA6IM/oPrAEViUMalN1nllttzWrTGSApKFDXiKhazKaIN/oO1Yb4Ex
 8CpQ==
X-Gm-Message-State: AOAM5331ad9gaaD4AYB/f4lE8OA0xMIatk/iaklUZ7LQuvwUqoNVGjfO
 JrYb+SVeq9UdpGzb+m+12J7TqX6CKIBnGCuY12k=
X-Google-Smtp-Source: ABdhPJyaplo6/NZAAIS02LBbY6W1dLxYDZ/X0XB3GuIXLfaRgiB9Cco71R6713OCRdUcK2cT17+0m9PEdnGKkCz70nI=
X-Received: by 2002:aca:1219:: with SMTP id 25mr5943005ois.54.1611821840178;
 Thu, 28 Jan 2021 00:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-13-masahiroy@kernel.org>
In-Reply-To: <20210128005110.2613902-13-masahiroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Jan 2021 09:17:09 +0100
Message-ID: <CAMuHMdV_AHcnGoVToHLXa95JEd4wcL3eTqYfk6=7Ou0W8VJR5w@mail.gmail.com>
Subject: Re: [PATCH 12/27] m68k: syscalls: switch to generic syscalltbl.sh
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 alpha <linux-alpha@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yamada-san,

On Thu, Jan 28, 2021 at 1:54 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> As of v5.11-rc1, 12 architectures duplicate similar shell scripts in
> order to generate syscall table headers. My goal is to unify them into
> the single scripts/syscalltbl.sh.
>
> This commit converts m68k to use scripts/syscalltbl.sh.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks a lot!

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
