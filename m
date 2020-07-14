Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B74E021FD34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 21:21:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5r3H3TlszDqfk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 05:21:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ej0Npcb8; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5hfs4nGRzDq9D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 23:48:05 +1000 (AEST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CEA722573
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594734483;
 bh=yV9G4WhEOGaoK6Il+H9mPMXNjfLFX8IfAQzn4ImAixg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ej0Npcb8fNFWg1vBf5WNLx1x77pBxhzCcxpNZa2fTWT8F4zNfDdH2Oo5qtZwKBOo/
 ONed1yPIgdlKtBSv9/OcFyVrwJyUvv7kqf3HhQmUrXyGmql4BNaiDVmb4QKNguo27g
 yB8i6q5bLc93VC/5OYzZxuKifPt8ptXYWH83ZcHQ=
Received: by mail-oi1-f174.google.com with SMTP id w17so13944536oie.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 06:48:03 -0700 (PDT)
X-Gm-Message-State: AOAM5305KtuuU+8LhEJqP283cuQpFx4Ar/MRfJkCbjrzNb8Ae2P//S3I
 f2Sq8Amb0fatPee/pPeEpyo/OqAccdCtl33nopA=
X-Google-Smtp-Source: ABdhPJy/1Cux9+6ZnseXECfbForWtZNclWpw5ZiOAd2Qg7q6wJRd3+ty4JsR2s5dvUNAQhoVNz0c4ER49glKkT0VvXs=
X-Received: by 2002:aca:d643:: with SMTP id n64mr3713476oig.33.1594734481784; 
 Tue, 14 Jul 2020 06:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200714102826.GB4756@willie-the-truck>
 <20200714112927.GV10769@hirez.programming.kicks-ass.net>
 <CAMj1kXGG4vxWrp1de1FxdU=8F4Jof00=T1x-7e+BW7_HP-oZMQ@mail.gmail.com>
 <20200714130109.GX10769@hirez.programming.kicks-ass.net>
 <20200714133314.GA67386@C02TD0UTHF1T.local>
In-Reply-To: <20200714133314.GA67386@C02TD0UTHF1T.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Jul 2020 16:47:50 +0300
X-Gmail-Original-Message-ID: <CAMj1kXH25uLo4otzZBEda7oRrmyZewPTfqF4nv-SgcfXXNj0_w@mail.gmail.com>
Message-ID: <CAMj1kXH25uLo4otzZBEda7oRrmyZewPTfqF4nv-SgcfXXNj0_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
To: Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 15 Jul 2020 05:16:19 +1000
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
 Andrew Morton <akpm@linux-foundation.org>,
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
 Paul Walmsley <paul.walmsley@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Atish Patra <atish.patra@wdc.com>, Will Deacon <will@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Nayna Jain <nayna@linux.ibm.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
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
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
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
 KP Singh <kpsingh@chromium.org>, Dmitry Vyukov <dvyukov@google.com>,
 Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jul 2020 at 16:33, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Tue, Jul 14, 2020 at 03:01:09PM +0200, Peter Zijlstra wrote:
> > On Tue, Jul 14, 2020 at 03:19:24PM +0300, Ard Biesheuvel wrote:
> > > So perhaps the answer is to have text_alloc() not with a 'where'
> > > argument but with a 'why' argument. Or more simply, just have separate
> > > alloc/free APIs for each case, with generic versions that can be
> > > overridden by the architecture.
> >
> > Well, there only seem to be 2 cases here, either the pointer needs to
> > fit in some immediate displacement, or not.
>
> On some arches you have a few choices for immediates depending on
> compiler options, e.g. on arm64:
>
> * +/- 128M with B
> * +/-4G with ADRP+ADD+BR
> * +/- 48/64 bits with a series of MOVK* + BR
>
> ... and you might build core kernel one way and modules another, and
> either could depend on configuration.
>
> > On x86 we seem have the advantage of a fairly large immediate
> > displacement as compared to many other architectures (due to our
> > variable sized instructions). And thus have been fairly liberal with our
> > usage of it (also our indirect jmps/calls suck, double so with
> > RETCH-POLINE).
> >
> > Still, the indirect jump, as mentioned by Russel should work for
> > arbitrarily placed code for us too.
> >
> >
> > So I'm thinking that something like:
> >
> > enum ptr_type {
> >       immediate_displacement,
> >       absolute,
> > };
> >
> > void *text_alloc(unsigned long size, enum ptr_type type)
> > {
> >       unsigned long vstart = VMALLOC_START;
> >       unsigned long vend   = VMALLOC_END;
> >
> >       if (type == immediate_displacement) {
> >               vstart = MODULES_VADDR;
> >               vend   = MODULES_END;
> >       }
> >
> >       return __vmalloc_node_range(size, TEXT_ALIGN, vstart, vend,
> >                                   GFP_KERNEL, PAGE_KERNEL_EXEC, 0,
> >                                   NUMA_NO_NODE, _RET_IP_);
> > }
> >
> > void text_free(void *ptr)
> > {
> >       vfree(ptr);
> > }
>
> I think it'd be easier to read with separate functions, e.g.
>
>   text_alloc_imm_offset(unsigned long size);
>   text_alloc_absolute(unsigned long size);
>

On arm64, we have a 128M window close to the core kernel for modules,
and a separate 128m window for bpf  programs, which are kept in
relative branching range of each other, but could be far away from
kernel+modules, and so having 'close' and 'far' as the only
distinction is insufficient.

> > Should work for all cases. Yes, we might then want something like a per
> > arch:
> >
> >       {BPF,FTRACE,KPROBE}_TEXT_TYPE
>
> ... at that point why not:
>
>   text_alloc_ftrace();
>   text_alloc_module();
>   text_alloc_bpf();
>   text_alloc_kprobe();
>
> ... etc which an arch can alias however it wants? e.g. x86 can have
> those all go to a common text_alloc_generic(), and that could even be a
> generic option for arches that don't care to distinguish these cases.
>

That is basically what i meant with separate alloc/free APIs, which i
think is the sanest approach here.

> Then if there are new places that want to allocate text we have to
> consider their requirements when adding them, too.
>
> Thanks,
> Mark.
