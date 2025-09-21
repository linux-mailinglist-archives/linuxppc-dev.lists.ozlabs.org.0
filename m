Return-Path: <linuxppc-dev+bounces-12488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D415AB8D525
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Sep 2025 07:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTvN85WSRz30P3;
	Sun, 21 Sep 2025 15:06:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758431176;
	cv=none; b=B4vUQEhuJevk3eaneX2zrP+F5gYJbQ6m/fdEIZ0CZjc78e5ITCtMa6yZeH5Ru2YfNwwVgunUbpdMDMCe0qBOso/CVIuEdEvM4Midcm9A8aRtRvCJl2kOCPQuvpDew1q0Z90JWhvC/+zTAf8tgOyAZkSk/242AS+CiMRXojTa4xTI2a/ZqTdte9Kd+cI7H6R8VDzk7UYB97/xuco3UcVhxnfG3Om5w5UX8hZdh44pwY7KyNlFb1m/HySnYuQbvlorMgIro+eSt/tdc/Di6gH+iG5zXIdQ9DyyNxI46mV1VUXV2dDor4NiO5jbB7g4/ETcR543udzWBbTqg8rRLlAMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758431176; c=relaxed/relaxed;
	bh=NvoDm3rY6iriVEHdymAWHHxK+7OKvhuVhhBYM9dD7Fk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mH9OAzfgG3jiFUVpTPfoctjRdN46NpQcqDcN/H7BXmGuzE+07lOjsTKQ7yKHtC2WkDWRxRcmcew3wCLSaOKCUtr/3LQrJl9iFTUPyMh46z/RC2WZc2R+wR5mHXn+BRxK07MbjEeVib1Z4dtZVZb7R7Z2H/gODHyM9ACsEdHW3VFZlhETpeP558zLVjlis/hWd6dvwhlmO0Nx5x9mrbbFL0u7Mm81OutJfCZeL8D0Er53sELO0o1g11G/74/0a82n9HfMzdCk24DU+QlM5HrUt2qxCSPbE4FLqwK97+Wau13lzEyzT9U80XwwmpWZ3jSR/gEfY30VccvVe7logM87XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=MjKEzTBC; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=MjKEzTBC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTvN427bHz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 15:06:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=NvoDm3rY6iriVEHdymAWHHxK+7OKvhuVhhBYM9dD7Fk=; t=1758431172;
	x=1759035972; b=MjKEzTBCLLoVvr819h9OhPK41k88USZrDwPGeX9Y7lo8sTMCkNOvXntMZLjhJ
	QmKxKhfVCM7Icsn/EZ6kpvGbl0hYA3sn6iMaY64H0EbwTg5zVNb8zGtQSlPPU7eHHdDThhE6+87WN
	RSXRM82E5BzdyPkPqAtNaJOvJR5UVkSQ8FkaBY+bC8FpwGqhFMdNEGkUpsDD5qkPqhs4F/Ht9dGAB
	5fdd8DHy/1xeQQs6Q2M6IQRg2R6v7b1WA1qvpGhd3CT9uC4J1fmDYCkIL2lcxbQEd38UG1GzLvbAd
	3sBMHyR5/Mq137xTvfN6BbqFqZ9IYKXOk9TkY26GGqI7uquITA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1v0CGh-00000000RZV-2NJn; Sun, 21 Sep 2025 07:05:47 +0200
Received: from dynamic-002-245-016-030.2.245.pool.telefonica.de ([2.245.16.30] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1v0CGh-00000002SmM-0yJw; Sun, 21 Sep 2025 07:05:47 +0200
Message-ID: <9198795c08a6c3d448bbcbdfe620ada792af8dd3.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
  Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,  Andreas Larsson
 <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, John Stultz
 <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>,  Russell King <linux@armlinux.org.uk>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman	 <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy	
 <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui	 <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev	 <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>, Nagarathnam Muthusamy
 <nagarathnam.muthusamy@oracle.com>, Shannon Nelson	 <sln@onemain.com>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann	
 <arnd@kernel.org>
Date: Sun, 21 Sep 2025 07:05:44 +0200
In-Reply-To: <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
References: 
	<20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
	 <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
	 <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 2.245.16.30
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Thomas,

On Sat, 2025-09-20 at 16:37 +0200, Thomas Wei=C3=9Fschuh wrote:
> Sep 20, 2025 15:25:11 John Paul Adrian Glaubitz <glaubitz@physik.fu-berli=
n.de>:
>=20
> > On Wed, 2025-09-17 at 16:00 +0200, Thomas Wei=C3=9Fschuh wrote:
> > > The generic vDSO provides a lot common functionality shared between
> > > different architectures. SPARC is the last architecture not using it,
> > > preventing some necessary code cleanup.
> > >=20
> > > Make use of the generic infrastructure.
> > >=20
> > > Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> > > https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org=
/
> > >=20
> > > Tested on a Niagara T4 and QEMU.
> > >=20
> > > This has a semantic conflict with my series "vdso: Reject absolute
> > > relocations during build". The last patch of this series expects all =
users
> > > of the generic vDSO library to use the vdsocheck tool.
> > > This is not the case (yet) for SPARC64. I do have the patches for the
> > > integration, the specifics will depend on which series is applied fir=
st.
> > >=20
> > > Based on tip/timers/vdso.
> >=20
> > Could you share a version of the series based on top of 6.17.0-rcN for
> > testing purposes? I would like to test the series on a Sun Netra 240
> > which is based on the UltraSPARC IIIi.
>=20
> Here is the git branch based on rc4:
> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.g=
it/log/?h=3Db4/vdso-sparc64-generic-2
>=20
> Does that work for you?

Thanks, I'll give it a try.

> Thanks for testing!

Of course, I want to make sure the kernel stays working on these machines a=
nd
you're introducing large changes.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

