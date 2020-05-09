Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ABC1CBDA4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 07:09:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JwGf2PCWzDrCG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 15:09:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JwBH0BZVzDr2j
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 15:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=DuZlKqg2; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49JwBG0fDmz9sSw; Sat,  9 May 2020 15:05:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49JwBF6m7vz9sSd; Sat,  9 May 2020 15:05:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589000725; bh=CgqWOopARLNmzAEolaS/Q8u0NdxFknua08nLGGSI4u0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=DuZlKqg2l6cMwds9tVqxIx4CPhOqlx9KQC0l5Gb+qWoEVseDhASr9olu0yEH2Hf94
 7Js48VaVffw8OG7cF0Iqr4ry2DR9zHBET70lb5ltZnyATuxss0wHMzeF2fuUdqf0wd
 fMwLjzVsK8d/Yj4aIR04sru3e5xgpkCAzbEgNBxIRtEQwfrUdkA2cAGk8IWw2DScvt
 siH6wq5uAEIaVLLIsbnx6HsA1rouKBN64aKfsXo8eEHUURB0NVT3Aah5QdaipA/NgD
 MoGapl9qFGvFfxxENTBq676a8Z7uYEA3WxiMb4u3cLQVxda2PVfQ9/AHpS55Jj1mXj
 6iUXms5sWaTOg==
Date: Sat, 9 May 2020 15:04:58 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@ozlabs.org>,
 Michael Neuling <mikey@neuling.org>, Anton Blanchard <anton@ozlabs.org>
Subject: [PATCH RFC 4/4] powerpc/radix: Add support for microwatt's PRTBL SPR
Message-ID: <20200509050458.GE1464954@thinks.paulus.ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
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

Microwatt currently doesn't implement hypervisor mode and therefore
doesn't implement the partition table.  It does implement the process
table and radix page table walks.

This adds code to write the base address of the process table to the
PRTBL SPR, which has been assigned SPR 720 for now, as that is in the
range of SPR numbers assigned for experimental use.  PRTBL is only
written when we have neither the FW_FEATURE_LPAR feature nor the
CPU_FTR_HVMODE feature.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/include/asm/reg.h           |  1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c | 13 +++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1aa46dff0957..6ea3fc42740d 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -721,6 +721,7 @@
 #endif
 #define SPRN_TIR	0x1BE	/* Thread Identification Register */
 #define SPRN_PTCR	0x1D0	/* Partition table control Register */
+#define SPRN_PRTBL	0x2D0	/* Process table pointer */
 #define SPRN_PSPB	0x09F	/* Problem State Priority Boost reg */
 #define SPRN_PTEHI	0x3D5	/* 981 7450 PTE HI word (S/W TLB load) */
 #define SPRN_PTELO	0x3D6	/* 982 7450 PTE LO word (S/W TLB load) */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index dd1bea45325c..2e6a376c9d82 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -600,10 +600,15 @@ void __init radix__early_init_mmu(void)
 	radix_init_pgtable();
 
 	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
-		lpcr = mfspr(SPRN_LPCR);
-		mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
-		radix_init_partition_table();
-		radix_init_amor();
+		if (cpu_has_feature(CPU_FTR_HVMODE)) {
+			lpcr = mfspr(SPRN_LPCR);
+			mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
+			radix_init_partition_table();
+			radix_init_amor();
+		} else {
+			mtspr(SPRN_PRTBL, (__pa(process_tb) |
+					   (PRTB_SIZE_SHIFT - 12)));
+		}
 	} else {
 		radix_init_pseries();
 	}
-- 
2.25.3

