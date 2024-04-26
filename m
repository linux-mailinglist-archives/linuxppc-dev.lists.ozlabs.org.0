Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F09E8B3FC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 20:55:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QeY0Q5CW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VR23S5xryz3ccN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 04:55:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QeY0Q5CW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VR22n1Mfjz3cXy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 04:54:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 707D4620F1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 18:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203BDC2BD10
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157679;
	bh=Erw8uuVUeGio0PshYx2zkVsumWpV4GynBPxpYdsctHY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QeY0Q5CWKGUNkZV4cnTSE1WS5+eVGN0gFY1x99TWFJOz/NVZq+OjKksNbrH0CcX/L
	 aFsWENgqvWMDoRx0SH9KLjE4OC22Bf5Qa/YglImk9bxrHhpE1cvJ4rGWoP1CmD3tyx
	 5GVQHrCTqQ4hMaUzd/bPyc6futZG+WNd5KuMCzBntmiQO9LBrcntwqDWmLag8UFFnd
	 KJjIeprHGBh5VFeH8ex6x8CUqFgQgt00rSl+aepgBxkP4M7ne4NCshtRBFGFAtb0T3
	 ag90uwhMbViW+NGATzyAcLeYJJ3m5AxjLrtmYQZ6+zQePK+mZWBptrLFWzXfkeMx7C
	 kFKBeHGA1rHAw==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-572511ae0c2so1623927a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 11:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhsBO+EnnDx1hb7S/AN44qIsWj7piuKl7FxMm2sd4Z7RRY1eWP2AjfI0CwTNzM6hxd8GlQfdW8nKTAV/zEBjFaE0dI/XZ9oIuK6LI/xQ==
X-Gm-Message-State: AOJu0Yztggc1yhSE+ARap8Y9Bgq59DKEyuFxwZ4A2W0p0A/FhgmpZhbJ
	Tm3ynfvM7wkrnSFbPjTqmtm0Clu+nxXcJuGsZizzAGL2QuNj8O5REvo3bI0lxlSElpc3a/qC3ol
	+NEqZeVotAdO4DbKPDCkxxzdyrK8=
X-Google-Smtp-Source: AGHT+IHR8dCzuYaMcfUu9DJ1W7DJuyt98T5r37UenPfdlzP0RlXEYGrXPEenPo3iSsrLDDgw6B5I00dbfOalDiVdMh8=
X-Received: by 2002:ac2:5202:0:b0:51c:1fb4:2327 with SMTP id
 a2-20020ac25202000000b0051c1fb42327mr2189866lfl.24.1714157657105; Fri, 26 Apr
 2024 11:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-8-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-8-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:54:06 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7+wmDA_aaZKhNLfEZ-F1aLpUKssXqu5tUs6s=P9yvB-Q@mail.gmail.com>
Message-ID: <CAPhsuW7+wmDA_aaZKhNLfEZ-F1aLpUKssXqu5tUs6s=P9yvB-Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/16] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linu
 x.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2024 at 1:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Several architectures override module_alloc() only to define address
> range for code allocations different than VMALLOC address space.
>
> Provide a generic implementation in execmem that uses the parameters for
> address space ranges, required alignment and page protections provided
> by architectures.
>
> The architectures must fill execmem_info structure and implement
> execmem_arch_setup() that returns a pointer to that structure. This way t=
he
> execmem initialization won't be called from every architecture, but rathe=
r
> from a central place, namely a core_initcall() in execmem.
>
> The execmem provides execmem_alloc() API that wraps __vmalloc_node_range(=
)
> with the parameters defined by the architectures.  If an architecture doe=
s
> not implement execmem_arch_setup(), execmem_alloc() will fall back to
> module_alloc().
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>
