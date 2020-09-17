Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3D26DD49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:57:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsdp12rdWzDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Vwu5yG/t; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsdjg2RvtzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:53:59 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3C3121582;
 Thu, 17 Sep 2020 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600350836;
 bh=567iHiAWyDp59eFqXBlSZ8neDwsGf0EzI2aQ/7XzLV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vwu5yG/tAflmeRVU4EIqOy+F2BFwqoi+8IEq1XlAtXHvXk9xEtf7dXFo9/LZWJchF
 xMhgpAfJSsBKYS5wtYDAimNipKBseUZ6JJMiOEqfg2CqHVyRTQf4g/M6dgyFKO1kzG
 lvHDP5TiMBV5wGMsMxb9/j98aew4DjSjNuinmLzQ=
Date: Thu, 17 Sep 2020 14:53:06 +0100
From: Mark Brown <broonie@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Message-ID: <20200917135306.GF4755@sirena.org.uk>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline
In-Reply-To: <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
X-Cookie: If you fail to plan, plan to fail.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2020 at 12:17:55PM +0300, Viorel Suman (OSS) wrote:

This looks mostly good, a few smallish things below but nothing major.

> +static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
> +{
> +	struct device *dev = &xcvr->pdev->dev;
> +	const struct firmware *fw;
> +	int ret = 0, rem, off, out, page = 0, size = FSL_XCVR_REG_OFFSET;
> +	u32 mask, val;
> +
> +	ret = request_firmware(&fw, xcvr->fw_name, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to request firmware.\n");
> +		return ret;
> +	}
> +
> +	rem = fw->size;

It would be good to see some explicit validation of the image size, at
least printing an error message if the image is bigger than can be
loaded.  The code should be safe in that it won't overflow the device
region it's writing to but it feels like it'd be better to tell people
if we spot a problem rather than just silently truncating the file.

> +	/* RAM is 20KiB => max 10 pages 2KiB each */
> +	for (page = 0; page < 10; page++) {
> +		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
> +					 FSL_XCVR_EXT_CTRL_PAGE_MASK,
> +					 FSL_XCVR_EXT_CTRL_PAGE(page));

regmap does have paging support, though given that this is currently the
only place where paging is used this probably doesn't matter too much.

> +static irqreturn_t irq0_isr(int irq, void *devid)
> +{
> +	struct fsl_xcvr *xcvr = (struct fsl_xcvr *)devid;
> +	struct device *dev = &xcvr->pdev->dev;
> +	struct regmap *regmap = xcvr->regmap;
> +	void __iomem *reg_ctrl, *reg_buff;
> +	u32 isr, val, i;
> +
> +	regmap_read(regmap, FSL_XCVR_EXT_ISR, &isr);
> +	regmap_write(regmap, FSL_XCVR_EXT_ISR_CLR, isr);

This will unconditionally clear any interrupts, even those we don't
understand - it might be better to only clear bits that are supported so
the IRQ core can complain if there's something unexpected showing up.

> +	if (isr & FSL_XCVR_IRQ_FIFO_UOFL_ERR)
> +		dev_dbg(dev, "RX/TX FIFO full/empty\n");

Should this be dev_err()?

> +static irqreturn_t irq1_isr(int irq, void *devid)
> +{
> +	struct fsl_xcvr *xcvr = (struct fsl_xcvr *)devid;
> +	struct device *dev = &xcvr->pdev->dev;
> +
> +	dev_dbg(dev, "irq[1]: %d\n", irq);
> +
> +	return IRQ_HANDLED;
> +}

Is there any value in even requesting this and irq2 given the lack of
meaningful handling?

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9jakEACgkQJNaLcl1U
h9AOQwf8C2EY+mr/CBR/vucNQj6SnLjTIsUA05x+jItQcyz0JDy2n4lqlPS8RD0b
IbnHx6/L4jBlMMq5IjtDQXLxNX6WeYW6LtMiuWqnWXsB58c9iXZik7MjpZHJ6YcD
rbPPo2PJzuSfo5lsq+AhbomjE1pA+D1svb08dBdNmHzFEtLfdAhf3gqWNGbDYym7
SDoSP88YDa4aX+ZPXx6lhmObJslBveq6Sh4Ue/cIFM82PH733ksR5CQlFTFNcWXm
63cnKl6dC5eq+aJATsV2rKGOQXosb1lVCLwl+nadXle+sUqGl/IR8Il3fGUVTWMR
pVSVqMvsDNIWAiBmP8CbHysZBj3k4A==
=5N/w
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
