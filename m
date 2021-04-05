Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B96B353AC5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:26:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCgM452Bz3fDy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:26:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XlpZ+f26;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XlpZ+f26; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCXV6sv0z3c3G
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:58 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id l123so5682074pfl.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=br9KsSPqAYwn2ChgsOdZxU/P/wvzrThXCx6ps2GjyIQ=;
 b=XlpZ+f26ijm5QlRP/XaP9w28migRZBSvTlRhklIMXIA/1xbiIiVZyjkmIW5KnqYWn6
 61K5xN3hbUeSv4ILa9tHiQtxNaRo5Z7Zxr148EcPdSlT8GVmyIJ53g6plSY3sf1DV+xM
 KMX1ipJHs9ASxMdzf+/VsQB7oGartO0CZB/nLcTzkAJAQtErvF0VhcUzHUxGTfQ0pPXk
 zSe/He7O8Z7xiCyDCrm6PNWRav9bn6H9Wl4HGVUFSCpvirl0/H0zYmRpNAXe37eiEGNT
 4On7KPueRKg35vfHa6JTqHY1jMtPBoJcMfAM2rPvyvX88J73q9ERp6MfJ3FlCtbHcA1j
 dOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=br9KsSPqAYwn2ChgsOdZxU/P/wvzrThXCx6ps2GjyIQ=;
 b=q1xjXH9+MSl5+L/t2n3do1mRZwhAeTfKwOURvCB9iCVSJDZKfOvQw1REh9FgYRoJZe
 n/n2txLXB5Beapxnh4OkHDj9UudfwkQusaNm0k2cxj+jqyD6QtaL/A3rM5L90joA666x
 tmMQfpcWVCIG9+QBDZdO27xpSaYUV2I8bDXLgsNK/A5Sb03KcXpEDG1VG+Xb42OJ9Xog
 5CZzjANxzVROZDpsqJFflW4IpPhPpvIycvyVzmydMNlkHYmiuNZbc5BV29Amg24swmL0
 tAaU5fvWodP5xORPdXqch/KSMTs10lEPGeyJQUJNNuuzZs29zbdYhB0CWXm3gDoSQGgc
 C5Cg==
X-Gm-Message-State: AOAM532PpYkr7ORMdGN2a/MRPS/WVKBHSPB9TR1ljNtQRwuVZRszv1g7
 gb+JPzI3bEXl4P1cCywh0mU=
X-Google-Smtp-Source: ABdhPJwzNh485AOCMuE40Zaj15xORArf8KbiAhxqGToIMroIvkxSk2Bm8poytBRn4liBEE98JuihRQ==
X-Received: by 2002:a63:1820:: with SMTP id y32mr20950285pgl.157.1617585656491; 
 Sun, 04 Apr 2021 18:20:56 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 15/48] KVM: PPC: Book3S 64: Move hcall early register setup
 to KVM
Date: Mon,  5 Apr 2021 11:19:15 +1000
Message-Id: <20210405011948.675354-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

System calls / hcalls have a different calling convention than
other interrupts, so there is code in the KVMTEST to massage these
into the same form as other interrupt handlers.

Move this work into the KVM hcall handler. This means teaching KVM
a little more about the low level interrupt handler setup, PACA save
areas, etc., although that's not obviously worse than the current
approach of coming up with an entirely different interrupt register
/ save convention.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 13 ++++++++
 arch/powerpc/kernel/exceptions-64s.S     | 42 +-----------------------
 arch/powerpc/kvm/book3s_64_entry.S       | 30 +++++++++++++++++
 3 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index c1a8aac01cf9..bb6f78fcf981 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -35,6 +35,19 @@
 /* PACA save area size in u64 units (exgen, exmc, etc) */
 #define EX_SIZE		10
 
+/* PACA save area offsets */
+#define EX_R9		0
+#define EX_R10		8
+#define EX_R11		16
+#define EX_R12		24
+#define EX_R13		32
+#define EX_DAR		40
+#define EX_DSISR	48
+#define EX_CCR		52
+#define EX_CFAR		56
+#define EX_PPR		64
+#define EX_CTR		72
+
 /*
  * maximum recursive depth of MCE exceptions
  */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 98bf73df0f57..a23feaa445b5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -21,22 +21,6 @@
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
 
-/* PACA save area offsets (exgen, exmc, etc) */
-#define EX_R9		0
-#define EX_R10		8
-#define EX_R11		16
-#define EX_R12		24
-#define EX_R13		32
-#define EX_DAR		40
-#define EX_DSISR	48
-#define EX_CCR		52
-#define EX_CFAR		56
-#define EX_PPR		64
-#define EX_CTR		72
-.if EX_SIZE != 10
-	.error "EX_SIZE is wrong"
-.endif
-
 /*
  * Following are fixed section helper macros.
  *
@@ -1964,29 +1948,8 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 TRAMP_REAL_BEGIN(system_call_kvm)
-	/*
-	 * This is a hcall, so register convention is as above, with these
-	 * differences:
-	 * r13 = PACA
-	 * ctr = orig r13
-	 * orig r10 saved in PACA
-	 */
-	 /*
-	  * Save the PPR (on systems that support it) before changing to
-	  * HMT_MEDIUM. That allows the KVM code to save that value into the
-	  * guest state (it is the guest's PPR value).
-	  */
-BEGIN_FTR_SECTION
-	mfspr	r10,SPRN_PPR
-	std	r10,HSTATE_PPR(r13)
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-	HMT_MEDIUM
 	mfctr	r10
-	SET_SCRATCH0(r10)
-	mfcr	r10
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r10,32
-	ori	r12,r12,0xc00
+	SET_SCRATCH0(r10) /* Save r13 in SCRATCH0 */
 #ifdef CONFIG_RELOCATABLE
 	/*
 	 * Requires __LOAD_FAR_HANDLER beause kvmppc_hcall lives
@@ -1994,15 +1957,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 */
 	__LOAD_FAR_HANDLER(r10, kvmppc_hcall)
 	mtctr   r10
-	ld	r10,PACA_EXGEN+EX_R10(r13)
 	bctr
 #else
-	ld	r10,PACA_EXGEN+EX_R10(r13)
 	b       kvmppc_hcall
 #endif
 #endif
 
-
 /**
  * Interrupt 0xd00 - Trace Interrupt.
  * This is a synchronous interrupt in response to instruction step or
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index c21fa64059ef..f527e16707db 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -14,6 +14,36 @@
 .global	kvmppc_hcall
 .balign IFETCH_ALIGN_BYTES
 kvmppc_hcall:
+	/*
+	 * This is a hcall, so register convention is as
+	 * Documentation/powerpc/papr_hcalls.rst, with these additions:
+	 * R13		= PACA
+	 * guest R13 saved in SPRN_SCRATCH0
+	 * R10		= free
+	 * guest r10 saved in PACA_EXGEN
+	 *
+	 * This may also be a syscall from PR-KVM userspace that is to be
+	 * reflected to the PR guest kernel, so registers may be set up for
+	 * a system call rather than hcall. We don't currently clobber
+	 * anything here, but the 0xc00 handler has already clobbered CTR
+	 * and CR0, so PR-KVM can not support a guest kernel that preserves
+	 * those registers across its system calls.
+	 */
+	 /*
+	  * Save the PPR (on systems that support it) before changing to
+	  * HMT_MEDIUM. That allows the KVM code to save that value into the
+	  * guest state (it is the guest's PPR value).
+	  */
+BEGIN_FTR_SECTION
+	mfspr	r10,SPRN_PPR
+	std	r10,HSTATE_PPR(r13)
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+	HMT_MEDIUM
+	mfcr	r10
+	std	r12,HSTATE_SCRATCH0(r13)
+	sldi	r12,r10,32
+	ori	r12,r12,0xc00
+	ld	r10,PACA_EXGEN+EX_R10(r13)
 
 .global	kvmppc_interrupt
 .balign IFETCH_ALIGN_BYTES
-- 
2.23.0

