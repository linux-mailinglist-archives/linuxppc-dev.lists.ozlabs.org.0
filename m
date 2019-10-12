Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C1D4CA7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 06:10:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qrwC4vfFzDqdl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 15:10:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=80.241.60.219; helo=mx2a.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qrt35pYjzDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 15:08:56 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2a.mailbox.org (Postfix) with ESMTPS id 0485AA1104;
 Sat, 12 Oct 2019 06:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id WQcjjXFgeVVi; Sat, 12 Oct 2019 06:08:40 +0200 (CEST)
Date: Sat, 12 Oct 2019 15:08:15 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v14 2/6] namei: LOOKUP_IN_ROOT: chroot-like path resolution
Message-ID: <20191012040815.gnc43cfmo5mnv67u@yavin.dot.cyphar.com>
References: <20191010054140.8483-1-cyphar@cyphar.com>
 <20191010054140.8483-3-cyphar@cyphar.com>
 <CAHk-=wh8L50f31vW8BwRUXhLiq3eoCQ3tg8ER4Yp2dzuU1w5rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t2fxesclfr677pzw"
Content-Disposition: inline
In-Reply-To: <CAHk-=wh8L50f31vW8BwRUXhLiq3eoCQ3tg8ER4Yp2dzuU1w5rQ@mail.gmail.com>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Shuah Khan <shuah@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 GNU C Library <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Linux Containers <containers@lists.linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--t2fxesclfr677pzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-10-10, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Wed, Oct 9, 2019 at 10:42 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
> >
> > --- a/fs/namei.c
> > +++ b/fs/namei.c
> > @@ -2277,6 +2277,11 @@ static const char *path_init(struct nameidata *n=
d, unsigned flags)
> >
> >         nd->m_seq =3D read_seqbegin(&mount_lock);
> >
> > +       /* LOOKUP_IN_ROOT treats absolute paths as being relative-to-di=
rfd. */
> > +       if (flags & LOOKUP_IN_ROOT)
> > +               while (*s =3D=3D '/')
> > +                       s++;
> > +
> >         /* Figure out the starting path and root (if needed). */
> >         if (*s =3D=3D '/') {
> >                 error =3D nd_jump_root(nd);
>=20
> Hmm. Wouldn't this make more sense all inside the if (*s =3D- '/') test?
> That way if would be where we check for "should we start at the root",
> which seems to make more sense conceptually.

I don't really agree (though I do think that both options are pretty
ugly). Doing it before the block makes it clear that absolute paths are
just treated relative-to-dirfd -- doing it inside the block makes it
look more like "/" is a special-case for nd_jump_root(). And while that
is somewhat true, this is just a side-effect of making the code more
clean -- my earlier versions reworked the dirfd handling to always grab
nd->root first if LOOKUP_IS_SCOPED. I switched to this method based on
Al's review.

In fairness, I do agree that the lonely while loop looks ugly.

> That test for '/' currently has a "} else if (..)", but that's
> pointless since it ends with a "return" anyway. So the "else" logic is
> just noise.

This depends on the fact that LOOKUP_BENEATH always triggers -EXDEV for
nd_jump_root() -- if we ever add another "scoped lookup" flag then the
logic will have to be further reworked.

(It should be noted that the new version doesn't always end with a
"return", but you could change it to act that way given the above
assumption.)

> And if you get rid of the unnecessary else, moving the LOOKUP_IN_ROOT
> inside the if-statement works fine.
>=20
> So this could be something like
>=20
>     --- a/fs/namei.c
>     +++ b/fs/namei.c
>     @@ -2194,11 +2196,19 @@ static const char *path_init(struct
> nameidata *nd, unsigned flags)
>=20
>         nd->m_seq =3D read_seqbegin(&mount_lock);
>         if (*s =3D=3D '/') {
>     -           set_root(nd);
>     -           if (likely(!nd_jump_root(nd)))
>     -                   return s;
>     -           return ERR_PTR(-ECHILD);
>     -   } else if (nd->dfd =3D=3D AT_FDCWD) {
>     +           /* LOOKUP_IN_ROOT treats absolute paths as being
> relative-to-dirfd. */
>     +           if (!(flags & LOOKUP_IN_ROOT)) {
>     +                   set_root(nd);
>     +                   if (likely(!nd_jump_root(nd)))
>     +                           return s;
>     +                   return ERR_PTR(-ECHILD);
>     +           }
>     +
>     +           /* Skip initial '/' for LOOKUP_IN_ROOT */
>     +           do { s++; } while (*s =3D=3D '/');
>     +   }
>     +
>     +   if (nd->dfd =3D=3D AT_FDCWD) {
>                 if (flags & LOOKUP_RCU) {
>                         struct fs_struct *fs =3D current->fs;
>                         unsigned seq;
>=20
> instead. The patch ends up slightly bigger (due to the re-indentation)
> but now it handles all the "start at root" in the same place. Doesn't
> that make sense?

It is correct (though I'd need to clean it up a bit to handle
nd_jump_root() correctly), and if you really would like me to change it
I will -- but I just don't agree that it's cleaner.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--t2fxesclfr677pzw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXaFRqQAKCRCdlLljIbnQ
El00AQDKyu1GNvL91tAxvDZP/2rrqVrUf7Ad1T8uobD+aKQbgwEAvz9eeuLveRVq
aqnd3Ifu8HO4SYcqYn+hDFgDz5D5Kwo=
=XXCi
-----END PGP SIGNATURE-----

--t2fxesclfr677pzw--
