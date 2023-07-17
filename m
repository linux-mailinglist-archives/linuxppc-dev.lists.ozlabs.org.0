Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC27566B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 16:46:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DXcRR896;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4PzL1Qkkz2ypq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 00:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DXcRR896;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4PyP68B0z2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 00:45:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 724A7610AB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 14:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B2EC433CC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689605129;
	bh=6Lh/okJ/tlTuqTU1b/j/uErvTDrdoSJQUHuVEAFETts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DXcRR896EnZnRLJNO/6oE3vS17JskNmeBySR1a8GBnSZMpK8R09u2GHreDf2c0Dzo
	 JLenvfB83kOgsDGMpX/l4sKSoMCJTkDOcZ1AMcrisUwBT45Hqkbl+XlzoIQD7J44xp
	 BYFUcjgFWWPES+2nt7thJ9TOtx9ok3veYqLmGXwpUvNrkKD9uUi4kuNmjRjO8kvSv/
	 Q22oXxhN3DW4SMHsd2yGH263wD6ee7T8xcq/guGZp7OF4Df7SJdXBFCdPf5RkCCV/3
	 AAiKiz+alTYz/OnLZ5fgffEXHxAlU+vg0JkRSCtx7kTfPpi4mi5LtNw9VoqrLwYgPv
	 lh5ICjbnogAkg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b741cf99f8so68511181fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 07:45:29 -0700 (PDT)
X-Gm-Message-State: ABy/qLZ878DX+1kLtUtVJMezdvbwmkYzJi+fJ8wLrxBuNDKDllPlqsGb
	e3c00YlOQmj5/+KdyPn1XECP1lPY2SaD2V8XTA==
X-Google-Smtp-Source: APBJJlFFXYcLka0U2O/B1evPE/8dIeXS+VuPwNFdjWy1LSj2t3dI5YnbEtEP8rRsNBtPkvMxm/lDG3mrsq/u8ZWdw1Y=
X-Received: by 2002:a2e:9d84:0:b0:2b6:e76b:1e50 with SMTP id
 c4-20020a2e9d84000000b002b6e76b1e50mr9074981ljj.41.1689605127886; Mon, 17 Jul
 2023 07:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230615164113.2270698-1-Frank.Li@nxp.com> <20230615164113.2270698-2-Frank.Li@nxp.com>
In-Reply-To: <20230615164113.2270698-2-Frank.Li@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 08:45:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7o5ipaBkNRECkWZPZDTB1kSFrUV3YjKL6xj02f0x2Sw@mail.gmail.com>
Message-ID: <CAL_JsqL7o5ipaBkNRECkWZPZDTB1kSFrUV3YjKL6xj02f0x2Sw@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: layerscape: Add the workaround for lost link
 capablities during reset
To: Frank Li <Frank.Li@nxp.com>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Roy Zang <roy.zang@nxp.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, mani@kernel.org, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 15, 2023 at 10:41=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>
> A workaround for the issue where the PCI Express Endpoint (EP) controller
> loses the values of the Maximum Link Width and Supported Link Speed from
> the Link Capabilities Register, which initially configured by the Reset
> Configuration Word (RCW) during a link-down or hot reset event.

What makes this Layerscape specific? Seems like something internal to DWC.

>
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci=
/controller/dwc/pci-layerscape-ep.c
> index 4e4fdd1dfea7..2ef02d827eeb 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -45,6 +45,7 @@ struct ls_pcie_ep {
>         struct pci_epc_features         *ls_epc;
>         const struct ls_pcie_ep_drvdata *drvdata;
>         int                             irq;
> +       u32                             lnkcap;
>         bool                            big_endian;
>  };
>
> @@ -73,6 +74,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, vo=
id *dev_id)
>         struct ls_pcie_ep *pcie =3D dev_id;
>         struct dw_pcie *pci =3D pcie->pci;
>         u32 val, cfg;
> +       u8 offset;
>
>         val =3D ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
>         ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> @@ -81,6 +83,13 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, v=
oid *dev_id)
>                 return IRQ_NONE;
>
>         if (val & PEX_PF0_PME_MES_DR_LUD) {
> +
> +               offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +               dw_pcie_dbi_ro_wr_en(pci);
> +               dw_pcie_writew_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->ln=
kcap);
> +               dw_pcie_dbi_ro_wr_dis(pci);
> +
>                 cfg =3D ls_lut_readl(pcie, PEX_PF0_CONFIG);
>                 cfg |=3D PEX_PF0_CFG_READY;
>                 ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
> @@ -216,6 +225,7 @@ static int __init ls_pcie_ep_probe(struct platform_de=
vice *pdev)
>         struct ls_pcie_ep *pcie;
>         struct pci_epc_features *ls_epc;
>         struct resource *dbi_base;
> +       u8 offset;
>         int ret;
>
>         pcie =3D devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -252,6 +262,9 @@ static int __init ls_pcie_ep_probe(struct platform_de=
vice *pdev)
>
>         platform_set_drvdata(pdev, pcie);
>
> +       offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +       pcie->lnkcap =3D dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +
>         ret =3D dw_pcie_ep_init(&pci->ep);
>         if (ret)
>                 return ret;
> --
> 2.34.1
>
