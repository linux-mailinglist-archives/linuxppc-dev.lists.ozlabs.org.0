Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B91FF49D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 19:12:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Fjwm6cn8zF4hh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2019 05:12:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=asarai@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FjtV5rQczF4gx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 05:10:08 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ECC11B13A;
 Sat, 16 Nov 2019 18:10:02 +0000 (UTC)
Date: Sun, 17 Nov 2019 05:09:34 +1100
From: Aleksa Sarai <asarai@suse.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v16 02/12] namei: allow nd_jump_link() to produce errors
Message-ID: <20191116180934.fajrkc4jqcewiuqd@yavin.dot.cyphar.com>
References: <20191116002802.6663-1-cyphar@cyphar.com>
 <20191116002802.6663-3-cyphar@cyphar.com>
 <20191116003702.GX26530@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ushqsy2n2ywnjdre"
Content-Disposition: inline
In-Reply-To: <20191116003702.GX26530@ZenIV.linux.org.uk>
User-Agent: NeoMutt/20180716
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
Cc: Song Liu <songliubraving@fb.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, containers@lists.linux-foundation.org,
 linux-api@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Daniel Borkmann <daniel@iogearbox.net>,
 Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Yonghong Song <yhs@fb.com>, linux-mips@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>, bpf@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, dev@opencontainers.org,
 Aleksa Sarai <cyphar@cyphar.com>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 netdev@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ushqsy2n2ywnjdre
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-11-16, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sat, Nov 16, 2019 at 11:27:52AM +1100, Aleksa Sarai wrote:
> > +	error =3D nd_jump_link(&path);
> > +	if (error)
> > +		path_put(&path);
>=20
> > +	error =3D nd_jump_link(&ns_path);
> > +	if (error)
> > +		path_put(&ns_path);
>=20
> > +	error =3D nd_jump_link(&path);
> > +	if (error)
> > +		path_put(&path);
>=20
> 3 calls.  Exact same boilerplate in each to handle a failure case.
> Which spells "wrong calling conventions"; it's absolutely clear
> that we want that path_put() inside nd_jump_link().
>=20
> The rule should be this: reference that used to be held in
> *path is consumed in any case.  On success it goes into
> nd->path, on error it's just dropped, but in any case, the
> caller has the same refcounting environment to deal with.
>=20
> If you need the same boilerplate cleanup on failure again and again,
> the calling conventions are wrong and need to be fixed.

Will do.

> And I'm not sure that int is the right return type here, to be honest.
> void * might be better - return ERR_PTR() or NULL, so that the value
> could be used as return value of ->get_link() that calls that thing.

I don't agree, given that the few callers of ns_get_path() are
inconsistent with regards to whether they should use IS_ERR() or check
for NULL, not to mention that "void *error" reads to me as being very
odd given how common "int error" is throughout the kernel. There's also
the "error =3D=3D ERR_PTR(-EAGAIN)" checks which also read as being quite
odd too.

But the main motivating factor for changing it was that the one use
where "void *" is useful (proc_ns_get_link) becomes needlessly ugly
because of the "nd_jump_link() can return errors" change:

	error =3D ERR_PTR(nd_jump_link(&ns_path));

Or probably (if you don't want to rely on ERR_PTR(0) =3D=3D NULL):

	int err =3D nd_jump_link(&ns_path);
	if (err)
		error =3D ERR_PTR(err);

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--ushqsy2n2ywnjdre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXdA7WwAKCRCdlLljIbnQ
EkhIAQCTW+ppymqPGqw4uOB2Z70GQdn52zl46zQ6xxp5L3kEHQD9FZ2+HHtYsZC+
LGfFupqoyojLXID+lx72AXf4CJ7KLw4=
=aGSY
-----END PGP SIGNATURE-----

--ushqsy2n2ywnjdre--
