Return-Path: <linuxppc-dev+bounces-2119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B499A4FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 15:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ6qR3TTDz3bwp;
	Sat, 12 Oct 2024 00:27:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728653235;
	cv=none; b=ka5sad/EhOp3Kr9KbOl0NKV3LR71isdmXlJGiFwfdSOIT4rWBPNgQu87gS1O5xL2nXEfeaQUnyYscRNUjsdZvTJ3vAPk9kczBEgNjDHe3yqr1OCq6B0fVov0cEhY6+X1ha8DcudKI1rTvLcWeG3c4Y6cLkfacrXIR2/AJV25AyajcIraF7RXw4TkUoJiaGXuO0cnd+en4j5aeGjZCtpAYy0YIAMKoeyDTieBRr7JUArplzlPiZFYCl/uy3UHlIt/yu15efH4Ft/MKuXj9Y6xYD6ud1ucHOeqA6LpOBYvCgiWflZL2zjlp+TQTOo0bi8Eg44J1JDSaikXVs4NgmkhDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728653235; c=relaxed/relaxed;
	bh=gtW9glIMGXTFOIxFP2pcOheGG4YgD96fAtcws+vOL6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L50LkH2oRPLE4Z0HPXNwAqqkzzTXTFk3TESosqaneNbXJmvJTdc7Tp9MKbF/2y9P6sHeBZ6ycSiV6ZYDrwglJgHBY3Wj7q+4xkcGfXsbneVSc9W8lMZaYfnV69JPpaAY2ay++wrRv65LbvZ4H7RXD0zYbe9WG7yigN2yKLq4Z4D/0Yv75AsOXNomxPjzQAOyAkO1aNBKfIE9Sw8N3LHFafWzYGom+yKUMjnGBlrmB78AIwxI6dOcmwrAu6njBxYHn5OgQCFXBX4KRAdKeeCV5aoFfjKZlO4V+TDo+1XcJ60eAZhZVCQSe/V7dwemefAoEX3beP2SoCImPoT+CJXzuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=csxu=rh=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=csxu=rh=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ6qP2b6Nz3028
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 00:27:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBDC7A444B4;
	Fri, 11 Oct 2024 13:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D23C4CEC7;
	Fri, 11 Oct 2024 13:27:04 +0000 (UTC)
Date: Fri, 11 Oct 2024 09:27:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen
 N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v3] ftrace: Consolidate ftrace_regs accessor functions
 for archs using pt_regs
Message-ID: <20241011092714.71074a2b@gandalf.local.home>
In-Reply-To: <Zwj9QocrEVtgraHp@arm.com>
References: <20241010202114.2289f6fd@gandalf.local.home>
	<Zwj9QocrEVtgraHp@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 11 Oct 2024 11:26:10 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Thu, Oct 10, 2024 at 08:21:14PM -0400, Steven Rostedt wrote:
> > diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> > index bbb69c7751b9..5ccff4de7f09 100644
> > --- a/arch/arm64/include/asm/ftrace.h
> > +++ b/arch/arm64/include/asm/ftrace.h
> > @@ -54,6 +54,7 @@ extern void return_to_handler(void);
> >  unsigned long ftrace_call_adjust(unsigned long addr);
> >  
> >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> > +#define HAVE_ARCH_FTRACE_REGS
> >  struct dyn_ftrace;
> >  struct ftrace_ops;
> >  struct ftrace_regs;  
> 
> In case you need an ack for the arm64 change
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks, appreciate it.

-- Steve

