Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9ED560897
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:06:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY8YQ5QQHz3dr0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 04:06:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dqLWCK3h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dqLWCK3h;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY8Xr6thgz3bc9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 04:06:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 21E84B8263F;
	Wed, 29 Jun 2022 18:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18D3C34114;
	Wed, 29 Jun 2022 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656525976;
	bh=/ORbMpAF9g//A1nrnM4wkmRc6v6TBleNFfmCLetRAZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqLWCK3hqF/qjXyw3lb1XZBUniogyCFkTUNKziIg8IItEAcFdeRcG5bD8fNbhSPLa
	 J8eVLKAK3nmo6Q7RFQM/Y+5/HxDmpylivSYsFm5DmY7cb/M1aLiY6zpMhm5xvPMuFJ
	 du7qaP3kj20LHaK70B/k18eIwL4u2BraalzKzaXYJOqnvJbAlWt8xO6qyEQQxaSiF9
	 /e5tdUEpfOb2FxRUwxYg57+q4Ssjchs8FoxPu8x4KwuFpnpP2KK6JIkM1UtrKOtpeD
	 9qE9fgKfQXt2Hmlif8sy/3+ZFEtvCk8SqEtMGBa91gCzYb0bfBFd8KpWgk6Ougax2W
	 355cBDPb5Kn6A==
Date: Wed, 29 Jun 2022 19:06:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [PATCH v6 24/33] arm64: proc: Mark constant as data
Message-ID: <YryUkPktE4y91YT5@sirena.org.uk>
References: <20220623014917.199563-1-chenzhongjin@huawei.com>
 <20220623014917.199563-25-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P6MsKGTe3yXRB9Q9"
Content-Disposition: inline
In-Reply-To: <20220623014917.199563-25-chenzhongjin@huawei.com>
X-Cookie: Booths for two or more.
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
Cc: linux-arch@vger.kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org, michal.lkml@markovi.net, pasha.tatashin@soleen.com, will@kernel.org, linux-kbuild@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, madvenka@linux.microsoft.com, rmk+kernel@armlinux.org.uk, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--P6MsKGTe3yXRB9Q9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 23, 2022 at 09:49:08AM +0800, Chen Zhongjin wrote:
> Label __idmap_kpti_flag represents the location of a constant.
> Mark it as data symbol.

Reviewed-by: Mark Brown <broonie@kernel.org>

--P6MsKGTe3yXRB9Q9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK8lI8ACgkQJNaLcl1U
h9B6PAf/aaMswfBfZqCl4lFNJ/9HZ08Oq69YuGWJbJRnkT0Nqg2IUosgF2RrqzyI
MKMvedor+mqwhYIvVGSMMpEYIwrXDGF7sf1DUyuRQpxrcEP6CU3dVufjDULs2EmX
Xo4l+IviwQ6uk7Q38SwgWLrRgd326jyEO/5VBvS3rP/+mR2+1iM57StFfUInhIaK
YCS9f3wYoLbHlzb0dCeJ1Kea1MyJI7CKVnupqu0GN+ympo8zlBXG0CyCDSKasJtA
Z279XpO6D18uveifHJXNM918owwsN3+T3X038R5X7MdLKJuHRivba+GAM0V4cPoX
LZUUWFg36GFY5588P82JROwGuWI5LQ==
=PRq0
-----END PGP SIGNATURE-----

--P6MsKGTe3yXRB9Q9--
