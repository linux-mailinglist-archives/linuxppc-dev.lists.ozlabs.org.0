Return-Path: <linuxppc-dev+bounces-1851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0739955B1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 19:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNNQz5ymCz2yZ5;
	Wed,  9 Oct 2024 04:33:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728408811;
	cv=none; b=loT7HC7K5xVi8U6xk0cRq5DD3brSK1VWqBXFkXQxTq/Hrc1ZESe94uD0BY0AVD7d6JmvE7eO/fxXnPMIjRQDO+qKTO4uFYHunYODJ6bCaPASUGrX2MOIYTy7UKdQ60kENU7zRYhTTQJCxAPfNAYUkPvUsY6uNlHyCca9w7rBGWec/0S4ZK7hFn7JpMpRVuh1ZGT9Hg/hICFf2CrKxTJIjOH4D27A/25pN/Fipt8B3CP3aJMm+RKxnVLIW/UYIu1DzeLOSQBqZ5cooVRuzGefTXssbj/VD9WiUyuWNLNMJlfsoQTQHacfANHDKz3xxNgoJP3dKU0t30bdfj9LHXCrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728408811; c=relaxed/relaxed;
	bh=9vnKVrd6no7+Ja3fqRknjIuUiQlbhZM//6mbZB8VZjs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G54y0YHPvb8wQfS/Gve1Bm6PVSTYqG6VqlHAjh+ily8QIVjq4IFgErR44PYzywWE5d6/6vbdKsm6umUNFlXpVpUuyuC7QZbXYn0FDWZ5psOty2P5d8aAJKf07thbRsjhqjPzl4bjDZa5Kyhw41teUr9ckOQDwSv5gnsy35Q8XpdNhP98T+IvfVQ//+8hMIvRyxNzuYfZ2dd6mNEIAAs5wcL8CiPWqLbGBN5tR31QIuEZCJbF3Fc0nJfhdzB0ZN/3RPdljS83yoYeBShjTW0vlRySkImLEO+DW8Z2+blWEB9CVWyRmpGVbxuLB/bpckGbyhXtvPxVFZwB7eG337NFnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNNQx57gQz2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 04:33:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6196F5C57C4;
	Tue,  8 Oct 2024 17:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95454C4CEC7;
	Tue,  8 Oct 2024 17:33:22 +0000 (UTC)
Date: Tue, 8 Oct 2024 13:33:25 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Heiko Carstens <hca@linux.ibm.com>
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
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241008133325.47b7b457@gandalf.local.home>
In-Reply-To: <20241008145852.27223-E-hca@linux.ibm.com>
References: <20241007204743.41314f1d@gandalf.local.home>
	<20241007205458.2bbdf736@gandalf.local.home>
	<20241008145852.27223-E-hca@linux.ibm.com>
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

On Tue, 8 Oct 2024 16:58:52 +0200
Heiko Carstens <hca@linux.ibm.com> wrote:

> On Mon, Oct 07, 2024 at 08:54:58PM -0400, Steven Rostedt wrote:
> > On Mon, 7 Oct 2024 20:47:43 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > #define arch_ftrace_get_regs(fregs)	({ &arch_ftrace_regs(fregs)->regs; })
> > 
> > I may send a v2 (tomorrow).  
> 
> Could you also write against which tree this patch is?
> It doesn't apply on top of Linus' master branch.

Ah, sorry, I should have specified. It applies to my ftrace/for-next branch
(which is also part of linux-next). I just checked out linux-next, and it
still applies but with some shifts, so updates from other trees do affect
it slightly.

If you want it to apply cleanly, use this tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/  ftrace/for-next

-- Steve

