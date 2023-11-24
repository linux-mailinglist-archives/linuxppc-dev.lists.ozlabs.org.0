Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB17F85B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 23:00:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ASSOqFUT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScTS15Mcmz3vgm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 09:00:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ASSOqFUT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScDF22p53z3cZP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 23:04:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0A61EB8301D;
	Fri, 24 Nov 2023 12:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12FAC433C7;
	Fri, 24 Nov 2023 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700827484;
	bh=iYS7ANsuZ6vwOLgQk5XN795HJ5oXfHcHZNUjCJ6SXCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASSOqFUTTJHCjKWaYnDmAWOsdJx6xpTr/qPcu1HB+Fm5a/QclWrV0vncK2Q3Q7xX2
	 aCCX9KBbw2Az9X58fZvG86NOH/nrOeX7BVzsNXr5gajrQU9ziayJ62atPHT8DwDcCc
	 ahgZtb/ixwvuzDrehPu48aUVx6G2ccUCRb+KcZHUWGGyWnosZcOgffotJMEG6Q3zmg
	 BKh8HHr1sjhFvHUZ1Iby4sERa66rD1silvF54u1GkmzyyDomzoGyssBaqUowuIrSEm
	 G36HFkUDw4hjv0/b3iAj4rjrfH4/y0Ks3nDD/1Xr+xB/Qamv83b+9r9W6Jyz43KFdu
	 6MPuY/CW+rmPA==
Date: Fri, 24 Nov 2023 12:04:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Message-ID: <ZWCRWArzbTYUjvon@finisterre.sirena.org.uk>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="woSdJmrFfLwaS8m2"
Content-Disposition: inline
In-Reply-To: <20231108125843.3806765-16-arnd@kernel.org>
X-Cookie: Am I in GRADUATE SCHOOL yet?
X-Mailman-Approved-At: Sat, 25 Nov 2023 08:57:59 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen N.
  Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, Aishwarya TCV <aishwarya.tcv@arm.com>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overst
 reet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--woSdJmrFfLwaS8m2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 01:58:36PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The VDSO functions are defined as globals in the kernel sources but inten=
ded
> to be called from userspace, so there is no need to declare them in a ker=
nel
> side header.

This is in -next as commit 42874e4eb35bdfc54f8514685e50434098ba4f6c and
breaks an arm64 defconfig build, the 32 bit vDSO build is broken:

/build/stage/linux/arch/arm64/kernel/vdso32/vgettimeofday.c:10:5: error: co=
nflic
ting types for =E2=80=98__vdso_clock_gettime=E2=80=99; have =E2=80=98int(cl=
ockid_t,  struct old_timespec
32 *)=E2=80=99 {aka =E2=80=98int(int,  struct old_timespec32 *)=E2=80=99}
   10 | int __vdso_clock_gettime(clockid_t clock,
      |     ^~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/arch/arm64/kernel/vdso32/vgettimeo=
fday.
c:8:
/build/stage/linux/include/vdso/gettime.h:16:5: note: previous declaration =
of =E2=80=98__vdso_clock_gettime=E2=80=99 with type =E2=80=98int(clockid_t,=
  struct __kernel_timespec *)=E2=80=99 {aka =E2=80=98int(int,  struct __ker=
nel_timespec *)=E2=80=99}
   16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec =
*ts);
      |     ^~~~~~~~~~~~~~~~~~~~
/build/stage/linux/arch/arm64/kernel/vdso32/vgettimeofday.c:28:5: error: co=
nflicting types for =E2=80=98__vdso_clock_getres=E2=80=99; have =E2=80=98in=
t(clockid_t,  struct old_timespec32 *)=E2=80=99 {aka =E2=80=98int(int,  str=
uct old_timespec32 *)=E2=80=99}
   28 | int __vdso_clock_getres(clockid_t clock_id,
      |     ^~~~~~~~~~~~~~~~~~~
/build/stage/linux/include/vdso/gettime.h:15:5: note: previous declaration =
of =E2=80=98__vdso_clock_getres=E2=80=99 with type =E2=80=98int(clockid_t, =
 struct __kernel_timespec *)=E2=80=99 {aka =E2=80=98int(int,  struct __kern=
el_timespec *)=E2=80=99}
   15 | int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *=
res);
      |     ^~~~~~~~~~~~~~~~~~~

--woSdJmrFfLwaS8m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVgkVgACgkQJNaLcl1U
h9Dz9gf/VMa1PvhU/bO1IxdTJVCJWAk44qPipqzqyUg2pLaBosU5v8Dx8eAPyIg0
DgxKA9Cycd3l3JSSqWIwJ1xEztqi2CvdmV5Ljrml8UqOvqHNPtg16JgCCOZ+Ssww
82B8fl93C3CmUtTLFx3u3lZRKd7FjyeOiiemekfHvdbZSOn+K6Dk9zvPAE63gI0I
5m6xp+q1eJ7Uyq7o4kCOnJOo/y9eDGX3lGqOsVQ7bnQAH6Id5y32aplMkStvzLKI
TrSlxBsnU/wry1msxEbcgmhN2YebA1wWGNC0j6fT4xg0MzuHevZwPTSm/2sK5Exc
fOQ/QL09MCXtNwNJ3QpItc8VaAFrVQ==
=sHT7
-----END PGP SIGNATURE-----

--woSdJmrFfLwaS8m2--
