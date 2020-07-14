Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394A21F1E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 14:49:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5gMh3XdRzDqdS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 22:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5fXm4KLkzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 22:12:39 +1000 (AEST)
IronPort-SDR: w0PWyNBPAvSCYP4LYbwDH0gx+YyTtJIBTA9ueEwcw227lT/4wHynAS9vUjfT0c8ZRgcWjVJSbi
 3Rfsy4sIYIMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="137016280"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="137016280"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:12:35 -0700
IronPort-SDR: gy5QgnmkOnvrE5FE0suJR8q17BCUDnIMq9U3Z/E6bO2L2CHcMBL7ozMWn6dB19fD/Uv6Qw8RhN
 QKqcw9ce1qhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="317697684"
Received: from pipper-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.46.185])
 by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2020 05:12:01 -0700
Date: Tue, 14 Jul 2020 15:11:59 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200714121159.GD1463346@linux.intel.com>
References: <20200713182030.1418041-1-jarkko.sakkinen@linux.intel.com>
 <CAMj1kXGhZYxjZTP+_PGdBy4hZgdeeTNUkuaE_eQKwB4pPAYNXA@mail.gmail.com>
 <20200714095243.GB1442951@linux.intel.com>
 <CAMj1kXGV_bWehdQvxaMBTOYHXUoFjifBWNpyVy3gaWKktko1mg@mail.gmail.com>
 <20200714103333.GB1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714103333.GB1551@shell.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 14 Jul 2020 22:39:54 +1000
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
 Andy Lutomirski <luto@kernel.org>, Yonghong Song <yhs@fb.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philipp Rudo <prudo@linux.ibm.com>, Torsten Duwe <duwe@lst.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Iurii Zaikin <yzaikin@google.com>,
 Andrii Nakryiko <andriin@fb.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dmitry Vyukov <dvyukov@google.com>, Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>,
 Jiri Olsa <jolsa@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, KP Singh <kpsingh@chromium.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 11:33:33AM +0100, Russell King - ARM Linux admin wrote:
> On Tue, Jul 14, 2020 at 01:17:22PM +0300, Ard Biesheuvel wrote:
> > On Tue, 14 Jul 2020 at 12:53, Jarkko Sakkinen
> > <jarkko.sakkinen@linux.intel.com> wrote:
> > >
> > > On Mon, Jul 13, 2020 at 10:49:48PM +0300, Ard Biesheuvel wrote:
> > > > This patch suggests that there are other reasons why conflating
> > > > allocation of module space and allocating  text pages for other uses
> > > > is a bad idea, but switching all users to text_alloc() is a step in
> > > > the wrong direction. It would be better to stop using module_alloc()
> > > > in core code except in the module loader, and have a generic
> > > > text_alloc() that can be overridden by the arch if necessary. Note
> > > > that x86  and s390 are the only architectures that use module_alloc()
> > > > in ftrace code.
> > >
> > > This series essentially does this: introduces text_alloc() and
> > > text_memfree(), which have generic implementations in kernel/text.c.
> > > Those can be overriddent by arch specific implementations.
> > >
> > > What you think should be done differently than in my patch set?
> > >
> > 
> > On arm64, module_alloc is only used by the module loader, and so
> > pulling it out and renaming it will cause unused code to be
> > incorporated into the kernel when building without module support,
> > which is the use case you claim to be addressing.
> > 
> > Module_alloc has semantics that are intimately tied to the module
> > loader, but over the years, it ended up being (ab)used by other
> > subsystems, which don't require those semantics but just need n pages
> > of vmalloc space with executable permissions.
> > 
> > So the correct approach is to make text_alloc() implement just that,
> > generically, and switch bpf etc to use it. Then, only on architectures
> > that need it, override it with an implementation that has the required
> > additional semantics.
> > 
> > Refactoring 10+ architectures like this without any regard for how
> > text_alloc() deviates from module_alloc() just creates a lot of churn
> > that others will have to clean up after you.
> 
> For 32-bit ARM, our bpf code uses "blx/bx" (or equivalent code
> sequences) rather than encoding a "bl" or "b", so BPF there doesn't
> care where the executable memory is mapped, and doesn't need any
> PLTs.  Given that, should bpf always allocate from the vmalloc()
> region to preserve the module space for modules?

Most of the allocators use __vmalloc_node_range() but arch/nios2
uses just plain kmalloc():

/*
 * Modules should NOT be allocated with kmalloc for (obvious) reasons.
 * But we do it for now to avoid relocation issues. CALL26/PCREL26 cannot reach
 * from 0x80000000 (vmalloc area) to 0xc00000000 (kernel) (kmalloc returns
 * addresses in 0xc0000000)
 */
void *module_alloc(unsigned long size)
{
	if (size == 0)
		return NULL;
	return kmalloc(size, GFP_KERNEL);
}

Also consider arch/x86 module_alloc():

void *module_alloc(unsigned long size)
{
	void *p;

	if (PAGE_ALIGN(size) > MODULES_LEN)
		return NULL;

	p = __vmalloc_node_range(size, MODULE_ALIGN,
				    MODULES_VADDR + get_module_load_offset(),
				    MODULES_END, GFP_KERNEL,
				    PAGE_KERNEL, 0, NUMA_NO_NODE,
				    __builtin_return_address(0));
	if (p && (kasan_module_alloc(p, size) < 0)) {
		vfree(p);
		return NULL;
	}

	return p;
}

The generic version is

void * __weak module_alloc(unsigned long size)
{
	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
			GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
			NUMA_NO_NODE, __builtin_return_address(0));
}

There is quite a lot of divergence from the generic version.

However, in other arch's it's mostly just divergence in vmalloc()
parameters and not as radical as in x86.

I could probably limit the total havoc to just nios2 and x86 if there
is a set of vmalloc parameters that work for all arch's. Then there
could be kernel/text.c and re-implementations for x86 and nios2.

I'm all for having separate text_alloc() and text_memfree() if these
issues can be somehow sorted out.

/Jarkko
