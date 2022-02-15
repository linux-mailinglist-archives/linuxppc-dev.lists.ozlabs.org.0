Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A464B6EF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 15:39:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JykHr3GyTz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 01:39:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=yulh=s6=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JykHP2Y1Fz30QY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 01:38:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FA64B81A62;
 Tue, 15 Feb 2022 14:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DDAC340EB;
 Tue, 15 Feb 2022 14:38:50 +0000 (UTC)
Date: Tue, 15 Feb 2022 09:38:49 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Message-ID: <20220215093849.556d5444@gandalf.local.home>
In-Reply-To: <1644930705.g64na2kgvd.naveen@linux.ibm.com>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
 <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
 <875ypgo0f3.fsf@mpe.ellerman.id.au>
 <1644930705.g64na2kgvd.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Feb 2022 19:06:48 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> As I understand it, the reason ftrace_get_regs() was introduced was to 
> be able to only return the pt_regs, if _all_ registers were saved into 
> it, which we don't do when coming in through ftrace_caller(). See the 
> x86 implementation (commit 02a474ca266a47 ("ftrace/x86: Allow for 
> arguments to be passed in to ftrace_regs by default"), which returns 
> pt_regs conditionally.

I can give you the history of ftrace_caller and ftrace_regs_caller.

ftrace_caller saved just enough as was denoted for gcc mcount trampolines.
The new fentry which happens at the start of the function, whereas mcount
happens after the stack frame is set up, may change the rules on some
architectures.

As for ftrace_regs_caller, that was created for kprobes. As the majority of
kprobes were added at the start of the function, it made sense to hook into
ftrace as the ftrace trampoline call is much faster than taking a
breakpoint interrupt. But to keep compatibility with breakpoint
interrupts, we needed to fill in all the registers, and make it act just
like a breakpoint interrupt.

I've been wanting to record function parameters, and because the ftrace
trampoline must at a minimum save the function parameters before calling
the ftrace callbacks, all the information for those parameters were being
saved but were never exposed to the ftrace callbacks. I created the the
DYNAMIC_FTRACE_WITH_ARGS to expose them. I first just used pt_regs with
just the parameters filled in, but that was criticized as it could be
confusing where the non filled in pt_regs might be used and thinking they
are legitimate. So I created ftrace_regs that would give you just the
function arguments (if DYNAMIC_FTRACE_WITH_ARGS is defined), or it will
give you a full pt_regs, if the caller came from the ftrace_regs_caller. If
not, it will give you a NULL pointer.

The first user to use the args was live kernel patching, as they only need
that and the return pointer.

-- Steve
