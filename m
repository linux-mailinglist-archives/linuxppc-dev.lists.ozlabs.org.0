Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28642161FD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 05:38:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M7Qb2PrmzDqFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 15:38:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M7Nh67XgzDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 15:36:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ce6fEKD7; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48M7Nh0wRtz9sRf; Tue, 18 Feb 2020 15:36:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48M7Ng6t2Mz9sRk; Tue, 18 Feb 2020 15:36:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582000612;
 bh=U0U17NF49vRbyn1OV0IRUsxvoX+k8LKqDmfKFiXQQ20=;
 h=From:To:Cc:Subject:Date:From;
 b=Ce6fEKD705UMcatq9F7doOjWqmMvTKwXtIlKQMWu0qmOUVXczESkRElsyWmM02lEh
 2fgU1jGkr5+QzN8ECFJu3wkebxg5OYGRH4v2z+mZfMQdcxvWF+4ZnnBMW7mvHQTbNP
 O0hlO6NwXAj8OvdMSLdhpQcuJ/AYYmtN0CM43aqbJ/I3/GxE422N3Dtfon9Xl/qw7v
 sDWIiiCm5/ZUhr+JIsFIhMk4Uo/ShDgksfRs/ulpPMEtwIgVCzp6QfVZTe6WKiY7+K
 b2ndJqY3WCxu5ZwE0eKKCzAVYTWoyVn2piyImomxNJw73TcXm0KhrEzVXdd9J+6+ga
 GNtMsh7e2+56A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Use RADIX_PTE_INDEX_SIZE in Radix MMU
 code
Date: Tue, 18 Feb 2020 15:36:50 +1100
Message-Id: <20200218043650.24410-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In kvmppc_unmap_free_pte() in book3s_64_mmu_radix.c, we use the
non-constant value PTE_INDEX_SIZE to clear a PTE page.

We can instead use the constant RADIX_PTE_INDEX_SIZE, because we know
this code will only be running when the Radix MMU is active.

Note that we already use RADIX_PTE_INDEX_SIZE for the allocation of
kvm_pte_cache.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 803940d79b73..134fbc1f029f 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -425,7 +425,7 @@ static void kvmppc_unmap_free_pte(struct kvm *kvm, pte_t *pte, bool full,
 				  unsigned int lpid)
 {
 	if (full) {
-		memset(pte, 0, sizeof(long) << PTE_INDEX_SIZE);
+		memset(pte, 0, sizeof(long) << RADIX_PTE_INDEX_SIZE);
 	} else {
 		pte_t *p = pte;
 		unsigned long it;
-- 
2.21.1

