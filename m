Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C22464F5EC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 15:40:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WGrc6Z7xzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 23:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LoFLcSlP"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKQ1K2TzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:26 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id c14so4349748plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rfYqQJOk+rg2uqgQRpiWBqdnSRkNbuMsk4rf/Lyzoeg=;
 b=LoFLcSlPXl04Nmyh/8kYeL1KTMI09PK0lvgBDVsBCAgdoRMZTIytpMzgk2tF/qcpEo
 HaPjbtyBFYqH+PCEV4ndDNMatbkR7sTZ2AIYXyL6tU2lDdB4Uo9LD4OgK9Ew+iCIgzjl
 nqgc8Cwc4b03c/cfT7yH5a8cdSROrkDDd7lsIg6zDve8NA8po3dlb0/BcPBfUWoPHqIt
 j99h+HbBHP1X4XJrEvZTgwc742wfFxUQaHWxx32RMM5KBrMNuqZA0/sa+AZmCiiSpuVt
 DBxq9F1txL5VWpyIZZi/WFsI5PfD09l9VYq1IQnvEQxDIONOek7NKzD0dZGbCZiZWebN
 4g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rfYqQJOk+rg2uqgQRpiWBqdnSRkNbuMsk4rf/Lyzoeg=;
 b=El9+AU6W8XcQj0qz9Ym7m/VEwbcDsuJgrQ646jvvrbk33CTniV66qZFXeJOnrQlULN
 pSuEtVMtXFL4YVEkGo9VSkXd108tHOtkDL/LT+YFlXG6USN4MYJGQyrrC5TiTW8vuftm
 lD+xBLF4yKh6VGA5ewNCrC11DdXW3BYvWcHjLmTk79fmZmnzk/CTFTnt9msUh62Ul8IQ
 dpwduCrWyaTPDbJpSPF1h9gNkZ49K92NzSoegMkj14Y82BoghIE8vL5om2U+VcWN8Wac
 wtxMG7YUkoBLihh1kKSbCQTfHFsYvzJ/9eXLo1FvrloEOnCigyaoluxa6kgXBtlkSlu3
 KowQ==
X-Gm-Message-State: APjAAAXw0vCMf7v3g/VIlu1ivYN03cN8NF+24ssZ1pkTpuRwGehQbyKQ
 nv8kG3U+kg7ShT0GdxrnvYdpPu9VTuk=
X-Google-Smtp-Source: APXvYqxpgAfZrN2g0XpQIvL6oE8q9Jo0sI5RwjEbroBnEm9KL5qJJGTF0vur622EgZgtiSd/U+LPfw==
X-Received: by 2002:a17:902:2ae7:: with SMTP id
 j94mr52926257plb.270.1561209383611; 
 Sat, 22 Jun 2019 06:16:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/25] powerpc/64s/exception: merge KVM handler and skip
 variants
Date: Sat, 22 Jun 2019 23:15:17 +1000
Message-Id: <20190622131535.20996-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622131535.20996-1-npiggin@gmail.com>
References: <20190622131535.20996-1-npiggin@gmail.com>
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

Conditionally expand the skip case if it is specified.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 28 +++++++++---------------
 arch/powerpc/include/asm/head-64.h       |  8 +++----
 arch/powerpc/kernel/exceptions-64s.S     |  2 +-
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 74ddcb37156c..737c37d1df4b 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -431,26 +431,17 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.endif
 .endm
 
-.macro KVM_HANDLER area, hsrr, n
+.macro KVM_HANDLER area, hsrr, n, skip
+	.if \skip
+	cmpwi	r10,KVM_GUEST_MODE_SKIP
+	beq	89f
+	.else
 	BEGIN_FTR_SECTION_NESTED(947)
 	ld	r10,\area+EX_CFAR(r13)
 	std	r10,HSTATE_CFAR(r13)
 	END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
-	BEGIN_FTR_SECTION_NESTED(948)
-	ld	r10,\area+EX_PPR(r13)
-	std	r10,HSTATE_PPR(r13)
-	END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
-	ld	r10,\area+EX_R10(r13)
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r9,32
-	ori	r12,r12,(\n)
-	/* This reloads r9 before branching to kvmppc_interrupt */
-	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
-.endm
+	.endif
 
-.macro KVM_HANDLER_SKIP area, hsrr, n
-	cmpwi	r10,KVM_GUEST_MODE_SKIP
-	beq	89f
 	BEGIN_FTR_SECTION_NESTED(948)
 	ld	r10,\area+EX_PPR(r13)
 	std	r10,HSTATE_PPR(r13)
@@ -461,6 +452,8 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	ori	r12,r12,(\n)
 	/* This reloads r9 before branching to kvmppc_interrupt */
 	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
+
+	.if \skip
 89:	mtocrf	0x80,r9
 	ld	r9,\area+EX_R9(r13)
 	ld	r10,\area+EX_R10(r13)
@@ -469,14 +462,13 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.else
 	b	kvmppc_skip_interrupt
 	.endif
+	.endif
 .endm
 
 #else
 .macro KVMTEST hsrr, n
 .endm
-.macro KVM_HANDLER area, hsrr, n
-.endm
-.macro KVM_HANDLER_SKIP area, hsrr, n
+.macro KVM_HANDLER area, hsrr, n, skip
 .endm
 #endif
 
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 4767d6c7b8fa..518d9758b41e 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -387,22 +387,22 @@ end_##sname:
 
 #define TRAMP_KVM(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER area, EXC_STD, n
+	KVM_HANDLER area, EXC_STD, n, 0
 
 #define TRAMP_KVM_SKIP(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER_SKIP area, EXC_STD, n
+	KVM_HANDLER area, EXC_STD, n, 1
 
 /*
  * HV variant exceptions get the 0x2 bit added to their trap number.
  */
 #define TRAMP_KVM_HV(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n + 0x2
+	KVM_HANDLER area, EXC_HV, n + 0x2, 0
 
 #define TRAMP_KVM_HV_SKIP(area, n)					\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER_SKIP area, EXC_HV, n + 0x2
+	KVM_HANDLER area, EXC_HV, n + 0x2, 1
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index fe6242453f62..26d1873085b6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1063,7 +1063,7 @@ TRAMP_KVM_BEGIN(do_kvm_0xc00)
 	SET_SCRATCH0(r10)
 	std	r9,PACA_EXGEN+EX_R9(r13)
 	mfcr	r9
-	KVM_HANDLER PACA_EXGEN, EXC_STD, 0xc00
+	KVM_HANDLER PACA_EXGEN, EXC_STD, 0xc00, 0
 #endif
 
 
-- 
2.20.1

