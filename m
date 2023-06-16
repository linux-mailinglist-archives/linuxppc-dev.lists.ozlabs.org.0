Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D064C73383E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 20:37:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SeXeGZ/w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjSZR4tyVz3bTW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 04:37:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SeXeGZ/w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjSYZ5NHbz2y3Y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 04:36:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B093663303
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91974C433B6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 18:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686940606;
	bh=JGylOLwsDlnOC/7zFFXP8rSDvCyOTlCYNV6rWd4f8mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SeXeGZ/w86KmlurMiVm4UIF69ZGzlkmxJdFe2QmV6PX8IW+hDhUbuFBav3t/B8pWZ
	 vEzDIgk/zKEW5stVwEtyb8WYKsD74Cn5N7O03rsyRz3LX2xGotPEbMmsM7IV3g9Dxd
	 h5Uh6GrvB3LrnxzUUDOGdAi+YQl7sfLX58PmPPi1I/7ju04tDqO1xvj3P1oQrQvlEn
	 mq1rf5Tcp0oheWCmaw6RaW+tUKVhYkG7a6qCHK2MLKMhdZ/TjBbzmfPfgUfEdkhdA/
	 QK30NJOharxczGBPm79t0v2LgrZqJ5TBlW/fXRzSrlgo6PvG8f6QCwr2oWnE+7+dKS
	 y4wFdRFTvaw9Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f76b6db73fso2733648e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 11:36:46 -0700 (PDT)
X-Gm-Message-State: AC+VfDxytF9M5WnZD4xP6JgWDYs1Wg6SE3je5ISrHMNNZPIqkLOFuX0J
	QSDnoVxs2KRqKvlGOhkkPPdVkWsYBfketDFS0io=
X-Google-Smtp-Source: ACHHUZ7VgWfSxd734IfkdiKrgB+GJm0nBxE0sk2dQ8TAn5f7aSo4Y23dXvE8MnzKke3G84UjJ1bhxQV9PGC+v71U+NE=
X-Received: by 2002:a19:7913:0:b0:4f3:aa81:2a6e with SMTP id
 u19-20020a197913000000b004f3aa812a6emr797084lfc.19.1686940604495; Fri, 16 Jun
 2023 11:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-4-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-4-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:36:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6tDvY5G-qGMq3ymth3ip27=zAij8_UhJ-qP6Ct1U1-ZA@mail.gmail.com>
Message-ID: <CAPhsuW6tDvY5G-qGMq3ymth3ip27=zAij8_UhJ-qP6Ct1U1-ZA@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] mm/execmem, arch: convert simple overrides of
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 1:51=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Several architectures override module_alloc() only to define address
> range for code allocations different than VMALLOC address space.
>
> Provide a generic implementation in execmem that uses the parameters
> for address space ranges, required alignment and page protections
> provided by architectures.
>
> The architecures must fill execmem_params structure and implement
> execmem_arch_params() that returns a pointer to that structure. This
> way the execmem initialization won't be called from every architecure,
> but rather from a central place, namely initialization of the core
> memory management.
>
> The execmem provides execmem_text_alloc() API that wraps
> __vmalloc_node_range() with the parameters defined by the architecures.
> If an architeture does not implement execmem_arch_params(),
> execmem_text_alloc() will fall back to module_alloc().
>
> The name execmem_text_alloc() emphasizes that the allocated memory is
> for executable code, the allocations of the associated data, like data
> sections of a module will use execmem_data_alloc() interface that will
> be added later.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>
