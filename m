Return-Path: <linuxppc-dev+bounces-2142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1687199B097
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 06:01:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQVCH4htHz3c2Z;
	Sat, 12 Oct 2024 15:00:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728705643;
	cv=none; b=hER3AycS5joh6r1S0EreMIHWFXxM5GoneubjvME0KOZSaXMqlpVP9XcPNSzqmy1pW2TjP6QQCliO1OkhIawoEZDWJka4U5MM68bDunVQExyM3Bxb/5x/JKuDPcT4i4fcQcOnA3d8u6n2UU+kUecS4BZ/acIupunKAVvc8dEUFTST81Mn+2DGGshvU5Luh2iXTMFk+pV8l1O5VHtswL5VrkWW2s6h284CiG1HkXyfjZKiDh7zrR8wrg2Tda1/dcf7RLQoZ4gBkSyqgp1PAS5iG8zXeo3EwYehgdI2OEyTk4PO5TiroKI540huywEtL9Mk6AKlPThWP/RpubFNal1toQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728705643; c=relaxed/relaxed;
	bh=eyyEVKnFPIOmLpG59dqdis94/r8vs+rZ71m2iCPLJR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OV48gHHzA0YXUVwP22N07LeRZ0q9meHDDH1QC5d/SwvgNGo/uUdfVwSgURkr5WGgYt7aFXlxt6T6GL3XQWubOF22uJDCAWWy6V9hdmF/FVndHKF8xRg7mEsZ4l0P/xpiuPL5dCRzDfh6TOKza3Eae2vM5OZ9Z2fpKSu0/etUxjeRxgJLgmtqnkwSwTWpyHaEO8GLlqEjp72yjYo2JoIrx2VyBIT2TZwNUTwXhEyiRhy3npN5M8WYMjw6n+UrzuuXQvezFFZ8DY2EQk6r6CR6d41jQuW7G903WPVHn3jlDLRqXIdDsVmS5rqeKHcIDIUEfvDRqaNcpHC7t5HiibVFkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQVCG53xlz3c44
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 15:00:42 +1100 (AEDT)
X-QQ-mid: bizesmtpsz3t1728705590tix6yq9
X-QQ-Originating-IP: 7dovD3jhNT7oLVB7Pph9jMXcYEGF/4SIvx2PoU5BIfk=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 12 Oct 2024 11:59:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6310943489994141295
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH 7/7] powerpc/entry: fix 32bit compile issue for common entry
Date: Sat, 12 Oct 2024 11:56:21 +0800
Message-ID: <837E79EAF5C5A04B+20241012035621.1245-9-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20241012035621.1245-3-luming.yu@shingroup.cn>
References: <20241012035621.1245-3-luming.yu@shingroup.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MO/I+lLomKsDqFHgzhl8CdB6J2fVDe+gm2ma9vRErAsYkMJnYqOvT4wj
	EFBxhV44Swsj9sIO/9Fh4mPA22/onMta5QMWWaT/rrpcOspj7dDHz3GFTOCLX0B4IJOItvk
	SacsQgxZc/RnQxHUAQzV/rDYvCdM7qaG1DSRIYgWR6LjZyXl1sGhreQQwnJvO/HZqVGoGLh
	1OxNlLaq4eyvmYuT5s5SeGfqXB9ZqBBm5T8qoI6UJaWchf2Og0fNrKNPc6O61EUrGtBmrc9
	cZzvk9Bde75Tke4uyZDvgrZR+L9hx/zAIil2QmQq6PHkmDFT8YgCH9SUSFjRUKt+iHOh55F
	a1/ROWlXZ/r1wFOe+EtDQWn86fesqFWAOthTaEk/UppApLqwMclNsdtOowYpVwMUaPkvpCT
	xWHmNRhHOiJpljY4oI5knvgB5PoxYfads3/sTPfYtpV0x6bdVs51YSRSax3+4QE8ckIGGeU
	nge1YsQYvn4igKW1lbeY9gtaWSfFxlL5he3LPZjWhzwMBPcqFqSnztzXJ9jKe0NS2RqZnpX
	U8/3RFI6DjGtvoKvrHrsdx/bBWeO688fi0CNnYf4JdqXEHiKm7QjglDXj/pobc9R1F1GsVx
	CG72bvmpqM1vXvzhLDDhchwmnrQ1Zl81ae/oclwrH0056L3Ik1Y3X6MHnyMsck1n3A38GIf
	gDhf4YQ+GJ0bT8E+xZeyBN3xZrQqfkiibCFX5EQUZP1Uvxg6psvZWvuH73hclStJ3XaH87g
	yJ17FiFRdRRiXOTJbGHHKYxgV9qfb53ZFv2X3txY+3kmFOZEQ+i1a6q/RtjpaC2wWf7zhJ5
	AjeaRghohpFjVZmB3J+GNsPMyk9ypP+nNn/UrFy5+4FI+EPUEM5MRBkn/faQ9Z1fNgnLNTe
	28jZn9h8ukF0J1vXCiyOJsI9Vf7+zUfgDunQipGuZFK7uC3SsiGWO/9At377yxDJJ8wQ1ZL
	SLY8lPFxQ2PgvN1PIpZxouN2Ky2bsoVUKFbE=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

fix irqentry in 32bit code path and hw_irq helpers.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/include/asm/hw_irq.h | 6 ++++++
 arch/powerpc/kernel/interrupt.c   | 4 ++++
 include/linux/entry-common.h      | 1 +
 3 files changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index a3d591784c95..99104f95e1d7 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -469,6 +469,12 @@ static inline bool arch_irqs_disabled(void)
 	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
+/*for common entry*/
+static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
+{
+	return arch_irqs_disabled();
+}
+
 #define hard_irq_disable()		arch_local_irq_disable()
 
 static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 8e4cabb0c592..31167700f894 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -311,7 +311,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 	BUG_ON(regs_is_unrecoverable(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
+#ifdef CONFIG_PPC64
 	local_paca->irqentry_s = irqentry_enter(regs);
+#endif
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -424,7 +426,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	 * AMR value from the check above.
 	 */
 	kuap_kernel_restore(regs, kuap);
+#ifdef CONFIG_PPC64
 	irqentry_exit(regs, local_paca->irqentry_s);
+#endif
 
 	return ret;
 }
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 6521171469f2..b68eada65a8a 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -8,6 +8,7 @@
 #include <linux/seccomp.h>
 #include <linux/sched.h>
 
+#include <linux/irqentry-state.h>
 #include <asm/entry-common.h>
 
 /*
-- 
2.42.0.windows.2


