Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4C8A1948
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 18:03:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfH8FrZf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFkyb2zlmz3vks
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 02:03:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfH8FrZf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFkwd5TNyz3vZf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 02:02:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E06FB62086;
	Thu, 11 Apr 2024 16:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD818C072AA;
	Thu, 11 Apr 2024 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851326;
	bh=DCxnhfiOCuZ1vbHkz6N1kzg5vD2Mqvj8bCN8VHj/6O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NfH8FrZfx6KTdQHMDBqFA0awdLTnfCC8URxYegGQF8hCwDboCaMl+tyhSbnU6IDNR
	 n3HGeSJWcDj0jhabeWwh/q2RuOWpOr5b2ecWjNBh6rH1HqC56qbnlIHnI/mVBB1CTy
	 osJABaN0BaNQW9hhvchseCLymwubWuOlUGYCo9faqQ8gKkVD8ukphe/Z0Z4XdbZj9c
	 eyXeHcsu2/RREpt5R1Qq6DGhQ3itdRECk73VHKEuLm1NLU739ZeDLw2f3vHi4od7IE
	 C3MaeStbEeNBCR4P+ktIC+cjcMwLCUxuSq4oi9esfLn+GBcGlQ0qpgzpF2/HCEdSD/
	 ydZpjtFRm0u1A==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/15] mips: module: rename MODULE_START to MODULES_VADDR
Date: Thu, 11 Apr 2024 19:00:38 +0300
Message-ID: <20240411160051.2093261-3-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-m
 ips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

and MODULE_END to MODULES_END to match other architectures that define
custom address space for modules.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/mips/include/asm/pgtable-64.h | 4 ++--
 arch/mips/kernel/module.c          | 4 ++--
 arch/mips/mm/fault.c               | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 20ca48c1b606..c0109aff223b 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -147,8 +147,8 @@
 #if defined(CONFIG_MODULES) && defined(KBUILD_64BIT_SYM32) && \
 	VMALLOC_START != CKSSEG
 /* Load modules into 32bit-compatible segment. */
-#define MODULE_START	CKSSEG
-#define MODULE_END	(FIXADDR_START-2*PAGE_SIZE)
+#define MODULES_VADDR	CKSSEG
+#define MODULES_END	(FIXADDR_START-2*PAGE_SIZE)
 #endif
 
 #define pte_ERROR(e) \
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 7b2fbaa9cac5..9a6c96014904 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -31,10 +31,10 @@ struct mips_hi16 {
 static LIST_HEAD(dbe_list);
 static DEFINE_SPINLOCK(dbe_lock);
 
-#ifdef MODULE_START
+#ifdef MODULES_VADDR
 void *module_alloc(unsigned long size)
 {
-	return __vmalloc_node_range(size, 1, MODULE_START, MODULE_END,
+	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
 				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
 				__builtin_return_address(0));
 }
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index aaa9a242ebba..37fedeaca2e9 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -83,8 +83,8 @@ static void __do_page_fault(struct pt_regs *regs, unsigned long write,
 
 	if (unlikely(address >= VMALLOC_START && address <= VMALLOC_END))
 		goto VMALLOC_FAULT_TARGET;
-#ifdef MODULE_START
-	if (unlikely(address >= MODULE_START && address < MODULE_END))
+#ifdef MODULES_VADDR
+	if (unlikely(address >= MODULES_VADDR && address < MODULES_END))
 		goto VMALLOC_FAULT_TARGET;
 #endif
 
-- 
2.43.0

