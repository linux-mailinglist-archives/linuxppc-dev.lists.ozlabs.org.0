Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D93649CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:38:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kNcp1BmRzDqVC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:38:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A7Yj6qnB"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNH00VkkzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:22:51 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id cl9so1392114plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPpgYhewlwO9TqQ03LrhR75ijbMW8NzdnCXiXDw1zFM=;
 b=A7Yj6qnBQ0TtBit/fAbXe4yeZpS+l282AUSGj1dDpjQ/yFfv5U/1Qg0vaio05zCt3d
 ViaqnQ1b4MHoN16o+lPdeG+b25cHp5fTwS+QY9wtcAf32ZljQVJ+R9aK6fx2eTBgPdOB
 aZCd80ZFvLfh9T2GX7WrwimwsS5XVTTaC7SdRsPYU9TV7HtIojYsnjoEQ2zbEyfw0f2I
 +BRmIS4txhBbtBUeu3wId0wGPLEVXpq4Z2OzUS3cGM3dhRBDiln7osCSdLp5QFou2g8K
 6AKRfPsGz1hAxhpO4rdBjlZQjTPrrNQm2zn4VP4ZBengiGrD+Zgg+Q+pz7QeBSYIwFkH
 K0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPpgYhewlwO9TqQ03LrhR75ijbMW8NzdnCXiXDw1zFM=;
 b=rbe8n8eEZEUebNA9hUiK3NMDW96sLudmOfN5HpkkcZMkxKaGU9J7nxsdMP62WWz0KG
 L7u3UJ0lekE245I/GLenqYsQwBbETbsIwv6oH1dAu6L7+rSld2RHIQMXBXbH8eYrcDJ1
 M4zyGLCQEGyK7N7zWIuti1aWS/xONDo1VZiCxY4Pct6z/x8+S66XdXJpM1q55iyayCc9
 6ullxAu/Atm2gsJVcY8Xhj/DQ14NY1Xo9nIVJ/8HWeqUenA/omJ51H2BIRmlBpXGVIOY
 uI7UMLfHgU/O9tSDE6suuawNmLawYUHa73GLh2Ld9udJb+2OmgYsLUe9Kq+NKZ3lFES8
 cL1Q==
X-Gm-Message-State: APjAAAUkJxP4lNQZ3q1MzTnEcKc9Hj15CvxLgnracv6Fr6ixtnVnvWql
 GC+h7UkdlUitxGfs3yLaq21GdqcOkLM=
X-Google-Smtp-Source: APXvYqw9JF74s/sRPkpsCrVs+VlMxiq3Z4jdXFzOjpXZbT4rNd39w8pDIzShexPk5u1NSF/Vxj881w==
X-Received: by 2002:a17:902:a50d:: with SMTP id
 s13mr39800271plq.12.1562772169241; 
 Wed, 10 Jul 2019 08:22:49 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.22.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:22:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/16] powerpc/64s/exception: machine check fix KVM guest
 test
Date: Thu, 11 Jul 2019 01:19:37 +1000
Message-Id: <20190710151950.31906-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The machine_check_handle_early hypervisor guest test is skipped if
!HVMODE or MSR[HV]=0, which is wrong for PR or nested hypervisors
that could be running a guest in this state.

Test HSTATE_IN_GUEST up front and use that to branch out to the KVM
handler, then MSR[PR] alone can test for this kernel's userspace.
This matches all other interrupt handling.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 33 +++++++++++-----------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e8734a1dfdb9..5789a00691f9 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1108,11 +1108,8 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
-BEGIN_FTR_SECTION
-	b	4f
-END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 
-#ifdef	CONFIG_PPC_P7_NAP
+#ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * Check if thread was in power saving mode. We come here when any
 	 * of the following is true:
@@ -1128,30 +1125,26 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
-	/*
-	 * Check if we are coming from hypervisor userspace. If yes then we
-	 * continue in host kernel in V mode to deliver the MC event.
-	 */
-	rldicl.	r11,r12,4,63		/* See if MC hit while in HV mode. */
-	beq	5f
-4:	andi.	r11,r12,MSR_PR		/* See if coming from user. */
-	bne	9f			/* continue in V mode if we are. */
-
-5:
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-BEGIN_FTR_SECTION
 	/*
-	 * We are coming from kernel context. Check if we are coming from
-	 * guest. if yes, then we can continue. We will fall through
-	 * do_kvm_200->kvmppc_interrupt to deliver the MC event to guest.
+	 * Check if we are coming from guest. If yes, then run the normal
+	 * exception handler which will take the do_kvm_200->kvmppc_interrupt
+	 * branch to deliver the MC event to guest.
 	 */
 	lbz	r11,HSTATE_IN_GUEST(r13)
 	cmpwi	r11,0			/* Check if coming from guest */
 	bne	9f			/* continue if we are. */
-END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 #endif
+
+	/*
+	 * Check if we are coming from userspace. If yes, then run the normal
+	 * exception handler which will deliver the MC event to this kernel.
+	 */
+	andi.	r11,r12,MSR_PR		/* See if coming from user. */
+	bne	9f			/* continue in V mode if we are. */
+
 	/*
-	 * At this point we are not sure about what context we come from.
+	 * At this point we are coming from kernel context.
 	 * Queue up the MCE event and return from the interrupt.
 	 * But before that, check if this is an un-recoverable exception.
 	 * If yes, then stay on emergency stack and panic.
-- 
2.20.1

