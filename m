Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A9220F70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:35:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Kfx5XZ6zDqWx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 00:35:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=DtX+/tcc; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6KTM5m7czDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:27:03 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5078B205CB;
 Wed, 15 Jul 2020 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594823220;
 bh=2qpN2cOs0v8OgbKiTCEOLREVstlLLC76OJcC/cCHwQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DtX+/tccMlVeMNKiozjp+uC/QzIQ1f5ReA3ZExvuVyNGw7we44RduABqcmoZCDDTW
 Yzotqw74bb233t4PKstgZM/1zygsYv/Qh2xv2TfbzbNK1RRDl96p13D4q6Shjmt1T7
 POLd33Hw9krqvH6eIAcns0jJpXABgnfIgVr5iNJ0=
Date: Wed, 15 Jul 2020 15:26:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling
 of 'exists'
Message-ID: <20200715142651.GA44014@sirena.org.uk>
References: <20200715094447.3170843-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20200715094447.3170843-1-lee.jones@linaro.org>
X-Cookie: Minimum charge for booths.
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2020 at 10:44:47AM +0100, Lee Jones wrote:

>  /*
> - * This dapm route map exits for DPCM link only.
> + * This dapm route map exists for DPCM link only.
>   * The other routes shall go through Device Tree.

This doesn't apply against current code, please check and resend.

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8PEioACgkQJNaLcl1U
h9DvQAf/f/u76ASoswKuqEP0xg72QuhZGUj08nlVQnAV1civDdfyjXZEc45CEfoX
SBrMdVIMfvk8oxGZIsgRkhW+QimcJLr5rsyO7RylN6YZsXysfG0GqDbuH9WvgGSJ
yTggaet7yI6gAlbjos476ee+yrzNSssnBzOpxuk5pXCYxDkEf0lgclfQY21oOG/t
8F1tzjQjJ8kXcfYfnBofJFJPqi5EA2DbogxL0bH+7/ndzpuo4BNVb4463SuG7CXy
upIOZq7CFRlVOY4Izb27YyFAeq3SnigakVEBJrkFeKsOECP6gTBHSbZGrydD2NrO
2K6J+fPzeGcdXutqMeP+n2ke/vXxLw==
=viwB
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
