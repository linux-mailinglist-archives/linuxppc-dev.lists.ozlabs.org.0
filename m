Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BFA4B4664
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 10:36:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxzdN4Nwgz3cQc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 20:36:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=r8H/h8Ig;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxzc643ZHz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 20:35:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/kVIgFJ8ubFPieTzVWtZtI9HqscvRt6tDLYaMfGuR94=; b=r8H/h8Igq0GzYQRu9lX+4vZpkz
 PZT8xyiFTwmYfH8zubh1ywbnAQuGsxBwPjrNNrXA/o5U2JjK2PG0V0xRX/sJIDHEu54dC9/6UiQmL
 F+Y3JW1EqyYpAxhmND0M+vmbJxIzO/juCEX+l1Qxgp3yY0pks+vRezLo8UnjVQpQDnV21BZMIq5eU
 cLBiNTmqSIIC6wmCTCn7UcAw94DlAlbMufV+uEMoQM32jv5F+3qmu69tvjWwB6IZXb47Xsbg77XjX
 QWG7HLXHrI/r9z3omtqEEq49GOXiD1gj/PIcUnY9oVdJvwe1GhbBV1iVjaieum7WgA5MFUOuUx9Vo
 TDY7Hsgw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXlV-00CkQY-Gv; Mon, 14 Feb 2022 09:35:25 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CF6CF300472;
 Mon, 14 Feb 2022 10:35:22 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 94416203C074A; Mon, 14 Feb 2022 10:35:22 +0100 (CET)
Date: Mon, 14 Feb 2022 10:35:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: BUG: sleeping function called from invalid context at
 include/linux/sched/mm.h:256
Message-ID: <YgoiWlNZvTusk1B9@hirez.programming.kicks-ass.net>
References: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org, linux-mm@kvack.org,
 Jason Baron <jbaron@akamai.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 13, 2022 at 12:05:50AM +0100, Paul Menzel wrote:

> [    0.012154][    T1] BUG: sleeping function called from invalid context at

> [    0.022443][    T1] [c0000000084837d0] [c000000000961aac] > dump_stack_lvl+0xa0/0xec (unreliable)
> [    0.023356][    T1] [c000000008483820] [c00000000019b314] > __might_resched+0x2f4/0x310
> [    0.024174][    T1] [c0000000084838b0] [c0000000004c0c70] > kmem_cache_alloc+0x220/0x4b0
> [    0.025000][    T1] [c000000008483920] [c000000000448af4] > __pud_alloc+0x74/0x1d0
> [    0.025772][    T1] [c000000008483970] [c00000000008fe3c] > hash__map_kernel_page+0x2cc/0x390
> [    0.026643][    T1] [c000000008483a20] [c0000000000a9944] > do_patch_instruction+0x134/0x4a0

do_patch_instruction() rightfully disables IRQs, but then it goes and
tries a memory alloc, which seems a bit daft.

I'm thinking Christophe might know more... he's recently been poking at
Power text poking..
