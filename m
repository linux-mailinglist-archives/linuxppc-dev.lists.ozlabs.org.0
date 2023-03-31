Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8476D1B78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 11:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pnvg26mBxz3fTd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 20:11:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NHiE7PIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NHiE7PIU;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnvfD56glz3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 20:10:59 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-545e907790fso287797947b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680253856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5CSdrZ6l2xgXTKH1xLlq+jBgcd46ofV0BIoXJ6/6jM=;
        b=NHiE7PIU/1phremrSsF3/CQl6d7YKEdlDtlJ9Vwel53T7D2fDOz9Eopk4FcpZ1dSIm
         yu9e8Xh0JHbk1x3sJ/r5+kRcRDuV43DeZbQfu0w/kMYchm+WG+IUDHf/BC224Jw6v7Hy
         BSChRpraLXKpD4dnyCnfqBFCzvRsPoxHhXE18GrmUrPhY5zXpmqt7RX+zSjGr8+FpZWf
         ToQfnMbBgbPLRwCOIxrk4oSI0MRhYms+6xQVhERPGNAPOHshN0F5ZLgiT7jrBiYwUPBP
         vXOpSg0fjuin5LV315t/YgapeHNpqFNhTohezab0YMYOQMGNlql4NMgvD7BZ1XLyiAEG
         j5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5CSdrZ6l2xgXTKH1xLlq+jBgcd46ofV0BIoXJ6/6jM=;
        b=hQABVr14gkH53W3Q+VGKm9alTqYrr2CcuT/ojkJBBNZM3vAttImEf192iTgSPJnIgG
         VfpKcDK7HNRpqqIE2kAZlIvB/AjDzLZ3CRV9hvz1Wq03DCnzKOzM/h4fUFBAaI/uN8SS
         1D8/VWvqm1urOncizmm2HM2JWM5/TZh2PomXNy0HwmEkFomuk32QO4qvx+BCt1e80IkA
         3/3dSG+7rZNQufowUVpNVb3eiGc71oRVkVce5dK5t53GWZqqxx3dsloFyHcS38MiLPiE
         l1pLWh1XP1QbLCbkkDLh3fntkxwo9f74Jf9jrAwZtLWMa2fB6oiyiHtqKPw/0QRx7xJ7
         Pzyw==
X-Gm-Message-State: AAQBX9dYYlAQKRe5hJjnon/euVNLEZ5spyJ3gBKeMEa+a7toThUMoodC
	1ldjdVT8/LuA4FJ7jvqRU9Eif8Q3FpUn8pBkvalxFA==
X-Google-Smtp-Source: AKy350bTzBXM6ycL3U98ZDogsouHVf6LJB3iu5qAKOjHJ8TlZEoTyW1DjaakW8G4QqD9ZcHPHI8e6e7vqfXcHXD2Pfk=
X-Received: by 2002:a81:b388:0:b0:545:8202:bbcf with SMTP id
 r130-20020a81b388000000b005458202bbcfmr12463339ywh.9.1680253856716; Fri, 31
 Mar 2023 02:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-18-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-18-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 11:10:44 +0200
Message-ID: <CACRpkdZdnTX4-jnnXZveXxwOg76yH4Zyoa-ZSGeC7KzOnn+6Lg@mail.gmail.com>
Subject: Re: [PATCH 17/21] ARM: dma-mapping: use arch_sync_dma_for_{device,cpu}()
 internally
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@mons
 tr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 2:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm specific iommu code in dma-mapping.c uses the page+offset based
> __dma_page_cpu_to_dev()/__dma_page_dev_to_cpu() helpers in place of the
> phys_addr_t based arch_sync_dma_for_device()/arch_sync_dma_for_cpu()
> wrappers around the.

Broken sentence?

> In order to be able to move the latter part set of functions into
> common code, change the iommu implementation to use them directly
> and remove the internal ones as a separate interface.
>
> As page+offset and phys_address are equivalent, but are used in
> different parts of the code here, this allows removing some of
> the conversion but adds them elsewhere.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me, took me some time to verify and understand
the open-coded version of PFN_UP() and this refactoring alone
makes the patch highly valuable.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
