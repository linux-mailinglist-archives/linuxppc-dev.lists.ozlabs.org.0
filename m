Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166A350CE0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 05:04:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9p1h0MQhz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 14:04:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=QLqhXbwo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=QLqhXbwo; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9p1D3kSbz2xy8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 14:04:00 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9p1C0yjmz9sX5; Thu,  1 Apr 2021 14:03:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617246239;
 bh=LsRo4RCfK4SgaqyQ4QrrXxeiSUCHlcc5rCwtktXpUM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QLqhXbwor4pIONs/3gFl+m9buGNDd6IspClb/3Mn52RLTSJ4iCa3sNRkQ45fK5IbQ
 5zXecJje2ry2jpYtx2Pbfa5YZ+83cCkqm2h6Q4pSPyvaWYr8EQpxnf0YOfSSZ9ZR9b
 8hO4ks9S8MCM+Qcz9uXm3p1WrYd0nY3F8h9y0RN0=
Date: Thu, 1 Apr 2021 13:49:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v3 1/9] powerpc/xive: Use cpu_to_node() instead of
 "ibm,chip-id" property
Message-ID: <YGU0u4v2GVWBCrWw@yekko.fritz.box>
References: <20210331144514.892250-1-clg@kaod.org>
 <20210331144514.892250-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GRUBHJCUKunfo+Bk"
Content-Disposition: inline
In-Reply-To: <20210331144514.892250-2-clg@kaod.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--GRUBHJCUKunfo+Bk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 04:45:06PM +0200, C=E9dric Le Goater wrote:
> The 'chip_id' field of the XIVE CPU structure is used to choose a
> target for a source located on the same chip when possible. The XIVE
> driver queries the chip id value from the "ibm,chip-id" DT property
> but this property is not available on all platforms. It was first
> introduced on the PowerNV platform and later, under QEMU for pseries.
> However, the property does not exist under PowerVM since it is not
> specified in PAPR.
>=20
> cpu_to_node() is a better alternative. On the PowerNV platform, the
> node id is computed from the "ibm,associativity" property of the CPU.
> Its value is built in the OPAL firmware from the physical chip id and
> is equivalent to "ibm,chip-id".

Hrm... I mean, for powernv this is certainly correct, but seems to be
relying on pretty specific specifics of the OPAL / chip behaviour,
namely that the NUMA id =3D=3D chip ID.

> On pSeries, the hcall
> H_HOME_NODE_ASSOCIATIVITY returns the node id.

AFAICT, the chip_id field is never actually used in the PAPR version
of XIVE.  The only access to the field outside native.c is in
xive_pick_irq_target(), and it only looks at chip_id if src_chip is
valid.  But src_chip is initialized to XIVE_INVALID_CHIP_ID in papr.c

So it would make more sense to me to also initialize chip_id to
XIVE_INVALID_CHIP_ID for PAPR to make it clearer that it's not
relevant.

> Also to be noted that under QEMU/KVM "ibm,chip-id" is badly calculated
> with unusual SMT configuration. This leads to a bogus chip id value
> being returned by of_get_ibm_chip_id().

I *still* don't clearly understand what you think is bogus about the
chip id value that qemu generates.  It's clearly not a problem for
XIVE, since PAPR XIVE never uses it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GRUBHJCUKunfo+Bk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlNLkACgkQbDjKyiDZ
s5LhWxAApJbKhZYuYbAAT6uKDEabGUgTWiSOh8/Osz9xfA/ycn30u4drhQwNeZN5
whNX3kQbM/NIkzXjNDgcdRGNsroKDTxX1L+tdD1eKPIHxORoO0l6aSHuILzdh1HF
EVM8sQKAU0SN8LFZZAjB/dYEfpmWD7uhy1XOls3DJYn3xWhaBxX2MVZ4RhAEgqKM
B6o75EZz5bPVpGG0PpI7+ifiVkhhNHp5RGZn1YY01f/HbDQYu4V2R5jDMJWUv1Pc
Qnq30qR7gyDyqPFAOqw8ulh7YtHP5L6RZBe07cMMIx/XCREYexx/W5MDEhlmpHaW
Tyh6vlepbo9KKJ5wLj1OS+PJHv6eCagqPGuQzhh8bgcd6KG019TtJ7m1v2SZ9ooj
X/X/H8t1ryb1sWY3aJF5hYExNG4oXLhWTrDxxiuXSPcbyi5Em09C37ahiqVTkB/h
2d2aRXWuByH9xz9dsB6yhP2lD8y1zVSdeQt4HCFO6Ql9vQ+SJFmWPMsW7ANtNxAl
sOrMh5Ue308iWJX3nkULK/2i38vPW6nkiPc0jCJJhjg9iR0vFVMKhM3cPW585zVY
TIMh57GDcstvDgdc+bLRo+z0p5szdbYuMhQ+Kd6+kQ/a0mmRpoERZd9JFBuCKkQC
x20VY7TeuvJThV2BnOOEsfHBWzWzKUaDWv4ycuke3MXlMRFc+00=
=ZyWV
-----END PGP SIGNATURE-----

--GRUBHJCUKunfo+Bk--
