Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DE756AE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 19:44:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n7SnaOlv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4Twg5XGnz2ykd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 03:44:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n7SnaOlv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Tvm6TVhz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 03:43:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 593346112B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20C6C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689615808;
	bh=WlylA38NBSrHdK1P/Qx5cdKzB17My2bbP8A4hWmtbl8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n7SnaOlv0rod0BWi8qRhWwzkH130UCwC9DHtIw6e2ARgCRj2IFBirKNyBLBLD18Yf
	 vXH3oQn0uzwral2KqRsugsmfcq43bioga3LdDP242wOgqAvOzDv/tfRoD+qiti1AHT
	 2yrewtx7wMwtKLppRJC1XCOOLcU0cNDb47qwrTcbAG8f/k0yJMVEi6oCt5t9o8zJP4
	 Jf39NnUNGUe4AEK7PJCokBqfHG9OIsaTS7AAn7T24r/0o712dI8HVd4Rn6hHoTqt08
	 yiNTxnUo0bpbItLwUcygPd1ISb1BnMapv2fDf1tcc7GIK7DGnVJYJLO8Cx+bnlZ4qo
	 V9NB1b/cag++Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so6440903a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 10:43:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLYrvb3VtsA+/oiu8BH7xpaC4P/Ew77xdbd1xSrfaCD2yV8MbQ7h
	EnXPEQo+XnFWo6ulbJIzsCxdoRO0iBsfLBaqng==
X-Google-Smtp-Source: APBJJlGV73zzxjpVsO/f3440v/5dveoUtTcIX0eLkgnTaVgBrap1rMmgbikswqUTIe4Df1/8A6Rrn+UvYZaRh77UJxY=
X-Received: by 2002:a2e:9c91:0:b0:2b7:4169:fcf5 with SMTP id
 x17-20020a2e9c91000000b002b74169fcf5mr11677042lji.37.1689615786908; Mon, 17
 Jul 2023 10:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175027.4065135-1-robh@kernel.org>
In-Reply-To: <20230714175027.4065135-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 11:42:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLxL2Mpsi=idA0KkDWNhCZfP3Nw4c79d5CfkjVWnUsqyg@mail.gmail.com>
Message-ID: <CAL_JsqLxL2Mpsi=idA0KkDWNhCZfP3Nw4c79d5CfkjVWnUsqyg@mail.gmail.com>
Subject: Re: [PATCH] usb: Explicitly include correct DT includes
To: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Li Yang <leoyang.li@nxp.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Herve Codina <herve.codina@bootlin.com>, Michal Simek <michal.simek@amd.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Richard Leitner <richard.leitner@linux.dev>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 14, 2023 at 11:50=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-=
dr-of.c
> index a9877f2569f4..2574bccc151b 100644
> --- a/drivers/usb/host/fsl-mph-dr-of.c
> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> @@ -10,10 +10,12 @@
>  #include <linux/fsl_devices.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/clk.h>
>  #include <linux/module.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/of.h>

Double include of of.h here. v2 coming.

Rob
