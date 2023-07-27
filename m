Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20E765FF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 00:53:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=UZDWQCSl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBmJz4DCKz3cTh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 08:53:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=UZDWQCSl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cyphar.com (client-ip=2001:67c:2050:0:465::202; helo=mout-p-202.mailbox.org; envelope-from=cyphar@cyphar.com; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBdQZ17Zbz3bVf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 03:43:01 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RBdQK2CNdz9sph;
	Thu, 27 Jul 2023 19:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1690479769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=irvaKwjIRBfIMs3OM027g5G4TY2gjSeGrvplRFueXaU=;
	b=UZDWQCSlVrWdtqreCk6pJhl6N2mvEBs8l+J0GZXLAJ/i0AyNILAKr29Y2HzpDc9MHho6C5
	xVlOhswIJJkR5SSR4ws+giR/x20PVxaPyIM6O/iNQxvH7uAImdu2F/Zw48FGbEcZ6risS0
	REEAuKwEzxnqm3M6cQCiZqnNt+7AoEXIgN0iyVEXl/IgRzie92zZ+gVSh1Z8MCS6kWkRql
	HlKWkqhpMYcbmdMzT3dNoNMTNXKs91TI0m/a0jVKcoSIVgCZEWz4fVmF9rn+0qt15Qn/26
	OISfzUoTd6FBgoUSvJSBOFNpfsyBzgTQSL6tDQROyhhl2eKXxJMNtKy6plit+w==
Date: Fri, 28 Jul 2023 03:42:22 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
Message-ID: <20230727.174206-real.town.kosher.menu-lN1F8uSeAtB@cyphar.com>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
 <nbtxxotfsotuiepm7r4tegc4hy5qxe4dfjuqq7rm6qkkevooxh@4hacgjwit4or>
 <20230727-fangen-olympiade-85fcbdaf03d7@brauner>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y33k3lm4leglkjmq"
Content-Disposition: inline
In-Reply-To: <20230727-fangen-olympiade-85fcbdaf03d7@brauner>
X-Rspamd-Queue-Id: 4RBdQK2CNdz9sph
X-Mailman-Approved-At: Fri, 28 Jul 2023 08:48:48 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, fweimer@redhat.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, gor@linux.ibm.com, fenghua.yu@intel.com, tycho@tycho.ws, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, linuxppc-dev@lists.ozlabs.org, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@
 hansenpartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--y33k3lm4leglkjmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023-07-27, Christian Brauner <brauner@kernel.org> wrote:
> On Wed, Jul 26, 2023 at 02:43:41AM +1000, Aleksa Sarai wrote:
> > On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> > > From: Palmer Dabbelt <palmer@sifive.com>
> > >=20
> > > This registers the new fchmodat2 syscall in most places as nuber 452,
> > > with alpha being the exception where it's 562.  I found all these sit=
es
> > > by grepping for fspick, which I assume has found me everything.
> >=20
> > Shouldn't this patch be squashed with the patch that adds the syscall?
> > At least, that's how I've usually seen it done...
>=20
> Depends. Iirc, someone said they'd prefer for doing it in one patch
> in some circumstances on some system call we added years ago. But otoh,
> having the syscall wiring done separately makes it easy for arch
> maintainers to ack only the wiring up part. Both ways are valid imho.
> (cachestat() did it for x86 and then all the others separately. So
> really it seems a bit all over the place depending on the scenario.)

Fair enough!

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--y33k3lm4leglkjmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCZMKsfgAKCRAol/rSt+lE
b/FwAQChKTWhN1YMxOU/bLQz1S3i+RhA8DQHZpoCbh1FlOSYwAEAmOKfPG+e4zNA
VW75+QkpKlGw0rY3TfjxW8YkGfonXgo=
=/4Tp
-----END PGP SIGNATURE-----

--y33k3lm4leglkjmq--
