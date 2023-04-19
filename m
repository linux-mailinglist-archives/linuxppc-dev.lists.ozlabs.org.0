Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E15C6E796B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 14:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1flr1G2Dz3fD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 22:11:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fAl9F0b4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fAl9F0b4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1fkw3HQ4z3c99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 22:10:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E777636A3;
	Wed, 19 Apr 2023 12:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51155C433EF;
	Wed, 19 Apr 2023 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681906244;
	bh=zXn7zJCUIG3ulu/Ol1+5Z/t1V/9CZ+gFKm/NZrXca8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAl9F0b4N1Q/ALgKd++p4qmPo4uTpbJixPN/iSsdI2nRaczZkA/z26SGrvqLrQIJp
	 EjtTMAoyO4b5BudvKLtUPXapdCrChXu0WiC77LsyKvjM1gDjtkL+sKKbr7Ry2bDwPa
	 G3lIMXhSTvy0pTEpG/FqDKc0wMR3/2hlQzwgzWZWAiC6+CzWfDJxCHBNyibHqiyfsW
	 eNACV1vNw1iTt9jrp9gHCjd6LKdlYCdfXJ3Os8Vh+DNDNZ/fDFv2ISgyPda+sfi/6p
	 /lsSfEVVwBCtR7ugWI13LfL/jUmIyqWE+mjEjUHzjhiheOfWZT3J2jOTPCtoOiPynI
	 XzUvXqMK8dm3A==
Date: Wed, 19 Apr 2023 13:10:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] Revert "ASoC: fsl: remove unnecessary dai_link->platform"
Message-ID: <536ac75b-9a04-4f01-b62b-a5ba94847603@sirena.org.uk>
References: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Svnkl6ntiFrJF6sJ"
Content-Disposition: inline
In-Reply-To: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: This is your fortune.
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Svnkl6ntiFrJF6sJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 19, 2023 at 06:29:18PM +0800, Shengjiu Wang wrote:
> This reverts commit 33683cbf49b5412061cb1e4c876063fdef86def4.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Svnkl6ntiFrJF6sJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ/2jgACgkQJNaLcl1U
h9CvjAf+LMbQGyVZrjxwg2HmcbPI6CtACi2AKIxQckmP0FDevBjQG3Lrbs9uSIk9
EDhu08RXTZk9d5HT5c3iesNsESZPdoi9s/I5MNLXJ3qYSGO1F6twOD36u+MrpD1Y
e8HzFNtOKxOK0dCPNilpAdaJ0eXiiOU5XEsVaF1FVqWNts0gPpFTfI4t9o+i4YAW
WbPTf2TFZG4XtUmUJp6L7mUE/8Ng54+L/LSAMicX7D/DPZC10R+INJQCO8UgFsbs
EI00Rv7l3+ZhdBVLKa9i91jgZjDcMi8pzsgJ8gunLr7bD4b9vXCqayznWkMOC1p6
na9sDJqTXr57S3mm2kSQi78Y/sJD4w==
=TMjV
-----END PGP SIGNATURE-----

--Svnkl6ntiFrJF6sJ--
