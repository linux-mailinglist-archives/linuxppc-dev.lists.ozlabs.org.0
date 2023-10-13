Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA21A7C86AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 15:21:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SBbOrhzu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6RwY5k5xz3vqH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 00:21:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SBbOrhzu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Rv96JVsz3vgq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 00:20:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DDB86207B;
	Fri, 13 Oct 2023 13:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB6FC433C8;
	Fri, 13 Oct 2023 13:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203203;
	bh=0j+p4gMhFdIWLnm4zbDZJedU2EzXTXnNAOs/EsZTX0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBbOrhzuNJFXYvdWvr2JLqh2YcVYeqqfsnnGkrOjWFufvvmfYE6wvFJwi8IVuwDiz
	 cnQ2Pc+di2bIiG9H+uYS7aCLBoNHY46IXoWPZN82JdrGCmMmsh1EWhIDHb33A8JXzS
	 GuY227xVrV7SPuIAAughRjQcpONtC5MuPp3z17Ca/OTyq6xhVbJNqckmmkVfLxYtY9
	 9ZJ6C8xLt8Z7V1fVt7XlmenJbS1iJ2wpo5Jf1WJN/irUPCGb9ePlrdxWqgLvmVgF5y
	 PXXq0xbcdhwqGernBkmEd/gkg49VnXZza5ny+JYDvd/b3rj28hOckLTQOpMPEqKZGe
	 dN+Y60iLxEYEA==
Date: Fri, 13 Oct 2023 14:19:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v6 03/11] ASoC: fsl_asrc: move fsl_asrc_common.h to
 include/sound
Message-ID: <ZSlD+vP0+yCWmB0B@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w0UFSr9I7Wnpnjus"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-4-git-send-email-shengjiu.wang@nxp.com>
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


--w0UFSr9I7Wnpnjus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 04:30:57PM +0800, Shengjiu Wang wrote:

> Move fsl_asrc_common.h to include/sound that it can be
> included from other drivers.

Acked-by: Mark Brown <broonie@kernel.org>

--w0UFSr9I7Wnpnjus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpQ/kACgkQJNaLcl1U
h9DFGQf9G4UAk1AJO176S6OyBU/9FH3l2Jy9leYRRBkjLWEV2Var2mAPe54QynuS
TBmYeaLGyBINIrPr0lIhRJhIUlR6eVwWSQoKQv6yJpmmcrWw4/NapZgeETcMLkPw
Uil1NJG9PvURiCX+hg1Z+46ctP4pfhD+n6LNyFofy/tmQiHgzy/kdgGCbyg+hiRR
55OhU/8M8R8uTwmPC5ZR2/gEZHzp56V2vX9Gn8jZhduUZNTNZrthPMM5GtjPj2di
A1AEb1vPbwJNllKmRd/wMn3ZsW62dQYQiboRj5jFq+HOBsa0nEsTmjTfKSc2us3m
TMscXvWIRjSEHcy+Hq+nvn+FO5C6eA==
=P3BV
-----END PGP SIGNATURE-----

--w0UFSr9I7Wnpnjus--
