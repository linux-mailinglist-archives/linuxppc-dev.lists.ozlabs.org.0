Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2B86C700
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 05:21:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pzvB6DflzDqXN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 13:21:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=2001:67c:2050:104:0:1:25:1; helo=mx1.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx1.mailbox.org (mx1.mailbox.org
 [IPv6:2001:67c:2050:104:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pzqg4MdBzDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 13:18:36 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id F35D54FE71;
 Thu, 18 Jul 2019 05:18:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id nZ38r1RPFd3K; Thu, 18 Jul 2019 05:18:14 +0200 (CEST)
Date: Thu, 18 Jul 2019 13:17:29 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 05/10] namei: O_BENEATH-style path resolution flags
Message-ID: <20190718031729.scehpjydhuxgxqjy@yavin>
References: <20190706145737.5299-6-cyphar@cyphar.com>
 <20190712043341.GI17978@ZenIV.linux.org.uk>
 <20190712105745.nruaftgeat6irhzr@yavin>
 <20190712123924.GK17978@ZenIV.linux.org.uk>
 <20190712125552.GL17978@ZenIV.linux.org.uk>
 <20190712132553.GN17978@ZenIV.linux.org.uk>
 <20190712150026.GO17978@ZenIV.linux.org.uk>
 <20190713024153.GA3817@ZenIV.linux.org.uk>
 <20190714070029.m53etvm3y4etidxt@yavin>
 <20190714143623.GR17978@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z4aw3kgjubxi6rqg"
Content-Disposition: inline
In-Reply-To: <20190714143623.GR17978@ZenIV.linux.org.uk>
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
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
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


--z4aw3kgjubxi6rqg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-07-14, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sun, Jul 14, 2019 at 05:00:29PM +1000, Aleksa Sarai wrote:
> > The basic property being guaranteed by LOOKUP_IN_ROOT is that it will
> > not result in resolution of a path component which was not inside the
> > root of the dirfd tree at some point during resolution (and that all
> > absolute symlink and ".." resolution will be done relative to the
> > dirfd). This may smell slightly of chroot(2), because unfortunately it
> > is a similar concept -- the reason for this is to allow for a more
> > efficient way to safely resolve paths inside a rootfs than spawning a
> > separate process to then pass back the fd to the caller.
>=20
> IDGI...  If attacker can modify your subtree, you have already lost -
> after all, they can make anything appear inside that tree just before
> your syscall is made and bring it back out immediately afterwards.
> And if they can't, what is the race you are trying to protect against?
> Confused...

I'll be honest, this code mostly exists because Jann Horn said that it
was necessary in order for this interface to be safe against those kinds
of attacks. Though, it's also entirely possible I just am
mis-remembering the attack scenario he described when I posted v1 of
this series last year.

The use-case I need this functionality for (as do other container
runtimes) is one where you are trying to safely interact with a
directory tree that is a (malicious) container's root filesystem -- so
the container won't be able to move the directory tree root, nor can
they move things outside the rootfs into it (or the reverse). Users
dealing with FTP, web, or file servers probably have similar
requirements.

There is an obvious race condition if you allow the attacker to move the
root (I give an example and test-case of it in the last patch in the
series), and given that it is fairly trivial to defend against I don't
see the downside in including it? But it's obviously your call -- and
maybe Jann Horn can explain the reasoning behind this much better than I
can.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--z4aw3kgjubxi6rqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXS/kxgAKCRCdlLljIbnQ
Eo0/AQD7a5jDbww9O+NZeirpVja2r3Y2CFcg1rTXSOeRjy321gEAoJhiO3HmSR50
nG/Ogapy7jTKDSyCcC7BfUZDZSz67go=
=wzlY
-----END PGP SIGNATURE-----

--z4aw3kgjubxi6rqg--
