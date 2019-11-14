Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.auug.org.au [IPv6:2401:3900:2:1::4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84463FBEE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:00:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D8Sb3P1qzF44d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 16:00:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cyphar.com (client-ip=80.241.56.152; helo=mout-p-102.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D8Pl3lTnzF4gh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 15:58:18 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 47D8Pf2Sf9zKmdL;
 Thu, 14 Nov 2019 05:58:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id QpQxpch70Axr; Thu, 14 Nov 2019 05:58:06 +0100 (CET)
Date: Thu, 14 Nov 2019 15:57:44 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v15 4/9] namei: LOOKUP_BENEATH: O_BENEATH-like scoped
 resolution
Message-ID: <20191114045744.d3e7mp3zrupfe2wr@yavin.dot.cyphar.com>
References: <20191105090553.6350-1-cyphar@cyphar.com>
 <20191105090553.6350-5-cyphar@cyphar.com>
 <20191113015534.GA26530@ZenIV.linux.org.uk>
 <20191113074757.5b4u5vlyx2u6pbn6@yavin.dot.cyphar.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6gz2i7fpwlz4mefu"
Content-Disposition: inline
In-Reply-To: <20191113074757.5b4u5vlyx2u6pbn6@yavin.dot.cyphar.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Christian Brauner <christian.brauner@ubuntu.com>,
 Jiri Olsa <jolsa@redhat.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-m68k@lists.linux-m68k.org,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 linux-arm-kernel@lists.infradead.org, "J. Bruce Fields" <bfields@fieldses.org>,
 libc-alpha@sourceware.org, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--6gz2i7fpwlz4mefu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-11-13, Aleksa Sarai <cyphar@cyphar.com> wrote:
> On 2019-11-13, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > Minor nit here - I'd split "move the conditional call of set_root()
> > into nd_jump_root()" into a separate patch before that one.  Makes
> > for fewer distractions in this one.  I'd probably fold "and be
> > ready for errors other than -ECHILD" into the same preliminary
> > patch.
>=20
> Will do.
>=20
> > > +			/* Not currently safe for scoped-lookups. */
> > > +			if (unlikely(nd->flags & LOOKUP_IS_SCOPED))
> > > +				return ERR_PTR(-EXDEV);
> >=20
> > Also a candidate for doing in nd_jump_link()...
> >=20
> > > @@ -1373,8 +1403,11 @@ static int follow_dotdot_rcu(struct nameidata =
*nd)
> > >  	struct inode *inode =3D nd->inode;
> > > =20
> > >  	while (1) {
> > > -		if (path_equal(&nd->path, &nd->root))
> > > +		if (path_equal(&nd->path, &nd->root)) {
> > > +			if (unlikely(nd->flags & LOOKUP_BENEATH))
> > > +				return -EXDEV;
> >=20
> > Umm...  Are you sure it's not -ECHILD?
>=20
> It wouldn't hurt to be -ECHILD -- though it's not clear to me how likely
> a success would be in REF-walk if the parent components didn't already
> trigger an unlazy_walk() in RCU-walk.
>=20
> I guess that also means LOOKUP_NO_XDEV should trigger -ECHILD in
> follow_dotdot_rcu()?

Scratch the last question -- AFAICS we don't need to do that for
LOOKUP_NO_XDEV because we check against mount_lock so it's very unlikely
that -ECHILD will have any benefit.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--6gz2i7fpwlz4mefu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXczexQAKCRCdlLljIbnQ
Em3mAQDOIg6+v9zFmJZ9+uYnLQ8tGd3ay8OeAsu6/xVlfCimMwD/cMP8o+o1KTbo
+rDSfA6D7b6Zhy7K3Vlf0k0OTebeSwI=
=kHIA
-----END PGP SIGNATURE-----

--6gz2i7fpwlz4mefu--
