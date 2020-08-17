Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D98245E8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 09:53:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVRB23cTFzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 17:53:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+1cabf852a0fb828109f5+6203+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=U/VA45Pz; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVQjt6b5wzDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 17:32:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HNR/cS/AJ6roKIxtNpJ+9vihs4XEcXh0pr1qAX7tvRg=; b=U/VA45PzCKloPeRRX1D3kixSvb
 SrOkYb3Lj74rEfUIOTSyy1NLY/ZwVpO1eQ1Mcbq910IvO4N6cAXJMZaquAXzVKSnsCBXcWwhBDPBA
 pQalmndyQjFxSkrWq7jQJ0UbsumNyIO/wI4E5fmrV0mUjipFnaMYhp//ThYFtvXiV5PGPcq8Zp/FW
 JbNryc4oqpqojXIPD5rKpAHaVXHE+xUEqSTqWgf+RKXdozoR7xULh+FIHiz9o+PTyGEIF46GzecNb
 2SQoLy0dQeblZr2mde4D4I0gIC+SwTMrEE/Lth1b6xkLFx/d6pWOCdqWCf91e7pReAOZoXdnpHI/e
 BBpJ39fw==;
Received: from [2001:4bb8:188:3918:4550:cdf7:3d45:afb9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Zd6-0000wv-7e; Mon, 17 Aug 2020 07:32:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 09/11] x86: remove address space overrides using set_fs()
Date: Mon, 17 Aug 2020 09:32:10 +0200
Message-Id: <20200817073212.830069-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817073212.830069-1-hch@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stop providing the possibility to override the address space using
set_fs() now that there is no need for that any more.  To properly
handle the TASK_SIZE_MAX checking for 4 vs 5-level page tables on
x86 a new alternative is introduced, which just like the one in
entry_64.S has to use the hardcoded virtual address bits to escape
the fact that TASK_SIZE_MAX isn't actually a constant when 5-level
page tables are enabled.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/Kconfig                   |  1 -
 arch/x86/ia32/ia32_aout.c          |  1 -
 arch/x86/include/asm/processor.h   | 11 +----------
 arch/x86/include/asm/thread_info.h |  2 --
 arch/x86/include/asm/uaccess.h     | 26 +-------------------------
 arch/x86/kernel/asm-offsets.c      |  3 ---
 arch/x86/lib/getuser.S             | 28 ++++++++++++++++++----------
 arch/x86/lib/putuser.S             | 21 ++++++++++++---------
 8 files changed, 32 insertions(+), 61 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f85c13355732fe..7101ac64bb209d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -237,7 +237,6 @@ config X86
 	select HAVE_ARCH_KCSAN			if X86_64
 	select X86_FEATURE_NAMES		if PROC_FS
 	select PROC_PID_ARCH_STATUS		if PROC_FS
-	select SET_FS
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
 
 config INSTRUCTION_DECODER
diff --git a/arch/x86/ia32/ia32_aout.c b/arch/x86/ia32/ia32_aout.c
index ca8a657edf5977..a09fc37ead9d47 100644
--- a/arch/x86/ia32/ia32_aout.c
+++ b/arch/x86/ia32/ia32_aout.c
@@ -239,7 +239,6 @@ static int load_aout_binary(struct linux_binprm *bprm)
 	(regs)->ss = __USER32_DS;
 	regs->r8 = regs->r9 = regs->r10 = regs->r11 =
 	regs->r12 = regs->r13 = regs->r14 = regs->r15 = 0;
-	set_fs(USER_DS);
 	return 0;
 }
 
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 1618eeb08361a9..189573d95c3af6 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -482,10 +482,6 @@ extern unsigned int fpu_user_xstate_size;
 
 struct perf_event;
 
-typedef struct {
-	unsigned long		seg;
-} mm_segment_t;
-
 struct thread_struct {
 	/* Cached TLS descriptors: */
 	struct desc_struct	tls_array[GDT_ENTRY_TLS_ENTRIES];
@@ -538,8 +534,6 @@ struct thread_struct {
 	 */
 	unsigned long		iopl_emul;
 
-	mm_segment_t		addr_limit;
-
 	unsigned int		sig_on_uaccess_err:1;
 
 	/* Floating point and extended processor state */
@@ -785,15 +779,12 @@ static inline void spin_lock_prefetch(const void *x)
 #define INIT_THREAD  {							  \
 	.sp0			= TOP_OF_INIT_STACK,			  \
 	.sysenter_cs		= __KERNEL_CS,				  \
-	.addr_limit		= KERNEL_DS,				  \
 }
 
 #define KSTK_ESP(task)		(task_pt_regs(task)->sp)
 
 #else
-#define INIT_THREAD  {						\
-	.addr_limit		= KERNEL_DS,			\
-}
+#define INIT_THREAD { }
 
 extern unsigned long KSTK_ESP(struct task_struct *task);
 
diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index 267701ae3d86dd..44733a4bfc4294 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -102,7 +102,6 @@ struct thread_info {
 #define TIF_SYSCALL_TRACEPOINT	28	/* syscall tracepoint instrumentation */
 #define TIF_ADDR32		29	/* 32-bit address space on 64 bits */
 #define TIF_X32			30	/* 32-bit native x86-64 binary */
-#define TIF_FSCHECK		31	/* Check FS is USER_DS on return */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
@@ -131,7 +130,6 @@ struct thread_info {
 #define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
 #define _TIF_ADDR32		(1 << TIF_ADDR32)
 #define _TIF_X32		(1 << TIF_X32)
-#define _TIF_FSCHECK		(1 << TIF_FSCHECK)
 
 /* flags to check in __switch_to() */
 #define _TIF_WORK_CTXSW_BASE					\
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index ecefaffd15d4c8..a4ceda0510ea87 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -12,30 +12,6 @@
 #include <asm/smap.h>
 #include <asm/extable.h>
 
-/*
- * The fs value determines whether argument validity checking should be
- * performed or not.  If get_fs() == USER_DS, checking is performed, with
- * get_fs() == KERNEL_DS, checking is bypassed.
- *
- * For historical reasons, these macros are grossly misnamed.
- */
-
-#define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
-
-#define KERNEL_DS	MAKE_MM_SEG(-1UL)
-#define USER_DS 	MAKE_MM_SEG(TASK_SIZE_MAX)
-
-#define get_fs()	(current->thread.addr_limit)
-static inline void set_fs(mm_segment_t fs)
-{
-	current->thread.addr_limit = fs;
-	/* On user-mode return, check fs is correct */
-	set_thread_flag(TIF_FSCHECK);
-}
-
-#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
-#define user_addr_max() (current->thread.addr_limit.seg)
-
 /*
  * Test whether a block of memory is a valid user space address.
  * Returns 0 if the range is valid, nonzero otherwise.
@@ -93,7 +69,7 @@ static inline bool pagefault_disabled(void);
 #define access_ok(addr, size)					\
 ({									\
 	WARN_ON_IN_IRQ();						\
-	likely(!__range_not_ok(addr, size, user_addr_max()));		\
+	likely(!__range_not_ok(addr, size, TASK_SIZE_MAX));		\
 })
 
 /*
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 3ca07ad552ae0c..70b7154f4bdd62 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -37,9 +37,6 @@ static void __used common(void)
 	OFFSET(TASK_stack_canary, task_struct, stack_canary);
 #endif
 
-	BLANK();
-	OFFSET(TASK_addr_limit, task_struct, thread.addr_limit);
-
 	BLANK();
 	OFFSET(crypto_tfm_ctx_offset, crypto_tfm, __crt_ctx);
 
diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index c8a85b512796e1..ccc9808c66420a 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -35,10 +35,18 @@
 #include <asm/smap.h>
 #include <asm/export.h>
 
+#ifdef CONFIG_X86_5LEVEL
+#define LOAD_TASK_SIZE_MAX \
+	ALTERNATIVE "mov $((1 << 47) - 4096),%rdx", \
+		    "mov $((1 << 56) - 4096),%rdx", X86_FEATURE_LA57
+#else
+#define LOAD_TASK_SIZE_MAX	mov $TASK_SIZE_MAX,%_ASM_DX
+#endif
+
 	.text
 SYM_FUNC_START(__get_user_1)
-	mov PER_CPU_VAR(current_task), %_ASM_DX
-	cmp TASK_addr_limit(%_ASM_DX),%_ASM_AX
+	LOAD_TASK_SIZE_MAX
+	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user
 	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
 	and %_ASM_DX, %_ASM_AX
@@ -53,8 +61,8 @@ EXPORT_SYMBOL(__get_user_1)
 SYM_FUNC_START(__get_user_2)
 	add $1,%_ASM_AX
 	jc bad_get_user
-	mov PER_CPU_VAR(current_task), %_ASM_DX
-	cmp TASK_addr_limit(%_ASM_DX),%_ASM_AX
+	LOAD_TASK_SIZE_MAX
+	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user
 	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
 	and %_ASM_DX, %_ASM_AX
@@ -69,8 +77,8 @@ EXPORT_SYMBOL(__get_user_2)
 SYM_FUNC_START(__get_user_4)
 	add $3,%_ASM_AX
 	jc bad_get_user
-	mov PER_CPU_VAR(current_task), %_ASM_DX
-	cmp TASK_addr_limit(%_ASM_DX),%_ASM_AX
+	LOAD_TASK_SIZE_MAX
+	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user
 	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
 	and %_ASM_DX, %_ASM_AX
@@ -86,8 +94,8 @@ SYM_FUNC_START(__get_user_8)
 #ifdef CONFIG_X86_64
 	add $7,%_ASM_AX
 	jc bad_get_user
-	mov PER_CPU_VAR(current_task), %_ASM_DX
-	cmp TASK_addr_limit(%_ASM_DX),%_ASM_AX
+	LOAD_TASK_SIZE_MAX
+	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user
 	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
 	and %_ASM_DX, %_ASM_AX
@@ -99,8 +107,8 @@ SYM_FUNC_START(__get_user_8)
 #else
 	add $7,%_ASM_AX
 	jc bad_get_user_8
-	mov PER_CPU_VAR(current_task), %_ASM_DX
-	cmp TASK_addr_limit(%_ASM_DX),%_ASM_AX
+	LOAD_TASK_SIZE_MAX
+	cmp %_ASM_DX,%_ASM_AX
 	jae bad_get_user_8
 	sbb %_ASM_DX, %_ASM_DX		/* array_index_mask_nospec() */
 	and %_ASM_DX, %_ASM_AX
diff --git a/arch/x86/lib/putuser.S b/arch/x86/lib/putuser.S
index 7c7c92db8497af..f5a56394985875 100644
--- a/arch/x86/lib/putuser.S
+++ b/arch/x86/lib/putuser.S
@@ -31,12 +31,18 @@
  * as they get called from within inline assembly.
  */
 
-#define ENTER	mov PER_CPU_VAR(current_task), %_ASM_BX
+#ifdef CONFIG_X86_5LEVEL
+#define LOAD_TASK_SIZE_MAX \
+	ALTERNATIVE "mov $((1 << 47) - 4096),%rbx", \
+		    "mov $((1 << 56) - 4096),%rbx", X86_FEATURE_LA57
+#else
+#define LOAD_TASK_SIZE_MAX	mov $TASK_SIZE_MAX,%_ASM_BX
+#endif
 
 .text
 SYM_FUNC_START(__put_user_1)
-	ENTER
-	cmp TASK_addr_limit(%_ASM_BX),%_ASM_CX
+	LOAD_TASK_SIZE_MAX
+	cmp %_ASM_BX,%_ASM_CX
 	jae .Lbad_put_user
 	ASM_STAC
 1:	movb %al,(%_ASM_CX)
@@ -47,8 +53,7 @@ SYM_FUNC_END(__put_user_1)
 EXPORT_SYMBOL(__put_user_1)
 
 SYM_FUNC_START(__put_user_2)
-	ENTER
-	mov TASK_addr_limit(%_ASM_BX),%_ASM_BX
+	LOAD_TASK_SIZE_MAX
 	sub $1,%_ASM_BX
 	cmp %_ASM_BX,%_ASM_CX
 	jae .Lbad_put_user
@@ -61,8 +66,7 @@ SYM_FUNC_END(__put_user_2)
 EXPORT_SYMBOL(__put_user_2)
 
 SYM_FUNC_START(__put_user_4)
-	ENTER
-	mov TASK_addr_limit(%_ASM_BX),%_ASM_BX
+	LOAD_TASK_SIZE_MAX
 	sub $3,%_ASM_BX
 	cmp %_ASM_BX,%_ASM_CX
 	jae .Lbad_put_user
@@ -75,8 +79,7 @@ SYM_FUNC_END(__put_user_4)
 EXPORT_SYMBOL(__put_user_4)
 
 SYM_FUNC_START(__put_user_8)
-	ENTER
-	mov TASK_addr_limit(%_ASM_BX),%_ASM_BX
+	LOAD_TASK_SIZE_MAX
 	sub $7,%_ASM_BX
 	cmp %_ASM_BX,%_ASM_CX
 	jae .Lbad_put_user
-- 
2.28.0

