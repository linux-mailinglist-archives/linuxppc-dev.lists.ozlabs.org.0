Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB21CA260
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:44:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHm02vSbzDr3h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:44:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O88fEtU3; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHY16NkKzDqwB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:29 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id q124so278494pgq.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=llJGzrIBeBpBel+keT4vSfRYbJxGrzgUBSqme/ux02M=;
 b=O88fEtU3mOIP8Jlq1BDOBRpEdazqnTxkMy/X9h/f/fdifSi52mXYuhmW5chFRYIcTx
 9reCpF3hbxkwQ9eJ/hA9B7TXNvEQ7w7QX/FizjUfLxuSe3V1+m8VoNNPisxizhQtbPT4
 2GWX3oLtYQkpdBPRET5aCjf6f3BcBtjaWPvkyZeMFK0ak9xYEkksQGhrqhSIpd8NSqVe
 Yph3Ba1To/y53iI89HDJPYDapbEJuzxq8qPBF+HLycZNOrEqKtSYyIn4u4pIeLm2wwvI
 9+OzVaBsc0iLJS/Hh+RALCizzF/br29p/QB1ihbCk7Q/iZ8D5++HbPYfuoIWvkiToqk8
 dKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=llJGzrIBeBpBel+keT4vSfRYbJxGrzgUBSqme/ux02M=;
 b=ioYDoE4/83XSkFZooxYkrZmRUSBXqBz5C+4dPDLWg/aBVwH3ecjwPcZhPsJga+u4Py
 y2+ySCSkkPGJDeOOX0RMtogGzwNLugQly5S8CPUrbVCzjw51aqKPvrr+dy6HBiX+oO4H
 Ea/J/vPl7WOGiUkc0BL2ou+4KfPZcfUKE/+Jfz00lGmGIYEb+Y3QqdCUsHroxiraHsZz
 lmR3RuHpVkcRMbUeO/M4ak2F0yM8NzTpPtHDHjuIHjIaFTf2e7wQiZOJO3ULTPDts6YL
 oOGA4r3WfiB1aTKCipzDYwKzq3OtWTmfMCmq46iI5Nv8q/QCdL5WBeYDh+xpsS3HymHN
 OLkw==
X-Gm-Message-State: AGi0PuZE59Sdqp3QmhMiqaZhYJgFcNCeHHgYA4XE2ixCOW2fP03AGFkw
 w7X+EPk3qsk7Q+MbN/VL3foALE1b
X-Google-Smtp-Source: APiQypJHDdnkuWuJXRr7LGOpmd1WF6RXisaRGIGe2iu6Y1GJRziMMe1ShuGAtE+IGnRbqHkqwcbckg==
X-Received: by 2002:a63:9259:: with SMTP id s25mr587769pgn.428.1588912466218; 
 Thu, 07 May 2020 21:34:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 04/16] powerpc/64s/exceptions: machine check reconcile irq
 state
Date: Fri,  8 May 2020 14:33:56 +1000
Message-Id: <20200508043408.886394-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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

pseries fwnmi machine check code pops the soft-irq checks in rtas_call
(after the previous patch to remove rtas_token from this call path).
Rather than play whack a mole with these and forever having fragile
code, it seems better to have the early machine check handler perform
the same kind of reconcile as the other NMI interrupts.

  WARNING: CPU: 0 PID: 493 at arch/powerpc/kernel/irq.c:343
  CPU: 0 PID: 493 Comm: a Tainted: G        W
  NIP:  c00000000001ed2c LR: c000000000042c40 CTR: 0000000000000000
  REGS: c0000001fffd38b0 TRAP: 0700   Tainted: G        W
  MSR:  8000000000021003 <SF,ME,RI,LE>  CR: 28000488  XER: 00000000
  CFAR: c00000000001ec90 IRQMASK: 0
  GPR00: c000000000043820 c0000001fffd3b40 c0000000012ba300 0000000000000000
  GPR04: 0000000048000488 0000000000000000 0000000000000000 00000000deadbeef
  GPR08: 0000000000000080 0000000000000000 0000000000000000 0000000000001001
  GPR12: 0000000000000000 c0000000014a0000 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR28: 0000000000000000 0000000000000001 c000000001360810 0000000000000000
  NIP [c00000000001ed2c] arch_local_irq_restore.part.0+0xac/0x100
  LR [c000000000042c40] unlock_rtas+0x30/0x90
  Call Trace:
  [c0000001fffd3b40] [c000000001360810] 0xc000000001360810 (unreliable)
  [c0000001fffd3b60] [c000000000043820] rtas_call+0x1c0/0x280
  [c0000001fffd3bb0] [c0000000000dc328] fwnmi_release_errinfo+0x38/0x70
  [c0000001fffd3c10] [c0000000000dcd8c] pseries_machine_check_realmode+0x1dc/0x540
  [c0000001fffd3cd0] [c00000000003fe04] machine_check_early+0x54/0x70
  [c0000001fffd3d00] [c000000000008384] machine_check_early_common+0x134/0x1f0
  --- interrupt: 200 at 0x13f1307c8
      LR = 0x7fff888b8528
  Instruction dump:
  60000000 7d2000a6 71298000 41820068 39200002 7d210164 4bffff9c 60000000
  60000000 7d2000a6 71298000 4c820020 <0fe00000> 4e800020 60000000 60000000

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a42b73efb1a9..072772803b7c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1116,11 +1116,30 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	li	r10,MSR_RI
 	mtmsrd	r10,1
 
+	/*
+	 * Set IRQS_ALL_DISABLED and save PACAIRQHAPPENED (see
+	 * system_reset_common)
+	 */
+	li	r10,IRQS_ALL_DISABLED
+	stb	r10,PACAIRQSOFTMASK(r13)
+	lbz	r10,PACAIRQHAPPENED(r13)
+	std	r10,RESULT(r1)
+	ori	r10,r10,PACA_IRQ_HARD_DIS
+	stb	r10,PACAIRQHAPPENED(r13)
+
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
 
+	/*
+	 * Restore soft mask settings.
+	 */
+	ld	r10,RESULT(r1)
+	stb	r10,PACAIRQHAPPENED(r13)
+	ld	r10,SOFTE(r1)
+	stb	r10,PACAIRQSOFTMASK(r13)
+
 #ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * Check if thread was in power saving mode. We come here when any
-- 
2.23.0

