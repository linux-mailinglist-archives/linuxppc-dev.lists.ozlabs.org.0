Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCCD696DF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:30:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGWWj2H3cz3f4R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 06:30:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=bian=6k=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGWW569cJz3bfs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 06:29:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D8EFAB81ECB;
	Tue, 14 Feb 2023 19:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE92C433EF;
	Tue, 14 Feb 2023 19:29:45 +0000 (UTC)
Date: Tue, 14 Feb 2023 14:29:44 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Message-ID: <20230214142944.100214fe@rorschach.local.home>
In-Reply-To: <20230214182322.r5tyeowxzloiuh72@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
	<cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
	<1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org>
	<20230214182322.r5tyeowxzloiuh72@treble>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@l
 inaro.org>, bristot@redhat.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Feb 2023 10:23:22 -0800
Josh Poimboeuf <jpoimboe@kernel.org> wrote:


> void __ref cpu_die(void)
> {
> 	idle_task_exit();
> 	local_irq_disable();
> 	__asm__ __volatile__(
> 			"	movi	a2, cpu_restart\n"
> 			"	jx	a2\n");
> 
> 	BUG();
> }
> 
> Hm, not only is the comment wrong, but it seems to be branching to
> cpu_restart?  That doesn't seem right at all.

Agreed, that does not look right at all.

-- Steve

> 
> Max/Chris?
> 

