Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38A108EDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 14:27:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M7B25WGvzDqcc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 00:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cyphar.com (client-ip=80.241.56.171; helo=mout-p-201.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M74P0RqZzDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 00:22:25 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47M74C5DCbzQlB7;
 Mon, 25 Nov 2019 14:22:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id IyM7yVp8E5tW; Mon, 25 Nov 2019 14:22:15 +0100 (CET)
Date: Tue, 26 Nov 2019 00:21:45 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v17 10/13] namei: LOOKUP_{IN_ROOT,BENEATH}: permit
 limited ".." resolution
Message-ID: <20191125132145.btaxuurs2w3ldyxf@yavin.dot.cyphar.com>
References: <20191117011713.13032-1-cyphar@cyphar.com>
 <20191117011713.13032-11-cyphar@cyphar.com>
 <20191125003501.GF4203@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xfjlpf4rp232ejv4"
Content-Disposition: inline
In-Reply-To: <20191125003501.GF4203@ZenIV.linux.org.uk>
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
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, containers@lists.linux-foundation.org,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-api@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Jiri Olsa <jolsa@redhat.com>, linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Yonghong Song <yhs@fb.com>, linux-mips@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>, bpf@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, dev@opencontainers.org,
 linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, libc-alpha@sourceware.org,
 Aleksa Sarai <asarai@suse.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--xfjlpf4rp232ejv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-11-25, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sun, Nov 17, 2019 at 12:17:10PM +1100, Aleksa Sarai wrote:
> > +		if (unlikely(nd->flags & LOOKUP_IS_SCOPED)) {
> > +			/*
> > +			 * If there was a racing rename or mount along our
> > +			 * path, then we can't be sure that ".." hasn't jumped
> > +			 * above nd->root (and so userspace should retry or use
> > +			 * some fallback).
> > +			 */
> > +			if (unlikely(read_seqretry(&mount_lock, nd->m_seq)))
> > +				return -EAGAIN;
> > +			if (unlikely(read_seqretry(&rename_lock, nd->r_seq)))
> > +				return -EAGAIN;
> > +		}
>=20
> Looks like excessive barriers to me - it's
> 	rmb
> 	check mount_lock.sequence
> 	rmb
> 	check rename_lock.sequence

If you like, I can switch this to

	smp_rmb();
	if (unlikely(__read_seqcount_retry(&mount_lock.seqcount, nd->m_seq)))
		return -EAGAIN;
	if (unlikely(__read_seqcount_retry(&rename_lock.seqcount, nd->r_seq)))
		return -EAGAIN;

Though I think it makes it more noisy (and this code-path will only be
hit for ".." and LOOKUP_IS_SCOPED).

> > @@ -2266,6 +2274,10 @@ static const char *path_init(struct nameidata *n=
d, unsigned flags)
> >  	nd->last_type =3D LAST_ROOT; /* if there are only slashes... */
> >  	nd->flags =3D flags | LOOKUP_JUMPED | LOOKUP_PARENT;
> >  	nd->depth =3D 0;
> > +
> > +	nd->m_seq =3D read_seqbegin(&mount_lock);
> > +	nd->r_seq =3D read_seqbegin(&rename_lock);
>=20
> Same here, pretty much (fetch/rmb/fetch/rmb)

Unless I'm mistaken, wouldn't we have to do
seqcount_lockdep_reader_access() explicitly -- so it would end up
looking something like:

	seqcount_lockdep_reader_access(&mount_lock.seqcount);
	nd->m_seq =3D __read_seqcount_begin(&mount_lock.seqcount);
	seqcount_lockdep_reader_access(&mount_lock.seqcount);
	nd->r_seq =3D __read_seqcount_begin(&rename_lock.seqcount);
	smp_rmb();

Given this code only runs once at the start of each lookup, I'm not sure
it makes much sense to expand it like that and make it look uglier.

If you really want to avoid the duplicate memory barriers in the common
case I could instead gate the rename_lock grab behind LOOKUP_IS_SCOPED
(since that's the only time it's used).

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--xfjlpf4rp232ejv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXdvVZQAKCRCdlLljIbnQ
EloCAP9GizB7Q/AkzjQ85bGLdovCLYKdqf/qIT7xsbiqpcFyAgD/QswcZX+n5/jN
nekkrDU5Lj+ZmT9lPOf3tS+I4Q4wogM=
=viit
-----END PGP SIGNATURE-----

--xfjlpf4rp232ejv4--
