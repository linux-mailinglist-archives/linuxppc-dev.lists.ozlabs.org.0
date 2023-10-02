Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B1B7B5616
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 17:11:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a43GUsTc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzkvG01BMz3vfs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 02:11:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a43GUsTc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzktP4Q8nz3c50
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 02:11:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A411CE0E10;
	Mon,  2 Oct 2023 15:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3D6C433CC;
	Mon,  2 Oct 2023 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259465;
	bh=41XksM9CbEPqnvNa0ISp/vSRlLbz+4PKhMb7S1TUSAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a43GUsTcxLVVQlHP1srhc2Ta0b4OZ7SBq6c8jNRGjOA2nNhqTttwcPgjv+EoY/Sk/
	 yuU1euPuMJiWOF6SETfeCcw1cc8r/8avOGUxhhtN4wPRiADHbUQEgR8CxuJfITlA2R
	 ScIpIVFfEEeaf82zyLCD6ASkOPMJxrXYlWhg5QwNGm9kfTgKjsl7rwye31fIXyM09r
	 UzXdWWqnhyyq/Yp1B9TAlMxHZhPtA6mZ2KC7nWk2qlRY8Ino/PI4lwr06wWkOhVdEy
	 mGTzbGJBCBQEsngu82ZsBn2uNQA7gNf5bHCExLim85xh2RZQuNetq3T86ZfIQSr7Lx
	 8J34ttjE2jGWQ==
Date: Mon, 2 Oct 2023 16:10:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v5 00/11] Add audio support in v4l2 framework
Message-ID: <2599f388-51a0-4ecc-9f36-b72d96466dfa@sirena.org.uk>
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XveoJAUVdjo3FpSQ"
Content-Disposition: inline
In-Reply-To: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Postage will be paid by addressee.
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--XveoJAUVdjo3FpSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2023 at 05:00:08PM +0800, Shengjiu Wang wrote:
> Audio signal processing also has the requirement for memory to
> memory similar as Video.

> This asrc memory to memory (memory ->asrc->memory) case is a non
> real time use case.

Other than the naming thing I sent in reply to one of the patches the
ASoC bits look fine.

--XveoJAUVdjo3FpSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUa3YIACgkQJNaLcl1U
h9C9gwf+OHN5aL0Hw/La5WvbqbDYD50xGPRZAiEzHEhxU7t3oB7XRmUGKpAcNp6B
9Gg7xSnez9mmtrqUNNeptqdDTo6KYgdKF0gkoYUMdjA6rwmvBJ4sxs+vv1lRjIT9
8Q2l8jlRl0fFxmRqP6nmKxUPuS6p0m2ZUWU0CbRNiKMdPkGUnHpVpm7jIaXHAy6O
y4J8OrVpC/goCfRANXcrtz7DACV60ihbwMMED6dUZV7xg8ruXAw/cK2kJWqlsTjx
T5bEQxOsCPV3TWM1Gr7BHANCQj/Azzb3XTvMUin+y1PJaHU60qLRROcVDN9V7YaW
qm4fbNobVVMaG1EnsmYguD/bS85naw==
=grt1
-----END PGP SIGNATURE-----

--XveoJAUVdjo3FpSQ--
