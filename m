Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D581175D89E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 03:23:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qX6KSrLj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R77wc6k8Fz3c4s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 11:23:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qX6KSrLj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R77vh6T8kz3bt5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 11:22:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0344D61DB8;
	Sat, 22 Jul 2023 01:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5AEC433C7;
	Sat, 22 Jul 2023 01:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689988957;
	bh=ymdnVGyJNnGUv2HZI8/M1PK0lCyu640ix4SSxWqfV44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qX6KSrLjUNhNPi02nh+6ca0mclsiX8ngx6MgAoXToVEXfxGVJDqDd+M/xrQSvGPdo
	 HnjJABDZ+OFRbofb+JDvnjIEveDSuko/ikgRmWfqsjkq952i36BAMvINTGaChjawkN
	 B6OgwD+8AJO8pd8z/xs4a/6K9P/a/2QBnvpuWam+MrqHhLdmuXK4SwdOcmYgpxe7vM
	 22q4vDY9qAL+C5nUG3OBKyhHxxOwDvkPnHotsHGxEf6IGBGHRf44LFpW0ECov/5dH/
	 YZurOS/9kOxHoWBIWBcbE7057VWjExGXUHZp3YSqZogBmtq6DHFSz4dzR5vmf0EeHL
	 9OCfZ4ADrf3gQ==
Date: Fri, 21 Jul 2023 18:22:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20230721182235.6617a466@kernel.org>
In-Reply-To: <20230721122632.56b4df6c@gandalf.local.home>
References: <20211015110035.14813389@gandalf.local.home>
	<20211015161702.GF174703@worktop.programming.kicks-ass.net>
	<20211015133504.6c0a9fcc@gandalf.local.home>
	<20211015135806.72d1af23@gandalf.local.home>
	<20211015180429.GK174703@worktop.programming.kicks-ass.net>
	<20211015142033.72605b47@gandalf.local.home>
	<20211015142541.4badd8a9@gandalf.local.home>
	<1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
	<20230721120040.6ed2c02a@gandalf.local.home>
	<035cee53-255b-11a3-d7ac-ca46c05b907b@intel.com>
	<20230721122632.56b4df6c@gandalf.local.home>
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
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Paul Mackerras <paulus@samba.org>, Jisheng Zhang <jszhang@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>, Jiri Kosina <jikos@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Guo Ren <guo
 ren@kernel.org>, Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Jul 2023 12:26:32 -0400 Steven Rostedt wrote:
> > if (!(in_hardirq() || irqs_disabled()))
> >   
> 
> Yeah, probably.
> 
> > , nothing more elegant / already existing / ...?  
> 
> It's not a common check. What would you call that?

Looks like Olek started the weekend already so let me answer.
He's trying to check if we can use a fast path cache which takes
a _bh spin lock.
