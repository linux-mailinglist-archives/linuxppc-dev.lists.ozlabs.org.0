Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826F733EE5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 08:53:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O0jdChYv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qjmvz1HCFz2xq2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 16:53:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O0jdChYv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qjmv55Ttzz30gs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 16:53:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF07561087;
	Sat, 17 Jun 2023 06:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C22C433C0;
	Sat, 17 Jun 2023 06:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686984783;
	bh=s5IbUS/R9FUeza7Uno3Hll+WeqZYFms0rCFRllsd4i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0jdChYvxLTPBx1BOB1xElON4yTO54jJpqqtDjBH7kzjTk7h8ut1Zvwg88nJSwHD5
	 dR46BC1yX4kfsB9fmhzM3g5FAiBBJ7EopEe68OhToY9ZvFD0H28XYCChSftyR0QUBZ
	 RDI9hk6abzU7ADT2Mp8RObMy225YcvgqAzj8bWooQ/IUkq2S0z3QH97xrM4q9eh/eL
	 W9Ix4DLih/xlZ3Zq9c6AydZXL5tY2UznK8+LjAqeaAIVsE4aQyWtPv0n7kE5DQG+KX
	 YYFIH+XCs7DhkCWkawXBSwV8RH6HWXBuasnHhsf1ZYp1zsYvUdnbybweDJ02yKksNs
	 +4CfHcBEs1MPg==
Date: Sat, 17 Jun 2023 09:52:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v2 12/12] kprobes: remove dependcy on CONFIG_MODULES
Message-ID: <20230617065216.GS52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-13-rppt@kernel.org>
 <87r0qbmy14.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0qbmy14.fsf@all.your.base.are.belong.to.us>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 01:44:55PM +0200, Björn Töpel wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> 
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > kprobes depended on CONFIG_MODULES because it has to allocate memory for
> > code.
> 
> I think you can remove the MODULES dependency from BPF_JIT as well:

Yeah, I think so. Thanks!
 
> --8<--
> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index 2dfe1079f772..fa4587027f8b 100644
> --- a/kernel/bpf/Kconfig
> +++ b/kernel/bpf/Kconfig
> @@ -41,7 +41,6 @@ config BPF_JIT
>         bool "Enable BPF Just In Time compiler"
>         depends on BPF
>         depends on HAVE_CBPF_JIT || HAVE_EBPF_JIT
> -       depends on MODULES
>         help
>           BPF programs are normally handled by a BPF interpreter. This option
>           allows the kernel to generate native code when a program is loaded
> --8<--
> 
> 
> Björn

-- 
Sincerely yours,
Mike.
