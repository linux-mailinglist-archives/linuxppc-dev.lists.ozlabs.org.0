Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03F6B9590
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 14:09:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbYkz6jRSz3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 00:09:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=SSLmaeHS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:191:4433::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=SSLmaeHS;
	dkim-atps=neutral
X-Greylist: delayed 1681 seconds by postgrey-1.36 at boromir; Wed, 15 Mar 2023 00:08:25 AEDT
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbYk128Nfz3byj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 00:08:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=pOg2+UYpTygnBlX1RyGCO9nWu9fsmXuoawMaiLoDXLo=;
	t=1678799305; x=1680008905; b=SSLmaeHS0yWqN7gYdZZ55es7gHpbdsuQZxJ909m2oKS78Rl
	AH4n3YDZ2hcyKQg+Z3rr4L6Fji4vFmIBGzfVwsrveKFrKJ2nwf/3IyjRckVG/cr+z7RieBa32dnyE
	DSnMZ/JtWKtwFNjmI595ruI2HMjC3pPwxHb2Ja225OEuQd1McQlCLERQd69Zz3sSmtf4ZeXM6HY/F
	sDsiPySz/BirdOxWTvfw6v7VpQINKId6KWLBDpmmYAA0vG137iq1pU3qi2Q9dNBKHddaTBvonebNq
	mJSWi2MydgFRz9zmSvNRZDje6kFEeM/0VKdtOgzzco5j7XaUR/8ih2Vza6FPT/pg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pc3uU-003AIF-1Y;
	Tue, 14 Mar 2023 13:37:46 +0100
Message-ID: <21a828bae06b97b8ca806a6b76d867902b1e0e1f.camel@sipsolutions.net>
Subject: Re: [PATCH v3 01/38] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
From: Johannes Berg <johannes@sipsolutions.net>
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
  Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>,  Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller"
 <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,  Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Date: Tue, 14 Mar 2023 13:37:43 +0100
In-Reply-To: <20230314121216.413434-2-schnelle@linux.ibm.com>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
	 <20230314121216.413434-2-schnelle@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-um@lists.infradead.org, sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Alan Stern <stern@rowland.harvard.edu>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-03-14 at 13:11 +0100, Niklas Schnelle wrote:
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -56,6 +56,7 @@ config NO_IOPORT_MAP
> =20
>  config ISA
>  	bool
> +	depends on HAS_IOPORT
>=20

config ISA here is already unselectable, and nothing ever does "select
ISA" (only in some other architectures), so is there much point in this?

I'm not even sure why this exists at all.

But anyway, adding a dependency to a always-false symbol doesn't make it
less always-false :-)

Acked-by: Johannes Berg <johannes@sipsolutions.net> # for ARCH=3Dum


Certainly will be nice to get rid of this cruft for architectures that
don't have it.

johannes
