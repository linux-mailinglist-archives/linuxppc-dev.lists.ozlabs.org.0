Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60818818A60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 15:45:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dehLBIGr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvfcN0T9Fz3cSv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 01:45:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dehLBIGr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvfbZ01fCz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 01:44:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 910E7B8179D;
	Tue, 19 Dec 2023 14:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A9EC433C8;
	Tue, 19 Dec 2023 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702997061;
	bh=Ec49Y1Ch4Y7DbynL5qJ3/M6jv5kHIuiLATbynFYdEYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dehLBIGr1LajE1OtvLVTLPVToTCjSzGsWdAe/pHVJeX2MIrC9m1mPTvooMTQrt3ta
	 7RGV4aXSoxoCh+Xnx0YICqWv36ry11nHS/nzEb8E87JqaOK6O/XvQtbWdjvWtFdlFk
	 Ax4IumnD102EC7x7VhIiWz1tdIygL5RL82izs263RsC/22KrDePCqEiQffo0bzg/fx
	 IH02+GzjOlMJyhx/ApVqSUrufavub2gGPQRrSNemUpbfH1eoTb1/7OlF+Izlp0YFig
	 o46oeV75pUDtP1526DL2IImMqbrWtaAdCOgm36G8fWwsiUQCOCxzS0D6au1TxDVNBI
	 BlUl90OFPwCbA==
Date: Tue, 19 Dec 2023 14:44:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v4 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <20231219-twitch-many-ca8877857182@spud>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-6-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s/6JoYHenWk4BZK6"
Content-Disposition: inline
In-Reply-To: <20231213055747.61826-6-bhe@redhat.com>
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--s/6JoYHenWk4BZK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 01:57:45PM +0800, Baoquan He wrote:
> Then when specifying '-d' for kexec_file_load interface, loaded
> locations of kernel/initrd/cmdline etc can be printed out to help debug.
>=20
> Here replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.
>=20
> And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
> because loaded location of purgatory and device tree are only printed
> out for debugging, it doesn't make sense to always print them out.
>=20
> And also remove kexec_image_info() because the content has been printed
> out in generic code.
>=20
> Signed-off-by: Baoquan He <bhe@redhat.com>

I'm sorry - I meant to look at this several days ago but I forgot.
Apart from the typo that crept back into $subject, this version explains
the rationale behind what you're changing a lot better, thanks.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--s/6JoYHenWk4BZK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYGsQQAKCRB4tDGHoIJi
0m1fAP9g+8AFIV/8mpsN7yszSR98AoukUk319L4Cyd7Ffhkl6wEA7poQh+JBuAOa
YQJL75j4TedEPF5Y6iyMMP3w1MeKMAs=
=JnLd
-----END PGP SIGNATURE-----

--s/6JoYHenWk4BZK6--
