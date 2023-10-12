Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AB7C7778
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 21:56:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Q4znoG+4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S60kV1pCvz3vXb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 06:56:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Q4znoG+4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S60hc5Xryz3cPS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 06:54:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4Fn16qTKKDmoLngNQQ4GEd7U5ZLcnF6YO5R8MQyfSP8=; b=Q4znoG+4HTWnq0dTqEVCZDI+uU
	hA3CQAVGkFSg2dpaJpUkrb/5/eEF0IDrT3s5i4tS7hpXbiAAQY+8ibHf+KzbOF8oeotjoTwwuPmmc
	GpfmV4h3npc4vpGkaXRtVeY/9x1KlYtZaX0jsYJmMGPvwg050F7IO2wMW97T1zHc0RTAkqo6o1yrY
	toYhtsBPqOmkV6mbEZp8VIcBLAEcPoXTijfBSGuc/OEltetagGKrkoQoi1SRb8JnGMwbTJeCWC8EK
	uENSf+cYkLUQW8Xw9/Fofki1b5m+dp86eGjFpKBOSCAJQGLpeUHVc9o8km0Nq/3hrNQ+9WDEph8KB
	uDmo8dIw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qr1lA-001BSX-D7; Thu, 12 Oct 2023 19:54:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc: Allow nesting of lazy MMU mode
Date: Thu, 12 Oct 2023 20:54:14 +0100
Message-Id: <20231012195415.282357-2-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20231012195415.282357-1-willy@infradead.org>
References: <20231012195415.282357-1-willy@infradead.org>
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
Cc: Juergen Gross <jgross@suse.com>, Erhard Furtner <erhard_f@mailbox.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-sparc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As noted in commit 49147beb0ccb ("x86/xen: allow nesting of same lazy
mode"), we can now nest calls to arch_enter_lazy_mmu_mode().  Use ->active
as a counter instead of a flag and only drain the batch when the counter
hits 0.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Fixes: bcc6cc832573 ("mm: add default definition of set_ptes()")
---
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 146287d9580f..bc845d876ed2 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -38,7 +38,7 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	 */
 	preempt_disable();
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
-	batch->active = 1;
+	batch->active++;
 }
 
 static inline void arch_leave_lazy_mmu_mode(void)
@@ -49,9 +49,8 @@ static inline void arch_leave_lazy_mmu_mode(void)
 		return;
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
 
-	if (batch->index)
+	if ((--batch->active == 0) && batch->index)
 		__flush_tlb_pending(batch);
-	batch->active = 0;
 	preempt_enable();
 }
 
-- 
2.40.1

