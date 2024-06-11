Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 550E6903FCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 17:15:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzC032d4Cz3fmj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 01:14:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=hook=nn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzBzd2XhNz3cVF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 01:14:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A934CE19B3;
	Tue, 11 Jun 2024 15:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6C1C2BD10;
	Tue, 11 Jun 2024 15:14:28 +0000 (UTC)
Date: Tue, 11 Jun 2024 11:14:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v2 3/5] powerpc/ftrace: Unify 32-bit and 64-bit
 ftrace entry code
Message-ID: <20240611111444.0786a633@gandalf.local.home>
In-Reply-To: <dqnvoc7ntsd6dfg77je3d4wss5berq3fvcetviizr44zibefw5@26olqqpbciey>
References: <cover.1718008093.git.naveen@kernel.org>
	<dde8c1e55cfb4c878860f47308a52b273e96ae67.1718008093.git.naveen@kernel.org>
	<20240610160632.089b6c04@gandalf.local.home>
	<dqnvoc7ntsd6dfg77je3d4wss5berq3fvcetviizr44zibefw5@26olqqpbciey>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 11 Jun 2024 20:17:19 +0530
Naveen N Rao <naveen@kernel.org> wrote:

> > I know it's very unlikely, but in theory, I think the race exists.  
> 
> I *think* you are assuming that we will be patching back the 'stw' 

Yes, that was what I was assuming :-p

> instruction here? So, there could be an issue if a cpu has executed the 
> nop instead of 'stw' and then sees the call to _mcount().
> 
> But, we don't patch back the 'stw' instruction. That is instead done as 
> part of ftrace_caller(), along with setting up an additional stack frame 
> to ensure reliable stack unwinding. Commit 41a506ef71eb 
> ("powerpc/ftrace: Create a dummy stackframe to fix stack unwind") has 
> more details.
> 
> The primary motivation for this patch is to address differences in the 
> function profile sequence with various toolchains. Since commit 
> 0f71dcfb4aef ("powerpc/ftrace: Add support for 
> -fpatchable-function-entry"), we use the same two-instruction profile 
> sequence across 32-bit and 64-bit powerpc:
> 	mflr	r0
> 	bl	ftrace_caller
> 
> This has also been true on 64-bit powerpc with -mprofile-kernel, except 
> the very early versions of gcc that supported that option (gcc v5).
> 
> On 32-bit powerpc, we used to use the three instruction sequence before 
> support for -fpatchable-function-entry was introduced.
> 
> In this patch, we move all toolchain variants to use the two-instruction 
> sequence for consistency.

OK, if you are not patching that back, then all should be good.

-- Steve
