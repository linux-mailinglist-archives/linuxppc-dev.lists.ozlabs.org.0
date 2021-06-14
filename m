Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7973A725B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nFv4ywKz3dZh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:09:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=UgmoOvWf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=UgmoOvWf; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9h1dqjz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:44 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9b0Tdpz9sXG; Tue, 15 Jun 2021 09:05:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9b00Rqz9sW7; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711939; bh=Fv8dW2QtwiYm2+m8wlHrRzHPpBBAf1HFW+ZtYul3Xbg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=UgmoOvWfVBEgaPVoG+aqGNUZ1qph0q8ZpMzeOS+icucUxJ7d9CUfZZsspwCEkj7lE
 Nyvgyt4bKOh5A7CzMccNiW7nZ6Mgzj3eQ9lgW3o00jdVkMi7dwMZNL4AHM+Vl6X83N
 HkLKPPWfWG7cfbjPJBDbmC0bgDoDE4BSdQljCIkkxpX9yJbOL14wwjbuPrc/edki4a
 RcsnjV1xid6xW7autPxtJHgiLx4JAH1NwgYcjgX1zvs4kbOrKlgG8VVVqCckLLm7hb
 VZ6b0Ri63kmbs2pqyjajnaqoz44tjPLbRhosMF0a+heGtPoGQ7DA7W1/iua3ZeSwUc
 AhHVpA1b1Io0A==
Date: Tue, 15 Jun 2021 08:59:11 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 03/11] powerpc/radix: Add support for microwatt's PRTBL SPR
Message-ID: <YMffP+s93uYSaU3J@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
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
index da103e92c112..3200a2522d6c 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -729,6 +729,7 @@
 #endif
 #define SPRN_TIR	0x1BE	/* Thread Identification Register */
 #define SPRN_PTCR	0x1D0	/* Partition table control Register */
+#define SPRN_PRTBL	0x2D0	/* Process table pointer */
 #define SPRN_PSPB	0x09F	/* Problem State Priority Boost reg */
 #define SPRN_PTEHI	0x3D5	/* 981 7450 PTE HI word (S/W TLB load) */
 #define SPRN_PTELO	0x3D6	/* 982 7450 PTE LO word (S/W TLB load) */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 98f0b243c1ab..6595859173a7 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -646,10 +646,15 @@ void __init radix__early_init_mmu(void)
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
2.31.1

