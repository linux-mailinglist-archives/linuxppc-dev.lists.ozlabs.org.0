Return-Path: <linuxppc-dev+bounces-1861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B4995B41
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 00:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNWfT5vmhz2xH8;
	Wed,  9 Oct 2024 09:58:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728428337;
	cv=none; b=dWA8rOuBFJkR3UJVn6Igf60ukcteGLu4db2n2gxIBkYNTgdpPN9G0ixrZPGPivY+YeBCuilmMuLVcfa+tJyQsYCk15gtNsTGzuTD+gYEVWmwMlnCx5e5dgxdQHCNNhRsT9dSsCqTGEl2kVZrEahZgX1Q4LAhWsBEriBhwytbM7UuNARA2O7ZPQebmfdtRNSKG0p48Yo1Bv2LzET6j+0hrW1ydLSsjQQqeotad3cdQ8o6PYbaw4CfIgNBTHPPrAxPwg+hKRTBbfhok51bk1jhbIsSmixjI/+JsnNVLVgaq3MvnnJWTiWlx6VvY/x24JisKOOPOaiadsvlV2WLe4OU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728428337; c=relaxed/relaxed;
	bh=EHWNWQP0MMPT8jCtNvFSEyg3s08DKD+aBnlzkkhHBH0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJNdECE0O+tZ1wjyo4JgGulwt07iVx+Ix33Goc9NQ1+CNXg9NVCOb6U3+lIlYxJM8PmVqoyGTy0RXj0eBVHL7/apS5ZT/Iaf8JyGlRtY8a0DL7GC0cpaZ9flisejBMjv3moPVo3N8lGAhgODABsxD1QxrXu2zOWGsBJlJLNck8mrvy5hosbA4YcuqQcB42FzrCl/ogFYnQ3OyU2fKHYbFGDoym/qjIL21XiYohrqdMg1ro78yGK8G8S5+tRWEBV5NnOFAMnUbRE5UsrFn3sZMiK/VRzwrEf8MW0f7Eih4TtUUZj6kJtQkur+JIo/5cDDCXYeNqv07S2dHtoO9e83Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNWfR5F7wz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 09:58:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E74BA4299F;
	Tue,  8 Oct 2024 22:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB329C4CEC7;
	Tue,  8 Oct 2024 22:58:47 +0000 (UTC)
Date: Tue, 8 Oct 2024 18:58:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241008185851.274887ca@gandalf.local.home>
In-Reply-To: <20241009074140.b163eceb2f973227b400c962@kernel.org>
References: <20241007204743.41314f1d@gandalf.local.home>
	<20241009074140.b163eceb2f973227b400c962@kernel.org>
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

On Wed, 9 Oct 2024 07:41:40 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> Hi Steve, 
> 
> > diff --git a/include/asm-generic/ftrace.h b/include/asm-generic/ftrace.h
> > index 3a23028d69d2..ba7b7d6e55d6 100644
> > --- a/include/asm-generic/ftrace.h
> > +++ b/include/asm-generic/ftrace.h
> > @@ -10,4 +10,17 @@
> >   * common definitions are already in linux/ftrace.h.
> >   */
> >  
> > +#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> > +struct __arch_ftrace_regs {
> > +	struct pt_regs		regs;
> > +};
> > +
> > +#define arch_ftrace_get_regs(fregs)					\
> > +	({ struct __arch_fregs_regs *__f = (struct __arch_ftrace_regs *)(fregs); \
> > +		&__f->regs;						\
> > +	})
> > +
> > +struct ftrace_regs;
> > +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> > +
> >  #endif /* __ASM_GENERIC_FTRACE_H__ */  
> 
> There seems no #endif for CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS.
> I wonder how it passed the build. (#ifdef block does not affect over
> the file boundary?
> 

Yeah I caught that. That's one way I found out that this file is not
compiled by most architectures. I'll be sending a v2 very shortly.

-- Steve


