Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889977C8709
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 15:40:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ecS4BIyR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6SLb2TKWz3vfn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 00:40:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ecS4BIyR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6SKl48qpz3vXv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 00:39:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4330620F4;
	Fri, 13 Oct 2023 13:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B98C433C8;
	Fri, 13 Oct 2023 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697204376;
	bh=Daw0oV8avVvs3EF+zKAfgZ1+IJkL9210R2usowvEsyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecS4BIyRUjVKqpOSwmbEMFgD2mkLOzob8z36DLk5NsjL5pWRpaaju8vuB9gNGo6/7
	 INLiteok8petspSUsj39GF9S+2co8eF0YKXXl7EB7A5b5GBCxf3fTgbxMOUB3dn15Y
	 TY0i9gTt+bG41cpVQP3Dgi0zNFwa3uJBa++LH96mWvHpSn4minfwop6nMhtvOCXCc0
	 2px4dX0/TIek+xAxyTwYjsfWVBYnRdgWOR4TZ75Optn1KfAcMBBoSiNOlzQassi019
	 vuw1EJuhmlIA9YKgpXDKKCcb8orSY35b3hbRQH9hu3myUUj9qGOUuKnYK0LW5acBri
	 fn/2gS7YyC5aQ==
Date: Fri, 13 Oct 2023 14:39:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v6 05/11] ASoC: fsl_easrc: register m2m platform
 device
Message-ID: <ZSlH8BW8yr+WJFK0@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-6-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UKDVDCqpnMS86zNZ"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-6-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
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


--UKDVDCqpnMS86zNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 04:30:59PM +0800, Shengjiu Wang wrote:
> Register m2m platform device,that user can
> use M2M feature.

Acked-by: Mark Brown <broonie@kernel.org>

--UKDVDCqpnMS86zNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpSI4ACgkQJNaLcl1U
h9D3Mgf+PDdKi3n9C0kflM9CvsKjX5j3rfiOo6oGsIA4yaHNFonDmjLM+iJAGM0x
QTPAK5TwHUOu2fZ9wQHo7FKNTV7OPH5h8VuU+wQjWc9Ftg4kgmqbAEfFsw/EEjaz
k4J8zpD1c+B4iF3NNAKaJu+6HIkx6bcffkDCaUqtFEjewvc7mjNZNBnsL+rilyhy
z7/tS6VfFD5Skjl5xG1x+Kh9XO0ziRJSfUNNEGzRFFzK73GngtE0Reh8qN4aNNXg
1BhBUoDRS0Qczjt/Cb9YXTaicRJBvHEMTLz/6vl/sMlUhweBrLXWuX0rwDwR6MT5
2tMlxCViUMgG/ug9JJOB6acfEQVwBw==
=3R9J
-----END PGP SIGNATURE-----

--UKDVDCqpnMS86zNZ--
