Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 591318C8554
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 13:12:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HrkcH1zG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgknn63Zyz3cRy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:12:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HrkcH1zG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vgkn513Bdz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 21:11:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C6786198D;
	Fri, 17 May 2024 11:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C68C2BD11;
	Fri, 17 May 2024 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715944310;
	bh=NGy4y9LkeLC6kMLGudcaqdBbS5CppWV4B0ewLsdwhpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrkcH1zGc5nsdF095rPasSd0smJVrBFPzVO1GfGnDndEAQRzzcEtOccP0Lq+THwc4
	 pAwXQ3f+M6XWsJrDZNt1FvPIfrTYhdCz2SnBp87g4iKe0IaqCqMHvc/yhtKzdgGaJv
	 dLAUdfS/gP7P/6XMwMIK5GZ43Hj833J7d0dOXLHcvLJKhNfKwWtUm/RnK70V89+VUu
	 AKcflMk2YxuK7b1Ya1coPH208ZfKUOWyTC39jgyRK1kZ/ASRPGRlTuL0lnElYvRFcD
	 VX4z/sJPHRJZ4c5hebs5Lf/i0NjNi4TSVrQuPXXHKTI5HQ+wADouLeFLthJoRCZaFs
	 N+LYX3g6JdEBg==
Date: Fri, 17 May 2024 12:11:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3ZQHG5Itc4786pl"
Content-Disposition: inline
In-Reply-To: <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Function reject.
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
Cc: devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, shengjiu wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--u3ZQHG5Itc4786pl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2024 at 05:05:41AM -0400, Elinor Montmasson wrote:
> From: "Mark Brown" <broonie@kernel.org>

> > This description (and the code) don't feel like they're actually generic
> > - they're clearly specific to the bidrectional S/PDIF case.  I'd expect
> > something called -generic to cope with single CODECs as well as double,
> > and not to have any constraints on what those are.

> I proposed, in an reply of the v3 patch series to Krzysztof Kozlowski,
> the compatible "fsl,imx-audio-no-codec" instead of "generic".
> Krzysztof thought it was too generic, but it would convey more clearly
> that it is for cases without codec driver.
> Would this other compatible string be more appropriate ?

No.  There is very clearly a CODEC here, it physically exists, we can
point at it on the board and it has a software representation.  Your
code is also very specific to the two CODEC case.

--u3ZQHG5Itc4786pl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHO24ACgkQJNaLcl1U
h9AA9Af/dEW1/sXD0drucKnj3m5nf/uGf/YhJyyfJ/1JSqxnRA/VSoHYc1D6ZDLc
CYKJEQc19aWqb2hDm2/NebWPZ2nAgbG64R6Mn+Ue1pJ025SpxFd+SD2G9nzkzh2r
rhP5qrycZhKjkaMvsYxOQCgUZMDup6yEwckX93anIVYxBuz6o1Vx2H4tJkbXIU74
Q7wz5GIp6xMQNpX7RoCw/wE7IEe2TOmjGl5bPg9kM+V8uqYq/cZIZOnHMXicXoTa
jRDfO6DaG6nJ/23U8LJW9Ja6BJ+rHeeBtCDVZvcQUff+s/p7D+LzYeghTFOO1xQW
kN7EAVsua19NtkhnbL1ZsBqhr6EznA==
=AwEF
-----END PGP SIGNATURE-----

--u3ZQHG5Itc4786pl--
