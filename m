Return-Path: <linuxppc-dev+bounces-895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A57968E53
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 21:18:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyJS7730Sz2yQl;
	Tue,  3 Sep 2024 05:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725304679;
	cv=none; b=CDTH4ExXdnEeJO4O+YdXRMmcaBDlqch9lPkYrnnXqlAmrfbqXdqep9q0OV6TuxTOxk6yARCI/4mqyudOoiAuAmEQVCT1D58ADbKkN9ajV2YOtuJdDdekc3Al4yCYGV+AMqmgT7KZSWr60cutKrOXcx2EXMqsbISGt/tOrucyxdWK17N/Gx1LFNxyZMDoaXNsScgf133i5AU4+KpwqtDgzIHjet2yBPqEThEG8SlmFTG/BGbryktZCFXZOUdK4+fyHnVY75m2V0au88XdQY4FaWD4UWI0v6NbHLAGqoF3chj3oRHRd0jbafWGYS2+FLzRZ38gP77MqRbaewbdm73D3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725304679; c=relaxed/relaxed;
	bh=TbUZIPNhHKK4TCKKF2Lc46zC0ioL7fEsik29vmA7pLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUdYaWxRCFTtdk2Ka1v/7Dtd6WfNpE0IviRTULEj7Xw40m3+Kmyk9EM1WWmoX1aQRWsHudEa9jvcE9UYGe7Xtu7Fu8UVQHxzJHFzefI/deiD7i02w67G+MJYN8ZmZ/GwWYD1jIhEIfWlziH3tniGFX6cVybaIN8TamzPoBrRUJD85nPipOmvUaL6SSZKap/1rSHy6XzJNsVtds0BKu4QWCUE/cKR8DlA9gpZgIL51zD85ZKYwYtoehOhX8hQlrHTmINdTOXnzHBlsWWuechBG/tq9+d8GIsOFMxqa7ZD1PQt1a6Wk+h68PhxjH90xhtsxLg/gDmteYXVmk5EZ902Hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyJS74jvMz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 05:17:59 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WyJRg4Yrzz9sSS;
	Mon,  2 Sep 2024 21:17:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UHuwOflyJahA; Mon,  2 Sep 2024 21:17:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WyJRg3FM1z9sS7;
	Mon,  2 Sep 2024 21:17:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 621068B76E;
	Mon,  2 Sep 2024 21:17:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nRvxAuIibIDy; Mon,  2 Sep 2024 21:17:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.167])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 657548B773;
	Mon,  2 Sep 2024 21:17:34 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v5 5/5] powerpc/vdso: Wire up getrandom() vDSO implementation on VDSO64
Date: Mon,  2 Sep 2024 21:17:22 +0200
Message-ID: <de334b1de27260f217d6bc65e02c841e8eff75be.1725304404.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1725304404.git.christophe.leroy@csgroup.eu>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725304638; l=7245; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=1u98q0W43xTrsnG50liffh4ZTxumv6Ho4dq/SBaH6jA=; b=lM1uhuWNjxthaHQDf7uVaaSIKJ42G+9/6cAo7nbd76NGIaBABIDpKtUqexJkcPnaewmAS32q3 h+Nv5kPU5p2DUadEnB+UvL81zdHxza+GA275Mngu9p5wM9cdC8ZywAr
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Extend getrandom() vDSO implementation to VDSO64

Tested on QEMU on both ppc64_defconfig and ppc64le_defconfig.

The results are not precise as it is QEMU on an x86 laptop, but
no need to be precise to see the benefit.

~ # ./vdso_test_getrandom bench-single
   vdso: 25000000 times in 4.977777162 seconds
   libc: 25000000 times in 75.516749981 seconds
syscall: 25000000 times in 86.842242014 seconds

~ # ./vdso_test_getrandom bench-single
   vdso: 25000000 times in 6.473814156 seconds
   libc: 25000000 times in 73.875109463 seconds
syscall: 25000000 times in 71.805066229 seconds

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5:
- VDSO32 for both PPC32 and PPC64 is in previous patch. This patch have the logic for VDSO64.

v4:
- Use __BIG_ENDIAN__ which is defined by GCC instead of CONFIG_CPU_BIG_ENDIAN which is unknown by selftests
- Implement a cleaner/smaller output copy for little endian instead of keeping compat macro.

v3: New (split out of previous patch)
---
 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/kernel/vdso/Makefile            |  8 ++-
 arch/powerpc/kernel/vdso/getrandom.S         |  8 +++
 arch/powerpc/kernel/vdso/vdso64.lds.S        |  1 +
 arch/powerpc/kernel/vdso/vgetrandom-chacha.S | 53 ++++++++++++++++++++
 5 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e500a59ddecc..b45452ac4a73 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -311,7 +311,7 @@ config PPC
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
-	select VDSO_GETRANDOM			if VDSO32
+	select VDSO_GETRANDOM
 	#
 	# Please keep this list sorted alphabetically.
 	#
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 7a4a935406d8..56fb1633529a 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -9,6 +9,7 @@ obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o not
 obj-vdso64 = sigtramp64-64.o gettimeofday-64.o datapage-64.o cacheflush-64.o note-64.o getcpu-64.o
 
 obj-vdso32 += getrandom-32.o vgetrandom-chacha-32.o
+obj-vdso64 += getrandom-64.o vgetrandom-chacha-64.o
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday-32.o += -include $(c-gettimeofday-y)
@@ -21,6 +22,7 @@ endif
 
 ifneq ($(c-getrandom-y),)
   CFLAGS_vgetrandom-32.o += -include $(c-getrandom-y)
+  CFLAGS_vgetrandom-64.o += -include $(c-getrandom-y) $(call cc-option, -ffixed-r30)
 endif
 
 # Build rules
@@ -34,7 +36,7 @@ endif
 targets := $(obj-vdso32) vdso32.so.dbg vgettimeofday-32.o vgetrandom-32.o
 targets += crtsavres-32.o
 obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
-targets += $(obj-vdso64) vdso64.so.dbg vgettimeofday-64.o
+targets += $(obj-vdso64) vdso64.so.dbg vgettimeofday-64.o vgetrandom-64.o
 obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
 
 ccflags-y := -fno-common -fno-builtin -DBUILD_VDSO
@@ -71,7 +73,7 @@ CPPFLAGS_vdso64.lds += -P -C
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o $(obj)/vgetrandom-32.o $(obj)/crtsavres-32.o FORCE
 	$(call if_changed,vdso32ld_and_check)
-$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o FORCE
+$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o $(obj)/vgetrandom-64.o FORCE
 	$(call if_changed,vdso64ld_and_check)
 
 # assembly rules for the .S files
@@ -87,6 +89,8 @@ $(obj-vdso64): %-64.o: %.S FORCE
 	$(call if_changed_dep,vdso64as)
 $(obj)/vgettimeofday-64.o: %-64.o: %.c FORCE
 	$(call if_changed_dep,cc_o_c)
+$(obj)/vgetrandom-64.o: %-64.o: %.c FORCE
+	$(call if_changed_dep,cc_o_c)
 
 # Generate VDSO offsets using helper script
 gen-vdso32sym := $(src)/gen_vdso32_offsets.sh
diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
index 21773ef3fc1d..a957cd2b2b03 100644
--- a/arch/powerpc/kernel/vdso/getrandom.S
+++ b/arch/powerpc/kernel/vdso/getrandom.S
@@ -27,10 +27,18 @@
   .cfi_adjust_cfa_offset PPC_MIN_STKFRM
 	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
   .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
+#ifdef __powerpc64__
+	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+  .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
+#endif
 	get_datapage	r8
 	addi		r8, r8, VDSO_RNG_DATA_OFFSET
 	bl		CFUNC(DOTSYM(\funct))
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+  .cfi_restore r2
+#endif
 	cmpwi		r3, 0
 	mtlr		r0
 	addi		r1, r1, 2 * PPC_MIN_STKFRM
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index 400819258c06..9481e4b892ed 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -123,6 +123,7 @@ VERSION
 		__kernel_sigtramp_rt64;
 		__kernel_getcpu;
 		__kernel_time;
+		__kernel_getrandom;
 
 	local: *;
 	};
diff --git a/arch/powerpc/kernel/vdso/vgetrandom-chacha.S b/arch/powerpc/kernel/vdso/vgetrandom-chacha.S
index ac85788205cb..7f9061a9e8b4 100644
--- a/arch/powerpc/kernel/vdso/vgetrandom-chacha.S
+++ b/arch/powerpc/kernel/vdso/vgetrandom-chacha.S
@@ -124,6 +124,26 @@
  */
 SYM_FUNC_START(__arch_chacha20_blocks_nostack)
 #ifdef __powerpc64__
+	std	counter, -216(r1)
+
+	std	r14, -144(r1)
+	std	r15, -136(r1)
+	std	r16, -128(r1)
+	std	r17, -120(r1)
+	std	r18, -112(r1)
+	std	r19, -104(r1)
+	std	r20, -96(r1)
+	std	r21, -88(r1)
+	std	r22, -80(r1)
+	std	r23, -72(r1)
+	std	r24, -64(r1)
+	std	r25, -56(r1)
+	std	r26, -48(r1)
+	std	r27, -40(r1)
+	std	r28, -32(r1)
+	std	r29, -24(r1)
+	std	r30, -16(r1)
+	std	r31, -8(r1)
 #else
 	stwu	r1, -96(r1)
 	stw	counter, 20(r1)
@@ -149,9 +169,13 @@ SYM_FUNC_START(__arch_chacha20_blocks_nostack)
 	stw	r30, 88(r1)
 	stw	r31, 92(r1)
 #endif
+#endif	/* __powerpc64__ */
 
 	lwz	counter0, 0(counter)
 	lwz	counter1, 4(counter)
+#ifdef __powerpc64__
+	rldimi	counter0, counter1, 32, 0
+#endif
 	mr	idx_r0, nblocks
 	subi	dst_bytes, dst_bytes, 4
 
@@ -267,12 +291,21 @@ SYM_FUNC_START(__arch_chacha20_blocks_nostack)
 
 	subic.	idx_r0, idx_r0, 1	/* subi. can't use r0 as source */
 
+#ifdef __powerpc64__
+	addi	counter0, counter0, 1
+	srdi	counter1, counter0, 32
+#else
 	addic	counter0, counter0, 1
 	addze	counter1, counter1
+#endif
 
 	bne	.Lblock
 
+#ifdef __powerpc64__
+	ld	counter, -216(r1)
+#else
 	lwz	counter, 20(r1)
+#endif
 	stw	counter0, 0(counter)
 	stw	counter1, 4(counter)
 
@@ -284,6 +317,26 @@ SYM_FUNC_START(__arch_chacha20_blocks_nostack)
 	li	r11, 0
 	li	r12, 0
 
+#ifdef __powerpc64__
+	ld	r14, -144(r1)
+	ld	r15, -136(r1)
+	ld	r16, -128(r1)
+	ld	r17, -120(r1)
+	ld	r18, -112(r1)
+	ld	r19, -104(r1)
+	ld	r20, -96(r1)
+	ld	r21, -88(r1)
+	ld	r22, -80(r1)
+	ld	r23, -72(r1)
+	ld	r24, -64(r1)
+	ld	r25, -56(r1)
+	ld	r26, -48(r1)
+	ld	r27, -40(r1)
+	ld	r28, -32(r1)
+	ld	r29, -24(r1)
+	ld	r30, -16(r1)
+	ld	r31, -8(r1)
+#else
 #ifdef __BIG_ENDIAN__
 	lmw	r14, 24(r1)
 #else
-- 
2.44.0


