Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61457C5F12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 23:22:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FeuXDh0P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5Qhj4BC8z3cgg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 08:22:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FeuXDh0P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5Qgr3F2Zz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 08:21:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF1DF61993;
	Wed, 11 Oct 2023 21:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91DAC433C7;
	Wed, 11 Oct 2023 21:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697059300;
	bh=AVRwgDQBx8JR4FI59OdGoNJiJ8cIUcgjj4IXSMlvioQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeuXDh0Pe588U/HI3BCDaX6/Siicbxz/VlUUPwNzcB1plpChg61yRxaACWVX/bjSC
	 nE+bO3Enh9zLr1XTmn8fs3TB86TrpmoJitanCKs7mKDUtfwu4NVWMpZKg4UYSjJ6PR
	 iKOXjQH5t3NmEXPQk0drsmr9nEvgsXE0u3AOh9r0kNXveyTarxxueqkiNNLq7JU3jk
	 3HiJONE5kHoL17J76por3LVwuqyLpztPecYx2kZCVzeOMZbpN7FQ43vmu9rHskAXu2
	 Dxkib8VXSvqRiYme9D+JO6GhZ8TLtx/LGd0RqSFvGjXzJGVF9yMOFPGD5QH4uAweK9
	 1VfwaI6sLQqWw==
Date: Wed, 11 Oct 2023 22:21:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: sound-card-common: List DAPM
 endpoints ignoring system suspend
Message-ID: <f639c88d-371a-4c72-a906-47d643b24ca8@sirena.org.uk>
References: <20231011114759.1073757-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BGyLCGLG2m53YbE3"
Content-Disposition: inline
In-Reply-To: <20231011114759.1073757-1-chancel.liu@nxp.com>
X-Cookie: What an artist dies with me!
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--BGyLCGLG2m53YbE3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 11, 2023 at 07:47:58PM +0800, Chancel Liu wrote:

> +  lpa-widgets:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of DAPM endpoints which mark paths between these endpoints should
> +      not be disabled when system enters in suspend state. LPA means low power
> +      audio case. For example on asymmetric multiprocessor, there are Cortex-A

I suspect that the DT maintainers would prefer that this description be
workshopped a bit to remove the Linux specifics.  I think the key thing
here is that these are endpoints that can be active over suspend of the
main application processor that the current operating system is running
(system DT stuff is an interesting corner case here...), and the example
is probably a bit specific.  Other bindings use "audio sound widgets"
rather than "DAPM widgets".

We also shouldn't see that these endpoints "should not be disabled"
since that implies that they should be left on even if they aren't
active which isn't quite the case, instead it's that we can continue
playing an audio stream through them in suspend.

--BGyLCGLG2m53YbE3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUnEdwACgkQJNaLcl1U
h9D14gf+M9bhmpfCPDRUmqCUaPutP6E3jikRfcnDJMN9NCqZQlZqmvNPDkZwflpC
0ANUsCcytMbUuzBoQIYoSCtfFDer2msQyvVQxVsM9P1zwX7Qfbal8vTlZGk4ysr7
p81AT1+S+qs9386uzQSK+WFqMoEEZYzgOY8GDvdEZFl2I1JlfB6+f47nyxYwYylv
GD1iiiRKguqj0FMRWINIxBRehf+/SSZ2dLu6lYVAl2ZlGkKZgtJAylmDGVVHWAiG
YWYHw1UUmuTqUtdcsHd0h5Yz1fv5QWhhOSaGSLrrzg58vMBhsC/JfP+ntn7pF5eD
Wi4I4SBZmZibAjPsU4MD29pkvvjasQ==
=c0uT
-----END PGP SIGNATURE-----

--BGyLCGLG2m53YbE3--
