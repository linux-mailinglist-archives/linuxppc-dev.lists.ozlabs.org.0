Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F5028E972
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 02:20:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBVL71D7JzDqX9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 11:20:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBVJQ0J3LzDqVC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 11:19:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=ik7VxBvm; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBVJK6H5dz9sT6;
 Thu, 15 Oct 2020 11:18:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602721141;
 bh=Mb2bFDMqNicXNfC4Ps43K7SfZoXJq9Lfw7aztaE6atg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ik7VxBvmeMXfqSGhAW8lWf8cRG/yithYAwWRPa6YI/JKJ/f4+z1s4yMujMzFdXWp7
 nkwGUqiNoJV16swjd+4OYVmKYsADXp7/7HTKFgEfg4suAukZm1imym1Ic+WDNUDhnq
 YDYrFW+coLLSgoSZeJbfwG7RVmc9839VX/D/ODGhNe0B6eBTTKV0naWAmjmwfpkQy6
 XcXeOfvlUEY00cKnybz3hRQpNV/TmoMml3gZtVURHnOWaxlqsOJUCqXaagTOA2L8z9
 9AZ9CIIDZXf2NZjvGDpNrnVFbDKm+ZNdi6vGndbF4sqgxUi79cplQSfUdpAgu5quDj
 AfsTdaKkHRwSQ==
Date: Thu, 15 Oct 2020 11:18:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH -next] Revert "powerpc/pci: unmap legacy INTx interrupts
 when a PHB is removed"
Message-ID: <20201015111857.3a197732@canb.auug.org.au>
In-Reply-To: <CAOSf1CFT_Y67Q8caH2uFOYtwpRgFozh30ZWWZzzR-x18LBsG8g@mail.gmail.com>
References: <20201014182811.12027-1-cai@lca.pw>
 <CAOSf1CFT_Y67Q8caH2uFOYtwpRgFozh30ZWWZzzR-x18LBsG8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F8wNrQpMx3RT1ZliEaacCX9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>, Qian Cai <cai@lca.pw>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/F8wNrQpMx3RT1ZliEaacCX9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Thu, 15 Oct 2020 10:00:49 +1100 "Oliver O'Halloran" <oohall@gmail.com> w=
rote:
>
> On Thu, Oct 15, 2020 at 5:28 AM Qian Cai <cai@lca.pw> wrote:
> >
> > This reverts commit 3a3181e16fbde752007759f8759d25e0ff1fc425 which
> > causes memory corruptions on POWER9 NV. =20
>=20
> I was going to post this along with a fix for Cedric's original bug,
> but I can do that separately so:
>=20
> Acked-by: Oliver O'Halloran <oohall@gmail.com>

I added that to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/F8wNrQpMx3RT1ZliEaacCX9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HlXEACgkQAVBC80lX
0Gzl4ggAjsFTjV/ekYiFVurllVs8uhLgiJiyX9kc2/avzMyjh4YlPjJaamjMQq0A
QkosvP4MD+YceuyeCtP813DCfhvfp/QY2uMLWeaUPVTn3V8FvtQ3lxIECpq/m3KY
F6ruVH65ndcsJu1Z+da5+3/g8JiPBIrED00G/rOT4RmfBLLng41G7OfJGUDqOrtk
8WR7MCNqk1neiJMPdXMOe5IohTDW33yoxaiFWNZO9IuNzcHRuYHJ1xP1MG7m2SSA
Kdwn+L4Rrm//cW00kRZOBV3S5Y+GvCFTiR7N2RpsA/b/4+H4oDU6JeOmpZYl3ugO
uk1Vb2NnlTf9AaPBmccafR4mAe5MFQ==
=vTaC
-----END PGP SIGNATURE-----

--Sig_/F8wNrQpMx3RT1ZliEaacCX9--
