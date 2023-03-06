Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE76AC8BF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 17:52:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVl434wRqz3chK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 03:52:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEhbI14s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEhbI14s;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVl355fcsz3bjk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 03:51:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30218B80FD4;
	Mon,  6 Mar 2023 16:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CECC433D2;
	Mon,  6 Mar 2023 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678121483;
	bh=GVS/y+MCIowLXLF6a4iduBGUyMME07hIbPy+mGY4qhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEhbI14sE/tmSa23Y3HRKEw+FlapnlHMP0Tr/ds6t8hQR+rt2bjg2JIDC4nBZTY9u
	 bnEse0o2RRMYYRkULM2NunUBvikQ6Cp1YcTMmp3FLkb9LYsCFL0Iol1bFVuqhhkKBK
	 271YX+cqrqRC9Y3sVWqozdrO+ToHQJ8ywi3uwmU4o95upEb/nny1xnO7l7NMGJhH2q
	 JmV12lo2yub9TFNMTE9fbx38iCzwvYi3Yr4ui29g3RKukkxRxpfufP6ndbxsu1V6nl
	 x/+YfDb2x0ZrRs03CNeTObRowG1rZ5BqVn5XjB9AXZYLeth/x2udMaBeyE2zJ/un8O
	 Dxak+Th/MwLoQ==
Date: Mon, 6 Mar 2023 16:51:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 00/10] Add the PowerQUICC audio support using the QMC
Message-ID: <824314e0-b459-498b-9a7c-7dd4c94900aa@sirena.org.uk>
References: <20230306161754.89146-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O5OaE2O/CRe4hVyU"
Content-Disposition: inline
In-Reply-To: <20230306161754.89146-1-herve.codina@bootlin.com>
X-Cookie: teamwork, n.:
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--O5OaE2O/CRe4hVyU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 05:17:44PM +0100, Herve Codina wrote:
> Hi,
>=20
> This series adds support for audio using the QMC controller available in
> some Freescale PowerQUICC SoCs.
>=20
> This series contains three parts in order to show the different blocks
> hierarchy and their usage in this support.

I already applied this series, please send incremental patches with any
changes.

--O5OaE2O/CRe4hVyU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQGGgIACgkQJNaLcl1U
h9D0Wwf/T+XbDDJ+a7hIsyWhV5O7eQGUIMp42yn1EGIJovbiv+GGxdWWJH9rKyON
muUMiRiUb1jwUtkZdtfqSLXj/jL5+2UTEEVUGOpp1MANtVFxkay56wtwpLOwXB9d
JSJrgbGOnkejnZzEBo8vFwotGy5ZayuYSbPAY3tbkZoAa7Qwy93eGXPxlhVmoOXj
lO84zg5BNwrtvmwc/FaeLwx6isoBXtGA+qg1+4uZ8L4c2mFVohVdNd4b7H0pqkP+
WKVUA/m4UfJErspOWi7hWL1MHNOfBVzF6TQ5hvNhJCjU1avbk9TGDYrMDC8RCLr1
2bNd1WOHiiLR0lfBX5wiro998wpLTA==
=vRUD
-----END PGP SIGNATURE-----

--O5OaE2O/CRe4hVyU--
