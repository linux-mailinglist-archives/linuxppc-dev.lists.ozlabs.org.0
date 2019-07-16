Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344A6A38A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 10:06:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ntJC1G7BzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 18:06:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=80.241.60.212; helo=mx1.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ntG24tYTzDqKV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 18:04:07 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 65FB4506CB;
 Tue, 16 Jul 2019 10:03:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id FP9J3tccLygu; Tue, 16 Jul 2019 10:03:51 +0200 (CEST)
Date: Tue, 16 Jul 2019 18:03:38 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 05/10] namei: O_BENEATH-style path resolution flags
Message-ID: <20190716080338.al4cnwdfvdbpzh3r@yavin>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-6-cyphar@cyphar.com>
 <20190712043341.GI17978@ZenIV.linux.org.uk>
 <20190712105745.nruaftgeat6irhzr@yavin>
 <20190712123924.GK17978@ZenIV.linux.org.uk>
 <20190712125552.GL17978@ZenIV.linux.org.uk>
 <20190712132553.GN17978@ZenIV.linux.org.uk>
 <20190712150026.GO17978@ZenIV.linux.org.uk>
 <20190713024153.GA3817@ZenIV.linux.org.uk>
 <20190714035826.GQ17978@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lshvdcpckvdb4crm"
Content-Disposition: inline
In-Reply-To: <20190714035826.GQ17978@ZenIV.linux.org.uk>
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, raven@themaw.net,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, paul@paul-moore.com,
 Aleksa Sarai <asarai@suse.de>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 rgb@redhat.com, linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--lshvdcpckvdb4crm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-07-14, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sat, Jul 13, 2019 at 03:41:53AM +0100, Al Viro wrote:
> > On Fri, Jul 12, 2019 at 04:00:26PM +0100, Al Viro wrote:
> > > On Fri, Jul 12, 2019 at 02:25:53PM +0100, Al Viro wrote:
> > >=20
> > > > 	if (flags & LOOKUP_BENEATH) {
> > > > 		nd->root =3D nd->path;
> > > > 		if (!(flags & LOOKUP_RCU))
> > > > 			path_get(&nd->root);
> > > > 		else
> > > > 			nd->root_seq =3D nd->seq;
> > >=20
> > > BTW, this assignment is needed for LOOKUP_RCU case.  Without it
> > > you are pretty much guaranteed that lazy pathwalk will fail,
> > > when it comes to complete_walk().
> > >=20
> > > Speaking of which, what would happen if LOOKUP_ROOT/LOOKUP_BENEATH
> > > combination would someday get passed?
> >=20
> > I don't understand what's going on with ->r_seq in there - your
> > call of path_is_under() is after having (re-)sampled rename_lock,
> > but if that was the only .. in there, who's going to recheck
> > the value?  For that matter, what's to guarantee that the thing
> > won't get moved just as you are returning from handle_dots()?
> >=20
> > IOW, what does LOOKUP_IN_ROOT guarantee for caller (openat2())?
>=20
> Sigh...  Usual effects of trying to document things:
>=20
> 1) LOOKUP_NO_EVAL looks bogus.  It had been introduced by commit 57d46577=
16ac
> (audit: ignore fcaps on umount) and AFAICS it's crap.  It is set in
> ksys_umount() and nowhere else.  It's ignored by everything except
> filename_mountpoint().  The thing is, call graph for filename_mountpoint()
> is
> 	filename_mountpoint()
> 		<- user_path_mountpoint_at()
> 			<- ksys_umount()
> 		<- kern_path_mountpoint()
> 			<- autofs_dev_ioctl_ismountpoint()
> 			<- find_autofs_mount()
> 				<- autofs_dev_ioctl_open_mountpoint()
> 				<- autofs_dev_ioctl_requester()
> 				<- autofs_dev_ioctl_ismountpoint()
> In other words, that flag is basically "was filename_mountpoint()
> been called by umount(2) or has it come from an autofs ioctl?".
> And looking at the rationale in that commit, autofs ioctls need
> it just as much as umount(2) does.  Why is it not set for those
> as well?  And why is it conditional at all?

In addition, LOOKUP_NO_EVAL =3D=3D LOOKUP_OPEN (0x100). Is that meant to be
the case? Also I just saw you have a patch in work.namei that fixes this
up -- do you want me to rebase on top of that?

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--lshvdcpckvdb4crm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXS2E1wAKCRCdlLljIbnQ
EvUWAP4hDKNKmCaghR/nSF7B9A3mjchQtut9n7vItMKjRPJjLAD9GRABOJCnZ47q
TqUSuZfxKfq260PQMTx91hQd/K+//QE=
=XoHc
-----END PGP SIGNATURE-----

--lshvdcpckvdb4crm--
