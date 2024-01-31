Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B77CC8443A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 17:04:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=k08GF3Vc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ6Kx3W0Fz3vwm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 03:04:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=k08GF3Vc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ6KB2c2hz3vpn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 03:03:42 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33b01484cd7so752846f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 08:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706717018; x=1707321818; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G7N9HKTptzFvdsSy7a/wMEV20988NdsE2TTuou7VW4=;
        b=k08GF3VcWruFNQ4pJFoMh/Zwho+psHscKJPWjOzPw01l4Vr5npwG2LE+eY34/kYZO5
         DT6i370M7Qm7KS0nddU/b2tbdESFHlZbwbjktgiFm4S5A0yoQDwoww9a8QL70tTFnCO1
         IiLpsZ+iTL7eaOgufgc5DaSLG7DSK9s7hS6j33NSz6d8hzXWPl8X7VsTO2E48mL4T1Kn
         Grxfthqvhdf0i4Qil/uRbmlUytehlLluTOSccv95AmzFhlhxuYV1blSelZG3dQOJEuen
         kQzirkKOOwJ+SHJuNcz2LZuPiBhS7fTWbluALSVZquWaAOfNlw9+o7Ih6P2Zga+khg3b
         R3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706717018; x=1707321818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G7N9HKTptzFvdsSy7a/wMEV20988NdsE2TTuou7VW4=;
        b=bus5LCb58sBMUnq22MwSgwo0Xp8T3UqnHyTRm1aZJMRF8zQEhkLhwrq9Rha+zpHOCC
         R/gvyyhYEj8EfC0qm6Q1a5CKb2YUzmny96sQzgIp2K5SJQtwHjvYS9oPpKBHhtg67wAy
         a7oxeGlZdBWTQuOrFgMQu10GSKaGlzrU7TZENbojgqqyMeSMQ72+SYgYcLL0wMoFsvI8
         qHl1Jt6Vn6kpcqBZQopxwJQM0gJbn9IBV0H/LdwGyAyLa+PN+RW4MWG32Dg3XgN8NzXX
         ivl07MoAH23hRBQsB59Q9DctfH446WxtAWiPJjQ3Kk487ZZWthAcMVhfxk381PEH9wd/
         E9nw==
X-Gm-Message-State: AOJu0YxeVDiqr63q3jsqPDiCpXarLrtPEbWTQup30OjJsyD/fEwltz0T
	OEzh8wP0WDDkAMkBqrLRST2bsP2fGbLQ8scleouUAKWzc8zkGZ5uofDkPWcKJZ8=
X-Google-Smtp-Source: AGHT+IFv4RsKrg6kAntnJ/YCtPGAW1U1YNeeMXiuO/lnsK9Rn1OpwCBxYmcNw94F8PYwyQot8cihag==
X-Received: by 2002:a5d:4448:0:b0:33a:e6cf:f564 with SMTP id x8-20020a5d4448000000b0033ae6cff564mr1365333wrr.28.1706717018193;
        Wed, 31 Jan 2024 08:03:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVg1J2yUOavmT1BH4y5nxg3fStQ3N4AW690uC+KVjknvwF1ll2sBXJWTCViTvOYReZkrcvAcX1OMeyRFhnXqudjaBZl/gg5Slh2qMDSCgRbs+MYgkxfwyGouM0xHRs0tgxJCpxbNgoQm1h/C/3NBDpOmt8gVIsv7E96n1TY5vhD8PUSLr9R0dCCkfWeCCPx063FNEcg1j2K+XyPJxLVqJsMLPBwMAa2yiLVZ3yCyGFm+j7Fzm78VPLhSet9sBLkuF7EhUO0JSNmhAm08ItvQD/eyizM4UaWgLJ5IfIEvoIxGnSv1g+/L7u5k1OSXo4eUZCK3WtIs5nc2sntY+iTJ0XM7Sw1HGmFv+717YWEYjUgFkTaZDBVXQ8szzSSQSMga7N2cvCO6sZEEmIdJ3WrbxjU7MsY+3d8+XL7ukOMZvPAA8ULHgKtMBLME0qs6pvJjiy+Ahi0q6IN7XN+z8czcuyGvvHVD505pmNGMbMOVBEgXzcDvj6KG+dXMI7+j2KsumizhlmmeCeIGlGoXRxI8cSqcGpx+z3xdHoptsF2bc/C5MXJ+q72d+EHk9Pq97YjxLi0+gDc1EX/D+NmdurxTc5o3aAmGs8bweDvIDgr9lY+Cqq7S0y8tugvFuJReOmvvT386mI9I7qqIrf8NA==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id bu16-20020a056000079000b0033b0797cc14sm1358024wrb.51.2024.01.31.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:03:37 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive sfence.vma for new userspace mappings with Svvptc
Date: Wed, 31 Jan 2024 16:59:29 +0100
Message-Id: <20240131155929.169961-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131155929.169961-1-alexghiti@rivosinc.com>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The preventive sfence.vma were emitted because new mappings must be made
visible to the page table walker but Svvptc guarantees that xRET act as
a fence, so no need to sfence.vma for the uarchs that implement this
extension.

This allows to drastically reduce the number of sfence.vma emitted:

* Ubuntu boot to login:
Before: ~630k sfence.vma
After:  ~200k sfence.vma

* ltp - mmapstress01
Before: ~45k
After:  ~6.3k

* lmbench - lat_pagefault
Before: ~665k
After:   832 (!)

* lmbench - lat_mmap
Before: ~546k
After:   718 (!)

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 16 +++++++++++++++-
 arch/riscv/mm/pgtable.c          | 13 +++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0c94260b5d0c..50986e4c4601 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -473,6 +473,9 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
+	asm_volatile_goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
+			  : : : : svvptc);
+
 	/*
 	 * The kernel assumes that TLBs don't cache invalid entries, but
 	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
@@ -482,12 +485,23 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 */
 	while (nr--)
 		local_flush_tlb_page(address + nr * PAGE_SIZE);
+
+svvptc:
+	/*
+	 * Svvptc guarantees that xRET act as a fence, so when the uarch does
+	 * not cache invalid entries, we don't have to do anything.
+	 */
+	;
 }
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
 #define __HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb update_mmu_cache
+static inline void update_mmu_tlb(struct vm_area_struct *vma,
+				  unsigned long address, pte_t *ptep)
+{
+	flush_tlb_range(vma, address, address + PAGE_SIZE);
+}
 
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index ef887efcb679..99ed389e4c8a 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -9,6 +9,9 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
 {
+	asm_volatile_goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
+			  : : : : svvptc);
+
 	if (!pte_same(ptep_get(ptep), entry))
 		__set_pte_at(ptep, entry);
 	/*
@@ -16,6 +19,16 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 	 * the case that the PTE changed and the spurious fault case.
 	 */
 	return true;
+
+svvptc:
+	if (!pte_same(ptep_get(ptep), entry)) {
+		__set_pte_at(ptep, entry);
+		/* Here only not svadu is impacted */
+		flush_tlb_page(vma, address);
+		return true;
+	}
+
+	return false;
 }
 
 int ptep_test_and_clear_young(struct vm_area_struct *vma,
-- 
2.39.2

