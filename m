Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497F706955
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtq00Vscz3fMx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:14:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KeFwGIi3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KeFwGIi3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtmX1zTYz3f4m
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:11:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9BFB364710;
	Wed, 17 May 2023 13:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB3FC433A0;
	Wed, 17 May 2023 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329114;
	bh=9B5dm6uPcP99pu9DbgwVzUA/R+xqpwJ+x8zkV0/Vqc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeFwGIi38GKw31XBFip9DpSNaAPrSt+ly1tSHZlHJrUQWVYjO1Fj/sEgW+9BoVS0P
	 1CrH3z3kj7gZ+Vr3uvhUt8V+7wc31EPrn9XE0ouppLIc4CVNNyDqrxV3hSyS0OYCcT
	 l6bP27FiyG5vaBbcs1CEMoLgy4FK3NoP8/k/lHQ4NbbcS554m3wfxgTcIxR8LnL/1k
	 w4FDAsAOVUKikEub9HmaUUnNVrFTBKOFClJ6tqzPc8F5THSvUHsl1wW7KSrODpL1Hc
	 vIHWM9fXWcirhdtfcUUfuWVrVUe5drsdLKZft1YCHcGKupFyIGgZk3oWSTFEILf4s7
	 1sLZ52Eo3Zk7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/14] mm: page_poison: always declare __kernel_map_pages() function
Date: Wed, 17 May 2023 15:10:50 +0200
Message-Id: <20230517131102.934196-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The __kernel_map_pages() function is mainly used for
CONFIG_DEBUG_PAGEALLOC, but has a number of architecture specific
definitions that may also be used in other configurations, as well
as a global fallback definition for architectures that do not support
DEBUG_PAGEALLOC.

When the option is disabled, any definitions without the prototype
cause a warning:

mm/page_poison.c:102:6: error: no previous prototype for '__kernel_map_pages' [-Werror=missing-prototypes]

The function is a trivial nop here, so just declare it anyway
to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/mm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 27ce77080c79..e95d7c575ea6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3453,13 +3453,12 @@ static inline bool debug_pagealloc_enabled_static(void)
 	return static_branch_unlikely(&_debug_pagealloc_enabled);
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
 /*
  * To support DEBUG_PAGEALLOC architecture must ensure that
  * __kernel_map_pages() never fails
  */
 extern void __kernel_map_pages(struct page *page, int numpages, int enable);
-
+#ifdef CONFIG_DEBUG_PAGEALLOC
 static inline void debug_pagealloc_map_pages(struct page *page, int numpages)
 {
 	if (debug_pagealloc_enabled_static())
-- 
2.39.2

