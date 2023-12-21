Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B821281B978
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 15:25:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swt4V3T9mz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 01:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=vhtz=ia=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swt424wvLz2xWR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 01:24:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8B503B82026;
	Thu, 21 Dec 2023 14:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3065C433C9;
	Thu, 21 Dec 2023 14:24:42 +0000 (UTC)
Date: Thu, 21 Dec 2023 09:25:45 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 6/9] powerpc/ftrace: Update and move function
 profile instructions out-of-line
Message-ID: <20231221092545.1b696eb6@gandalf.local.home>
In-Reply-To: <e2e467a3-7283-4f22-8cd9-2d1875f60e92@csgroup.eu>
References: <cover.1702045299.git.naveen@kernel.org>
	<39363eb6b1857f26f9fa51808ad48b0121899b84.1702045299.git.naveen@kernel.org>
	<e2e467a3-7283-4f22-8cd9-2d1875f60e92@csgroup.eu>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Dec 2023 10:46:08 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> > To enable ftrace, the nop at function entry is changed to an
> > unconditional branch to 'tramp'. The call to ftrace_caller() may be
> > updated to ftrace_regs_caller() depending on the registered ftrace ops.
> > On 64-bit powerpc, we additionally change the instruction at 'tramp' to
> > 'mflr r0' from an unconditional branch back to func+4. This is so that
> > functions entered through the GEP can skip the function profile sequence
> > unless ftrace is enabled.
> > 
> > With the context_switch microbenchmark on a P9 machine, there is a
> > performance improvement of ~6% with this patch applied, going from 650k
> > context switches to 690k context switches without ftrace enabled. With
> > ftrace enabled, the performance was similar at 86k context switches.  
> 
> Wondering how significant that context_switch micorbenchmark is.
> 
> I ran it on both mpc885 and mpc8321 and I'm a bit puzzled by some of the 
> results:
> # ./context_switch --no-fp
> Using threads with yield on cpus 0/0 touching FP:no altivec:no vector:no 
> vdso:no
> 
> On 885, I get the following results before and after your patch.
> 
> CONFIG_FTRACE not selected : 44,9k
> CONFIG_FTRACE selected, before : 32,8k
> CONFIG_FTRACE selected, after : 33,6k
> 
> All this is with CONFIG_INIT_STACK_ALL_ZERO which is the default. But 
> when I select CONFIG_INIT_STACK_NONE, the CONFIG_FTRACE not selected 
> result is only 34,4.
> 
> On 8321:
> 
> CONFIG_FTRACE not selected : 100,3k
> CONFIG_FTRACE selected, before : 72,5k
> CONFIG_FTRACE selected, after : 116k
> 
> So the results look odd to me.


BTW, CONFIG_FTRACE just enables the tracing system (I would like to change
that to CONFIG_TRACING, but not sure if I can without breaking .configs all
over the place).

The nops for ftrace is enabled with CONFIG_FUNCTION_TRACER.

-- Steve
