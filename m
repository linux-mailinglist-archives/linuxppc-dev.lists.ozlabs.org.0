Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E9C371423
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 13:17:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYgS72RJgz30CC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 21:17:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kRaQqUes;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kRaQqUes; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYgRg5pWkz2xZB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 21:17:17 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id b21so2624692plz.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=krG94cuP8AG+F9dfZcu8mi+I3MLc9hSlR5ZOi1BEiJI=;
 b=kRaQqUesvByNZitXZjVqyJT6D23vyTAI9uklfx2UJrHZ70hhFDwkwho9G+9BT59sTG
 DTJY8Hhq4I+e7D4KnbqRozSlTtJaihcqif3IPwuUDY2V5+YOje98Nt60KPcRkAdt+Q4o
 1OI4PvNsRR8nTvdbmh3doV39W2AlXPI8CIZid8QgGpsZzTTor4IpHTs4pt460N5su+DZ
 ts6qrAP3w4LiVd6hBdcHfOR0cn5LFAAZOa0cewDJ3qnp+jz/qedlo5l8AGnxr8XppbAs
 t5FIg2GcAvAqz89lLwZR28Ffp916jOFEXwtSuYUH+YEOrfUQvmq7sxDVoriO+eCqfIr+
 KTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=krG94cuP8AG+F9dfZcu8mi+I3MLc9hSlR5ZOi1BEiJI=;
 b=IerUgjXMI4Y9FICqqxmyiUky6O81swbNin1MbJ2BrhCiYNh+3AuVPGd+Bj6/Z0+mUJ
 sRQ+BJzu0jlpq37DyW9AFR/lHoSfinn/pEP52R3mSOT/gecID4fNOX1IQbUr9OBnI0EU
 pe4jUsnfKScKacTD1CHth8IH1rKy4Jk6uC6NoC6ZbTOB3+kDLrMNQXgvW2ijWCkKcXaY
 X0EWdqAMZxETALkFbsbUCKVnj0SKcBi7uZWsuCAtqoBWraf0o8bIOe60bhrfn5byqzFA
 D589Lwn1Ybne/D/8LZn3ALWrA6YcDM4wudPcoF8udyQIKd2hDbbHYnbyc0f+YsPUpvpD
 T1Cw==
X-Gm-Message-State: AOAM530rDXvFTfwBLq0BNRSBduRBIgUh35Or7kY4zkqtsPlxOg2gJ0Dk
 AXJNLJYoT3r3ufkfSiN5RkFkHw+2BpI=
X-Google-Smtp-Source: ABdhPJwVY5aj6c4dqUv/k7RXB0vxWsjm72vkSoXN66dAV9aFmKC/q5Vg2bijP+nKs7vjkgEoL/XqOg==
X-Received: by 2002:a17:90a:9203:: with SMTP id
 m3mr10893542pjo.21.1620040634214; 
 Mon, 03 May 2021 04:17:14 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id a7sm5350379pfo.211.2021.05.03.04.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:17:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Make NMI record implicitly soft-masked code as
 irqs disabled
Date: Mon,  3 May 2021 21:17:08 +1000
Message-Id: <20210503111708.758261-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

scv support introduced the notion of code that implicitly soft-masks
irqs due to the instruction addresses. This is required because scv
enters the kernel with MSR[EE]=1.

If a NMI (including soft-NMI) interrupt hits when we are implicitly
soft-masked then its regs->softe does not reflect this because it is
derived from the explicit soft mask state (paca->irq_soft_mask). This
makes arch_irq_disabled_regs(regs) return false.

This can trigger a warning in the soft-NMI watchdog code (shown below).
Fix it by having NMI interrupts set regs->softe to disabled in case of
interrupting an implicit soft-masked region.

  ------------[ cut here ]------------
  WARNING: CPU: 41 PID: 1103 at arch/powerpc/kernel/watchdog.c:259 soft_nmi_interrupt+0x3e4/0x5f0
  CPU: 41 PID: 1103 Comm: (spawn) Not tainted
  NIP:  c000000000039534 LR: c000000000039234 CTR: c000000000009a00
  REGS: c000007fffbcf940 TRAP: 0700   Not tainted
  MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 22042482  XER: 200400ad
  CFAR: c000000000039260 IRQMASK: 3
  GPR00: c000000000039204 c000007fffbcfbe0 c000000001d6c300 0000000000000003
  GPR04: 00007ffffa45d078 0000000000000000 0000000000000008 0000000000000020
  GPR08: 0000007ffd4e0000 0000000000000000 c000007ffffceb00 7265677368657265
  GPR12: 9000000000009033 c000007ffffceb00 00000f7075bf4480 000000000000002a
  GPR16: 00000f705745a528 00007ffffa45ddd8 00000f70574d0008 0000000000000000
  GPR20: 00000f7075c58d70 00000f7057459c38 0000000000000001 0000000000000040
  GPR24: 0000000000000000 0000000000000029 c000000001dae058 0000000000000029
  GPR28: 0000000000000000 0000000000000800 0000000000000009 c000007fffbcfd60
  NIP [c000000000039534] soft_nmi_interrupt+0x3e4/0x5f0
  LR [c000000000039234] soft_nmi_interrupt+0xe4/0x5f0
  Call Trace:
  [c000007fffbcfbe0] [c000000000039204] soft_nmi_interrupt+0xb4/0x5f0 (unreliable)
  [c000007fffbcfcf0] [c00000000000c0e8] soft_nmi_common+0x138/0x1c4
  --- interrupt: 900 at end_real_trampolines+0x0/0x1000
  NIP:  c000000000003000 LR: 00007ca426adb03c CTR: 900000000280f033
  REGS: c000007fffbcfd60 TRAP: 0900
  MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44042482  XER: 200400ad
  CFAR: 00007ca426946020 IRQMASK: 0
  GPR00: 00000000000000ad 00007ffffa45d050 00007ca426b07f00 0000000000000035
  GPR04: 00007ffffa45d078 0000000000000000 0000000000000008 0000000000000020
  GPR08: 0000000000000000 0000000000100000 0000000010000000 00007ffffa45d110
  GPR12: 0000000000000001 00007ca426d4e680 00000f7075bf4480 000000000000002a
  GPR16: 00000f705745a528 00007ffffa45ddd8 00000f70574d0008 0000000000000000
  GPR20: 00000f7075c58d70 00000f7057459c38 0000000000000001 0000000000000040
  GPR24: 0000000000000000 00000f7057473f68 0000000000000003 000000000000041b
  GPR28: 00007ffffa45d4c4 0000000000000035 0000000000000000 00000f7057473f68
  NIP [c000000000003000] end_real_trampolines+0x0/0x1000
  LR [00007ca426adb03c] 0x7ca426adb03c
  --- interrupt: 900
  Instruction dump:
  60000000 60000000 60420000 38600001 482b3ae5 60000000 e93f0138 a36d0008
  7daa6b78 71290001 7f7907b4 4082fd34 <0fe00000> 4bfffd2c 60420000 ea6100a8
  ---[ end trace dc75f67d819779da ]---

Fixes: 118178e62e2e ("powerpc: move NMI entry/exit code into wrapper")
Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 44cde2e129b8..299e51337aca 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -222,6 +222,13 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !(regs->msr & MSR_PR) &&
+				regs->nip < (unsigned long)__end_interrupts) {
+		/* Kernel code running below __end_interrupts is implicitly
+		 * soft-masked */
+		regs->softe = IRQS_ALL_DISABLED;
+	}
+
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 
 	if (nmi_disables_ftrace(regs)) {
-- 
2.23.0

