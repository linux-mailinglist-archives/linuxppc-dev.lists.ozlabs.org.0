Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 653C4AA4B7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 15:40:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PMJZ4hGxzDqpp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 23:40:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=80.241.60.215; helo=mx2.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PMCz5sW3zDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 23:36:28 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 812EBA1762;
 Thu,  5 Sep 2019 15:36:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id QEpWHY7VDe2j; Thu,  5 Sep 2019 15:36:16 +0200 (CEST)
Date: Thu, 5 Sep 2019 23:35:52 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
Message-ID: <20190905133552.xlckmxfzar4wh5ju@yavin.dot.cyphar.com>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
 <20190905073205.GY2332@hirez.programming.kicks-ass.net>
 <20190905092622.tlb6nn3uisssdfbu@yavin.dot.cyphar.com>
 <20190905094305.GJ2349@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p7vw24iv2smepbtp"
Content-Disposition: inline
In-Reply-To: <20190905094305.GJ2349@hirez.programming.kicks-ass.net>
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
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
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


--p7vw24iv2smepbtp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-09-05, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Sep 05, 2019 at 07:26:22PM +1000, Aleksa Sarai wrote:
> > On 2019-09-05, Peter Zijlstra <peterz@infradead.org> wrote:
> > > On Thu, Sep 05, 2019 at 06:19:22AM +1000, Aleksa Sarai wrote:
> > > > +/**
> > > > + * copy_struct_to_user: copy a struct to user space
> > > > + * @dst:   Destination address, in user space.
> > > > + * @usize: Size of @dst struct.
> > > > + * @src:   Source address, in kernel space.
> > > > + * @ksize: Size of @src struct.
> > > > + *
> > > > + * Copies a struct from kernel space to user space, in a way that =
guarantees
> > > > + * backwards-compatibility for struct syscall arguments (as long a=
s future
> > > > + * struct extensions are made such that all new fields are *append=
ed* to the
> > > > + * old struct, and zeroed-out new fields have the same meaning as =
the old
> > > > + * struct).
> > > > + *
> > > > + * @ksize is just sizeof(*dst), and @usize should've been passed b=
y user space.
> > > > + * The recommended usage is something like the following:
> > > > + *
> > > > + *   SYSCALL_DEFINE2(foobar, struct foo __user *, uarg, size_t, us=
ize)
> > > > + *   {
> > > > + *      int err;
> > > > + *      struct foo karg =3D {};
> > > > + *
> > > > + *      // do something with karg
> > > > + *
> > > > + *      err =3D copy_struct_to_user(uarg, usize, &karg, sizeof(kar=
g));
> > > > + *      if (err)
> > > > + *        return err;
> > > > + *
> > > > + *      // ...
> > > > + *   }
> > > > + *
> > > > + * There are three cases to consider:
> > > > + *  * If @usize =3D=3D @ksize, then it's copied verbatim.
> > > > + *  * If @usize < @ksize, then kernel space is "returning" a newer=
 struct to an
> > > > + *    older user space. In order to avoid user space getting incom=
plete
> > > > + *    information (new fields might be important), all trailing by=
tes in @src
> > > > + *    (@ksize - @usize) must be zerored
> > >=20
> > > s/zerored/zero/, right?
> >=20
> > It should've been "zeroed".
>=20
> That reads wrong to me; that way it reads like this function must take
> that action and zero out the 'rest'; which is just wrong.
>=20
> This function must verify those bytes are zero, not make them zero.

Right, in my head I was thinking "must have been zeroed" which isn't
what it says. I'll switch to "zero".

> > > >                                          , otherwise -EFBIG is retu=
rned.
> > >=20
> > > 'Funny' that, copy_struct_from_user() below seems to use E2BIG.
> >=20
> > This is a copy of the semantics that sched_[sg]etattr(2) uses -- E2BIG =
for
> > a "too big" struct passed to the kernel, and EFBIG for a "too big"
> > struct passed to user-space. I would personally have preferred EMSGSIZE
> > instead of EFBIG, but felt using the existing error codes would be less
> > confusing.
>=20
> Sadly a recent commit:
>=20
>   1251201c0d34 ("sched/core: Fix uclamp ABI bug, clean up and robustify s=
ched_read_attr() ABI logic and code")
>=20
> Made the situation even 'worse'.

I hadn't seen this patch before, and I have a few questions taking a
look at it:

 * An error code for a particular behaviour was changed (EFBIG ->
   E2BIG). Is this not a userspace breakage (I know Linus went ballistic
   about something similar a while ago[1]), or did I misunderstand what
   the issue was in [1]?
   * At the risk of bike-shedding -- of we are changing it, wouldn't
	 -EMSGSIZE be more appropriate? To be fair, picking errno values has
	 always been more of an art than a science, but to my ears "Argument
	 list too long" doesn't make too much sense in the context of
	 "returning" a struct back to userspace (and the cause of the error
	 is that the argument passed by user space *isn't big enough*). If
	 there was an E2SMALL that would also work. ;)

 * Do you want me to write a patch based on that, to switch it to
   copy_struct_to_user()?

 * That patch removes the "are there non-zero bytes in the tail that
   userspace won't know about" check (which I have included in mine). I
   understand that this caused issues specifically with sched_getattr(2)
   due to the default value not being zero -- how should we rectify that
   (given that we'd hopefully want to port everyone who uses that
   interface to copy_struct_{to,from}_user())?

 * Given that the [uk]attr->size construct is pretty important to the
   usability of the sched and perf interfaces, should we require (or
   encourage) it for all struct-extension syscall setups?

> > > > +	if (unlikely(!access_ok(src, usize)))
> > > > +		return -EFAULT;
> > > > +
> > > > +	/* Deal with trailing bytes. */
> > > > +	if (usize < ksize)
> > > > +		memset(dst + size, 0, rest);
> > > > +	else if (usize > ksize) {
> > > > +		const void __user *addr =3D src + size;
> > > > +		char buffer[BUFFER_SIZE] =3D {};
> > >=20
> > > Isn't that too big for on-stack?
> >=20
> > Is a 64-byte buffer too big? I picked the number "at random" to be the
> > size of a cache line, but I could shrink it down to 32 bytes if the size
> > is an issue (I wanted to avoid needless allocations -- hence it being
> > on-stack).
>=20
> Ah, my ctags gave me a definition of BUFFER_SIZE that was 512. I suppose
> 64 should be OK.

Good to know, though I'll rename it to avoid confusion.

[1]: https://lore.kernel.org/lkml/CA+55aFy98A+LJK4+GWMcbzaa1zsPBRo76q+ioEjb=
x-uaMKH6Uw@mail.gmail.com/

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--p7vw24iv2smepbtp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXXEPNQAKCRCdlLljIbnQ
EtdDAQC347lG5qRdA84KUpGgbwgprjAxcKgxqQIULhRNFfpXbgD/ZCHtkcVeJovi
WTsQxqcwA375UPIXJ/SgrKfqOJOI7Q4=
=dSqz
-----END PGP SIGNATURE-----

--p7vw24iv2smepbtp--
