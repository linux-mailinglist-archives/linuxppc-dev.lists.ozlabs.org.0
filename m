Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEB97AA4B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 00:15:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L+gPhURi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs8qd2VWKz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 08:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L+gPhURi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs8pn4h3nz304l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 08:15:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C41D3CE23FC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989B8C43391
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695334508;
	bh=j+YpilMLGCC5ERDcgjdZY/UEYbvSwBxJ4mCRlrG3+go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L+gPhURipQCVv5lQ6lMZEeHafe2Map2Z3SouhfPMvOq3LIN5npAvywgTLrdsrYoDw
	 lcSQt8Ka8fmcf1d8ZM8qIlXPNumlpX3JZKdESMC/KpenaIBv7uGMi+LUkvfCfO+Vlt
	 Ms3BphwgqclEjVmwfHiEkkrb7+Ta8zh3Ag+RqoFwGGlsIzXfHKrtVOjxsaXB9alIhH
	 JK+MwyCKXlDL+alHW9KkokkF6FFQuanhqMW2Sdmh2NRZkCVnTo9ppIcJLwe1SwZkYz
	 JQdTcMm4ZdnaSVT+CVcsNzzz7DKO5EXfQ9zO0FIrMF11/hIqK2vZeqyr2ZUZVULtBX
	 NHK7vuo8iml0w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bffc55af02so26235251fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 15:15:08 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy9rxn8DGsVybhw0id93Femx/8cSBXacKiVzMXSq184Sk4EZhRd
	ICN5dPrXxHXtOe3LbG5+lCLNm8ZMrh2mT69wgBo=
X-Google-Smtp-Source: AGHT+IEOsdVYa+3bdtK+lEO/ooz4+HKzafq7xPbE1njdx3C8+57KFx3hJ2XTTULe0kNONSMtwPONNYKDgjY7yPaLcMU=
X-Received: by 2002:a05:6512:3254:b0:503:1c07:f7f9 with SMTP id
 c20-20020a056512325400b005031c07f7f9mr5552939lfr.29.1695334506735; Thu, 21
 Sep 2023 15:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-3-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:14:54 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7y2T+tajK71NfYhquhGJKpLpL+EoxxzqrVhEuAamDH3w@mail.gmail.com>
Message-ID: <CAPhsuW7y2T+tajK71NfYhquhGJKpLpL+EoxxzqrVhEuAamDH3w@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIF
 TDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 12:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
[...]
> +
> +/**
> + * enum execmem_type - types of executable memory ranges
> + *
> + * There are several subsystems that allocate executable memory.
> + * Architectures define different restrictions on placement,
> + * permissions, alignment and other parameters for memory that can be us=
ed
> + * by these subsystems.
> + * Types in this enum identify subsystems that allocate executable memor=
y
> + * and let architectures define parameters for ranges suitable for
> + * allocations by each subsystem.
> + *
> + * @EXECMEM_DEFAULT: default parameters that would be used for types tha=
t
> + * are not explcitly defined.
> + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> + * @EXECMEM_KPROBES: parameters for kprobes
> + * @EXECMEM_FTRACE: parameters for ftrace
> + * @EXECMEM_BPF: parameters for BPF
> + * @EXECMEM_TYPE_MAX:
> + */
> +enum execmem_type {
> +       EXECMEM_DEFAULT,

I found EXECMEM_DEFAULT more confusing than helpful.

Song

> +       EXECMEM_MODULE_TEXT =3D EXECMEM_DEFAULT,
> +       EXECMEM_KPROBES,
> +       EXECMEM_FTRACE,
> +       EXECMEM_BPF,
> +       EXECMEM_TYPE_MAX,
> +};
> +
[...]
