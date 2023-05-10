Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7236FD3FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:06:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGKfm4Pr5z3chV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:06:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=tx5lGLZB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGKdp4YQ5z3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:05:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=tx5lGLZB;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QGKdn1TVJz4x3p;
	Wed, 10 May 2023 13:05:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1683687918;
	bh=QroF8bh9U0WeAjMaejAfADav6vEy36poqnKHClMnMuw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tx5lGLZBb7JBw2yWi0j+YNlYXYQRMw5y4AABZYCwCHbZKpWhFTymKuu1BDL39sb8C
	 YsYycYJy7GqfWXhqaoB8NUV0iT9hnEORAnXiwmFosw+wPJCh2jRGpIRyOvy5VA/1Yc
	 RlB+aMkEC/rAaukiI4z+iH4Ae3TOKrN0z2AVSNXnkA8BzzQ2TOUSwEUoLAv11jDngt
	 HbD2AGEWzM1zLer6mIbp6vRKxbz3nVF1F4tTUDUUkjme/k5LbpLOVAyTq3LOdlMe5s
	 vPbcvRY91JFPAsTntyDo/6c8P4Xi84lasUkCfSXxM1l9c1bLbncyZU/COopRQNcFqe
	 aI2LXprS++Cww==
Date: Wed, 10 May 2023 13:05:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: boot warning
Message-ID: <20230510130515.5bd2e73e@canb.auug.org.au>
In-Reply-To: <ZFpnroBw-tJnyDbF@slm.duckdns.org>
References: <20230509122440.418068cb@canb.auug.org.au>
	<87mt2ex9oo.fsf@mail.lhotse>
	<ZFpnroBw-tJnyDbF@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sSVC3+1Rang__bXKLFAtY6E";
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/sSVC3+1Rang__bXKLFAtY6E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Tue, 9 May 2023 05:33:02 -1000 Tejun Heo <tj@kernel.org> wrote:
>
> On Tue, May 09, 2023 at 05:09:43PM +1000, Michael Ellerman wrote:
> > Stephen Rothwell <sfr@canb.auug.org.au> writes: =20
> > > Hi all,
> > >
> > > Today's qemu test boot (powerpc pseries_le_defconfig) produced this
> > > warning:
> > >
> > > [    2.048588][    T1] ipr: IBM Power RAID SCSI Device Driver version=
: 2.6.4 (March 14, 2017)
> > > [    2.051560][    T1] ------------[ cut here ]------------
> > > [    2.052297][    T1] WARNING: CPU: 0 PID: 1 at kernel/workqueue.c:5=
925 workqueue_sysfs_register+0x20/0x1f0 =20
> >=20
> > Caused by 59709bb84c22 scsi: Use alloc_ordered_workqueue() to create or=
dered workqueues. =20
>=20
> The patch is already dropped. It was applied only for a short window
> yesterday. Should be okay now.

Confirmed, the warning is gone.

--=20
Cheers,
Stephen Rothwell

--Sig_/sSVC3+1Rang__bXKLFAtY6E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRbCesACgkQAVBC80lX
0GwMjwgAoD4s8qBwKo4vlC6Bb8Ht4bgGBS4gcAXhRl6ltGV7Cskbx1qIYr4OMRA6
jn9WojQ1HxiFKOtQF/FFL+DvqSyKPw/H9XSwccmNRJSFKPgmmDcMfLIRIgWhGGhw
9RlY3a2GRrFynBHmGA4riczgeJwHFQApE7gPwqylsiSDRhnrjKG/B2c7bBeJ9oCf
A/vIrasXAu9PSUu0zk7zuCXLzKJ2vGbTXahuazaXxqOfwASedG4XkuUfjDxbRMga
1hFz6zpcE9QsfTlGD+ZynTevn0RMl/lowgf5BQ9G1gZBTcr3w4LpD89q7KeRJD0X
CWot8FRKgKk2jPBo+bFbt+36oHaszw==
=142R
-----END PGP SIGNATURE-----

--Sig_/sSVC3+1Rang__bXKLFAtY6E--
