Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA072090C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 20:22:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXrv02M2Wz3fBP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jun 2023 04:22:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m8QqKBlw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m8QqKBlw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXrt70dZYz3dxY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jun 2023 04:21:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30B6C6525E
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 18:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F26C4339B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685730074;
	bh=X+6D25ac/ynfkYhL6CVIatM+QSgTz3ZdfLV95/xOw/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m8QqKBlwUZ1OdVsi3iL4i/wpx/dFY6BbtHjhKMAoPALO9d9S1Of5z7SZF4QL6sTbP
	 1AkumCJkUSaKm4k7dCVk+lOGEFZdfq22cqjqj27S/pPlmB3p+6xXv2CNvliSMKoASM
	 /hdXoCMRwv6EJy8J6GYtUkCvLB9u0rcyusLTXlpDOf8Lr4f24TWYjjjFg1gay1e8Ak
	 p/JJ9xBOtMt5dIZYwKQ9oFJD8MWj9f1lt6ZhCj0XTqBGpkRKgNx/tS3niGcx/Matut
	 0hwyzJfj74d+iBjmUiHb0LPXzSLbkWfgBPmkBtc2NCOoUpEnhn1N5112VQidBofQtB
	 l46PC2/nl/Dww==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f4e71a09a7so3086976e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jun 2023 11:21:13 -0700 (PDT)
X-Gm-Message-State: AC+VfDwuJOtFIzYX5zFMgQnGs1pOXX2aXbN8WPsMNEH+sFwLMfflCZY7
	8fQRhCNsbiE5LPQCR9imW7dKTlw0VbEWDtMJtUQ=
X-Google-Smtp-Source: ACHHUZ7u+3QRkPB700ZRWSkZS34WuzRLSBXiPs+mDMX8Rtj0TALCowhBg47HVf6nzRS8a/FS2UP95/Ck0Au4nvQTBcE=
X-Received: by 2002:a2e:b55a:0:b0:2b0:59c3:29c9 with SMTP id
 a26-20020a2eb55a000000b002b059c329c9mr217540ljn.6.1685730071990; Fri, 02 Jun
 2023 11:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
In-Reply-To: <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
From: Song Liu <song@kernel.org>
Date: Fri, 2 Jun 2023 11:20:58 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
Message-ID: <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Puranjay Mohan <puranjay12@gmail.com>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bp
 f@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 2, 2023 at 2:35=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Thu, Jun 01, 2023 at 02:14:56PM -0400, Kent Overstreet wrote:
> > On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> > > For a while I have wanted to give kprobes its own allocator so that i=
t can work
> > > even with CONFIG_MODULES=3Dn, and so that it doesn't have to waste VA=
 space in
> > > the modules area.
> > >
> > > Given that, I think these should have their own allocator functions t=
hat can be
> > > provided independently, even if those happen to use common infrastruc=
ture.
> >
> > How much memory can kprobes conceivably use? I think we also want to tr=
y
> > to push back on combinatorial new allocators, if we can.
>
> That depends on who's using it, and how (e.g. via BPF).
>
> To be clear, I'm not necessarily asking for entirely different allocators=
, but
> I do thinkg that we want wrappers that can at least pass distinct start+e=
nd
> parameters to a common allocator, and for arm64's modules code I'd expect=
 that
> we'd keep the range falblack logic out of the common allcoator, and just =
call
> it twice.
>
> > > > Several architectures override module_alloc() because of various
> > > > constraints where the executable memory can be located and this cau=
ses
> > > > additional obstacles for improvements of code allocation.
> > > >
> > > > This set splits code allocation from modules by introducing
> > > > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces ca=
ll
> > > > sites of module_alloc() and module_memfree() with the new APIs and
> > > > implements core text and related allocation in a central place.
> > > >
> > > > Instead of architecture specific overrides for module_alloc(), the
> > > > architectures that require non-default behaviour for text allocatio=
n must
> > > > fill jit_alloc_params structure and implement jit_alloc_arch_params=
() that
> > > > returns a pointer to that structure. If an architecture does not im=
plement
> > > > jit_alloc_arch_params(), the defaults compatible with the current
> > > > modules::module_alloc() are used.
> > >
> > > As above, I suspect that each of the callsites should probably be usi=
ng common
> > > infrastructure, but I don't think that a single jit_alloc_arch_params=
() makes
> > > sense, since the parameters for each case may need to be distinct.
> >
> > I don't see how that follows. The whole point of function parameters is
> > that they may be different :)
>
> What I mean is that jit_alloc_arch_params() tries to aggregate common
> parameters, but they aren't actually common (e.g. the actual start+end ra=
nge
> for allocation).
>
> > Can you give more detail on what parameters you need? If the only extra
> > parameter is just "does this allocation need to live close to kernel
> > text", that's not that big of a deal.
>
> My thinking was that we at least need the start + end for each caller. Th=
at
> might be it, tbh.

IIUC, arm64 uses VMALLOC address space for BPF programs. The reason
is each BPF program uses at least 64kB (one page) out of the 128MB
address space. Puranjay Mohan (CC'ed) is working on enabling
bpf_prog_pack for arm64. Once this work is done, multiple BPF programs
will be able to share a page. Will this improvement remove the need to
specify a different address range for BPF programs?

Thanks,
Song
