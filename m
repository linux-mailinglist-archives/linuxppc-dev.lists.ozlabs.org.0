Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF951E8A73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 23:51:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YdYM5hdQzDqkh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 07:51:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=OrNBw3Cu; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YdNm5dZqzDqkm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 07:43:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=5rR1NJgZkMSAM5DsE3mS2iF8blmza8kjDJ/kqIILuBo=; b=OrNBw3CuPy/zbnEZhshCKupz6A
 +zs4nSTw1Z5AmszLAASctKMALY+PXzHrBk5nQAPaC8HiehcIrV4kcF7bT3585u1Nv3eLN3qaxXXEB
 EuYeZguCbqbpq6Y8iK6jZvEWcfmk8T+rha8XDekQDos53rT0xYsnWXQ4EI5Nk31uDDnH41aU0pt2D
 ojNvDIxKvWCZyoAFEQKn6wtPsyMhLLo9pRXW7rX7G6OyG4vNtpdZ8bJxaboaQtQ0VySSf975xoD4A
 BXBZU/dwPH3vlNZhl3sp1KmuTnR1sLFfAA8Sib3wgOyplwM8EWkEU/zdMQyqoYBik6W9eDTiYI4a0
 igmT94JQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jemmK-0006Hs-1t; Fri, 29 May 2020 21:43:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 23EFB302814;
 Fri, 29 May 2020 23:42:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id CE78E2021AF90; Fri, 29 May 2020 23:42:57 +0200 (CEST)
Message-ID: <20200529214203.673108357@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 29 May 2020 23:35:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 will@kernel.org,
 tglx@linutronix.de
Subject: [RFC][PATCH v3 1/5] sparc64: Fix asm/percpu.h build error
References: <20200529213550.683440625@infradead.org>
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
 rostedt@goodmis.org, a.darwish@linutronix.de, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to break a header dependency between lockdep and task_struct,
I need per-cpu stuff from lockdep.

Including <asm/percpu.h> from lockdep.h gives a build error, this
patch cures that, but results in the following warning:

../arch/sparc/include/asm/percpu_64.h:7:24: warning: call-clobbered register used for global register variable
register unsigned long __local_per_cpu_offset asm("g5");

But i've no idea how to fix that :/ but it does build.

Not-Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/sparc/include/asm/trap_block.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/sparc/include/asm/trap_block.h
+++ b/arch/sparc/include/asm/trap_block.h
@@ -2,6 +2,8 @@
 #ifndef _SPARC_TRAP_BLOCK_H
 #define _SPARC_TRAP_BLOCK_H
 
+#include <linux/threads.h>
+
 #include <asm/hypervisor.h>
 #include <asm/asi.h>
 


