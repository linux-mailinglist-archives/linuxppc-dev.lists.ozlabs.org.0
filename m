Return-Path: <linuxppc-dev+bounces-12398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B1B86E0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 22:19:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSRnj20Jjz304h;
	Fri, 19 Sep 2025 06:19:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758226793;
	cv=none; b=HCcb3TPM4wPbAQnUYvQaBBM6LmE9vVgmVv1y3o2utq9cky+pmBzR4920XAC+JO6Ia1oj0LarN6zk+o1vczl846aKFwlYaDvbFeOdc3okugo7G3iqxKiZ6jHxqmUKfFJr/Pev8RRPMbRp43H23GFtGh3HubvzwiAmy5EHL8eYfnra/rJEU5TVdpe4nLlhlcnUcuSliq9tmriIHopYeEVOXfH1Wyh4joAYXbgyn7oS7bNKXAIwONgUvlWZJVDJ/uOrgUdUKEdvUUpr5uWo12QUPQoiASW5oVoyjM384rNmgJknB0YPDzF4udUARdca21zZZHDNfHsimYAJ9yO3BrZ//w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758226793; c=relaxed/relaxed;
	bh=PByJ7k8MypBjr8KylepCawZGFe+rnZUkeGFV381LFME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMJzqU4O6kAtKGS7Qc9hbKvUQ65r4lYDr7AEwjYc4DSxIb+ltmF1qH0bthgRM//X5dZndYoj0ZyoWGMGc+vlpWR7VzMaXSktHycJywzARYJ+zBgIzUJgZtdmXoiQ7xRTfaJ46nE3hCrM/wYToDIqoKN+5lANQJTcZz0LgIWhwBJZEk0lbYsw9euNNuPtCuQQyjPHGOtHkmZwviG8YRBHGWKZ/RIzHkUeyloQ+F97/Tl3fc5b5M0wIGOIwZELt93eYai/SQvtOTQNleaDfd4durG6NYsJcxVCBLD+Ox5cqagyvN+oXI2QNNSQP+1tT2rOayBUJxsWdSZxHd8JmAdTTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c1TtGk9a; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c1TtGk9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSRnh4VnFz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 06:19:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BAD7601D5;
	Thu, 18 Sep 2025 20:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BB3C4CEE7;
	Thu, 18 Sep 2025 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226790;
	bh=5v643+f4mhCNNCitIuEUQGOWs/3qK3dOdQaqXP7H++4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1TtGk9acaMHlhl0KnNwMmIZrnQ53Ie/77CghdF9h5mKWNNTrynrlDVej9cl6SlbK
	 rKUGUQrMokaXsmp5tBp5dRYtlunEd1tzcwHZlhwBRdmjvmyGETbHRsJPANiXi9N5Vt
	 5TJgn0hLF/ICqJ4d2uixvrAOp7R4K+nRoFQeISZ5JaCPp9dS9PTpxknVeb8Vjj1Sm4
	 BuNCZTPhVTVLnCQ6sDpE01BlgX8WnBMVmQNPQa3HzRHOGkqIcn62VYnZcS6sWTj8tN
	 Su1qCm7a1pAsKvJrq4wGAy1uwdyNskLZcYn/QvcZ25WDw8M/njUbzjbLNRKbJCzQPC
	 B2SIqSKLAv7xw==
Date: Thu, 18 Sep 2025 21:19:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of
 interrupts
Message-ID: <d735d395-d56f-448e-8bfc-4fdc9bcffd9d@sirena.org.uk>
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
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
	protocol="application/pgp-signature"; boundary="OG03h1ZJQmsi4o6W"
Content-Disposition: inline
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
X-Cookie: Victory uber allies!
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--OG03h1ZJQmsi4o6W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 05:34:07PM +0200, Christophe Leroy wrote:
> This is a RESEND of v3 sent one month ago, see:
> https://lore.kernel.org/all/cover.1754993232.git.christophe.leroy@csgroup.eu/

That's a link to v2 which had substantial review comments and build
issues...  I did actually go searching for v3 and didn't see similar
there though.

--OG03h1ZJQmsi4o6W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjMaV8ACgkQJNaLcl1U
h9CZvgf8CPU7RnocQ9l6sM8liGp/RotKn2IBpogMBPMA+/oJ0/jeIohYua1IvRlB
LYkPh0mbBziixdS5LLfoaIUwuOA1yaXmQp1VNwQWY9ECun37kSxQI64up7mVJV4H
5YMl9DNWJzDAEYBeVbKPIfZ7dykLyMd/d/63kRyz4LBaQE6s7eLArLZBcKdtuitu
4oX7hZm6NoxmftnYwv3vcrtpcR72IulbhSEAWSCBazblbL3iay2O/Y8oyM2B274L
1ndxpotDDaK+ghauhqvnJeSousc0gEmQ7GNa5085nl9zKj0aigIBKZa9zc9/JvLf
6zbu7eCxY4m0Xv4b6uBM7Nz4QDAC+g==
=xY/X
-----END PGP SIGNATURE-----

--OG03h1ZJQmsi4o6W--

