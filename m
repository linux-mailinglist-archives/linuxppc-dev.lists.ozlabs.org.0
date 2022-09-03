Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F565ABEFE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 14:37:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKZ6z3gZnz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 22:37:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BPlEt8k5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKZ6D6XxSz2xJL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 22:36:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BPlEt8k5;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MKZ6965QTz4xP5;
	Sat,  3 Sep 2022 22:36:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662208609;
	bh=sV4tSD2O5B+7vvBsY7HHNYSNCdbCB+qWBUs/2RoVWaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BPlEt8k5/4vwHFQY1pkFy+K0H9beeIwyhPUUaz41PKRmRGuPHXivfNeiQZq+JRdGe
	 w4VvT7zL1XYW5ASA/0I9R0zZseF9D/UhMVGtFrVpw0HS6bXc2qodofL793wdqiOXWz
	 PehY1OS/GQbBfVmR7YN5FSzTU0lPTeEjNaCTIh44wWipynW5Y/foayX7X/ig47HOzJ
	 67MU6jItDvlHUFs/4ZZIqueYBHlK3LruaUlpTXpgebSJ+c6otse9+qYqAYvbgtalc+
	 UTPcB7BciOSo1S0QQpyrNUjhewZjKTtjB0bMVcfY1xaB4QovpNd5aUyLZjw4mBHF/D
	 Jf92syGdkQ7Ew==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/mm/64s: Drop p4d_leaf()
Date: Sat,  3 Sep 2022 22:36:40 +1000
Message-Id: <20220903123640.719846-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903123640.719846-1-mpe@ellerman.id.au>
References: <20220903123640.719846-1-mpe@ellerman.id.au>
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
Cc: linux-mm@kvack.org, aneesh.kumar@linux.ibm.com, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Because 64-bit Book3S uses pgtable-nop4d.h, the P4D is folded into the
PGD. So P4D entries are actually PGD entries, or vice versa.

The other way to think of it is that the P4D is a single entry page
table below the PGD. Zero bits of the address are needed to index into
the P4D, therefore a P4D entry maps the same size address space as a PGD
entry.

As explained in the previous commit, there are no huge page sizes
supported directly at the PGD level on 64-bit Book3S, so there are also
no huge page sizes supported at the P4D level.

Therefore p4d_is_leaf() can never be true, so drop the definition and
fallback to the default implementation that always returns false.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 486902aff040..057254063e88 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1459,12 +1459,5 @@ static inline bool pud_is_leaf(pud_t pud)
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
 
-#define p4d_is_leaf p4d_is_leaf
-#define p4d_leaf p4d_is_leaf
-static inline bool p4d_is_leaf(p4d_t p4d)
-{
-	return !!(p4d_raw(p4d) & cpu_to_be64(_PAGE_PTE));
-}
-
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
-- 
2.37.2

