Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93E903F4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 16:56:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cs8Xy1+R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzBZ50hDZz3fK3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 00:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cs8Xy1+R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzBYN6lYjz3cVX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 00:55:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CC2FFCE1C44;
	Tue, 11 Jun 2024 14:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B43C2BD10;
	Tue, 11 Jun 2024 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718117715;
	bh=11/HiJoW5+6q8fDESDW/gk+g0OZZ9thvOcYhQN1VEx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cs8Xy1+R4/8R6h8s1mZ1BIgUEKuo7cGNONODGo3gF4OwLXdlOnTx3XfcqNAViBYex
	 dghIO6lSUV43/KFGsJ+fJAkybiIWYK3QBwqvm6fOTI0n7gT2RyaW8/8awX3Ws2pyUG
	 UBtsOjunXW09lE0oYVtfkJpsU4ptqgCrd5EpV5PoJXAOzN3sxK0/eU3b1p36cq3zzG
	 ZvT0kA5WeEs36PLb5saaQGul/ICkBAoFC10lGZM6P7rFw0S8ZM5LV2VTB7g8GBqPNA
	 7SA7woali8fyy8C9Ir8KKY2+NUAvn+vXi3YO+Xp8t+T+yDUqLMgIY3acF2ob6ASKn5
	 kJP+k46fM+wAg==
Date: Tue, 11 Jun 2024 20:17:19 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC PATCH v2 3/5] powerpc/ftrace: Unify 32-bit and 64-bit
 ftrace entry code
Message-ID: <dqnvoc7ntsd6dfg77je3d4wss5berq3fvcetviizr44zibefw5@26olqqpbciey>
References: <cover.1718008093.git.naveen@kernel.org>
 <dde8c1e55cfb4c878860f47308a52b273e96ae67.1718008093.git.naveen@kernel.org>
 <20240610160632.089b6c04@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610160632.089b6c04@gandalf.local.home>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 10, 2024 at 04:06:32PM GMT, Steven Rostedt wrote:
> On Mon, 10 Jun 2024 14:08:16 +0530
> Naveen N Rao <naveen@kernel.org> wrote:
> 
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
> > 
> > Signed-off-by: Naveen N Rao <naveen@kernel.org>
> 
> Isn't there still the race that there's a preemption between the:
> 
> 	stw	r0, 4(r1)
> and
> 	bl	_mcount
> 
> And if this breaks stack unwinding, couldn't this cause an issue for live
> kernel patching?
> 
> I know it's very unlikely, but in theory, I think the race exists.

I *think* you are assuming that we will be patching back the 'stw' 
instruction here? So, there could be an issue if a cpu has executed the 
nop instead of 'stw' and then sees the call to _mcount().

But, we don't patch back the 'stw' instruction. That is instead done as 
part of ftrace_caller(), along with setting up an additional stack frame 
to ensure reliable stack unwinding. Commit 41a506ef71eb 
("powerpc/ftrace: Create a dummy stackframe to fix stack unwind") has 
more details.

The primary motivation for this patch is to address differences in the 
function profile sequence with various toolchains. Since commit 
0f71dcfb4aef ("powerpc/ftrace: Add support for 
-fpatchable-function-entry"), we use the same two-instruction profile 
sequence across 32-bit and 64-bit powerpc:
	mflr	r0
	bl	ftrace_caller

This has also been true on 64-bit powerpc with -mprofile-kernel, except 
the very early versions of gcc that supported that option (gcc v5).

On 32-bit powerpc, we used to use the three instruction sequence before 
support for -fpatchable-function-entry was introduced.

In this patch, we move all toolchain variants to use the two-instruction 
sequence for consistency.


Thanks,
Naveen
