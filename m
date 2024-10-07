Return-Path: <linuxppc-dev+bounces-1785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC8992473
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 08:29:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMTlV2z0Zz2yPG;
	Mon,  7 Oct 2024 17:29:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728282582;
	cv=none; b=W8xSJ63rqs5HaCMOvGySWKXRe5zR8B8GSYLzaog9ybnhLd+h8c+Ng55tNZFcSF2wIr89XysGOr3A1BTJSKh2YjfbwohnYiu33CprDakbuaBJo7Zm8Dar2w7jJvEK+qTrhHZCVp9yNYPyW+ngxGucDbc6KBKPguy3SEuwPjY1YVbPJAgK+ZjEd8zlDjijWONKcxHq21OIEImZ0Q3Yfu3rRGimzUOYVRqfQ8lbNKOHPfVyiJMLeWSH3ZwNtHmZ0gLFp+jlPWB/7/9wxBp+s7rOpg208RjGalv/Q0MiNPxfBl9K0F5BSTsCu0+ML9/JEVImN+uX+t/i7jkjOGMNoYIoGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728282582; c=relaxed/relaxed;
	bh=9RBK7hzpFiwpS3WuLNGRSra8wn5hmFuuSqvvSgDdvkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMXvjCW2Cu0893KniubRpo1eJLxvY6pEEgyUS3i7rITRAk+hTMTwH5y7MlB4QiCorfWkq622RbdeVWI5w1gWvOltMmI9nLtxCSlzJixD1CEhtuFEn1mCg9HaBi9ZbuzONWoAck2gWatViEWRQBDQnobmb5Mn8OK5heEZzhT7zQwSHPWzqd0raW6rvt051vcBhDrLd5nu49vzsk5FHLNueCBLjnhHw05rPqD6Zq3dm+RaddKhGys6qDvgdzkXnfbjkMmn2vib5mLILCEN7vE7reqpJyJLTG449Y4NebBEvtTWIo06A3+6xm9FISbBA5shu2JFnpHRbDejxHGrhAgHoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i6kzY4uJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i6kzY4uJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMTlT2zvSz2y71
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 17:29:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 806655C54FC;
	Mon,  7 Oct 2024 06:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4C6C4CEC7;
	Mon,  7 Oct 2024 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728282578;
	bh=YllkjQvsWrr6dQbJlUjRUABqghggyZA8loEEeE76mk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i6kzY4uJzQ7Qdyz1ZhcA8oSDPkmiOiPfu2ql1HNAVuX7bF+4mNsVR3AmLOTFDBCug
	 4yJ/CORrw9a+tR+vOAyHFEYuq/4QPBsaYeld57i5u5jtVr7t1ZhKFhpJZ1tt4r6ZIr
	 jTSYc2t3fw6cCpkaBwOA0+cqUyDuQvgetWtjmgomTMNyKeFwGMnmwj0IM4dvsJGDcC
	 E5dkIVjHNUIpFC8/xH3hHgiTzYgAgsjH76us1FHtZgdk6jkNtes9fExTMN+UrWoFx7
	 L085EY3TXlqxr3FMznPdR+WCKnPPndhV5ia1vNRM8QcOyUe/BeiXjZt/w6iT2kPuL4
	 i9TugR2R+4SnA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v4 1/8] mm: vmalloc: group declarations depending on CONFIG_MMU together
Date: Mon,  7 Oct 2024 09:28:51 +0300
Message-ID: <20241007062858.44248-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007062858.44248-1-rppt@kernel.org>
References: <20241007062858.44248-1-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

There are a couple of declarations that depend on CONFIG_MMU in
include/linux/vmalloc.h spread all over the file.

Group them all together to improve code readability.

No functional changes.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/vmalloc.h | 60 +++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index ad2ce7a6ab7a..9a012cd4fad2 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -134,12 +134,6 @@ extern void vm_unmap_ram(const void *mem, unsigned int count);
 extern void *vm_map_ram(struct page **pages, unsigned int count, int node);
 extern void vm_unmap_aliases(void);
 
-#ifdef CONFIG_MMU
-extern unsigned long vmalloc_nr_pages(void);
-#else
-static inline unsigned long vmalloc_nr_pages(void) { return 0; }
-#endif
-
 extern void *vmalloc_noprof(unsigned long size) __alloc_size(1);
 #define vmalloc(...)		alloc_hooks(vmalloc_noprof(__VA_ARGS__))
 
@@ -266,12 +260,29 @@ static inline bool is_vm_area_hugepages(const void *addr)
 #endif
 }
 
+/* for /proc/kcore */
+extern long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
+
+/*
+ *	Internals.  Don't use..
+ */
+extern __init void vm_area_add_early(struct vm_struct *vm);
+extern __init void vm_area_register_early(struct vm_struct *vm, size_t align);
+
+int register_vmap_purge_notifier(struct notifier_block *nb);
+int unregister_vmap_purge_notifier(struct notifier_block *nb);
+
 #ifdef CONFIG_MMU
+#define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
+
+extern unsigned long vmalloc_nr_pages(void);
+
 int vm_area_map_pages(struct vm_struct *area, unsigned long start,
 		      unsigned long end, struct page **pages);
 void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
 			 unsigned long end);
 void vunmap_range(unsigned long addr, unsigned long end);
+
 static inline void set_vm_flush_reset_perms(void *addr)
 {
 	struct vm_struct *vm = find_vm_area(addr);
@@ -279,24 +290,14 @@ static inline void set_vm_flush_reset_perms(void *addr)
 	if (vm)
 		vm->flags |= VM_FLUSH_RESET_PERMS;
 }
+#else  /* !CONFIG_MMU */
+#define VMALLOC_TOTAL 0UL
 
-#else
-static inline void set_vm_flush_reset_perms(void *addr)
-{
-}
-#endif
-
-/* for /proc/kcore */
-extern long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
-
-/*
- *	Internals.  Don't use..
- */
-extern __init void vm_area_add_early(struct vm_struct *vm);
-extern __init void vm_area_register_early(struct vm_struct *vm, size_t align);
+static inline unsigned long vmalloc_nr_pages(void) { return 0; }
+static inline void set_vm_flush_reset_perms(void *addr) {}
+#endif /* CONFIG_MMU */
 
-#ifdef CONFIG_SMP
-# ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && defined(CONFIG_SMP)
 struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 				     const size_t *sizes, int nr_vms,
 				     size_t align);
@@ -311,22 +312,9 @@ pcpu_get_vm_areas(const unsigned long *offsets,
 	return NULL;
 }
 
-static inline void
-pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms)
-{
-}
-# endif
-#endif
-
-#ifdef CONFIG_MMU
-#define VMALLOC_TOTAL (VMALLOC_END - VMALLOC_START)
-#else
-#define VMALLOC_TOTAL 0UL
+static inline void pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms) {}
 #endif
 
-int register_vmap_purge_notifier(struct notifier_block *nb);
-int unregister_vmap_purge_notifier(struct notifier_block *nb);
-
 #if defined(CONFIG_MMU) && defined(CONFIG_PRINTK)
 bool vmalloc_dump_obj(void *object);
 #else
-- 
2.43.0


