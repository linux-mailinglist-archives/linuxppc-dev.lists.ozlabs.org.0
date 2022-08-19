Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E385993E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 06:10:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M87YC1XQbz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 14:09:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256 header.s=201811 header.b=eGyUjSp0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M87Xb1mxVz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 14:08:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256 header.s=201811 header.b=eGyUjSp0;
	dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4M87XY18pXz4x1N;
	Fri, 19 Aug 2022 14:08:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuling.org;
	s=201811; t=1660882109;
	bh=xn+KHPfNNt7ohaMqRLYEralYGtjGFaBZirtDYdZh+6U=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=eGyUjSp0D7sAvhtOU0ecCdT2HYAN5ycCEwXOI3xag/aistckAgLrmeyVbgrRms2RF
	 BNel/T+iY8qgGGfh0BPtDTRKpvFcTqk5h7RhEq+/XIgyZfRck9K/5wGumwvsgn7VH+
	 jgy0AVqIRZNvPSHWhzmVeIBLG5e8uaIFJln5WBehvXzsG9+gZhN/MfDWvdmyAUEsSq
	 6EVuZmzHEPjqxYZEDbxVWHycsoZBGjJAlPwjybJjYbz2Yzs4V5ex5hhVSsRAUmYOf2
	 N3BK8sNiLGag1JoZ2VhEDfXLTpbNuWDO4Je2Be0jbTojomo+dcHumOPDzsI+QVLVvO
	 uDNUasdb3zsMA==
Received: by neuling.org (Postfix, from userid 1000)
	id C40E02C03F9; Fri, 19 Aug 2022 14:08:28 +1000 (AEST)
Message-ID: <c6321af09cd3401b5c81e92ee83a28b66cf633cb.camel@neuling.org>
Subject: Re: [PATCH] powerpc/microwatt: Add LiteX MMC driver
From: Michael Neuling <mikey@neuling.org>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 19 Aug 2022 14:08:28 +1000
In-Reply-To: <20220804015708.5928-1-joel@jms.id.au>
References: <20220804015708.5928-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-08-04 at 11:27 +0930, Joel Stanley wrote:
> Enable the LiteX MMC device and it's dependency the common clock
> framework.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Michael Neuling <mikey@neuling.org>

> ---
> =C2=A0arch/powerpc/configs/microwatt_defconfig | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/arch/powerpc/configs/microwatt_defconfig
> b/arch/powerpc/configs/microwatt_defconfig
> index eff933ebbb9e..ea2dbd778aad 100644
> --- a/arch/powerpc/configs/microwatt_defconfig
> +++ b/arch/powerpc/configs/microwatt_defconfig
> @@ -75,7 +75,12 @@ CONFIG_SPI_BITBANG=3Dy
> =C2=A0CONFIG_SPI_SPIDEV=3Dy
> =C2=A0# CONFIG_HWMON is not set
> =C2=A0# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=3Dy
> +# CONFIG_PWRSEQ_EMMC is not set
> +# CONFIG_PWRSEQ_SIMPLE is not set
> +CONFIG_MMC_LITEX=3Dy
> =C2=A0# CONFIG_VIRTIO_MENU is not set
> +CONFIG_COMMON_CLK=3Dy
> =C2=A0# CONFIG_IOMMU_SUPPORT is not set
> =C2=A0# CONFIG_NVMEM is not set
> =C2=A0CONFIG_EXT4_FS=3Dy

