Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B9F761F1B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 18:45:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=xs+z7HJk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9NDg0l2hz3cM2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 02:45:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=xs+z7HJk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cyphar.com (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=cyphar@cyphar.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 420 seconds by postgrey-1.37 at boromir; Wed, 26 Jul 2023 02:44:20 AEST
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9NCm1Bwvz30g9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 02:44:19 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4R9NCZ27t2z9snK;
	Tue, 25 Jul 2023 18:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1690303450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NhMQtHSaX0D9/heUhyPM8vbexj0LLJL/SLwgv/4J66M=;
	b=xs+z7HJkLxY38isY2NFAC6u5APDrMMm97JEO8nyvz4mCpIgRQYyuv3PYZeoEifbt3+ONjr
	9GhBI3WxM0TFj0CA4W4RfGe3Qz1P3M+Sp+D1wzV+FJlolrUrXAJdOsJIyG8sFkusm+vrp6
	Kqlv9PZ2tzdohFmynbZWAQls0rI8gBfbT+K+8wTG1WxW27l7nNYloGwPzvry4ZoJKkwxjf
	aPuK59hQ3lk/7zxP0rpXOpbpkiT2xbPT/0xeN6NqXrXuKMB3elBc+TWbaB8o2xN49aFxLD
	FZ1nLID/B0fYusdvulw84QUUptxLxPc+CEyUpbPoCmdIzg/BzMRNR1pMRHiAhw==
Date: Wed, 26 Jul 2023 02:43:41 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
Message-ID: <nbtxxotfsotuiepm7r4tegc4hy5qxe4dfjuqq7rm6qkkevooxh@4hacgjwit4or>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzaj6wzgrp7s4fka"
Content-Disposition: inline
In-Reply-To: <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
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


--yzaj6wzgrp7s4fka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>=20
> This registers the new fchmodat2 syscall in most places as nuber 452,
> with alpha being the exception where it's 562.  I found all these sites
> by grepping for fspick, which I assume has found me everything.

Shouldn't this patch be squashed with the patch that adds the syscall?
At least, that's how I've usually seen it done...

> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/arm/tools/syscall.tbl                  | 1 +
>  arch/arm64/include/asm/unistd.h             | 2 +-
>  arch/arm64/include/asm/unistd32.h           | 2 ++
>  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
>  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
>  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
>  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>  arch/s390/kernel/syscalls/syscall.tbl       | 1 +
>  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
>  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
>  arch/x86/entry/syscalls/syscall_32.tbl      | 1 +
>  arch/x86/entry/syscalls/syscall_64.tbl      | 1 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
>  include/uapi/asm-generic/unistd.h           | 5 ++++-
>  19 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 1f13995d00d7..ad37569d0507 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -491,3 +491,4 @@
>  559	common  futex_waitv                     sys_futex_waitv
>  560	common	set_mempolicy_home_node		sys_ni_syscall
>  561	common	cachestat			sys_cachestat
> +562	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
> index 8ebed8a13874..c572d6c3dee0 100644
> --- a/arch/arm/tools/syscall.tbl
> +++ b/arch/arm/tools/syscall.tbl
> @@ -465,3 +465,4 @@
>  449	common	futex_waitv			sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/uni=
std.h
> index 64a514f90131..bd77253b62e0 100644
> --- a/arch/arm64/include/asm/unistd.h
> +++ b/arch/arm64/include/asm/unistd.h
> @@ -39,7 +39,7 @@
>  #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
>  #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
> =20
> -#define __NR_compat_syscalls		452
> +#define __NR_compat_syscalls		453
>  #endif
> =20
>  #define __ARCH_WANT_SYS_CLONE
> diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/u=
nistd32.h
> index d952a28463e0..78b68311ec81 100644
> --- a/arch/arm64/include/asm/unistd32.h
> +++ b/arch/arm64/include/asm/unistd32.h
> @@ -909,6 +909,8 @@ __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
>  __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
>  #define __NR_cachestat 451
>  __SYSCALL(__NR_cachestat, sys_cachestat)
> +#define __NR_fchmodat2 452
> +__SYSCALL(__NR_fchmodat2, sys_fchmodat2)
> =20
>  /*
>   * Please add new compat syscalls above this comment and update
> diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/sys=
calls/syscall.tbl
> index f8c74ffeeefb..83d8609aec03 100644
> --- a/arch/ia64/kernel/syscalls/syscall.tbl
> +++ b/arch/ia64/kernel/syscalls/syscall.tbl
> @@ -372,3 +372,4 @@
>  449	common  futex_waitv                     sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/sys=
calls/syscall.tbl
> index 4f504783371f..259ceb125367 100644
> --- a/arch/m68k/kernel/syscalls/syscall.tbl
> +++ b/arch/m68k/kernel/syscalls/syscall.tbl
> @@ -451,3 +451,4 @@
>  449	common  futex_waitv                     sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaz=
e/kernel/syscalls/syscall.tbl
> index 858d22bf275c..a3798c2637fd 100644
> --- a/arch/microblaze/kernel/syscalls/syscall.tbl
> +++ b/arch/microblaze/kernel/syscalls/syscall.tbl
> @@ -457,3 +457,4 @@
>  449	common  futex_waitv                     sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel=
/syscalls/syscall_n32.tbl
> index 1976317d4e8b..152034b8e0a0 100644
> --- a/arch/mips/kernel/syscalls/syscall_n32.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
> @@ -390,3 +390,4 @@
>  449	n32	futex_waitv			sys_futex_waitv
>  450	n32	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	n32	cachestat			sys_cachestat
> +452	n32	fchmodat2			sys_fchmodat2
> diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel=
/syscalls/syscall_n64.tbl
> index cfda2511badf..cb5e757f6621 100644
> --- a/arch/mips/kernel/syscalls/syscall_n64.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
> @@ -366,3 +366,4 @@
>  449	n64	futex_waitv			sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	n64	cachestat			sys_cachestat
> +452	n64	fchmodat2			sys_fchmodat2
> diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel=
/syscalls/syscall_o32.tbl
> index 7692234c3768..1a646813afdc 100644
> --- a/arch/mips/kernel/syscalls/syscall_o32.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
> @@ -439,3 +439,4 @@
>  449	o32	futex_waitv			sys_futex_waitv
>  450	o32	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	o32	cachestat			sys_cachestat
> +452	o32	fchmodat2			sys_fchmodat2
> diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel=
/syscalls/syscall.tbl
> index a0a9145b6dd4..e97c175b56f9 100644
> --- a/arch/parisc/kernel/syscalls/syscall.tbl
> +++ b/arch/parisc/kernel/syscalls/syscall.tbl
> @@ -450,3 +450,4 @@
>  449	common	futex_waitv			sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kern=
el/syscalls/syscall.tbl
> index 8c0b08b7a80e..20e50586e8a2 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -538,3 +538,4 @@
>  449	common  futex_waitv                     sys_futex_waitv
>  450 	nospu	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/sys=
calls/syscall.tbl
> index a6935af2235c..0122cc156952 100644
> --- a/arch/s390/kernel/syscalls/syscall.tbl
> +++ b/arch/s390/kernel/syscalls/syscall.tbl
> @@ -454,3 +454,4 @@
>  449  common	futex_waitv		sys_futex_waitv			sys_futex_waitv
>  450  common	set_mempolicy_home_node	sys_set_mempolicy_home_node	sys_set_=
mempolicy_home_node
>  451  common	cachestat		sys_cachestat			sys_cachestat
> +452  common	fchmodat2		sys_fchmodat2			sys_fchmodat2
> diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscall=
s/syscall.tbl
> index 97377e8c5025..e90d585c4d3e 100644
> --- a/arch/sh/kernel/syscalls/syscall.tbl
> +++ b/arch/sh/kernel/syscalls/syscall.tbl
> @@ -454,3 +454,4 @@
>  449	common  futex_waitv                     sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/s=
yscalls/syscall.tbl
> index faa835f3c54a..4ed06c71c43f 100644
> --- a/arch/sparc/kernel/syscalls/syscall.tbl
> +++ b/arch/sparc/kernel/syscalls/syscall.tbl
> @@ -497,3 +497,4 @@
>  449	common  futex_waitv                     sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/sysc=
alls/syscall_32.tbl
> index bc0a3c941b35..2d0b1bd866ea 100644
> --- a/arch/x86/entry/syscalls/syscall_32.tbl
> +++ b/arch/x86/entry/syscalls/syscall_32.tbl
> @@ -456,3 +456,4 @@
>  449	i386	futex_waitv		sys_futex_waitv
>  450	i386	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	i386	cachestat		sys_cachestat
> +452	i386	fchmodat2		sys_fchmodat2
> diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/sysc=
alls/syscall_64.tbl
> index 227538b0ce80..814768249eae 100644
> --- a/arch/x86/entry/syscalls/syscall_64.tbl
> +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> @@ -373,6 +373,7 @@
>  449	common	futex_waitv		sys_futex_waitv
>  450	common	set_mempolicy_home_node	sys_set_mempolicy_home_node
>  451	common	cachestat		sys_cachestat
> +452	common	fchmodat2		sys_fchmodat2
> =20
>  #
>  # Due to a historical design error, certain syscalls are numbered differ=
ently
> diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel=
/syscalls/syscall.tbl
> index 2b69c3c035b6..fc1a4f3c81d9 100644
> --- a/arch/xtensa/kernel/syscalls/syscall.tbl
> +++ b/arch/xtensa/kernel/syscalls/syscall.tbl
> @@ -422,3 +422,4 @@
>  449	common  futex_waitv                     sys_futex_waitv
>  450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
>  451	common	cachestat			sys_cachestat
> +452	common	fchmodat2			sys_fchmodat2
> diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic=
/unistd.h
> index fd6c1cb585db..abe087c53b4b 100644
> --- a/include/uapi/asm-generic/unistd.h
> +++ b/include/uapi/asm-generic/unistd.h
> @@ -820,8 +820,11 @@ __SYSCALL(__NR_set_mempolicy_home_node, sys_set_memp=
olicy_home_node)
>  #define __NR_cachestat 451
>  __SYSCALL(__NR_cachestat, sys_cachestat)
> =20
> +#define __NR_fchmodat2 452
> +__SYSCALL(__NR_fchmodat2, sys_fchmodat2)
> +
>  #undef __NR_syscalls
> -#define __NR_syscalls 452
> +#define __NR_syscalls 453
> =20
>  /*
>   * 32 bit systems traditionally used different
> --=20
> 2.33.8
>=20

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--yzaj6wzgrp7s4fka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCZL/7vQAKCRAol/rSt+lE
b88sAQD4KXrIzAlVFucJ7DKTnpNnoeGTRV9abqha7vz3S15u1AEAyRWUlgztrrwo
TzhSTW+dH8OU6zKYNYc5IkSReIHxSQ8=
=DIhi
-----END PGP SIGNATURE-----

--yzaj6wzgrp7s4fka--
