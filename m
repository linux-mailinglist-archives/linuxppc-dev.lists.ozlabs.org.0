Return-Path: <linuxppc-dev+bounces-9616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C52AE3014
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 15:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQBfg4KLkz30W1;
	Sun, 22 Jun 2025 23:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750598443;
	cv=none; b=S2olT/htEjPQVM0zv5PjTBYsD8UgeWQYZySB94lS3BXVL7ScJTpAta0EpCo1eI1fcJcaoi4YADc49GHDBjfTS81sGD2tT0GJk6YxeojHmeSZ/2dtNH6Mjhmli6wWpL7Uk2Qtu4TQfxpVPTD1ijRDH9S0BYwPIAjYj5T4xgu+F2oLTGKsZJvL9FoC0pW33le1rnqUAh81Ik/H23FiAXkfNFlfGGv/L4fhLO20ACCiwPfyk8EntfNWGD5NHZY3/VzEbRwiRlqE96ISVtTtPR4BpUg6LBuIftcVQG8JGwJJPdoodQY25UdOCEYMfJ/tkHjoLUwfUKVgCPleyWAxziKvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750598443; c=relaxed/relaxed;
	bh=YqEjvK+h4yPNDsIOB+of4fx04E3AyxoK23e8dalRnmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckHpND2fWllOL+EaI8ufIgXGPQW8kccX2NTf/ZIzWgM1qjYPA7gsZEfUElx5O1LM5dLXAmsnHXAkx9LeyQqMmFMlSFFi8otigGXhlXFMhn+DKLYvDjxt575YmhgfY1p9H9gCGNIuR1dNB8pVtvbuTLm/3rSa55SzCFJffhtgQeZSiXoWp4M+WUCcOSKSwG4dSEFvLUUqqG61OddzXOTxgnOoF70tcY0OXXxGnUBISiuc7yYarkum5BOxpy3jDjOliNG51A+XZxSN3O7eT2KoJVFi3v6IGpKP6FW0dad/9ldSxfB6+VJFZsxw/34BpNMqGOgdwY7QXGdq6vZBS9XvSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQBff2PD5z30KY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 23:20:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQ62t64q5z9sgR;
	Sun, 22 Jun 2025 11:52:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPMK_hjCi9xN; Sun, 22 Jun 2025 11:52:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQ62t4rxQz9sfF;
	Sun, 22 Jun 2025 11:52:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B88E8B764;
	Sun, 22 Jun 2025 11:52:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s3blMO_cBix6; Sun, 22 Jun 2025 11:52:54 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 437548B763;
	Sun, 22 Jun 2025 11:52:53 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 5/5] powerpc: Implement masked user access
Date: Sun, 22 Jun 2025 11:52:43 +0200
Message-ID: <9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750585239.git.christophe.leroy@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750585959; l=7393; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=qYAjfl18Jby7CwcbCS7uFbA23zIiub7HvvgW5b+LR8Q=; b=detE8VsRyRW16C7FKw7YfeTCPzD9KbeI1xJBtx/L1fEZ2e90YcB368xGnwXVIdeqLMLnDjpxY Tph1QADOh/aDelxyXJVKuTKJ0HVilE7dg2yH+ubXhNEGZOguGh1XLt3
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Masked user access avoids the address/size verification by access_ok().
Allthough its main purpose is to skip the speculation in the
verification of user address and size hence avoid the need of spec
mitigation, it also has the advantage to reduce the amount of
instructions needed so it also benefits to platforms that don't
need speculation mitigation, especially when the size of the copy is
not know at build time.

So implement masked user access on powerpc. The only requirement is
to have memory gap that faults between the top user space and the
real start of kernel area. On 64 bits platform it is easy, bit 0 is
always 0 for user addresses and always 1 for kernel addresses and
user addresses stop long before the end of the area. On 32 bits it
is more tricky. It theory user space can go up to 0xbfffffff while
kernel will usually start at 0xc0000000. So a gap needs to be added
inbetween. Allthough in theory a single 4k page would suffice, it
is easier and more efficient to enforce a 128k gap below kernel,
as it simplifies the masking.

Unlike x86_64 which masks the address to 'all bits set' when the
user address is invalid, here the address is set to an address is
the gap. It avoids relying on the zero page to catch offseted
accesses.

e500 has the isel instruction which allows selecting one value or
the other without branch and that instruction is not speculative, so
use it. Allthough GCC usually generates code using that instruction,
it is safer to use inline assembly to be sure. The result is:

  14:	3d 20 bf fe 	lis     r9,-16386
  18:	7c 03 48 40 	cmplw   r3,r9
  1c:	7c 69 18 5e 	iselgt  r3,r9,r3

On other ones, when kernel space is over 0x80000000 and user space
is below, the logic in mask_user_address_simple() leads to a
3 instruction sequence:

  14:	7c 69 fe 70 	srawi   r9,r3,31
  18:	7c 63 48 78 	andc    r3,r3,r9
  1c:	51 23 00 00 	rlwimi  r3,r9,0,0,0

This is the default on powerpc 8xx.

When the limit between user space and kernel space is not 0x80000000,
mask_user_address_32() is used and a 6 instructions sequence is
generated:

  24:	54 69 7c 7e 	srwi    r9,r3,17
  28:	21 29 57 ff 	subfic  r9,r9,22527
  2c:	7d 29 fe 70 	srawi   r9,r9,31
  30:	75 2a b0 00 	andis.  r10,r9,45056
  34:	7c 63 48 78 	andc    r3,r3,r9
  38:	7c 63 53 78 	or      r3,r3,r10

The constraint is that TASK_SIZE be aligned to 128K in order to get
the most optimal number of instructions.

When CONFIG_PPC_BARRIER_NOSPEC is not defined, fallback on the
test-based masking as it is quicker than the 6 instructions sequence
but not necessarily quicker than the 3 instructions sequences above.

On 64 bits, kernel is always above 0x8000000000000000 and user always
below, which leads to a 4 instructions sequence:

  80:	7c 69 1b 78 	mr      r9,r3
  84:	7c 63 fe 76 	sradi   r3,r3,63
  88:	7d 29 18 78 	andc    r9,r9,r3
  8c:	79 23 00 4c 	rldimi  r3,r9,0,1

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig               |   2 +-
 arch/powerpc/include/asm/uaccess.h | 100 +++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3e0cc83f120..c26a39b4504a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1303,7 +1303,7 @@ config TASK_SIZE
 	hex "Size of user task space" if TASK_SIZE_BOOL
 	default "0x80000000" if PPC_8xx
 	default "0xb0000000" if PPC_BOOK3S_32 && EXECMEM
-	default "0xc0000000"
+	default "0xbffe0000"
 
 config MODULES_SIZE_BOOL
 	bool "Set custom size for modules/execmem area"
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 89d53d4c2236..19743ee80523 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -2,6 +2,8 @@
 #ifndef _ARCH_POWERPC_UACCESS_H
 #define _ARCH_POWERPC_UACCESS_H
 
+#include <linux/sizes.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/extable.h>
@@ -455,6 +457,104 @@ user_write_access_begin(const void __user *ptr, size_t len)
 #define user_write_access_begin	user_write_access_begin
 #define user_write_access_end		prevent_current_write_to_user
 
+/*
+ * Masking the user address is an alternative to a conditional
+ * user_access_begin that can avoid the fencing. This only works
+ * for dense accesses starting at the address.
+ */
+static inline void __user *mask_user_address_simple(const void __user *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+	unsigned long mask = (unsigned long)((long)addr >> (BITS_PER_LONG - 1));
+
+	addr = ((addr & ~mask) & (~0UL >> 1)) | (mask & (1UL << (BITS_PER_LONG - 1)));
+
+	return (void __user *)addr;
+}
+
+static inline void __user *mask_user_address_e500(const void __user *ptr)
+{
+	unsigned long addr;
+
+	asm("cmplw %1, %2; iselgt %0, %2, %1" : "=r"(addr) : "r"(ptr), "r"(TASK_SIZE): "cr0");
+
+	return (void __user *)addr;
+}
+
+/* Make sure TASK_SIZE is a multiple of 128K for shifting by 17 to the right */
+static inline void __user *mask_user_address_32(const void __user *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+	unsigned long mask = (unsigned long)((long)((TASK_SIZE >> 17) - 1 - (addr >> 17)) >> 31);
+
+	addr = (addr & ~mask) | (TASK_SIZE & mask);
+
+	return (void __user *)addr;
+}
+
+static inline void __user *mask_user_address_fallback(const void __user *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
+
+	return (void __user *)(addr < TASK_SIZE ? addr : TASK_SIZE);
+}
+
+static inline void __user *mask_user_address(const void __user *ptr)
+{
+#ifdef MODULES_VADDR
+	const unsigned long border = MODULES_VADDR;
+#else
+	const unsigned long border = PAGE_OFFSET;
+#endif
+	BUILD_BUG_ON(TASK_SIZE_MAX & (SZ_128K - 1));
+	BUILD_BUG_ON(TASK_SIZE_MAX + SZ_128K > border);
+	BUILD_BUG_ON(TASK_SIZE_MAX & 0x8000000000000000ULL);
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_PPC64) && !(PAGE_OFFSET & 0x8000000000000000ULL));
+
+	if (IS_ENABLED(CONFIG_PPC64))
+		return mask_user_address_simple(ptr);
+	if (IS_ENABLED(CONFIG_E500))
+		return mask_user_address_e500(ptr);
+	if (TASK_SIZE <= SZ_2G && border >= SZ_2G)
+		return mask_user_address_simple(ptr);
+	if (IS_ENABLED(CONFIG_PPC_BARRIER_NOSPEC))
+		return mask_user_address_32(ptr);
+	return mask_user_address_fallback(ptr);
+}
+
+static inline void __user *masked_user_access_begin(const void __user *p)
+{
+	void __user *ptr = mask_user_address(p);
+
+	might_fault();
+	allow_read_write_user(ptr, ptr);
+
+	return ptr;
+}
+#define masked_user_access_begin masked_user_access_begin
+
+static inline void __user *masked_user_read_access_begin(const void __user *p)
+{
+	void __user *ptr = mask_user_address(p);
+
+	might_fault();
+	allow_read_from_user(ptr);
+
+	return ptr;
+}
+#define masked_user_read_access_begin masked_user_read_access_begin
+
+static inline void __user *masked_user_write_access_begin(const void __user *p)
+{
+	void __user *ptr = mask_user_address(p);
+
+	might_fault();
+	allow_write_to_user(ptr);
+
+	return ptr;
+}
+#define masked_user_write_access_begin masked_user_write_access_begin
+
 #define unsafe_get_user(x, p, e) do {					\
 	__long_type(*(p)) __gu_val;				\
 	__typeof__(*(p)) __user *__gu_addr = (p);		\
-- 
2.49.0


