Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55C21E884
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:47:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5WKW5D2BzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:47:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=kPFbutbK; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5W4N26b0zDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:36:04 +1000 (AEST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B94322225
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 06:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594708562;
 bh=rMGDsLugxhJ6ZQ/FTRs1UWrQVzA58IvbXzTThQvg9II=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kPFbutbKKgUJXSiHH0OTfDBjGlJ5KA++yL8URL7JhPTgkklLoUJyDFX+EYKk0Eumi
 21FGhGo46N7BGEkeW9hr9CtVUNJ/q5Hea0icVEGjX5vRVsdS2B2OYojUIpsJ9ZISP7
 yJGXh8pWtUYJARgvVZkqH55srxrlN/jsETL1SrzQ=
Received: by mail-oi1-f178.google.com with SMTP id l63so13069922oih.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 23:36:02 -0700 (PDT)
X-Gm-Message-State: AOAM5328egADJIP89Vy3Qt6wIJYS+FinbiyDy6H5j+wATdfHGHnQfVbN
 ExJe4xjeLp/aMuJtN8FViNJdIoqTyfCl3WVMxrQ=
X-Google-Smtp-Source: ABdhPJxeIqtBGKiL/BO7yZP2m6SYAvzirQX9jLPamq/B/I05RCp3jdo+tgAtgh/y0esL3fR2qht2nHhgvHlmtvjg1H0=
X-Received: by 2002:aca:f257:: with SMTP id q84mr2598467oih.174.1594708560357; 
 Mon, 13 Jul 2020 23:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200713182030.1418041-1-jarkko.sakkinen@linux.intel.com>
 <CAMj1kXGhZYxjZTP+_PGdBy4hZgdeeTNUkuaE_eQKwB4pPAYNXA@mail.gmail.com>
 <20200713220436.2f21d366@oasis.local.home>
In-Reply-To: <20200713220436.2f21d366@oasis.local.home>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Jul 2020 09:35:48 +0300
X-Gmail-Original-Message-ID: <CAMj1kXELzkrXiM=CouaVnQbY-Sfd30ccCk4D+PkY7g63op8Jvg@mail.gmail.com>
Message-ID: <CAMj1kXELzkrXiM=CouaVnQbY-Sfd30ccCk4D+PkY7g63op8Jvg@mail.gmail.com>
Subject: Re: [PATCH 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
To: Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Jul 2020 16:45:34 +1000
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
 Alexei Starovoitov <ast@kernel.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Atish Patra <atish.patra@wdc.com>, Will Deacon <will@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Nayna Jain <nayna@linux.ibm.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dmitry Vyukov <dvyukov@google.com>, Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Babu Moger <Babu.Moger@amd.com>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Ben Dooks <ben-linux@fluff.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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

On Tue, 14 Jul 2020 at 05:04, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 13 Jul 2020 22:49:48 +0300
> Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > On arm64, we no longer use module_alloc for bpf or kprobes, to avoid
> > wasting va space on code that does not need to be loaded close to the
> > kernel. Also, module_alloc() allocates kasan shadow, which is
> > unnecessary for kprobes or bpf programs, which don't have kasan
> > instrumentation.
> >
> > This patch suggests that there are other reasons why conflating
> > allocation of module space and allocating  text pages for other uses
> > is a bad idea, but switching all users to text_alloc() is a step in
> > the wrong direction. It would be better to stop using module_alloc()
> > in core code except in the module loader, and have a generic
> > text_alloc() that can be overridden by the arch if necessary. Note
> > that x86  and s390 are the only architectures that use module_alloc()
> > in ftrace code.
> >
> > Please have a look at alloc_insn_page() or bpf_jit_alloc_exec() in the
> > arm64 tree to see what I mean.
>
> Hmm, so you have another method for allocating memory for trampolines?
> (I haven't looked at those functions you pointed out, out of sheer
> laziness ;-)
>
> It would be nice to implement the trampoline optimization in arm, which
> x86 has (see arch_ftrace_update_trampoline() and
> arch_ftrace_trampoline_func()).
>
> It helps when you have two different callbacks for different functions
> (like having live patching enabled and function tracing enabled, or
> kprobes using ftrace). Each callback will get its own allocated
> trampoline to jump to instead of jumping to the a trampoline that calls
> a looping function that tests to see which callback wants to be called
> by the traced function.
>

So in what sense are ftrace trampolines like kernel modules, apart
from the fact that they are executable pages that live in the vmalloc
space?
