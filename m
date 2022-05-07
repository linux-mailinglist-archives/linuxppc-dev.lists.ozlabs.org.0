Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135E51E29D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 02:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw70n5J8Gz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 10:02:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CxRLkEfh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=new4-smtp.messagingengine.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=CxRLkEfh; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw7046NjYz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 10:01:54 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 08A20581367;
 Fri,  6 May 2022 20:01:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 May 2022 20:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651881709; x=
 1651888909; bh=hJxEFAuP3W0ocRuq9vLXjN5OlZEUnHk8AMHl1pdwrIw=; b=C
 xRLkEfhUbEyE90JzCIIfMF0OZav1zcZBYtpgecP8ApnTN4fdlBb3TWucKtiiLVnd
 phR+z33NIKiN5vvoQl4oIZhk8c/stiSlc7YKhqnLniKgN7mh6i4gdLlpwMgXN8Jx
 e7Ktbm6oij1Rve4npuV/JXnd7tlkfyM/0Bz3txW/0SUizxpE/JN1o4B4fiIigl5B
 ODk4g+2AMO40GC7n/7n0pEgUnXqDIMz17cgAN6FmIv1e9zegzqwaJ0I+kStibxBe
 g4XBZSsTbqspbyCFDBCsvGdO+loAMO92OKfZTh/4kTG2uqmiuWrZjJm45yvGLmba
 KNmSVM+dKifWafpBnnHDw==
X-ME-Sender: <xms:4rZ1Ytzfx8dyKZqHQrV2iYrMdgRUVRPJ5uUwNS7astnHeUoPA5JP-Q>
 <xme:4rZ1YtQUABIDxMMBtegJM8AXkRrr-tzXbMdH0cN7W3yw1nTwwmuUilavkeuJbaLH-
 jiXIcpKb_V12BfL3wo>
X-ME-Received: <xmr:4rZ1YnWuj7-Y-n3U8_P9SrVRCen9EuBDcbjR5eG7oX-EXFUmoFKaghxcC96Gl5aI4_7s5rHGeJqG5FVCSZIPe5G--o2Z8oFtO20>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeggddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeeiheejvdetgfeitddutefhkeeilefhveehgfdvtdekkedvkeehffdtkeev
 vdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:4rZ1YvjRqTV1kqzGfEZqExc-y3C87C0PjwUsUwS-om8USnmpQPRsXQ>
 <xmx:4rZ1YvD61kgrS-YFzaAD5iTYUCb5iH6iosfkwZGmHVIza5eNfoZf5Q>
 <xmx:4rZ1YoIUIx-XKteSS56qWnxoAmafmX5tikXV710a88-2E5zTPDOJsg>
 <xmx:7bZ1Yh30nOThnpoXJeJtrRg9vb4kwFxuUl_bN4rVDjV8z-IxFV2paA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 20:01:37 -0400 (EDT)
Date: Sat, 7 May 2022 10:01:39 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
Message-ID: <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas>
 <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
 <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
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
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
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


On Fri, 6 May 2022, Niklas Schnelle wrote:

> On Fri, 2022-05-06 at 19:12 +1000, Finn Thain wrote:
> > 
> > On Thu, 5 May 2022, Bjorn Helgaas wrote:
> > 
> > > On Thu, May 05, 2022 at 07:39:42PM +0200, Arnd Bergmann wrote:
> > > > On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> > > > > > The main goal is to avoid c), which is what happens on s390, 
> > > > > > but can also happen elsewhere. Catching b) would be nice as 
> > > > > > well, but is much harder to do from generic code as you'd need 
> > > > > > an architecture specific inline asm statement to insert a 
> > > > > > ex_table fixup, or a runtime conditional on each access.
> > > > > 
> > > > > Or s390 could implement its own inb().
> > > > > 
> > > > > I'm hearing that generic powerpc kernels have to run both on 
> > > > > machines that have I/O port space and those that don't.  That 
> > > > > makes me think s390 could do something similar.
> > > > 
> > > > No, this is actually the current situation, and it makes 
> > > > absolutely no sense. s390 has no way of implementing inb()/outb() 
> > > > because there are no instructions for it and it cannot tunnel them 
> > > > through a virtual address mapping like on most of the other 
> > > > architectures. (it has special instructions for accessing memory 
> > > > space, which is not the same as a pointer dereference here).
> > > > 
> > > > The existing implementation gets flagged as a NULL pointer 
> > > > dereference by a compiler warning because it effectively is.
> > > 
> > > I think s390 currently uses the inb() in asm-generic/io.h, i.e., 
> > > "__raw_readb(PCI_IOBASE + addr)".  I understand that's a NULL 
> > > pointer dereference because the default PCI_IOBASE is 0.
> > > 
> > > I mooted a s390 inb() implementation like "return ~0" because that's 
> > > what happens on most arches when there's no device to respond to the 
> > > inb().
> > > 
> > > The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter 
> > > drivers that use I/O ports in some cases but not others.  But maybe 
> > > it's the most practical way.
> > > 
> > 
> > Do you mean, "the most practical way to avoid a compiler warning on 
> > s390"? What about "#pragma GCC diagnostic ignored"?
> 
> This actually happens with clang.

That suggests a clang bug to me. If you believe GCC should behave like 
clang, then I guess the pragma above really is the one you want. If you 
somehow feel that the kernel should cater to gcc and clang even where they 
disagree then you would have to use "#pragma clang diagnostic ignored".

> Apart from that, I think this would also fall under the same argument as 
> the original patch Linus unpulled. We would just paint over someting 
> that we know at compile time won't work:
> 
> https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> 

I wasn't advocating adding any warnings.

If you know at compile time that a driver won't work, the usual solution 
is scripts/config -d CONFIG_SOME_UNDESIRED_DRIVER. Why is that no 
longer appropriate for drivers that use IO ports?
