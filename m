Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D911088A1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 07:07:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LxPs71WpzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 17:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cyphar.com (client-ip=2001:67c:2050::465:202;
 helo=mout-p-202.mailbox.org; envelope-from=cyphar@cyphar.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050::465:202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LxMF25dzzDqJP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 17:04:38 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 47LxLz5BRzzQl9q;
 Mon, 25 Nov 2019 07:04:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id 168Jw0IIWlGv; Mon, 25 Nov 2019 07:04:23 +0100 (CET)
Date: Mon, 25 Nov 2019 17:03:48 +1100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v17 08/13] namei: LOOKUP_BENEATH: O_BENEATH-like scoped
 resolution
Message-ID: <20191125060348.bkdlxvoacdeyy6od@yavin.dot.cyphar.com>
References: <20191117011713.13032-1-cyphar@cyphar.com>
 <20191117011713.13032-9-cyphar@cyphar.com>
 <20191125002604.GE4203@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n5oan2cpdmv3a5ir"
Content-Disposition: inline
In-Reply-To: <20191125002604.GE4203@ZenIV.linux.org.uk>
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


--n5oan2cpdmv3a5ir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-11-25, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sun, Nov 17, 2019 at 12:17:08PM +1100, Aleksa Sarai wrote:
>=20
> > +	if (unlikely(nd->flags & LOOKUP_IS_SCOPED)) {
> > +		/*
> > +		 * Do a final check to ensure that the path didn't escape. Note
> > +		 * that this should already be guaranteed by all of the other
> > +		 * LOOKUP_IS_SCOPED checks (and delaying this check this late
> > +		 * does open the door to some possible timing-based attacks).
> > +		 */
> > +		if (WARN_ON(!path_is_under(&nd->path, &nd->root)))
> > +			return -EXDEV;
>=20
> I don't like that.  What it gives is an ability to race that with
> rename(), with user-triggered WARN_ON.  You *can't* promise that result of
> lookup is in a subtree, simply because it can get moved just as you've
> declared it to be in the clear.
>=20
> 	Anyone who relies upon that is delusional; it really can't be done.
> What warranties LOOKUP_IS_SCOPED is really supposed to provide?  That we =
do not
> attempt to walk out of the subtree rooted at the start point?  Fine, but =
this
> is not what this test does.  What are you trying to achieve there?  If it=
's
> "what we'd got was at one point in our subtree", the test is more or less
> right, but WARN_ON isn't.

You're right that (looking at this again) this chunk doesn't make too
much sense -- though I still think it wouldn't be a bad idea to include
it without the WARN_ON.

The reason I added it was as an attempt to have a last-chance check to
make sure we don't hand out a file descriptor to userspace that is
outside nd->root as a result of some yet-unknown namei bug (hence the
WARN_ON). But you're quite right that I overlooked that user-space could
trigger this maliciously.

Regarding the warranties LOOKUP_IS_SCOPED is supposed to provide --
arguably the guarantee is meant to be "you never step outside the root
during lookup" but that should already be implemented with the
handle_dots() checks -- and it's not something you could easily check at
the end of a lookup anyway. The idea was that (if for some reason those
checks were bypassed), at the very least you wouldn't silently get a
file descriptor which is completely outside the root.

Looking at this again, I can see the argument that check this shouldn't
be done at all -- but I will admit that I feel more comfortable with the
guarantees of LOOKUP_IS_SCOPED if we had some kind of last-chance check
to avoid a privileged process opening /etc/shadow on the host. Then
again, libpathrs (which I assume will be the primary consumer of
LOOKUP_IN_ROOT) already does a double-check in userspace after getting
the file descriptor from openat2().

All of that being said, I'd be happy to drop it entirely if you feel
it's unnecessary.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--n5oan2cpdmv3a5ir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXdtuwQAKCRCdlLljIbnQ
EhgrAQCziGLc25C4Hq/hsTYZTCJzE1b4oLj4e/P/0nPg2wdhrgD9GKxS3kIpRVhT
Rq6CsaKi+Hr4YN+hVfgGVHLHAPRTRQA=
=7pdt
-----END PGP SIGNATURE-----

--n5oan2cpdmv3a5ir--
