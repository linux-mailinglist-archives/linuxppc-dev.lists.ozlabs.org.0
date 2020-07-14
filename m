Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3941721EE56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 12:50:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5cjf3R0CzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 20:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=DksICHfF; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5c022ncKzDqBd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:17:38 +1000 (AEST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A62FA221FF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594721855;
 bh=tldfCbGX7WNIgoKko/oLYaOyXTRH6GokxksB76il3+4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DksICHfFzLTi2jnMW6IqkkfB6+xn8fJMlnPu8j1reZowCIHMLfNFnXzU52PvyNYbZ
 j2TK2ZFVmqCoCb7Q2LLLsKqkXHWKPUKGZI4JRVcJxLZqa2UBZz2ZLVRauu/Mv7h/ec
 pYk/GtMhAIcYsVlBfKFsxVJMnf21GFNnqPMFbWBo=
Received: by mail-oi1-f177.google.com with SMTP id h17so13522140oie.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:17:35 -0700 (PDT)
X-Gm-Message-State: AOAM5337zBRj0pLk4VCJczAiJYhkHdWDM/WUvI9IW6tLECw+sKsmoDh+
 obOLIK1o+8fvCNdi+/wHXhmsCfRmsf+R0Rr2cTg=
X-Google-Smtp-Source: ABdhPJxHHl/ZjkVDcXGAU0II8SE5bwBs6xJ0c4UdVyd0y5ppCMRxVQyn5lUlldodDVcBZUaDabRWLahEt2DwHdim5zE=
X-Received: by 2002:aca:d643:: with SMTP id n64mr3011967oig.33.1594721853647; 
 Tue, 14 Jul 2020 03:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200713182030.1418041-1-jarkko.sakkinen@linux.intel.com>
 <CAMj1kXGhZYxjZTP+_PGdBy4hZgdeeTNUkuaE_eQKwB4pPAYNXA@mail.gmail.com>
 <20200714095243.GB1442951@linux.intel.com>
In-Reply-To: <20200714095243.GB1442951@linux.intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Jul 2020 13:17:22 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGV_bWehdQvxaMBTOYHXUoFjifBWNpyVy3gaWKktko1mg@mail.gmail.com>
Message-ID: <CAMj1kXGV_bWehdQvxaMBTOYHXUoFjifBWNpyVy3gaWKktko1mg@mail.gmail.com>
Subject: Re: [PATCH 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 14 Jul 2020 at 12:53, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Mon, Jul 13, 2020 at 10:49:48PM +0300, Ard Biesheuvel wrote:
> > This patch suggests that there are other reasons why conflating
> > allocation of module space and allocating  text pages for other uses
> > is a bad idea, but switching all users to text_alloc() is a step in
> > the wrong direction. It would be better to stop using module_alloc()
> > in core code except in the module loader, and have a generic
> > text_alloc() that can be overridden by the arch if necessary. Note
> > that x86  and s390 are the only architectures that use module_alloc()
> > in ftrace code.
>
> This series essentially does this: introduces text_alloc() and
> text_memfree(), which have generic implementations in kernel/text.c.
> Those can be overriddent by arch specific implementations.
>
> What you think should be done differently than in my patch set?
>

On arm64, module_alloc is only used by the module loader, and so
pulling it out and renaming it will cause unused code to be
incorporated into the kernel when building without module support,
which is the use case you claim to be addressing.

Module_alloc has semantics that are intimately tied to the module
loader, but over the years, it ended up being (ab)used by other
subsystems, which don't require those semantics but just need n pages
of vmalloc space with executable permissions.

So the correct approach is to make text_alloc() implement just that,
generically, and switch bpf etc to use it. Then, only on architectures
that need it, override it with an implementation that has the required
additional semantics.

Refactoring 10+ architectures like this without any regard for how
text_alloc() deviates from module_alloc() just creates a lot of churn
that others will have to clean up after you.
