Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A470F51D59F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 12:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvmmZ4pfJz3byl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 20:20:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=orcam.me.uk
 (client-ip=78.133.224.34; helo=angie.orcam.me.uk;
 envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Kvmm831VGz3bpw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 20:20:22 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 245B192009C; Fri,  6 May 2022 12:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 1C7D492009B;
 Fri,  6 May 2022 11:20:17 +0100 (BST)
Date: Fri, 6 May 2022 11:20:17 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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

On Thu, 5 May 2022, Arnd Bergmann wrote:

> > I'm hearing that generic powerpc kernels have to run both on machines
> > that have I/O port space and those that don't.  That makes me think
> > s390 could do something similar.
> 
> No, this is actually the current situation, and it makes absolutely no
> sense. s390 has no way of implementing inb()/outb() because there
> are no instructions for it and it cannot tunnel them through a virtual
> address mapping like on most of the other architectures. (it has special
> instructions for accessing memory space, which is not the same as
> a pointer dereference here).

 I think I'm missing something here.  IIUC we're talking about a PCI/PCIe 
bus used with s390 hardware, right?

 (It has to be PCI/PCIe, because other than x86/IA-64 host buses there are 
only PCI/PCIe and EISA/ISA buses out there that define I/O access cycles 
and EISA/ISA have long been obsoleted except perhaps from some niche use.)

 If this is PCI/PCIe indeed, then an I/O access is just a different bit 
pattern put on the bus/in the TLP in the address phase.  So what is there 
inherent to the s390 architecture that prevents that different bit pattern 
from being used?

 If anything, I could imagine the same limitation as with current POWER9 
implementations, that is whatever glue is used to wire PCI/PCIe to the 
rest of the system does not implement a way to use said bit pattern (which 
has nothing to do with the POWER9 processor instruction set).

 But that has nothing to do with the presence or absence of any specific 
processor instructions.  It's just a limitation of bus glue.  So I guess 
it's just that all PCI/PCIe glue logic implementations for s390 have such 
a limitation, right?

  Maciej
