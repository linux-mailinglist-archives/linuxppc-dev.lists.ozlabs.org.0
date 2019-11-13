Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98FFA7C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 05:01:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CWB25SkKzF6H0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 15:00:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CW4s21yjzF6Bg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 14:56:26 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47CW4V73MqzQlBG;
 Wed, 13 Nov 2019 04:56:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id ovfePb6AeJGC; Wed, 13 Nov 2019 04:56:05 +0100 (CET)
Date: Wed, 13 Nov 2019 14:55:42 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v15 5/9] namei: LOOKUP_IN_ROOT: chroot-like scoped
 resolution
Message-ID: <20191113035542.3ckc7oudahn3xtnj@yavin.dot.cyphar.com>
References: <20191105090553.6350-1-cyphar@cyphar.com>
 <20191105090553.6350-6-cyphar@cyphar.com>
 <20191113020307.GB26530@ZenIV.linux.org.uk>
 <20191113024414.wlmvtjstpnkxa36n@yavin.dot.cyphar.com>
 <20191113025941.GE26530@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j4f7d32jpyqpzflk"
Content-Disposition: inline
In-Reply-To: <20191113025941.GE26530@ZenIV.linux.org.uk>
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
 Jiri Olsa <jolsa@redhat.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Shuah Khan <shuah@kernel.org>,
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


--j4f7d32jpyqpzflk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-11-13, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Wed, Nov 13, 2019 at 01:44:14PM +1100, Aleksa Sarai wrote:
> > On 2019-11-13, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > > On Tue, Nov 05, 2019 at 08:05:49PM +1100, Aleksa Sarai wrote:
> > >=20
> > > > @@ -2277,12 +2277,20 @@ static const char *path_init(struct nameida=
ta *nd, unsigned flags)
> > > > =20
> > > >  	nd->m_seq =3D read_seqbegin(&mount_lock);
> > > > =20
> > > > -	/* Figure out the starting path and root (if needed). */
> > > > -	if (*s =3D=3D '/') {
> > > > +	/* Absolute pathname -- fetch the root. */
> > > > +	if (flags & LOOKUP_IN_ROOT) {
> > > > +		/* With LOOKUP_IN_ROOT, act as a relative path. */
> > > > +		while (*s =3D=3D '/')
> > > > +			s++;
> > >=20
> > > Er...  Why bother skipping slashes?  I mean, not only link_path_walk()
> > > will skip them just fine, you are actually risking breakage in this:
> > >                 if (*s && unlikely(!d_can_lookup(dentry))) {
> > >                         fdput(f);
> > >                         return ERR_PTR(-ENOTDIR);
> > >                 }
> > > which is downstream from there with you patch, AFAICS.
> >=20
> > I switched to stripping the slashes at your suggestion a few revisions
> > ago[1], and had (wrongly) assumed we needed to handle "/" somehow in
> > path_init(). But you're quite right about link_path_walk() -- and I'd be
> > more than happy to drop it.
>=20
> That, IIRC, was about untangling the weirdness around multiple calls of
> dirfd_path_init() and basically went "we might want just strip the slashes
> in case of that flag very early in the entire thing, so that later the
> normal logics for absolute/relative would DTRT".

Ah okay, I'd misunderstood the point you were making in that thread.

> Since your check is right next to checking for absolute pathnames (and
> not in the very beginning of path_init()), we might as well turn the
> check for absolute pathname into *s =3D=3D '/' && !(flags &
> LOOKUP_IN_ROOT) and be done with that.

Yup, agreed.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--j4f7d32jpyqpzflk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXct+uwAKCRCdlLljIbnQ
EpaMAQCKfJalyFfg/QA8aH/wuTwb0JmHpxt9HKverNfj5BncXAEA8J+s2/4xFPcn
vy6IqraafPiOMkqsiqA03ofQ3tR8tQ4=
=Qq3t
-----END PGP SIGNATURE-----

--j4f7d32jpyqpzflk--
