Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C42648FBD33
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 22:18:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YoZ0l1zC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv23n6mT0z3cbN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 06:18:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YoZ0l1zC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv2323GxKz3cYC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 06:18:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C013614E2;
	Tue,  4 Jun 2024 20:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DD4C2BBFC;
	Tue,  4 Jun 2024 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717532280;
	bh=hzO5VxyNboH0UxSA8oeS3DN/P0lxl1+qVDrF4lH35fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YoZ0l1zC3xE7XjFm6AyGqJGICJLDpBXsff7pMRSlEudgDhIe2FAqUIlZOHMrcDAr3
	 JFMzUTUWby1raWnTIk9qkVwqwtiz6/Z6smnBNReiuYlHT8eUSl0Z+Aqd5Gb2Mvh34S
	 wAKOpf6ZGKyFw6YsjI3fHnZC+rpMWQawCWhKqPCdn6EmlNin9YkQkOohgJvSm0Jfdq
	 EA1DmGUVMobN6eu67mYDQTP4RfwK6SHx4st2n6F8wStZwJn0RmP6KpiZmkZX3cYHhC
	 s3AwyJtNeSyuaNXCJfi8TiyYPNzftuerF7VkPZyKLtWbcx/eMh95QAsbx5XROxuYBO
	 Zsx5ZvhbZVrFA==
Date: Tue, 4 Jun 2024 21:17:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting
 preventive sfence.vma for new vmalloc mappings
Message-ID: <20240604-finalist-screen-c9f35b5cfc56@spud>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com>
 <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
 <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
 <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
 <20240604-dazzling-envy-1dcf111eb2c5@spud>
 <CAHVXubhy1yEKOx91gc9S++yKOoQa+sJ5EDSiMFwR6qepwzRMew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwD0Txngxq5MBoPY"
Content-Disposition: inline
In-Reply-To: <CAHVXubhy1yEKOx91gc9S++yKOoQa+sJ5EDSiMFwR6qepwzRMew@mail.gmail.com>
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


--rwD0Txngxq5MBoPY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 01:44:15PM +0200, Alexandre Ghiti wrote:
> On Tue, Jun 4, 2024 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Jun 04, 2024 at 09:17:26AM +0200, Alexandre Ghiti wrote:
> > > On Tue, Jun 4, 2024 at 9:15=E2=80=AFAM Alexandre Ghiti <alexghiti@riv=
osinc.com> wrote:
> > > > On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@byteda=
nce.com> wrote:
> > > > >
> > > > > As for the current status of the patch, there are two points that=
 can
> > > > > be optimized:
> > > > > 1. Some chip hardware implementations may not cache TLB invalid
> > > > > entries, so it doesn't matter whether svvptc is available or not.=
 Can
> > > > > we consider adding a CONFIG_RISCV_SVVPTC to control it?
> > >
> > > That would produce a non-portable kernel. But I'm not opposed to that
> > > at all, let me check how we handle other extensions. Maybe @Conor
> > > Dooley has some feedback here?
> >
> > To be honest, not really sure what to give feedback on. Could you
> > elaborate on exactly what the option is going to do? Given the
> > portability concern, I guess you were proposing that the option would
> > remove the preventative fences, rather than your current patch that
> > removes them via an alternative?
>=20
> No no, I won't do that, we need a generic kernel for distros so that's
> not even a question. What Yunhui was asking about (to me) is: can we
> introduce a Kconfig option to always remove the preventive fences,
> bypassing the use of alternatives altogether?
>=20
> To me, it won't make a difference in terms of performance. But if we
> already offer such a possibility for other extensions, well I'll do
> it. Otherwise, the question is: should we start doing that?

We don't do that for other extensions yet, because currently all the
extensions we have options for are additive. There's like 3 alternative
patchsites, and they are all just one nop? I don't see the point of
having a Kconfig knob for that.

--rwD0Txngxq5MBoPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl92cgAKCRB4tDGHoIJi
0jejAP4q4iC1BCvHT6xTV9Sna0UEFmTHPbvuyI/Dr8hN0BftCQEA2HLRmlNNqiPJ
abULfaYTpyjXRctzj8H5FL5kCUjY6gs=
=929z
-----END PGP SIGNATURE-----

--rwD0Txngxq5MBoPY--
