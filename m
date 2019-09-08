Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8173ACFBA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 18:26:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RGrp2tYKzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 02:26:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RGpy4jzxzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2019 02:24:55 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id F270BA10CE;
 Sun,  8 Sep 2019 18:24:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id RaAVojXx0viX; Sun,  8 Sep 2019 18:24:32 +0200 (CEST)
Date: Mon, 9 Sep 2019 02:24:19 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v12 11/12] open: openat2(2) syscall
Message-ID: <20190908162419.yrzm2s7rflqgdxig@yavin>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-12-cyphar@cyphar.com>
 <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gzznbyzuni6ynbc5"
Content-Disposition: inline
In-Reply-To: <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
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
 sparclinux@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 Shuah Khan <shuah@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--gzznbyzuni6ynbc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-09-07, Jeff Layton <jlayton@kernel.org> wrote:
> On Thu, 2019-09-05 at 06:19 +1000, Aleksa Sarai wrote:
> > + * @flags: O_* flags.
> > + * @mode: O_CREAT/O_TMPFILE file mode.
> > + * @upgrade_mask: UPGRADE_* flags (to restrict O_PATH re-opening).
> > + * @resolve: RESOLVE_* flags.
> > + */
> > +struct open_how {
> > +	__u32 flags;
> > +	union {
> > +		__u16 mode;
> > +		__u16 upgrade_mask;
> > +	};
> > +	__u16 resolve;
> > +};
> > +
> > +#define OPEN_HOW_SIZE_VER0	8 /* sizeof first published struct */
> > +
>=20
> Hmm, there is no version field. When you want to expand this in the
> future, what is the plan? Add a new flag to indicate that it's some
> length?

The "version number" is the size of the struct. Any extensions we make
are appended to the struct (openat2 now takes a size_t argument), and
the new copy_struct_{to,from}_user() helpers handle all of the
permutations of {old,new} kernel and {old,new} user space.

This is how clone3(), sched_[gs]etattr() and perf_event_open() all
operate (all of the sigset syscalls operate similarly but don't
gracefully handle different kernel vintages -- you just get -EINVAL).

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--gzznbyzuni6ynbc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXXUrMAAKCRCdlLljIbnQ
EgC+AQCVKXVqUiPLaSjLjt+ByWrSsopM/OM3NwCHHZ5oD+CB1gD/cSuQohVmXskg
v8dQLpd9K1QW//8GG3Aa/FRHhqPAfAU=
=G4Hw
-----END PGP SIGNATURE-----

--gzznbyzuni6ynbc5--
