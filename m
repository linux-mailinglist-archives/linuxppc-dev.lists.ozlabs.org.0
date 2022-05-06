Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8266651D40E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:12:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvlGK2gQFz3f9K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:12:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=vQKeAQx1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wnew3-smtp.messagingengine.com (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=vQKeAQx1; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvlFf56vBz2yHp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 19:12:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 93A8D2B0562D;
 Fri,  6 May 2022 05:12:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 06 May 2022 05:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651828333; x=
 1651835533; bh=G6gyLdn77rvfE254bKTLUge+Op3KXd37yTLdohreqqM=; b=v
 QKeAQx1x9oi9rnTQnxWzQZ3vTa1sCKU3qAfK8BUdnTNglj/iKAYlugS8ZO/zk5fZ
 DfF7J1EiEgVn1bVYrjCqLYS3iirT+M/yZbaX7X/uei2Gb3LNEQ7gNa/6aO4lyi6K
 Tt7s1lCuwd/NrqgJIxoWaYMl29GOUzitCCOr5c2z9gRbiPjvVQLp/zABVxIqq2ZK
 AaY9nkTVzG/mRRGYLVAR8bBcR5nX8PaiHT4MAiZq+H0Xwj5TbLVla4dy88/3+1AN
 1wI0EAxFufJY3W8/p05bkAWVyXVer+YeXe+Ib7meLr1qgWB/FfkXpkAKjyHMQsJ3
 7g4mWCiNAG2aqihJux0IA==
X-ME-Sender: <xms:YuZ0YjLV7ehbq11Iew8UcQGjF5dzNVZmWTCB44jSQAUnrEzMUanDNw>
 <xme:YuZ0YnLO3AhBi-8UDTh2IshOkP29SbDuTpdLzRv7EABfM46yVxKyoWYDYhcgeRQCS
 77vC9WxTNt6pMrOhv0>
X-ME-Received: <xmr:YuZ0Yruq9kszH8K6PStFW0G6vBqLXoDlJzZGTzPxfq_14sas55UK-gUHN-Zh2nfpt0s4gg2KHxVH05i8KORm6pMmTETF2ks5atM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
 ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:YuZ0YsYfsshGe5L3c7ZGNomVPUHUMo_s6qgakvJ4OzSu-3gGhre-ZQ>
 <xmx:YuZ0YqYvL7cbpdbLSaNh38uTGj9Rc92MFhzYVkQe0DbODJiFYPgAcA>
 <xmx:YuZ0YgAK1cXBpunCnPwlHEy_DcU5yqhXavJmM9Za0lR2vtG4vS6RVA>
 <xmx:beZ0YvPqIgZVZC0ItH0ne5dg6_12BUITfxVdxuoceofiAb6SMND9K6LMeBg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 05:11:59 -0400 (EDT)
Date: Fri, 6 May 2022 19:12:06 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <20220505195342.GA509942@bhelgaas>
Message-ID: <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:IA64 \(Itanium\) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Arnd Bergmann <arnd@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Thu, 5 May 2022, Bjorn Helgaas wrote:

> On Thu, May 05, 2022 at 07:39:42PM +0200, Arnd Bergmann wrote:
> > On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> > > >
> > > > The main goal is to avoid c), which is what happens on s390, but
> > > > can also happen elsewhere. Catching b) would be nice as well,
> > > > but is much harder to do from generic code as you'd need an
> > > > architecture specific inline asm statement to insert a ex_table
> > > > fixup, or a runtime conditional on each access.
> > >
> > > Or s390 could implement its own inb().
> > >
> > > I'm hearing that generic powerpc kernels have to run both on machines
> > > that have I/O port space and those that don't.  That makes me think
> > > s390 could do something similar.
> > 
> > No, this is actually the current situation, and it makes absolutely no
> > sense. s390 has no way of implementing inb()/outb() because there
> > are no instructions for it and it cannot tunnel them through a virtual
> > address mapping like on most of the other architectures. (it has special
> > instructions for accessing memory space, which is not the same as
> > a pointer dereference here).
> > 
> > The existing implementation gets flagged as a NULL pointer dereference
> > by a compiler warning because it effectively is.
> 
> I think s390 currently uses the inb() in asm-generic/io.h, i.e.,
> "__raw_readb(PCI_IOBASE + addr)".  I understand that's a NULL pointer
> dereference because the default PCI_IOBASE is 0.
> 
> I mooted a s390 inb() implementation like "return ~0" because that's
> what happens on most arches when there's no device to respond to the
> inb().
> 
> The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter
> drivers that use I/O ports in some cases but not others.  But maybe
> it's the most practical way.
> 

Do you mean, "the most practical way to avoid a compiler warning on s390"? 
What about "#pragma GCC diagnostic ignored"?
