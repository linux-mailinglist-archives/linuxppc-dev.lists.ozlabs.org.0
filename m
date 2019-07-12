Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BCF66B4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 13:01:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lVNZ1C1DzDqv8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 21:01:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=2001:67c:2050:104:0:1:25:1; helo=mx1.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx1.mailbox.org (mx1.mailbox.org
 [IPv6:2001:67c:2050:104:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lVJx51BFzDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 20:58:21 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 648AF5427E;
 Fri, 12 Jul 2019 12:58:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id la_RnxBryad0; Fri, 12 Jul 2019 12:57:56 +0200 (CEST)
Date: Fri, 12 Jul 2019 20:57:45 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 05/10] namei: O_BENEATH-style path resolution flags
Message-ID: <20190712105745.nruaftgeat6irhzr@yavin>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-6-cyphar@cyphar.com>
 <20190712043341.GI17978@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f3oogwkmh2sysq6o"
Content-Disposition: inline
In-Reply-To: <20190712043341.GI17978@ZenIV.linux.org.uk>
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
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--f3oogwkmh2sysq6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-07-12, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sun, Jul 07, 2019 at 12:57:32AM +1000, Aleksa Sarai wrote:
> > @@ -1442,8 +1464,11 @@ static int follow_dotdot_rcu(struct nameidata *n=
d)
> >  	struct inode *inode =3D nd->inode;
> > =20
> >  	while (1) {
> > -		if (path_equal(&nd->path, &nd->root))
> > +		if (path_equal(&nd->path, &nd->root)) {
> > +			if (unlikely(nd->flags & LOOKUP_BENEATH))
> > +				return -EXDEV;
>=20
> > @@ -1468,6 +1493,8 @@ static int follow_dotdot_rcu(struct nameidata *nd)
> >  				return -ECHILD;
> >  			if (&mparent->mnt =3D=3D nd->path.mnt)
> >  				break;
> > +			if (unlikely(nd->flags & LOOKUP_XDEV))
> > +				return -EXDEV;
> >  			/* we know that mountpoint was pinned */
> >  			nd->path.dentry =3D mountpoint;
> >  			nd->path.mnt =3D &mparent->mnt;
> > @@ -1482,6 +1509,8 @@ static int follow_dotdot_rcu(struct nameidata *nd)
> >  			return -ECHILD;
> >  		if (!mounted)
> >  			break;
> > +		if (unlikely(nd->flags & LOOKUP_XDEV))
> > +			return -EXDEV;
>=20
> Are you sure these failure exits in follow_dotdot_rcu() won't give
> suprious hard errors?

I could switch to -ECHILD for the *_rcu() checks if you'd prefer that.
Though, I'd have (probably naively) thought that you'd have already
gotten -ECHILD from the seqlock checks if there was a race during ".."
handling.

> > +	if (unlikely(nd->flags & LOOKUP_BENEATH)) {
> > +		error =3D dirfd_path_init(nd);
> > +		if (unlikely(error))
> > +			return ERR_PTR(error);
> > +		nd->root =3D nd->path;
> > +		if (!(nd->flags & LOOKUP_RCU))
> > +			path_get(&nd->root);
> > +	}
> >  	if (*s =3D=3D '/') {
> >  		if (likely(!nd->root.mnt))
> >  			set_root(nd);
> > @@ -2350,9 +2400,11 @@ static const char *path_init(struct nameidata *n=
d, unsigned flags)
> >  			s =3D ERR_PTR(error);
> >  		return s;
> >  	}
> > -	error =3D dirfd_path_init(nd);
> > -	if (unlikely(error))
> > -		return ERR_PTR(error);
> > +	if (likely(!nd->path.mnt)) {
>=20
> Is that a weird way of saying "if we hadn't already called dirfd_path_ini=
t()"?

Yes. I did it to be more consistent with the other "have we got the
root" checks elsewhere. Is there another way you'd prefer I do it?

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--f3oogwkmh2sysq6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXShnpgAKCRCdlLljIbnQ
EgLTAP4nuVmi0292tyCAkB4Di0UUtazb2EsZPgKq9s2vRoyuFAD/UKONDBSK3VN9
06Id1xrmV0JIYJSqOIdF2oJIncJ8ZwI=
=5hbR
-----END PGP SIGNATURE-----

--f3oogwkmh2sysq6o--
