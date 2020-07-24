Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F77822E329
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 00:44:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFJ0b4p2lzDqP5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 08:44:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCtr625LJzF1RK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:47:33 +1000 (AEST)
IronPort-SDR: JJIkoc4EvWIO4OsYSR4r9ANgAVf6uHiPsiqcYVzZBTK2d/jrjQXVTFZkIinUWwzM6BrwRO2P7L
 vrwkNnHSIqHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9692"; a="212272273"
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="212272273"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 08:47:27 -0700
IronPort-SDR: mEEvLVGw49kcLRQfPZFp1jNlLAzx7ijrCWdV0BmV8Ca+I1GMr2U0qQ0Wxo2AzsAPmTcm93xEuQ
 ZLA3g5xQ9nHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="311441549"
Received: from dschukli-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.3])
 by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2020 08:47:00 -0700
Date: Fri, 24 Jul 2020 18:46:59 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200724154659.GA1879026@linux.intel.com>
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200716184909.Horde.JVRLLcKix_jhrJfiQYRbbQ1@messagerie.si.c-s.fr>
 <20200723015127.GE45081@linux.intel.com>
 <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
 <20200724073621.GC1872662@linux.intel.com>
 <20200724080508.GA17719@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200724080508.GA17719@linux-8ccs>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 27 Jul 2020 08:43:04 +1000
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Paul Mackerras <paulus@samba.org>,
 Zong Li <zong.li@sifive.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Petr Mladek <pmladek@suse.com>, Brian Gerst <brgerst@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Kosina <jkosina@suse.cz>, Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philipp Rudo <prudo@linux.ibm.com>, Torsten Duwe <duwe@lst.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Vincent Chen <deanbo422@gmail.com>, Omar Sandoval <osandov@fb.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Yonghong Song <yhs@fb.com>, Iurii Zaikin <yzaikin@google.com>,
 Andrii Nakryiko <andriin@fb.com>, Thomas Huth <thuth@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Miroslav Benes <mbenes@suse.cz>, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, KP Singh <kpsingh@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 10:05:08AM +0200, Jessica Yu wrote:
> +++ Jarkko Sakkinen [24/07/20 10:36 +0300]:
> > On Thu, Jul 23, 2020 at 03:42:09PM +0300, Ard Biesheuvel wrote:
> > > On Thu, 23 Jul 2020 at 04:52, Jarkko Sakkinen
> > > <jarkko.sakkinen@linux.intel.com> wrote:
> > > >
> > > > On Thu, Jul 16, 2020 at 06:49:09PM +0200, Christophe Leroy wrote:
> > > > > Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> a écrit :
> > > > >
> > > > > > Rename module_alloc() to text_alloc() and module_memfree() to
> > > > > > text_memfree(), and move them to kernel/text.c, which is unconditionally
> > > > > > compiled to the kernel proper. This allows kprobes, ftrace and bpf to
> > > > > > allocate space for executable code without requiring to compile the modules
> > > > > > support (CONFIG_MODULES=y) in.
> > > > >
> > > > > You are not changing enough in powerpc to have this work.
> > > > > On powerpc 32 bits (6xx), when STRICT_KERNEL_RWX is selected, the vmalloc
> > > > > space is set to NX (no exec) at segment level (ie by 256Mbytes zone) unless
> > > > > CONFIG_MODULES is selected.
> > > > >
> > > > > Christophe
> > > >
> > > > This has been deduced down to:
> > > >
> > > > https://lore.kernel.org/lkml/20200717030422.679972-1-jarkko.sakkinen@linux.intel.com/
> > > >
> > > > I.e. not intruding PPC anymore :-)
> > > >
> > > 
> > > Ok, so after the elaborate discussion we had between Jessica, Russell,
> > > Peter, Will, Mark, you and myself, where we pointed out that
> > > a) a single text_alloc() abstraction for bpf, kprobes and ftrace does
> > > not fit other architectures very well, and
> > > b) that module_alloc() is not suitable as a default to base text_alloc() on,
> > 
> > In the latest iteration (v5) it is conditionally available only if arch
> > defines and fallback has been removed.
> > 
> > > you went ahead and implemented that anyway, but only cc'ing Peter,
> > > akpm, Masami and the mm list this time?
> > 
> > No problems with that. Actually each patch gets everything that
> > get_maintainer.pl gives with a cc cmd script, not just the ones
> > explicitly listed in the patch.
> > 
> > Should I explicitly CC you to the next version? I'm happy to grow
> > the list when requested.
> 
> Yes, please CC everybody that was part of the discussion last time
> especially during v2, and please use a consistent CC list for the
> whole patchset. It is difficult to review when you only receive patch
> 1 out of 6 with no mention of text_alloc() anywhere and without being
> CC'd on the cover letter.
> 
> Jessica

I'll make the following additions to the CC list (in alphabetical
order):

  Cc: Ard Biesheuvel <ardb@kernel.org>
  Cc: Jessica Yu <jeyu@kernel.org>
  Cc: Mark Rutland <mark.rutland@arm.com>,
  Cc: Mike Rapoport <rppt@kernel.org>
  Cc: Russell King <linux@armlinux.org.uk>
  Cc: Will Deacon <will@kernel.org>

This is also reflected now in the kprobes branch of
https://github.com/jsakkine-intel/linux-sgx.git. My candidate patches
are located in my SGX tree because I mainly use them when poking SGX.
The patches are kind of sidekick of SGX upstreaming process.

/Jarkko
