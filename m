Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F86421F1BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 14:44:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5gF26wyXzDqTK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 22:44:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ar1cDZLa; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5fhq4zzQzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 22:19:39 +1000 (AEST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8ED022250F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594729177;
 bh=73cu8NzDGBuqOXhOBF+rg0NLb3dQh7k1JimFoYpB24w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ar1cDZLafHpWY/gHpnUvdxJdUxoLVpUsM8q464FqW1ohRBXgAQVPSH0HrjeAZ4pal
 MyVXKEXfTUVJmjWorcI2M8qI1sWkou0ScUc/0+Ik/SQ4y9+0oyYqsO0fDOrjFxoAOH
 DOgc4Ct7o4Ui5Qq2mFJlYXm0Q+5t3ATgdPod5TZ0=
Received: by mail-oi1-f182.google.com with SMTP id k6so13705082oij.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 05:19:37 -0700 (PDT)
X-Gm-Message-State: AOAM5316IhgN6IPErzJVhC5cH/kImw781U6SJ+s7MWX6Z0ymW5LsXUrV
 14F1Cjz6ydU4ThzFMDYst5VWlQMFh5hqamK8QuE=
X-Google-Smtp-Source: ABdhPJxRxTNProj1NH8Oaajy/to/u8CmhErFBN+XMz1+9P1Fq4i4bVbpLEv1Ps3p6Pb5Kjhx8Fs0CzAuCp0KEK65nzk=
X-Received: by 2002:aca:f257:: with SMTP id q84mr3507154oih.174.1594729175795; 
 Tue, 14 Jul 2020 05:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200714102826.GB4756@willie-the-truck>
 <20200714112927.GV10769@hirez.programming.kicks-ass.net>
In-Reply-To: <20200714112927.GV10769@hirez.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Jul 2020 15:19:24 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGG4vxWrp1de1FxdU=8F4Jof00=T1x-7e+BW7_HP-oZMQ@mail.gmail.com>
Message-ID: <CAMj1kXGG4vxWrp1de1FxdU=8F4Jof00=T1x-7e+BW7_HP-oZMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
 David Howells <dhowells@redhat.com>,
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

On Tue, 14 Jul 2020 at 14:31, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jul 14, 2020 at 11:28:27AM +0100, Will Deacon wrote:
>
> > As Ard says, module_alloc() _is_ special, in the sense that the virtual
> > memory it allocates wants to be close to the kernel text, whereas the
> > concept of allocating executable memory is broader and doesn't have these
> > restrictions. So, while I'm in favour of having a text_alloc() interface
> > that can be used by callers which only require an executable mapping, I'd
> > much prefer for the module_alloc() code to remain for, err, modules.
>
> So on x86 all those things (kprobes, bpf, ftrace) require that same
> closeness.
>
> An interface like the late vmalloc_exec() will simply not work for us.
>

Fair enough. So for x86, implementing text_alloc() as an alias of
module_alloc() makes sense. But that is not the case in general.

> We recently talked about arm64-kprobes and how you're not doing any of
> the optimizations and fully rely on the exception return. And I see
> you're one of the few archs that has bpf_jit_alloc_exec() (also,
> shouldn't you be using PAGE_KERNEL_EXEC there?). But the BPF core seems
> to use module_alloc() as a default means of allocating text.
>

Indeed. Which means it uses up module space which may be scarce,
especially on 32-bit ARM, and gets backed by kasan shadow pages, which
only makes sense for modules (if CONFIG_KASAN=y)

>
> So what should this look like? Have a text_alloc() with an argument that
> indicates where? But then I suppose we also need a means to manage PLT
> entries. Otherwise I don't exactly see how you're going to call BPF
> code, or how that BPF stuff is going to call back into its helpers.
>

If x86 chooses to back its implementation of text_alloc() by
module_alloc(), that is absolutely fine. But arm64 has no use for
text_alloc() at all today (bpf and kprobes don't use module_alloc(),
and ftrace does not implement dynamic trampoline allocation), and in
the general case, bpf, kprobes, ftrace and the module loader all have
different requirements that deviate subtly between architectures.

So perhaps the answer is to have text_alloc() not with a 'where'
argument but with a 'why' argument. Or more simply, just have separate
alloc/free APIs for each case, with generic versions that can be
overridden by the architecture.
