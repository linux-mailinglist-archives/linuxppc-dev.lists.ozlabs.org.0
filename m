Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FAA7213B3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 00:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYZTh0jTxz3fbV
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 08:36:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RDS3HF6D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=puranjay12@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RDS3HF6D;
	dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYXcm5kJtz3dt9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 07:12:06 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b1b6865c7cso17708251fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jun 2023 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685826722; x=1688418722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywQUs5Fiz0nF2jpbvNI9hUxAw7fBwSlpxtNbhNWOdKQ=;
        b=RDS3HF6Dzg4udc+gzR1ge+A8FipEjdhBSdULq7dQD2UyV6dgjBvuZgGerD6vUs2YSm
         VDnqI9KNtr2Dk7Dcagvb3z7MHB6yFn9dZVHE0avEHhNOnZSxu+haoNYcH+DbvcdZqhp2
         V/2FcSs+Og/LSo+4chvosoksvs7WCJCCw38bmEWjYWWbCKP1NNCl8K5ura9Sf0w8P5PP
         7V+264OxyeQzdq0h0Oa1oSNUiGbjJiqkYN3172ascXs+vGBmB8K0oc564ajmaECysFRA
         O+qDRdpmwpV7013SWgjBPZmxYgAbk4/aYxoKzE2wIVyrPNGanFSOTGWVNORuh+LwDAsi
         f1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685826722; x=1688418722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywQUs5Fiz0nF2jpbvNI9hUxAw7fBwSlpxtNbhNWOdKQ=;
        b=Ts/nqlUZcWtf5mQtu6/hkBjY5Q8bOEv4HRPv2pl4ZrZXT/9jpWyrpY/tcr4cQ/1M2M
         1GqbBKnzw7wWvtn5mRzR42PMnZx63LI5B5TB/aulD24UC8tlGE61I8+UiYgzvYuMPDY8
         BbcHdmauOX+RSEvQaziB8ZPzowk9QKrV5U1VX2/8vqaBVTbUtTcX94/WR/DfYC8cRJNK
         H7RzLgEdlf0XN3xRiMmRKwJ35KNe+GYWMumXf0eMgD2tNYy9A0GC4L1TdurlPibBMq/j
         d0RYq3aNJ8Ri2wA1yNtwatzlmy06vbcLzjGjWN5syKPTHgvMU6anV8zzXtvBVhT8+ucq
         OjhQ==
X-Gm-Message-State: AC+VfDwKu/2eMuT6NSya7bc+oSwk3nU+gXa0uJvd7noKSLJLisZRHnds
	0dvefowL6BJNJ0Dfz0XonXJZEm7sjxwVKw7OhGU=
X-Google-Smtp-Source: ACHHUZ7QpjsIySl/XiT4DfbanAj3JM5KVAqgA/T1nohoUOzVT96eBA8GwqXTmRgv+kLRpCQJ8cFP5VM7V3QLXDceJ3I=
X-Received: by 2002:a2e:88d6:0:b0:2a7:b986:3481 with SMTP id
 a22-20020a2e88d6000000b002a7b9863481mr1909233ljk.41.1685826722179; Sat, 03
 Jun 2023 14:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N> <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
In-Reply-To: <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Sat, 3 Jun 2023 23:11:51 +0200
Message-ID: <CANk7y0jtFA4sKgh2o2gAydLNzOxfZ0r3LVRuzzTGS8Qv0BuJGg@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 04 Jun 2023 08:34:39 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@
 vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 2, 2023 at 8:21=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Fri, Jun 2, 2023 at 2:35=E2=80=AFAM Mark Rutland <mark.rutland@arm.com=
> wrote:
> >
> > On Thu, Jun 01, 2023 at 02:14:56PM -0400, Kent Overstreet wrote:
> > > On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> > > > For a while I have wanted to give kprobes its own allocator so that=
 it can work
> > > > even with CONFIG_MODULES=3Dn, and so that it doesn't have to waste =
VA space in
> > > > the modules area.
> > > >
> > > > Given that, I think these should have their own allocator functions=
 that can be
> > > > provided independently, even if those happen to use common infrastr=
ucture.
> > >
> > > How much memory can kprobes conceivably use? I think we also want to =
try
> > > to push back on combinatorial new allocators, if we can.
> >
> > That depends on who's using it, and how (e.g. via BPF).
> >
> > To be clear, I'm not necessarily asking for entirely different allocato=
rs, but
> > I do thinkg that we want wrappers that can at least pass distinct start=
+end
> > parameters to a common allocator, and for arm64's modules code I'd expe=
ct that
> > we'd keep the range falblack logic out of the common allcoator, and jus=
t call
> > it twice.
> >
> > > > > Several architectures override module_alloc() because of various
> > > > > constraints where the executable memory can be located and this c=
auses
> > > > > additional obstacles for improvements of code allocation.
> > > > >
> > > > > This set splits code allocation from modules by introducing
> > > > > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces =
call
> > > > > sites of module_alloc() and module_memfree() with the new APIs an=
d
> > > > > implements core text and related allocation in a central place.
> > > > >
> > > > > Instead of architecture specific overrides for module_alloc(), th=
e
> > > > > architectures that require non-default behaviour for text allocat=
ion must
> > > > > fill jit_alloc_params structure and implement jit_alloc_arch_para=
ms() that
> > > > > returns a pointer to that structure. If an architecture does not =
implement
> > > > > jit_alloc_arch_params(), the defaults compatible with the current
> > > > > modules::module_alloc() are used.
> > > >
> > > > As above, I suspect that each of the callsites should probably be u=
sing common
> > > > infrastructure, but I don't think that a single jit_alloc_arch_para=
ms() makes
> > > > sense, since the parameters for each case may need to be distinct.
> > >
> > > I don't see how that follows. The whole point of function parameters =
is
> > > that they may be different :)
> >
> > What I mean is that jit_alloc_arch_params() tries to aggregate common
> > parameters, but they aren't actually common (e.g. the actual start+end =
range
> > for allocation).
> >
> > > Can you give more detail on what parameters you need? If the only ext=
ra
> > > parameter is just "does this allocation need to live close to kernel
> > > text", that's not that big of a deal.
> >
> > My thinking was that we at least need the start + end for each caller. =
That
> > might be it, tbh.
>
> IIUC, arm64 uses VMALLOC address space for BPF programs. The reason
> is each BPF program uses at least 64kB (one page) out of the 128MB
> address space. Puranjay Mohan (CC'ed) is working on enabling
> bpf_prog_pack for arm64. Once this work is done, multiple BPF programs
> will be able to share a page. Will this improvement remove the need to
> specify a different address range for BPF programs?

Hi,
Thanks for adding me to the conversation.

The ARM64 BPF JIT used to allocate the memory using module_alloc but it
was not optimal because BPF programs and modules were sharing the 128 MB
module region. This was fixed by
91fc957c9b1d ("arm64/bpf: don't allocate BPF JIT programs in module memory"=
)
It created a dedicated 128 MB region set aside for BPF programs.

But 128MB could get exhausted especially where PAGE_SIZE is 64KB - one
page is needed per program. This restriction was removed by
b89ddf4cca43 ("arm64/bpf: Remove 128MB limit for BPF JIT programs")

So, currently BPF programs are using a full page from vmalloc (4 KB,
16 KB, or 64 KB).
This wastes memory and also causes iTLB pressure. Enabling bpf_prog_pack
for ARM64 would fix it. I am doing some final tests and will send the patch=
es in
1-2 days.

Thanks,
Puranjay
