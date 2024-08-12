Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615DF94E64F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 07:55:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ndwopYUx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj3dS2GB9z2yGY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 15:55:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ndwopYUx;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj3ch5VDGz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 15:54:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723442068;
	bh=mockAaWkQTC7H3uI5B5E3UqBql0Dd45SEDNasO/R4bQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ndwopYUx4RQ8lsLGCrCeVs3gwszqzpkFDvyTJ2AqFxrM+EkBYhqbn0rXbOHzxU9mt
	 Wa++ITRGD4GzM6KDC3tdrlwvFDTAsIGdisbCe4jvk9DDvHV7fIz4kntE5qTpHbpOv2
	 SeHyiglRFYs5pXOp1DGH98w3STBQGyXkEWC9TV3YOedIoDeRPJYAhrfcmMixRg07KN
	 Hcssr18lzH/DWAlRQo7LQMxG2VXLUPmz8imnv4UQHq+HUHz7ZBwRY5kMNQIXj4HWcq
	 0Q3uE+JyurNK+3aswuotNbG7bqtuswcMmvqpC/6LQRMeNfONvY69BKrKzpTIDZe7Hd
	 UBNyiY6UYiT0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj3ch3Mvwz4x3J;
	Mon, 12 Aug 2024 15:54:28 +1000 (AEST)
Date: Mon, 12 Aug 2024 15:54:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: List change - munging for From addresses
Message-ID: <20240812155427.14dc2281@canb.auug.org.au>
In-Reply-To: <20240805-honored-weightless-kangaroo-71e79e@lemur>
References: <20240802130347.383a1b49@canb.auug.org.au>
	<20240802-agile-manipulative-dog-df4487@lemur>
	<20240805124204.49ed65df@canb.auug.org.au>
	<20240805-honored-weightless-kangaroo-71e79e@lemur>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G4tjdXRnd7d3NJfp.=IhCGh";
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
Cc: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/G4tjdXRnd7d3NJfp.=IhCGh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 5 Aug 2024 10:54:17 -0400 Konstantin Ryabitsev <konstantin@linuxfou=
ndation.org> wrote:
>
> > So, an alternative for us (though considerable more work) is to change
> > mailing list software.  Mailmanv3 would be an option, but seems overly
> > complex.  I see vger.kernel.org is now using mlmmj - is that a
> > reasonable option for us (i.e. is it able to not modify messages but
> > still have enough features)?  If so any hints about migrating? ;-) =20
>=20
> I'd say that mlmmj has a very different approach than mailman -- it expos=
es
> very little to end-users and list admins. Any changes to the list
> configuration must be made by server admins, which can be seen as very
> limiting by someone used to how mailman does it.
>=20
> However, it *is* a great option for running mailing lists that process
> patches and couples well with public-inbox for archiving. It also require=
s a
> fraction of resources of mailman-3.
>=20
> If you want to be able to have a more hands-off approach to your mailing =
list
> management, with a fancy UI and lots of list admin tunables, your best op=
tion
> is Mailman-3. If you want a "mean and lean" option, then mlmmj is the way=
 to
> go.

Konstantin, thanks for your advice.

Munging the From addresses did not give wonderful results (among other
things it would make searching the archive a more conplex operation).

So, I am going to try "mean and lean" (since I am the owner/moderator
anyway).  Shortly (i.e. in the next hour or so), I will switch the
linuxppc-dev mailing list to use Mlmmj.  Hopefully this will fix all
our problems with DKIM/DMARC and delivery of posts from some domains.

For the subscribers, to see how to manage you subscription, you will be
able to end an email to <linuxppc-dev+help@lists.ozlabs.org> for
instructions.  Hopefully you all won't find it too restrictive.

Please report any problems with the list after the change to me.

--=20
Cheers,
Stephen Rothwell

--Sig_/G4tjdXRnd7d3NJfp.=IhCGh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5o5MACgkQAVBC80lX
0GxqLgf6A8xuO4jXN7tBeZXkzrS2Jie1V54hB76VJ79XY4J20esJ1WJ2pmHKvgRp
C3Jt84LpksaZVbr0WAX/iVBU4/5jNnulUjtKvqs8tcyiSfte0fgKi2Ph7EhCu+8t
8hwAOp9w5t0UgnvwkhibZOhMhjAAAT5FT2Z+lWf6M1daTykG11CRlggx+2yZxvqc
D/CP2sQBUZRZ1nSc715P46LDbuIUb7ZHgkjZU01yB12MmUJ3OENzgiMbYaHOKKDa
GppdPZ6ODjIzGSu7k0jiCx0cvZ2SUd/N9201Go/SgFFNU4elLX+aa1DJ5xK3Tbrb
ufMY2Mw966bSinJuXctxJrhlqOHwOQ==
=S18L
-----END PGP SIGNATURE-----

--Sig_/G4tjdXRnd7d3NJfp.=IhCGh--
