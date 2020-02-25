Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB1116F0B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 21:58:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RrqS4sFHzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:57:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RrnX70GszDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 07:56:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=d3tOXQLk; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48RrnV6fVLz9sNg;
 Wed, 26 Feb 2020 07:56:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1582664175;
 bh=V8wPSbfoO/jPqF0wAGLaqj63vyHVeDW9QlgEGXGIHxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d3tOXQLkFRH7gADcWOB4Hr2+SDJnQS2Qr62c4zwBcFDa1lUqwGGfzAawwJRiorwP5
 W/M+7BsMYP3S/Q+Y6iRR9l2fFGXYNbKaKdTscq2CCb7OO028ftlPX3zJSzUIMePspv
 LcoAePJOAWdw2Vwdoq5Oj3BJa1Yhd2beVRAUhEN7I8Qa7CBqU5taJEUH9UAZZYzkrW
 KA2/iEcb8+wMeUSi0EScjON9Z2RlVXtoP0ecLIZtaNngW+zB0ZSmaK3X5N33Q4eO9B
 Nu7DfiJxG9944pv6XXK+TlUPznaEikV5HD71shVgwHboOpWhByKyNPP4qNjcoMtglk
 BP8iyKfVIAA0w==
Date: Wed, 26 Feb 2020 07:56:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Message-ID: <20200226075605.4b9f6613@canb.auug.org.au>
In-Reply-To: <37b145e2-a953-c0e6-f0fa-7ef420edfd16@nxp.com>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
 <20200114173141.29564b25@canb.auug.org.au>
 <1d8f8ee6-65ac-de6c-0e0b-c9bb499c0e02@kernel.org>
 <20200116064234.7a139623@canb.auug.org.au>
 <9f3311d12d418b87832ba5de1372bb76ffccbd45.camel@redhat.com>
 <20200116113714.06208a73@canb.auug.org.au>
 <20200221105715.35c1d2e8@canb.auug.org.au>
 <37b145e2-a953-c0e6-f0fa-7ef420edfd16@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qfyLHOX6yTJm4XYSxGhtYg=";
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

--Sig_/qfyLHOX6yTJm4XYSxGhtYg=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

On Tue, 25 Feb 2020 11:54:17 +0200 Laurentiu Tudor <laurentiu.tudor@nxp.com=
> wrote:
>
> On 21.02.2020 01:57, Stephen Rothwell wrote:
> >=20
> > On Thu, 16 Jan 2020 11:37:14 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>
> >> On Wed, 15 Jan 2020 14:01:35 -0600 Scott Wood <swood@redhat.com> wrote=
: =20
> >>>
> >>> On Thu, 2020-01-16 at 06:42 +1100, Stephen Rothwell wrote: =20
> >>>>
> >>>> On Wed, 15 Jan 2020 07:25:45 -0600 Timur Tabi <timur@kernel.org> wro=
te: =20
> >>>>> On 1/14/20 12:31 AM, Stephen Rothwell wrote: =20
> >>>>>> +/**
> >>>>>> + * ev_byte_channel_send - send characters to a byte stream
> >>>>>> + * @handle: byte stream handle
> >>>>>> + * @count: (input) num of chars to send, (output) num chars sent
> >>>>>> + * @bp: pointer to chars to send
> >>>>>> + *
> >>>>>> + * Returns 0 for success, or an error code.
> >>>>>> + */
> >>>>>> +static unsigned int ev_byte_channel_send(unsigned int handle,
> >>>>>> +	unsigned int *count, const char *bp) =20
> >>>>>
> >>>>> Well, now you've moved this into the .c file and it is no longer
> >>>>> available to other callers.  Anything wrong with keeping it in the =
.h
> >>>>> file? =20
> >>>>
> >>>> There are currently no other callers - are there likely to be in the
> >>>> future?  Even if there are, is it time critical enough that it needs=
 to
> >>>> be inlined everywhere? =20
> >>>
> >>> It's not performance critical and there aren't likely to be other use=
rs --
> >>> just a matter of what's cleaner.  FWIW I'd rather see the original pa=
tch,
> >>> that keeps the raw asm hcall stuff as simple wrappers in one place. =
=20
> >>
> >> And I don't mind either way :-)
> >>
> >> I just want to get rid of the warnings. =20
> >=20
> > Any progress with this?
>=20
> I think that the consensus was to pick up the original patch that is,=20
> this one: https://patchwork.ozlabs.org/patch/1220186/
>=20
> I've tested it too, so please feel free to add a:
>=20
> Tested-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

So, whose tree should his go via?

--=20
Cheers,
Stephen Rothwell

--Sig_/qfyLHOX6yTJm4XYSxGhtYg=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5VieUACgkQAVBC80lX
0Gw/Wgf/XYYFtKUT5ldZx6ocKVH1jGjJD6sUAkPZ0XRvqAs87NCNI35L0g5rlgfZ
51WzpNO6fFHORMJo6CyX2oKD58C+s5WjGKECpp9J74DqznAtFG8TyuzyTTH4vOKj
VmXtC8ZEkn4J8hdpIVBIlLZhC5rYU6OGgvTOtBp/qhb17D9Io88tVqIktvUE7u7J
UNLtFfykVAyzx8nTGzoIAKncCqoi68nRXnZ0W1i5x0Oti6WCU42J32Ky9RJ3XXMm
DGZgG0oBbsd90l3Qcan1ranP+EzzzkFeEJOg/0fmANpOuFkWojXA9snUd2B0IBvK
QiXlIjoAayvPXJDQxsCVmy3FdaXf/g==
=weT1
-----END PGP SIGNATURE-----

--Sig_/qfyLHOX6yTJm4XYSxGhtYg=--
