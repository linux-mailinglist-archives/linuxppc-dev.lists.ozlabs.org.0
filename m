Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1013CD56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 20:44:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yd803JSxzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 06:44:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yd5l18BMzDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 06:42:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=u77Uk0DS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47yd5j6ljMz9sR4;
 Thu, 16 Jan 2020 06:42:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1579117370;
 bh=8Gx4/YIMzIE3Xfy6xCjvTA+74BEPwCjkRJGdRUP69tQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u77Uk0DSBsTcK/o/zsZ5otRLkQ2Xmz20Ezav5Xd4fW41MwUM4v+5Rps5UZ1y2QvCF
 R9avvvBZPeMMl4zC2iakVGP8BQ8ocjaAIcgDdGGS5ncSXbp5CKOaGpmHzNdFBv6aVd
 XQSVZlctAJMgevjrXSTgCVhhYIgUViCbx0DkK8uJkL88yy0xFpSim2yJNAHDPp74qh
 YstraOcXJ3kaSlmGWQ74OUylDde2cUQIy+j4QFus1e7F5O20ZByvG3avszIpCc94Mi
 9R2He+Wd99s9UQloDkkGIJlq3ma9s8SV35LByyONfiyrl8NIemhZGthl0j3/AT4BGE
 u5hg3zk89HhYA==
Date: Thu, 16 Jan 2020 06:42:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Message-ID: <20200116064234.7a139623@canb.auug.org.au>
In-Reply-To: <1d8f8ee6-65ac-de6c-0e0b-c9bb499c0e02@kernel.org>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
 <20200114173141.29564b25@canb.auug.org.au>
 <1d8f8ee6-65ac-de6c-0e0b-c9bb499c0e02@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fEu+R81zMT.aoFY1B7ytDKr";
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
Cc: b08248@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, york sun <york.sun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>, swood@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/fEu+R81zMT.aoFY1B7ytDKr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Timur,

On Wed, 15 Jan 2020 07:25:45 -0600 Timur Tabi <timur@kernel.org> wrote:
>
> On 1/14/20 12:31 AM, Stephen Rothwell wrote:
> > +/**
> > + * ev_byte_channel_send - send characters to a byte stream
> > + * @handle: byte stream handle
> > + * @count: (input) num of chars to send, (output) num chars sent
> > + * @bp: pointer to chars to send
> > + *
> > + * Returns 0 for success, or an error code.
> > + */
> > +static unsigned int ev_byte_channel_send(unsigned int handle,
> > +	unsigned int *count, const char *bp) =20
>=20
> Well, now you've moved this into the .c file and it is no longer=20
> available to other callers.  Anything wrong with keeping it in the .h fil=
e?

There are currently no other callers - are there likely to be in the
future?  Even if there are, is it time critical enough that it needs to
be inlined everywhere?

--=20
Cheers,
Stephen Rothwell

--Sig_/fEu+R81zMT.aoFY1B7ytDKr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fayoACgkQAVBC80lX
0GxhZAf+L34+ire+x19TOcW6lI7tewG/xsALu6gv2v8vHLefNL+V2Ftje/4Rek+K
yTVlkuS+BOHE695Wr8wSMABD6IKnee6wTKofkffj3HZFA0CeT2kg+FwnVEZ/RAqw
bLwAZg6+g6CjC70WpgWKT7k/OM/q1acKWOmplfve93siNHIeIFcTaBpwERdM8SnF
swO0u7AvK3kKI5VD4wUCo37KtALh1IneWKFNONk60dAAAeLpmNjB7tfeMBabJRhT
+aTkGb9cjqhGWCQvhLsVJRw7DD/GBkfu4xQCxjQV4NzkNMi2wZM+2SvR3x91PDrb
dm5aoERjXi8qCyVUupzgAnAN4q1AjQ==
=ujEB
-----END PGP SIGNATURE-----

--Sig_/fEu+R81zMT.aoFY1B7ytDKr--
