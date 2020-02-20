Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C7166B37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 00:58:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ns4649XVzDqfV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 10:58:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Ns2j0zKSzDqZB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 10:57:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=RZ2aMDVr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Ns2g4jDMz9sRR;
 Fri, 21 Feb 2020 10:57:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1582243036;
 bh=V8qEeao60i8XnCSQ/mKGsp0NMVZHYJxJle5OdSEx3II=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RZ2aMDVrX8i/iS1ljA9sOWG2HUgEOjoBiDRuegXIohUL8qbfNXLIwpvvsc4wph+xk
 BTbOdm/AhYgcDG6ApPG3SXGzX+mIGDIKNyrulqUhSq+BzuhF97ErKLeiDmvWCT5JS2
 SRbOCgZrC+wHtMK6N9Wx9PZEslx1KPLWqtaq6aPrK+D7KVNsrc0l+ydRnhG1WHYbvk
 e+XwsI8BS8Kpoc0np8DuQJZqWEwI98SnwBwFVjEUjvqx1SHMdH+sCf5zDEP7/r4iMZ
 qDCw2/cs0APYl4vmdgbnYjTZ4ceA9P41BXOQCrdczMe9IOevQ3J5laPhOpdyUaDBbI
 +OGUeF27l3adg==
Date: Fri, 21 Feb 2020 10:57:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Message-ID: <20200221105715.35c1d2e8@canb.auug.org.au>
In-Reply-To: <20200116113714.06208a73@canb.auug.org.au>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
 <20200114173141.29564b25@canb.auug.org.au>
 <1d8f8ee6-65ac-de6c-0e0b-c9bb499c0e02@kernel.org>
 <20200116064234.7a139623@canb.auug.org.au>
 <9f3311d12d418b87832ba5de1372bb76ffccbd45.camel@redhat.com>
 <20200116113714.06208a73@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fJV_4rFg+0zr+QgBJ9k/618";
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
Cc: Timur Tabi <timur@kernel.org>, b08248@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 york sun <york.sun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>,
 Scott Wood <swood@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/fJV_4rFg+0zr+QgBJ9k/618
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 16 Jan 2020 11:37:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 15 Jan 2020 14:01:35 -0600 Scott Wood <swood@redhat.com> wrote:
> >
> > On Thu, 2020-01-16 at 06:42 +1100, Stephen Rothwell wrote: =20
> > > Hi Timur,
> > >=20
> > > On Wed, 15 Jan 2020 07:25:45 -0600 Timur Tabi <timur@kernel.org> wrot=
e:   =20
> > > > On 1/14/20 12:31 AM, Stephen Rothwell wrote:   =20
> > > > > +/**
> > > > > + * ev_byte_channel_send - send characters to a byte stream
> > > > > + * @handle: byte stream handle
> > > > > + * @count: (input) num of chars to send, (output) num chars sent
> > > > > + * @bp: pointer to chars to send
> > > > > + *
> > > > > + * Returns 0 for success, or an error code.
> > > > > + */
> > > > > +static unsigned int ev_byte_channel_send(unsigned int handle,
> > > > > +	unsigned int *count, const char *bp)     =20
> > > >=20
> > > > Well, now you've moved this into the .c file and it is no longer=20
> > > > available to other callers.  Anything wrong with keeping it in the =
.h
> > > > file?   =20
> > >=20
> > > There are currently no other callers - are there likely to be in the
> > > future?  Even if there are, is it time critical enough that it needs =
to
> > > be inlined everywhere?   =20
> >=20
> > It's not performance critical and there aren't likely to be other users=
 --
> > just a matter of what's cleaner.  FWIW I'd rather see the original patc=
h,
> > that keeps the raw asm hcall stuff as simple wrappers in one place. =20
>=20
> And I don't mind either way :-)
>=20
> I just want to get rid of the warnings.

Any progress with this?
--=20
Cheers,
Stephen Rothwell

--Sig_/fJV_4rFg+0zr+QgBJ9k/618
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5PHNsACgkQAVBC80lX
0Gyj2Af/dCsAs2UGM2273EmGGsqvmw4xDYxvpHm11P5XZdEIBhMwhor7NxikQ2nE
FW9TeOrmLIcc3wA9UYkR+rtcaIFG6d7YHihRn/wkESF88eQrA+3mKbvmLDh4h/9G
g24ChAtmBl16RcY+kK16NrCi4lx+Edj7xQFEXmnqH/E6TOHTMXjl5QomhR4zmStZ
LdQFmgA31pJYhN0oOmNp2WMFMisz3kxqNSqL7g9JzL+nYIlYhg1rbOmS2+bXF+1R
YI9hORIugB/Chox22mXW+TmWpatByLkNvInKjFidU4EVCaEcVdhvu0lw1tu3l9zD
e7Ts66x+lv58WC/WQAi4qG67W2XjgA==
=fxM6
-----END PGP SIGNATURE-----

--Sig_/fJV_4rFg+0zr+QgBJ9k/618--
