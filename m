Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DB7A42DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 09:36:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L26X5Mym;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpxS75hL5z3ckT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:36:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L26X5Mym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpxLD38Yqz3c2B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:31:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 03A47CE0C47;
	Mon, 18 Sep 2023 07:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2285FC433AD;
	Mon, 18 Sep 2023 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022273;
	bh=GrzrJESS7vx7QyV0O3w+oX12p1W5MbqUcsXcqyR+rMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L26X5Mym5jbDCDCi9pBttJiCUmGDJK7QCrrwON0wsqLsaMRtQtziMfk+8vmq102wK
	 apB9eMngz4FDoZOnyfOnpxsYAYV+s6z6uy/A7GUFANPsDrtCidzVD8sw9PZ9EeZeSS
	 BBZbnyT3UkLAeKFTSJ+WQXJ44CEr3Yz7/npPDOeCiIyuKPQdJ6wFULwDSI42C+21i2
	 TtK4M26N760ml2Bd8ec+c+dtMjxHoi8aQYpVD0iQ48GL/MfHLj1xfBm+sXCRSzVgn2
	 IlOo26svfqfJVEKxvnTHvne8XyU+XB4i1UAyBnP2cTSXuXl9ONzyCPVFbHoWx7LKOg
	 fqTz/6KsDW2hQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
Date: Mon, 18 Sep 2023 10:29:48 +0300
Message-Id: <20230918072955.2507221-7-rppt@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918072955.2507221-1-rppt@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis
  Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Data related to code allocations, such as module data section, need to
comply with architecture constraints for its placement and its
allocation right now was done using execmem_text_alloc().

Create a dedicated API for allocating data related to code allocations
and allow architectures to define address ranges for data allocations.

Since currently this is only relevant for powerpc variants that use the
VMALLOC address space for module data allocations, automatically reuse
address ranges defined for text unless address range for data is
explicitly defined by an architecture.

With separation of code and data allocations, data sections of the
modules are now mapped as PAGE_KERNEL rather than PAGE_KERNEL_EXEC which
was a default on many architectures.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/kernel/module.c | 12 ++++++++++++
 include/linux/execmem.h      | 19 +++++++++++++++++++
 kernel/module/main.c         | 15 +++------------
 mm/execmem.c                 | 17 ++++++++++++++++-
 4 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f4dd26f693a3..824d9541a310 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -95,6 +95,9 @@ static struct execmem_params execmem_params __ro_after_init = {
 		[EXECMEM_DEFAULT] = {
 			.alignment = 1,
 		},
+		[EXECMEM_MODULE_DATA] = {
+			.alignment = 1,
+		},
 	},
 };
 
@@ -103,7 +106,12 @@ struct execmem_params __init *execmem_arch_params(void)
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	struct execmem_range *range = &execmem_params.ranges[EXECMEM_DEFAULT];
 
+	/*
+	 * BOOK3S_32 and 8xx define MODULES_VADDR for text allocations and
+	 * allow allocating data in the entire vmalloc space
+	 */
 #ifdef MODULES_VADDR
+	struct execmem_range *data = &execmem_params.ranges[EXECMEM_MODULE_DATA];
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
 
 	/* First try within 32M limit from _etext to avoid branch trampolines */
@@ -116,6 +124,10 @@ struct execmem_params __init *execmem_arch_params(void)
 		range->start = MODULES_VADDR;
 		range->end = MODULES_END;
 	}
+	data->start = VMALLOC_START;
+	data->end = VMALLOC_END;
+	data->pgprot = PAGE_KERNEL;
+	data->alignment = 1;
 #else
 	range->start = VMALLOC_START;
 	range->end = VMALLOC_END;
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 519bdfdca595..09d45ac786e9 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -29,6 +29,7 @@
  * @EXECMEM_KPROBES: parameters for kprobes
  * @EXECMEM_FTRACE: parameters for ftrace
  * @EXECMEM_BPF: parameters for BPF
+ * @EXECMEM_MODULE_DATA: parameters for module data sections
  * @EXECMEM_TYPE_MAX:
  */
 enum execmem_type {
@@ -37,6 +38,7 @@ enum execmem_type {
 	EXECMEM_KPROBES,
 	EXECMEM_FTRACE,
 	EXECMEM_BPF,
+	EXECMEM_MODULE_DATA,
 	EXECMEM_TYPE_MAX,
 };
 
@@ -107,6 +109,23 @@ struct execmem_params *execmem_arch_params(void);
  */
 void *execmem_text_alloc(enum execmem_type type, size_t size);
 
+/**
+ * execmem_data_alloc - allocate memory for data coupled to code
+ * @type: type of the allocation
+ * @size: how many bytes of memory are required
+ *
+ * Allocates memory that will contain data coupled with executable code,
+ * like data sections in kernel modules.
+ *
+ * The memory will have protections defined by architecture.
+ *
+ * The allocated memory will reside in an area that does not impose
+ * restrictions on the addressing modes.
+ *
+ * Return: a pointer to the allocated memory or %NULL
+ */
+void *execmem_data_alloc(enum execmem_type type, size_t size);
+
 /**
  * execmem_free - free executable memory
  * @ptr: pointer to the memory that should be freed
diff --git a/kernel/module/main.c b/kernel/module/main.c
index c4146bfcd0a7..2ae83a6abf66 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1188,25 +1188,16 @@ void __weak module_arch_freeing_init(struct module *mod)
 {
 }
 
-static bool mod_mem_use_vmalloc(enum mod_mem_type type)
-{
-	return IS_ENABLED(CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC) &&
-		mod_mem_type_is_core_data(type);
-}
-
 static void *module_memory_alloc(unsigned int size, enum mod_mem_type type)
 {
-	if (mod_mem_use_vmalloc(type))
-		return vzalloc(size);
+	if (mod_mem_type_is_data(type))
+		return execmem_data_alloc(EXECMEM_MODULE_DATA, size);
 	return execmem_text_alloc(EXECMEM_MODULE_TEXT, size);
 }
 
 static void module_memory_free(void *ptr, enum mod_mem_type type)
 {
-	if (mod_mem_use_vmalloc(type))
-		vfree(ptr);
-	else
-		execmem_free(ptr);
+	execmem_free(ptr);
 }
 
 static void free_mod_mem(struct module *mod)
diff --git a/mm/execmem.c b/mm/execmem.c
index abcbd07e05ac..aeff85261360 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -53,11 +53,23 @@ static void *execmem_alloc(size_t size, struct execmem_range *range)
 	return kasan_reset_tag(p);
 }
 
+static inline bool execmem_range_is_data(enum execmem_type type)
+{
+	return type == EXECMEM_MODULE_DATA;
+}
+
 void *execmem_text_alloc(enum execmem_type type, size_t size)
 {
 	return execmem_alloc(size, &execmem_params.ranges[type]);
 }
 
+void *execmem_data_alloc(enum execmem_type type, size_t size)
+{
+	WARN_ON_ONCE(!execmem_range_is_data(type));
+
+	return execmem_alloc(size, &execmem_params.ranges[type]);
+}
+
 void execmem_free(void *ptr)
 {
 	/*
@@ -93,7 +105,10 @@ static void execmem_init_missing(struct execmem_params *p)
 		struct execmem_range *r = &p->ranges[i];
 
 		if (!r->start) {
-			r->pgprot = default_range->pgprot;
+			if (execmem_range_is_data(i))
+				r->pgprot = PAGE_KERNEL;
+			else
+				r->pgprot = default_range->pgprot;
 			r->alignment = default_range->alignment;
 			r->start = default_range->start;
 			r->end = default_range->end;
-- 
2.39.2

