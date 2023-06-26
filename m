Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17573E6E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 19:50:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gsu5wtN5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqb2z5TDbz3bpC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 03:50:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gsu5wtN5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qqb260KJkz305N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 03:49:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1194860E8D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 17:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757F8C433C0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 17:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687801751;
	bh=fFWuzhLLiGkinhaWeToFLkDX/dcx5OWER83aW8VgRow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gsu5wtN50LZdJATM3ZjDYRwk1wnL4zKmLVdDqqUpcLtSNYlPt2g8EOd2+LHOYG0G5
	 HJb6UdQ1uCsnI8e7N++rgev5m4nSa6GuRAJ1KqvHYFOZQchtOemxBOGvfMG1j5Osdd
	 gV8aBmKXzrC6Q+VYPFHx1qXffUm36IuFITg1YCCjupG+JYtQ7Ki6FGlI1JCtnPafXG
	 BflN3PH1aFSJcZb5/HVOZxfkzz3hTosSHdnVSJwFszzWNxojXWnuwt26Kb9cys6I2L
	 Z/dJc0eQyaMVi232VXzASC5AOFcr+LZ8Z/R0k5jXoEQbxTh4I/aMaqIE8NWBVDE9Ir
	 WJbgxGOvJGyQg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so4906358a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 10:49:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDxnWEQgDieZA/1CbbEQXl7C/3w8htSbHg3fc+ZhuXEidrvStjkS
	lRlQKE085OVi07mOrG6h0rHvVo2d4jkkl1OTwqM=
X-Google-Smtp-Source: ACHHUZ6w6e1OYy7QM9S+YTdK71Dx4cd9s642AcRaJSfPZb8UXF8n/hvi2zuHhdV8C7DcTgUpaxVtcUwpuH0YchvBFOg=
X-Received: by 2002:a19:5f5d:0:b0:4f8:5e62:b94b with SMTP id
 a29-20020a195f5d000000b004f85e62b94bmr8655403lfj.9.1687801729333; Mon, 26 Jun
 2023 10:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com> <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com> <20230625161417.GK52412@kernel.org>
 <ZJmFFmexl_1GUhIL@FVFF77S0Q05N>
In-Reply-To: <ZJmFFmexl_1GUhIL@FVFF77S0Q05N>
From: Song Liu <song@kernel.org>
Date: Mon, 26 Jun 2023 10:48:37 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
Message-ID: <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
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
Cc: the arch/x86 maintainers <x86@kernel.org>, loongarch@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kerne
 l.org>, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 26, 2023 at 5:31=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
[...]
> >
> > So the idea was that jit_text_alloc() will have a cache of large pages
> > mapped ROX, will allocate memory from those caches and there will be
> > jit_update() that uses text poking for writing to that memory.
> >
> > Upon allocation of a large page to increase the cache, that large page =
will
> > be "invalidated" by filling it with breakpoint instructions (e.g int3 o=
n
> > x86)
>
> Does that work on x86?
>
> That is in no way gauranteed for other architectures; on arm64 you need
> explicit cache maintenance (with I-cache maintenance at the VA to be exec=
uted
> from) followed by context-synchronization-events (e.g. via ISB instructio=
ns, or
> IPIs).

I guess we need:
1) Invalidate unused part of the huge ROX pages;
2) Do not put two jit users (including module text, bpf, etc.) in the
same cache line;
3) Explicit cache maintenance;
4) context-synchronization-events.

Would these (or a subset of them) be sufficient to protect us from torn rea=
d?

Thanks,
Song
