Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ADEC2AA6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 01:12:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hyqN43KNzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 09:12:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hym45rRgzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 09:09:53 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 19DECA198E;
 Tue,  1 Oct 2019 01:09:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.240])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id ZCXN6-VgIlDY; Tue,  1 Oct 2019 01:09:38 +0200 (CEST)
Date: Tue, 1 Oct 2019 09:09:14 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v13 3/9] open: O_EMPTYPATH: procfs-less file descriptor
 re-opening
Message-ID: <20190930230914.qu3lg2rhlesf5myt@yavin.dot.cyphar.com>
References: <20190930183316.10190-4-cyphar@cyphar.com>
 <201910010638.xzk5h4Bt%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="snekp2kducyfirik"
Content-Disposition: inline
In-Reply-To: <201910010638.xzk5h4Bt%lkp@intel.com>
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
 Alexei Starovoitov <ast@kernel.org>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 Shuah Khan <shuah@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Christian Brauner <christian@brauner.io>,
 Eric Biederman <ebiederm@xmission.com>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, Oleg Nesterov <oleg@redhat.com>,
 linux-m68k@lists.linux-m68k.org, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 linux-arm-kernel@lists.infradead.org, "J. Bruce Fields" <bfields@fieldses.org>,
 libc-alpha@sourceware.org, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 kbuild-all@01.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--snekp2kducyfirik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-10-01, kbuild test robot <lkp@intel.com> wrote:
> Hi Aleksa,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on linus/master]
> [cannot apply to v5.4-rc1 next-20190930]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>=20
> url:    https://github.com/0day-ci/linux/commits/Aleksa-Sarai/namei-opena=
t2-2-path-resolution-restrictions/20191001-025628
> config: sparc-allyesconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.4.0 make.cross ARCH=3Dsparc=20
>=20
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>=20
> All error/warnings (new ones prefixed by >>):
>=20
>    In file included from include/linux/kernel.h:11:0,
>                     from include/linux/list.h:9,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from include/uapi/linux/aio_abi.h:31,
>                     from include/linux/syscalls.h:74,
>                     from fs/fcntl.c:8:
>    fs/fcntl.c: In function 'fcntl_init':
> >> include/linux/compiler.h:350:38: error: call to '__compiletime_assert_=
1037' declared with attribute error: BUILD_BUG_ON failed: 22 - 1 !=3D HWEIG=
HT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC | __FMOD=
E_NONOTIFY)
>      _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                          ^
>    include/linux/compiler.h:331:4: note: in definition of macro '__compil=
etime_assert'
>        prefix ## suffix();    \
>        ^~~~~~
>    include/linux/compiler.h:350:2: note: in expansion of macro '_compilet=
ime_assert'
>      _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>      ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compilet=
ime_assert'
>     #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                         ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG=
_ON_MSG'
>      BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>      ^~~~~~~~~~~~~~~~
> >> fs/fcntl.c:1034:2: note: in expansion of macro 'BUILD_BUG_ON'
>      BUILD_BUG_ON(22 - 1 /* for O_RDONLY being 0 */ !=3D
>      ^~~~~~~~~~~~

This is because 0x4000000 is used by FMODE_NONOTIFY. The fix is simple,
and I'll include it in the next version.

> vim +/__compiletime_assert_1037 +350 include/linux/compiler.h
>=20
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  336 =20
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  337  #define _compiletime_assert=
(condition, msg, prefix, suffix) \
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  338  	__compiletime_assert(condi=
tion, msg, prefix, suffix)
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  339 =20
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  340  /**
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  341   * compiletime_assert - bre=
ak build and emit msg if condition is false
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  342   * @condition: a compile-ti=
me constant condition to check
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  343   * @msg:       a message to=
 emit if condition is false
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  344   *
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  345   * In tradition of POSIX as=
sert, this macro will break the build if the
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  346   * supplied condition is *f=
alse*, emitting the supplied error message if the
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  347   * compiler has support to =
do so.
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  348   */
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  349  #define compiletime_assert(=
condition, msg) \
> 9a8ab1c39970a4 Daniel Santos 2013-02-21 @350  	_compiletime_assert(condit=
ion, msg, __compiletime_assert_, __LINE__)
> 9a8ab1c39970a4 Daniel Santos 2013-02-21  351 =20
>=20
> :::::: The code at line 350 was first introduced by commit
> :::::: 9a8ab1c39970a4938a72d94e6fd13be88a797590 bug.h, compiler.h: introd=
uce compiletime_assert & BUILD_BUG_ON_MSG
>=20
> :::::: TO: Daniel Santos <daniel.santos@pobox.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>=20
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--snekp2kducyfirik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXZKLFwAKCRCdlLljIbnQ
EiFeAP47RjOd95gOdKvsH6iKIsB52GsvABLqpjPMoDsJYICxvQEAqOPS7WukWlsO
68N9mURzwjixbUVZ+5gtkgEiuWzwXA0=
=RuGe
-----END PGP SIGNATURE-----

--snekp2kducyfirik--
