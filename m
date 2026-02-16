Return-Path: <linuxppc-dev+bounces-16888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGYQNAuVk2n76gEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 23:07:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8DC147D9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 23:07:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFH1g31vKz2xm3;
	Tue, 17 Feb 2026 09:07:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771279623;
	cv=none; b=bepy0FjT4C/nk+DFDyIi9V2hxEq0STpkgqlfIv+8ytpzPe5kEGVr9aFOjYnUD3rmQsC6zfxJOH41VBg3RsTxXwp+yHd22w1NtAigLC+lw/AQNqIWHwRuQ2dnnzoWL1PsXkjtgvlAAUhvZ3c4FpLD8xHgGG3rqXb5U5tGh8rPdywMxKrUmIhVWCHveVnfS78R8FiCklrN7fvYTLAelJPKUGUZbdBJG9o4MvPwsajvrec48abvQYK6d+BNEWXt1/XzScr76ztq02fZyKu+IZAg4c1I9PUuYK8ul8T0WK523dSMBKHtA3sp7yM4YqaQgRSx2vAvUOinWqd58kpm8cbSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771279623; c=relaxed/relaxed;
	bh=t8BYgHoDiUqLazySoLpLeVrihmYilevIB92jtHXcapg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+KNJTySbxEnW0Ajlrq/YYVXadQBAC4YLPmQfgq5G/3WpluDK9gVXZ7ZtNNZxOEifG76fC2LU7umePP476CElge8AGC4dhUQr+C9mgqBanPZA7qi/phInODt/dV5+A7UDIhVKVYj+UFpXWAV762hXYgvcZA0y+cjxLIAgK6+811EfUP5aePZQQwtL+AnSqUSgtfHrDukqRZOrtoECU2kWunWROJ0/OiWL9fLRc90A5zkM+clawDzXPjiOiLii3g0tepnnF8kxh1f/r2E4viGTmNiNqQQHbgfyGecLWJwG+I241KOZ9inbKZKA5ZPMR7uMEHCmJARC0+741kascy7CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1012 seconds by postgrey-1.37 at boromir; Tue, 17 Feb 2026 09:07:01 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFH1d4LZZz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 09:07:01 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vs6TQ-00034A-LG; Mon, 16 Feb 2026 22:49:44 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vs6TO-0018BD-0n;
	Mon, 16 Feb 2026 22:49:43 +0100
Received: from pengutronix.de (p54b15bf8.dip0.t-ipconnect.de [84.177.91.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4494D4EA95C;
	Mon, 16 Feb 2026 21:49:43 +0000 (UTC)
Date: Mon, 16 Feb 2026 22:49:42 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] PCI: layerscape: Allow to compile as module
Message-ID: <20260216-mahogany-caterpillar-of-certainty-38b0bc-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="acibql3y7ovkmvyd"
Content-Disposition: inline
In-Reply-To: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.61 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-16888-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER(0.00)[mkl@pengutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:s.trumtrar@pengutronix.de,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jingoohan1@gmail.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:s.hauer@pengutronix.de,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,nxp.com,gmail.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,pengutronix.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkl@pengutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[freescale.com:email]
X-Rspamd-Queue-Id: 2D8DC147D9F
X-Rspamd-Action: no action


--acibql3y7ovkmvyd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] PCI: layerscape: Allow to compile as module
MIME-Version: 1.0

Hello,

Bjorn can you take this patch?

On 12.01.2026 20:17:11, Steffen Trumtrar wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
>
> The layerscape pcie host controller could also be compiled as module.
> Add the necessary infrastructure to allow building as module instead of
> only as builtin driver.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/pci/controller/dwc/Kconfig          |  2 +-
>  drivers/pci/controller/dwc/pci-layerscape.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/=
dwc/Kconfig
> index 519b59422b479..abfa4a6e62c25 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -121,7 +121,7 @@ config PCI_IMX6_EP
>  	  DesignWare core functions to implement the driver.
>
>  config PCI_LAYERSCAPE
> -	bool "Freescale Layerscape PCIe controller (host mode)"
> +	tristate "Freescale Layerscape PCIe controller (host mode)"
>  	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
>  	depends on PCI_MSI
>  	select PCIE_DW_HOST
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/co=
ntroller/dwc/pci-layerscape.c
> index a44b5c256d6e2..14d6ac4fc53fd 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -13,6 +13,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
> +#include <linux/module.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_address.h>
> @@ -403,8 +404,16 @@ static const struct dev_pm_ops ls_pcie_pm_ops =3D {
>  	NOIRQ_SYSTEM_SLEEP_PM_OPS(ls_pcie_suspend_noirq, ls_pcie_resume_noirq)
>  };
>
> +static void ls_pcie_remove(struct platform_device *pdev)
> +{
> +	struct ls_pcie *pcie =3D platform_get_drvdata(pdev);
> +
> +	dw_pcie_host_deinit(&pcie->pci->pp);
> +}
> +
>  static struct platform_driver ls_pcie_driver =3D {
>  	.probe =3D ls_pcie_probe,
> +	.remove =3D ls_pcie_remove,
>  	.driver =3D {
>  		.name =3D "layerscape-pcie",
>  		.of_match_table =3D ls_pcie_of_match,
> @@ -412,4 +421,9 @@ static struct platform_driver ls_pcie_driver =3D {
>  		.pm =3D &ls_pcie_pm_ops,
>  	},
>  };
> -builtin_platform_driver(ls_pcie_driver);
> +module_platform_driver(ls_pcie_driver);
> +
> +MODULE_AUTHOR("Minghuan Lian <Minghuan.Lian@freescale.com>");
> +MODULE_DESCRIPTION("Layerscape PCIe host controller driver");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(of, ls_pcie_of_match);
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260112-v6-19-topic-layerscape-pcie-9d10b6542139
>
> Best regards,
> --
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
>
>

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--acibql3y7ovkmvyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaZOQ9AAKCRDMOmT6rpmt
0tf7AQDXPoIYzicQeUoeqqXVPMOTQI08mSHXaelfkvE716R56wD/VkqipmoUM5T7
7U7qJt9nMZfyJSOd/p5RdeiJ92XG2AI=
=hliI
-----END PGP SIGNATURE-----

--acibql3y7ovkmvyd--

