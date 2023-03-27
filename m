Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C046CA96C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 17:44:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlcYX6LTQz3fT5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 02:44:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HZFjetxT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HZFjetxT;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlcXf30kRz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 02:43:13 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id q206so5396534pgq.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 08:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679931790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRasUUTOEu/ok1S92mQy2tcMp/4KwW2lXbLEiKBj/7o=;
        b=HZFjetxTrU0/nv8Y55FAOK1Apm3VUH13SuQEA6blI4LQsquf470BO/HxA5cmFNd3aK
         KhVXkKlmZq93fBkC6giJvUDlt7FuVro1W64JdaQrEtphQxoptl43dqOAsJuOdXDllTly
         etHqoII3GsZRYL1O1XM8c2+DB4jJ3oBH+CWict03ya4f003TK7u/v0bAMMATlIwbsHEE
         Eab9bSU2vOsS7u7Hi3cpukhSfrOKg/M8N1PXdsx2k+lYCOOyiPnKWQEclkXPeaKbVR3e
         gND/Ow1eDKT0AYLAkJBh79+oSz/WTGmxOT1B4ufDuEkJHS9CEZchC2NFdFV6xpk2+oqj
         wINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679931790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRasUUTOEu/ok1S92mQy2tcMp/4KwW2lXbLEiKBj/7o=;
        b=HhJbZt3wUfiDnadX95PDGDLeDXRgzwSJAReAbuPPU52O0TD477D/HN/WdzHPPrcg7b
         2pjfJLGkQ/8J0mUbfkB7Du4N641blz2ZnjI3fGqf/SONqu1qbsyH/JuVzavWPOd2q0wY
         KaI52Gvmd01MNBj6oLaly7aoIHpe3HYZLXhZDjGBAGgAys4Ts7e/2VJofZBUYw+5/RFr
         +DALrmcAKz5vVI2NPx1TI/X4oXs9gmUZvu9T1QE3kzWSsPLzV4cBVotZlrF8qdQy7/h3
         759O8yUck+gL3BQj9UKlsTvgF9xIcRHXjZqmxHFewBDoLfvvIq2XefCkhXjSyopIG52o
         ny+A==
X-Gm-Message-State: AAQBX9eNVi9TTzPhidMwc8lchiKAcBnfet+2UQdPrKnco8brsMukAn+o
	VvFxehImq1Eszr/atyk3FFy0SXrdeyYPUdboaYQ=
X-Google-Smtp-Source: AKy350ZLARTDoGqBnXYfSrHDqt1ndSavaTIx5HilksseUiOHQOdKd5qG9m3KbOwJxwDn1K1TODO6L/v92bKQLX9gh5M=
X-Received: by 2002:a63:e20f:0:b0:50a:592b:25ba with SMTP id
 q15-20020a63e20f000000b0050a592b25bamr3326211pgh.3.1679931790647; Mon, 27 Mar
 2023 08:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-3-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-3-arnd@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Mar 2023 08:42:59 -0700
Message-ID: <CAMo8BfJwjcQxWVW9o6brvBYTgUe9v=QGgs39=_V6Oc9-OKv7Sw@mail.gmail.com>
Subject: Re: [PATCH 02/21] xtensa: dma-mapping: use normal cache invalidation rules
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong
 @linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 5:14=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> xtensa is one of the platforms that has both write-back and write-through
> caches, and needs to account for both in its DMA mapping operations.
>
> It does this through a set of operations that is different from any
> architecture. This is not a problem by itself, but it makes it rather
> hard to figure out whether this is correct or not, and to unify this
> implementation with the others.
>
> Change the semantics to the usual ones for non-speculating CPUs:
>
>  - On DMA_TO_DEVICE, call __flush_dcache_range() to perform the
>    writeback even on writethrough caches, where this is a nop.
>
>  - On DMA_FROM_DEVICE, invalidate the mapping before the DMA rather
>    than afterwards.
>
>  - On DMA_BIDIRECTIONAL, combine the pre-writeback with the
>    post-invalidate into a call to __flush_invalidate_dcache_range()
>    that turns into a simple invalidate on writeback caches.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/xtensa/Kconfig                  |  1 -
>  arch/xtensa/include/asm/cacheflush.h |  6 +++---
>  arch/xtensa/kernel/pci-dma.c         | 29 +++++-----------------------
>  3 files changed, 8 insertions(+), 28 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
