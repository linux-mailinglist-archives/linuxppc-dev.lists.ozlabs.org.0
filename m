Return-Path: <linuxppc-dev+bounces-2107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4CB99A144
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 12:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ2pn04ylz3bvW;
	Fri, 11 Oct 2024 21:26:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728642384;
	cv=none; b=Aa8rG9BJF/DEuozxAiCNEJfAWBCEn1MEj+H9bG8fqw5xWnJIV3eFlsB79XlqCdRLB8YHPYluZGNnyeuEXiJeZpG9K0x5o6McwvUtI9h40yo+RtrGoycFBuC0kcHnnA++OArUx5C+dGtqil2yYpjh/Zy1l1gS+XVIC1n3cVvsRGxMTlfHU8doKb4q2aCczx/ZapvB0AQhx+GiOcu9i9mSaDqEikEWTS/pv2P7mdkw2KgLul07CVXuoChPXuO8YRm0w1Q5xEsmAivXJSKpwPvBxuEx2jjMChP01hMI82woDuiOBqQRtN8tL++Ol9uVCzjKshNVG2pXe2QJF389fOl/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728642384; c=relaxed/relaxed;
	bh=qKaMAaRFQbEYsqGQJWdCmWHy2yf9yM4hqTkDEDVVs1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPrYCDUKcw0ZCMpYQHAYi5itGcW/wlR7mxHtMUikUInj5JG04B1A3qI+BSuNPupcsyXEJPQGYQTeDR1ccMrcedD7+iDfdhJR3dz+/T6HSnXgp1+4g7kE95nmlIWZd9bI4+BOK3nDtct+8u5PQ754kg7uJRN/Ud8HDAuGgGBIZL3/7eSeQXpYEmD2ZT4vJ7RHDyTYRFMkLY7E6+FKlR8mzmyVUcTWW2nQvT4L6q9jCokkEXXrdSAOWTkzFz70F5gfGF1i2P2hXEYT7tOrkQymnbVuBjhKmR45gRy/cU+YPW6WRJjF8NFlyh4fGerhCWoPI9x5Xarp+2Xspm0Ivm9OGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ2pl05DCz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 21:26:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FA7B5C56B6;
	Fri, 11 Oct 2024 10:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828ECC4CEC3;
	Fri, 11 Oct 2024 10:26:12 +0000 (UTC)
Date: Fri, 11 Oct 2024 11:26:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v3] ftrace: Consolidate ftrace_regs accessor functions
 for archs using pt_regs
Message-ID: <Zwj9QocrEVtgraHp@arm.com>
References: <20241010202114.2289f6fd@gandalf.local.home>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010202114.2289f6fd@gandalf.local.home>
X-Spam-Status: No, score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 08:21:14PM -0400, Steven Rostedt wrote:
> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index bbb69c7751b9..5ccff4de7f09 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -54,6 +54,7 @@ extern void return_to_handler(void);
>  unsigned long ftrace_call_adjust(unsigned long addr);
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> +#define HAVE_ARCH_FTRACE_REGS
>  struct dyn_ftrace;
>  struct ftrace_ops;
>  struct ftrace_regs;

In case you need an ack for the arm64 change

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

