Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5471F72D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 02:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXPGS24jMz3dxY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 10:37:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XTmFrz6x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XTmFrz6x;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXPFf3V1tz3ds9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 10:36:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90DE46439F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 00:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD4AC4339C
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 00:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685666196;
	bh=8680DMzx0gtVOisbuW5F5FI58VdZiV3S7sDNyC66jIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XTmFrz6x8P+uu4p7+8CwwHHAR8ToxETybv3aokjIkUt8au2/bliIWtKwA0GAbEtXU
	 35MXE4ZwOYCOUbquOW3LQoZZDXhPbam+LWuZhJ0mqETvOfa2/rMGWxD+GJruYpNbS6
	 ci30bYJW5Xs8iSRMEPad+knzjZDpipv9dxPxlL70NiYXhKXJnUs1HWnqvirj5dSWAN
	 B2cCO/rarwHERSu66gvzGkFtyDmlSmQAJPI3dJJQqihBq56qTMR5zptT8HtrJ2b10S
	 TMFJdORTSry9D8pvsZGiWSqPLVC1lC/A7oq6hOwBZbEcU0/jUM34HuLUgEBSnU29a0
	 P+mvZ51/iQCoA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f3b5881734so2042957e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 17:36:35 -0700 (PDT)
X-Gm-Message-State: AC+VfDwSDwRFcvPyM/odw2ytXR2SXLXAtW/pv/mudQW5BXJ99CX+NURD
	64mIcvYNpFGLm+gNuW5WbM0qvHnImPZa+k4PUjw=
X-Google-Smtp-Source: ACHHUZ4rAYUoiHYEWWqFuntxOuL06QmDCDII8lO4o2SuljgVgQXswY+xn62uFOnPiNtfcw4WXcIV+P9v/6p/Zkld05w=
X-Received: by 2002:ac2:44ca:0:b0:4f3:b18a:6497 with SMTP id
 d10-20020ac244ca000000b004f3b18a6497mr927744lfm.52.1685666193979; Thu, 01 Jun
 2023 17:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org>
In-Reply-To: <20230601101257.530867-1-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 1 Jun 2023 17:36:21 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Em5Sj9uCGyfM6BheTuvA4pviavRTUK-3MbGsd9yCRbQ@mail.gmail.com>
Message-ID: <CAPhsuW5Em5Sj9uCGyfM6BheTuvA4pviavRTUK-3MbGsd9yCRbQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Mike Rapoport <rppt@kernel.org>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <d
 avem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 1, 2023 at 3:13=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Hi,
>
> module_alloc() is used everywhere as a mean to allocate memory for code.
>
> Beside being semantically wrong, this unnecessarily ties all subsystmes
> that need to allocate code, such as ftrace, kprobes and BPF to modules
> and puts the burden of code allocation to the modules code.
>
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
>
> This set splits code allocation from modules by introducing
> jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
> sites of module_alloc() and module_memfree() with the new APIs and
> implements core text and related allocation in a central place.
>
> Instead of architecture specific overrides for module_alloc(), the
> architectures that require non-default behaviour for text allocation must
> fill jit_alloc_params structure and implement jit_alloc_arch_params() tha=
t
> returns a pointer to that structure. If an architecture does not implemen=
t
> jit_alloc_arch_params(), the defaults compatible with the current
> modules::module_alloc() are used.
>
> The new jitalloc infrastructure allows decoupling of kprobes and ftrace
> from modules, and most importantly it enables ROX allocations for
> executable memory.

This set does look cleaner than my version [1]. However, this is
partially because this set only separates text and data; while [1]
also separates rw data, ro data, and ro_after_init data. We need
such separation to fully cover module usage, and to remove
VM_FLUSH_RESET_PERMS. Once we add these logic to this
set, the two versions will look similar.

OTOH, I do like the fact this version enables kprobes (and
potentially ftrace and bpf) without CONFIG_MODULES. And
mm/ seems a better home for the logic.

That being said, besides comments in a few patches, this
version looks good to me. With the fix I suggested for patch
12/13, it passed my tests on x86_64 with modules, kprobes,
ftrace, and BPF.

If we decided to ship this version, I would appreciate it if I
could get more credit for my work in [1] and research work
before that.

Thanks,
Song

[1] https://lore.kernel.org/lkml/20230526051529.3387103-1-song@kernel.org/
