Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F241D3D15C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:51:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZGr5nxjzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:51:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q557gEjC"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZx0Wn2zDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:48 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r7so1678882pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNemoAGeEM3tlgZLsG6lRdbAwTYYNe+SUGVqP3Mv7hE=;
 b=Q557gEjC6i/3nNBfKrLeK4/TUMp0VoO36EjTaDhbckyycAqP+/BTaPmXC61h8anl/m
 FKl0c5uag2YY0HMH/0xhAcAYkraw5r1FnG82D+m3hTzT9N8fyRDF9bSB/k8mXKNxXabv
 rmkANjcYTgLo1uNmaFyexwjojX1qWcx33wIoEFUpkUQ6cI17fBxL0elrQWSTpYKeXsVU
 liKucvjaqzXzigibzmS8VpYwWOI1KKmkzeLraSVfrGzkCXyi3YMBj0y+6IsRYNL+1a8L
 +HHU2Ku5xCNWqyWuOYpE2f+oUSDc9c+BAS/qjqJH+6YUoBS5mPUG5LZmyDlJuz1oy183
 Z+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNemoAGeEM3tlgZLsG6lRdbAwTYYNe+SUGVqP3Mv7hE=;
 b=uQSTDv3ijTEG8D+y5+efeTOJ4Iwi1mUlxyOIIeKCT2hFM1GJDo4UQ8knIVz+YwGBuf
 5aV+T2kTK6kazy6QyBL8xXR6BVkUA+NIU7oaAlo0a+hFzS9+wfl9Otwui00El154VPGJ
 xonPQooijS5cwzKeCwPHnwn1sNcFneEasb+iOdsuHaNzRD1iBZs0Kd3kUKQ/oyUwGA6P
 Iiij+te8a+8O0GMoGKLgJB+bQ7F9X8pnRKqqFefDmiJwTs4dNCRbfaRae33cj3Gu9XM9
 lQz6x3zjBwUMuicaukzXseqPBIM1g8muaf5q2l+cNFc6cZa2MXcZzyBPXD2GXJqxosos
 b8aw==
X-Gm-Message-State: APjAAAVRNItWe3ZKL7eLUJj/9d2lNDUPHEPtajREhM/QqsRckLOG+p6b
 q/w+k0A1h/S+zR0TlgAGkiEuQD9p
X-Google-Smtp-Source: APXvYqy3pyNTHptyX3VYcliNRflVquEKvD2u3Akqh635pUVISNvj7tGCT6gDeJholkcqf25tLxrF9w==
X-Received: by 2002:a17:90a:25af:: with SMTP id
 k44mr26556711pje.122.1560263686541; 
 Tue, 11 Jun 2019 07:34:46 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 27/28] powerpc/64s/exception: clean up system call entry
Date: Wed, 12 Jun 2019 00:30:39 +1000
Message-Id: <20190611143040.7834-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index c1075bbe4677..d9e531a00319 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1643,10 +1643,8 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
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
@@ -1658,11 +1656,13 @@ BEGIN_FTR_SECTION
 	beq-	1f
 END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 #endif
-	/* We reach here with PACA in r13, r13 in r9, and HMT_MEDIUM. */
-
-	.if \real
+	/* We reach here with PACA in r13, r13 in r9. */
 	mfspr	r11,SPRN_SRR0
 	mfspr	r12,SPRN_SRR1
+
+	HMT_MEDIUM
+
+	.if \real
 	__LOAD_HANDLER(r10, system_call_common)
 	mtspr	SPRN_SRR0,r10
 	ld	r10,PACAKMSR(r13)
@@ -1670,24 +1670,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
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

