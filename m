Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E08590C507
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 10:50:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MUIKiWDk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3L7F60hNz3cF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 18:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MUIKiWDk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3L6T5pq6z30Vh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 18:49:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71F546010F;
	Tue, 18 Jun 2024 08:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F54C3277B;
	Tue, 18 Jun 2024 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718700587;
	bh=r2/tWxOWo7MEUie8q7G5hUhcJwWDhzPM1cpZZRjLQ28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUIKiWDkDtIDcsBziDd7SXEauKakOYPi9yB8cV57/jn/hwN6zxfg76kUfjtpiqFsB
	 U1tZ0HNdyDkn6ulg9Um4A3y5GuImryf4KeACqmsvWs47EZfqkaKm41Da72oEoqGYeO
	 ypcBkBXTVd1zBa4ORZXlr3JEpKiWvUVX/WSGvnUk0+JH2GeANZlm/tSeP8fpS4XNvv
	 2PTQ0G1uwpCvXb0U0Sq5aolSPuM6gsHBIt04bv/9oK6vleU5Ypn7heSnM1S6fWNdvp
	 wEERKUIdDdS6y7kLrvvzsz8qkHLvZZ0NxQCDioDVHZkzVIwfRz/UtcVGYdunNGTwsJ
	 lBULEpfCgvO6g==
Date: Tue, 18 Jun 2024 14:15:40 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2] PowerPC: Replace kretprobe with rethook
Message-ID: <vpbuzldssnj4pz5nkprbcerqu74cl6cxhsfsyfo45nlojsvjrh@llue52h5np4m>
References: <20240610154509.446807-1-adubey@linux.ibm.com>
 <otk7igwnrzfbjfeoikswr7p2kh6wgz6bsqnaejv57kkt4euse4@d57z7me2ajqr>
 <20240618064306.14c2d3c601b0ca91d99839f0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618064306.14c2d3c601b0ca91d99839f0@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, Abhishek Dubey <adubey@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 18, 2024 at 06:43:06AM GMT, Masami Hiramatsu wrote:
> On Mon, 17 Jun 2024 18:28:07 +0530
> Naveen N Rao <naveen@kernel.org> wrote:
> 
> > Hi Abhishek,
> > 
> > On Mon, Jun 10, 2024 at 11:45:09AM GMT, Abhishek Dubey wrote:
> > > This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> > > Replace kretprobe with rethook on x86") to PowerPC.
> > > 
> > > Replaces the kretprobe code with rethook on Power. With this patch,
> > > kretprobe on Power uses the rethook instead of kretprobe specific
> > > trampoline code.
> > > 
> > > Reference to other archs:
> > > commit b57c2f124098 ("riscv: add riscv rethook implementation")
> > > commit 7b0a096436c2 ("LoongArch: Replace kretprobe with rethook")
> > > 
> > > Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> > > ---
> > >  arch/powerpc/Kconfig             |  1 +
> > >  arch/powerpc/kernel/Makefile     |  1 +
> > >  arch/powerpc/kernel/kprobes.c    | 65 +----------------------------
> > >  arch/powerpc/kernel/optprobes.c  |  2 +-
> > >  arch/powerpc/kernel/rethook.c    | 71 ++++++++++++++++++++++++++++++++
> > >  arch/powerpc/kernel/stacktrace.c | 10 +++--
> > >  6 files changed, 81 insertions(+), 69 deletions(-)
> > >  create mode 100644 arch/powerpc/kernel/rethook.c
...
> > > +
> > > +	return 0;
> > > +}
> > > +NOKPROBE_SYMBOL(trampoline_rethook_handler);
> > > +
> > > +void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
> > > +{
> > > +	rh->ret_addr = regs->link;
> > > +	rh->frame = 0;
> > 
> > There is additional code to validate our assumption with a frame pointer 
> > set, so I think we should set this to regs->gpr[1].
> 
> Additonal note: If this sets regs->gpr[1], pass it to rethook_trampoline_handler()
> too, so that it can find correct frame.
> 
> BTW, it seems powerpc does not use kretprobe/rethook shadow stack for
> stack unwinding yet, is that right?

Yes, you are right. That would be a good addition. I suppose we could 
add something in show_stack() to show the actual function name rather 
than the rethook trampoline. It can be a separate patch though.


Thanks,
Naveen

