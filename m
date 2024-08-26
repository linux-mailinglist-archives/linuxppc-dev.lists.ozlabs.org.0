Return-Path: <linuxppc-dev+bounces-509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0B95EA98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:35:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsjBx10v2z2yVM;
	Mon, 26 Aug 2024 17:35:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724655742;
	cv=none; b=j6flmewTSq3UciqSxa+1h8A6WpLipMj8rnoc34JxoH02K8fpUUfJQrQvrTxdxNw8Zt6/VOwB95CGFCqPKhUNNvlRwpkOT71zKG0w4VxKLDDqfjtvpSakgxmebdEwFihgKvVy5REj+aHShevjKyBX83ATp3yP3OGMwL3ZKe1lQV68Db5VtAIZLXrP+ib6CeFONfGJBPT0cB8RsDDv7JcEDpEIz/9Gmfx16qApKk+nRPwJvZW9SpaUohMPU20lXigSM6MDw6C0h1OiXrRJ8rc2CmFeZXYjcm96hDcGonX53RoLa3f/n6PJDS9OR8i6FiZ0fH/xX+jwQGbF8pWzEi3GbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724655742; c=relaxed/relaxed;
	bh=LxF225/K/unP9JE6t/pV9AyRKMos1QHjLabCCQuOXXY=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=bzUawe2AgPaq3FtRW66PPUE9w0pgtp3vI/3kn0FM+mRIpU6T4pvRNb0gbyRD9hj3tR3nw4Bqa9mt0VGcTNxzWElwDU4S5LVHuZB3sKGyPt69FNW1f/R3EnUYFNCxUUPzlnaqpqlfIqHzjJUEwMW9qYU33r0zN6c+lZ4rLVbfD2yL/G5Tm7HEXasO6on9VJw8jsUteDiLKkokQV7cwbhj95CmXy1lPE+qSnVPiEH4qLfidrqEq4ZS6+/ZIYi2IcgrhgsCvXZKsLyKK0vBXhPaQspgawAUnj8/191BRwTsqEAkNmF/s7ex1LYESyweljhBhl6FMhNPSGQfj5f3uBrFuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eEXWu1rK; dkim-atps=neutral; spf=pass (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eEXWu1rK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WshSZ4HPzz2xSM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:02:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BCB08CE0D07;
	Mon, 26 Aug 2024 07:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7310EC4CC21;
	Mon, 26 Aug 2024 06:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724655371;
	bh=1IVaPMd4I4fDfGF1ACfZ1lO9QxF1trpdGcxo9QBF4dI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eEXWu1rKRnZ648Ah+x/1BHnotq5Ln0fHqGprrk/r5JBNYEHatBGvJrJociOpwu76B
	 aZf6asJPDlGZg/jbjaINxlgmRQgSqtzNvMEGQW1yfKDx/eRPw4h5498wpkylKQMGwF
	 6ik8WsFe6xb4iUQGRa6QVkB48hCx3+0QVmX1P1sO40K5nOnoLaCUvsYe9tt8SMyXJN
	 NX7HI9ihImLp5tA/BMIzq0nTRJMAdNRlk5OyHkilumvLHOyzu3rzeAoFqtfiiRbQqp
	 qizWmDiaWIyxFsVcbhSIUXn1ghK+zdzLlqjG04+bjJA0HiiGMEo9ORCQvDuCHXAmSr
	 KUgJwhh6Ckf6Q==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
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
Subject: [PATCH v2 1/8] mm: vmalloc: group declarations depending on CONFIG_MMU together
Date: Mon, 26 Aug 2024 09:55:25 +0300
Message-ID: <20240826065532.2618273-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826065532.2618273-1-rppt@kernel.org>
References: <20240826065532.2618273-1-rppt@kernel.org>
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
index e4a631ec430b..c614631a31cb 100644
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
 
@@ -262,12 +256,29 @@ static inline bool is_vm_area_hugepages(const void *addr)
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
@@ -275,24 +286,14 @@ static inline void set_vm_flush_reset_perms(void *addr)
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
@@ -307,22 +308,9 @@ pcpu_get_vm_areas(const unsigned long *offsets,
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


