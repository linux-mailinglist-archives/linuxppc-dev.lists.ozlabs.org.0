Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA95204CCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 10:45:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rfxW4XmbzDqRF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 18:45:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=RppIjQJb; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rfp02z7vzDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 18:39:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=r7kYVRvusVdUwun3DZAVv4nSToA3uL0FY5bqOSQAeOo=; b=RppIjQJbnhKw6hv4uYphrIxc3+
 N0EqWgLyPJZLdgxpHClB24tvJGF+wtFFQHMl5PWRy6kV9RavSp1CMYmLJBGGGRZi4sw8vp32XPkv7
 SHubqehf0RRZ8DDDZuaD8Dz8W+eHTE+67r7+h613fADQaP21NcMP0y1Nk2LtkocaW0OeIJnQuU8+I
 aANs9jyYApe+FGYwAyZVwIZZAo039AUU2PwWSvikadXycLGCwPAJcBJH0zIKc+ey4CR2PWufiTCTp
 luP7l3MPzS3YUCkYZdRrM87oUIP/GgrZDUg52VGyCuYIgEciaghWmzd66F8BqWJ5okm7seM6DOavi
 /kzuUF5g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jneS5-0005Rl-Dq; Tue, 23 Jun 2020 08:38:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 149733074EB;
 Tue, 23 Jun 2020 10:38:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id E325B237095FA; Tue, 23 Jun 2020 10:38:39 +0200 (CEST)
Message-ID: <20200623083721.277992771@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 23 Jun 2020 10:36:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 will@kernel.org,
 tglx@linutronix.de
Subject: [PATCH v4 3/8] sparc64: Fix asm/percpu.h build error
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

In order to break a header dependency between lockdep and task_struct,
I need per-cpu stuff from lockdep.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/sparc/include/asm/percpu_64.h  |    2 ++
 arch/sparc/include/asm/trap_block.h |    2 ++
 2 files changed, 4 insertions(+)

--- a/arch/sparc/include/asm/percpu_64.h
+++ b/arch/sparc/include/asm/percpu_64.h
@@ -4,7 +4,9 @@
 
 #include <linux/compiler.h>
 
+#ifndef BUILD_VDSO
 register unsigned long __local_per_cpu_offset asm("g5");
+#endif
 
 #ifdef CONFIG_SMP
 
--- a/arch/sparc/include/asm/trap_block.h
+++ b/arch/sparc/include/asm/trap_block.h
@@ -2,6 +2,8 @@
 #ifndef _SPARC_TRAP_BLOCK_H
 #define _SPARC_TRAP_BLOCK_H
 
+#include <linux/threads.h>
+
 #include <asm/hypervisor.h>
 #include <asm/asi.h>
 


