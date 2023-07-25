Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CC761F92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 18:52:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=kSmWzfYu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9NNl2MH0z3cG1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 02:52:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=cyphar.com header.i=@cyphar.com header.a=rsa-sha256 header.s=MBO0001 header.b=kSmWzfYu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cyphar.com (client-ip=2001:67c:2050:0:465::202; helo=mout-p-202.mailbox.org; envelope-from=cyphar@cyphar.com; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9NMv0ZkRz3bYt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 02:51:22 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4R9NMl0vV4z9sT1;
	Tue, 25 Jul 2023 18:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1690303875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oXu7I2w2GulAbsjkAbhBaZ0d5Ez9Ymu2aocx4QCikLk=;
	b=kSmWzfYu0h5RiTQdQhuOq6it0MoOiZSf3kDgxT/+cq1LY2gaqgps8UYFoHqeIEJZu3gl3Y
	6NfO6pwEzKCD/FvCRHx/mqdIegvQ/xl7XBtbCWyNeZKkLoJYNVo2fbFaa337PF09aPHP6s
	Pl0K38zR38aZQ86S1uv2GiAEqLJIYLuc9RjcsgJwCXiQ911NIuvw8DS1OGefalEOwy3G4n
	KQ6maBX4klVBvsIqPSP4EVbp/eKJmPJVCbjW7W/CHYeRncxiKGHJavwOxVN7JsO5FrBQZc
	nb3oLM1e0fdNJTRxem86wTiDhq20paUp4CP7Y3BaHa+ddyDai81fX7CP4bOPqg==
Date: Wed, 26 Jul 2023 02:50:50 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: Add fchmodat2() - or add a more general syscall?
Message-ID: <u7lakye7ikvyu6g2ktxbzixt5hnvqtzt5s4g72j74tgg4bwlpu@7pcqd4ah5tah>
References: <cover.1689092120.git.legion@kernel.org>
 <cover.1689074739.git.legion@kernel.org>
 <104971.1690300714@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sqz3gv5iaglclup7"
Content-Disposition: inline
In-Reply-To: <104971.1690300714@warthog.procyon.org.uk>
X-Rspamd-Queue-Id: 4R9NMl0vV4z9sT1
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@hansenpartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, fweimer@redhat.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linuxppc-dev@lis
 ts.ozlabs.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--sqz3gv5iaglclup7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023-07-25, David Howells <dhowells@redhat.com> wrote:
> Rather than adding a fchmodat2() syscall, should we add a "set_file_attrs=
()"
> syscall that takes a mask and allows you to set a bunch of stuff all in o=
ne
> go?  Basically, an interface to notify_change() in the kernel that would =
allow
> several stats to be set atomically.  This might be of particular interest=
 to
> network filesystems.

Presumably looking something like statx(2) (except hopefully with
extensible structs this time :P)? I think that could also be useful, but
given this is a fairly straight-forward syscall addition (and it also
would resolve the AT_EMPTY_PATH issue for chmod as well as simplify the
glibc wrapper), I think it makes sense to take this and we can do
set_statx(2) separately?

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--sqz3gv5iaglclup7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCZL/9agAKCRAol/rSt+lE
b9muAP9aP2TUmAAHS6rOFH9Gf6v2e1/S/NcOkGphCidcAt2ZiwEAzjtee/kbCs2+
akroOcjwVI11LFf34VRyguX0zOzOWQ4=
=pGFN
-----END PGP SIGNATURE-----

--sqz3gv5iaglclup7--
