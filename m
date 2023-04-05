Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72DE6D8780
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 21:57:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsFlf3wzGz3fCn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 05:57:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CJI95hU4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CJI95hU4;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsFkk2NPrz3cjL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 05:56:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B30n3pHhQ67VUrCvHblGlQhSttCrPNMRQNjpDfnCSKM=; b=CJI95hU4T3CctR2X2KCz7i8NWi
	YVt1ex1JpgAHIkmuy1kwgmXIwoo8mBoQM1QWzDBBKhLlgV5gG20QMCPVnsJLgz7GRzOm4rDjqGEX7
	SmFG/4YZOLagPlJCfMyKsqXiKz6fWZ/Jk9afJU/jjYA7gG9XdM9XNSnVMS1ZUyvJEx5WQFenjZoAI
	zO2cSWiVjU2pubWN8bbwjUL6wmrfBNOTp8MuoRZde24eZSrrkyuyRHB2Tk3nQSha1cz0pm0m39FhU
	k2KMEzOUMhMRj2A+rxwttKpIIRQXafgeaIFhn68NBf9aN8oHHlDlL/YAU/DyPzhJcQlSRGMXoJ0cF
	xlMCIp8w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9De-00A4Ht-2h;
	Wed, 05 Apr 2023 19:54:59 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B6577300194;
	Wed,  5 Apr 2023 21:54:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9929B200B42A8; Wed,  5 Apr 2023 21:54:57 +0200 (CEST)
Date: Wed, 5 Apr 2023 21:54:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230405195457.GC365912@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC3PUkI7N2uEKy6v@tpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC3PUkI7N2uEKy6v@tpad>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@da
 vemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 04:43:14PM -0300, Marcelo Tosatti wrote:

> Two points:
> 
> 1) For a virtualized system, the overhead is not only of executing the
> IPI but:
> 
> 	VM-exit
> 	run VM-exit code in host
> 	handle IPI
> 	run VM-entry code in host
> 	VM-entry

I thought we could do IPIs without VMexit these days? Also virt... /me
walks away.

> 2) Depends on the application and the definition of "occasional".
> 
> For certain types of applications (for example PLC software or
> RAN processing), upon occurrence of an event, it is necessary to
> complete a certain task in a maximum amount of time (deadline).

If the application is properly NOHZ_FULL and never does a kernel entry,
it will never get that IPI. If it is a pile of shit and does kernel
entries while it pretends to be NOHZ_FULL it gets to keep the pieces and
no amount of crying will get me to care.
