Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023251EAA3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 02:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kwkw01X6Bz3cC8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 10:00:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xyhXwE5T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=new4-smtp.messagingengine.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=xyhXwE5T; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwkvK46kSz3bZt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 09:59:54 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 62C585810CD;
 Sat,  7 May 2022 19:59:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 07 May 2022 19:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651967990; x=
 1651975190; bh=QTgRzNLqn7nTVpn4kEmk9hjonN4SIouDolNH8iVgiLs=; b=x
 yhXwE5TnGDXuuNwf54vPo1myGUH3NoA0fbqOh35QFU69RQVVilaeCqHjF4940KGW
 ObQCxFRPvPnismpi8nsZySyqcbu72zxQxx+eLsmlVQKIh8aN2Mac6nsj6wtJHNaa
 EWebIh9iDQOmBp75hegASiIr+LraEUUQQHN/TtU/mWjGf1OH5vKlxzYzxlEy7B7g
 r9dNK0XzD7Za9S2u8mjB85p/tkE3XYzle24fsW3pI/MrTI6I58Jqfuh35WmmvmRE
 GBFK1VnfhrO5G5PO+YBhtHiXZgJ/7MTB3Wjzi80yCETO2PpoyypGdjh7Dig1WtGZ
 y+/DWCIgG0ZchwYn4Uebg==
X-ME-Sender: <xms:7Ad3YgzFozHLPh-Tuvv9Gqa4JW7NHgoXVD6uHnxvGJEZ-tkIihVCDA>
 <xme:7Ad3YkTKyZysYg2yiwmXhP33c2XVZ7wWIz7D3BIhSt0Rngayh0bii6CYLN5SiPksG
 -cNLBt1xruZDjtSVV4>
X-ME-Received: <xmr:7Ad3YiWPtHMCCzEwEeO0M89qLJMqu8cAc2Md3CmzBWr_Ga-NWofXlYyUHOriwh52P-UrqY86yVyM6vrfUu01QnBZ1skBohaDr88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeeiheejvdetgfeitddutefhkeeilefhveehgfdvtdekkedvkeehffdtkeev
 vdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:7Ad3Yuice80PD-V4uxHnQ1Erm7oI19uB5cOkarRVxo8MljzuuE853Q>
 <xmx:7Ad3YiADvp59I8imKHk5XlTEJp7UmvBetFQM0RlFZ9BlDwZ444knHQ>
 <xmx:7Ad3YvKwHHBZFwpac1G-LQnfrNPsBIz1Q832CQdz3sq_FGN8sc0f2A>
 <xmx:9gd3Yk2F_FbIkiIJajz3nA0al_jEr6hrURnhe-kUGx-pn8yEEL4ZWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 May 2022 19:59:34 -0400 (EDT)
Date: Sun, 8 May 2022 09:59:37 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
Message-ID: <6f33385-5612-7042-e1b3-aa32895e91e0@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas>
 <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
 <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
 <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org>
 <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
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
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
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


Hi Arnd,

On Sat, 7 May 2022, Arnd Bergmann wrote:

> On Sat, May 7, 2022 at 2:01 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > On Fri, 6 May 2022, Niklas Schnelle wrote:
> > > On Fri, 2022-05-06 at 19:12 +1000, Finn Thain wrote:
> > > > On Thu, 5 May 2022, Bjorn Helgaas wrote:
> > > > >
> > > > > I mooted a s390 inb() implementation like "return ~0" because that's
> > > > > what happens on most arches when there's no device to respond to the
> > > > > inb().
> > > > >
> > > > > The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter
> > > > > drivers that use I/O ports in some cases but not others.  But maybe
> > > > > it's the most practical way.
> > > > >
> > > >
> > > > Do you mean, "the most practical way to avoid a compiler warning on
> > > > s390"? What about "#pragma GCC diagnostic ignored"?
> > >
> > > This actually happens with clang.
> >
> > That suggests a clang bug to me. If you believe GCC should behave like
> > clang, then I guess the pragma above really is the one you want. If you
> > somehow feel that the kernel should cater to gcc and clang even where they
> > disagree then you would have to use "#pragma clang diagnostic ignored".
> 
> I don't see how you can blame the compiler for this. On architectures
> with a zero PCI_IOBASE, an inb(0x2f8) literally becomes
> 
>         var = *(u8*)((NULL + 0x2f8);
> 
> If you run a driver that does this, the kernel gets a page fault for
> the NULL page
> and reports an Oops. clang tells you 'warning: performing pointer
> arithmetic on a null pointer has undefined behavior', which is not exactly
> spot on, but close enough to warn you that you probably shouldn't do this. gcc
> doesn't warn here, but it does warn about an array out-of-bounds access when
> you pass such a pointer into memcpy or another string function.
> 

The appeal to UB is weak IMHO. Pointer arithmetic with a zero value is 
unambiguous and the compiler generates the code to implement the expected 
behaviour just fine.

UB is literally an omission in the standard. Well, low level programming 
has always been beyond the scope of C standards. If architectural-level 
code wants to do arithmetic with an arbitrary integer values, and the 
compiler doesn't like it, then the relevant warnings should be disabled 
for those expressions.

> > > Apart from that, I think this would also fall under the same argument as
> > > the original patch Linus unpulled. We would just paint over someting
> > > that we know at compile time won't work:
> > >
> > > https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> > >
> >
> > I wasn't advocating adding any warnings.
> >
> > If you know at compile time that a driver won't work, the usual solution
> > is scripts/config -d CONFIG_SOME_UNDESIRED_DRIVER. Why is that no
> > longer appropriate for drivers that use IO ports?
> 
> This was never an option, we rely on 'make allmodconfig' to build 
> without warnings on all architectures for finding regressions.

"All modules on all architectures with all compilers and checkers with all 
warnings enabled"? That's not even vaguely realistic.

How about, "All modules on all architectures with a nominated compiler 
with the appropriate warnings enabled."

> Any driver that depends on architecture specific interfaces must not get 
> selected on architectures that don't have those interfaces.
> 

Kconfig always met that need before we got saddled with -Werror.

That suggests to me that we need a "bool CONFIG_WARINGS_INTO_ERRORS" to 
control -Werror, which could be disabled for .config files (like make 
allmodconfig) where it is not helping.
