Return-Path: <linuxppc-dev+bounces-1852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB50F995780
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 21:16:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNQj92p0Wz2yMF;
	Wed,  9 Oct 2024 06:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728414957;
	cv=none; b=XK1Jphifs5f0J+A1YFNjTAkFaiTIMf/DuWs++orskOojFcyQcFMQqR3pMeF9AmQtRliO5D3bYIos/e+NQWLGKc0TSd+BS/ETS6HAaaNaa6gKDUNDB4OGSJet34Y7PwZL6f1/sT9WYfiyVPIJO62oncK/L+vyFpy04NoOcqz+UxsgE6PiKx+jHuUh9D+hpImqQ8crzmoSNSIahyVJLZ4mvyA6Ki7m6RIezBk5v3Pimalm74cY7XnN3HDzQbwOU1/amCUPYTQp7up/XLfE94fcR70khjrMK2voyLI6RgwKtP3+ysggVAyZ+0PbaSvMDmJpBKrguZAxZml44G6ATXSYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728414957; c=relaxed/relaxed;
	bh=IAsPeelFix7shKZdlp5kubEZNxBpnUTJKes8/ECTWjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVWOZVMNvsXchigJvXgXINs9mmbbGhCVtp6UgXfeWgI1s0xWTbzGXdY7RdtIL8dqDb5Y+6djuHaCP/VdRfr3G3EARcNOKmEefL2uqpil6TSI+KhTHcLlT2Ove2QUcS4sYaUB1g15/fyCTv16xzV082KqmEM6PlqYMvAX39+soOc6gyQYo6gUYiPIU9msDnVQQjb8+lWr1B4rMwc39/v65WytmhjgXKTNFWpqIOOi+FFinEc2jFLCcD5loR8W+bvv1N65XZ9xrclI6Y9VCY7CoKtVqbPXmZ/LhBxUC/l0/uEBr07kq2q5XfGoA7Qk4S3psaBCKnUv7ryA6Ssm7nbp5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNQj662gBz2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 06:15:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1559E5C5DD8;
	Tue,  8 Oct 2024 19:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F50EC4CEC7;
	Tue,  8 Oct 2024 19:15:45 +0000 (UTC)
Date: Tue, 8 Oct 2024 15:15:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241008151548.6a721c20@gandalf.local.home>
In-Reply-To: <8e99826f-b38a-4cb3-ba5e-a20512248853@csgroup.eu>
References: <20241007204743.41314f1d@gandalf.local.home>
	<20241007205458.2bbdf736@gandalf.local.home>
	<8e99826f-b38a-4cb3-ba5e-a20512248853@csgroup.eu>
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
X-Spam-Status: No, score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 8 Oct 2024 08:24:22 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> >> +
> >> +struct ftrace_regs;
> >> +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> >> +  
> > 
> > I just realized I can simplify it with:
> > 
> > #define arch_ftrace_get_regs(fregs)	({ &arch_ftrace_regs(fregs)->regs; })  
> 
> Is it possible to write it as a static inline function to enforce type 
> checking ?

Will do. Thanks,

-- Steve

