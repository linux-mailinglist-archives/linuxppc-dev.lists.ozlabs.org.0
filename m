Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FDFBEC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 05:52:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D8Gz6JM3zF5GQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 15:52:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cyphar.com (client-ip=80.241.56.151; helo=mout-p-101.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D8Df11SQzF6t4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 15:50:23 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 47D8DS2831zKmdH;
 Thu, 14 Nov 2019 05:50:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id GmtrxB8tgNO0; Thu, 14 Nov 2019 05:50:10 +0100 (CET)
Date: Thu, 14 Nov 2019 15:49:45 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v15 3/9] namei: LOOKUP_NO_XDEV: block mountpoint crossing
Message-ID: <20191114044945.ldedzjrb4s7i7irr@yavin.dot.cyphar.com>
References: <20191105090553.6350-1-cyphar@cyphar.com>
 <20191105090553.6350-4-cyphar@cyphar.com>
 <20191113013630.GZ26530@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rwq4fftbhkszxm4g"
Content-Disposition: inline
In-Reply-To: <20191113013630.GZ26530@ZenIV.linux.org.uk>
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
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Christian Brauner <christian.brauner@ubuntu.com>,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>, Jeff Layton <jlayton@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rwq4fftbhkszxm4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-11-13, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Tue, Nov 05, 2019 at 08:05:47PM +1100, Aleksa Sarai wrote:
>=20
> > @@ -862,6 +870,8 @@ static int nd_jump_root(struct nameidata *nd)
> >  void nd_jump_link(struct path *path)
> >  {
> >  	struct nameidata *nd =3D current->nameidata;
> > +
> > +	nd->last_magiclink.same_mnt =3D (nd->path.mnt =3D=3D path->mnt);
> >  	path_put(&nd->path);
> > =20
> >  	nd->path =3D *path;
> > @@ -1082,6 +1092,10 @@ const char *get_link(struct nameidata *nd)
> >  		if (nd->flags & LOOKUP_MAGICLINK_JUMPED) {
> >  			if (unlikely(nd->flags & LOOKUP_NO_MAGICLINKS))
> >  				return ERR_PTR(-ELOOP);
> > +			if (unlikely(nd->flags & LOOKUP_NO_XDEV)) {
> > +				if (!nd->last_magiclink.same_mnt)
> > +					return ERR_PTR(-EXDEV);
> > +			}
> >  		}
>=20
> Ugh...  Wouldn't it be better to take that logics (some equivalent thereo=
f)
> into nd_jump_link()?  Or just have nd_jump_link() return an error...

This could be done, but the reason for stashing it away in
last_magiclink is because of the future magic-link re-opening patches
which can't be implemented like that without putting the open_flags
inside nameidata (which was decided to be too ugly a while ago).

My point being that I could implement it this way for this series, but
I'd have to implement something like last_magiclink when I end up
re-posting the magic-link stuff in a few weeks.

Looking at all the nd_jump_link() users, the other option is to just
disallow magic-link crossings entirely for LOOKUP_NO_XDEV. The only
thing allowing them permits is to resolve file descriptors that are
pointing to the same procfs mount -- and it's unclear to me how useful
that really is (apparmorfs and nsfs will always give -EXDEV because
aafs_mnt and nsfs_mnt are internal kernel vfsmounts).

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--rwq4fftbhkszxm4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXczc5gAKCRCdlLljIbnQ
EspyAQDQkDnU2/CfvkXyKRLh2e7ycT5D4iHdCmBXbx8LlO8DlwD/S5O/FNHgyDdy
RVaJ7aj0OZAzg7DMx3VZRiI+He4MXw0=
=71Jv
-----END PGP SIGNATURE-----

--rwq4fftbhkszxm4g--
