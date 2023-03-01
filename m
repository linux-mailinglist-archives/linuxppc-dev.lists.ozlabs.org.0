Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1146A75CD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 22:01:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRmrN62hzz3cdc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 08:01:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qwnNOgDo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qwnNOgDo;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRmqN5ZRzz2yfq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 08:01:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EF5DDB81037
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 21:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F778C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 21:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677704458;
	bh=Ijy28NfIAolHq1kijXKPv1A9Prn6Z4PgPnz0SF2ZvmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qwnNOgDopWNiUb4dKzA0Y6sT0gASegFoNl0l1oHhxaeFwidRVACqKvo9Zw4Lq2uLa
	 DkRPAf51+Vr8EEyQ7IwC/Bj5H1tJVAjANsJyJLagfb6dQBIR+9OsGjhNPWRat2SOtH
	 5jiteysKnyeBDdmsXExcQfoBUuLwKJRarM2/PpsDCzlFSlDaYiuiIN6Yn50f7C1yat
	 Kl5hMVdu4kXvgesUhxebkvb/oOudYsbAKXyirkpGD3xB/LvTXAtTlhB/h40wU7a9WI
	 X+6tPt1WSw58XL3OkDSeUjRPC3OEETL51n26pr7wfG3C7UJmYklBJjZHN6oNtzMzrG
	 H1pgP6Xi9fu0w==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-536cb25982eso387424287b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 13:00:58 -0800 (PST)
X-Gm-Message-State: AO0yUKVshEGWOqKx+4Y72X/F7D3dQwqyhfK1IKt5hl5KmtM0+ZsuJOH8
	FHsWNPZS4zBDwjAeT5orAIS83fRutylye2AAaA==
X-Google-Smtp-Source: AK7set/B7w4SIUVUY+fuTrfn39/aDxu+LSL+nDi5aDHHQnm81UFIS2ScAXvxaj+SUvgnwt845OQ2PIVb1st0BjISJs0=
X-Received: by 2002:a05:6102:3ca9:b0:41e:bccf:5669 with SMTP id
 c41-20020a0561023ca900b0041ebccf5669mr6637793vsv.2.1677704437053; Wed, 01 Mar
 2023 13:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20230301185209.274134-1-jjhiblot@traphandler.com> <20230301185209.274134-4-jjhiblot@traphandler.com>
In-Reply-To: <20230301185209.274134-4-jjhiblot@traphandler.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 1 Mar 2023 15:00:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJvYnBtaOwaRbNo5Eqp51yxhJpnSYQWEGfKjtZKjm7R4g@mail.gmail.com>
Message-ID: <CAL_JsqJvYnBtaOwaRbNo5Eqp51yxhJpnSYQWEGfKjtZKjm7R4g@mail.gmail.com>
Subject: Re: [PATCH 3/3] of: irq: release the node after looking up for "interrupts-extended"
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
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
Cc: Nishanth Menon <nm@ti.com>, zajec5@gmail.com, Geert Uytterhoeven <geert+renesas@glider.be>, linux-pci@vger.kernel.org, ssantosh@kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, saravanak@google.com, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, jonathanh@nvidia.com, Chen-Yu Tsai <wens@csie.org>, clement.leger@bootlin.com, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, mathias.nyman@intel.com, Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.o
 rg, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-renesas-soc@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, afaerber@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 1, 2023 at 12:53=E2=80=AFPM Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
>
> When of_parse_phandle_with_args() succeeds, a get() is performed on
> out_irq->np. And another get() is performed in of_irq_parse_raw(),
> resulting in the refcount being incremented twice.
> Fixing this by calling put() after of_irq_parse_raw().

This looks like a band-aid to me. It only makes sense that the caller
of of_irq_parse_raw() already holds a ref to out_irq->np. So the first
of_node_get() in it looks wrong. It looks like the refcounting was
originally balanced, but commit 2f53a713c4b6 ("of/irq: Fix device_node
refcount in of_irq_parse_raw()") dropped the put on exit after 'got
it!'. I'm not sure if just adding it back would be correct or not
though.

All this needs some test cases to be sure we get things right...

Rob
