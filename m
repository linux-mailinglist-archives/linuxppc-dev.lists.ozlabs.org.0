Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEDD56086B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:04:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY8Vg0l7Zz3dqY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 04:04:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H4IkTUxr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H4IkTUxr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY8V60btCz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 04:03:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA10161EE8;
	Wed, 29 Jun 2022 18:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25845C341CE;
	Wed, 29 Jun 2022 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656525835;
	bh=X0lazoB/Z2MYUFHBDjBytVc24hgG/ZXx4i5otGwBfoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4IkTUxrQFu5SHS5PzCTCg6LwFu3XOeHjWU9b6CAk0quliFmv60Qa2ariCBLyRkft
	 +QTuSoGhm0ItBd5Y0fLUZxee+gBOS1lYyo2aUlWr3Q8IgDhNLf87WqljhT/otFdqjo
	 FvhbI4dxyI7VZnTFhUXc4ygcYdlnjVn1JeVdFbEx4QeBWmysbIGHAZ5QidjGPgbiya
	 eS7kqhkaNGFDxG4/wDnBx5fjlPcZfeK3VfL1heosKkJnuUR8ZFl8nlJdX56HAllBgu
	 t5P5g70lNCKb4MGGoP1ZxPVRCBLtRg9+utzWDq78odTzxxI/EEVBeef2BLm0IbYHBM
	 n4wWkmFlVDDRQ==
Date: Wed, 29 Jun 2022 19:03:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [PATCH v6 22/33] arm64: efi-header: Mark efi header as data
Message-ID: <YryUAwncG4HxYj16@sirena.org.uk>
References: <20220623014917.199563-1-chenzhongjin@huawei.com>
 <20220623014917.199563-23-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+zerKURaNsufg6f"
Content-Disposition: inline
In-Reply-To: <20220623014917.199563-23-chenzhongjin@huawei.com>
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


--/+zerKURaNsufg6f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 09:49:06AM +0800, Chen Zhongjin wrote:
> This file only contains a set of constants forming the efi header.
>=20
> Make the constants part of a data symbol.

Reviewed-by: Mark Brown <broonie@kernel.org>

--/+zerKURaNsufg6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK8lAIACgkQJNaLcl1U
h9DPEwf9HDG0IEnpXpPCsIe7firj70KJ0V4dHDhlPkEtzQBmCkYZaFZeKRYuwn3M
/BExp1Vfbc7ZEtyJrJ0Eli9tfs7nGbtC5glpAUUfmEq7ON7zPSk1n6PPs96AcVas
baEDSryZwzdp1TCUM5wNAu/SbiYrij1vk/ZKcgFP34DH9/4azPrDe8mDtSlNlgjd
0XQX1wmDnz1vR2LpvRczLNoecUrDcMA5xcC1wKybdVGQfAR7bTob34b3VNisnfJw
mBNKrPsfVtpWDISKvrK1Uqk2WUgUr6y2gPG8kg9Y4+JbOUaoJIsf1kSomQjMcC6T
gloXVcN87nUaYA8CfQcfAvkOb3HeJg==
=MLL2
-----END PGP SIGNATURE-----

--/+zerKURaNsufg6f--
