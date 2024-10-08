Return-Path: <linuxppc-dev+bounces-1860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6C995A64
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 00:41:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNWGn6xXjz30NN;
	Wed,  9 Oct 2024 09:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728427313;
	cv=none; b=JL0d6L9lLDafoE6UUsr5gwtyoHaxktjSM8Gth/oeF5Cu7qLRLXZK/AniAQNU47oO0OfYS/9BuaImKUy/31cmXTQ/YFVmxZlxXPaR48WuarNSDdHbewWGxpXXgWylz6RQnpEp0dkmgOYvNDPbG26mTrsVMYCXt7ldeqOvYpX/kmBFLXyEPFC9phS+ljDVcSEeSbo/Awf0d636HiOZuGCA/KzpeNR7cmbaWFA9Dx/RbI6gveuQ0E64jb3cmuRL/x07GkI9xnXMWQiHn79Zsqgu62jcxqxkvAcoffDwuybFG6TWbKv7EMbK4Te2R8kxp3YcleR1aEWl8M6e2iPmd+ijtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728427313; c=relaxed/relaxed;
	bh=KcX3rJfGpGwvCQtPqzOqQmuMAM6PM+w2Dk3quxgq17g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ddIGMLwoV8b9uR7GidwHDZIrp1v6xCbqL8JQBIq5FvLymsjl1ihAUjk9y2hgsqGEvEnDd//30rVouzvXiPGETaL97OW9EvKrgcxtJh2Zl/vyXUCrkR4MPzfB9/9l/aqcJyaoNqqGrYYi7pn0EwsEE7vr/nT5BAAlnWiHjS/8Sb8ZgSg3rA1mKLZZxQS2FiPbUMIg3S4DKRXdxKK1GN1ZZlVyo4KU9qvRq1RCMJDg6GjppKSNvETI9s4nHXngk9P/Z4S5FUmCLEhoUEYo6VhGISL3HPTFd1WwQjVUwHVMN/4vBX9YCIGYyswGiRgosOofpE6Xakg8VHwBFEyA7SVk1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YVKI9Crq; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YVKI9Crq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNWGm6nLYz30MR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 09:41:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89C5C5C547A;
	Tue,  8 Oct 2024 22:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821CEC4CEC7;
	Tue,  8 Oct 2024 22:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728427310;
	bh=dcyvt0dgAZszkRlVAvb5HjPFo8uYI0c0H8I8+ifT9Mc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YVKI9Crqoxb+kubNcOuiLkrNECGkggxSHQ7zCyU+C4i8uxiYSqLNhL0X/vyK4nbzv
	 ZTZhdx2QyfKE2LnLqpmbl5qupaMKqcPjo4pfP0XVVDT7jJ3Pi+yGLIFlAoyQ1zJ8f/
	 LRx6mNnFL/YEgXB3zZceNPZm3XxIxsg2PBPTbpBe46PAYpR81VHsD8MOEnS/HXOEZ2
	 Ap8/akyKsgqNs5Pe4svGt4x+EP0vBEWmNqIITelNqML0XZvg5lqB67aOG28+RNgkvt
	 wfDDeXaYNBD5I8SjevQEEAIRaEj2kZMlEcSfY0ZWuEXT4HdfIj190zY9PkfL3KNXYl
	 LDp5MEWE7lO/w==
Date: Wed, 9 Oct 2024 07:41:40 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
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
Message-Id: <20241009074140.b163eceb2f973227b400c962@kernel.org>
In-Reply-To: <20241007204743.41314f1d@gandalf.local.home>
References: <20241007204743.41314f1d@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Steve, 

> diff --git a/include/asm-generic/ftrace.h b/include/asm-generic/ftrace.h
> index 3a23028d69d2..ba7b7d6e55d6 100644
> --- a/include/asm-generic/ftrace.h
> +++ b/include/asm-generic/ftrace.h
> @@ -10,4 +10,17 @@
>   * common definitions are already in linux/ftrace.h.
>   */
>  
> +#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> +struct __arch_ftrace_regs {
> +	struct pt_regs		regs;
> +};
> +
> +#define arch_ftrace_get_regs(fregs)					\
> +	({ struct __arch_fregs_regs *__f = (struct __arch_ftrace_regs *)(fregs); \
> +		&__f->regs;						\
> +	})
> +
> +struct ftrace_regs;
> +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> +
>  #endif /* __ASM_GENERIC_FTRACE_H__ */

There seems no #endif for CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS.
I wonder how it passed the build. (#ifdef block does not affect over
the file boundary?

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

