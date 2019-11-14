Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C216BFC809
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 14:44:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DN4q4W9rzF675
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 00:44:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cyphar.com (client-ip=2001:67c:2050::465:201;
 helo=mout-p-201.mailbox.org; envelope-from=cyphar@cyphar.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050::465:201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DMrV1Lj4zF6Bm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 00:33:43 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47DMrH5rJDzQl9x;
 Thu, 14 Nov 2019 14:33:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id Wtrcg9lX2PUE; Thu, 14 Nov 2019 14:33:30 +0100 (CET)
Date: Fri, 15 Nov 2019 00:33:00 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v15 3/9] namei: LOOKUP_NO_XDEV: block mountpoint crossing
Message-ID: <20191114133300.soxnzmufwbt2ddid@yavin.dot.cyphar.com>
References: <20191105090553.6350-1-cyphar@cyphar.com>
 <20191105090553.6350-4-cyphar@cyphar.com>
 <20191113013630.GZ26530@ZenIV.linux.org.uk>
 <20191114044945.ldedzjrb4s7i7irr@yavin.dot.cyphar.com>
 <20191114054348.GH26530@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zoh3k636biknnjmo"
Content-Disposition: inline
In-Reply-To: <20191114054348.GH26530@ZenIV.linux.org.uk>
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


--zoh3k636biknnjmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-11-14, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Thu, Nov 14, 2019 at 03:49:45PM +1100, Aleksa Sarai wrote:
> > On 2019-11-13, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > > On Tue, Nov 05, 2019 at 08:05:47PM +1100, Aleksa Sarai wrote:
> > >=20
> > > > @@ -862,6 +870,8 @@ static int nd_jump_root(struct nameidata *nd)
> > > >  void nd_jump_link(struct path *path)
> > > >  {
> > > >  	struct nameidata *nd =3D current->nameidata;
> > > > +
> > > > +	nd->last_magiclink.same_mnt =3D (nd->path.mnt =3D=3D path->mnt);
> > > >  	path_put(&nd->path);
> > > > =20
> > > >  	nd->path =3D *path;
> > > > @@ -1082,6 +1092,10 @@ const char *get_link(struct nameidata *nd)
> > > >  		if (nd->flags & LOOKUP_MAGICLINK_JUMPED) {
> > > >  			if (unlikely(nd->flags & LOOKUP_NO_MAGICLINKS))
> > > >  				return ERR_PTR(-ELOOP);
> > > > +			if (unlikely(nd->flags & LOOKUP_NO_XDEV)) {
> > > > +				if (!nd->last_magiclink.same_mnt)
> > > > +					return ERR_PTR(-EXDEV);
> > > > +			}
> > > >  		}
> > >=20
> > > Ugh...  Wouldn't it be better to take that logics (some equivalent th=
ereof)
> > > into nd_jump_link()?  Or just have nd_jump_link() return an error...
> >=20
> > This could be done, but the reason for stashing it away in
> > last_magiclink is because of the future magic-link re-opening patches
> > which can't be implemented like that without putting the open_flags
> > inside nameidata (which was decided to be too ugly a while ago).
> >=20
> > My point being that I could implement it this way for this series, but
> > I'd have to implement something like last_magiclink when I end up
> > re-posting the magic-link stuff in a few weeks.
> >=20
> > Looking at all the nd_jump_link() users, the other option is to just
> > disallow magic-link crossings entirely for LOOKUP_NO_XDEV. The only
> > thing allowing them permits is to resolve file descriptors that are
> > pointing to the same procfs mount -- and it's unclear to me how useful
> > that really is (apparmorfs and nsfs will always give -EXDEV because
> > aafs_mnt and nsfs_mnt are internal kernel vfsmounts).
>=20
> I would rather keep the entire if (nd->flags & LOOKUP_MAGICLINK_JUMPED)
> out of the get_link().  If you want to generate some error if
> nd_jump_link() has been called, just do it right there.  The fewer
> pieces of state need to be carried around, the better...

Sure, I can make nd_jump_link() give -ELOOP and drop the current need
for LOOKUP_MAGICLINK_JUMPED -- if necessary we can re-add it for the
magic-link reopening patches.

> And as for opening them...  Why would you need full open_flags in there?
> Details, please...

I was referring to [1] which has been dropped from this series. I
misspoke -- you don't need the full open_flags, you just need acc_mode
in nameidata -- but from memory you (understandably) weren't in favour
of that either because it further muddled the open semantics with namei.

So the solution I went with was to stash away the i_mode of the
magiclink in nd->last_magiclink.mode (though to avoid a race which Jann
found, you actually need to recalculate it when you call nd_jump_link()
but that's a different topic) and then check it in trailing_magiclink().

However, I've since figured out that we need to restrict things like
bind-mounts and truncate() because they can be used to get around the
restrictions. I dropped that patch from this series so that I could work
on implementing the restrictions for the other relevant VFS syscalls
separately from openat2 (upgrade_mask will be re-added to open_how with
those patches).

My point was that AFAICS we will either have to have nd->acc_mode (or
something similar) or have nd->last_magiclink in order to implement the
magic-link reopening hardening.

[1]: https://lore.kernel.org/lkml/20190930183316.10190-2-cyphar@cyphar.com/

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--zoh3k636biknnjmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXc1XiQAKCRCdlLljIbnQ
EgEVAQDde9bpKjJAbLEIt4D/9cw3B8CHqEBeW8SnIT4PqQNQUQD/TtE4FY5p3N1d
gPZFRde/N3ihwtWscDvPXctFNxykJAQ=
=TSKH
-----END PGP SIGNATURE-----

--zoh3k636biknnjmo--
