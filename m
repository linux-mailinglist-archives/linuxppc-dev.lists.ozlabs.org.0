Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2EF5607AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 19:48:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY88H1kg9z3dqP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 03:48:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IMOpHA3y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IMOpHA3y;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY87d6d7nz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 03:47:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 253ED61E73;
	Wed, 29 Jun 2022 17:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09DBC34114;
	Wed, 29 Jun 2022 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656524873;
	bh=V3NiNsBcMZHTm4MZ/mGYgmF4F0lBLTpyGX8FhxIQa2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMOpHA3y8dcD+7fwzHMEX/O8YiPB7pCyyOsIF82euERziVPngaXWEEmoYWc8EBkIz
	 lAY8jAcfNPjU3BQcToZ0A5kdMJhR5sEn0iZNB1D3JT71ZT3HCXR5wzxOCiEaL8mDOU
	 Ay52XukcdG7Ohbx+xY1Ex2j1dWJrva7urobJjrrrvuxje/Ufo2itTCkeupso8E/l+0
	 W1MiVBgy59CtIHfzs5Y1RZ1r8yJYbblZGaOO1r742V1GlutWT2aUrSeJ0rP/t0Bfma
	 ndInlhgtwxkMmUUA1F+Esfreu/3UypT4YPpHCoBNUf4bvWjeHHB5WKMPIlT3zp8LGG
	 Dx4YnuN9wZI1w==
Date: Wed, 29 Jun 2022 18:47:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [PATCH v6 18/33] arm64: Change symbol type annotations
Message-ID: <YryQQlQga2wtWqv9@sirena.org.uk>
References: <20220623014917.199563-1-chenzhongjin@huawei.com>
 <20220623014917.199563-19-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZpDaJFJQME505rUf"
Content-Disposition: inline
In-Reply-To: <20220623014917.199563-19-chenzhongjin@huawei.com>
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


--ZpDaJFJQME505rUf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 09:49:02AM +0800, Chen Zhongjin wrote:
> Code symbols not following the aarch64 procedure call convention should
> be annotated with SYM_CODE_* instead of SYM_FUNC_*
>=20
> Mark relevant symbols as generic code symbols.

> -SYM_CODE_START(tramp_exit_native)
> +SYM_CODE_START_LOCAL(tramp_exit_native)
>  	tramp_exit
>  SYM_CODE_END(tramp_exit_native)
> =20
> -SYM_CODE_START(tramp_exit_compat)
> +SYM_CODE_START_LOCAL(tramp_exit_compat)

The commit log says this is fixing things mistakenly lablelld SYM_FUNC
but this bit of the actual change is making some symbols local.

> -SYM_FUNC_START_LOCAL(__create_page_tables)
> +SYM_CODE_START_LOCAL(__create_page_tables)
>  	mov	x28, lr
> =20
>  	/*
> @@ -389,7 +389,7 @@ SYM_FUNC_START_LOCAL(__create_page_tables)
>  	bl	dcache_inval_poc
> =20
>  	ret	x28
> -SYM_FUNC_END(__create_page_tables)
> +SYM_CODE_END(__create_page_tables)

This is removed by Ard's recent refactoring, the others that are still
present look valid enough (for things that don't use the stack IIRC they
could be seen as conforming but equally this is all running in non
standard environments).

--ZpDaJFJQME505rUf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK8kEEACgkQJNaLcl1U
h9AGMAf+JHAAJDfJo61ZFJglFeCtkipmbBLs8jW0KplnUBrU3Imx5m43AH8w8mWn
xbpZ5FoAVoIGkkpMrsi3V+FZ0CPLdoTWO+bsq9Un1N3VwjzjSSRjd8iuaMa0dEQ4
sqhM4VH9ZVYIDbt4RVw0z5dcwPNgIEO157D2sGMcPTG0shsbzHXnZtLgZ6Sr/EE1
35Y4kRTYprFpjfc0b7fPQKSaJ7HpqrjOSiaFLlD24EKKueEotB03suT67wVaGYOs
XVkFGA+XYW5l1FN+SDzobyVBQo+li/aLFgKbnjt4TSYmP3fEmqQ0FWaNpNncxqps
PZ7yT8RtfHUN8Qv5eNYa7G+v+O5Wkw==
=mASi
-----END PGP SIGNATURE-----

--ZpDaJFJQME505rUf--
