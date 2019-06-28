Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7007559379
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:36:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zlqq0x2szDqsH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:36:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WRVb1jMF"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZlmS6wKLzDqmQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:28 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id k8so2584044plt.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQhOiMpmSnzXfxwhJI1elHAszoEBmDXuEMTUMFV8hlY=;
 b=WRVb1jMF4hqRZMQ0DT74zqJllM+Mt4XSCAsVMroCit+7Ga7RRHCHn4rvaJm7P4DyOU
 yY08wqcnzx8EPEXxEwTqTKcYsW91iOENSiv+c5P42GaCNCVwPZdFs7y8AlN4bnWg3k4y
 iocVyVYbDJ5iOcRIJ2bPyZlr/lz2r/qFyfcWOHp4iGmpfa5lksOX8BPM+WOHEX5EOgG+
 zHykeF+1Xd32HNaCGHXnj+jjZvaUuLrwagcar5Knh/uPoXEFBNOXhWS9JjxgTgjQuVU1
 tPEQ3YUB8hZY+woqB5yEOyc+nilf7NyDA4hJNw/rPsBB6+FrlgRrEqz1LzGbnJy5Db3l
 wfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQhOiMpmSnzXfxwhJI1elHAszoEBmDXuEMTUMFV8hlY=;
 b=StqUPahDrrF2TZ6lsu80UvCdTVM+2Fu09GIpdg1zEIcbZO16cHCtKn4X2ThVkWgpMn
 j7ZS07Zq777rDD1qcYISIVi+5h8ErX4dDbkJ1ALsBJpulYEOxMwDefNQXoAjo3eajMrS
 P341DZcGkaWbq0dADfKtg8WtZ9rKdyXdXYNnx5L2I4lnqh8x7VdbmmJ5FPXA7nCAyC2J
 s0u5TgdCh14+hvcM15Xgutl7iJXpRiwrWDbgeVGMMvs31tJnylFjy4FXGQ3RCHfYG1IM
 QEneLuHK0Pj6/anyTAyMuIsI/4ZzF1YBooqj8STeKZ7qHuBwTeWtYIPBEHF7VDzvZ/2J
 Qndg==
X-Gm-Message-State: APjAAAViv5FO5liGGaizSPgrl+aiTjKT4G2gHirwhEO9G0K5jC1b4O/y
 rPkHL2JDgo0Zf4SFKgnlHBEiGk04
X-Google-Smtp-Source: APXvYqx5YmjCRcbaJW3fKZgE/1etk0XY8DG4WJiEWrjzJ5Ev6n4qyXSmdrT0iwIujkzQH7KIS9CGZA==
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr9567900plk.14.1561700006655; 
 Thu, 27 Jun 2019 22:33:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 01/13] powerpc/64s/exception: clean up system call entry
Date: Fri, 28 Jun 2019 15:33:20 +1000
Message-Id: <20190628053332.22366-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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

syscall / hcall entry unnecessarily differs between KVM and non-KVM
builds. Move the SMT priority instruction to the same location
(after INTERRUPT_TO_KERNEL).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f51b3a5fd110..98321ded8df6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1638,10 +1638,8 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
 	std	r10,PACA_EXGEN+EX_R10(r13)
 	INTERRUPT_TO_KERNEL
 	KVMTEST EXC_STD 0xc00 /* uses r10, branch to do_kvm_0xc00_system_call */
-	HMT_MEDIUM
 	mfctr	r9
 #else
-	HMT_MEDIUM
 	mr	r9,r13
 	GET_PACA(r13)
 	INTERRUPT_TO_KERNEL
@@ -1653,11 +1651,14 @@ BEGIN_FTR_SECTION
 	beq-	1f
 END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 #endif
-	/* We reach here with PACA in r13, r13 in r9, and HMT_MEDIUM. */
 
-	.if ! \virt
+	/* We reach here with PACA in r13, r13 in r9. */
 	mfspr	r11,SPRN_SRR0
 	mfspr	r12,SPRN_SRR1
+
+	HMT_MEDIUM
+
+	.if ! \virt
 	__LOAD_HANDLER(r10, system_call_common)
 	mtspr	SPRN_SRR0,r10
 	ld	r10,PACAKMSR(r13)
@@ -1665,24 +1666,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
 	.else
+	li	r10,MSR_RI
+	mtmsrd 	r10,1			/* Set RI (EE=0) */
 #ifdef CONFIG_RELOCATABLE
-	/*
-	 * We can't branch directly so we do it via the CTR which
-	 * is volatile across system calls.
-	 */
 	__LOAD_HANDLER(r10, system_call_common)
 	mtctr	r10
-	mfspr	r11,SPRN_SRR0
-	mfspr	r12,SPRN_SRR1
-	li	r10,MSR_RI
-	mtmsrd 	r10,1
 	bctr
 #else
-	/* We can branch directly */
-	mfspr	r11,SPRN_SRR0
-	mfspr	r12,SPRN_SRR1
-	li	r10,MSR_RI
-	mtmsrd 	r10,1			/* Set RI (EE=0) */
 	b	system_call_common
 #endif
 	.endif
-- 
2.20.1

