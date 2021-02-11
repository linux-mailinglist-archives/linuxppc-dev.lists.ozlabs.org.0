Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A063318CDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 15:06:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbz1h41smzDsdJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:06:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbyjc0WfrzDwhW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 00:52:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RR/ayx2k; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbyjZ0Vctz9sBy; Fri, 12 Feb 2021 00:52:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613051522;
 bh=ww63sW3qWC8mQ8W+hL0nzP1s7N11A22FoZCwEGuVf5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RR/ayx2kPgeYbW06MwTY7yWdlvPEZ1bW1uYpDTu4HzuDVfmoa2zm11kpPzWdgwvGE
 VhZZ3TFPyOMRs/P48dtUZPNl732UymZ+wZrJV4W7MO5TbD6KTqxOS3ePOboJhq6y32
 wuB/4GtnCGSVnEgOsFJ6zmIu6Tgdx//RuPAUogeFfwKzSGobe8dw4p87LC3nXdtKdt
 5g5NEhVzIVNUqvyzkbejOOz7EwOK/WHcpERvMYm5VUf9gw1PGAMSKimEWn1FtPSUGI
 BQFPz3L21RQRB5f2C5FcxkDwHnB0fe9vhKVPcH9SkhMHeoK+VnFDfsQlII2NqP0dkp
 94HFGZJ8SuwBQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/pseries: Add key to flags in
 pSeries_lpar_hpte_updateboltedpp()
Date: Fri, 12 Feb 2021 00:51:26 +1100
Message-Id: <20210211135130.3474832-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211135130.3474832-1-mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The flags argument to plpar_pte_protect() (aka. H_PROTECT), includes
the key in bits 9-13, but currently we always set those bits to zero.

In the past that hasn't been a problem because we always used key 0
for the kernel, and updateboltedpp() is only used for kernel mappings.

However since commit d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3
for kernel mapping with hash translation") we are now inadvertently
changing the key (to zero) when we call plpar_pte_protect().

That hasn't broken anything because updateboltedpp() is only used for
STRICT_KERNEL_RWX, which is currently disabled on 64s due to other
bugs.

But we want to fix that, so first we need to pass the key correctly to
plpar_pte_protect(). In the `newpp` value the low 3 bits of the key
are already in the correct spot, but the high 2 bits of the key need
to be shifted down.

Fixes: d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash translation")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/lpar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 764170fdb0f7..8bbbddff7226 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -976,11 +976,13 @@ static void pSeries_lpar_hpte_updateboltedpp(unsigned long newpp,
 	slot = pSeries_lpar_hpte_find(vpn, psize, ssize);
 	BUG_ON(slot == -1);
 
-	flags = newpp & 7;
+	flags = newpp & (HPTE_R_PP | HPTE_R_N);
 	if (mmu_has_feature(MMU_FTR_KERNEL_RO))
 		/* Move pp0 into bit 8 (IBM 55) */
 		flags |= (newpp & HPTE_R_PP0) >> 55;
 
+	flags |= ((newpp & HPTE_R_KEY_HI) >> 48) | (newpp & HPTE_R_KEY_LO);
+
 	lpar_rc = plpar_pte_protect(flags, slot, 0);
 
 	BUG_ON(lpar_rc != H_SUCCESS);
-- 
2.25.1

