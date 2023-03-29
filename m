Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E26CD14D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 06:55:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmZ4B0HYBz3cdc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 15:55:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4X7ifeA/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4X7ifeA/;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmZ3K2Z4Yz3fH2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 15:54:37 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so8769744wms.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 21:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktbMUCpwKr4p6sxSafOqlZuluRkmcCN6C+8Lyu2qvAc=;
        b=4X7ifeA/SGmd5f+PrymDHio4j1xNhUrnthuq1Wov3mtXUT8875BfSubfmgak5IIJwz
         QL6Do9Vy3s0gGYmeUieXjJfEhsHN2s1Rc4dIqt+B+I8gIHCQ6ZOuaaUGWRhWhS+Twosv
         TosP9XCyPv4IF3ILX78Zz5NGkhVf5jvOLbYOhA53tWPxCd2PToqZvtb3YeyfsJZPJb+u
         FF/k19pYOl2V/lK2KrrIGEijTrAHtnRRNO7ZYzxDjZBfRDitSg0rmEm85z43dKcpfzRp
         /hf6rokfCu6eYDu4gOA18iGUaXVxzH2Qy3cMGjoPzk9mpqOme9dgqqJ69ENBbmrnf1wf
         MVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktbMUCpwKr4p6sxSafOqlZuluRkmcCN6C+8Lyu2qvAc=;
        b=1HaQUtylbGhCm9PXtBuaK+Sdg9/vpYy2BBcXPshXIJK76WW6h0gkDpELNtlMHvhwxE
         Ckkj7EC23DGoHTtN23HtgKblUDPlGHiTMdi2YCjes2odR4IY8/KoCBaUtC9GxVBbyKur
         Uxaao07sKbQ8udIiJZ+HFZ4tQbR8ygsZta8d5eg9hsXdIVdH4IB81TdYUwRHDXQsxMGK
         BHTHy/q5n1ONIM1LTsLsD3eXEDxZoiUMU9mkdDdqxbSVnEl2SceVTjVpeX19X0S4CLpq
         WtyAhc839ECxu3ouzkZ2If9xWXVEWvddHFVZzPWa2bm2tpb/RIfoxGjNE9bthKntg7iF
         8aeQ==
X-Gm-Message-State: AO0yUKWeVh0ZotuyQvLpnbBysM8x5vxt/UpkzeRehz79CMIt9rIJmgjb
	RyPkQsK3W0wsp/DLeGZJkMfoDg==
X-Google-Smtp-Source: AK7set8KyrHOxCHh16uvCtOCDVkCarPqxygWiKW2Mqp0rpgc5a8LupWu2x+qke+olNk5QXh69XyzWQ==
X-Received: by 2002:a7b:c3c7:0:b0:3ed:ff92:dd2a with SMTP id t7-20020a7bc3c7000000b003edff92dd2amr14084380wmj.12.1680065673979;
        Tue, 28 Mar 2023 21:54:33 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q18-20020a7bce92000000b003ef71d541cbsm831127wmj.1.2023.03.28.21.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:54:33 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v9 1/6] riscv: Prepare EFI header for relocatable kernels
Date: Wed, 29 Mar 2023 06:53:24 +0200
Message-Id: <20230329045329.64565-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
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

ld does not handle relocations correctly as explained here [1],
a fix for that was proposed by Nelson there but we have to support older
toolchains and then provide this fix.

Note that llvm does not need this fix and is then excluded.

[1] https://sourceware.org/pipermail/binutils/2023-March/126690.html

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/set_memory.h |  3 +++
 arch/riscv/kernel/efi-header.S      | 19 ++++++++++++++++---
 arch/riscv/kernel/vmlinux.lds.S     |  5 ++---
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index a2c14d4b3993..ec11001c3fe0 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -56,4 +56,7 @@ bool kernel_page_present(struct page *page);
 #define SECTION_ALIGN L1_CACHE_BYTES
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
+#define PECOFF_SECTION_ALIGNMENT        0x1000
+#define PECOFF_FILE_ALIGNMENT           0x200
+
 #endif /* _ASM_RISCV_SET_MEMORY_H */
diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-header.S
index 8e733aa48ba6..515b2dfbca75 100644
--- a/arch/riscv/kernel/efi-header.S
+++ b/arch/riscv/kernel/efi-header.S
@@ -6,6 +6,7 @@
 
 #include <linux/pe.h>
 #include <linux/sizes.h>
+#include <asm/set_memory.h>
 
 	.macro	__EFI_PE_HEADER
 	.long	PE_MAGIC
@@ -33,7 +34,11 @@ optional_header:
 	.byte	0x02					// MajorLinkerVersion
 	.byte	0x14					// MinorLinkerVersion
 	.long	__pecoff_text_end - efi_header_end	// SizeOfCode
-	.long	__pecoff_data_virt_size			// SizeOfInitializedData
+#ifdef __clang__
+	.long   __pecoff_data_virt_size			// SizeOfInitializedData
+#else
+	.long	__pecoff_data_virt_end - __pecoff_text_end	// SizeOfInitializedData
+#endif
 	.long	0					// SizeOfUninitializedData
 	.long	__efistub_efi_pe_entry - _start		// AddressOfEntryPoint
 	.long	efi_header_end - _start			// BaseOfCode
@@ -91,9 +96,17 @@ section_table:
 		IMAGE_SCN_MEM_EXECUTE			// Characteristics
 
 	.ascii	".data\0\0\0"
-	.long	__pecoff_data_virt_size			// VirtualSize
+#ifdef __clang__
+	.long   __pecoff_data_virt_size			// VirtualSize
+#else
+	.long	__pecoff_data_virt_end - __pecoff_text_end	// VirtualSize
+#endif
 	.long	__pecoff_text_end - _start		// VirtualAddress
-	.long	__pecoff_data_raw_size			// SizeOfRawData
+#ifdef __clang__
+	.long   __pecoff_data_raw_size			// SizeOfRawData
+#else
+	.long	__pecoff_data_raw_end - __pecoff_text_end	// SizeOfRawData
+#endif
 	.long	__pecoff_text_end - _start		// PointerToRawData
 
 	.long	0					// PointerToRelocations
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 53a8ad65b255..1c38294580c0 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -27,9 +27,6 @@ ENTRY(_start)
 
 jiffies = jiffies_64;
 
-PECOFF_SECTION_ALIGNMENT = 0x1000;
-PECOFF_FILE_ALIGNMENT = 0x200;
-
 SECTIONS
 {
 	/* Beginning of code and text segment */
@@ -132,6 +129,7 @@ SECTIONS
 #ifdef CONFIG_EFI
 	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
 	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);
+	__pecoff_data_raw_end = ABSOLUTE(.);
 #endif
 
 	/* End of data section */
@@ -142,6 +140,7 @@ SECTIONS
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
+	__pecoff_data_virt_end = ABSOLUTE(.);
 #endif
 	_end = .;
 
-- 
2.37.2

