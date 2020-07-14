Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE7D21EE2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 12:45:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5cbd2WCgzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 20:45:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5bS45lVHzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 19:53:24 +1000 (AEST)
IronPort-SDR: hLUGmt6SfNSj9WEhz+h4C8g/om0TiHIbXT46bC+yZWFKR+SRMmkcegMJHDsCjLA8uzq8zpFAWU
 rRqS+asxIGJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="210390057"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="210390057"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 02:53:21 -0700
IronPort-SDR: RDFryWjT5IPgyN0I9WSx3D0rEVyZsRnRcmM2w8IlDz5eZHQ5NWNaSaMHRdjqbP5kEXT4e4FnSP
 cdXTPY+LWXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="459634031"
Received: from rmarti11-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.57])
 by orsmga005.jf.intel.com with ESMTP; 14 Jul 2020 02:52:44 -0700
Date: Tue, 14 Jul 2020 12:52:43 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200714095243.GB1442951@linux.intel.com>
References: <20200713182030.1418041-1-jarkko.sakkinen@linux.intel.com>
 <CAMj1kXGhZYxjZTP+_PGdBy4hZgdeeTNUkuaE_eQKwB4pPAYNXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGhZYxjZTP+_PGdBy4hZgdeeTNUkuaE_eQKwB4pPAYNXA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 14 Jul 2020 20:36:21 +1000
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
 Jiri Olsa <jolsa@redhat.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Paul E. McKenney" <paulmck@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 KP Singh <kpsingh@chromium.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 13, 2020 at 10:49:48PM +0300, Ard Biesheuvel wrote:
> This patch suggests that there are other reasons why conflating
> allocation of module space and allocating  text pages for other uses
> is a bad idea, but switching all users to text_alloc() is a step in
> the wrong direction. It would be better to stop using module_alloc()
> in core code except in the module loader, and have a generic
> text_alloc() that can be overridden by the arch if necessary. Note
> that x86  and s390 are the only architectures that use module_alloc()
> in ftrace code.

This series essentially does this: introduces text_alloc() and
text_memfree(), which have generic implementations in kernel/text.c.
Those can be overriddent by arch specific implementations.

What you think should be done differently than in my patch set?

/Jarkko
