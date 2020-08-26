Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28C25358B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 18:55:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcBnR49dPzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 02:55:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=G+EeWxWl; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcBlH3vfrzDqD8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 02:53:47 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1DD32078B;
 Wed, 26 Aug 2020 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598460824;
 bh=yvbxB/dXm+wxQXgZYoFFZEVL9w4GvstjJ1BXu6Uy/Hc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G+EeWxWlvWkzBLDIG4YwXEVSUsPzaMdlqtMCM2GTdCgivysepguirOTd+5lMVVyNl
 i9dtROwHC76N4bjFqFddps3JLinWLMBAsEFpP1G3l7IiTW4xAaIG1kIJy28biGFpXk
 WCvP/u2YDSt5umUXhfoBNoy72IC0sT2M2Ob2p7Ns=
Date: Wed, 26 Aug 2020 17:53:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Fix unnecessary check in
 fsl_spdif_probe()
Message-ID: <20200826165308.GJ4965@sirena.org.uk>
References: <20200826150918.16116-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="W/D3X8sky0X3AmG5"
Content-Disposition: inline
In-Reply-To: <20200826150918.16116-1-tangbin@cmss.chinamobile.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--W/D3X8sky0X3AmG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2020 at 11:09:18PM +0800, Tang Bin wrote:
> The function fsl_spdif_probe() is only called with an openfirmware
> platform device. Therefore there is no need to check that the passed
> in device is NULL.

Why is this an issue - the check will make things more robust if someone
manages to load the driver on a non-DT system and otherwise costs us a
couple of instructions?

--W/D3X8sky0X3AmG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Gk3MACgkQJNaLcl1U
h9AXowf+OVsKdeEZ3BjfcRZvF73cSt5ZNgBH2LZFoif+p5duvwFhYWYpiM838REI
CFWQz5uaMwq5pzA8Hx+iJA+HyEhiucpXw3yxW5Xs0j1nd/BgiSGKdyHlTXZ3RqD4
Gr2QdQXO17esiaT11+ZLFIwecynN29JLQ8GThARSMc7tGfmaXy5JQJkOy5c4nOFX
ycF3dds18vEua7ajqC3wFLTDygdqE6gv41YqIJgU3J9X/tAugKh1jtTa4k1eh/6M
ydH9ezNoA3havqWqAAhAGbW3kbLBCQFKsndWnZbYPU0VHZw5shBWTrx2+x6z8F68
YM/0TyIgmkvB07oBBF6wkjb5sD0hZA==
=6aKW
-----END PGP SIGNATURE-----

--W/D3X8sky0X3AmG5--
