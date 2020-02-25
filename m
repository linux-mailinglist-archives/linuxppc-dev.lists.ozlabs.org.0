Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F2C16EE3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:42:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rnpm03G3zDqLJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CM5hMnHV; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSB2wvNzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:57 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id j17so955pjz.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oI2bC+t8AuRGbq52sEbEYp8Jpadc8xm3IMuunLlb6rk=;
 b=CM5hMnHVmHhlGSiXXE1BwMDJtitxIULVRGGLvxakNGjtUqi8R47J5gszajs8e0rhUC
 /3SDKFcPDuCU+ru2MI2R1HTS+wt/NmXrJOt2opECW6ElMhYqKB3b5L7qfR68JCiLcaHo
 zhbZHVGfkVdWEMM+IHj3q3HdfDhyD7V4CyqrIgp8jPY2KZcNMMSoxEUws75P7qSfIICg
 TPFq4YAahlT7q1w8bCzm/KPrVbh1XtEqMYHKhtafwh+DQTURssYtUJ/OIyy8u+MsiVvK
 jYC4bKyg5W8aiCYVlDrMV0mSCLLa9ilCgnxwMbPlu2DJ+n9pV04Kxw4MtmA6xsK+bVnn
 61vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oI2bC+t8AuRGbq52sEbEYp8Jpadc8xm3IMuunLlb6rk=;
 b=fVJ9/FG5SIC045aTKEQJxiWyfkNrNEV5EdWY7/X61LlXznDDJEin+Mxg09hkPmqpax
 8nR+R+U0w3JFS9qDaJFyKtef0aJ8r2IFODIVKGy0At6WB4DVFNLHLex/hWQJ+hMrV7oj
 YDM84foXdHdVWCBv9WxJyHGy+bLHvEZAKo+Q3oi+YpReNegjnHkay4YBsvtZRYo4gbRz
 i3GJksZxo8x/4+Vta22O6/kiyUkjXyQyVaejYQ2dw0vNdbMJ5x5wppSEci8HkZzYeMQz
 HHHSRj7W/Gmcq0ssaRysGDer+mCJufYyM1sZNrlhgwBwPGxuUHE+5OxEEHLOP5/04F9n
 UVqw==
X-Gm-Message-State: APjAAAXDoaD/3eBzXhddczJ9jgig75YXh71/EqdaPOuvrsj28Se95uaE
 zOBLJ/LBYV4PfdWXWyYp6SaswV/o
X-Google-Smtp-Source: APXvYqxQdlnGd/Ek/V21XcECP0XOjP90n6l1sl1sWqq+3D2i8E6LE0cE+zX4+t1IOe2yO1NAq1qROQ==
X-Received: by 2002:a17:90a:d807:: with SMTP id a7mr95847pjv.15.1582652447143; 
 Tue, 25 Feb 2020 09:40:47 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 22/32] powerpc/64s/exception: soft nmi interrupt should not
 use ret_from_except
Date: Wed, 26 Feb 2020 03:35:31 +1000
Message-Id: <20200225173541.1549955-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The soft nmi handler does not reconcile interrupt state, so it should
not return via the normal ret_from_except path. Return like other NMIs,
using the EXCEPTION_RESTORE_REGS macro.

This becomes important when the scv interrupt is implemented, which
must handle soft-masked interrupts that have r13 set to something other
than the PACA -- returning to kernel in this case must restore r13.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v3:
- save/restore irq soft mask state like other NMIs rather than a normal
  reconcile, to avoid soft mask warnings or possibly worse.

 arch/powerpc/kernel/exceptions-64s.S | 29 +++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6ff5ea236b17..5ddfc32cacad 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2713,6 +2713,7 @@ EXC_VIRT_NONE(0x5800, 0x100)
 INT_DEFINE_BEGIN(soft_nmi)
 	IVEC=0x900
 	ISTACK=0
+	IRECONCILE=0	/* Soft-NMI may fire under local_irq_disable */
 INT_DEFINE_END(soft_nmi)
 
 /*
@@ -2731,9 +2732,35 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY soft_nmi
 	bl	save_nvgprs
+
+	/*
+	 * Set IRQS_ALL_DISABLED and save PACAIRQHAPPENED (see
+	 * system_reset_common)
+	 */
+	li	r10,IRQS_ALL_DISABLED
+	stb	r10,PACAIRQSOFTMASK(r13)
+	lbz	r10,PACAIRQHAPPENED(r13)
+	std	r10,_DAR(r1)
+	ori	r10,r10,PACA_IRQ_HARD_DIS
+	stb	r10,PACAIRQHAPPENED(r13)
+
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
-	b	ret_from_except
+
+	/* Clear MSR_RI before setting SRR0 and SRR1. */
+	li	r9,0
+	mtmsrd	r9,1
+
+	/*
+	 * Restore soft mask settings.
+	 */
+	ld	r10,_DAR(r1)
+	stb	r10,PACAIRQHAPPENED(r13)
+	ld	r10,SOFTE(r1)
+	stb	r10,PACAIRQSOFTMASK(r13)
+
+	EXCEPTION_RESTORE_REGS hsrr=0
+	RFI_TO_KERNEL
 
 #endif /* CONFIG_PPC_WATCHDOG */
 
-- 
2.23.0

