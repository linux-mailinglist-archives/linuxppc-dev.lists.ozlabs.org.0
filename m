Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58E721A39
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 23:23:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZ8qV4dj0z3dxd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 07:23:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b7/fXotn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b7/fXotn;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZ8pd1SYwz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 07:22:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19B16611AA
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 21:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9D1C4339E
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685913764;
	bh=M3qa4JrCJfL3BlNTay6Yo1EjRS0Ncm+BgXInegps46U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b7/fXotn0pQEscndihWizAxU7LQa5dSl44a9/klsWVyS0lxz/8hzxSa2IZZsjsxfX
	 r+NUkhYWfR+U4pM6AYQOSE7NKbAlOja0TNvz5m0DUEI1zWFDSIkNTecITt/pEkmEGw
	 J/i1EcDni6ZWXfMClgL03G31hjpaAYBpUerxaCwWdNhFcQlLqMtUbQhIMCbcYDNWvU
	 UhGMgdB0T5xWi5hDLtX6T9Luh2uONUrqL+9je7Lg6uu0df3kWNPuh+zhJ8FFH8haNG
	 M5E3S5UelWImxtKzuetFx71eO1My6o4ugA9ZPA9fKjM0HrHilfHJ2bhtk0fdh1FBN/
	 wGD7X3O1e8t2w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f3a9ad31dbso5180006e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jun 2023 14:22:44 -0700 (PDT)
X-Gm-Message-State: AC+VfDw/Q4PVbRnT79TTjlMlGILULE5QOqj9xdHQQtN4PC3mnTgXWrzj
	Hp+HE+bZ+u/TOWvzoBOcHAN771seo/x6+lRDnUE=
X-Google-Smtp-Source: ACHHUZ60WLRim/NZBMM58ZYdg3/lDfHnTA86A+7CXA+1QyWmoNPWXKyb36vAONlyven1Wz2rt1eY822fjimBjrUI6Ak=
X-Received: by 2002:ac2:5d6c:0:b0:4f2:4df1:f071 with SMTP id
 h12-20020ac25d6c000000b004f24df1f071mr4227167lft.51.1685913762272; Sun, 04
 Jun 2023 14:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com> <ZHzRxE5V6YzGVsHy@moria.home.lan>
In-Reply-To: <ZHzRxE5V6YzGVsHy@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Sun, 4 Jun 2023 14:22:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7iEDa44jxc_7Cj4KnVhtct-UTO2JtVK-U7o2ynn2iX8Q@mail.gmail.com>
Message-ID: <CAPhsuW7iEDa44jxc_7Cj4KnVhtct-UTO2JtVK-U7o2ynn2iX8Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Puranjay Mohan <puranjay12@gmail.com>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@vger.k
 ernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 4, 2023 at 11:02=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Fri, Jun 02, 2023 at 11:20:58AM -0700, Song Liu wrote:
> > IIUC, arm64 uses VMALLOC address space for BPF programs. The reason
> > is each BPF program uses at least 64kB (one page) out of the 128MB
> > address space. Puranjay Mohan (CC'ed) is working on enabling
> > bpf_prog_pack for arm64. Once this work is done, multiple BPF programs
> > will be able to share a page. Will this improvement remove the need to
> > specify a different address range for BPF programs?
>
> Can we please stop working on BPF specific sub page allocation and focus
> on doing this in mm/? This never should have been in BPF in the first
> place.

That work is mostly independent of the allocator work we are discussing her=
e.
The goal Puranjay's work is to enable the arm64 BPF JIT engine to use a
ROX allocator. The allocator could be the bpf_prog_pack allocator, or jital=
loc,
or module_alloc_type. Puranjay is using bpf_prog_alloc for now. But once
jitalloc or module_alloc_type (either one) is merged, we will migrate BPF
JIT engines (x86_64 and arm64) to the new allocator and then tear down
bpf_prog_pack.

Does this make sense?

Thanks,
Song
