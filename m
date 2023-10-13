Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 844377C86A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 15:20:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cbcC9b27;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6Rvd35Dkz3vlh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 00:20:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cbcC9b27;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Rtd01nsz3vfW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 00:19:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B29C7620BE;
	Fri, 13 Oct 2023 13:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC540C433C8;
	Fri, 13 Oct 2023 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203174;
	bh=VcB5/8seKLmFDKdT+kSos3+IFwbNg0oQ1SdCP/8TYHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbcC9b27ZdXTw0KnKGi8PnmGOavWx2Gz8d4m0p5n5/7E9X9+vyu7GPIfIrdLFl0Ab
	 35RfJ7QgW6JBMdhQjh7UBRa8hJtxuUoCwY8bRJzqyD6b1xlBjtnXvRRlUi8Xx0oQkh
	 MZ/Qcs7Ef2LmSkA3+Lp1tuqd7o13UbsXF0jfVrIeWAGf5/dYkAL0b6drKRqjhZOFo7
	 EX0sL86XrC0M3KG88/RmOilU7l/LUjqACrD+sCn6YR3H3U+8y+3v+hgFfpqud6oIPJ
	 dVsxrvWMCWP/jLVu4rABekQRNayIT8VF/I1TCf0YaCxqg5/iJkhXLAgtNkhoVQ0mfK
	 8VqTw0G2zuBMQ==
Date: Fri, 13 Oct 2023 14:19:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v6 02/11] ASoC: fsl_easrc: define functions for
 memory to memory usage
Message-ID: <ZSlD3ee9x3JsZL7f@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytqlM95q5yypPr0Y"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-3-git-send-email-shengjiu.wang@nxp.com>
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


--ytqlM95q5yypPr0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 04:30:56PM +0800, Shengjiu Wang wrote:
> ASRC can be used on memory to memory case, define several
> functions for m2m usage and export them as function pointer.

Acked-by: Mark Brown <broonie@kernel.org>

--ytqlM95q5yypPr0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpQ9wACgkQJNaLcl1U
h9DNngf+M3/aOmhL3QysiOuRsmxBgDZuzkyGRwIBeMdlNnRJ7VM13CfbjkJ0D8Ju
ku9ojR2jE52TiXcKQIoyv4iD+gMIndsFMEOEEI8x984ZsUVkd0HR/L6YtiL5g2qI
y523Dzyvy5kggmINayFGOBActp7aD7hzGUgJ2EqknrmhztzFMoDM/wpvunBAC/+z
2rSabJ8Ss7YcNAyXd619KZFpf2bNoGEXOvMWZLm3lUidNJfMsSzzbVfivTrBByyR
wDY98oN/ssmkuUAMKKGJtyimFc86LHl4VFzOHk88+srmpiE7P8o6iLRu4ioJ8IYW
5VMlKcs7NwJyryTiAvEKLcp6harRFQ==
=oQdR
-----END PGP SIGNATURE-----

--ytqlM95q5yypPr0Y--
