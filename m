Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EFF76E6D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 13:28:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oG0KahOF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGmn03zG1z3cN4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 21:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oG0KahOF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGmm70W9Tz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 21:27:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E1FA61D60;
	Thu,  3 Aug 2023 11:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32ACC433C7;
	Thu,  3 Aug 2023 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691062051;
	bh=94uq0Bo3QnKTETsWRpHX00Zq/UK65SuO7RrYYlFqiPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oG0KahOFGElnYYGp4HYhmQgvg12UxbdCUyxny5SFkjCOEMA5i4Q2UPxt18674wuma
	 Jn8edrfpdKCWlbkX9s6h9Xw0tjVvFCatrcxiOv4ML9SNYiu21qT50URueafImaLgxx
	 YSBZvgGLjfHjyEoK1+2pEP8T+k4Gr27Dk1XFZUO+t+6a5LzuG/SGcWQfW46koHrjQR
	 IdPRrMxlk63w/H541M7W6UFDa+p5zVbXoUmgRIK5vdfuaW4i/PLVd7KhSVDaacjovF
	 ZaE4IorHLntzzTN4qdqb0oyR+cqgz0GnKZ04Ymcdr7DlVE0M92+M1NMJum6uXPdF4l
	 D3aJbsziWhgiA==
Date: Thu, 3 Aug 2023 12:27:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 RESEND*3] ASoC: fsl MPC52xx drivers require
 PPC_BESTCOMM
Message-ID: <9581313f-5340-455d-a75d-dc27d2eb3ec0@sirena.org.uk>
References: <20230803025941.24157-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JtDrcl5vLUX5Kj+l"
Content-Disposition: inline
In-Reply-To: <20230803025941.24157-1-rdunlap@infradead.org>
X-Cookie: One Bell System - it works.
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--JtDrcl5vLUX5Kj+l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 02, 2023 at 07:59:41PM -0700, Randy Dunlap wrote:
> Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
> SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
> so the 2 former symbols should also depend on PPC_BESTCOMM since
> "select" does not follow any dependency chains.

Take a hint, it's not clear that the patch is tasteful.

--JtDrcl5vLUX5Kj+l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTLjx0ACgkQJNaLcl1U
h9APBwf/Xlz8zi+ScLXchSdGVzlpBaygqFFBp+EYQnQuF+pLp1RgI0dzC3kNdV/b
UiYqKfemmWpNm+E/hBv2DgcPPGbB6d1iQQqpTeuymxO4Gloe06zD6Xwa34VJWB7y
lz8fB2dSwxMLTxBCRKo7zQ+ZvOCVHDBZ6TXUFjMtPNM16Mn6P/IurMUh1GT63csu
ssICm8IKAyCnvZqfjYn2SsfwXKzs2M8h6aVsbSCD2WPjJfHBHrE3SN2jIWhHjkPJ
fXZUi2MGJmGHiUD/rPOjHgFfJX1WCmaABpYQVfoZXsPF/Fk015SNCH2AR+8PU1NF
dT/TaWGwdHn4vBWSFTpsk/0yHjL2KQ==
=Baba
-----END PGP SIGNATURE-----

--JtDrcl5vLUX5Kj+l--
