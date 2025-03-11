Return-Path: <linuxppc-dev+bounces-6911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B04A5D1FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 22:50:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC6rr23THz302c;
	Wed, 12 Mar 2025 08:50:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741729852;
	cv=none; b=DPDJWsz4kLC0gfZU7BVx78i8uk02+CBXRYVtyPkKy5t14arrK/M+venr59PlVViIdvTv3JCQ1Mur5dYO52Z3q0jWu3OQz7w+5znZggSyTIEz1Gxa/4S+Alil9/RjAIboP/ItIc+XmOczSVMKxwSJ9+WfbiT58v6vFmW70+iIEsXDe8LjCSNtk+qWoh3PxU8bAS6SB6YZM0wUN35+8bv1v7vwXnC8AIIU0g8L59+jJ1T2rWCyU4N1J96xnyJ3fZLaXB3xj5kcXM6UmxVjdutho03wgYJEadT5XfKFcnFnSRW9/O8DT2Wruqc+UPo0iPhwA/zmpSkPFvQ1z6/8y7XqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741729852; c=relaxed/relaxed;
	bh=ovx5QRchar4AgKbZmcUidnU1Sgp6hJ8J2mWjaBreQxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIZ8ihUWKPFU4FmufBntOxY3Y56v5xwW93YmtjFa/9J6tjJPprvOm80BZZ5x0aMrxAUTAPq4NTo6YYXHVxJ0jv2YxwNowfeiUTk9xVdwn0vC9YW8QdysFHSzMM3Rp7YI38u6CNF035NX6ANS7TW0W350JoLmyC9a+rL/EpDH016y48M+d7kAdUvJm9sdntrHoCinWOBcenYdtH1midcKvTIDP9QlUZoUy6Ptv54P6vR5d0Eyea9xOp8cOSYWL8tB8uRatMUFVrF76n0e72Dm/555bUkKseMuG0HSWW2vwcCMPVxWh9D7HPeVniCk0W6SvPPox/t2jew5kAawYbRTTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=YKUFZma5; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=YKUFZma5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 320 seconds by postgrey-1.37 at boromir; Wed, 12 Mar 2025 08:50:47 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZC6rl2HhHz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 08:50:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ovx5QRchar4AgKbZmcUidnU1Sgp6hJ8J2mWjaBreQxQ=; b=YKUFZma5ooYbfPAxs2e8WpnWGr
	ReBixcYtqsm8p9qp/V9IOpcOD3rDtkAOWoTp+rxRWoG5hAQb7JcEgBz9PjnmIx2B1UkY86AGEE8dA
	vBMJ+HrwLU/e/BTg1Q0w6r/jVzrvxp9U4JLfTMsS9Fk7DOds9lm+Bzlif2BtGz+2KKZrH5q9XSKSr
	0IcAmbvHcysiqhBGxEoiO3ydP+pavx2GPUBMUDLT5kb3QIVZkaXgEpT+S9xdlHJZXw/PiGccrR7QP
	ga+uclZiwdICHah9QStnWzKC8lQo7WOlF+qgO+zqhsf6THT7hbqGpimkd2yAJxmeRlK+JidELtIKv
	Wz1UWjfQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57706)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ts7OX-0004di-0b;
	Tue, 11 Mar 2025 21:44:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ts7ON-0003qi-0R;
	Tue, 11 Mar 2025 21:44:03 +0000
Date: Tue, 11 Mar 2025 21:44:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 10/13] arch, mm: set high_memory in free_area_init()
Message-ID: <Z9Cuoi7Aj7d_K8HF@shell.armlinux.org.uk>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk>
 <Z9Cl8JKkRGhaRrgM@kernel.org>
 <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 09:33:29PM +0000, Mark Brown wrote:
> On Tue, Mar 11, 2025 at 11:06:56PM +0200, Mike Rapoport wrote:
> > On Tue, Mar 11, 2025 at 05:51:06PM +0000, Mark Brown wrote:
> 
> > > This patch appears to be causing breakage on a number of 32 bit arm
> > > platforms, including qemu's virt-2.11,gic-version=3.  Affected platforms
> > > die on boot with no output, a bisect with qemu points at this commit and
> > > those for physical platforms appear to be converging on the same place.
> 
> > Can you share how this can be reproduced with qemu?
> 
> https://lava.sirena.org.uk/scheduler/job/1184953
> 
> Turns out it's actually producing output on qemu:
> 
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.14.0-rc6-next-20250311 (tuxmake@tuxmake) (arm-linux-gnueabihf-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP @1741691801
> [    0.000000] CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=10c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
> [    0.000000] OF: fdt: Machine model: linux,dummy-virt
> [    0.000000] random: crng init done
> [    0.000000] earlycon: pl11 at MMIO 0x09000000 (options '')
> [    0.000000] printk: legacy bootconsole [pl11] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] efi: UEFI not found.
> [    0.000000] cma: Reserved 64 MiB at 0x00000000
> 
> - I'd only been sampling the logs for the physical platforms, none of
> which had shown anything.
> 
> (you dropped me from the CCs BTW!)

That's because your emails contain a "Mail-Followup-To:" header.

Please read:

https://datatracker.ietf.org/doc/html/draft-ietf-drums-mail-followup-to-00.txt

particularly 2.4.

In effect, by including this header, you asked to be dropped.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

