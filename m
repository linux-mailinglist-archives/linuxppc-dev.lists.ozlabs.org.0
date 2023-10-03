Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544707B69DC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 15:08:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gVPVFPEs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0J6D13lJz3vZW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 00:08:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gVPVFPEs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0J5J39qpz3cC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 00:07:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 41FF1B81A3F;
	Tue,  3 Oct 2023 13:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1115CC433C8;
	Tue,  3 Oct 2023 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696338447;
	bh=ArFpsG+rmsCSYEIB4kkM8QPGFJQJDJOHz7UBLDI+9zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVPVFPEs1/OCC8qjCciwFIU3setxljjE5Q0Nh12gpiXrCBm9YrwGGTLL2Sll2nnhE
	 xAMKRJ6B6fsIaABPHnnbZfVRbUrFGePnVkrdlppa8RyN1Z4gEMfLbKOjI5oywxUJBk
	 Cq5NltCK3+O6rDxH0Qpy0Uq9bln0sPMiJiPZnhxZS6po30gpPOzFnzsrxDa4O90TQL
	 zNm9yd8tHbjBhEOdayrG3eI3/Hz2QNqwcmgHbutDi8Yy2c9d7PDirN6x0uRw4BMT4b
	 b6hXS+0+aMwKD3xgJeEk33u1xRYcX7JUtwSp31Xa/b8I1bY9AYdRqUr/QcyxEIRmL5
	 +0NjjPeTuc8/g==
Date: Tue, 3 Oct 2023 15:07:24 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 3/3] PCI: Use PCI_HEADER_TYPE_* instead of literals
Message-ID: <ZRwSDNOlZwUu+vqE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	bcm-kernel-feedback-list@broadcom.com, jonathan.derrick@linux.dev,
	kw@linux.com, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
	lpieralisi@kernel.org, marek.vasut+renesas@gmail.com,
	minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	m.karthikeyan@mobiveil.co.in, nirmal.patel@linux.intel.com,
	rjui@broadcom.com, robh@kernel.org, roy.zang@nxp.com,
	sbranden@broadcom.com, yoshihiro.shimoda.uh@renesas.com,
	Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org
References: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
 <20231003125300.5541-4-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8/zJ+jH2FaDITq/3"
Content-Disposition: inline
In-Reply-To: <20231003125300.5541-4-ilpo.jarvinen@linux.intel.com>
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
Cc: kw@linux.com, sbranden@broadcom.com, m.karthikeyan@mobiveil.co.in, robh@kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Zhiqiang.Hou@nxp.com, nirmal.patel@linux.intel.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, minghuan.Lian@nxp.com, bcm-kernel-feedback-list@broadcom.com, mingkai.hu@nxp.com, jonathan.derrick@linux.dev, rjui@broadcom.com, Bjorn Helgaas <bhelgaas@google.com>, roy.zang@nxp.com, linuxppc-dev@lists.ozlabs.org, yoshihiro.shimoda.uh@renesas.com, linux-arm-kernel@lists.infradead.org, marek.vasut+renesas@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--8/zJ+jH2FaDITq/3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2023 at 03:53:00PM +0300, Ilpo J=C3=A4rvinen wrote:
> Replace literals under drivers/pci/ with PCI_HEADER_TYPE_MASK,
> PCI_HEADER_TYPE_NORMAL, and PCI_HEADER_TYPE_MFD.
>=20
> While at it, replace !! boolean conversion with FIELD_GET().
>=20
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for Renesas =
R-Car


--8/zJ+jH2FaDITq/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUcEgwACgkQFA3kzBSg
KbbwZQ/+OWN+pr0W3mgNuEkqIJy1gENxgZSQwTuDfc50jkQ+QvaDabXZyduk5uDf
QDqFHQCwuodVcB2FkK+WUddSmLHChpSSX4imzxhhd21YAAd2mZMwKxvW1T0theCe
ZdRnxE1S0H/B4OsULDMppn+3DZVW2aGre32u7lq7hIpmj2dRbpH4TBbTLchXoMQY
RCOUJ0baTYSXiDjgbmq+urT98IqO4gMxuEmzuoICqZCsb1gFUOz+aM3Jfxc/9BJw
su9LoOCg/Ud447vnOkzs6BlkBgocWXFJPb/dIPPiaMkDIPyxrljWU9S8MVpcC2/7
Fhd0phffcjTn1W0cSRwTJPpS9fagWYduMrLjFimhR1a9ERmTzzI8QAOH5/Dk9zoO
b4AQ4dysH08lHur+o+tMnlhtGS3xbcvymorR4uqA35gzCTVDSdNbnmIi+K/WutuR
8N1DsSwyvMpwAMLvoFeQZGY2zNAP83/CGbITi6Gj3RUmEMP9jCkEl1r+YKOC5bjQ
rkv1pRvPgG/am6hzVx3RyIdOUddcKCsgQt+3nBfby6HG+PbuxxKtrthxXUHmunDX
p/zlkUzjNKryvwL09lzLs3Ys13EBazLZAbPWN0lZYuekcbKrL//m0N7qvNmLo8oy
ZcMD9javfLimKe1u3MffJ7RMnEjwcPViS/7Ym54dm5YjNmLMTrI=
=KypN
-----END PGP SIGNATURE-----

--8/zJ+jH2FaDITq/3--
