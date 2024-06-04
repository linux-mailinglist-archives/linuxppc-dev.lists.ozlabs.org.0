Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5238FAE04
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 10:52:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mh20iy/f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtkr83GZgz3cWk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 18:52:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mh20iy/f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtkqS0shmz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 18:52:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 369AD6121A;
	Tue,  4 Jun 2024 08:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02151C2BBFC;
	Tue,  4 Jun 2024 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717491121;
	bh=X5VEKcXjsckL7bzsB4I2+5w7z1/yIThVP4y03Rift7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mh20iy/fPgoKsPFqkHOMkSvPPs3YobSnTzSECvBMzNm1M8s6vO83AlQC6ilY4EOTy
	 8sOXH1quEckXBhwBGWJj3cHU+7AJwHqGK3p8fjuVfk/jjnSzsPPyPutWZjpiLaoAyt
	 gCdMIRxqqGOm0zxE4aSYMab0Wodh06NeE+MsysKpcDwBDbIlcnfS/wkLiVdVzhzICG
	 4UjcQOTTx+aFwRJE1QaD8Cvt4dl3qLXOUDKmxsy7E1fx9TesQtzL9Q+NmezjMQehNS
	 0WMvz7jO6i8duGQNOX4hQOm+ZTVOc7wkWM1vHVgf8whVZyCCBz2ju8SWZpi8Hlqbp4
	 o2gZF74Dfgnvw==
Date: Tue, 4 Jun 2024 09:51:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting
 preventive sfence.vma for new vmalloc mappings
Message-ID: <20240604-dazzling-envy-1dcf111eb2c5@spud>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com>
 <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
 <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
 <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v+mLtQDAp6jKleQy"
Content-Disposition: inline
In-Reply-To: <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
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
Cc: linux-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Matt Evans <mev@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, yunhui cui <cuiyunhui@bytedance.com>, Ved Shanbhogue <ved@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Dylan Jhong <dylan@andestech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--v+mLtQDAp6jKleQy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 09:17:26AM +0200, Alexandre Ghiti wrote:
> On Tue, Jun 4, 2024 at 9:15=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosin=
c.com> wrote:
> > On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.=
com> wrote:
> > >
> > > As for the current status of the patch, there are two points that can
> > > be optimized:
> > > 1. Some chip hardware implementations may not cache TLB invalid
> > > entries, so it doesn't matter whether svvptc is available or not. Can
> > > we consider adding a CONFIG_RISCV_SVVPTC to control it?
>=20
> That would produce a non-portable kernel. But I'm not opposed to that
> at all, let me check how we handle other extensions. Maybe @Conor
> Dooley has some feedback here?

To be honest, not really sure what to give feedback on. Could you
elaborate on exactly what the option is going to do? Given the
portability concern, I guess you were proposing that the option would
remove the preventative fences, rather than your current patch that
removes them via an alternative? I don't think we have any extension
related options that work like that at the moment, and making that an
option will just mean that distros that look to cater for multiple
platforms won't be able to turn it on.

Thanks,
Conor.

--v+mLtQDAp6jKleQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl7VpwAKCRB4tDGHoIJi
0htmAP9lKpWaps7KNiXD+LLzGjaogNRPLVfDE+cLSH8OGRjL0gD/b1+iNEj7/u9+
OImeR7875AIcwdnxddUdj3oiiMB/6AA=
=s00j
-----END PGP SIGNATURE-----

--v+mLtQDAp6jKleQy--
