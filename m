Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1726D9858
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 15:34:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsjC721F6z3fJk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 23:34:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BDn6m0yW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BDn6m0yW;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsjBF2QCPz3fDv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 23:33:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8m50I/Ah33OEfXawnqY/+7a+kb6PdH9s8PZL/puCTb8=; b=BDn6m0yWTioOdmUoj2vNFk/9Kq
	E3jqJ2aswcVVxCzKrLJcxUza7IGtwWNvHaCywMfJf4ZqTjvIJqrQnKwgLnyKqVaB8mB0HJrFfgWJ5
	QoWrxGQt8uXMJZ1oWyaF6RQG2UmojK9F4eXmB1OkhAO+YwUs7gNgvlxNnenV+vzWvaD9yCcGzNyhH
	qY9Fq8ToVeVAGpc7TALor/XzTwT+IgjMjtlibDz2/Kw4q0z21hdW+F2EDFbmp5RoMAX9GLXNwIa9b
	e5q7Ym/WFOQGFTf28c+5rkhAfU4qynJ0DYOiow3+Q0jkH8SYzkWKnhoWVPQCxLWuVTNBYyo1iOZF7
	OufwRulQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPih-00AXEX-1N;
	Thu, 06 Apr 2023 13:32:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DA9393000DC;
	Thu,  6 Apr 2023 15:32:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C1731212E36AE; Thu,  6 Apr 2023 15:32:06 +0200 (CEST)
Date: Thu, 6 Apr 2023 15:32:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230406133206.GN386572@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC3PUkI7N2uEKy6v@tpad>
 <20230405195457.GC365912@hirez.programming.kicks-ass.net>
 <ZC6/0hRXztNwqXg0@tpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC6/0hRXztNwqXg0@tpad>
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

On Thu, Apr 06, 2023 at 09:49:22AM -0300, Marcelo Tosatti wrote:

> > > 2) Depends on the application and the definition of "occasional".
> > > 
> > > For certain types of applications (for example PLC software or
> > > RAN processing), upon occurrence of an event, it is necessary to
> > > complete a certain task in a maximum amount of time (deadline).
> > 
> > If the application is properly NOHZ_FULL and never does a kernel entry,
> > it will never get that IPI. If it is a pile of shit and does kernel
> > entries while it pretends to be NOHZ_FULL it gets to keep the pieces and
> > no amount of crying will get me to care.
> 
> I suppose its common practice to use certain system calls in latency
> sensitive applications, for example nanosleep. Some examples:
> 
> 1) cyclictest		(nanosleep)

cyclictest is not a NOHZ_FULL application, if you tihnk it is, you're
deluded.

> 2) PLC programs		(nanosleep)

What's a PLC? Programmable Logic Circuit?

> A system call does not necessarily have to take locks, does it ?

This all is unrelated to locks

> Or even if application does system calls, but runs under a VM,
> then you are requiring it to never VM-exit.

That seems to be a goal for performance anyway.

> This reduces the flexibility of developing such applications.

Yeah, that's the cards you're dealt, deal with it.
