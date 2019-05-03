Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11D12797
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 08:18:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wMQk4jcqzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 16:18:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jkvoYfxS"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wMPL407jzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:17:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5vEsn3t0K5FrUDpqgBN9YEaqzn044x2H/vNzN5bOsSA=; b=jkvoYfxSRYUtsrQF/SohdXboz
 LNRNw18UJAMAdf4Pi8lnV9aYdCMRMVl4UClh3xD0l34qM8EdZin1Nu1FUc7jV66JOaTebvLSZtlfk
 HQvhnVfItGdyPFE6uwngD70qLFVvtaXDQ+kXCqCrIGGpdhfCBNVZM7fZ4qvxcQtRxcO1I=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hMRVi-0000TX-AZ; Fri, 03 May 2019 06:17:30 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id D198A441D3C; Fri,  3 May 2019 07:17:25 +0100 (BST)
Date: Fri, 3 May 2019 15:17:25 +0900
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V6 1/3] ASoC: fsl_asrc: Fix the issue about unsupported
 rate
Message-ID: <20190503061725.GA5107@sirena.org.uk>
References: <cover.1555908545.git.shengjiu.wang@nxp.com>
 <2cea4cb992a445863e88fa7865f55a02a83e031e.1555908545.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <2cea4cb992a445863e88fa7865f55a02a83e031e.1555908545.git.shengjiu.wang@nxp.com>
X-Cookie: All true wisdom is found on T-shirts.
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
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2019 at 04:52:02AM +0000, S.j. Wang wrote:
> When the output sample rate is [8kHz, 30kHz], the limitation
> of the supported ratio range is [1/24, 8]. In the driver
> we use (8kHz, 30kHz) instead of [8kHz, 30kHz].
> So this patch is to fix this issue and the potential rounding
> issue with divider.
>=20
None of this series applies either, with similar error messages:

Applying: ASoC: fsl_asrc: Fix the issue about unsupported rate
Using index info to reconstruct a base tree...
error: patch failed: sound/soc/fsl/fsl_asrc.c:282
error: sound/soc/fsl/fsl_asrc.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.

(I get the same error message for your PM patch when applying without
using patchwork as my main workflow does.)

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzL3PUACgkQJNaLcl1U
h9AuFwf9GU1mu4UAbguaCvzQD7KN7UOFPnMm2fjMErvpmxgq/cV7aFQEJv6Kc9Z6
A2/l/TYJ+iNoJ01SPYwRKqw63mJmthjOsikQzaH3VISq6kF09ENT35Z4U1r8zOkb
6IbPno6mpS6rBk0ckEJ7TLf4dl9zDh4djeaGWVK8MFX+D2eW86vfn0qNSWVCO55O
p46Qvf2iwJJyc9HVx1AR8hJFAtadOWlmfPYUbUJ0DIJpAzT1aCFtoIGqj2Ef40hl
YMo9B11fGc9xoae/INeoJIAOInjLKeS/Pm0n4N5FJpPeke/b13n0bDJ7EuHOy+td
YCXUiBuuUhxXCy372VZHevRq1JK7hw==
=B7sO
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
