Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A71761F71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 18:48:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=Rjz3Tj6G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9NJP6bHcz3bjV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 02:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=Rjz3Tj6G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cyphar.com (client-ip=80.241.56.151; helo=mout-p-101.mailbox.org; envelope-from=cyphar@cyphar.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 623 seconds by postgrey-1.37 at boromir; Wed, 26 Jul 2023 02:47:34 AEST
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9NHV6bnRz30Ql
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 02:47:34 +1000 (AEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4R9N3J6DgZz9sky;
	Tue, 25 Jul 2023 18:37:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1690303020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JqCAz4pT3GDUTh/C6LdHYGGzlykcrPzOPXi/2ZYbtJI=;
	b=Rjz3Tj6GNkJ756LoUn5njBvcsbsW0/MAqHFGq5N7S5DZflWFrn2po7Qsa2nBdkNLHPX2QN
	WbOZe7hgRbuHfs7lKyLUw758wTVF1+2jDq6xMeLtjMSAFOTSnglc7uLKJyCyAUZDbJP5qn
	WIr03ybhOR/BXivfWU8k54fCj/jkt46b7teY6si6XwQWnj/C2q4F/gk33Oq8fGPID1nU3V
	Fm/Rx2muN4rG5Em8xoygWv7E6rqY2XuejuMkNewe4kxYskk5tul+YgVcZYcpz78OL4DHVO
	pPLH6reidbUYi5iU0C947Q8MP5DncBUqNY6zptq9PlTGyGKyBOzpX+MhlLxHTg==
Date: Wed, 26 Jul 2023 02:36:25 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Message-ID: <njnhwhgmsk64e6vf3ur7fifmxlipmzez3r5g7ejozsrkbwvq7w@tu7w3ieystcq>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="afbbamzjyar6dsnm"
Content-Disposition: inline
In-Reply-To: <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
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


--afbbamzjyar6dsnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> On the userspace side fchmodat(3) is implemented as a wrapper
> function which implements the POSIX-specified interface. This
> interface differs from the underlying kernel system call, which does not
> have a flags argument. Most implementations require procfs [1][2].
>=20
> There doesn't appear to be a good userspace workaround for this issue
> but the implementation in the kernel is pretty straight-forward.
>=20
> The new fchmodat2() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> unlike existing fchmodat.
>=20
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/unix/s=
ysv/linux/fchmodat.c;h=3D17eca54051ee28ba1ec3f9aed170a62630959143;hb=3Da492=
b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> [2] https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=3D718=
f363bc2067b6487900eddc9180c84e7739f80#n28
>=20
> Co-developed-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/open.c                | 18 ++++++++++++++----
>  include/linux/syscalls.h |  2 ++
>  2 files changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/fs/open.c b/fs/open.c
> index 0c55c8e7f837..39a7939f0d00 100644
> --- a/fs/open.c
> +++ b/fs/open.c
> @@ -671,11 +671,11 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, =
mode)
>  	return err;
>  }
> =20
> -static int do_fchmodat(int dfd, const char __user *filename, umode_t mod=
e)
> +static int do_fchmodat(int dfd, const char __user *filename, umode_t mod=
e, int lookup_flags)

I think it'd be much neater to do the conversion of AT_ flags here and
pass 0 as a flags argument for all of the wrappers (this is how most of
the other xyz(), fxyz(), fxyzat() syscall wrappers are done IIRC).

>  {
>  	struct path path;
>  	int error;
> -	unsigned int lookup_flags =3D LOOKUP_FOLLOW;
> +
>  retry:
>  	error =3D user_path_at(dfd, filename, lookup_flags, &path);
>  	if (!error) {
> @@ -689,15 +689,25 @@ static int do_fchmodat(int dfd, const char __user *=
filename, umode_t mode)
>  	return error;
>  }
> =20
> +SYSCALL_DEFINE4(fchmodat2, int, dfd, const char __user *, filename,
> +		umode_t, mode, int, flags)
> +{
> +	if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
> +		return -EINVAL;

We almost certainly want to support AT_EMPTY_PATH at the same time.
Otherwise userspace will still need to go through /proc when trying to
chmod a file handle they have.

> +
> +	return do_fchmodat(dfd, filename, mode,
> +			flags & AT_SYMLINK_NOFOLLOW ? 0 : LOOKUP_FOLLOW);
> +}
> +
>  SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
>  		umode_t, mode)
>  {
> -	return do_fchmodat(dfd, filename, mode);
> +	return do_fchmodat(dfd, filename, mode, LOOKUP_FOLLOW);
>  }
> =20
>  SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
>  {
> -	return do_fchmodat(AT_FDCWD, filename, mode);
> +	return do_fchmodat(AT_FDCWD, filename, mode, LOOKUP_FOLLOW);
>  }
> =20
>  /*
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index 584f404bf868..6e852279fbc3 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -440,6 +440,8 @@ asmlinkage long sys_chroot(const char __user *filenam=
e);
>  asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
>  asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
>  			     umode_t mode);
> +asmlinkage long sys_fchmodat2(int dfd, const char __user *filename,
> +			     umode_t mode, int flags);
>  asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t=
 user,
>  			     gid_t group, int flag);
>  asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
> --=20
> 2.33.8
>=20

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--afbbamzjyar6dsnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCZL/6CAAKCRAol/rSt+lE
b6sDAP4lsghYpoBg52FejYPCUR5VtRTHaPrZUbfu6F44pCzVHgEAjO6SIBNVvxu2
rHWRVzHnnBK8tOaeoiT0Xiex2/+5PAE=
=mARF
-----END PGP SIGNATURE-----

--afbbamzjyar6dsnm--
