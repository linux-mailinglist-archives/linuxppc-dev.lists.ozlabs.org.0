Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB1513D132
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 01:39:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ylgN5wW8zDqRB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 11:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yldS1B2XzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 11:37:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=gVyzXiiS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47yldR3PDkz9sR0;
 Thu, 16 Jan 2020 11:37:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1579135035;
 bh=/PSr5fwjbaX6pPos+/ialmrGoq3c1awveX8DXx+W3Sc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gVyzXiiSvDGGTcocHpo8hHXU7Hy297yRpKs624viyWScR1+Ikkylku2dZiOiSpaFn
 pO3DeHysdZ/Flgk7sgw0lGbhrm+Uug4gEjM8Kym/uv5TRaabgYuITFnuXGCFwDhh2I
 8xjvXLL1xwwl5xD4daMvrYqPqGYKcZHhpfbKvbyCSNWqDYf2hQEoBaIa7jRM/oTVOF
 SzIt5Foau4ShCpAgDqINQeuEJayrODBT20uFYBqPBRuk5WTJ4ZAshhvXIxv8wzBmJ9
 vH3A0XuUpRyzSs9gWkipylXpAGdDhgSZU6rRLSzPZlyhKYl4Emn+1WTwGFE+kvEgEh
 69VuUoW785yXA==
Date: Thu, 16 Jan 2020 11:37:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Scott Wood <swood@redhat.com>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Message-ID: <20200116113714.06208a73@canb.auug.org.au>
In-Reply-To: <9f3311d12d418b87832ba5de1372bb76ffccbd45.camel@redhat.com>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
 <20200114173141.29564b25@canb.auug.org.au>
 <1d8f8ee6-65ac-de6c-0e0b-c9bb499c0e02@kernel.org>
 <20200116064234.7a139623@canb.auug.org.au>
 <9f3311d12d418b87832ba5de1372bb76ffccbd45.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n3LGNYm8QFXZ.7Qy3gSABtq";
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
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/n3LGNYm8QFXZ.7Qy3gSABtq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Scott,

On Wed, 15 Jan 2020 14:01:35 -0600 Scott Wood <swood@redhat.com> wrote:
>
> On Thu, 2020-01-16 at 06:42 +1100, Stephen Rothwell wrote:
> > Hi Timur,
> >=20
> > On Wed, 15 Jan 2020 07:25:45 -0600 Timur Tabi <timur@kernel.org> wrote:=
 =20
> > > On 1/14/20 12:31 AM, Stephen Rothwell wrote: =20
> > > > +/**
> > > > + * ev_byte_channel_send - send characters to a byte stream
> > > > + * @handle: byte stream handle
> > > > + * @count: (input) num of chars to send, (output) num chars sent
> > > > + * @bp: pointer to chars to send
> > > > + *
> > > > + * Returns 0 for success, or an error code.
> > > > + */
> > > > +static unsigned int ev_byte_channel_send(unsigned int handle,
> > > > +	unsigned int *count, const char *bp)   =20
> > >=20
> > > Well, now you've moved this into the .c file and it is no longer=20
> > > available to other callers.  Anything wrong with keeping it in the .h
> > > file? =20
> >=20
> > There are currently no other callers - are there likely to be in the
> > future?  Even if there are, is it time critical enough that it needs to
> > be inlined everywhere? =20
>=20
> It's not performance critical and there aren't likely to be other users --
> just a matter of what's cleaner.  FWIW I'd rather see the original patch,
> that keeps the raw asm hcall stuff as simple wrappers in one place.

And I don't mind either way :-)

I just want to get rid of the warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/n3LGNYm8QFXZ.7Qy3gSABtq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fsDoACgkQAVBC80lX
0Gzg5ggAof1MfAMgXZ1CAykwmqb6yLD4Oc5/eVJV0O3eViU/Uo5iXHULLe+S4vkI
ICuZYZq868FNlmv3AUr38uTAL+hTXYJ3nkinGyWge68f1D9Wox5IoDVT4r7GeisF
Q0HMwbhRTbY/JdNjOSbcr9SlGA3VLTYrJ0Os3qWIhC3KxniQOxhQojkIhcpkJMhM
Bx0gHnqiJGI8sXNZnpGabBoIiEAibaR6ybCf+xUK4L3AL66ecFZBgKQHYm4lute6
M4wYfNgNWF89prVNENLaXbVCVbFUxz4KzPnGn6rqpg+rk13PKzzHAGNMaZ7Jy0Wb
KBbYdM04AG+7N4324ZbaKQR+MG9EzQ==
=IJS0
-----END PGP SIGNATURE-----

--Sig_/n3LGNYm8QFXZ.7Qy3gSABtq--
