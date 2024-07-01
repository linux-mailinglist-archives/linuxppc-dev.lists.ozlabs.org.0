Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65E91E915
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 22:00:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBgTVwIQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCcNj6NWDz3dhR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 06:00:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBgTVwIQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCcN22tbfz3dTT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 06:00:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 918966126F;
	Mon,  1 Jul 2024 20:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C7BC116B1;
	Mon,  1 Jul 2024 20:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719864016;
	bh=HOe/q2x64JLK6UhZnoyDYpQNWW5obTHws+8OFaBVsw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBgTVwIQC2olfrsUXYgK3T5FqOLvM9Ko7870xFqkz5qU7nvxkagVJVT23v/rXwyqL
	 7RQEPYyfbF52KCruxJdNX3/3sfbkXGC0273oh3i86t2dWAWMprwE3JE0UvRoQbK351
	 xLNNQlFJHy1c6SWMpA2pazbRZk0lgvMDWBSAcHbEREIoCq2zE+Bn3uXxo7yNo6vC80
	 q+ki+yJygATs9/Cl8peZjm5xUSP2rmpzLIkR+P7VxR/sLkZR5cPl8AjgfXXe1mDdeV
	 p/p0WfKWZJkeQm/x2ezpoGUn56oE+kDkOYEtpOLaGhUXt8HSXza2iwZFqbRREks9wr
	 4bGYFFsyJLktw==
Date: Tue, 2 Jul 2024 01:28:00 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 11/11] powerpc64/bpf: Add support for bpf
 trampolines
Message-ID: <ldghd5e4ltteizchnhwdzf45rdcy6pr2iovchboz4b263jpbun@dhwjlq223kwv>
References: <cover.1718908016.git.naveen@kernel.org>
 <a88b5b57d7e9b6db96323a6d6b236d567ebd6443.1718908016.git.naveen@kernel.org>
 <D2E5I4W6C23X.3A42AJCY8ODUJ@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D2E5I4W6C23X.3A42AJCY8ODUJ@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 01, 2024 at 09:03:52PM GMT, Nicholas Piggin wrote:
> On Fri Jun 21, 2024 at 5:09 AM AEST, Naveen N Rao wrote:
> > Add support for bpf_arch_text_poke() and arch_prepare_bpf_trampoline()
> > for 64-bit powerpc.
> 
> What do BPF trampolines give you?

At a very basic level, they provide a way to attach bpf programs at 
function entry/exit - as an alternative to ftrace/kprobe - in a more 
optimal manner. Commit fec56f5890d9 ("bpf: Introduce BPF trampoline") 
has more details.

> 
> > BPF prog JIT is extended to mimic 64-bit powerpc approach for ftrace
> > having a single nop at function entry, followed by the function
> > profiling sequence out-of-line and a separate long branch stub for calls
> > to trampolines that are out of range. A dummy_tramp is provided to
> > simplify synchronization similar to arm64.
> 
> Synrhonization - between BPF and ftrace interfaces?
> 
> > BPF Trampolines adhere to the existing ftrace ABI utilizing a
> > two-instruction profiling sequence, as well as the newer ABI utilizing a
> > three-instruction profiling sequence enabling return with a 'blr'. The
> > trampoline code itself closely follows x86 implementation.
> >
> > While the code is generic, BPF trampolines are only enabled on 64-bit
> > powerpc. 32-bit powerpc will need testing and some updates.
> >
> > Signed-off-by: Naveen N Rao <naveen@kernel.org>
> 
> Just a quick glance for now, and I don't know BPF code much.
> 
> > ---
> >  arch/powerpc/include/asm/ppc-opcode.h |  14 +
> >  arch/powerpc/net/bpf_jit.h            |  11 +
> >  arch/powerpc/net/bpf_jit_comp.c       | 702 +++++++++++++++++++++++++-
> >  arch/powerpc/net/bpf_jit_comp32.c     |   7 +-
> >  arch/powerpc/net/bpf_jit_comp64.c     |   7 +-
> >  5 files changed, 738 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
> > index 076ae60b4a55..9eaa2c5d9b73 100644
> > --- a/arch/powerpc/include/asm/ppc-opcode.h
> > +++ b/arch/powerpc/include/asm/ppc-opcode.h
> > @@ -585,12 +585,26 @@
> >  #define PPC_RAW_MTSPR(spr, d)		(0x7c0003a6 | ___PPC_RS(d) | __PPC_SPR(spr))
> >  #define PPC_RAW_EIEIO()			(0x7c0006ac)
> >  
> > +/* bcl 20,31,$+4 */
> > +#define PPC_RAW_BCL()			(0x429f0005)
> 
> This is the special bcl form that gives the current address.
> Maybe call it PPC_RAW_BCL4()

Sure.

> 
> >  
> > +void dummy_tramp(void);
> > +
> > +asm (
> > +"	.pushsection .text, \"ax\", @progbits	;"
> > +"	.global dummy_tramp			;"
> > +"	.type dummy_tramp, @function		;"
> > +"dummy_tramp:					;"
> > +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +"	blr					;"
> > +#else
> > +"	mflr	11				;"
> 
> Can you just drop this instruction? The caller will always
> have it in r11?

Indeed. Will add a comment and remove the instruction.

> 
> > +"	mtctr	11				;"
> > +"	mtlr	0				;"
> > +"	bctr					;"
> > +#endif
> > +"	.size dummy_tramp, .-dummy_tramp	;"
> > +"	.popsection				;"
> > +);
> > +
> > +void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context *ctx)
> > +{
> > +	int ool_stub_idx, long_branch_stub_idx;
> > +
> > +	/*
> > +	 * Out-of-line stub:
> > +	 *	mflr	r0
> > +	 *	[b|bl]	tramp
> > +	 *	mtlr	r0 // only with CONFIG_FTRACE_PFE_OUT_OF_LINE
> > +	 *	b	bpf_func + 4
> > +	 */
> > +	ool_stub_idx = ctx->idx;
> > +	EMIT(PPC_RAW_MFLR(_R0));
> > +	EMIT(PPC_RAW_NOP());
> > +	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> > +		EMIT(PPC_RAW_MTLR(_R0));
> > +	WARN_ON_ONCE(!is_offset_in_branch_range(4 - (long)ctx->idx * 4)); /* TODO */
> > +	EMIT(PPC_RAW_BRANCH(4 - (long)ctx->idx * 4));
> > +
> > +	/*
> > +	 * Long branch stub:
> > +	 *	.long	<dummy_tramp_addr>
> > +	 *	mflr	r11
> > +	 *	bcl	20,31,$+4
> > +	 *	mflr	r12
> > +	 *	ld	r12, -8-SZL(r12)
> > +	 *	mtctr	r12
> > +	 *	mtlr	r11 // needed to retain ftrace ABI
> > +	 *	bctr
> > +	 */
> 
> You could avoid clobbering LR on >= POWER9 with addpcis instruction. Or
> use a pcrel load with pcrel even. I guess that's something to do later.

Yes, much of BPF JIT could use a re-look to consider opportunities to 
emit prefix instructions.


Thanks,
Naveen

