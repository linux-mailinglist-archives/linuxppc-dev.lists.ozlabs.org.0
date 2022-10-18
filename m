Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC45D602893
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 11:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms87q5RbMz3bjW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 20:43:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=neutral (access neither permitted nor denied) smtp.mailfrom=denx.de (client-ip=46.255.230.98; helo=jabberwock.ucw.cz; envelope-from=pavel@denx.de; receiver=<UNKNOWN>)
X-Greylist: delayed 482 seconds by postgrey-1.36 at boromir; Tue, 18 Oct 2022 20:43:19 AEDT
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms87C6hZCz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 20:43:19 +1100 (AEDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 8F19B1C09D8; Tue, 18 Oct 2022 11:35:10 +0200 (CEST)
Date: Tue, 18 Oct 2022 11:35:09 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.10 04/16] powerpc/hw_breakpoint: Avoid relying
 on caller synchronization
Message-ID: <20221018093509.GB1264@duo.ucw.cz>
References: <20221018001029.2731620-1-sashal@kernel.org>
 <20221018001029.2731620-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <20221018001029.2731620-4-sashal@kernel.org>
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
Cc: Ian Rogers <irogers@google.com>, Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Marco Elver <elver@google.com>
>=20
> [ Upstream commit f95e5a3d59011eec1257d0e76de1e1f8969d426f ]
>=20
> Internal data structures (cpu_bps, task_bps) of powerpc's hw_breakpoint
> implementation have relied on nr_bp_mutex serializing access to them.
>=20
> Before overhauling synchronization of kernel/events/hw_breakpoint.c,
> introduce 2 spinlocks to synchronize cpu_bps and task_bps respectively,
> thus avoiding reliance on callers synchronizing powerpc's
> hw_breakpoint.

This is preparation, not a bugfix, not sure why it was picked for
5.10.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY05zTQAKCRAw5/Bqldv6
8hDCAJ93uULfn3AoJWhDD3Cg+mHOSVqtLwCeL4eiZsmL+Ra5uL3L03wLx5hvocg=
=NwNt
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
