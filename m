Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D374E204CDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 10:48:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rg0V0bf2zDqRr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 18:48:10 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=casper.20170209 header.b=lg1OIAs5; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rfp36BBTzDqR3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 18:39:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=YNPoha+d8J2Lc5+zyAZdd8COdiF4UhJWzzpElOKIt+Y=; b=lg1OIAs5pOsPBLdq8xFnSRa/75
 QRyillgyOQBJJfElaGLM808BoLX83AFa3hS/WhV7hGjXvx9twNBqTD39QaB8YilZM4bDi11VbcG2z
 Mi+cqF8g9icUSd53Ri5sMMt9KwNLMzOXBsYG0aPzd9PbYB+DoOQHE69JDApSFow2bywCDuH55FWhC
 Rw8syHNrsoCdnJZnPA5H5VGVcDfbiO1sLAL36ESTXlMTkRyqYF5AD/bWu5c28V/brgC9MXfVTb9WC
 uf8DmPZvqAcOm/tQnIvpoPm+ZOZFT8eJAPaL2UODAU4oQXvyFksewGSWI65dOnLoihVp3jNT0uM7t
 iGUrq6zQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jneS3-0000fx-Qh; Tue, 23 Jun 2020 08:38:43 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 952FF307623;
 Tue, 23 Jun 2020 10:38:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id DE500237095F7; Tue, 23 Jun 2020 10:38:39 +0200 (CEST)
Message-ID: <20200623083721.155449112@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 23 Jun 2020 10:36:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 will@kernel.org,
 tglx@linutronix.de
Subject: [PATCH v4 1/8] lockdep: Prepare for NMI IRQ state tracking
References: <20200623083645.277342609@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, peterz@infradead.org, bigeasy@linutronix.de,
 x86@kernel.org, heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, linux@armlinux.org.uk, a.darwish@linutronix.de,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no reason not to always, accurately, track IRQ state.

This change also makes IRQ state tracking ignore lockdep_off().

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/locking/lockdep.c |   44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3646,7 +3646,16 @@ static void __trace_hardirqs_on_caller(v
  */
 void lockdep_hardirqs_on_prepare(unsigned long ip)
 {
-	if (unlikely(!debug_locks || current->lockdep_recursion))
+	if (unlikely(!debug_locks))
+		return;
+
+	/*
+	 * NMIs do not (and cannot) track lock dependencies, nothing to do.
+	 */
+	if (unlikely(in_nmi()))
+		return;
+
+	if (unlikely(current->lockdep_recursion & LOCKDEP_RECURSION_MASK))
 		return;
 
 	if (unlikely(current->hardirqs_enabled)) {
@@ -3692,7 +3701,27 @@ void noinstr lockdep_hardirqs_on(unsigne
 {
 	struct task_struct *curr = current;
 
-	if (unlikely(!debug_locks || curr->lockdep_recursion))
+	if (unlikely(!debug_locks))
+		return;
+
+	/*
+	 * NMIs can happen in the middle of local_irq_{en,dis}able() where the
+	 * tracking state and hardware state are out of sync.
+	 *
+	 * NMIs must save lockdep_hardirqs_enabled() to restore IRQ state from,
+	 * and not rely on hardware state like normal interrupts.
+	 */
+	if (unlikely(in_nmi())) {
+		/*
+		 * Skip:
+		 *  - recursion check, because NMI can hit lockdep;
+		 *  - hardware state check, because above;
+		 *  - chain_key check, see lockdep_hardirqs_on_prepare().
+		 */
+		goto skip_checks;
+	}
+
+	if (unlikely(current->lockdep_recursion & LOCKDEP_RECURSION_MASK))
 		return;
 
 	if (curr->hardirqs_enabled) {
@@ -3720,6 +3749,7 @@ void noinstr lockdep_hardirqs_on(unsigne
 	DEBUG_LOCKS_WARN_ON(current->hardirq_chain_key !=
 			    current->curr_chain_key);
 
+skip_checks:
 	/* we'll do an OFF -> ON transition: */
 	curr->hardirqs_enabled = 1;
 	curr->hardirq_enable_ip = ip;
@@ -3735,7 +3765,15 @@ void noinstr lockdep_hardirqs_off(unsign
 {
 	struct task_struct *curr = current;
 
-	if (unlikely(!debug_locks || curr->lockdep_recursion))
+	if (unlikely(!debug_locks))
+		return;
+
+	/*
+	 * Matching lockdep_hardirqs_on(), allow NMIs in the middle of lockdep;
+	 * they will restore the software state. This ensures the software
+	 * state is consistent inside NMIs as well.
+	 */
+	if (unlikely(!in_nmi() && (current->lockdep_recursion & LOCKDEP_RECURSION_MASK)))
 		return;
 
 	/*


