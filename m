Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1567659B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 19:14:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=wphgglIy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBcn25mN8z3cSB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 03:13:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=wphgglIy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cyphar.com (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=cyphar@cyphar.com; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBcm74WBsz3c3s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 03:13:09 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RBclx61jyz9sSq;
	Thu, 27 Jul 2023 19:13:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1690477981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r4xS4z3m09mcDhbG2vSNuCuAOWPT6oLsRQePsTlsExg=;
	b=wphgglIyp+usBR0fNyl85KtqD+TvcRheXCarcC9+q/rC2O/c19YVrPmD3yxd6P5zNkRAgn
	ap1J1ewuz2/88KROo01hnaKnZ4/JhylWNhiBSxQ81mAbQ2FpPaPd18Eeg5JBsnXEACuOVL
	kxHc79dCNTAe95YgGNhXV08fsF9k1vsOGv6GUB2QE5SFFlSOWEvhyRbKLtNFmt5GQKNj3u
	IN6dDugiyIaBjBJ+ymRyuAdQFshGsVMUm52bzNxGOPYfWT6GeKADooVM0YYFrrgU4Aio3h
	BRZYiw4NU+t71y0ghqPQ5R5qkpDibTPetLXyyMi4+J3mphGiAC1Gb+WOSRyIbQ==
Date: Fri, 28 Jul 2023 03:12:24 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Message-ID: <20230727.041348-imposing.uptake.velvet.nylon-712tDwzCAbCCoSGx@cyphar.com>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
 <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
 <ZMEjlDNJkFpYERr1@example.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mzzk664uqt7bucoa"
Content-Disposition: inline
In-Reply-To: <ZMEjlDNJkFpYERr1@example.org>
X-Rspamd-Queue-Id: 4RBclx61jyz9sSq
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fweimer@redhat.com, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@hansenpartnership.com, monstr@m
 onstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mzzk664uqt7bucoa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023-07-26, Alexey Gladkov <legion@kernel.org> wrote:
> On Wed, Jul 26, 2023 at 02:36:25AM +1000, Aleksa Sarai wrote:
> > On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> > > On the userspace side fchmodat(3) is implemented as a wrapper
> > > function which implements the POSIX-specified interface. This
> > > interface differs from the underlying kernel system call, which does =
not
> > > have a flags argument. Most implementations require procfs [1][2].
> > >=20
> > > There doesn't appear to be a good userspace workaround for this issue
> > > but the implementation in the kernel is pretty straight-forward.
> > >=20
> > > The new fchmodat2() syscall allows to pass the AT_SYMLINK_NOFOLLOW fl=
ag,
> > > unlike existing fchmodat.
> > >=20
> > > [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/un=
ix/sysv/linux/fchmodat.c;h=3D17eca54051ee28ba1ec3f9aed170a62630959143;hb=3D=
a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> > > [2] https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=
=3D718f363bc2067b6487900eddc9180c84e7739f80#n28
> > >=20
> > > Co-developed-by: Palmer Dabbelt <palmer@sifive.com>
> > > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  fs/open.c                | 18 ++++++++++++++----
> > >  include/linux/syscalls.h |  2 ++
> > >  2 files changed, 16 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/fs/open.c b/fs/open.c
> > > index 0c55c8e7f837..39a7939f0d00 100644
> > > --- a/fs/open.c
> > > +++ b/fs/open.c
> > > @@ -671,11 +671,11 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode=
_t, mode)
> > >  	return err;
> > >  }
> > > =20
> > > -static int do_fchmodat(int dfd, const char __user *filename, umode_t=
 mode)
> > > +static int do_fchmodat(int dfd, const char __user *filename, umode_t=
 mode, int lookup_flags)
> >=20
> > I think it'd be much neater to do the conversion of AT_ flags here and
> > pass 0 as a flags argument for all of the wrappers (this is how most of
> > the other xyz(), fxyz(), fxyzat() syscall wrappers are done IIRC).
>=20
> I just addressed the Al Viro's suggestion.
>=20
> https://lore.kernel.org/lkml/20190717014802.GS17978@ZenIV.linux.org.uk/

I think Al misspoke, because he also said "pass it 0 as an extra
argument", but you actually have to pass LOOKUP_FOLLOW from the
wrappers. If you look at how faccessat2 and faccessat are implemented,
it follows the behaviour I described.

> > >  {
> > >  	struct path path;
> > >  	int error;
> > > -	unsigned int lookup_flags =3D LOOKUP_FOLLOW;
> > > +
> > >  retry:
> > >  	error =3D user_path_at(dfd, filename, lookup_flags, &path);
> > >  	if (!error) {
> > > @@ -689,15 +689,25 @@ static int do_fchmodat(int dfd, const char __us=
er *filename, umode_t mode)
> > >  	return error;
> > >  }
> > > =20
> > > +SYSCALL_DEFINE4(fchmodat2, int, dfd, const char __user *, filename,
> > > +		umode_t, mode, int, flags)
> > > +{
> > > +	if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
> > > +		return -EINVAL;
> >=20
> > We almost certainly want to support AT_EMPTY_PATH at the same time.
> > Otherwise userspace will still need to go through /proc when trying to
> > chmod a file handle they have.
>=20
> I'm not sure I understand. Can you explain what you mean?

You should add support for AT_EMPTY_PATH (LOOKUP_EMPTY) as well as
AT_SYMLINK_NOFOLLOW. It would only require something like:

	unsigned int lookup_flags =3D LOOKUP_FOLLOW;

	if (flags & ~(AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW))
		return -EINVAL;

	if (flags & AT_EMPTY_PATH)
		lookup_flags |=3D LOOKUP_EMPTY;
	if (flags & AT_SYMLINK_NOFOLLOW)
		lookup_flags &=3D ~LOOKUP_FOLLOW;

	/* ... */

This would be effectively equivalent to fchmod(fd, mode). (I was wrong
when I said this wasn't already possible -- I forgot about fchmod(2).)

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--mzzk664uqt7bucoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCZMKleAAKCRAol/rSt+lE
bym9AQDqgQyuOeexUTCKq/tyT2Gt8n1mt1PGm55hdeFxmQCD1AD+NkISNEOp7Oej
qTsMPEIGWvfGX/MWtUS2thZbT2WvjA4=
=+qOC
-----END PGP SIGNATURE-----

--mzzk664uqt7bucoa--
