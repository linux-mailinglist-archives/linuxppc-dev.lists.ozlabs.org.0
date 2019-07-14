Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D53DE67E9C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 12:33:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45mjfx2ndnzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 20:33:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45mjdB43XPzDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 20:31:38 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 9FD654DF84;
 Sun, 14 Jul 2019 12:31:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id JHLEpiHFM8dg; Sun, 14 Jul 2019 12:31:19 +0200 (CEST)
Date: Sun, 14 Jul 2019 20:31:04 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 05/10] namei: O_BENEATH-style path resolution flags
Message-ID: <20190714100825.umyql5op6cxhmpqa@yavin>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-6-cyphar@cyphar.com>
 <20190712043341.GI17978@ZenIV.linux.org.uk>
 <20190712105745.nruaftgeat6irhzr@yavin>
 <20190712123924.GK17978@ZenIV.linux.org.uk>
 <20190712125552.GL17978@ZenIV.linux.org.uk>
 <20190712132553.GN17978@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kaevdj3q3yxfna5u"
Content-Disposition: inline
In-Reply-To: <20190712132553.GN17978@ZenIV.linux.org.uk>
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


--kaevdj3q3yxfna5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-07-12, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Fri, Jul 12, 2019 at 01:55:52PM +0100, Al Viro wrote:
> > On Fri, Jul 12, 2019 at 01:39:24PM +0100, Al Viro wrote:
> > > On Fri, Jul 12, 2019 at 08:57:45PM +1000, Aleksa Sarai wrote:
> > >=20
> > > > > > @@ -2350,9 +2400,11 @@ static const char *path_init(struct name=
idata *nd, unsigned flags)
> > > > > >  			s =3D ERR_PTR(error);
> > > > > >  		return s;
> > > > > >  	}
> > > > > > -	error =3D dirfd_path_init(nd);
> > > > > > -	if (unlikely(error))
> > > > > > -		return ERR_PTR(error);
> > > > > > +	if (likely(!nd->path.mnt)) {
> > > > >=20
> > > > > Is that a weird way of saying "if we hadn't already called dirfd_=
path_init()"?
> > > >=20
> > > > Yes. I did it to be more consistent with the other "have we got the
> > > > root" checks elsewhere. Is there another way you'd prefer I do it?
> > >=20
> > > "Have we got the root" checks are inevitable evil; here you are makin=
g the
> > > control flow in a single function hard to follow.
> > >=20
> > > I *think* what you are doing is
> > > 	absolute pathname, no LOOKUP_BENEATH:
> > > 		set_root
> > > 		error =3D nd_jump_root(nd)
> > > 	else
> > > 		error =3D dirfd_path_init(nd)
> > > 	return unlikely(error) ? ERR_PTR(error) : s;
> > > which should be a lot easier to follow (not to mention shorter), but =
I might
> > > be missing something in all of that.
> >=20
> > PS: if that's what's going on, I would be tempted to turn the entire
> > path_init() part into this:
> > 	if (flags & LOOKUP_BENEATH)
> > 		while (*s =3D=3D '/')
> > 			s++;
> > in the very beginning (plus the handling of nd_jump_root() prototype
> > change, but that belongs with nd_jump_root() change itself, obviously).
> > Again, I might be missing something here...
>=20
> Argh... I am, at that - you have setting path->root (and grabbing it)
> in LOOKUP_BENEATH cases and you do it after dirfd_path_init().  So
> how about
> 	if (flags & LOOKUP_BENEATH)
> 		while (*s =3D=3D '/')
> 			s++;

I can do this for LOOKUP_IN_ROOT, but currently the semantics for
LOOKUP_BENEATH is that absolute paths will return -EXDEV
indiscriminately (nd_jump_root() errors out with LOOKUP_BENEATH). To be
honest, the check could actually just be:

  if (flags & LOOKUP_BENEATH)
    if (*s =3D=3D '/')
	  return ERR_PTR(-EXDEV);

(Though we'd still need -EXDEV in nd_jump_root() for obvious reasons.)

The logic being that an absolute path means that the resolution starts
out without being "beneath" the starting point -- thus violating the
contract of LOOKUP_BENEATH. And since the "handle absolute paths like
they're scoped to the root" is only implemented for LOOKUP_IN_ROOT, I'd
think it's a bit odd to have LOOKUP_BENEATH do it too for absolute
paths.

I'll be honest, this patchset is more confusing to both of us because of
LOOKUP_BENEATH -- I've only kept it since it was part of the original
patchset (O_BENEATH). Personally I think more people will be far more
interested in LOOKUP_IN_ROOT. Does anyone mind if I drop the
LOOKUP_BENEATH parts of this series, and only keep LOOKUP_NO_* and
LOOKUP_IN_ROOT?

I make a change as you outlined for LOOKUP_IN_ROOT, though.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--kaevdj3q3yxfna5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXSsEZQAKCRCdlLljIbnQ
EnUcAP0UIrWhoFUdmcGKVnbHflUGk+2uDxtG83hk6KmhY14aGgD/bIuyNZSByUo2
62tn/pqpuWfU42XocRvuCvKllOoWpgc=
=3x3j
-----END PGP SIGNATURE-----

--kaevdj3q3yxfna5u--
