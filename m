Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64056733AB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:19:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LmBJJScQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjVqT1xPdz3bxL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 06:19:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LmBJJScQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjVpb26GWz2yyc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 06:18:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81B7C63F22
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6007CC433AB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946692;
	bh=U5Tl9qs4B0TBI/rIx4ZZgTkRwFm5uyKz4CPReQtXH/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LmBJJScQlLvxsT8+Ta1tCpM4WXI6TR8l8c5jV/lF5ZOrowqAfZjtpNM41tcPHiArX
	 +YH5I9st348UgQHncZvkjv1I8uf6/B9VIYKB/ZX5ShONmWppK4Z28CmWLldHUX++Co
	 tQHCqBzRDW0rngL+0918l5A/LKDXSOHiSUfIz3m/CZC9iQ5hn0r0gJTm/FmWwj/qLn
	 mAG9TY9iKVAQprNcopRBSELs+aKCJHBbKHSrnFdxygoqMhe72Gcymvj1seoYl1ETYg
	 kF9uj767lw3HcyBO4F7SRQUsfNpsVMh+rYJU6mMVRBqQdXG9XPM9gyQIez8ST13ZvP
	 VGJY2Pv9kdJTA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b443ebae0dso15974691fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:18:12 -0700 (PDT)
X-Gm-Message-State: AC+VfDwyadlHt4BZ7r2Wq3daonz9v4+NUYpcVqMzRuOYMONghyQGVC1q
	KN7LX2PVjCTRdqDrNhIeC/rtQA1QIDqtUW6ye/U=
X-Google-Smtp-Source: ACHHUZ4zX0CYOJSSN4FGWX93J1VUIgZYXEOYsrGR9cSML7AlHx0h0qQhMxp9jkMOVU4u0KdCA43Yux1f/ue71yfnFUk=
X-Received: by 2002:a05:651c:225:b0:2b3:4fb7:8991 with SMTP id
 z5-20020a05651c022500b002b34fb78991mr2815162ljn.43.1686946690319; Fri, 16 Jun
 2023 13:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-11-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-11-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:17:57 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4C1zm72AkHfuo6Xz4+37AG4BgX_k2fM+xw536QeDQS+w@mail.gmail.com>
Message-ID: <CAPhsuW4C1zm72AkHfuo6Xz4+37AG4BgX_k2fM+xw536QeDQS+w@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] arch: make execmem setup available regardless of CONFIG_MODULES
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 1:52=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> execmem does not depend on modules, on the contrary modules use
> execmem.
>
> To make execmem available when CONFIG_MODULES=3Dn, for instance for
> kprobes, split execmem_params initialization out from
> arch/kernel/module.c and compile it when CONFIG_EXECMEM=3Dy
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
[...]
> +
> +struct execmem_params __init *execmem_arch_params(void)
> +{
> +       u64 module_alloc_end;
> +
> +       kaslr_init();

Aha, this addresses my comment on the earlier patch. Thanks!

Acked-by: Song Liu <song@kernel.org>


> +
> +       module_alloc_end =3D module_alloc_base + MODULES_VSIZE;
> +
> +       execmem_params.modules.text.pgprot =3D PAGE_KERNEL;
> +       execmem_params.modules.text.start =3D module_alloc_base;
> +       execmem_params.modules.text.end =3D module_alloc_end;
> +
> +       execmem_params.jit.text.pgprot =3D PAGE_KERNEL_ROX;
[...]
