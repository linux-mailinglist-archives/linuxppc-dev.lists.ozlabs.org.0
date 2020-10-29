Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E8F29F793
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:14:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMfr90lCvzDqc3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 09:14:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jingoohan1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cuMYLOx1; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMfp13DW1zDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:12:54 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id x13so3531555pfa.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 15:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=LexN8YVXygah8E+BhRyOEnkuxN6ep+Yup593pkObYw0=;
 b=cuMYLOx136WyJxq/7rZTQMZ+CQTkOmHSXN49/NLmy5j3i4yCygiwgKLN3zACvyrEKD
 omjShSmKopC5d0CVh/shylgeqTg1Tgfq0vnAwMf49dD8ZuW/fICNIAMJqbNUsCONLE10
 YymsqlyM1dLRcFekczm9wCxc/iT5uAqN5LQR8GF/H9UBP3EnP7uc/VqUHlUwxCqt7t3S
 g38Gkfwc9Wq1FRuttfxtXJ5jCZCmcurSoYrnN6bGYMrORlQltsMr6VoqHqI1YKITxqkG
 BsCKl8kcc2UyZbgn81v2whufq4HZ87lF6xrsbnTySURCSJC1blKFveb1R+KOSGrlyCkO
 Johg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=LexN8YVXygah8E+BhRyOEnkuxN6ep+Yup593pkObYw0=;
 b=nvjnvjOpPvoPYAttWdfkVAMfT3e4kFwSBoOu7BVdvFRBCjyzdRHD3XHXsjbEHhE8L7
 O8j0UQX4YVUFMAdzoUeOfuXx9XlSEC7iy/oyWEJBoVy7Jp72/+ZuYXEPgLLpbhH+f/Fi
 RBlIZB/8/crumljAo47UpS47LQlnbJSdlBgfsNZhqjlYggjk+9knMW4Qmgpqh2tc6ydP
 WI3Dz3JZ4ZQrMfjJU+uVVRHCYX+9HUoEooHwnY6ViE6l4CsGAj5wLWYhMmH8tPjUXPEo
 CjG0hDtiuskRfhcxRC7AgBzrSldBssRq6GqZUcUbGCwAgByLHlmMXn2F38uXp8DkeVYZ
 9F0Q==
X-Gm-Message-State: AOAM530mB0gNdT8XswZNzwn7t7iCpWUqlHM54atg+/TdFwZgKDqRO+oV
 xBSr0etrltf/qknluDhoIuc=
X-Google-Smtp-Source: ABdhPJy0Ttsg8HNWGwX6Kp9sWCdg1yCF7JN7GB9BQAAWDnhcJBBXT+RwpK391AYg+TINn+AdKcRV2w==
X-Received: by 2002:a63:f446:: with SMTP id p6mr2917548pgk.67.1604009568803;
 Thu, 29 Oct 2020 15:12:48 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 b7sm4100754pfr.171.2020.10.29.15.12.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:12:47 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 05/13] PCI: dwc: Ensure all outbound ATU windows are reset
Thread-Topic: [PATCH 05/13] PCI: dwc: Ensure all outbound ATU windows are reset
Thread-Index: AQHWrWuC4GikzhqGKUGSkw9tkhUTo6mvJla0
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:12:36 +0000
Message-ID: <SL2P216MB0475A290104BEB83332A89B5AA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-6-robh@kernel.org>
In-Reply-To: <20201028204646.356535-6-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Yue Wang <yue.wang@Amlogic.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andy Gross <agross@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Han Jingoo <jingoohan1@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/28/20, 4:47 PM, Rob Herring wrote:
>=20
> The Layerscape driver clears the ATU registers which may have been
> configured by the bootloader. Any driver could have the same issue
> and doing it for all drivers doesn't hurt, so let's move it into the
> common DWC code.
>
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Roy Zang <roy.zang@nxp.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c       | 14 --------------
>  drivers/pci/controller/dwc/pcie-designware-host.c |  5 +++++
>  2 files changed, 5 insertions(+), 14 deletions(-)
>
>  diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/c=
ontroller/dwc/pci-layerscape.c
>  index f24f79a70d9a..53e56d54c482 100644
>  --- a/drivers/pci/controller/dwc/pci-layerscape.c
>  +++ b/drivers/pci/controller/dwc/pci-layerscape.c
>  @@ -83,14 +83,6 @@ static void ls_pcie_drop_msg_tlp(struct ls_pcie *pcie=
)
>   	iowrite32(val, pci->dbi_base + PCIE_STRFMR1);
>   }
> =20
>  -static void ls_pcie_disable_outbound_atus(struct ls_pcie *pcie)
>  -{
>  -	int i;
>  -
>  -	for (i =3D 0; i < PCIE_IATU_NUM; i++)
>  -		dw_pcie_disable_atu(pcie->pci, i, DW_PCIE_REGION_OUTBOUND);
>  -}
>  -
>   static int ls1021_pcie_link_up(struct dw_pcie *pci)
>   {
>   	u32 state;
>  @@ -136,12 +128,6 @@ static int ls_pcie_host_init(struct pcie_port *pp)
>   	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
>   	struct ls_pcie *pcie =3D to_ls_pcie(pci);
> =20
>  -	/*
>  -	 * Disable outbound windows configured by the bootloader to avoid
>  -	 * one transaction hitting multiple outbound windows.
>  -	 * dw_pcie_setup_rc() will reconfigure the outbound windows.
>  -	 */
>  -	ls_pcie_disable_outbound_atus(pcie);
>   	ls_pcie_fix_error_response(pcie);
> =20
>   	dw_pcie_dbi_ro_wr_en(pci);
>  diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers=
/pci/controller/dwc/pcie-designware-host.c
>  index cde45b2076ee..265a48f1a0ae 100644
>  --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>  +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>  @@ -534,6 +534,7 @@ static struct pci_ops dw_pcie_ops =3D {
> =20
>   void dw_pcie_setup_rc(struct pcie_port *pp)
>   {
>  +	int i;
>   	u32 val, ctrl, num_ctrls;
>   	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> =20
>  @@ -583,6 +584,10 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>   		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
>   	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
> =20
>  +	/* Ensure all outbound windows are disabled so there are multiple matc=
hes */
>  +	for (i =3D 0; i < pci->num_viewport; i++)
>  +		dw_pcie_disable_atu(pci, i, DW_PCIE_REGION_OUTBOUND);
>  +
>   	/*
>   	 * If the platform provides its own child bus config accesses, it mean=
s
>   	 * the platform uses its own address translation component rather than
>  --=20
>  2.25.1

