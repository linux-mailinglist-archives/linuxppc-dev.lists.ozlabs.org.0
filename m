Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A04F57D2E22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 11:24:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QzQ7f14+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDVBJ422Yz3cTY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 20:24:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QzQ7f14+;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDV9S5TXMz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 20:23:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698053004;
	bh=HdFjJoRqJH8sIN0+sXhrJSvvZdUFAdGypL//0aVvhSA=;
	h=From:To:Subject:Date:From;
	b=QzQ7f14+jYekwp+UXspq8Ka1C6ZIlHdKqm5Tmy3lGaRdttJg8cgVqWETRihytht96
	 /Uv73d2X0RP/FIREFXxzKc2Utr0NR352cCQa2QvtXW5Jyf4/qKyKJmQeGcMgvADJYO
	 9YhC9N/fGgDgJ3DDPP7FBGK2Sk3lWsw1jFgnmjTkjqtHcVLd4SGNMpjCI8k5bUB1qM
	 /bWSb+COoMoeGnYqc3J2oyfJX6w2OD/YALZkZMP2Hk21X+gWcmh2uJuaoUR1YVbzIN
	 XSifPg+t9Ho/61f/Oe0OCARUT8QJPnSRDY1dwcR4OEL5O8EMWqo4ldxudK7cP2ZlaP
	 DpgJ5BCRjQ1Tw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SDV9S4DBLz4x1x;
	Mon, 23 Oct 2023 20:23:24 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/32s: Implement local_flush_tlb_page_psize()
Date: Mon, 23 Oct 2023 20:23:19 +1100
Message-ID: <20231023092319.1507325-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a single call to local_flush_tlb_page_psize() in the code
patching code. That call is never executed on 32-bit Book3S,
because it's guarded by mm_patch_enabled() which is essentially a
radix_enabled() check, which is always false on 32s.

However depending on how the optimiser sees things it may still trip
over the BUILD_BUG() in the 32s stub of local_flush_tlb_page_psize().

To avoid that, implement it in terms of flush_range() so that if it ever
becomes called it should function, even if not optimally.

Note that flush_range() deals with page aligning the address and so on,
and that 32s doesn't support huge pages so there should be no issue with
non-standard page sizes needing to be flushed.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index 4be572908124..e43534da5207 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -80,7 +80,7 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
 					      unsigned long vmaddr, int psize)
 {
-	BUILD_BUG();
+	flush_range(mm, vmaddr, vmaddr);
 }
 
 static inline void local_flush_tlb_mm(struct mm_struct *mm)
-- 
2.41.0

