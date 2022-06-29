Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 112FA5608F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:21:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY8t16s1Pz3cgS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 04:21:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lzO9y7zH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lzO9y7zH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY8sR4wPJz308b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 04:20:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34A3961F72;
	Wed, 29 Jun 2022 18:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF68C341C8;
	Wed, 29 Jun 2022 18:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656526840;
	bh=nqSjfUA+dAlFCv0ZmKlAaLfQaMfV+8ezW1LJols1QmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzO9y7zH2weaXPqzPTfVxv9v/dgk8YFAbETnafA7dcsvYugkUndxTfWbimV4oJ9Q4
	 IVs3Hei0d9svIuhhcp5Y4StutrXxYbqWPC4Dz35Fu4miJxY+W3rvdMumwhjRtdEZiY
	 IQlAIPz7x+aoJodUIY1hGLKJ7WpCPq6jnNY1J5gM+4cmKrhRQphxbId50N3EpCMpOi
	 Zx3etyFzG2e3dOQZhaPFO1FID9+jzKMdpUJIUQE7VJMrNUoCbjJOlNU65xkLsGsFs2
	 iUpzvtZMX7PRST2eHbNwM8E0mnOqoBVH7/DM7a3CdEzME4DD/2W00igPsPBDS5ZViJ
	 rJzII8ANN6wGw==
Date: Wed, 29 Jun 2022 19:20:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [PATCH v6 25/33] arm64: crypto: Mark constant as data
Message-ID: <YryX8YuklTNOxHLQ@sirena.org.uk>
References: <20220623014917.199563-1-chenzhongjin@huawei.com>
 <20220623014917.199563-26-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u/A/Sno6bNlTKyUB"
Content-Disposition: inline
In-Reply-To: <20220623014917.199563-26-chenzhongjin@huawei.com>
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


--u/A/Sno6bNlTKyUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 09:49:09AM +0800, Chen Zhongjin wrote:
> Use SYM_DATA_* macros to annotate data bytes in the middle of .text
> sections.
>=20
> For local symbols, ".L" prefix needs to be dropped as the assembler
> exclude the symbols from the .o symbol table, making objtool unable
> to see them.

Reviewed-by: Mark Brown <broonie@kernel.org>

--u/A/Sno6bNlTKyUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK8l/AACgkQJNaLcl1U
h9D5Pgf7B/qfGxLr9uSqDv8qyhbmyiDLJ2+YriTI2XDfxjIfIzQQ4Lt2OJ9Dl5G7
pVJbkoLdC55nSb6tJLEfo6tYc5I0G2w0td71/S6QdS/wzF5YnV1ozxIlGKtfYrCp
TPIJdmEKMS4pRfQ7y7sZ8avQutX0FqBek8SmXq/3/3mEmIFugCksFJ9hcrEwEyfS
1TN9uG3QFIsLzGbBPk79XVgaZtXJYKpzaI+TfVDhed+JDLH+dgrZ5OcTZALUGkE3
Ce+IRnLuLOAem14V32LufZG4/Hoaiguxtq2UoY2dAb1fUff9kaGZmSFmTjyQPakJ
6C5y+X+n2vyUP503CA6vUVnKgIV52Q==
=BxDC
-----END PGP SIGNATURE-----

--u/A/Sno6bNlTKyUB--
