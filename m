Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F51D2F818B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:06:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHSJJ2HxxzDsmT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:06:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mOK+wjja; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRyG0pJwzDshk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:50:45 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 30so6356873pgr.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdbQbTHDRwvbTiQO6AXAh8//qCWM33ifWUyxgxbxBP4=;
 b=mOK+wjja5yJ7Cj2qUQCAfR8htxlFSEOX7PmwhJeeQZ/8T421DLTBVMFmYsAo2IIm7M
 SkRL1AvSv9X8mLIVBfqjMzsp7UL4hhP9xP+xWl+GPqHCD2GE7PT/keREsSbh3cmtMhyv
 QPUaErUNm5oViu1fkyzvSIoQnR/xxMy7K1MbjHiMNSQKetHE/RP2P7kJVBFB8a1eceZ5
 PdRzaaMPgYiD1eLF3UlaovssB+00OB+r2HaNOSAq7wo6VjSpIvddWTy+8sBuh0THLgaL
 U20oMcv6kwUGZLbHD692lKEvE6gNNPFu+LqZQo5yGbDZc/xuSmdG4mmPDqBi4LvbXbvj
 jBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdbQbTHDRwvbTiQO6AXAh8//qCWM33ifWUyxgxbxBP4=;
 b=qNojgwE6sTvYYCmy1sLGrhB0onU6l+gABQd5/ji+GbTjAzxsLoqXlOa9XOEMMSoKq9
 fbY7cfyQ6TFqFDTg6tP92zaYcWsVv6AQ5PVsXgtimR1qYo/H9ADnR90DKo5UkOGQNq8C
 fOKqPUxT7Re7ftmFkbYoKcbiqz/t/fIafofDv/PDEPaeLeNLaTwaeA8Y3BETPHmLHNf1
 9VOUl0krX/YTXSLA6zU9V5dHXGOsJeq+gIK5eZNCc3K+1TDC7vdnc0ClnwkraqUIUzXD
 t+OjBs0OfWNfRmVIq0fKk67P+vQEd4H1E/2EBeavbhhg3JgyoK7CyiLvOm72QQ9Dz3kW
 DuLw==
X-Gm-Message-State: AOAM530zTn5MLmoBpm9xLhlmPDbo9mC/auWQR1J+bE85SzSIg1soSt8Z
 zsQ00V11yHf3oWSVD8tb10aYh6x6mRc=
X-Google-Smtp-Source: ABdhPJwKh6nkLSL8S3gguR82ktcnrR7tc2/buXNf0PLivZ4iTyGihi6PAjdxR/0Xf/VxUGjGsz+9EA==
X-Received: by 2002:a65:498e:: with SMTP id r14mr13549565pgs.235.1610729442648; 
 Fri, 15 Jan 2021 08:50:42 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:50:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 07/39] powerpc: bad_page_fault get registers from regs
Date: Sat, 16 Jan 2021 02:49:40 +1000
Message-Id: <20210115165012.1260253-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to the previous patch this makes interrupt handler function
types more regular so they can be wrapped with the next patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h             |  5 +++--
 arch/powerpc/kernel/entry_32.S             |  3 +--
 arch/powerpc/kernel/exceptions-64e.S       |  3 +--
 arch/powerpc/kernel/exceptions-64s.S       |  4 +---
 arch/powerpc/kernel/traps.c                |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
 arch/powerpc/mm/book3s64/slb.c             |  2 +-
 arch/powerpc/mm/fault.c                    | 13 ++++++++++---
 arch/powerpc/platforms/8xx/machine_check.c |  2 +-
 9 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index f7827e993196..8f09ddae9305 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -112,8 +112,9 @@
 
 struct pt_regs;
 long do_page_fault(struct pt_regs *);
-extern void bad_page_fault(struct pt_regs *, unsigned long, int);
-void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig);
+void bad_page_fault(struct pt_regs *, int);
+void __bad_page_fault(struct pt_regs *regs, int sig);
+void do_bad_page_fault_segv(struct pt_regs *regs);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
 extern void die(const char *, struct pt_regs *, long);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index d6ea3f2d6cc0..b102b40c4988 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -672,9 +672,8 @@ handle_page_fault:
 	lwz	r0,_TRAP(r1)
 	clrrwi	r0,r0,1
 	stw	r0,_TRAP(r1)
-	mr	r5,r3
+	mr	r4,r3		/* err arg for bad_page_fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	lwz	r4,_DAR(r1)
 	bl	__bad_page_fault
 	b	ret_from_except_full
 
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 43e71d86dcbf..52421042a020 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1018,9 +1018,8 @@ storage_fault_common:
 	bne-	1f
 	b	ret_from_except_lite
 1:	bl	save_nvgprs
-	mr	r5,r3
+	mr	r4,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r4,_DAR(r1)
 	bl	__bad_page_fault
 	b	ret_from_except
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 839dcb94eea7..b90d3cde14cf 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2151,9 +2151,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
 	GEN_COMMON h_data_storage
 	addi    r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
-	ld	r4,_DAR(r1)
-	li	r5,SIGSEGV
-	bl      bad_page_fault
+	bl      do_bad_page_fault_segv
 MMU_FTR_SECTION_ELSE
 	bl      unknown_exception
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3ec7b443fe6b..f3f6af3141ee 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1612,7 +1612,7 @@ void alignment_exception(struct pt_regs *regs)
 	if (user_mode(regs))
 		_exception(sig, regs, code, regs->dar);
 	else
-		bad_page_fault(regs, regs->dar, sig);
+		bad_page_fault(regs, sig);
 
 bail:
 	exception_exit(prev_state);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 9a499af3eebf..1a270cc37d97 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1539,7 +1539,7 @@ long do_hash_fault(struct pt_regs *regs)
 	 * the access, or panic if there isn't a handler.
 	 */
 	if (unlikely(in_nmi())) {
-		bad_page_fault(regs, ea, SIGSEGV);
+		bad_page_fault(regs, SIGSEGV);
 		return 0;
 	}
 
@@ -1578,7 +1578,7 @@ long do_hash_fault(struct pt_regs *regs)
 			else
 				_exception(SIGBUS, regs, BUS_ADRERR, ea);
 		} else {
-			bad_page_fault(regs, ea, SIGBUS);
+			bad_page_fault(regs, SIGBUS);
 		}
 		err = 0;
 
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 985902ce0272..c581548b533f 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -874,7 +874,7 @@ void do_bad_slb_fault(struct pt_regs *regs)
 		if (user_mode(regs))
 			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
 		else
-			bad_page_fault(regs, regs->dar, SIGSEGV);
+			bad_page_fault(regs, SIGSEGV);
 	} else if (err == -EINVAL) {
 		unrecoverable_exception(regs);
 	} else {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 273ff845eccf..e476d7701413 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -566,7 +566,7 @@ NOKPROBE_SYMBOL(do_page_fault);
  * It is called from the DSI and ISI handlers in head.S and from some
  * of the procedures in traps.c.
  */
-void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
+void __bad_page_fault(struct pt_regs *regs, int sig)
 {
 	int is_write = page_fault_is_write(regs->dsisr);
 
@@ -604,7 +604,7 @@ void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 	die("Kernel access of bad area", regs, sig);
 }
 
-void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
+void bad_page_fault(struct pt_regs *regs, int sig)
 {
 	const struct exception_table_entry *entry;
 
@@ -613,5 +613,12 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 	if (entry)
 		instruction_pointer_set(regs, extable_fixup(entry));
 	else
-		__bad_page_fault(regs, address, sig);
+		__bad_page_fault(regs, sig);
 }
+
+#ifdef CONFIG_PPC_BOOK3S_64
+void do_bad_page_fault_segv(struct pt_regs *regs)
+{
+	bad_page_fault(regs, SIGSEGV);
+}
+#endif
diff --git a/arch/powerpc/platforms/8xx/machine_check.c b/arch/powerpc/platforms/8xx/machine_check.c
index 88dedf38eccd..656365975895 100644
--- a/arch/powerpc/platforms/8xx/machine_check.c
+++ b/arch/powerpc/platforms/8xx/machine_check.c
@@ -26,7 +26,7 @@ int machine_check_8xx(struct pt_regs *regs)
 	 * to deal with that than having a wart in the mcheck handler.
 	 * -- BenH
 	 */
-	bad_page_fault(regs, regs->dar, SIGBUS);
+	bad_page_fault(regs, SIGBUS);
 	return 1;
 #else
 	return 0;
-- 
2.23.0

