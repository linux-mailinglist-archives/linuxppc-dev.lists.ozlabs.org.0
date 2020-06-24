Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23073207B02
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 19:56:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sW6r12VWzDqjj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 03:56:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=ta0+ik8I; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sW4j6LbwzDqBM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 03:54:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ITI+6nMfT1OTxjvFBXS8SqWS++zlFeNEzUYzivsKdN8=; b=ta0+ik8IcGl2bYYyUFC54uqCk6
 +qqjbp4JGa3fmCsMN/1XR64QetGWyQS7cOPLkZ8Sd7seu27n2ZU99DG+4ZKeiqVLFi2Rd7wtO2UQL
 GW1uJnydKQdPJ+UYCtnZqxOq3N+MMH4ujD7+ifq6lXpdKwBallQxHrfd/GFtCJ50BRlw/CGboN9pc
 McgLZcB/OlZcMCQsulJ8euQOvryCEFjsKTzMp3VAhwXyIV2SrxsERi8YF8lKPZ3whCYUpdG9ydSSy
 8mm8SW6N3uO4HWb9t4VOVM4mMwpHKHwfG2gwyqBetkNwHqtzniEsgU9+gFIcvhEFRolCmsw5lTQoG
 QoEIkerQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo9aM-0002ji-Rj; Wed, 24 Jun 2020 17:53:23 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6C7B1307966;
 Wed, 24 Jun 2020 19:53:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5D2E321AD36DB; Wed, 24 Jun 2020 19:53:20 +0200 (CEST)
Date: Wed, 24 Jun 2020 19:53:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 6/8] arm: Break cyclic percpu include
Message-ID: <20200624175320.GN4781@hirez.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.454517573@infradead.org>
 <20200623090257.GA3743@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623090257.GA3743@willie-the-truck>
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
Cc: linux-s390@vger.kernel.org, bigeasy@linutronix.de, x86@kernel.org,
 heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 davem@davemloft.net, a.darwish@linutronix.de, sparclinux@vger.kernel.org,
 linux@armlinux.org.uk, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 10:02:57AM +0100, Will Deacon wrote:
> On Tue, Jun 23, 2020 at 10:36:51AM +0200, Peter Zijlstra wrote:
> > In order to use <asm/percpu.h> in irqflags.h, we need to make sure
> > asm/percpu.h does not itself depend on irqflags.h.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  arch/arm/include/asm/percpu.h |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > --- a/arch/arm/include/asm/percpu.h
> > +++ b/arch/arm/include/asm/percpu.h
> > @@ -10,6 +10,8 @@
> >   * in the TPIDRPRW. TPIDRPRW only exists on V6K and V7
> >   */
> >  #if defined(CONFIG_SMP) && !defined(CONFIG_CPU_V6)
> > +register unsigned long current_stack_pointer asm ("sp");
> 
> If you define this unconditionally, then we can probably get rid of the
> copy in asm/thread_info.h, rather than duplicate the same #define.

The below delta seems to build arm-allnoconfig, arm-defconfig and
arm-allmodconfig.

Although please don't ask me how asm/thread_info.h includes asm/percpu.h

Does that work for you?

diff --git a/arch/arm/include/asm/percpu.h b/arch/arm/include/asm/percpu.h
index e86e47486b6b1..e2fcb3cfd3de5 100644
--- a/arch/arm/include/asm/percpu.h
+++ b/arch/arm/include/asm/percpu.h
@@ -5,13 +5,13 @@
 #ifndef _ASM_ARM_PERCPU_H_
 #define _ASM_ARM_PERCPU_H_
 
+register unsigned long current_stack_pointer asm ("sp");
+
 /*
  * Same as asm-generic/percpu.h, except that we store the per cpu offset
  * in the TPIDRPRW. TPIDRPRW only exists on V6K and V7
  */
 #if defined(CONFIG_SMP) && !defined(CONFIG_CPU_V6)
-register unsigned long current_stack_pointer asm ("sp");
-
 static inline void set_my_cpu_offset(unsigned long off)
 {
 	/* Set TPIDRPRW */
diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 3609a6980c342..536b6b979f634 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -75,11 +75,6 @@ struct thread_info {
 	.addr_limit	= KERNEL_DS,					\
 }
 
-/*
- * how to get the current stack pointer in C
- */
-register unsigned long current_stack_pointer asm ("sp");
-
 /*
  * how to get the thread information struct from C
  */
