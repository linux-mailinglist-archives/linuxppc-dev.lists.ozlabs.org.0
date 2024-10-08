Return-Path: <linuxppc-dev+bounces-1803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC0993BF6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 02:55:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMyGx6q1qz2yN8;
	Tue,  8 Oct 2024 11:55:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728348905;
	cv=none; b=GTZcwCdffS6JnigsfwewkJZRFgU/UPy8LVWVcGkmOx/9Jy/rc9jGUNrxqWrFNas0LKU5bqPZmN5FOzHESgVsX2DHydckSmYhZqrts2jhEh36Qa5K8z+wlJvrAg5r5HH8uBlXeza8mbTzicKJdYTEc4BqDd3Rp+57weeAuVzV30V7MgnZRqPg2vfAAyzi/MOk/FbxHzS8uI57kaLTad5ig1bIqQf+qwSs14FrSrdxI6vqRnD2s3A4XAPghslVuaHQrQ42OhsEIayJ+AUTJGAC2gAnM0PZSBPfN9OUpeSdz1SQfL2riUeUdaAkT1hEWbsYydzkRfcBU1LgfNwXzmmofw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728348905; c=relaxed/relaxed;
	bh=O1OrairncSGdcGoFvlY4mSqBqXBQ7N0yPJWQn/POrHA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzrXDZW6cUTfrxs7I1g1N/KlpiPniGqUy7ab/P2BJkq1PToqn/LOuGvd8uvRCS+N6t3/OkCbbp9wwGHqa/WHiNY4D3RX0wvOMD7V2snbcXsRRzHVekBiji67lThGRisJ4XhkvvijUzKzp+vCWXTroydzyypiJlssBpd+8tEU/U6OIC4EONPcqmdkj9EiGGgLELqaW3oz8fXtrG/I5XbsWd/RX+0lciN4j475WS42Px5fKPMf72bJRtPNUZAPhiFaQPTojFEKOzKTsn/ViHifSpSXtV1CMM9OTsdLMVmU0mj0GKpMMa7y6YklMpN4VuNzfYK+7ucEBOe2+7gqdQk0kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMyGw00Vcz2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 11:55:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C9975C5D9A;
	Tue,  8 Oct 2024 00:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36669C4CEC6;
	Tue,  8 Oct 2024 00:54:57 +0000 (UTC)
Date: Mon, 7 Oct 2024 20:54:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241007205458.2bbdf736@gandalf.local.home>
In-Reply-To: <20241007204743.41314f1d@gandalf.local.home>
References: <20241007204743.41314f1d@gandalf.local.home>
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
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 7 Oct 2024 20:47:43 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> +#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> +struct __arch_ftrace_regs {
> +	struct pt_regs		regs;
> +};
> +
> +#define arch_ftrace_get_regs(fregs)					\
> +	({ struct __arch_fregs_regs *__f = (struct __arch_ftrace_regs *)(fregs); \
> +		&__f->regs;						\
> +	})

I wrote the arch_ftrace_get_regs() at the start of creating this patch.

> +
> +struct ftrace_regs;
> +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> +

I just realized I can simplify it with:

#define arch_ftrace_get_regs(fregs)	({ &arch_ftrace_regs(fregs)->regs; })

I may send a v2 (tomorrow).

-- Steve

