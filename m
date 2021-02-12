Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9996A319E64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 13:32:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcXtr0QfCzDrRV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 23:32:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M7EGHqyO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcXqD2Ll7zDwsC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 23:28:56 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7794D64E08;
 Fri, 12 Feb 2021 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613132933;
 bh=7tqF59VK/MOleoT3o88Z4FkujGQhWAzCoyIWc6mbyhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7EGHqyOKGD6o0WkCqhPsradNoxRLYSIuk2xKG5JYT1SYIXWNR2GJioSn72b5JYKD
 K8JHkfYTvmXYp7YC4e6Tvq8ofwTKrrHtwGHIw2tKYiJo7UjUiQ6ZqsEarHY1OOovvW
 FhR+XLxRrb3U4vVfwfp/yvD8VkFDltWBJhl8+PlakjdvkDyAC3L/BaYpQu+UwBPeog
 nDXnHjdhSIvXaVdXFTxSv/F91/7zxGFU9A+g0GvIN4l3Y/2grZFn3Woqv07svuTdTr
 UBN/zEgax6YB8KP0zRnXS1s9H+4pmHNlsPj3LVuxLZdyCWi7iAQvkt6fi8VT9mIksY
 DIrF/JJ49nxrw==
Date: Fri, 12 Feb 2021 12:27:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the spi tree with the powerpc tree
Message-ID: <20210212122759.GA6057@sirena.org.uk>
References: <20210212152755.5c82563a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20210212152755.5c82563a@canb.auug.org.au>
X-Cookie: One size fits all.
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 12, 2021 at 03:31:42PM +1100, Stephen Rothwell wrote:

> BTW Mark: the author's address in 258ea99fe25a uses a non existent domain :-(

Ugh, I think that's something gone wrong with b4 :(  A bit late now to
try to fix it up.

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAmdE8ACgkQJNaLcl1U
h9AjDQf+N2bAZaqz5G/XdAJGKyWKyXerf6onO/FoIWLtdkMwDDwPUpU5noOtfMYX
QeT7C+lw15DX2TTOJlft213BwwddfyhK05OoHKaEsnu5GXa4J5ozBXEwn562ZQTO
9vEUnu+eXCmUEGs+ibtz6WDmvRpztBMukxWQ/A3SxRa8ozB+uYIX6G66EZIxKcjb
H2AMHJoPv9qe6rGtW8cLxJ5Wqfl4z7zJzVGIv+wsiqqdrMv8D5zQo9Al1jRW/Jyw
F55kR9wH/p1WlO3/IyK6+SaGPDM977ZaTKykEU8ZbGOj0MXbDUS9xCvLlR2M1MFT
QkvPZWrHu6diUUvAQ2DQymM0yX3xmg==
=OQ9e
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
