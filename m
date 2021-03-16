Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C1C33D52C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:50:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0F755xFlz3bcV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 00:50:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d2iQ8AfM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d2iQ8AfM; 
 dkim-atps=neutral
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0F6h2fz0z2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 00:50:36 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 118C165053;
 Tue, 16 Mar 2021 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615902632;
 bh=v0MQftmjchfDyMC/gsPtVSaYN1KMEK0Xi5b0nN0zZoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d2iQ8AfMIkcRJMiwCyMDrEYQ+fm2BuhcqJBrRDiqtLgZgbWR6A2s9flaTfKez135q
 fdSRDHEXaqaWbIV5WoEHS3ARyh4Y+xL3xUNi+zW+teWI8G+pe/bpgpB0d/TPgyrk6V
 2b9m5gDUqiCoIqZ8pj5Z10mELK7htU7kbHpvYxm+T3euNlvollP5cYdBCrg5C58Sex
 0Zj6ic7R1OD5C9FtTyl+m4G1jnOaHtZqmbQgBxRQbWgCljhiYenYXdhL9g1ancsbm/
 mhS9jEwKaQr+8wwBBQPfjhRhVSFyl0ruRGkoOxu3DHt0qNO+TMQcwsp0w81WV5q+rL
 s3pH4/TS+Yk8Q==
Date: Tue, 16 Mar 2021 13:49:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Viorel Suman <viorel.suman@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: remove reset code from dai_probe
Message-ID: <20210316134915.GB4309@sirena.org.uk>
References: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
 <20210316125839.GA4309@sirena.org.uk>
 <VI1PR0401MB22721D0D266207472B3C7829926B9@VI1PR0401MB2272.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB22721D0D266207472B3C7829926B9@VI1PR0401MB2272.eurprd04.prod.outlook.com>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 01:42:40PM +0000, Viorel Suman wrote:

> To me it makes sense to manage the clocks and reset from the same place.
> Currently we have the clocks management moved completely into runtime PM
> fsl_sai_runtime_resume and fsl_sai_runtime_suspend callbacks.=20

Usually the pattern is to have probe() leave everything powered up then
let runtime PM power things down if it's enabled, you can often do the
power up by having an open coded call to the resume callback in probe().

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBQt1oACgkQJNaLcl1U
h9BD2gf8CYq0baSLf4YPI5H7xjw4JepkHBJKPXid4yN7feW5rEKKZIlNzYx5AYT5
jh10YF8ND602x/tBHwlqL2tNdjBFzSi4dT/1QapmOaS4NqEXPAWU97VUPECfxWLm
29HZ7+Kw4LfDE2PI/2sKnBYd0wE8w0l2prCM0Ms8JT4hVal8O53kgzjJ6+dzHfpe
jisKXgGv8qtNVlK+6AMK3H+vs8ROYnTfiYTsFNR4XF1nrvGSxwwvM8KuJb+rYb5+
VNB58e4KMaolnwOyxf7QAQQpAAQ7gFl/GkRyXquIpeOlV2WER5v9N6rVV1DMpwII
0zlVO4v7O5Cts1nqzxxdfsUHu1yNjg==
=3CXS
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
