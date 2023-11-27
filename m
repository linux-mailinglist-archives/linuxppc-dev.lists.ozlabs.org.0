Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF37F96F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 01:58:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=lUHZ3bBD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdnJK2Hylz3cSM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 11:58:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=lUHZ3bBD;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdnHV1xHrz30hn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 11:57:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701046640;
	bh=II8fvvTebl5wXTs9nSR8kOFZ05zYuS72F34TwSUPL8E=;
	h=Date:From:To:Cc:Subject:From;
	b=lUHZ3bBDN9SyBT9RxrRmmb5xKgA5u3W/HxOjN7dV3h5gKREjzFw7FV5CcAAmi5mL6
	 oBEJ+ExvTmjv8trXTlZ62ktp7lk7+geue9gK1AD8MtHuj1jwoVEyI8BMDKYH9q0+kn
	 dYO2VVD3zKem4/1EBz/RbPf3r37N3a7SeqBKsLACBV4NF9oOqk9D3uK+20KANh6NlY
	 KjPuvOzLD1/qiSRDGRbnu0xRWf5tfSR+SSkm3FH/S2Eg8EWBpXdh1torwUDyJlWKO7
	 yiEFdXBwf0FOXSIBuAskyTUTY8sx+1rsgfSNWvUBlZUSsTxAENWDcRt6c243QtqdN+
	 J+2YjIe/b1w5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SdnHM6p67z4wcJ;
	Mon, 27 Nov 2023 11:57:19 +1100 (AEDT)
Date: Mon, 27 Nov 2023 11:57:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: duplicate patch in the tty tree
Message-ID: <20231127115718.7ad1701c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oQAv.DhzXwzFCqvxo+6.wSk";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/oQAv.DhzXwzFCqvxo+6.wSk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the powerpc tree as a different commit
(but the same patch):

  aa46b225ebbf ("tty: hvc: hvc_opal: Convert to platform remove callback re=
turning void")

This is commit

  f99c0e0d0859 ("tty: hvc: hvc_opal: Convert to platform remove callback re=
turning void")

in the powerpc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oQAv.DhzXwzFCqvxo+6.wSk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVj6W4ACgkQAVBC80lX
0Gy1/wf/ULmxrjVr+fgWd9sVztutaB0Ip1E1fEfjkOmSIrkxpttpKAzRlgE52fPj
lDZH50AEXW1NyH62UgTNZ2qa4nXvDopQqPvmC9Bne7yo6tcabdDZ9bk67W6bnrH3
92w0gea8whfiDiivrnxAd+wQ7YMDuIA870f7DS0AIax6/lj8JLaJTPGBNgyUtDIy
tyPGNo4auCrIiynAjiRqT3l7MYjLkjT3goAsgnJwNbMqTv7mCirAutum2DVHUHDG
ZRvUR06zoZUXs/Q1isAhgZU/Ltv/BFTXSnZOlC2MX6/MorbY/Lt954tGoTZJpXZJ
+Y1jyZuRLwIisfPrt8qmyIVfaxqVLw==
=5e0j
-----END PGP SIGNATURE-----

--Sig_/oQAv.DhzXwzFCqvxo+6.wSk--
