Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E49B808B6C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 16:06:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Xyy2cWlu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmHfn3c09z3vg6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 02:06:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Xyy2cWlu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmHdx46Zcz3vc8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 02:05:57 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33348e711e0so1071764f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 07:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701961553; x=1702566353; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVN+VzhbTBys9mVhAQGqZxkaIjV/7TRqzMN+a14FBcU=;
        b=Xyy2cWluMkHzfckS3Hz2Cx/1OkWHAXTTBudtOqxvwuYp+Ec2h5AySv/uBl6SNKlp2i
         fbJGGJqCj7aoNozPEZOc4uA8ytfVoZT0ZlIGHRoMa59gz88hqpLX2kv4VdN9lxFAwBI6
         bTtCCYpvpxMYmIRcUfFxQls8RZsmFnvhOXXC1XB/q3Ou0CWbaKbHbrzhLeyPu2mz/nb1
         rfCav2QnB0OwpzV8syq1P7lyVN5ulOGaAr/Y56y3/PTxRt/K7KnB6Hgu23UT8AN3YsuY
         iCVivzocW/PE4jtWGOtheuitq0nPlEJMFGtgtimCcHPUEUaGy7sUw7YzA8jqjdJsvWuB
         C5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961553; x=1702566353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVN+VzhbTBys9mVhAQGqZxkaIjV/7TRqzMN+a14FBcU=;
        b=Wmapbd2k3D2IQp/FJy6uXP0r/qz6I701h9L49eMpwibccJZ7u6qgbsNBMUQbf2bWf5
         WYJsAMfNMdx7sFhJKDiGBgwSFgDleJUtS92myjY67q34kZTRx21naXqdzVstaj+U0WsY
         48D3HxoZd18IT4vFa6jsNtFPiztfkjqk8G14/h2zzF6qYmPSzj/svlpDd6h+Lp6RQX5B
         T6U5jEeUxpTUFZ8luKIbfFJMKcEKNhes34ByumFL53f2MUqbUGv820VyMWkllAP5u2MO
         tRkdSDRlXaJwYgBdFBiv6cMrQXB8YrPZpzIoAUdPPC+bFwUhWkyUlIRYFJHVMjGDYx6t
         j1gQ==
X-Gm-Message-State: AOJu0YyKtWCej9sux3ctW9YlLCu5DCVJOoHg0vVeFpnvkm1m6X5N6Uh9
	yDQJb64VCcWke0Z6fi9O0wDKNg==
X-Google-Smtp-Source: AGHT+IEj2QTBGpOf3OHBs9Yni4aQareAokfWZfEZoiM8ehZh4/VLAukwcmzFcEIzO5CULnzn0YcNZw==
X-Received: by 2002:adf:ea82:0:b0:333:1907:c2a3 with SMTP id s2-20020adfea82000000b003331907c2a3mr1503404wrm.21.1701961553264;
        Thu, 07 Dec 2023 07:05:53 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p13-20020a056000018d00b00333415503a7sm1644486wrx.22.2023.12.07.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:05:53 -0800 (PST)
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
Subject: [PATCH RFC/RFT 2/4] riscv: Add a runtime detection of invalid TLB entries caching
Date: Thu,  7 Dec 2023 16:03:46 +0100
Message-Id: <20231207150348.82096-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207150348.82096-1-alexghiti@rivosinc.com>
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
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

This mechanism allows to completely bypass the sfence.vma introduced by
the previous commit for uarchs that do not cache invalid TLB entries.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 124 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 379403de6c6f..2e854613740c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -56,6 +56,8 @@ bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KER
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
 
+bool tlb_caching_invalid_entries;
+
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
@@ -750,6 +752,18 @@ static void __init disable_pgtable_l4(void)
 	satp_mode = SATP_MODE_39;
 }
 
+static void __init enable_pgtable_l5(void)
+{
+	pgtable_l5_enabled = true;
+	satp_mode = SATP_MODE_57;
+}
+
+static void __init enable_pgtable_l4(void)
+{
+	pgtable_l4_enabled = true;
+	satp_mode = SATP_MODE_48;
+}
+
 static int __init print_no4lvl(char *p)
 {
 	pr_info("Disabled 4-level and 5-level paging");
@@ -826,6 +840,112 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 	memset(early_pud, 0, PAGE_SIZE);
 	memset(early_pmd, 0, PAGE_SIZE);
 }
+
+/* Determine at runtime if the uarch caches invalid TLB entries */
+static __init void set_tlb_caching_invalid_entries(void)
+{
+#define NR_RETRIES_CACHING_INVALID_ENTRIES	50
+	uintptr_t set_tlb_caching_invalid_entries_pmd = ((unsigned long)set_tlb_caching_invalid_entries) & PMD_MASK;
+	// TODO the test_addr as defined below could go into another pud...
+	uintptr_t test_addr = set_tlb_caching_invalid_entries_pmd + 2 * PMD_SIZE;
+	pmd_t valid_pmd;
+	u64 satp;
+	int i = 0;
+
+	/* To ease the page table creation */
+	disable_pgtable_l5();
+	disable_pgtable_l4();
+
+	/* Establish a mapping for set_tlb_caching_invalid_entries() in sv39 */
+	create_pgd_mapping(early_pg_dir,
+			   set_tlb_caching_invalid_entries_pmd,
+			   (uintptr_t)early_pmd,
+			   PGDIR_SIZE, PAGE_TABLE);
+
+	/* Handle the case where set_tlb_caching_invalid_entries straddles 2 PMDs */
+	create_pmd_mapping(early_pmd,
+			   set_tlb_caching_invalid_entries_pmd,
+			   set_tlb_caching_invalid_entries_pmd,
+			   PMD_SIZE, PAGE_KERNEL_EXEC);
+	create_pmd_mapping(early_pmd,
+			   set_tlb_caching_invalid_entries_pmd + PMD_SIZE,
+			   set_tlb_caching_invalid_entries_pmd + PMD_SIZE,
+			   PMD_SIZE, PAGE_KERNEL_EXEC);
+
+	/* Establish an invalid mapping */
+	create_pmd_mapping(early_pmd, test_addr, 0, PMD_SIZE, __pgprot(0));
+
+	/* Precompute the valid pmd here because the mapping for pfn_pmd() won't exist */
+	valid_pmd = pfn_pmd(PFN_DOWN(set_tlb_caching_invalid_entries_pmd), PAGE_KERNEL);
+
+	local_flush_tlb_all();
+	satp = PFN_DOWN((uintptr_t)&early_pg_dir) | SATP_MODE_39;
+	csr_write(CSR_SATP, satp);
+
+	/*
+	 * Set stvec to after the trapping access, access this invalid mapping
+	 * and legitimately trap
+	 */
+	// TODO: Should I save the previous stvec?
+#define ASM_STR(x)	__ASM_STR(x)
+	asm volatile(
+		"la a0, 1f				\n"
+		"csrw " ASM_STR(CSR_TVEC) ", a0		\n"
+		"ld a0, 0(%0)				\n"
+		".align 2				\n"
+		"1:					\n"
+		:
+		: "r" (test_addr)
+		: "a0"
+	);
+
+	/* Now establish a valid mapping to check if the invalid one is cached */
+	early_pmd[pmd_index(test_addr)] = valid_pmd;
+
+	/*
+	 * Access the valid mapping multiple times: indeed, we can't use
+	 * sfence.vma as a barrier to make sure the cpu did not reorder accesses
+	 * so we may trap even if the uarch does not cache invalid entries. By
+	 * trying a few times, we make sure that those uarchs will see the right
+	 * mapping at some point.
+	 */
+
+	i = NR_RETRIES_CACHING_INVALID_ENTRIES;
+
+#define ASM_STR(x)	__ASM_STR(x)
+	asm_volatile_goto(
+		"la a0, 1f					\n"
+		"csrw " ASM_STR(CSR_TVEC) ", a0			\n"
+		".align 2					\n"
+		"1:						\n"
+		"addi %0, %0, -1				\n"
+		"blt %0, zero, %l[caching_invalid_entries]	\n"
+		"ld a0, 0(%1)					\n"
+		:
+		: "r" (i), "r" (test_addr)
+		: "a0"
+		: caching_invalid_entries
+	);
+
+	csr_write(CSR_SATP, 0ULL);
+	local_flush_tlb_all();
+
+	/* If we don't trap, the uarch does not cache invalid entries! */
+	tlb_caching_invalid_entries = false;
+	goto clean;
+
+caching_invalid_entries:
+	csr_write(CSR_SATP, 0ULL);
+	local_flush_tlb_all();
+
+	tlb_caching_invalid_entries = true;
+clean:
+	memset(early_pg_dir, 0, PAGE_SIZE);
+	memset(early_pmd, 0, PAGE_SIZE);
+
+	enable_pgtable_l4();
+	enable_pgtable_l5();
+}
 #endif
 
 /*
@@ -1072,6 +1192,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
+	set_tlb_caching_invalid_entries();
 	set_satp_mode(dtb_pa);
 #endif
 
@@ -1322,6 +1443,9 @@ static void __init setup_vm_final(void)
 	local_flush_tlb_all();
 
 	pt_ops_set_late();
+
+	pr_info("uarch caches invalid entries: %s",
+		tlb_caching_invalid_entries ? "yes" : "no");
 }
 #else
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
-- 
2.39.2

