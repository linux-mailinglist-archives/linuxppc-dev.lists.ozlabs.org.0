Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90522C0A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 10:29:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCj684r36zDrp6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 18:29:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCgyD6sJ5zDsNT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 17:37:07 +1000 (AEST)
IronPort-SDR: hgLNAhTz9fIB412AVlL3MacOmdQ0ouMvFs/BEHgYGt0AmuGVnD2LiLiheetx42T3Q6JMvgxTEY
 yJ4rQ1FdKZKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="235550133"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; d="scan'208";a="235550133"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 00:37:02 -0700
IronPort-SDR: TAB03xecSlI4basjrQIy2hbhaeXXyXKAkMJFtaNhpLJDNY3l0q2EBJc0tt5g94JWjrS8//u4J3
 0Kk+Cc01yUeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; d="scan'208";a="288909362"
Received: from cbuerkle-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.36.184])
 by orsmga006.jf.intel.com with ESMTP; 24 Jul 2020 00:36:23 -0700
Date: Fri, 24 Jul 2020 10:36:21 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200724073621.GC1872662@linux.intel.com>
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200716184909.Horde.JVRLLcKix_jhrJfiQYRbbQ1@messagerie.si.c-s.fr>
 <20200723015127.GE45081@linux.intel.com>
 <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 24 Jul 2020 18:27:16 +1000
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
 Guan Xuetao <gxt@pku.edu.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Miroslav Benes <mbenes@suse.cz>, Jiri Olsa <jolsa@redhat.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
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

On Thu, Jul 23, 2020 at 03:42:09PM +0300, Ard Biesheuvel wrote:
> On Thu, 23 Jul 2020 at 04:52, Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > On Thu, Jul 16, 2020 at 06:49:09PM +0200, Christophe Leroy wrote:
> > > Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> a écrit :
> > >
> > > > Rename module_alloc() to text_alloc() and module_memfree() to
> > > > text_memfree(), and move them to kernel/text.c, which is unconditionally
> > > > compiled to the kernel proper. This allows kprobes, ftrace and bpf to
> > > > allocate space for executable code without requiring to compile the modules
> > > > support (CONFIG_MODULES=y) in.
> > >
> > > You are not changing enough in powerpc to have this work.
> > > On powerpc 32 bits (6xx), when STRICT_KERNEL_RWX is selected, the vmalloc
> > > space is set to NX (no exec) at segment level (ie by 256Mbytes zone) unless
> > > CONFIG_MODULES is selected.
> > >
> > > Christophe
> >
> > This has been deduced down to:
> >
> > https://lore.kernel.org/lkml/20200717030422.679972-1-jarkko.sakkinen@linux.intel.com/
> >
> > I.e. not intruding PPC anymore :-)
> >
> 
> Ok, so after the elaborate discussion we had between Jessica, Russell,
> Peter, Will, Mark, you and myself, where we pointed out that
> a) a single text_alloc() abstraction for bpf, kprobes and ftrace does
> not fit other architectures very well, and
> b) that module_alloc() is not suitable as a default to base text_alloc() on,

In the latest iteration (v5) it is conditionally available only if arch
defines and fallback has been removed.

> you went ahead and implemented that anyway, but only cc'ing Peter,
> akpm, Masami and the mm list this time?

No problems with that. Actually each patch gets everything that
get_maintainer.pl gives with a cc cmd script, not just the ones
explicitly listed in the patch.

Should I explicitly CC you to the next version? I'm happy to grow
the list when requested.

> Sorry, but that is not how it works. Once people get pulled into a
> discussion, you cannot dismiss them or their feedback like that and go
> off and do your own thing anyway. Generic features like this are
> tricky to get right, and it will likely take many iterations and input
> from many different people.

Sure. I'm not expecting this move quickly.

I don't think I've at least purposely done that. As you said it's tricky
to get this right.

/Jarkko
