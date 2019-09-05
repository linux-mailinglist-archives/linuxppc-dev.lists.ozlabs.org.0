Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D07FCA9E60
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 11:29:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PFkb1wVbzDqv9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 19:29:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=2001:67c:2050:104:0:2:25:2; helo=mx2.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx2.mailbox.org (mx2a.mailbox.org
 [IPv6:2001:67c:2050:104:0:2:25:2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PFhK2LygzDqsy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 19:27:09 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 572C6A167F;
 Thu,  5 Sep 2019 11:26:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id A-4M1Owl_Xlc; Thu,  5 Sep 2019 11:26:48 +0200 (CEST)
Date: Thu, 5 Sep 2019 19:26:22 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
Message-ID: <20190905092622.tlb6nn3uisssdfbu@yavin.dot.cyphar.com>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
 <20190905073205.GY2332@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ctyxwo5xz342v75e"
Content-Disposition: inline
In-Reply-To: <20190905073205.GY2332@hirez.programming.kicks-ass.net>
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


--ctyxwo5xz342v75e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-09-05, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Sep 05, 2019 at 06:19:22AM +1000, Aleksa Sarai wrote:
> > +/**
> > + * copy_struct_to_user: copy a struct to user space
> > + * @dst:   Destination address, in user space.
> > + * @usize: Size of @dst struct.
> > + * @src:   Source address, in kernel space.
> > + * @ksize: Size of @src struct.
> > + *
> > + * Copies a struct from kernel space to user space, in a way that guar=
antees
> > + * backwards-compatibility for struct syscall arguments (as long as fu=
ture
> > + * struct extensions are made such that all new fields are *appended* =
to the
> > + * old struct, and zeroed-out new fields have the same meaning as the =
old
> > + * struct).
> > + *
> > + * @ksize is just sizeof(*dst), and @usize should've been passed by us=
er space.
> > + * The recommended usage is something like the following:
> > + *
> > + *   SYSCALL_DEFINE2(foobar, struct foo __user *, uarg, size_t, usize)
> > + *   {
> > + *      int err;
> > + *      struct foo karg =3D {};
> > + *
> > + *      // do something with karg
> > + *
> > + *      err =3D copy_struct_to_user(uarg, usize, &karg, sizeof(karg));
> > + *      if (err)
> > + *        return err;
> > + *
> > + *      // ...
> > + *   }
> > + *
> > + * There are three cases to consider:
> > + *  * If @usize =3D=3D @ksize, then it's copied verbatim.
> > + *  * If @usize < @ksize, then kernel space is "returning" a newer str=
uct to an
> > + *    older user space. In order to avoid user space getting incomplete
> > + *    information (new fields might be important), all trailing bytes =
in @src
> > + *    (@ksize - @usize) must be zerored
>=20
> s/zerored/zero/, right?

It should've been "zeroed".

> >                                          , otherwise -EFBIG is returned.
>=20
> 'Funny' that, copy_struct_from_user() below seems to use E2BIG.

This is a copy of the semantics that sched_[sg]etattr(2) uses -- E2BIG for
a "too big" struct passed to the kernel, and EFBIG for a "too big"
struct passed to user-space. I would personally have preferred EMSGSIZE
instead of EFBIG, but felt using the existing error codes would be less
confusing.

>=20
> > + *  * If @usize > @ksize, then the kernel is "returning" an older stru=
ct to a
> > + *    newer user space. The trailing bytes in @dst (@usize - @ksize) w=
ill be
> > + *    zero-filled.
> > + *
> > + * Returns (in all cases, some data may have been copied):
> > + *  * -EFBIG:  (@usize < @ksize) and there are non-zero trailing bytes=
 in @src.
> > + *  * -EFAULT: access to user space failed.
> > + */
> > +int copy_struct_to_user(void __user *dst, size_t usize,
> > +			const void *src, size_t ksize)
> > +{
> > +	size_t size =3D min(ksize, usize);
> > +	size_t rest =3D abs(ksize - usize);
> > +
> > +	if (unlikely(usize > PAGE_SIZE))
> > +		return -EFAULT;
>=20
> Not documented above. Implementation consistent with *from*, but see
> below.

Will update the kernel-doc.

> > +	if (unlikely(!access_ok(dst, usize)))
> > +		return -EFAULT;
> > +
> > +	/* Deal with trailing bytes. */
> > +	if (usize < ksize) {
> > +		if (memchr_inv(src + size, 0, rest))
> > +			return -EFBIG;
> > +	} else if (usize > ksize) {
> > +		if (__memzero_user(dst + size, rest))
> > +			return -EFAULT;
> > +	}
> > +	/* Copy the interoperable parts of the struct. */
> > +	if (__copy_to_user(dst, src, size))
> > +		return -EFAULT;
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(copy_struct_to_user);
> > +
> > +/**
> > + * copy_struct_from_user: copy a struct from user space
> > + * @dst:   Destination address, in kernel space. This buffer must be @=
ksize
> > + *         bytes long.
> > + * @ksize: Size of @dst struct.
> > + * @src:   Source address, in user space.
> > + * @usize: (Alleged) size of @src struct.
> > + *
> > + * Copies a struct from user space to kernel space, in a way that guar=
antees
> > + * backwards-compatibility for struct syscall arguments (as long as fu=
ture
> > + * struct extensions are made such that all new fields are *appended* =
to the
> > + * old struct, and zeroed-out new fields have the same meaning as the =
old
> > + * struct).
> > + *
> > + * @ksize is just sizeof(*dst), and @usize should've been passed by us=
er space.
> > + * The recommended usage is something like the following:
> > + *
> > + *   SYSCALL_DEFINE2(foobar, const struct foo __user *, uarg, size_t, =
usize)
> > + *   {
> > + *      int err;
> > + *      struct foo karg =3D {};
> > + *
> > + *      err =3D copy_struct_from_user(&karg, sizeof(karg), uarg, size);
> > + *      if (err)
> > + *        return err;
> > + *
> > + *      // ...
> > + *   }
> > + *
> > + * There are three cases to consider:
> > + *  * If @usize =3D=3D @ksize, then it's copied verbatim.
> > + *  * If @usize < @ksize, then the user space has passed an old struct=
 to a
> > + *    newer kernel. The rest of the trailing bytes in @dst (@ksize - @=
usize)
> > + *    are to be zero-filled.
> > + *  * If @usize > @ksize, then the user space has passed a new struct =
to an
> > + *    older kernel. The trailing bytes unknown to the kernel (@usize -=
 @ksize)
> > + *    are checked to ensure they are zeroed, otherwise -E2BIG is retur=
ned.
> > + *
> > + * Returns (in all cases, some data may have been copied):
> > + *  * -E2BIG:  (@usize > @ksize) and there are non-zero trailing bytes=
 in @src.
> > + *  * -E2BIG:  @usize is "too big" (at time of writing, >PAGE_SIZE).
> > + *  * -EFAULT: access to user space failed.
> > + */
> > +int copy_struct_from_user(void *dst, size_t ksize,
> > +			  const void __user *src, size_t usize)
> > +{
> > +	size_t size =3D min(ksize, usize);
> > +	size_t rest =3D abs(ksize - usize);
> > +
> > +	if (unlikely(usize > PAGE_SIZE))
> > +		return -EFAULT;
>=20
> Documented above as returning -E2BIG.

I will switch this (and to) back to -E2BIG -- I must've had a brain-fart
when doing some refactoring.

>=20
> > +	if (unlikely(!access_ok(src, usize)))
> > +		return -EFAULT;
> > +
> > +	/* Deal with trailing bytes. */
> > +	if (usize < ksize)
> > +		memset(dst + size, 0, rest);
> > +	else if (usize > ksize) {
> > +		const void __user *addr =3D src + size;
> > +		char buffer[BUFFER_SIZE] =3D {};
>=20
> Isn't that too big for on-stack?

Is a 64-byte buffer too big? I picked the number "at random" to be the
size of a cache line, but I could shrink it down to 32 bytes if the size
is an issue (I wanted to avoid needless allocations -- hence it being
on-stack).

> > +
> > +		while (rest > 0) {
> > +			size_t bufsize =3D min(rest, sizeof(buffer));
> > +
> > +			if (__copy_from_user(buffer, addr, bufsize))
> > +				return -EFAULT;
> > +			if (memchr_inv(buffer, 0, bufsize))
> > +				return -E2BIG;
> > +
> > +			addr +=3D bufsize;
> > +			rest -=3D bufsize;
> > +		}
>=20
> The perf implementation uses get_user(); but if that is too slow, surely
> we can do something with uaccess_try() here?

Is there a non-x86-specific way to do that (unless I'm mistaken only x86
has uaccess_try() or the other *_try() wrappers)? The main "performance
improvement" (if you can even call it that) is that we use memchr_inv()
which finds non-matching characters more efficiently than just doing a
loop.

> > +	}
> > +	/* Copy the interoperable parts of the struct. */
> > +	if (__copy_from_user(dst, src, size))
> > +		return -EFAULT;
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(copy_struct_from_user);
>=20
> And personally I'm not a big fan of EXPORT_SYMBOL().

I don't have much of an opinion (after all, it only really makes sense a
lot of sense for syscalls) -- though out-of-tree modules that define
ioctl()s wouldn't be able to make use of them.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--ctyxwo5xz342v75e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXXDUuwAKCRCdlLljIbnQ
EkuOAP40xlR/F06o1fNB6rvD1iKaBJIRC05rW3WDn2pxUoltnAD/bSvjzMtd1lc1
JInrmBQUHIPZa+Rk1zPMB2BFjgHRZAA=
=mJdv
-----END PGP SIGNATURE-----

--ctyxwo5xz342v75e--
