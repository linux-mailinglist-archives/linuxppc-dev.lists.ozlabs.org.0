Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CE22B0B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 15:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCDBx1XBGzDrFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 23:46:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=02Vv0U2Z; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCBmw3g3xzDr9v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 22:42:24 +1000 (AEST)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8353922CB1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595508141;
 bh=TSMF9Uc+5daioIvdeF9DAcbq0vLaPsBcHFGOkoFFr+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=02Vv0U2Z2CCPFADwEeEcWBIpD7oTHgU7XgKZ+1FwPjghxmWkPnFXN/u4sf2Va5Q6a
 ibEU+v5ji0sjbxBZfAsB+DDxBWImAgC5SQHjUWJhXntACFHImDmLuHNuYXMAQBAGly
 oiOJJ8kGe8NXaes8LDXZiVRn7CWSdyBlK8tqiXWI=
Received: by mail-oo1-f44.google.com with SMTP id g18so233064ooa.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 05:42:21 -0700 (PDT)
X-Gm-Message-State: AOAM533GQazPMq1dNOTNGGWFk40ORwH2gHSXr0C6UZAewDK45uUSJ3Mp
 HqhV8XfDcbBPf/dWGaXNr33SHRiDn2XdGcZXel0=
X-Google-Smtp-Source: ABdhPJzxPjXzUf2k7YfseaUoCAeLBxiHqfEThV6II5h8ZcTuX1Bw+3ZPhgTLyTbvLwBjiaVbhfmN5Xqev9w0jDnY1OA=
X-Received: by 2002:a4a:b006:: with SMTP id f6mr4328373oon.13.1595508140700;
 Thu, 23 Jul 2020 05:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200716184909.Horde.JVRLLcKix_jhrJfiQYRbbQ1@messagerie.si.c-s.fr>
 <20200723015127.GE45081@linux.intel.com>
In-Reply-To: <20200723015127.GE45081@linux.intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 23 Jul 2020 15:42:09 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
Message-ID: <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 23 Jul 2020 23:44:27 +1000
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

On Thu, 23 Jul 2020 at 04:52, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2020 at 06:49:09PM +0200, Christophe Leroy wrote:
> > Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> a =C3=A9crit :
> >
> > > Rename module_alloc() to text_alloc() and module_memfree() to
> > > text_memfree(), and move them to kernel/text.c, which is unconditiona=
lly
> > > compiled to the kernel proper. This allows kprobes, ftrace and bpf to
> > > allocate space for executable code without requiring to compile the m=
odules
> > > support (CONFIG_MODULES=3Dy) in.
> >
> > You are not changing enough in powerpc to have this work.
> > On powerpc 32 bits (6xx), when STRICT_KERNEL_RWX is selected, the vmall=
oc
> > space is set to NX (no exec) at segment level (ie by 256Mbytes zone) un=
less
> > CONFIG_MODULES is selected.
> >
> > Christophe
>
> This has been deduced down to:
>
> https://lore.kernel.org/lkml/20200717030422.679972-1-jarkko.sakkinen@linu=
x.intel.com/
>
> I.e. not intruding PPC anymore :-)
>

Ok, so after the elaborate discussion we had between Jessica, Russell,
Peter, Will, Mark, you and myself, where we pointed out that
a) a single text_alloc() abstraction for bpf, kprobes and ftrace does
not fit other architectures very well, and
b) that module_alloc() is not suitable as a default to base text_alloc() on=
,

you went ahead and implemented that anyway, but only cc'ing Peter,
akpm, Masami and the mm list this time?

Sorry, but that is not how it works. Once people get pulled into a
discussion, you cannot dismiss them or their feedback like that and go
off and do your own thing anyway. Generic features like this are
tricky to get right, and it will likely take many iterations and input
from many different people.
