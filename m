Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6734F58B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:41:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F96tx1h8gz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:41:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rAW8B61Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rAW8B61Z; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F96rG4KDXz3btW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 11:38:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F96rB2BdCz9sW0; Wed, 31 Mar 2021 11:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617151130;
 bh=99RnwgWYdU01/QUL8pRwYrIC6tmqAiczXkDFESHCLUo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rAW8B61Z/QbpVe6R8PTokzYVZzV1nB4vHKtXmRuILCZOPXUUpCFvtYCCXgEcTFdvS
 g39dAF/1SNKkfdb5ZiN8qmlJJPKDLZ+/uEFQQg5LzlYltm9rLZu/ROKnB4LhRVoowJ
 jqytHU8KipaKtzNBCNKUUqV2f++HnhcoseYSXGn3yuYffk0Ry4TmDDT3FIT0nnOt2M
 Iq69OVq32xaAqkv1zKlrFbwy1Kwwmvx297UjP7EpMJ4T0gENX55ZbZA8K8u329xmuR
 DfXd/xmdP9GeYKBlOaN0AqZpMT01S2aBSQinanEsCDIY42wyN8Fbl21eqmOI1lqtdy
 Y0MVwXhxR0eQw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/6] powerpc/pseries: Add key to flags in
 pSeries_lpar_hpte_updateboltedpp()
Date: Wed, 31 Mar 2021 11:38:41 +1100
Message-Id: <20210331003845.216246-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331003845.216246-1-mpe@ellerman.id.au>
References: <20210331003845.216246-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
plpar_pte_protect(). We can't pass our newpp value directly in, we
have to convert it into the form expected by the hcall.

The hcall we're using here is H_PROTECT, which is specified in section
14.5.4.1.6 of LoPAPR v1.1.

It takes a `flags` parameter, and the description for flags says:

 * flags: AVPN, pp0, pp1, pp2, key0-key4, n, and for the CMO
   option: CMO Option flags as defined in Table 189‚

If you then go to the start of the parent section, 14.5.4.1, on page
405, it says:

Register Linkage (For hcall() tokens 0x04 - 0x18)
 * On Call
   * R3 function call token
   * R4 flags (see Table 178‚ “Page Frame Table Access flags field
     definition‚” on page 401)

Then you have to go to section 14.5.3, and on page 394 there is a list
of hcalls and their tokens (table 176), and there you can see that
H_PROTECT == 0x18.

Finally you can look at table 178, on page 401, where it specifies the
layout of the bits for the key:

 Bit     Function
 -----------------
 50-54 | key0-key4

Those are big-endian bit numbers, converting to normal bit numbers you
get bits 9-13, or 0x3e00.

In the kernel we have:

  #define HPTE_R_KEY_HI		ASM_CONST(0x3000000000000000)
  #define HPTE_R_KEY_LO		ASM_CONST(0x0000000000000e00)

So the LO bits of newpp are already in the right place, and the HI
bits need to be shifted down by 48.

Fixes: d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash translation")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/lpar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

v2: Expand change log with explanation of where the format of the
    flags parameter comes from, prompted by dja.

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

