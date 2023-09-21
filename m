Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB737A93EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 13:46:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jdyOD5QZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrtsq3NjVz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 21:46:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jdyOD5QZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrtrv0S00z3c3h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 21:46:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 277ADB81FDE;
	Thu, 21 Sep 2023 11:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B98BC4AF7A;
	Thu, 21 Sep 2023 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695296759;
	bh=B5xFlRjZSUa0fGEwETgAARr7jSAUY2bfCZxgYOjYkAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdyOD5QZ6UTXYGX7KA1Tj9gVp/Qwr1N6OPc0v9/f7gTBIi/oJUq1uO1u9GnXQfasv
	 rSThNQBU9ikPIcgzLz5GRis/Gb8qmVipZ4QJV0mCKbpOp+KoAYQ6ye8IKvmm5L0mVN
	 Y5r4Zy2sdCI8+QWdLtl3D4sMxIM7ho7JtpVId9wgwlaWI90Bu59LBINbbdtvAA+uGE
	 w39DocBGiNpFtJeAXtezq5k4cXbvnG5iZfhGHf8dmad33eY2LonBfYexXHwxSzsbTc
	 ODcqFVJAsAqf542oSYL0n3rCmdonR++9lTxeu2ACrLyRFJIw7gB+0l75zdJKkqR730
	 JlNnhpWZjfmlA==
Date: Thu, 21 Sep 2023 12:45:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [RFC PATCH v4 09/11] media: uapi: Add
 V4L2_CID_USER_IMX_ASRC_RATIO_MOD control
Message-ID: <f5743550-89a1-48b4-a8a6-f66fd246a02c@sirena.org.uk>
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
 <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
 <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
 <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VZPV3UQ+Ok/rD6bG"
Content-Disposition: inline
In-Reply-To: <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
X-Cookie: Caution: Keep out of reach of children.
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--VZPV3UQ+Ok/rD6bG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 07:13:14PM +0800, Shengjiu Wang wrote:

> Ratio modification on i.MX is to modify the configured ratio.
> For example, the input rate is 44.1kHz,  output rate is 48kHz,
> configured ratio = 441/480,   the ratio modification is to modify
> the fractional part of (441/480) with small steps.  because the
> input clock or output clock has drift in the real hardware.
> The ratio modification is signed value, it is added to configured
> ratio.

It does sound like something other vendors are likely to have to provide
a mechanism to compensate for clock inaccuracies.

--VZPV3UQ+Ok/rD6bG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUMLO8ACgkQJNaLcl1U
h9BsbAf9FFU/jXmFMuDrv5AHXagBE2ZnPpLBCFyq5o9+5iHStRpg6JjatAWgBYz6
jSQEHHIrxzJXJERSR6ZRV0pZu6xHQJgWxH3wzCBgIv9xwxRVKaBgJ9/qAfHIhq3r
VlDRzT6xqXstBSc0AC8vZPVcimz2QNMQSf81b66DFlAS96pzIYtUvR6Hj7zXYSRg
YcJSBjoPYvhB9vnst4d/+sEB53MTq5+gqAkjsB2nYHkDAcRTBUf6BVTD/NFtGk0K
04YzjgyoI4OW05wj1RcNk5AnFI8C519Qyaf+mLrJTIjZx4Y/v3wvw5N9h1tLc+0r
AjoZOgf+eL5qYEbRF1M4VyBn2rgwOQ==
=3xkU
-----END PGP SIGNATURE-----

--VZPV3UQ+Ok/rD6bG--
