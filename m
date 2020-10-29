Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D90E529EC70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 14:05:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMQfV5CjMzDqD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:05:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=vRbJgsWw; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMQZ66nzlzDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 00:01:50 +1100 (AEDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EE8620720
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603976508;
 bh=OzIlRpXLdeGRcoA/MVFEQyHps4XuaG+UwlBrggFdE0A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vRbJgsWwtJ15XvouUgWp8lxFF9YEzz6sV39n8cr3LYXfuecObHTezLMamQSxer1Da
 zkYNr2fh0i0HxfH2ob7AS9aynsisAGunWZFHpffa0g+pBXnuWXijWCgE1UNZUyc+lq
 uoQ9II+lG7PtxjFrxXQpqGdKqRBmECQ0O3fH4UCY=
Received: by mail-ot1-f51.google.com with SMTP id o14so2146731otj.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 06:01:48 -0700 (PDT)
X-Gm-Message-State: AOAM533tca45AI54IJqgLxZye0PRzlp/hIyoapRB1DnC5A6wx2aGatWp
 1LgQCxQpNFVE909qtS3jQBpj2oYS0b9r/ccDQQ==
X-Google-Smtp-Source: ABdhPJy/bhS7KTF1WNqgQUUalxQA1GfpAd7FTQIi3yYFWyIBt0GxzCWPuCwRMAMfnaaUFyZdFb4NCZ8rTg453LUEqGQ=
X-Received: by 2002:a9d:62d1:: with SMTP id z17mr3193317otk.192.1603976506229; 
 Thu, 29 Oct 2020 06:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-2-robh@kernel.org>
 <87h7qdx4oz.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h7qdx4oz.fsf@mpe.ellerman.id.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 29 Oct 2020 08:01:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJWzmGNifrJEKGg582kZNtjnWHaUkG0EinWqjhGaeL1dg@mail.gmail.com>
Message-ID: <CAL_JsqJWzmGNifrJEKGg582kZNtjnWHaUkG0EinWqjhGaeL1dg@mail.gmail.com>
Subject: Re: [PATCH 01/13] PCI: dwc/imx6: Drop setting PCI_MSI_FLAGS_ENABLE
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, PCI <linux-pci@vger.kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-arm-kernel@axis.com, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Yue Wang <yue.wang@amlogic.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Murali Karicheri <m-karicheri2@ti.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 7:21 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Rob Herring <robh@kernel.org> writes:
> > No other host driver sets the PCI_MSI_FLAGS_ENABLE bit, so it must not
> > be necessary. If it is, a comment is needed.
>
> Yeah, but git blame directly points to:
>
>   75cb8d20c112 ("PCI: imx: Enable MSI from downstream components")

I think I did read this at some point and then forgot about it when I
made the change later...

> Which has a pretty long explanation. The relevant bit probably being:
>
>   ... on i.MX6, the MSI Enable bit controls delivery of MSI interrupts
>   from components below the Root Port.

The thing is that all seems not i.MX6 specific but DWC specific given
MSI handling is contained within the DWC block. So I don't see how
this could be an integration difference.

So maybe everyone else is still just setting CONFIG_PCIEPORTBUS
typically and haven't noticed? Is it correct for the host driver to
set MSI enable?

Rob
