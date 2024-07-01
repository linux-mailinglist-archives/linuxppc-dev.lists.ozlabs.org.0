Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB1291E7E3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 20:40:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aW+lKXo0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCZcR1mnDz3g9q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 04:40:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aW+lKXo0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCZbk5W8Lz3g7b
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 04:40:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77F50CE1A96;
	Mon,  1 Jul 2024 18:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B6AC116B1;
	Mon,  1 Jul 2024 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719859216;
	bh=YWrBx29R0c65U4WFrfcrcQPdKQrnBF4uPKA/07DchZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aW+lKXo050uPeYsZjhdkenXFQf+s/CXnOpDVeYmhjxlrrI7rrFZuIqnwt3mxocRB2
	 A/BB3QcWm2PYeGlMD+1+SLCyrxZ+3NfQs9FPZuHv7KRJ9iyd2cbL2+H+hhI2JcedW3
	 pDyclZH8ieGJCcWCIMZAGgHVIvIXbaIzFxXGo1sGA2ViYO2KL8AlZ/2oxEEgkijcDt
	 2Dlnnx6f01SYDX0HgAB5z5Z4lYUeRlb+Gd+Fe410svHzqiiveo2bnl0NyzZIOVCwxh
	 uhRh0Tg0/R0MZLOYhK2OA3Z9GREgzWnIAA8vPdeiX/ZXTY/oZxD74Bp3zDlTemM5Ba
	 Sh9EHOsASbirA==
Date: Tue, 2 Jul 2024 00:04:23 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 02/11] powerpc/ftrace: Unify 32-bit and 64-bit
 ftrace entry code
Message-ID: <hwit6chsxkrn57pbl7k4yx6eu62ao2im3dolm4kmgpprr5ljtm@w6denhl7xvj3>
References: <cover.1718908016.git.naveen@kernel.org>
 <f2d5d66d47b28474b6224613787757fed3e92d3d.1718908016.git.naveen@kernel.org>
 <D2E2T58ECN7G.1CFVM4AI1ZESG@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D2E2T58ECN7G.1CFVM4AI1ZESG@gmail.com>
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

On Mon, Jul 01, 2024 at 06:57:12PM GMT, Nicholas Piggin wrote:
> On Fri Jun 21, 2024 at 4:54 AM AEST, Naveen N Rao wrote:
> > On 32-bit powerpc, gcc generates a three instruction sequence for
> > function profiling:
> > 	mflr	r0
> > 	stw	r0, 4(r1)
> > 	bl	_mcount
> >
> > On kernel boot, the call to _mcount() is nop-ed out, to be patched back
> > in when ftrace is actually enabled. The 'stw' instruction therefore is
> > not necessary unless ftrace is enabled. Nop it out during ftrace init.
> >
> > When ftrace is enabled, we want the 'stw' so that stack unwinding works
> > properly. Perform the same within the ftrace handler, similar to 64-bit
> > powerpc.
> >
> > For 64-bit powerpc, early versions of gcc used to emit a three
> > instruction sequence for function profiling (with -mprofile-kernel) with
> > a 'std' instruction to mimic the 'stw' above. Address that scenario also
> > by nop-ing out the 'std' instruction during ftrace init.
> 
> Cool! Could 32-bit use the 2-insn sequence as well if it had
> -mprofile-kernel, out of curiosity?

Yes! It actually already does with the previous change to add support 
for -fpatchable-function-entry. Commit 0f71dcfb4aef ("powerpc/ftrace: 
Add support for -fpatchable-function-entry") changelog describes this:

    This changes the profiling instructions used on ppc32. The default -pg
    option emits an additional 'stw' instruction after 'mflr r0' and before
    the branch to _mcount 'bl _mcount'. This is very similar to the original
    -mprofile-kernel implementation on ppc64le, where an additional 'std'
    instruction was used to save LR to its save location in the caller's
    stackframe. Subsequently, this additional store was removed in later
    compiler versions for performance reasons. The same reasons apply for
    ppc32 so we only patch in a 'mflr r0'.


> 
> >
> > Signed-off-by: Naveen N Rao <naveen@kernel.org>
> > ---
> >  arch/powerpc/kernel/trace/ftrace.c       | 6 ++++--
> >  arch/powerpc/kernel/trace/ftrace_entry.S | 4 ++--
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> > index d8d6b4fd9a14..463bd7531dc8 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -241,13 +241,15 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> >  		/* Expected sequence: 'mflr r0', 'stw r0,4(r1)', 'bl _mcount' */
> >  		ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
> >  		if (!ret)
> > -			ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4)));
> > +			ret = ftrace_modify_code(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4)),
> > +						 ppc_inst(PPC_RAW_NOP()));
> >  	} else if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
> >  		/* Expected sequence: 'mflr r0', ['std r0,16(r1)'], 'bl _mcount' */
> >  		ret = ftrace_read_inst(ip - 4, &old);
> >  		if (!ret && !ppc_inst_equal(old, ppc_inst(PPC_RAW_MFLR(_R0)))) {
> >  			ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
> > -			ret |= ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16)));
> > +			ret |= ftrace_modify_code(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16)),
> > +						  ppc_inst(PPC_RAW_NOP()));
> 
> So this is the old style path... Should you check the mflr validate
> result first? Also do you know what GCC version, roughly? Maybe we
> could have a comment here and eventually deprecate it.

Sure, this is gcc v5.5 for sure. gcc v6.3 doesn't seem to emit the 
additional 'std' instruction.

> 
> You could split this change into its own patch.

Indeed. I will do that.

> 
> >  		}
> >  	} else {
> >  		return -EINVAL;
> > diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
> > index 76dbe9fd2c0f..244a1c7bb1e8 100644
> > --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> > +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> > @@ -33,6 +33,8 @@
> >   * and then arrange for the ftrace function to be called.
> >   */
> >  .macro	ftrace_regs_entry allregs
> > +	/* Save the original return address in A's stack frame */
> > +	PPC_STL		r0, LRSAVE(r1)
> >  	/* Create a minimal stack frame for representing B */
> >  	PPC_STLU	r1, -STACK_FRAME_MIN_SIZE(r1)
> >  
> > @@ -44,8 +46,6 @@
> >  	SAVE_GPRS(3, 10, r1)
> >  
> >  #ifdef CONFIG_PPC64
> > -	/* Save the original return address in A's stack frame */
> > -	std	r0, LRSAVE+SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE(r1)
> >  	/* Ok to continue? */
> >  	lbz	r3, PACA_FTRACE_ENABLED(r13)
> >  	cmpdi	r3, 0
> 
> That seems right to me.
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Naveen
